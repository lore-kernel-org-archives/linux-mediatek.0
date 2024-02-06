Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C90C4828D
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Feb 2024 23:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGYOUF8uM1GQoN69Xx2a7IClOY1nWEoUB3pl/we5xUQ=; b=ES/RDrkx3awJomHRUS6sgz4+9w
	aVkPj2XbemuTyYw6yAeNJml96dEoQL3Kh0GhAnu7uJCKjkguPC9y8K3VueosB/EUuenYd/XhIl9kl
	bw9niQDb0NhKGaRDEPU1AoW2uILktQLaMoeJ0c71qy/CzFIBfjnSLKoDQd9kaoQZLP+2xHWTbgVek
	6gW37q+nR+Kz3ghjVZR063qbxVxcwfKatz6jzu1+2mZVxFZvg8qkrZvX0dDjkbTdpAYPhE4WKgKEt
	BmSpxL3wJpuh9X9Gz22Jcy77V88lh9oLMocDIAJNQtbw2EmFwVgq2BNTngqM9rIjhZlqrhMIK69WG
	wK3e2B1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXUwy-00000009BxM-2o45;
	Tue, 06 Feb 2024 23:34:00 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXUwt-00000009BvE-3Z5S
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Feb 2024 23:33:58 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-560c696ccffso823392a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 06 Feb 2024 15:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707262433; x=1707867233; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGYOUF8uM1GQoN69Xx2a7IClOY1nWEoUB3pl/we5xUQ=;
        b=fCwbFRQu1P3BLF/+3FiRaXxcKg1tSc3g79d2lKw7nvkZRF7LR+D8B8fOZFpUNHrFbZ
         Bk/QudPHGJcqjadvSsDUdaV2Q87a2jlR1AyFxzmxr6TL0dX5WEHLLFSS7oCjhzyA1cXa
         PNg9WckpwL0UN1vYJIyrRJPoJ74uoXIgzPPBIkQ6L54yybL0AZtfojmkzGJ+n3QO3Lcj
         hPOf3y+ScSy/KiJuhHdNZ0BtvtZ1KjgDKUBRYSdtUEDFLqJmxmrleB00qo5Ac+Nu5cX7
         2iudt5Ds9kaVkKUUIID9qJTujj5+XB9tjhln7UIHdOOV7sj9sm6tIPj8NQ7yUzE6djPx
         GYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707262433; x=1707867233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGYOUF8uM1GQoN69Xx2a7IClOY1nWEoUB3pl/we5xUQ=;
        b=RXxbS2N//1Grg71qMYZTbpntJCpEwAB1FSTKPmst6I2mL+9TSTW/xNKkLR2GQSyVBD
         tnY2E3g7I2amoBTB0x0gKfamY0PvSdFTPo8tV3mcTRceKT7Fr/M5CDl6fUss1+9X1jqq
         KGog5U0L5oIBHp0wIlOAaJ7mOt4yjpEg/V+fd3ahYtvWYL0krc/Mg0Ev+6izMxWRbjly
         Od1AGt5WuLZLfVdZDLKZfss2FBd1idaWKo0Ok2XVk4JWD+Zg55D8JUsdlIAmjVZ9lzLs
         3auvarGvV41bXgsqpIrAvBPMkHdi7jkgJIZmuo09eFCQXhBHMXDzNFB6WmmkLlYkRPtx
         FD2g==
X-Gm-Message-State: AOJu0YwNu2ovcu4Ka91Zl6fwJMNl4/VUSURJ2Ib/coSzRZN2F9k7Jiyi
	8MTet8CGrFaJqNqxaJC7v+lf2uowEdMFTJY16iDFR4gh3IaP44qLqgzE93c2Bm4=
X-Google-Smtp-Source: AGHT+IGVz7HuWzYNsl2sPusAdsnXMlWxF9DRATNu3wMO7Hr5UU3S7SHGY0MsgOvTxZD41f9z4f1nDw==
X-Received: by 2002:a17:906:af91:b0:a37:9b07:fffc with SMTP id mj17-20020a170906af9100b00a379b07fffcmr4344594ejb.12.1707262433271;
        Tue, 06 Feb 2024 15:33:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXIVDhXl2w9Mr2g8ySKb7VwzoyBxI31Ha1CcTGlEpVjAtkdSLrYcDyVo6gHqF6bS379agbqqeS37t8DsG4he15eRWwHzvbxX8tqVdNki6Shof5gUGyro36ItgnQrOLW+MNVxjna7csiPp3KfZgHT3rYY+CB7cbemUQYCXxIr+KGTv56JFFMNqJ9nSbDUJuEquUj09WwdwBTZuUWIks14szumAaAstSOx1mM6wnKAXrVZGb2ALMrMd4n7ywjHo1RHvuxyNDgKAs/XdZEiaX7MpN2dvIona8B6tBjZTS7GO2A6nAO/zsvQioTNTCULyYHw1pDNFUsc5Iiv3QQmkLFu5/bBO0aRR67YIIQQ2xUKKAmwAGIRutQ1MH7jZzBMNzw
