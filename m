Return-Path: <SRS0=GVU/=5S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198F3C2BA16
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 18:19:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E277820675
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 18:19:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r++4Sw6m";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="a1rdQz4u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E277820675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ggvI05lCyBmPVd0dUa6EzYXFxdrpaJmRbRkcC1/1Lyc=; b=r++4Sw6m+23pjU
	Z3ykFSzVCZrRNwZMIcrAQvWpoGQ/e20wtiC2IVi1//wqpXGwWVxKc0GhWdfFjBcQPQdhl7Djh4BL7
	6s8atsmhyx+hZswoX3YNgTFXjX1bCi+yxdEYI3Z5zS9e/nqjFWVbpObPM1iCL2Ni2wxltWqfYRttr
	p5MjeiqJY1230y7HXGsXS7LZWvgyQ1JTvh2Wsppq73UsT4YsEyqF4fOnRR1XpRUUoSrc0dcYlmKB8
	coQS8Sltwb0iyNenT5fkQV3vscvE3HKQu1+wberT4W7hMZgMinOORA5bXqsFcfvbSo+ltnqMsePPG
	635Qs6MfMVBZP30M050w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jK4R5-0000n2-0C; Thu, 02 Apr 2020 18:19:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jK4R1-0000jV-RD
 for linux-mediatek@lists.infradead.org; Thu, 02 Apr 2020 18:19:25 +0000
Received: from localhost.localdomain.com (unknown [151.48.151.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B1277208E0;
 Thu,  2 Apr 2020 18:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585851563;
 bh=vzaViAtUmAV7N15ae5o71qDlMqQiH1rYvo2bCHDWI1s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a1rdQz4ugvkntZPua7+2sY6iIpQzVnueV5NOdnRLxICUkj5Ng2+eIpZAQ80LBWant
 aI2D7u0UkoHskaph0yFADzSj3ZgxJJCV8vUOwehrTjfN4ZeeaMCIQ6iuj4OtZJrFzJ
 QW/tKrdGGPMQbamAIj5O7klheEsOhVgTeIoY0eyw=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 6/9] mt76: mt76u: rely on mt7622 queue scheme for mt7663u
Date: Thu,  2 Apr 2020 20:18:53 +0200
Message-Id: <ea99d9b8bc10f202614c249038a707a8d7b45212.1585851049.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1585851049.git.lorenzo@kernel.org>
References: <cover.1585851049.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200402_111923_904764_439630A3 
X-CRM114-Status: GOOD (  10.23  )
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Rely on the mt7622 endpoint definitions for mt7663u

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/usb.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/usb.c b/drivers/net/wireless/mediatek/mt76/usb.c
index a981da6c35a5..fb97ea25b4d4 100644
--- a/drivers/net/wireless/mediatek/mt76/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/usb.c
@@ -1009,8 +1009,19 @@ static void mt76u_tx_kick(struct mt76_dev *dev, struct mt76_queue *q)
 
 static u8 mt76u_ac_to_hwq(struct mt76_dev *dev, u8 ac)
 {
-	if (mt76_chip(dev) == 0x7663)
-		return ac ^ 0x3;
+	if (mt76_chip(dev) == 0x7663) {
+		static const u8 wmm_queue_map[] = {
+			[IEEE80211_AC_VO] = 0,
+			[IEEE80211_AC_VI] = 1,
+			[IEEE80211_AC_BE] = 2,
+			[IEEE80211_AC_BK] = 4,
+		};
+
+		if (WARN_ON(ac >= ARRAY_SIZE(wmm_queue_map)))
+			return 2; /* BE */
+
+		return wmm_queue_map[ac];
+	}
 
 	return mt76_ac_to_hwq(ac);
 }
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
