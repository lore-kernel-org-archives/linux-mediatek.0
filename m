Return-Path: <SRS0=9rwW=7E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980B4C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 10:14:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E1FA2065C
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 May 2020 10:14:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hiLz9uFo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="b+HtBS9v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E1FA2065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1cf+9EqAxmzFV3+xlwItlEbg2Ek/OjObvlCwPDPYWs=; b=hiLz9uFoud90hY
	4KSXcI+SMP7OxJEzKzglhj7gClpwEvPXqOXlBqF4zwI7bP4IBzT2SmJNQLYfmQnX4E09CVsF+T/gd
	v7L8KBX04gKw/RHfVuE8wZCOwIYfTxJInstmYb+Tur1Vq9tmqFGb5JREoZJTUb9GWOez1VXG6cKHI
	K2n9Lz/9mL47WXPs8oD9wc9dtIekH+hofp3asYVz5kXMirn9TqD64ZNtO/usIv4CKXYQoVGeAMkrW
	eTqK7vyBNZWZurZu29f/GF6w92PrmaPDsUv7a0gq3It4l8jL5g93gC+O4/t/QVqXTF/8HmKIiJoVd
	P1kT5PsPQ7Rn/pIe143Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jc4gs-0002gI-DW; Fri, 22 May 2020 10:14:10 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jc4gB-00025x-G5; Fri, 22 May 2020 10:13:28 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04MADIKv008976;
 Fri, 22 May 2020 05:13:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1590142398;
 bh=oT/wzRt5tcDLs2tHXZFon7HN6JCAyNcgvVf1sZG+Lus=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=b+HtBS9vWLINtp5CvanMgZAQtDci3udipuzCdtrjOwgSe06CSj4EJar+2rV1lJT48
 06LgFtUkQrGy/p1TNrPXtShxP77rTnIlK0WjBZsJukC2QsQ8SwOkDkHPEvsKTM5nUb
 pFlIjZ4qWPJbeTmcKL5qibsqkJLC0gtuc2xyYNwM=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04MADIOp048226;
 Fri, 22 May 2020 05:13:18 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 22
 May 2020 05:13:17 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 22 May 2020 05:13:17 -0500
Received: from pratyush-OptiPlex-790.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04MAD1a3041179;
 Fri, 22 May 2020 05:13:13 -0500
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
Subject: [PATCH v7 02/20] spi: spi-mem: allow specifying a command's extension
Date: Fri, 22 May 2020 15:42:43 +0530
Message-ID: <20200522101301.26909-3-p.yadav@ti.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200522101301.26909-1-p.yadav@ti.com>
References: <20200522101301.26909-1-p.yadav@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200522_031327_661087_DD740865 
X-CRM114-Status: GOOD (  15.34  )
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

In xSPI mode, flashes expect 2-byte opcodes. The second byte is called
the "command extension". There can be 3 types of extensions in xSPI:
repeat, invert, and hex. When the extension type is "repeat", the same
opcode is sent twice. When it is "invert", the second byte is the
inverse of the opcode. When it is "hex" an additional opcode byte based
is sent with the command whose value can be anything.

So, make opcode a 16-bit value and add a 'nbytes', similar to how
multiple address widths are handled.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
---
 drivers/spi/spi-mem.c       | 5 ++++-
 include/linux/spi/spi-mem.h | 6 +++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
index 93e255287ab9..29dcd1d62710 100644
--- a/drivers/spi/spi-mem.c
+++ b/drivers/spi/spi-mem.c
@@ -159,6 +159,9 @@ bool spi_mem_default_supports_op(struct spi_mem *mem,
 	if (op->cmd.dtr || op->addr.dtr || op->dummy.dtr || op->data.dtr)
 		return false;
 
+	if (op->cmd.nbytes != 1)
+		return false;
+
 	return true;
 }
 EXPORT_SYMBOL_GPL(spi_mem_default_supports_op);
@@ -173,7 +176,7 @@ static bool spi_mem_buswidth_is_valid(u8 buswidth)
 
 static int spi_mem_check_op(const struct spi_mem_op *op)
 {
-	if (!op->cmd.buswidth)
+	if (!op->cmd.buswidth || !op->cmd.nbytes)
 		return -EINVAL;
 
 	if ((op->addr.nbytes && !op->addr.buswidth) ||
diff --git a/include/linux/spi/spi-mem.h b/include/linux/spi/spi-mem.h
index e3dcb956bf61..159463cc659c 100644
--- a/include/linux/spi/spi-mem.h
+++ b/include/linux/spi/spi-mem.h
@@ -17,6 +17,7 @@
 	{							\
 		.buswidth = __buswidth,				\
 		.opcode = __opcode,				\
+		.nbytes = 1,					\
 	}
 
 #define SPI_MEM_OP_ADDR(__nbytes, __val, __buswidth)		\
@@ -69,6 +70,8 @@ enum spi_mem_data_dir {
 
 /**
  * struct spi_mem_op - describes a SPI memory operation
+ * @cmd.nbytes: number of opcode bytes (only 1 or 2 are valid). The opcode is
+ *		sent MSB-first.
  * @cmd.buswidth: number of IO lines used to transmit the command
  * @cmd.opcode: operation opcode
  * @cmd.dtr: whether the command opcode should be sent in DTR mode or not
@@ -94,9 +97,10 @@ enum spi_mem_data_dir {
  */
 struct spi_mem_op {
 	struct {
+		u8 nbytes;
 		u8 buswidth;
 		u8 dtr : 1;
-		u8 opcode;
+		u16 opcode;
 	} cmd;
 
 	struct {
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
