Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5712FA3747
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 11:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qlYXu9wdGGHl/oITpGKAFgbisLnw4KYV2wASACpU2Lc=; b=IoLaP46GQvL8TI4cxc+qNrj283
	3+udbEMbkWDeWyMKW4AuCHdYogYE2y1gh4daIy/wSqpRATXfJQE2+6jyTrOxXJgtSzMuDIt+TdggN
	OmIVHscrsPEUS/9lE/7ASp60ZB5wBfnzFqHTGkyS1BCvsOQmTEnNSuIw9lmpwN5bjNKKDbmJMePOi
	3TsilR6M9HSwiDRAGKHQLMPb+udRpGPNVFx8dU4S3z+P+Ty3LUMSFqFKU2N7MtsS8DDiwIfi1+hbH
	9u3kuYbTPD2KjSzIJUvM0E7joaFprzQlXsY4+yP9a8PbpdLzj42h5thOMAAr14NYpwjYNFhCuZRUJ
	5lWRDmOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp4jl-0000000FmPx-1xAZ;
	Fri, 13 Sep 2024 11:45:17 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp4ic-0000000Fm6k-2iMv
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Sep 2024 11:44:08 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-5c3d20eed0bso2343091a12.0
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Sep 2024 04:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726227844; x=1726832644; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qlYXu9wdGGHl/oITpGKAFgbisLnw4KYV2wASACpU2Lc=;
        b=g7jCx0lRPXMnoyWi8n4/HYC2PkGmrkOKldiZH/t8zT/EbQcrgnIOC8v7ApHl6M4cw5
         qUpK+mhJ38W5xC2vh0UsZdkhXFyV1Zs4XVAXvY0yFP0gEtEcYCmf4dsoNJwgwf2Phavy
         GlRqeP3Gg/VF647S5TzbFgvEUjyys0zIKzTDo2FIQ7jWpPs5YOxlNZ/pqbqrCyF2qkB7
         igebDAITliszwGxpl3u75CMNfhhH2nWMeFwrjKF36xMzcFsZFgs8oDyaHFkjBY+v/DWx
         IXe7RgibPgubFewMWGh2lkUGaKZa2fxLS7j1q6YBz0ZRGps+hq5JMjK3SdKV8EwANQF9
         1yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726227844; x=1726832644;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qlYXu9wdGGHl/oITpGKAFgbisLnw4KYV2wASACpU2Lc=;
        b=OX86dXb7eIMk6nxB9DendGZ4nxFOB5002xwaz6oZ3P97EqrjKaJFYrshpKobYjDnd7
         i0n0frleJK64DRCbUxPSvYng8UdOuxXukr/TPHGKIO5nCvEqV8OU6FdHY39CdXryUczA
         NLKQTwQXGahRpP80HWHyxgH9jSKSv+WeHuhHGZFHHsvs/oH+pUymgckMQYevi95BmZFe
         p6AP8LHkgdRXXSA1yv/X9KRQ3BWd/C900dT99C4/u7NavaRj1WIzNJoYuT+cXbytHhPy
         baZzbqT3K+wFfjaBt6uh/j1nxqy3oxubTRSjVO7FNF3DGaiiC3w/SxLA5Dsif0XTh7hw
         wRJA==
X-Forwarded-Encrypted: i=1; AJvYcCXYR/usn67upq8bP17nMd3PhUKUfn/xT7PH6l4QkHTMoHQv5J1v+Bzwa6/Jd0VUqQ+pgKTDJgEj9WgfKU+6kQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFK2Ory09WXbYxs3zNP2LBmwnFeLwI3QHIFJO/LPRYW7H9B9i3
	tfkwXcqAWaVq8heaaYxrMNzzdiys3LNrnVNji/3rdkdcJlfwWgQE/PZpwsHMzpU=
X-Google-Smtp-Source: AGHT+IFgdBHhnRR181adepCCcniOpts8e4r4NbrXOVCetFZwhxCcF3N/3TnCcklxP7H8J5/0vsGvgw==
X-Received: by 2002:a05:6402:295:b0:5c2:7727:6109 with SMTP id 4fb4d7f45d1cf-5c413e53f72mr3628609a12.30.1726227843865;
        Fri, 13 Sep 2024 04:44:03 -0700 (PDT)