Received: from [127.0.1.1] ([62.231.97.49])
        by smtp.gmail.com with ESMTPSA id un9-20020a170907cb8900b00a36ed37683fsm72404ejc.215.2024.02.06.15.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 15:33:52 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 07 Feb 2024 01:33:42 +0200
Subject: [PATCH RFC 1/2] spmi: Add support for multi-master
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240207-spmi-multi-master-support-v1-1-ce57f301c7fd@linaro.org>
References: <20240207-spmi-multi-master-support-v1-0-ce57f301c7fd@linaro.org>
In-Reply-To: <20240207-spmi-multi-master-support-v1-0-ce57f301c7fd@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=13789; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=ZJ1b8KghLleqJ8T+rAkzn1+HdBws+EtGs+BFf25yaNE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBlwsHc6sOSTWPG1JjumHLk8DdAa3QRC74YuxX6J
 B8N0YXjVT2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZcLB3AAKCRAbX0TJAJUV
 Vnf9EAC7fRIYjVxEGfFIbqFPqBUek4oQzqBoNxiRiBiUN1Pd8gpSd2ZjgmsFW4zb69IJ1bAUyXo
 ubmPGiJSiz5EhLZw5CWd0yqn9ZXmf93slTdkPQD69Kz9+D17DULg4NIuLm5LiuTygKRSpCCyIxS
 vG3EVABcqw3fLmDF8WqwKyOw/vuCxjr44R3dEbP53c883HkbKK6vpFp58mquo5BIKEBFnbifv+k
 +R31USU7/pGmYICdqVVrp6aLOxYVmwALebRXZ0oIMRng/2AVJuVfM2yp1DFZXgXPtE2f//4Vif7
 yZgWGMRIojLHpDUM0nDBSNm7QwxATd0wUsidtYTstDMaNJzuulAX9iS6BBPHk+Q7OiS3T8hTsn7
 gEQa9jdge/ziJ9BrVqCfmpAppCX9rhgpPN4/EJsm/dPrKCn9kN/tPmyWXXq17/x1+ZTVMjL4wDR
 4O7I7AS6+P/t6/xUboOQ/FAizKbKWNu4uK8Oisl9ewtR/vGWFvk+V4Jnq3fIkNLMPVk7W2xDvUT
 L1OeEoHwE1J/wuLdLU82QeVJThhesmK03DvQ49xnFE5r+CA/EjXx13eHhWhZ8UoHI9mQRBrziQS
 0QtXM/k36uDuHwo1etVBiOz3VW2WxAlxEre60XC/hI/sMomorz8v6RQiih3frbSGSKbUFT+9XdJ
 R0y5oA6nNPtSVcQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_153355_963917_CB1A471E 
X-CRM114-Status: GOOD (  15.51  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some newer SPMI controllers support multiple bus masters.
Such a master can control multiple slave devices. The generic
framework needs to be able to pass on the master id to the
controller-specific driver. So do that. The framework will
check if the devicetree child nodes are actually bus masters
and will register the devices for each master. The legacy
approach will still be supported for backwards compatibility.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/spmi/spmi-mtk-pmif.c |  6 ++--
 drivers/spmi/spmi-pmic-arb.c | 10 +++---
 drivers/spmi/spmi.c          | 76 ++++++++++++++++++++++++++++++--------------
 include/linux/spmi.h         | 10 +++---
 4 files changed, 67 insertions(+), 35 deletions(-)

diff --git a/drivers/spmi/spmi-mtk-pmif.c b/drivers/spmi/spmi-mtk-pmif.c
index 5079442f8ea1..b19bb0351ff1 100644
--- a/drivers/spmi/spmi-mtk-pmif.c
+++ b/drivers/spmi/spmi-mtk-pmif.c
@@ -286,7 +286,7 @@ static bool pmif_is_fsm_vldclr(struct pmif *arb)
 	return GET_SWINF(reg_rdata) == SWINF_WFVLDCLR;
 }
 
