Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D5AC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 01:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lc2/TazxozdDnvZb/b7lHdWwz27nbeuJ3CQk1i0zndI=; b=pk+Lr7kodhZsFfBDICXlmKdDsr
	9V6DTjgxtASeYr5Rd7m2gqRnPFyd0507wET8j/7WldCFtBVz22bmnkCPfyR4gnUbks53o6mweuKkq
	RJ06eYVvMkjP/q7aH77RDhx2YbR9ZmNymXmY+xRprMR7yz8kcKfyGRikchQmx3Ic2gFl3WO4ZW3T9
	0Hp/ar10OKoi1vapqLWr0/ZL/MuN5x/+ePkU6e8Z0HFZnL6XiFpBoRL1uVFiHkB2ATJw6RouwwA4t
	enx9JLfNZmbRdH3iPkIOsskMw3CxnJK1BLAZLEXSyz64vow1VoImBwyj84nv9AXcjTe3wQs6RPbEQ
	Rahabcqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi3OH-005W8e-2U;
	Fri, 31 Mar 2023 01:17:17 +0000
Received: from omta35.uswest2.a.cloudfilter.net ([35.89.44.34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi3OF-005W7h-0g;
	Fri, 31 Mar 2023 01:17:17 +0000
Received: from eig-obgw-6012a.ext.cloudfilter.net ([10.0.30.238])
	by cmsmtp with ESMTP
	id i17Gp6af1E9lPi3O7pLMWa; Fri, 31 Mar 2023 01:17:07 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTP
	id i3O6pimDmGR2hi3O6pPS0B; Fri, 31 Mar 2023 01:17:06 +0000
X-Authority-Analysis: v=2.4 cv=ZLvEJF3b c=1 sm=1 tr=0 ts=64263492
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=wTog8WU66it3cfrESHnF4A==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=IkcTkHD0fZMA:10 a=k__wU0fu6RkA:10
 a=wYkD_t78qR0A:10 a=NEAV23lmAAAA:8 a=mDV3o1hIAAAA:8 a=VwQbUJbxAAAA:8
 a=lQcIFfJ85XhUBIXePCYA:9 a=QEXdDO2ut3YA:10 a=3IOs8h2EC4YA:10
 a=_FVE-zBwftR9WsbkzFJk:22 a=AjGcO6oz07-iQ99wixmX:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=lc2/TazxozdDnvZb/b7lHdWwz27nbeuJ3CQk1i0zndI=; b=so+gIOLSJXjWDiSsnEL8KJlMhE
	y9LJZejzwGh2PreEOGl57Bttp0lH8Q/Y+0knuhUG4cclvC8vMslE92OKvDN4xlt5casFi1b6fn7Qm
	DGk3KcLdTm1kJHvcYXc5ia8zYZLk5OxDJs7X9EtjkR1umhli04I+TJy5FSTdZWe61OuK13kgwLjYs
	1edRDqmBeKAWhc+zM+RSFNvy4nsTz0Zs9XBt3afdWSaNhjeehwlTypw3sK8YTlsPxOahDtCD+HdYS
	vNrsVJI/knYLNAXwCncEjYf7K/F5kX4qDvURjbv9DXMO6Lg0x3FNB9+hC+6SR2mXtCKrk8WR235zJ
	H7mBzkpQ==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:59296 helo=[192.168.15.7])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.95)
	(envelope-from <gustavo@embeddedor.com>)
	id 1phycM-002lrn-Qy;
	Thu, 30 Mar 2023 15:11:31 -0500
Message-ID: <2f207323-9daf-e9ee-153b-d790429d0adf@embeddedor.com>
Date: Thu, 30 Mar 2023 14:11:55 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH][next] wifi: mt76: mt7921: Replace fake flex-arrays with
 flexible-array members
Content-Language: en-US
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org
References: <ZBTUB/kJYQxq/6Cj@work>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <ZBTUB/kJYQxq/6Cj@work>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1phycM-002lrn-Qy
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.7]) [187.162.31.110]:59296
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 0
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEFxku84QihPld8kGG5Vz+JJArQLY9Nc/Mqm1oCEKvS9aKygJvWt6hT7q561TgYhHnMOUfIxK1qSbiubsLvVejCdSwOLqihq1a+Ofdw3ea7uXAg762Vv
 VpScEk9Ixxt1v0hSXUO+mx5aPVziLyj5gtJ7erDDNQyKzuv2/69j8qgiH+a79A9dmQBdsy0j4Xu+Ry7UEWo8Va/STl6nInWr5TPu0P46HQn5AC35t/GYRkjG
 nEs12ljbGTl1PVtXJExu9InuGwf2yexKSi7XbX8zzhuDXGBOwKJziBJO9kj506DW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_181715_394941_40CE61B3 
