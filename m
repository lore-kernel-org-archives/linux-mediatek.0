Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EA9C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Feb 2022 19:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eqr97V4p2e6dRf6WncjY5qrO8wyKJ8U6ziFaPxg7Lxc=; b=VZJNOx+JQPfPhm
	bjtsosxwHtTJ3Wx4c7kdF1g3xQFO2wPnaqHzF4ob0sdNg+33sPpdZSJMfPYoIdmHd/kIiVFGnllrl
	uRebQ5cDPMPAxN0fU9lLKu8MwHVqR1w2aolIH2gQfCxLza1AoeYy8coten7mSuXkv+KxdM03s8BlF
	djIW1SuWcuS/8apv03dbx8cIQztwR72XGateHR+Wq7bYZif5uOZuLakXZvdRRILJtYs2lnCZF+2sl
	Oc+syFJw4LxAsH0WMqsa6lVgPxyVgyZVYdn4i+2RQVPnZI7onV7tBy2KCzfCmc3sdSumvWIwDLdf3
	laWqxz3u8PpIxxm4v6Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIxps-00AOrc-2s; Sat, 12 Feb 2022 19:13:32 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]
 helo=sipsolutions.net)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIxpp-00AOrA-5r
 for linux-mediatek@lists.infradead.org; Sat, 12 Feb 2022 19:13:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=fSnhDYupsK3DS8l/G7Y+JvdXSMW1Dg/GIo0vkfVGo+g=; 
 t=1644693206; x=1645902806; b=GxA6FcuQDoce6IsVHpPQk6Hu2H+C1FuroZVhct7UnRHq9s+
 x8cZLJzrDe+K3lIkpjHaaMVdxo1KS8BX/jMdlBBC0bRYm8W5cgfAY5bSWAWL9u7WbhIhOz1b2EEPd
 p62PPJ60Aff/Yt/zBIYF9euvTNm2ZwFxyExq5GYgzFsR36Zkh/+89RfaQ5HOPLT/wIB9giAC412cX
 75/1ru0xXIl91JQwdHJsRwFkgm3Yi0pMnxNIFmap6PNHWL/n9IYKGa8amm3O268rOVBRO29CUjZyk
 FwwAIxDu1aP1vUdLtFbviX8jmvp9FjlrG97xBaleItD+2Ln/cfq52/uxD+1amvKQ==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1nIxpW-000LLt-73; Sat, 12 Feb 2022 20:13:10 +0100
Message-ID: <0d074b586c41975cb2ce59feb85ac7c91ca5b5c8.camel@sipsolutions.net>
Subject: Re: [PATCH] mac80211: fix EAPoL rekey fail in 802.3 rx path
From: Johannes Berg <johannes@sipsolutions.net>
To: Deren Wu <Deren.Wu@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>,  Sean Wang <sean.wang@mediatek.com>, Soul
 Huang <Soul.Huang@mediatek.com>, YN Chen <YN.Chen@mediatek.com>,  Leon Yen
 <Leon.Yen@mediatek.com>, Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin
 <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
 <ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang
 <Eric.Liang@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>, Evelyn
 Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, Shayne
 Chen <shayne.chen@mediatek.com>, linux-wireless
 <linux-wireless@vger.kernel.org>,  linux-mediatek
 <linux-mediatek@lists.infradead.org>
Date: Sat, 12 Feb 2022 20:13:07 +0100
In-Reply-To: <6889c9fced5859ebb088564035f84fd0fa792a49.1644680751.git.deren.wu@mediatek.com>
References: <6889c9fced5859ebb088564035f84fd0fa792a49.1644680751.git.deren.wu@mediatek.com>
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220212_111329_421596_E1A492E4 
X-CRM114-Status: GOOD (  19.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 2022-02-13 at 00:20 +0800, Deren Wu wrote:
> From: Deren Wu <deren.wu@mediatek.com>
> 
> mac80211 set capability NL80211_EXT_FEATURE_CONTROL_PORT_OVER_NL80211
> to upper layer by default. That means we should pass EAPoL packets through
> nl80211 path only, and should not send the EAPoL skb to netdevice diretly.
> At the meanwhile, wpa_supplicant would not regist sock to listen EAPoL skb
> on the netdevice.
> 
> However, there is no contorl_port_protocol handler in mac80211 for 802.3 RX
> packets, mac80211 driver would pass up the EAPoL rekey frame to netdevice
> and wpa_supplicant would be never interactive with this kind of packets,
> if SUPPORTS_RX_DECAP_OFFLOAD is enabled. This causes STA always rekey fail
> if EAPoL frame go through 802.3 path.
> 
> To avoid this problem, align the same process as 802.11 type to handle
> this frame before put it into network stack.
> 
> Fixes: 80a915ec4427 ("mac80211: add rx decapsulation offload support")
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> ---
>  net/mac80211/rx.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
> index 0544563ede52..57f5d5500282 100644
> --- a/net/mac80211/rx.c
> +++ b/net/mac80211/rx.c
> @@ -4509,12 +4509,7 @@ static void ieee80211_rx_8023(struct ieee80211_rx_data *rx,
>  
>  	/* deliver to local stack */
>  	skb->protocol = eth_type_trans(skb, fast_rx->dev);
> -	memset(skb->cb, 0, sizeof(skb->cb));
> -	if (rx->list)
> -		list_add_tail(&skb->list, rx->list);
> -	else
> -		netif_receive_skb(skb);
> -
> +	ieee80211_deliver_skb_to_local_stack(skb, rx);
>  }

This looks like a really good idea even for the security fix in
ieee80211_deliver_skb_to_local_stack() ... :)

johannes

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