-static int pmif_arb_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid)
+static int pmif_arb_cmd(struct spmi_controller *ctrl, u8 opc, u8 master_id, u8 sid)
 {
 	struct pmif *arb = spmi_controller_get_drvdata(ctrl);
 	u32 rdata, cmd;
@@ -308,7 +308,7 @@ static int pmif_arb_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid)
 	return ret;
 }
 
-static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
+static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 master_id, u8 sid,
 			      u16 addr, u8 *buf, size_t len)
 {
 	struct pmif *arb = spmi_controller_get_drvdata(ctrl);
@@ -375,7 +375,7 @@ static int pmif_spmi_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	return 0;
 }
 
-static int pmif_spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
+static int pmif_spmi_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 master_id, u8 sid,
 			       u16 addr, const u8 *buf, size_t len)
 {
 	struct pmif *arb = spmi_controller_get_drvdata(ctrl);
diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 9ed1180fe31f..597207720146 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -341,7 +341,7 @@ pmic_arb_non_data_cmd_v2(struct spmi_controller *ctrl, u8 opc, u8 sid)
 }
 
 /* Non-data command */
-static int pmic_arb_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid)
+static int pmic_arb_cmd(struct spmi_controller *ctrl, u8 opc, u8 master_id, u8 sid)
 {
 	struct spmi_pmic_arb *pmic_arb = spmi_controller_get_drvdata(ctrl);
 
@@ -410,7 +410,7 @@ static int pmic_arb_read_cmd_unlocked(struct spmi_controller *ctrl, u32 cmd,
 	return 0;
 }
 
-static int pmic_arb_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
+static int pmic_arb_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 master_id, u8 sid,
 			     u16 addr, u8 *buf, size_t len)
 {
 	struct spmi_pmic_arb *pmic_arb = spmi_controller_get_drvdata(ctrl);
@@ -486,7 +486,7 @@ static int pmic_arb_write_cmd_unlocked(struct spmi_controller *ctrl, u32 cmd,
 				      PMIC_ARB_CHANNEL_RW);
 }
 