Received: from puffmais.c.googlers.com (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd8ad51sm7570249a12.79.2024.09.13.04.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Sep 2024 04:44:03 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 13 Sep 2024 12:43:58 +0100
Subject: [PATCH] regulator: update some comments ([gs]et_voltage_vsel vs
 [gs]et_voltage_sel)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240913-regulator-typos-v1-1-92781c93f638@linaro.org>
X-B4-Tracking: v=1; b=H4sIAH4l5GYC/x3MQQqAIBBA0avErBO0ErSrRAupyQZCY6wowrsnL
 d/i/xcSMmGCvnqB8aJEMRSouoJpdcGjoLkYGtl00qpWMPpzc0dkcTx7TEJPVhlrNFqFUKqdcaH
 7Pw5jzh/BUQUkYQAAAA==
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_044406_708890_46088479 
X-CRM114-Status: GOOD (  11.45  )
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

Some comments here are referring to a non-existent
regulator_ops::get_voltage_vsel() where ::get_voltage_sel() is meant,
and similar for ::set_voltage_vsel() / ::set_voltage_sel().

Update the comments.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/helpers.c          | 8 ++++----
 drivers/regulator/mt6357-regulator.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/helpers.c b/drivers/regulator/helpers.c
index 6e1ace660b8c..0def82eb8b46 100644
--- a/drivers/regulator/helpers.c
+++ b/drivers/regulator/helpers.c
@@ -125,7 +125,7 @@ static int regulator_range_selector_to_index(struct regulator_dev *rdev,
  *
  * Regulators that use regmap for their register I/O and use pickable
  * ranges can set the vsel_reg, vsel_mask, vsel_range_reg and vsel_range_mask
- * fields in their descriptor and then use this as their get_voltage_vsel
+ * fields in their descriptor and then use this as their get_voltage_sel
  * operation, saving some code.
  */
 int regulator_get_voltage_sel_pickable_regmap(struct regulator_dev *rdev)
@@ -195,7 +195,7 @@ static int write_separate_vsel_and_range(struct regulator_dev *rdev,
  *
  * Regulators that use regmap for their register I/O and use pickable
  * ranges can set the vsel_reg, vsel_mask, vsel_range_reg and vsel_range_mask
- * fields in their descriptor and then use this as their set_voltage_vsel
+ * fields in their descriptor and then use this as their set_voltage_sel
  * operation, saving some code.
  */
 int regulator_set_voltage_sel_pickable_regmap(struct regulator_dev *rdev,
@@ -250,7 +250,7 @@ EXPORT_SYMBOL_GPL(regulator_set_voltage_sel_pickable_regmap);
  *
  * Regulators that use regmap for their register I/O can set the
  * vsel_reg and vsel_mask fields in their descriptor and then use this
- * as their get_voltage_vsel operation, saving some code.
+ * as their get_voltage_sel operation, saving some code.
  */
 int regulator_get_voltage_sel_regmap(struct regulator_dev *rdev)
 {
@@ -276,7 +276,7 @@ EXPORT_SYMBOL_GPL(regulator_get_voltage_sel_regmap);
  *
  * Regulators that use regmap for their register I/O can set the
  * vsel_reg and vsel_mask fields in their descriptor and then use this
- * as their set_voltage_vsel operation, saving some code.
+ * as their set_voltage_sel operation, saving some code.
  */
 int regulator_set_voltage_sel_regmap(struct regulator_dev *rdev, unsigned sel)
 {
diff --git a/drivers/regulator/mt6357-regulator.c b/drivers/regulator/mt6357-regulator.c
index c0439a4e0b50..1eb69c7a6acb 100644
--- a/drivers/regulator/mt6357-regulator.c
+++ b/drivers/regulator/mt6357-regulator.c
@@ -123,7 +123,7 @@ struct mt6357_regulator_info {
  *
  * Regulators that use regmap for their register I/O can set the
  * da_vsel_reg and da_vsel_mask fields in the info structure and
- * then use this as their get_voltage_vsel operation.
+ * then use this as their get_voltage_sel operation.
  */
 static int mt6357_get_buck_voltage_sel(struct regulator_dev *rdev)
 {

---
base-commit: 5acd9952f95fb4b7da6d09a3be39195a80845eb6
change-id: 20240913-regulator-typos-5c918985e91e

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


