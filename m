Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E209C4363D
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 15:28:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D891021D91
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 15:28:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DMClC9PM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEI3vPl+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D891021D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Tgkanm4vvI1yAlCAwsUtUi06vL8SIya1GzV0vbfxsiM=; b=DMClC9PMvDRNJ+XNhRoQZBM32
	R4QuRYguYQC/kWof54UF0qDsVQhGY/2Dawh2bGm/E+P66pQdJWMTaYv4gWAWIjSqfVLhnX7J4P2FG
	0zO+ImuJcaSnMAMaF4g5xU733sw0SyWv8J8eV3zi81LuZjxiQeV3NxdCQhM4F/cuOcIH0X/KVBqjH
	nKUyZc9iPvR8Cm02p9BA4faLjCHP5T7qHn6aI+PnE/DTL+5/E/6lyGfhwo9dXiEcvGAodbBwsVo+j
	MT1N7km54clfMnwf/UppoFdr0Md19MCmPoacs+J077RD9hOgYtjF3YOFik0zIPfSN1XI6XAj+fmmD
	7Ohlz6EJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLTAi-0003Eq-6F; Thu, 24 Sep 2020 15:28:36 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLTAX-000394-19; Thu, 24 Sep 2020 15:28:26 +0000
Received: by mail-pj1-x1041.google.com with SMTP id q4so1880257pjh.5;
 Thu, 24 Sep 2020 08:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vzz0659k4nwMVwakwm/RmtcC/L9vr67nkqocIx4yobo=;
 b=OEI3vPl+yd9QIKrq9/edbzxv4ksL18bROyX1URD2V/OelcE0t1iKUAP6iDZgDIC261
 LKb8mf02MKWWNaQdnurAtYfmW9xYlXU+poqtaDanPW8I7bGg/R5caOTedxHIC3E/iIw4
 Nh/WNn0BRTsriHXreeuhR0T1JFprH3Dh1AufH4ew5tch71spMA7p4z79FY+WoC5qkBB9
 dmXPmdoRs9L5PiFnj88o6/m7IAz4I6my2tsFMvbdfHwMQr+X73NtV+/Gm9QXwJt2ETCu
 jZ4VaARxJ5X3DpFN4ACIZzyBxvvTicDqfO4Mum9tOJj3MjZ5fWt0EhKZxIp4aAt8q+Cm
 5SSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vzz0659k4nwMVwakwm/RmtcC/L9vr67nkqocIx4yobo=;
 b=YmJDYPxxssV4uOLgCKnkiE/ZDIHrasx7EmEK5D0XclhVgqsuZ81MgKbDlzVw/3rG6c
 Ye7YED8mfwilaUZFty5eS3H/fiIdEmCy/Zc5G7YfaCscBsGJAFJe4j2NygIeLszfZXjg
 LuwMz4NerNq9HRNxRt2XT4ZzeSStXinYNblIRebUek8esuLCe7GSyM8EXZvzCQCTafZ0
 3yISfRHJkKG3wf6zH2+mC121pLVGPOZ6FUtIy1M9Ma1uHlxFA02OJseG1Vd0j7aFUvXs
 8xl/EePpLnw/KZPV8pwtYmVNapeAugyzEkkk+fYtR1mbsLSPm+2PfWf0GR3MgjupAR8e
 IIaw==
X-Gm-Message-State: AOAM531H/JEPuxh3XMriLjZyAWbTYizq5uRhOnZYNbITx8rQcU8xtQHl
 cPFBuBgSRnWhu41CSARbHwI=
X-Google-Smtp-Source: ABdhPJziJuVlIk0Pqjl8kKPAPvOSPiY8oac/jAD+WQLAQXWe0/6y7/sJek4nx6EQk8nCWigsCeI9/g==
X-Received: by 2002:a17:902:bf08:b029:d1:bafb:ae2a with SMTP id
 bi8-20020a170902bf08b02900d1bafbae2amr4919264plb.39.1600961302878; 
 Thu, 24 Sep 2020 08:28:22 -0700 (PDT)
Received: from guoguo-omen.lan ([156.96.148.94])
 by smtp.gmail.com with ESMTPSA id e62sm3233212pfh.76.2020.09.24.08.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 08:28:22 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-spi@vger.kernel.org
Subject: [PATCH 1/3] spi: spi-mtk-nor: make use of full capability of prg mode
Date: Thu, 24 Sep 2020 23:27:28 +0800
Message-Id: <20200924152730.733243-2-gch981213@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200924152730.733243-1-gch981213@gmail.com>
References: <20200924152730.733243-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_112825_130819_878F3D23 
X-CRM114-Status: GOOD (  21.19  )
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
Cc: linux-kernel@vger.kernel.org, bayi.cheng@mediatek.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Chuanhong Guo <gch981213@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

"program" mode on this controller can trigger up to 56 bits of data
shifting. During the operation, data in PRGDATA[0-5] will be
shifted out from MOSI, and data from MISO will be continuously filling
SHREG[0-9].
Currently this mode is used to implement transfer_one_message for 6-byte
full-duplex transfer, but it can execute a transfer for up-to 7 bytes
as long as the last byte is read only.
transfer_one_message is expected to perform full-duplex transfer,
instead of transfer with specific format. mtk_nor_spi_mem_prg is
added here to use this extra byte.

