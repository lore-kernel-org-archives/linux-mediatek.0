Return-Path: <SRS0=7QZl=7W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED97C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 15:42:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83FB42074B
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 15:42:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ds8M8+CU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pX3sRh7G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83FB42074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T1GI1p55hDEhHMOvO8YVXTHHsMoZJifAj2qFmIOY8/4=; b=ds8M8+CUCS7wpw
	K+dE1mkZL1giyKihwUulbU979HQTX2Og3QTUbEzbmkB4PmxAclV3Kprb6Cz0J7+G/o/5kgIRjSLDJ
	T0DksREyLAIRC1qufNhF/Y3rGskvZyrGoJkF1QnBcGuy3gxGCPCY2rlcJnakrqf8v9CcLvFMxVeTj
	JifDaoQkDCsFrzlXkRMCZZQ4nUVSnCm0VtrTYH2pEYsTWYUsiq2Fcs3pIf4hPup7QDYYpdh4DzuN8
	F996Ezb04tWq37WDSK2RPQug+2RQU3x21lcJsON2X0mA86ETWXPEmsCyHyHcpbiPpXouJqYrv0Lik
	/Qr9gJyZIM1xWGR9W5Dg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jigOW-0005CZ-Tp; Tue, 09 Jun 2020 15:42:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jigOT-00058e-IH
 for linux-mediatek@lists.infradead.org; Tue, 09 Jun 2020 15:42:30 +0000
X-UUID: 5401b6a5368c47938c364035d75438a1-20200609
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=FaqckNT5+HtjSY6/rvoPe2BiCCGh3bWGAkSGRDWsxjU=; 
 b=pX3sRh7GIIWlMfVYlBb5wSG725cLFp3+Od576Lo31c4Vn6ag+1Whj35NlgK7QLfp6AWOv3f35jhJF33sQ8IrlvGAlqCJDy5v0+dyDj1PvqKXzDlf/FprBGQ6eSS075YIiIMvtTWzTxrUqVoSxBC7tFNaTp5kT+Z9WkjUKDIm30E=;
X-UUID: 5401b6a5368c47938c364035d75438a1-20200609
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2030400329; Tue, 09 Jun 2020 07:42:30 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Jun 2020 08:42:21 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Jun 2020 23:42:19 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 9 Jun 2020 23:42:19 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH] mt76: mt7615: fix up typo in Kconfig for MT7663U
Date: Tue, 9 Jun 2020 23:42:21 +0800
Message-ID: <4714529e2d7d557b6ac8dedb66a59101b3ca7a4b.1591716798.git.sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_084229_657877_27D8E058 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

Fix up typo in Kconfig with indicating MT7663U is an 802.11ac device

Fixes: eb99cc95c3b6 ("mt76: mt7615: introduce mt7663u support")
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig b/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig
index e25db1135eda..c094260b0f89 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig
@@ -35,6 +35,6 @@ config MT7663U
 	depends on MAC80211
 	depends on USB
 	help
-	  This adds support for MT7663U 802.11ax 2x2:2 wireless devices.
+	  This adds support for MT7663U 802.11ac 2x2:2 wireless devices.
 
 	  To compile this driver as a module, choose M here.
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
