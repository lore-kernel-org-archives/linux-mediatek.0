Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3722C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 12:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xD2S90hMUq6G8p2giuh7+Qy8mxWeKRTiBls7hF4zfZI=; b=BVzvl1cQlKJX4f
	6aPkdmMGFcQ662eStdbQf2NYA/GSdmEr8QUCYtm1ig3Q49GeGws/4a3J7UgRaC6DIv5ZKifAPOUfo
	ngUmuoF+XtVRIFDlf27503t5a2U2D+TI++c0d9I9CjguyAtoq7XY4xrKTryRr4JYJ1AwxT0aF+IGp
	a9DeXg8d/xA5XtVpLXDTILcAhS2jum33ZyXPGkiALl8188fjhQkCas/u2g+NUPpcZVZtl1SY7dL94
	Ivn42+fnutufhDBjPnqcxP+flW6Kz/CIb5Js3z0PZQVjYnUxmSlronNdVXCKlNAtqbv2OZY++CZ0/
	EHV9UpPEQMRZ9hp01sYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns1xS-00COuy-DG; Fri, 20 May 2022 12:42:18 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns1vz-00CNyj-C0; Fri, 20 May 2022 12:40:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 39C0C1F462AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653050443;
 bh=1cI7pJdMnTRIrjJ1RulEP49MI5dUM/5mesdNO1GWVz4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L0tAkU63Gsv6F35bpHi7VC2t0gJZXQNisR3r2SkQXYnbYmOLl8m1uBpD+9P8Rn8Cg
 QCK0OPu9l6rX7bmbRnLWsDp+WAOjlUg+eaKbfMG9xS37+4uTNfn9nDXkosP5wiPhQj
 SOMb+swpYgtORdI3xg6n32hrank1MYBliryTbwtr1UtmKdp4on/oCL2ApOoo6cFTtc
 XexakscSvOEYUUsLtsucBJAFmkDhp0bGlCtKOn6MdpYuBq4q3AVxcnxhtEy1eEoQUh
 38r3B3+12vgkLpEwEJUNK1avcv24xDWYmxvT7Rx2uq4enQJAU8sLWEmicST2fvbMtc
 boLckHEBkraRw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lee.jones@linaro.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 zhiyong.tao@mediatek.com, henryc.chen@mediatek.com,
 johnson.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] soc: mediatek: pwrap: Move PMIC read test sequence in
 function
Date: Fri, 20 May 2022 14:40:33 +0200
Message-Id: <20220520124039.228314-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520124039.228314-1-angelogioacchino.delregno@collabora.com>
References: <20220520124039.228314-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_054047_654041_419826FC 
X-CRM114-Status: GOOD (  12.37  )
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

The PMIC read test is performed in two places: pwrap_init_dual_io()
and pwrap_init_sidly().
In preparation for adding support for PMICs requiring a companion
part, move this sequence to a new function pwrap_pmic_read_test().

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 32 +++++++++++++++++-----------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index d8cb0f833645..d0c79ee4c56b 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -1390,6 +1390,18 @@ static int pwrap_regmap_write(void *context, u32 adr, u32 wdata)
 	return pwrap_write(context, adr, wdata);
 }
 
+static bool pwrap_pmic_read_test(struct pmic_wrapper *wrp, const u32 *dew_regs,
+				 u16 read_test_val)
+{
+	bool is_success;
+	u32 rdata;
+
+	pwrap_read(wrp, dew_regs[PWRAP_DEW_READ_TEST], &rdata);
+	is_success = ((rdata & U16_MAX) == read_test_val);
+
+	return is_success;
+}
+
 static int pwrap_reset_spislave(struct pmic_wrapper *wrp)
 {
 	bool tmp;
@@ -1433,18 +1445,18 @@ static int pwrap_reset_spislave(struct pmic_wrapper *wrp)
  */
 static int pwrap_init_sidly(struct pmic_wrapper *wrp)
 {
-	u32 rdata;
 	u32 i;
 	u32 pass = 0;
+	bool read_ok;
 	signed char dly[16] = {
 		-1, 0, 1, 0, 2, -1, 1, 1, 3, -1, -1, -1, 3, -1, 2, 1
 	};
 
 	for (i = 0; i < 4; i++) {
 		pwrap_writel(wrp, i, PWRAP_SIDLY);
-		pwrap_read(wrp, wrp->slave->dew_regs[PWRAP_DEW_READ_TEST],
-			   &rdata);
-		if (rdata == PWRAP_DEW_READ_TEST_VAL) {
+		read_ok = pwrap_pmic_read_test(wrp, wrp->slave->dew_regs,
+					       PWRAP_DEW_READ_TEST_VAL);
+		if (read_ok) {
 			dev_dbg(wrp->dev, "[Read Test] pass, SIDLY=%x\n", i);
 			pass |= 1 << i;
 		}
@@ -1464,8 +1476,7 @@ static int pwrap_init_sidly(struct pmic_wrapper *wrp)
 static int pwrap_init_dual_io(struct pmic_wrapper *wrp)
 {
 	int ret;
-	bool tmp;
-	u32 rdata;
+	bool read_ok, tmp;
 
 	/* Enable dual IO mode */
 	pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_DIO_EN], 1);
@@ -1481,12 +1492,9 @@ static int pwrap_init_dual_io(struct pmic_wrapper *wrp)
 	pwrap_writel(wrp, 1, PWRAP_DIO_EN);
 
 	/* Read Test */
-	pwrap_read(wrp,
-		   wrp->slave->dew_regs[PWRAP_DEW_READ_TEST], &rdata);
-	if (rdata != PWRAP_DEW_READ_TEST_VAL) {
-		dev_err(wrp->dev,
-			"Read failed on DIO mode: 0x%04x!=0x%04x\n",
-			PWRAP_DEW_READ_TEST_VAL, rdata);
+	read_ok = pwrap_pmic_read_test(wrp, wrp->slave->dew_regs, PWRAP_DEW_READ_TEST_VAL);
+	if (!read_ok) {
+		dev_err(wrp->dev, "Read failed on DIO mode.\n");
 		return -EFAULT;
 	}
 
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
