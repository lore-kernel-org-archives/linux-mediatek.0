Return-Path: <SRS0=EI02=O3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC11C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 22:58:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79FC560F9D
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 22:58:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79FC560F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=systemli.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rjxT4o9y/oYSvhKQjOkyz3x2VKdNlU8Xa1viWrSldWw=; b=vXhJR4p2jvtaQ8
	eVftWfQR075xMgYqthQpYVNZeFJ0Ad3XhkO5nBaVv/bXDtXevxkUOID4xmp2bvcYi7VHK5BepWmWi
	bAJaeW2R9KLMPoKFnA3jGlvPpeYLY/QkJOZl5rD7qxsXDnvchCGSmSn7LoGBmKo3ReMd+x6uc6RfB
	FJ5ZeJuaSuqj0Y0H/6gxweMfTaWv20p6ZcRno6xDIRBji0GPMW9pHNGk2IA7I3FA4Qw0Mt/kF6ZjL
	jpkjDphH8bPvtIaETj/Pl1MX3KiBehTRrzmHM3xI3AVID0vhzskTDB9GAOkgLgkL+MFYejbQy79IR
	ZhINP+uKYHVDY1S2KivA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYcKt-000vOI-1p; Thu, 07 Oct 2021 22:57:59 +0000
Received: from mail1.systemli.org ([2a00:c38:11e:ffff::a032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYcKg-000vMH-1y; Thu, 07 Oct 2021 22:57:47 +0000
From: Nick Hainke <vincent@systemli.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=systemli.org;
 s=default; t=1633647464;
 bh=+hKKdgFuA2J0aeNKNChnhg/KBV16OKZtTZZwb8uPqeY=;
 h=From:To:Cc:Subject:Date:From;
 b=YwryZknexn60K5FsltKWffap1HeK2F3iZLLPXf0VJ07q5AAPswNzzZZ7iVJrgpSok
 jb2JZ+7CFrUPnnJCFHm9B/z5Zho+IIu/pcN/Nq6KdmJm6+SDIdo9N+GS233YfR95oE
 tUTDRaS1U68aqtcPk2DWgDTTl47SkH2CmcR1JwIx+dU2J/yde8+07zslpi6nd+v1sw
 WBvx8a2UEuNMsW5EAExSDVdDfW0uOrNzHM4MdfMy2HxtHHk+wheJKiPSg/f+nOHfT+
 7BD0EDfyHLmUFRwtqp1ufJYrQOITkRKZ7iRHhFL1uZg9oo9fEaF90+E+13BE11jedN
 PCui8UphaEE+A==
To: nbd@nbd.name, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, sean.wang@mediatek.com, shayne.chen@mediatek.com,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Robert Foss <robert.foss@linaro.org>,
	Nick Hainke <vincent@systemli.org>
Subject: [RFC v2] mt76: mt7615: mt7622: fix ibss and meshpoint
Date: Fri,  8 Oct 2021 00:57:25 +0200
Message-Id: <20211007225725.2615-1-vincent@systemli.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_155746_269531_7F0A7AF3 
X-CRM114-Status: GOOD (  10.74  )
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

Fixes: d8d59f66d136 ("mt76: mt7615: support 16 interfaces").

commit 7f4b7920318b ("mt76: mt7615: add ibss support") introduced IBSS
and commit f4ec7fdf7f83 ("mt76: mt7615: enable support for mesh")
meshpoint support.

Both used in the "get_omac_idx"-function:

	if (~mask & BIT(HW_BSSID_0))
		return HW_BSSID_0;

With commit d8d59f66d136 ("mt76: mt7615: support 16 interfaces") the
ibss and meshpoint mode should "prefer hw bssid slot 1-3". However,
with that change the ibss or meshpoint mode will not send any beacon on
the mt7622 wifi anymore. Devices were still able to exchange data but
only if a bssid already existed. Two mt7622 devices will never be able
to communicate.

This commits reverts the preferation of slot 1-3 for ibss and
meshpoint. Only NL80211_IFTYPE_STATION will still prefer slot 1-3.

Tested on Banana Pi R64.

Signed-off-by: Nick Hainke <vincent@systemli.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index dada43d6d879..51260a669d16 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -135,8 +135,6 @@ static int get_omac_idx(enum nl80211_iftype type, u64 mask)
 	int i;
 
 	switch (type) {
-	case NL80211_IFTYPE_MESH_POINT:
-	case NL80211_IFTYPE_ADHOC:
 	case NL80211_IFTYPE_STATION:
 		/* prefer hw bssid slot 1-3 */
 		i = get_free_idx(mask, HW_BSSID_1, HW_BSSID_3);
@@ -160,6 +158,8 @@ static int get_omac_idx(enum nl80211_iftype type, u64 mask)
 			return HW_BSSID_0;
 
 		break;
+	case NL80211_IFTYPE_ADHOC:
+	case NL80211_IFTYPE_MESH_POINT:
 	case NL80211_IFTYPE_MONITOR:
 	case NL80211_IFTYPE_AP:
 		/* ap uses hw bssid 0 and ext bssid */
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
