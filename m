Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70319C48BDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 23:10:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C5AB61245
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 23:10:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C5AB61245
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6nD+eYv+4ioTS8+kIWnyBmMbZV7V3ms0qooEMxuLGH8=; b=LlzyPqcv+9JB0t
	pHXs1Rd/nF0cF9BVJlS2lLFviXzgIoCTsdgIWK8CEtMmGfLbjZ3imKFH+cEMV6Oz5doSBhuYzqPNG
	kCkvlp17uxCNt/4hbiNJpZm7CQo/uK+AfamE6MHX+ReXJ86ATSyz5XE5wcU3MEHvMNLLfpTu3nnJw
	GMgTLRCDMYiyPMDpDHdcn9nlzaS6cp2hREQnvui6/bLZMMS/EQpBuZP5JkyNJxc+dg9EinB+TjD48
	vvbfWrk8NTASbPV7gOnHI1Wu3M+BJd9LocMNC/McQJ80yddBdwy0zUedR/uiOasSpB7W+G4bAvllI
	1h7/GLOHXYzafUUiamxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltICg-003mkZ-Ru; Tue, 15 Jun 2021 23:10:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltHUJ-003XTm-Oe
 for linux-mediatek@lists.infradead.org; Tue, 15 Jun 2021 22:24:53 +0000
X-UUID: 462edb72d37b4205b61739fbe41148bc-20210615
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=x9OZOeIbpSZZ5pLaI8yn9sS69Y+KsrMRqB21zj8I4qg=; 
 b=ocFWjjxjTVxZirTJTEP1EJSQAUV91xRgARIFpLHi6lWT0hzmlNS+DICE0Z7/zdQt0bU+C7TYC9DQH9ayqoMVyf/xuR1PAFMUsikwgjJ8LtByxth8GGL3AOOwuGLVWuMjHHWhwZf2d99B/YcI7YQeXHJmFPWAGAFs6LwWdmg5GQE=;
X-UUID: 462edb72d37b4205b61739fbe41148bc-20210615
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 407940179; Tue, 15 Jun 2021 15:24:46 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Jun 2021 15:24:44 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 06:24:37 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Jun 2021 06:24:37 +0800
From: <sean.wang@mediatek.com>
To: <lorenzo.bianconi@redhat.com>
CC: <nbd@nbd.name>, <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>, <Deren.Wu@mediatek.com>,
 <km.lin@mediatek.com>, <robin.chiu@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <jemele@google.com>, <yenlinlai@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mt76: mt7921: fix kernel warning when reset on vif is not
 sta
Date: Wed, 16 Jun 2021 06:24:36 +0800
Message-ID: <1623795876-6290-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <YMkdKFpia2XqdqrX@lore-desk--annotate>
References: <YMkdKFpia2XqdqrX@lore-desk--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_152452_159058_CCAA5830 
X-CRM114-Status: GOOD (  13.25  )
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

From: Sean Wang <sean.wang@mediatek.com>

>> From: Sean Wang <sean.wang@mediatek.com>
>>
>> ieee80211_disconnect is only called for the staton mode.
>>
>> [  714.050429] WARNING: CPU: 1 PID: 382 at net/mac80211/mlme.c:2787
>> ieee80211_disconnect+0x108/0x118 [mac80211] [  714.116704] Hardware
>> name: MediaTek Asurada rev1 board (DT) [  714.122303] Workqueue: mt76
>> mt7921_mac_reset_work [mt7921e] [  714.127877] pstate: 20c00009 (nzCv
>> daif +PAN +UAO) [  714.132761] pc : ieee80211_disconnect+0x108/0x118
>> [mac80211] [  714.138430] lr : mt7921_vif_connect_iter+0x28/0x54
>> [mt7921e] [  714.144083] sp : ffffffc0107cbbd0 [  714.147394] x29:
>> ffffffc0107cbbd0 x28: ffffffb26c9cb928 [  714.152706] x27:
>> ffffffb26c9cbd98 x26: 0000000000000000 [  714.158017] x25:
>> 0000000000000003 x24: ffffffb26c9c9c38 [  714.163328] x23:
>> ffffffb26c9c9c38 x22: ffffffb26c9c8860 [  714.168639] x21:
>> ffffffb23b940000 x20: ffffffb26c9c8860 [  714.173950] x19:
>> 0000000000000001 x18: 000000000000b67e [  714.179261] x17:
>> 00000000064dd409 x16: ffffffd739cb28f0 [  714.184571] x15:
>> 0000000000000000 x14: 0000000000000227 [  714.189881] x13:
>> 0000000000000400 x12: ffffffd73a4eb060 [  714.195191] x11:
>> 0000000000000000 x10: 0000000000000000 [  714.200502] x9 :
>> ffffffd703a0a000 x8 : 0000000000000006 [  714.205812] x7 :
>> 2828282828282828 x6 : ffffffb200440396 [  714.211122] x5 :
>> 0000000000000000 x4 : 0000000000000004 [  714.216432] x3 :
>> 0000000000000000 x2 : ffffffb23b940c90 [  714.221743] x1 :
>> 0000000000000001 x0 : ffffffb23b940c90 [  714.227054] Call trace:
>> [  714.229594]  ieee80211_disconnect+0x108/0x118 [mac80211] [
>> 714.234913]  mt7921_vif_connect_iter+0x28/0x54 [mt7921e] [
>> 714.240313]  __iterate_interfaces+0xc4/0xdc [mac80211] [  714.245541]
>> ieee80211_iterate_interfaces+0x4c/0x68 [mac80211] [  714.251381]
>> mt7921_mac_reset_work+0x410/0x468 [mt7921e] [  714.256696]
>> process_one_work+0x208/0x3c8 [  714.260706]  worker_thread+0x23c/0x3e8
>> [  714.264456]  kthread+0x140/0x17c [  714.267685]
>> ret_from_fork+0x10/0x18
>>
>> Fixes: 0c1ce9884607 ("mt76: mt7921: add wifi reset support")
>> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>
>I am fine with this patch but I guess you are not using an update tree since
>mt7921 supports just sta mode so far.
>

mt7921 can support monitor mode too.

the kernel warning is reproduced when reset mt7921 running with active monitor mode.

>Regards,
>Lorenzo
>
>> ---
>>  drivers/net/wireless/mediatek/mt76/mt7921/mac.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
>> b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
>> index fb4de73df701..0a2df295596a 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
>> @@ -1269,7 +1269,8 @@ mt7921_vif_connect_iter(void *priv, u8 *mac,
>>	struct mt7921_vif *mvif = (struct mt7921_vif *)vif->drv_priv;
>>	struct mt7921_dev *dev = mvif->phy->dev;
>>
>> -	ieee80211_disconnect(vif, true);
>> +	if (vif->type == NL80211_IFTYPE_STATION)
>> +		ieee80211_disconnect(vif, true);
>>
>>	mt76_connac_mcu_uni_add_dev(&dev->mphy, vif, &mvif->sta.wcid, true);
>>	mt7921_mcu_set_tx(dev, vif);
>> --
>> 2.25.1
>>
>>
>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
