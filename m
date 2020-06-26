Return-Path: <SRS0=tuDC=AH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA94BC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 21:25:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4032520C09
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 21:25:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dAIonYlE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YcQyibhh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4032520C09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qOGVmqqYaz6In2qljIsQ73y+E6KTrMxgbjZGKrIobZs=; b=dAIonYlEYL/rDUEwxx6zy06kX
	GVX4iZoihqbGAO9YjCR3fhNJHINcpuQV/0zhCPLcLvzgqFTzfCk2kdwcTIXxprWlFAej4W0phodAM
	X18GSdOblOU8gQwvNvwgCzeNJoUQHnjShlfLjSQvEArmhW6NcoSY8R1abXskGrHc4vlEdY8NvkU4i
	KGdxGbfSed3QBeZrjLD1ilh8rEO1Dn1Jhyztpr9g/Xpt95zfANrc4ARa8OPqjhiTSmdUR55QT6Snd
	iZ/9UqFvHJbd05n3Bla1ohw+1u+ExKZjBFBOr8ccUfpZJUz6cOJcJelMgErFQwS0zsa9yMiTCKNo3
	IGciFAXVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jovr6-00022t-60; Fri, 26 Jun 2020 21:25:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jovr3-000214-CK
 for linux-mediatek@lists.infradead.org; Fri, 26 Jun 2020 21:25:50 +0000
Received: from localhost.localdomain.com (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6D83C20B80;
 Fri, 26 Jun 2020 21:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593206748;
 bh=2n1luI8nOWCvmeK0cEw3Jtt5EYRmeEUpHVaPjeTZsAI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YcQyibhhfyRpkgAW/l4Z1GwDJwchAo5ogZMF1lo4exPBMvr+dFfB4S/wiGolfjH4U
 g6TP8iom31GJYRmfwafI+u7jPYu+uVrbY8zuYvZxWn9Q7T5GyvueDvjHraAOeTfG/v
 v5t50NgMm3pBvbuseqiCmVYQy7QTa90L2SSvk/ic=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 09/17] mt76: mt7615: acquire driver_own before configuring
 device for suspend
Date: Fri, 26 Jun 2020 23:25:09 +0200
Message-Id: <ed2e49891faa11b1726541618b4740cc5e4fd1e8.1593204577.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593204577.git.lorenzo@kernel.org>
References: <cover.1593204577.git.lorenzo@kernel.org>
MIME-Version: 1.0
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

Make sure to wake the device in mt7615_pci_suspend in order to properly
configure device registers before suspend

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/pci.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci.c
index ba12f199bce0..2328d78e06a1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci.c
@@ -75,6 +75,10 @@ static int mt7615_pci_suspend(struct pci_dev *pdev, pm_message_t state)
 	bool hif_suspend;
 	int i, err;
 
+	err = mt7615_pm_wake(dev);
+	if (err < 0)
+		return err;
+
 	hif_suspend = !test_bit(MT76_STATE_SUSPEND, &dev->mphy.state) &&
 		      mt7615_firmware_offload(dev);
 	if (hif_suspend) {
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
