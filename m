Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5629C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Dec 2022 12:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLAYh7J7MCcQ9Zr2D9WTagKED7WM0Gt1qiQUujmF1YA=; b=v9uRRIS71jJv4S0CqifdV+Iqja
	nSMkKbBv2u/M6QpZXaLU7lqgbW+bZDSvezL1fekLBxZSfaINlXE51Yu+q7Tz1Mk4so+1bO5xn3ir0
	Xpi5TB1eWmHH3PzcgEjihtQ624kdWpjiC9ycVE633L/1LA6PvkePYyzxe9I/OAG8/mHY2JaYffbvx
	xiviMuffqVBZca+estEQHv/oTTzJg8DngZ7a0qaotvUSicOZ9Uxy27qEeINdNzfArLurIUx2BiiUd
	UI6q84qazIvVQmABJvAl/Pr87xJaQrSdEF/xZ7SEP1o8fMnQk+cICqGCy8y6O5bxet7B5jtI+m4qK
	tcozVhmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3cYY-007Xvb-1O; Fri, 09 Dec 2022 12:32:46 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3cYV-007Xsq-7H
	for linux-mediatek@lists.infradead.org; Fri, 09 Dec 2022 12:32:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=zLAYh7J7MCcQ9Zr2D9WTagKED7WM0Gt1qiQUujmF1YA=; b=TwWqTrXdFcacPSiy24umCeOiF6
	esL/SyPs6YIdxKb7yFzj91N0p7c60NdAD3U6YwRdBl7pHh5ndUkZN2EtE2ohaQKnyPFHe1vr+ooxi
	zYvtJylNmnNMMi56AtlcqIfo4BbwJ+cjY2P55ej1d14azZNoNgGNHpok7xMWxbPomnFg=;
Received: from p200300daa7161301844ecc957173cc8d.dip0.t-ipconnect.de ([2003:da:a716:1301:844e:cc95:7173:cc8d] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1p3cYC-007P8o-OS; Fri, 09 Dec 2022 13:32:24 +0100
Message-ID: <c4f01e3e-4ae6-3d60-4fd0-b8d8bc5f4573@nbd.name>
Date: Fri, 9 Dec 2022 13:32:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH,v2] wifi: mt76: mt7915: add wds support when wed is
 enabled
Content-Language: en-US
To: Sujuan Chen <sujuan.chen@mediatek.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Bo Jiao <bo.jiao@mediatek.com>,
 Haitao Shang <haitao.shang@mediatek.com>, linux-mediatek@lists.infradead.org
References: <e603722d58079af98c57a3dc117274d824d1d832.1669798063.git.sujuan.chen@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <e603722d58079af98c57a3dc117274d824d1d832.1669798063.git.sujuan.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_043243_398041_B6B7F654 
X-CRM114-Status: GOOD (  19.33  )
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

On 30.11.22 10:18, Sujuan Chen wrote:
> The current WED only supports 256 wcid, whereas mt7986 can support up to 512 entries,
> so firmware provides a rule to get sta_info by DA when wcid is set to 0x3ff by txd.
> Also, WED provides a register to overwrite txd wcid, that is, wcid[9:8] can
> be overwritten by 0x3 and wcid[7:0] is set to 0xff by host driver.
> 
> However, firmware is unable to get sta_info from DA as DA != RA for 4addr cases,
> so firmware and wifi host driver both use wcid (256 - 271) and (768 ~ 783)
> for sync up to get correct sta_info
> 
> Tested-by: Sujuan Chen <sujuan.chen@mediatek.com>
> Co-developed-by: Bo Jiao <bo.jiao@mediatek.com>
> Signed-off-by: Bo Jiao <bo.jiao@mediatek.com>
> Signed-off-by: Sujuan Chen <sujuan.chen@mediatek.com>
> ---
> v2:
>   - drop duplicate settings
>   - reduce the patch size by redefining mt76_wcid_alloc
> ---
>   drivers/net/wireless/mediatek/mt76/mt76.h     |  6 +++
>   .../net/wireless/mediatek/mt76/mt7915/main.c  | 24 +++++++++--
>   .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 13 +++++-
>   .../net/wireless/mediatek/mt76/mt7915/mcu.h   |  1 +
>   drivers/net/wireless/mediatek/mt76/util.c     | 40 +++++++++++++++++--
>   drivers/net/wireless/mediatek/mt76/util.h     |  7 +++-
>   6 files changed, 82 insertions(+), 9 deletions(-)
> 

> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
> index c40b6098f19a..46a9e4f0396e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
> @@ -1115,6 +1122,13 @@ static void mt7915_sta_set_4addr(struct ieee80211_hw *hw,
>   	else
>   		clear_bit(MT_WCID_FLAG_4ADDR, &msta->wcid.flags);
>   
> +	if (mtk_wed_device_active(&dev->mt76.mmio.wed) &&
> +	    !is_mt7915(&dev->mt76)) {
> +		mt7915_sta_remove(hw, vif, sta);
> +		mt76_sta_pre_rcu_remove(hw, vif, sta);
> +		mt7915_sta_add(hw, vif, sta);
> +	}
> +
>   	mt76_connac_mcu_wtbl_update_hdr_trans(&dev->mt76, vif, sta);
>   }
>   
I suspect that this may a bit racy if there is concurrent tx activity 
(e.g. for EAP auth). Not sure if this could cause problems for the 
firmware or other kinds of bugs.

While my idea may need some rework of the existing functions, I think a 
better flow would be:

1. mt76_sta_pre_rcu_remove
2. save old wcid
3. mt7915_sta_add
4. synchronize_rcu()
5. remove firmware state for old wcid entry

- Felix