-static int pmic_arb_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
+static int pmic_arb_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 master_id, u8 sid,
 			      u16 addr, const u8 *buf, size_t len)
 {
 	struct spmi_pmic_arb *pmic_arb = spmi_controller_get_drvdata(ctrl);
@@ -568,7 +568,7 @@ static void qpnpint_spmi_write(struct irq_data *d, u8 reg, void *buf,
 	u8 sid = hwirq_to_sid(d->hwirq);
 	u8 per = hwirq_to_per(d->hwirq);
 
-	if (pmic_arb_write_cmd(pmic_arb->spmic, SPMI_CMD_EXT_WRITEL, sid,
+	if (pmic_arb_write_cmd(pmic_arb->spmic, SPMI_CMD_EXT_WRITEL, 0, sid,
 			       (per << 8) + reg, buf, len))
 		dev_err_ratelimited(&pmic_arb->spmic->dev, "failed irqchip transaction on %x\n",
 				    d->irq);
@@ -580,7 +580,7 @@ static void qpnpint_spmi_read(struct irq_data *d, u8 reg, void *buf, size_t len)
 	u8 sid = hwirq_to_sid(d->hwirq);
 	u8 per = hwirq_to_per(d->hwirq);
 
-	if (pmic_arb_read_cmd(pmic_arb->spmic, SPMI_CMD_EXT_READL, sid,
+	if (pmic_arb_read_cmd(pmic_arb->spmic, SPMI_CMD_EXT_READL, 0, sid,
 			      (per << 8) + reg, buf, len))
 		dev_err_ratelimited(&pmic_arb->spmic->dev, "failed irqchip transaction on %x\n",
 				    d->irq);
diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
index 3a60fd2e09e1..7dc778db7242 100644
--- a/drivers/spmi/spmi.c
+++ b/drivers/spmi/spmi.c
@@ -64,7 +64,7 @@ int spmi_device_add(struct spmi_device *sdev)
 	struct spmi_controller *ctrl = sdev->ctrl;
 	int err;
 
-	dev_set_name(&sdev->dev, "%d-%02x", ctrl->nr, sdev->usid);
+	dev_set_name(&sdev->dev, "%d-%02x-%02x", ctrl->nr, sdev->mid, sdev->usid);
 
 	err = device_add(&sdev->dev);
 	if (err < 0) {
@@ -91,19 +91,19 @@ void spmi_device_remove(struct spmi_device *sdev)
 EXPORT_SYMBOL_GPL(spmi_device_remove);
 
 static inline int
-spmi_cmd(struct spmi_controller *ctrl, u8 opcode, u8 sid)
+spmi_cmd(struct spmi_controller *ctrl, u8 opcode, u8 mid, u8 sid)
 {
 	int ret;
 
 	if (!ctrl || !ctrl->cmd || ctrl->dev.type != &spmi_ctrl_type)
 		return -EINVAL;
 
-	ret = ctrl->cmd(ctrl, opcode, sid);
+	ret = ctrl->cmd(ctrl, opcode, mid, sid);
 	trace_spmi_cmd(opcode, sid, ret);
 	return ret;
 }
 
-static inline int spmi_read_cmd(struct spmi_controller *ctrl, u8 opcode,
+static inline int spmi_read_cmd(struct spmi_controller *ctrl, u8 opcode, u8 mid,
 				u8 sid, u16 addr, u8 *buf, size_t len)
 {
 	int ret;
@@ -112,12 +112,12 @@ static inline int spmi_read_cmd(struct spmi_controller *ctrl, u8 opcode,
 		return -EINVAL;
 
 	trace_spmi_read_begin(opcode, sid, addr);
-	ret = ctrl->read_cmd(ctrl, opcode, sid, addr, buf, len);
+	ret = ctrl->read_cmd(ctrl, opcode, mid, sid, addr, buf, len);
 	trace_spmi_read_end(opcode, sid, addr, ret, len, buf);
 	return ret;
 }
 
-static inline int spmi_write_cmd(struct spmi_controller *ctrl, u8 opcode,
+static inline int spmi_write_cmd(struct spmi_controller *ctrl, u8 opcode, u8 mid,
 				 u8 sid, u16 addr, const u8 *buf, size_t len)
 {
 	int ret;
@@ -126,7 +126,7 @@ static inline int spmi_write_cmd(struct spmi_controller *ctrl, u8 opcode,
 		return -EINVAL;
 
 	trace_spmi_write_begin(opcode, sid, addr, len, buf);
-	ret = ctrl->write_cmd(ctrl, opcode, sid, addr, buf, len);
+	ret = ctrl->write_cmd(ctrl, opcode, mid, sid, addr, buf, len);
 	trace_spmi_write_end(opcode, sid, addr, ret);
 	return ret;
 }
@@ -145,7 +145,7 @@ int spmi_register_read(struct spmi_device *sdev, u8 addr, u8 *buf)
 	if (addr > 0x1F)
 		return -EINVAL;
 
-	return spmi_read_cmd(sdev->ctrl, SPMI_CMD_READ, sdev->usid, addr,
+	return spmi_read_cmd(sdev->ctrl, SPMI_CMD_READ, sdev->mid, sdev->usid, addr,
 			     buf, 1);
 }
 EXPORT_SYMBOL_GPL(spmi_register_read);
@@ -167,7 +167,7 @@ int spmi_ext_register_read(struct spmi_device *sdev, u8 addr, u8 *buf,
 	if (len == 0 || len > 16)
 		return -EINVAL;
 
-	return spmi_read_cmd(sdev->ctrl, SPMI_CMD_EXT_READ, sdev->usid, addr,
+	return spmi_read_cmd(sdev->ctrl, SPMI_CMD_EXT_READ, sdev->mid, sdev->usid, addr,
 			     buf, len);
 }
 EXPORT_SYMBOL_GPL(spmi_ext_register_read);
@@ -189,7 +189,7 @@ int spmi_ext_register_readl(struct spmi_device *sdev, u16 addr, u8 *buf,
 	if (len == 0 || len > 8)
 		return -EINVAL;
 
-	return spmi_read_cmd(sdev->ctrl, SPMI_CMD_EXT_READL, sdev->usid, addr,
+	return spmi_read_cmd(sdev->ctrl, SPMI_CMD_EXT_READL, sdev->mid, sdev->usid, addr,
 			     buf, len);
 }
 EXPORT_SYMBOL_GPL(spmi_ext_register_readl);
@@ -208,7 +208,7 @@ int spmi_register_write(struct spmi_device *sdev, u8 addr, u8 data)
 	if (addr > 0x1F)
 		return -EINVAL;
 
-	return spmi_write_cmd(sdev->ctrl, SPMI_CMD_WRITE, sdev->usid, addr,
+	return spmi_write_cmd(sdev->ctrl, SPMI_CMD_WRITE, sdev->mid, sdev->usid, addr,
 			      &data, 1);
 }
 EXPORT_SYMBOL_GPL(spmi_register_write);
@@ -222,7 +222,7 @@ EXPORT_SYMBOL_GPL(spmi_register_write);
  */
 int spmi_register_zero_write(struct spmi_device *sdev, u8 data)
 {
-	return spmi_write_cmd(sdev->ctrl, SPMI_CMD_ZERO_WRITE, sdev->usid, 0,
+	return spmi_write_cmd(sdev->ctrl, SPMI_CMD_ZERO_WRITE, sdev->mid, sdev->usid, 0,
 			      &data, 1);
 }
 EXPORT_SYMBOL_GPL(spmi_register_zero_write);
@@ -244,7 +244,7 @@ int spmi_ext_register_write(struct spmi_device *sdev, u8 addr, const u8 *buf,
 	if (len == 0 || len > 16)
 		return -EINVAL;
 
-	return spmi_write_cmd(sdev->ctrl, SPMI_CMD_EXT_WRITE, sdev->usid, addr,
+	return spmi_write_cmd(sdev->ctrl, SPMI_CMD_EXT_WRITE, sdev->mid, sdev->usid, addr,
 			      buf, len);
 }
 EXPORT_SYMBOL_GPL(spmi_ext_register_write);
@@ -266,7 +266,7 @@ int spmi_ext_register_writel(struct spmi_device *sdev, u16 addr, const u8 *buf,
 	if (len == 0 || len > 8)
 		return -EINVAL;
 
-	return spmi_write_cmd(sdev->ctrl, SPMI_CMD_EXT_WRITEL, sdev->usid,
+	return spmi_write_cmd(sdev->ctrl, SPMI_CMD_EXT_WRITEL, sdev->mid, sdev->usid,
 			      addr, buf, len);
 }
 EXPORT_SYMBOL_GPL(spmi_ext_register_writel);
@@ -281,7 +281,7 @@ EXPORT_SYMBOL_GPL(spmi_ext_register_writel);
  */
 int spmi_command_reset(struct spmi_device *sdev)
 {
-	return spmi_cmd(sdev->ctrl, SPMI_CMD_RESET, sdev->usid);
+	return spmi_cmd(sdev->ctrl, SPMI_CMD_RESET, sdev->mid, sdev->usid);
 }
 EXPORT_SYMBOL_GPL(spmi_command_reset);
 
@@ -293,7 +293,7 @@ EXPORT_SYMBOL_GPL(spmi_command_reset);
  */
 int spmi_command_sleep(struct spmi_device *sdev)
 {
-	return spmi_cmd(sdev->ctrl, SPMI_CMD_SLEEP, sdev->usid);
+	return spmi_cmd(sdev->ctrl, SPMI_CMD_SLEEP, sdev->mid, sdev->usid);
 }
 EXPORT_SYMBOL_GPL(spmi_command_sleep);
 
@@ -306,7 +306,7 @@ EXPORT_SYMBOL_GPL(spmi_command_sleep);
  */
 int spmi_command_wakeup(struct spmi_device *sdev)
 {
-	return spmi_cmd(sdev->ctrl, SPMI_CMD_WAKEUP, sdev->usid);
+	return spmi_cmd(sdev->ctrl, SPMI_CMD_WAKEUP, sdev->mid, sdev->usid);
 }
 EXPORT_SYMBOL_GPL(spmi_command_wakeup);
 
@@ -318,7 +318,7 @@ EXPORT_SYMBOL_GPL(spmi_command_wakeup);
  */
 int spmi_command_shutdown(struct spmi_device *sdev)
 {
-	return spmi_cmd(sdev->ctrl, SPMI_CMD_SHUTDOWN, sdev->usid);
+	return spmi_cmd(sdev->ctrl, SPMI_CMD_SHUTDOWN, sdev->mid, sdev->usid);
 }
 EXPORT_SYMBOL_GPL(spmi_command_shutdown);
 
@@ -477,15 +477,16 @@ struct spmi_controller *spmi_controller_alloc(struct device *parent,
 }
 EXPORT_SYMBOL_GPL(spmi_controller_alloc);
 
-static void of_spmi_register_devices(struct spmi_controller *ctrl)
+static void of_spmi_register_devices(struct spmi_controller *ctrl,
+				     struct device_node *parent, u8 mid)
 {
 	struct device_node *node;
 	int err;
 
-	if (!ctrl->dev.of_node)
+	if (!parent)
 		return;
 
-	for_each_available_child_of_node(ctrl->dev.of_node, node) {
+	for_each_available_child_of_node(parent, node) {
 		struct spmi_device *sdev;
 		u32 reg[2];
 
@@ -519,6 +520,7 @@ static void of_spmi_register_devices(struct spmi_controller *ctrl)
 
 		sdev->dev.of_node = node;
 		sdev->usid = (u8)reg[0];
+		sdev->mid = mid;
 
 		err = spmi_device_add(sdev);
 		if (err) {
@@ -529,6 +531,30 @@ static void of_spmi_register_devices(struct spmi_controller *ctrl)
 	}
 }
 
+static int of_spmi_register_bus_masters(struct spmi_controller *ctrl)
+{
+	struct device_node *node = ctrl->dev.of_node, *child;
+	int mid = 0;
+
+	for_each_available_child_of_node(node, child) {
+		if (of_node_name_eq(child, "spmi-bus-master"))
+			of_spmi_register_devices(ctrl, child, mid++);
+	}
+
+	return 0;
+}
+
+static bool of_spmi_has_bus_multi_master(struct spmi_controller *ctrl)
+{
+	struct device_node *node = ctrl->dev.of_node, *child;
+
+	for_each_available_child_of_node(node, child)
+		if (of_node_name_eq(child, "spmi-bus-master"))
+			return true;
+
+	return false;
+}
+
 /**
  * spmi_controller_add() - Add an SPMI controller
  * @ctrl:	controller to be registered.
@@ -548,8 +574,12 @@ int spmi_controller_add(struct spmi_controller *ctrl)
 	if (ret)
 		return ret;
 
-	if (IS_ENABLED(CONFIG_OF))
-		of_spmi_register_devices(ctrl);
+	if (IS_ENABLED(CONFIG_OF)) {
+		if (of_spmi_has_bus_multi_master(ctrl))
+			of_spmi_register_bus_masters(ctrl);
+		else
+			of_spmi_register_devices(ctrl, ctrl->dev.of_node, 0);
+	}
 
 	dev_dbg(&ctrl->dev, "spmi-%d registered: dev:%p\n",
 		ctrl->nr, &ctrl->dev);
diff --git a/include/linux/spmi.h b/include/linux/spmi.h
index 28e8c8bd3944..6e9031df47f0 100644
--- a/include/linux/spmi.h
+++ b/include/linux/spmi.h
@@ -34,12 +34,14 @@
  * struct spmi_device - Basic representation of an SPMI device
  * @dev:	Driver model representation of the device.
  * @ctrl:	SPMI controller managing the bus hosting this device.
- * @usid:	This devices' Unique Slave IDentifier.
+ * @usid:	This device's Unique Slave IDentifier.
+ * @mid:	This device's Bus Master IDentifier.
  */
 struct spmi_device {
 	struct device		dev;
 	struct spmi_controller	*ctrl;
 	u8			usid;
+	u8			mid;
 };
 
 static inline struct spmi_device *to_spmi_device(struct device *d)
@@ -80,10 +82,10 @@ void spmi_device_remove(struct spmi_device *sdev);
 struct spmi_controller {
 	struct device		dev;
 	unsigned int		nr;
-	int	(*cmd)(struct spmi_controller *ctrl, u8 opcode, u8 sid);
-	int	(*read_cmd)(struct spmi_controller *ctrl, u8 opcode,
+	int	(*cmd)(struct spmi_controller *ctrl, u8 opcode, u8 mid, u8 sid);
+	int	(*read_cmd)(struct spmi_controller *ctrl, u8 opcode, u8 mid,
 			    u8 sid, u16 addr, u8 *buf, size_t len);
-	int	(*write_cmd)(struct spmi_controller *ctrl, u8 opcode,
+	int	(*write_cmd)(struct spmi_controller *ctrl, u8 opcode, u8 mid,
 			     u8 sid, u16 addr, const u8 *buf, size_t len);
 };
 

-- 
2.34.1