X-CRM114-Status: GOOD (  12.17  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi all,

Friendly ping: who can take this, please? 😄

Thanks
-- 
Gustavo

On 3/17/23 14:56, Gustavo A. R. Silva wrote:
> Zero-length arrays as fake flexible arrays are deprecated and we are
> moving towards adopting C99 flexible-array members instead.
> 
> Address the following warnings found with GCC-13 and
> -fstrict-flex-arrays=3 enabled:
> drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.c:266:25: warning: array subscript 0 is outside array bounds of ‘struct mt7921_asar_dyn_limit_v2[0]’ [-Warray-bounds=]
> drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.c:263:25: warning: array subscript 0 is outside array bounds of ‘struct mt7921_asar_dyn_limit[0]’ [-Warray-bounds=]
> drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.c:223:28: warning: array subscript <unknown> is outside array bounds of ‘struct mt7921_asar_geo_limit_v2[0]’ [-Warray-bounds=]
> drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.c:220:28: warning: array subscript <unknown> is outside array bounds of ‘struct mt7921_asar_geo_limit[0]’ [-Warray-bounds=]
> drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.c:334:37: warning: array subscript i is outside array bounds of ‘u8[0]’ {aka ‘unsigned char[]’} [-Warray-bounds=]
> 
> Notice that the DECLARE_FLEX_ARRAY() helper allows for flexible-array
> members in unions.
> 
> This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> routines on memcpy() and help us make progress towards globally
> enabling -fstrict-flex-arrays=3 [1].
> 
> Link: https://github.com/KSPP/linux/issues/21
> Link: https://github.com/KSPP/linux/issues/272
> Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [1]
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>   drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.h | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.h b/drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.h
> index 35268b0890ad..6f2c4a572572 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/acpi_sar.h
> @@ -24,7 +24,7 @@ struct mt7921_asar_dyn {
>   	u8 names[4];
>   	u8 enable;
>   	u8 nr_tbl;
> -	struct mt7921_asar_dyn_limit tbl[0];
> +	DECLARE_FLEX_ARRAY(struct mt7921_asar_dyn_limit, tbl);
>   } __packed;
>   
>   struct mt7921_asar_dyn_limit_v2 {
> @@ -37,7 +37,7 @@ struct mt7921_asar_dyn_v2 {
>   	u8 enable;
>   	u8 rsvd;
>   	u8 nr_tbl;
> -	struct mt7921_asar_dyn_limit_v2 tbl[0];
> +	DECLARE_FLEX_ARRAY(struct mt7921_asar_dyn_limit_v2, tbl);
>   } __packed;
>   
>   struct mt7921_asar_geo_band {
> @@ -55,7 +55,7 @@ struct mt7921_asar_geo {
>   	u8 names[4];
>   	u8 version;
>   	u8 nr_tbl;
> -	struct mt7921_asar_geo_limit tbl[0];
> +	DECLARE_FLEX_ARRAY(struct mt7921_asar_geo_limit, tbl);
>   } __packed;
>   
>   struct mt7921_asar_geo_limit_v2 {
> @@ -69,7 +69,7 @@ struct mt7921_asar_geo_v2 {
>   	u8 version;
>   	u8 rsvd;
>   	u8 nr_tbl;
> -	struct mt7921_asar_geo_limit_v2 tbl[0];
> +	DECLARE_FLEX_ARRAY(struct mt7921_asar_geo_limit_v2, tbl);
>   } __packed;
>   
>   struct mt7921_asar_cl {
> @@ -85,7 +85,7 @@ struct mt7921_asar_fg {
>   	u8 rsvd;
>   	u8 nr_flag;
>   	u8 rsvd1;
> -	u8 flag[0];
> +	u8 flag[];
>   } __packed;
>   
>   struct mt7921_acpi_sar {