Newer version of this controller can trigger longer data shifting with
shift bytes more than PRGDATA_MAX + SHREG_MAX. This patch is implemented
with that in mind and it checks against both SHREG_MAX and PRG_CNT_MAX
for future support of new controllers.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
There are two calls of mtk_nor_spi_mem_prg in mtk_nor_exec_op,
which doesn't look great. But I'd prefer keeping it this way
to minimize change of mtk_nor_exec_op.
I'll follow up with a cleanup patchset after this one gets
merged.

 drivers/spi/spi-mtk-nor.c | 82 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 80 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 62f5ff2779884..a0087a5e869b9 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -27,6 +27,7 @@
 #define MTK_NOR_CMD_MASK		GENMASK(5, 0)
 
 #define MTK_NOR_REG_PRG_CNT		0x04
+#define MTK_NOR_PRG_CNT_MAX		56
 #define MTK_NOR_REG_RDATA		0x0c
 
 #define MTK_NOR_REG_RADR0		0x10
@@ -404,6 +405,83 @@ static int mtk_nor_pp_unbuffered(struct mtk_nor *sp,
 	return mtk_nor_cmd_exec(sp, MTK_NOR_CMD_WRITE, 6 * BITS_PER_BYTE);
 }
 
+static int mtk_nor_spi_mem_prg(struct mtk_nor *sp, const struct spi_mem_op *op)
+{
+	int rx_len = 0;
+	int reg_offset = MTK_NOR_REG_PRGDATA_MAX;
+	int tx_len, prg_len;
+	int i, ret;
+	void __iomem *reg;
+	u8 bufbyte;
+
+	tx_len = op->cmd.nbytes + op->addr.nbytes;
+
+	// count dummy bytes only if we need to write data after it
+	if (op->data.dir == SPI_MEM_DATA_OUT)
+		tx_len += op->dummy.nbytes + op->data.nbytes;
+	else if (op->data.dir == SPI_MEM_DATA_IN)
+		rx_len = op->data.nbytes;
+
+	prg_len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes +
+		  op->data.nbytes;
+
+	// an invalid op may reach here if the caller calls exec_op without
+	// adjust_op_size. return -EINVAL instead of -ENOTSUPP so that
+	// spi-mem won't try this op again with generic spi transfers.
+	if ((tx_len > MTK_NOR_REG_PRGDATA_MAX + 1) ||
+	    (rx_len > MTK_NOR_REG_SHIFT_MAX + 1) ||
+	    (prg_len > MTK_NOR_PRG_CNT_MAX / 8))
+		return -EINVAL;
+
+	// fill tx data
+	for (i = op->cmd.nbytes; i > 0; i--, reg_offset--) {
+		reg = sp->base + MTK_NOR_REG_PRGDATA(reg_offset);
+		bufbyte = (op->cmd.opcode >> ((i - 1) * BITS_PER_BYTE)) & 0xff;
+		writeb(bufbyte, reg);
+	}
+
+	for (i = op->addr.nbytes; i > 0; i--, reg_offset--) {
+		reg = sp->base + MTK_NOR_REG_PRGDATA(reg_offset);
+		bufbyte = (op->addr.val >> ((i - 1) * BITS_PER_BYTE)) & 0xff;
+		writeb(bufbyte, reg);
+	}
+
+	if (op->data.dir == SPI_MEM_DATA_OUT) {
+		for (i = 0; i < op->dummy.nbytes; i++, reg_offset--) {
+			reg = sp->base + MTK_NOR_REG_PRGDATA(reg_offset);
+			writeb(0, reg);
+		}
+
+		for (i = 0; i < op->data.nbytes; i++, reg_offset--) {
+			reg = sp->base + MTK_NOR_REG_PRGDATA(reg_offset);
+			writeb(((const u8 *)(op->data.buf.out))[i], reg);
+		}
+	}
+
+	for (; reg_offset >= 0; reg_offset--) {
+		reg = sp->base + MTK_NOR_REG_PRGDATA(reg_offset);
+		writeb(0, reg);
+	}
+
+	// trigger op
+	writel(prg_len * BITS_PER_BYTE, sp->base + MTK_NOR_REG_PRG_CNT);
+	ret = mtk_nor_cmd_exec(sp, MTK_NOR_CMD_PROGRAM,
+			       prg_len * BITS_PER_BYTE);
+	if (ret)
+		return ret;
+
+	// fetch read data
+	reg_offset = 0;
+	if (op->data.dir == SPI_MEM_DATA_IN) {
+		for (i = op->data.nbytes - 1; i >= 0; i--, reg_offset++) {
+			reg = sp->base + MTK_NOR_REG_SHIFT(reg_offset);
+			((u8 *)(op->data.buf.in))[i] = readb(reg);
+		}
+	}
+
+	return 0;
+}
+
 static int mtk_nor_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 {
 	struct mtk_nor *sp = spi_controller_get_devdata(mem->spi->master);
@@ -411,7 +489,7 @@ static int mtk_nor_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 
 	if ((op->data.nbytes == 0) ||
 	    ((op->addr.nbytes != 3) && (op->addr.nbytes != 4)))
-		return -ENOTSUPP;
+		return mtk_nor_spi_mem_prg(sp, op);
 
 	if (op->data.dir == SPI_MEM_DATA_OUT) {
 		mtk_nor_set_addr(sp, op);
@@ -441,7 +519,7 @@ static int mtk_nor_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
 		}
 	}
 
-	return -ENOTSUPP;
+	return mtk_nor_spi_mem_prg(sp, op);
 }
 
 static int mtk_nor_setup(struct spi_device *spi)
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
