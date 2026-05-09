Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC4DCD3447
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 May 2026 08:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KM+PhIlgwvO1UsKJY62GfJBC621wDFP9y6GILYNBU7s=; b=vUquEerasvCLDckAnFqYxPKaFL
	noIKDfmhfWkXaHQr8ryrArJ7DIMquWjRNJFihRXJA0kvy2hvajG4H8QU2uKPSA/wKt2cIpXhxcf3F
	xhohVn9JRrQrmKHfKP+Ai9RTQkvpcMmzfyt9oK0uvuV0WUO+PfVSXKOaMHCwSFSvgBGtsTVPdROyY
	WaJI0WMJPMZ8tFLrrDgiat6/g122xpROfhKDW1sCIgCy8hhgYW1SmsruC9h5Rumyi1bFaS3NABQ+6
	IRvcsNRTEJ8ZO0ca2cVoJxJscFThKqFNbsTGjPoHRHDO3U3DTmi195LgaR/C8vE+xaiONRkdyHX56
	frE0TDug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLcym-00000008ZPN-3cM4;
	Sat, 09 May 2026 08:24:08 +0000
Received: from spe9-1.ucebox.co.za ([197.242.159.189])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLcyi-00000008ZO5-3Die
	for linux-mediatek@lists.infradead.org;
	Sat, 09 May 2026 08:24:06 +0000
Received: from zulu.aserv.co.za ([154.0.174.187])
	by spe11.ucebox.co.za with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <developer@hlope.org.za>)
	id 1wLcu0-004eq2-Uz; Sat, 09 May 2026 10:23:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=hlope.org.za; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KM+PhIlgwvO1UsKJY62GfJBC621wDFP9y6GILYNBU7s=; b=TvM5nuSBhM88Qwk6sJX4AUSRFN
	mcGwaE74fNKGnNGos8iiQPZe3HxGBi2VmcBYiBlh5Ohj1K4scEDjqa52ma8Qw+IQAooIV16ielEPI
	rCUkijJN17Y/ud+55lytAwOkjiT7+O5hoBSnj4BKJ4DezQJhYMgpY82hgm5En3I6mAITXcUVo5jiz
	ITg3Zi2EqMuXPDlbjEZZnyhRNIHiWWhNB4uKRD3f5D0RIPwYFTPu0iUBJoAIwG/UM5cntbMW3vMCq
	Rb4fBiUZP2LZid9CZYWL8E2LhcEMHAJL6HBahKkuIb2vD/Uf55MrHZ2+NyaGYVYrArr4/BmXflmuL
	vv/Pw1hg==;
Received: from vc-vb-41-1-137-10.umts.vodacom.co.za ([41.1.137.10]:35008 helo=bongani-mini.home.org.za)
	by zulu.aserv.co.za with essmtpa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <developer@hlope.org.za>)
	id 1wLcy1-00000002Iq7-2DWu;
	Sat, 09 May 2026 10:23:21 +0200
Date: Sat, 9 May 2026 10:23:19 +0200
From: Bongani Hlope <developer@hlope.org.za>
To: Sean Wang <sean.wang@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, Sean
 Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH] wifi: mt76: mt792x: fix NULL dereference during CSA
 beacon handling
Message-ID: <20260509102319.43c14125@bongani-mini.home.org.za>
In-Reply-To: <20260503004613.17903-1-sean.wang@kernel.org>
References: <20260503004613.17903-1-sean.wang@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Get-Message-Sender-Via: zulu.aserv.co.za: authenticated_id: developer@hlope.org.za
X-Authenticated-Sender: zulu.aserv.co.za: developer@hlope.org.za
X-Originating-IP: 154.0.174.187
X-Afrihost-Domain: zulu.aserv.co.za
X-Afrihost-Username: 154.0.174.187
Authentication-Results: ucebox.co.za; auth=pass smtp.auth=154.0.174.187@zulu.aserv.co.za
X-Afrihost-Outgoing-Class: ham
X-Afrihost-Outgoing-Evidence: SB/global_tokens (0.00134300060253)
X-Recommended-Action: accept
X-Filter-ID: 9kzQTOBWQUFZTohSKvQbgI7ZDo5ubYELi59AwcWUnuWttwhTDfbOFm1IrTV+N0tt5W8I8I5o/07Q
 djfeDWgbhyu2SmbhJN1U9FKs8X3+Nt1zK+WV213mG9v1wBG3CJSJghHNKUD0bxViKcuMBmKJGtCI
 EVI9LzXDA1Xh+DPG4pIRM0tjkoPC0oPEvsMNWBXdk31k9aIIh+zJRA1xOJoRUKPGxjczx15onleF
 Kw2Xyyt6ZP2tC/xa8XrsQTYQrzShFpLBrlhgaheoKeMzRkq15aAsLnBQySPkxRUcL6SRMtkAGpRG
 q7O/mMOjYzEVVhqKzO11BRKqT8B4uLrn7iz8ujemlCquzrJ0YZ1VzniO/xNwFnDSg8Na/uzow/Qd
 /TXu3FtekKBuIoGwD4N2LqZrB81WEz3zuqka4Leqo6VkfdEs9H9vRWZELOiK/O0f2DQLszMSIo1O
 FBBNLYHJjrLx7KD+PcKoiyuHYH027/azHsfyF0j07IuLxHAIhMOSKZ8SXPwDOp0XzVcbaKehNrQC
 lyWECWLQqrwwfOypInY7IE4WqyvWaJHVy0dAJPh1agO+W712/S7qYELcBqskFxaN0IK3H3zddGMG
 ENsySGnKddaNyIe8PyhXeURjgDQvgYtvI3imOCD2AcAqzAUqPiQ+vsS4KCvAQlb64nmNydRDntbP
 WdUomhZ6E4lig4P8DOupvCrJPmnnTHzVkpybMK7ZTQU1FjzOY34M4LJ5dj1U5QyziKIm/RF17S5j
 mZvsrbOk5ELSSdBCZ+Th+/7SXdAc1ioAdl/0YclQj65KFqyldCtoh9VoIekQHpwUfpYnEThmL9mh
 N2sn9+cD9nPx2dLCkiB0zjmVxLBXMwzcQyZ7VrYMoghy8rP7ZskpYo0tCvJdhNHL4hwDAmUJZftc
 /qh2BVCQMm9F7O0YHLH+UPatjf1O+Mr36p/04lq7E2PTupJG5wvZFPBM8z1lzyXsCKUbkUYxAR1g
 dzpfCT8MW3+36Tt6QlFXnpAsrR1nIklsIaLGO3WRj39GEtKMyPBWDu+J2o+4/pO6PSl14xj6c8yM
 qw/uUkAZolzVpVG7k+diMar4p8r4UU10Bm5re8g+XyEpvJ3iGKWnonO9OJmckd63zPaLkuXizJSN
 HcvSgL08BiJQP2BxhnbeXg/cmvNZLyNaHzJB4EN9jDRWx0Y3AfLsh+PBDQgjxYblsNqNdMJKP021
 Q7gXso7XeulA+cWxJX+boA5kTebrYQ7/3TrJAF4KqX0=
