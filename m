Return-Path: <SRS0=eXAR=6E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EBAEC55181
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2020 20:41:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7984206E9
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2020 20:41:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y0pazg2T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mZGpqWAj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7984206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RuGx4Smr6kpYGag7chxBPH5K2sC09WxKA1iDPyYWJtA=; b=Y0pazg2TVALe02
	N0pLltLaDrSmzxoIsq6t90pMoG/pxBAfZVqgN6UXIIbZsg4LG6+8lyYBb8/aZgF7y8w0irQ592/KO
	/alEDoFu9ZGleRY2PGIr9kaVl/+yHfUUtmLlDpcs4jG6aCQM3JoeYhPHfaln+VApNbX1tK8eI54z4
	CxCnnrdkIjdEQMExqkTUK8/n7L/2wobnC+3+mxC53GmWdMq9ab9Az2TmaaTCDwOSV8wQkHseVIE/v
	zU6M8lSusO+6kCjU6gA5NgBJ/4Z1TZkm9ptP+kRFULirbvkqICkpePhvtDH4vysdjVLW6ck8rUOS4
	rR68dQRhHBRV2bkoRrhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQdE5-0006VP-Hk; Mon, 20 Apr 2020 20:41:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQdE3-0006U7-0V
 for linux-mediatek@lists.infradead.org; Mon, 20 Apr 2020 20:41:08 +0000
Received: from localhost.localdomain.com (unknown [151.48.159.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E476920782;
 Mon, 20 Apr 2020 20:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587415266;
 bh=GLxEuUpZmPKLyF7Fii7QgCUvp5vaU8CMWydqEtmidRg=;
 h=From:To:Cc:Subject:Date:From;
 b=mZGpqWAjNORBSQX+UZhS2xAHYaW6sa2pF8ghKvGRoP4RSH/hGuqFPduVMlJ5qZ6y/
 t9SkQQOuCUOoBSJxW8mbeDEY6cN4wMNDURFkJLocL2VasZQKjo0EW6mopmTbpuzIoV
 xVwgKOP1yhcYjWeXCnNCnehNV75Y9Id1fQ+oox4c=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH] mt76: mt7615: fix mt7615_driver_own routine
Date: Mon, 20 Apr 2020 22:40:55 +0200
Message-Id: <f2010f464d9927ecb1e43c727f50de968f714a6a.1587414726.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_134107_074124_99FB8538 
X-CRM114-Status: UNSURE (   9.56  )
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
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce MT_PCIE_DOORBELL_PUSH register to fix mt7615_driver_own
routine for mt7663e

Fixes: f40ac0f3d3c0 ("mt76: mt7615: introduce mt7663e support")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt7615/mcu.c  | 6 +++++-
 drivers/net/wireless/mediatek/mt76/mt7615/regs.h | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 7081bc4723ee..b3cc04ce84be 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1686,16 +1686,20 @@ static void mt7622_trigger_hif_int(struct mt7615_dev *dev, bool en)
 
 static int mt7615_driver_own(struct mt7615_dev *dev)
 {
+	struct mt76_dev *mdev = &dev->mt76;
 	u32 addr;
 
-	addr = is_mt7663(&dev->mt76) ? MT_CONN_HIF_ON_LPCTL : MT_CFG_LPCR_HOST;
+	addr = is_mt7663(mdev) ? MT_PCIE_DOORBELL_PUSH : MT_CFG_LPCR_HOST;
 	mt76_wr(dev, addr, MT_CFG_LPCR_HOST_DRV_OWN);
 
 	mt7622_trigger_hif_int(dev, true);
+
+	addr = is_mt7663(mdev) ? MT_CONN_HIF_ON_LPCTL : MT_CFG_LPCR_HOST;
 	if (!mt76_poll_msec(dev, addr, MT_CFG_LPCR_HOST_FW_OWN, 0, 3000)) {
 		dev_err(dev->mt76.dev, "Timeout for driver own\n");
 		return -EIO;
 	}
+
 	mt7622_trigger_hif_int(dev, false);
 
 	return 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
index ab3c6b77df07..054831ecad68 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/regs.h
@@ -68,6 +68,7 @@ enum mt7615_reg_base {
 #define MT_HIF2_BASE			0xf0000
 #define MT_HIF2(ofs)			(MT_HIF2_BASE + (ofs))
 #define MT_PCIE_IRQ_ENABLE		MT_HIF2(0x188)
+#define MT_PCIE_DOORBELL_PUSH		MT_HIF2(0x1484)
 
 #define MT_CFG_LPCR_HOST		MT_HIF(0x1f0)
 #define MT_CFG_LPCR_HOST_FW_OWN		BIT(0)
-- 
2.25.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
