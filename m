Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86401C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 16:41:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49A1620709
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 16:41:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F+BdnbSD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="PyC5Lwmt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49A1620709
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=56yHgqaPKRr27Fys8+9uDXCuporQ+Dg6c01msWO+hhE=; b=F+BdnbSD1ipIA8
	dmsZfuBzk8JF+1mRtY5H4JIShC79fTmDx3VMu9A6oP0+H560zeLUpainrpdnSdh+qfGQFVmoK7eWm
	dxTpqKPbIkOkfdgYx/FfpfiyDyLmuMKaY9dCzsgNX+Rmm/AbE69klxiatr7BnvLkWR60cP2MUUoVL
	7AYSV4MBAyCfdLVWysRm62FoCWlMWt2DCo88o7cvjB9iOYNOEOIQ8S+af+TnhIvJxPgk6eh3SQvsX
	V8t9Qc3TlbmIhKNTqtN+I9YgDIPsATRF2ouh1heOrt5c6HXPR6vzwSBW//CWLgO0Oq371uadyk0uA
	h+D2tJuL8LemL4+n/HQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbRm3-00075y-2a; Wed, 20 May 2020 16:40:55 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbRdL-0004Ma-DN; Wed, 20 May 2020 16:31:58 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04KGVo8b007703;
 Wed, 20 May 2020 11:31:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1589992310;
 bh=UGm3yi7Ejr5LlC2C9cUmKBQpIeGi0qN02ez2pkmDV68=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=PyC5LwmtS/6yWJlBaH8MPD7Jwka12DSfu106KgpQsYt+SZpQraESf1a9AN7MkhEwQ
 dtHgwmJZgvr+OfpJtbU8Geav6BkKBuoGu1JJu4pQN6RFVGupksTDc3DlQe2MbbszUu
 eVA9RUISRzb3jOF+BftDlWzCTEYIPImPu32T4mYY=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04KGVnXf045871
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 20 May 2020 11:31:49 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 20
 May 2020 11:31:49 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 20 May 2020 11:31:49 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04KGUsxZ001551;
 Wed, 20 May 2020 11:31:45 -0500
From: Pratyush Yadav <p.yadav@ti.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Mark Brown <broonie@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Ludovic Desroches
 <ludovic.desroches@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH v6 10/19] mtd: spi-nor: core: use dummy cycle and address
 width info from SFDP
Date: Wed, 20 May 2020 22:00:44 +0530
Message-ID: <20200520163053.24357-11-p.yadav@ti.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200520163053.24357-1-p.yadav@ti.com>
References: <20200520163053.24357-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_093155_572952_7AEDE2DD 
X-CRM114-Status: GOOD (  13.08  )
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
Cc: Mason Yang <masonccyang@mxic.com.tw>,
 Boris Brezillon <boris.brezillon@collabora.com>, Sekhar Nori <nsekhar@ti.com>,
 Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The xSPI Profile 1.0 table specifies how many dummy cycles and address
bytes are needed for the Read Status Register command in octal DTR mode.
Use that information to send the correct Read SR command.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/mtd/spi-nor/core.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 642e3c07acf9..2ad248140b6c 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -357,6 +357,8 @@ int spi_nor_write_disable(struct spi_nor *nor)
 static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
 {
 	int ret;
+	u8 addr_bytes = nor->params->rdsr_addr_nbytes;
+	u8 dummy = nor->params->rdsr_dummy;
 
 	if (nor->spimem) {
 		struct spi_mem_op op =
@@ -365,10 +367,21 @@ static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
 				   SPI_MEM_OP_NO_DUMMY,
 				   SPI_MEM_OP_DATA_IN(1, sr, 1));
 
+		if (spi_nor_protocol_is_dtr(nor->reg_proto)) {
+			op.addr.nbytes = addr_bytes;
+			op.addr.val = 0;
+			op.dummy.nbytes = dummy;
+		}
+
+		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
+
 		ret = spi_mem_exec_op(nor->spimem, &op);
 	} else {
-		ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDSR,
-						    sr, 1);
+		if (spi_nor_protocol_is_dtr(nor->reg_proto))
+			ret = -ENOTSUPP;
+		else
+			ret = nor->controller_ops->read_reg(nor, SPINOR_OP_RDSR,
+							    sr, 1);
 	}
 
 	if (ret)
@@ -388,6 +401,8 @@ static int spi_nor_read_sr(struct spi_nor *nor, u8 *sr)
 static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
 {
 	int ret;
+	u8 addr_bytes = nor->params->rdsr_addr_nbytes;
+	u8 dummy = nor->params->rdsr_dummy;
 
 	if (nor->spimem) {
 		struct spi_mem_op op =
@@ -396,6 +411,12 @@ static int spi_nor_read_fsr(struct spi_nor *nor, u8 *fsr)
 				   SPI_MEM_OP_NO_DUMMY,
 				   SPI_MEM_OP_DATA_IN(1, fsr, 1));
 
+		if (spi_nor_protocol_is_dtr(nor->reg_proto)) {
+			op.addr.nbytes = addr_bytes;
+			op.addr.val = 0;
+			op.dummy.nbytes = dummy;
+		}
+
 		spi_nor_spimem_setup_op(nor, &op, nor->reg_proto);
 
 		ret = spi_mem_exec_op(nor->spimem, &op);
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