X-Report-Abuse-To: spam@spe1.ucebox.co.za
X-Complaints-To: abuse@spe1.ucebox.co.za
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_012404_946615_BFBACFF7 
X-CRM114-Status: GOOD (  15.44  )
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

Sorry I had some down time on my mail server. I can confirm this patch
works for me, I have been running with it since you sent it through.

Regards

On Sat,  2 May 2026 19:46:13 -0500
Sean Wang <sean.wang@kernel.org> wrote:

> From: Sean Wang <sean.wang@mediatek.com>
> 
> mac80211 may call channel_switch_rx_beacon() while CSA is active, but
> mt76's cached dev->new_ctx is not guaranteed to be valid at that
> point.
> 
> Avoid dereferencing dev->new_ctx when the target channel context is
> not available and leave the existing CSA timer unchanged.
> 
> kernel: Workqueue: events_unbound cfg80211_wiphy_work [cfg80211]
> kernel: RIP: 0010:mt7921_channel_switch_rx_beacon+0x1f/0x100
> [mt7921_common]
> kernel: RAX: 0000000000000000
> kernel: CR2: 0000000000000000
> kernel: Call Trace:
> kernel:  <TASK>
> kernel:  ieee80211_sta_process_chanswitch+0x67c/0xee0 [mac80211]
> kernel:  ieee80211_rx_mgmt_beacon+0x842/0x22a0 [mac80211]
> kernel:  ieee80211_sta_rx_queued_mgmt+0xa7/0xbb0 [mac80211]
> kernel:  ieee80211_iface_work+0x62e/0x890 [mac80211]
> kernel:  cfg80211_wiphy_work+0x1ee/0x280 [cfg80211]
> kernel:  process_scheduled_works+0x180/0x680
> kernel:  worker_thread+0x1aa/0x450
> kernel:  kthread+0x181/0x1e0
> kernel:  ret_from_fork+0x405/0x600
> kernel:  ret_from_fork_asm+0x11/0x20
> kernel:  </TASK>
> kernel: CR2: 0000000000000000
> kernel: ---[ end trace 0000000000000000 ]---
> 
> mt7925 has the same unsafe dev->new_ctx dereference in its CSA beacon
> handling path, so guard both drivers against the missing target
> channel context and leave the existing CSA timer unchanged.
> 
> Reported-by: Bongani Hlope <developer@hlope.org.za>
> Closes:
> https://lore.kernel.org/linux-wireless/20260502140616.7672da98@bongani-mini.home.org.za/
> Fixes: 8aa2f59260eb ("wifi: mt76: mt7921: introduce CSA support")
> Fixes: 7900da40e315 ("wifi: mt76: mt7925: introduce CSA support in
> non-MLO mode") Signed-off-by: Sean Wang <sean.wang@mediatek.com> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/main.c | 3 +++
>  drivers/net/wireless/mediatek/mt76/mt7925/main.c | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> b/drivers/net/wireless/mediatek/mt76/mt7921/main.c index
> 3d74fabe7408..a326f4c95c7c 100644 ---
> a/drivers/net/wireless/mediatek/mt76/mt7921/main.c +++
> b/drivers/net/wireless/mediatek/mt76/mt7921/main.c @@ -1508,6 +1508,9
> @@ static void mt7921_channel_switch_rx_beacon(struct ieee80211_hw
> *hw, struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
> u16 beacon_interval = vif->bss_conf.beacon_int; 
> +	if (!dev->new_ctx)
> +		return;
> +
>  	if (cfg80211_chandef_identical(&chsw->chandef,
>  				       &dev->new_ctx->def) &&
>  				       chsw->count) {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> b/drivers/net/wireless/mediatek/mt76/mt7925/main.c index
> 73d3722739d0..b96a8e2efcbc 100644 ---
> a/drivers/net/wireless/mediatek/mt76/mt7925/main.c +++
> b/drivers/net/wireless/mediatek/mt76/mt7925/main.c @@ -2402,6 +2402,9
> @@ static void mt7925_channel_switch_rx_beacon(struct ieee80211_hw
> *hw, beacon_interval = vif->bss_conf.beacon_int;
>  
> +	if (!dev->new_ctx)
> +		return;
> +
>  	if (cfg80211_chandef_identical(&chsw->chandef,
>  				       &dev->new_ctx->def) &&
>  				       chsw->count) {


