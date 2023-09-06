Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4DAEEB8FA5
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Sep 2023 11:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F4ZnpdubhyYmtydqMWzP1BxA67KulQROyAS5/n5ddvg=; b=29z4XvNWOTFvKdBIKcs5Gwde4T
	MG421YsIbfr46FKckwaqyoHIZ83BuDSmFH1eGyUP73D5wqt6C6WDACYZ0qj+zmKZOJmK/SQwJrf7L
	boxDhSkBXPjopRBGAosJrzk59wLgsgM0mBVLXxn/sgGFkQZw9UCUjVKA+k6oI4vwsbVzd9rtzbQt7
	/dE637sATVa6Ncj0z+64vtl4abJE5iBM3acAeEGljSyDsIkjS6Q6GujfzGZ7FxrZ3IhqIV159EnO2
	dJ6TOqMndbalBl7EqhSe5dCkscK/hgGEz6DzuKEK5CqR16BoRivqpaxwrCPeTsn0gQ4WOK5bAqjpT
	EdCPc+Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdqmd-008oAs-12;
	Wed, 06 Sep 2023 11:33:19 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdqmV-008o23-1h
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Sep 2023 11:33:17 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-52bcd4db4c0so1822461a12.0
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Sep 2023 04:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693999989; x=1694604789; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F4ZnpdubhyYmtydqMWzP1BxA67KulQROyAS5/n5ddvg=;
        b=WZItfgKKW0UW0hIU+65zUdIRqRJSKfhFym7DtMQCIZTOCIGuuCtUdPKKeKwn9tuSo+
         0ozyUG7qvfkeZ7yVDg3fCLoR9alB4SzUPo28OCvmXIT0MUNYT5+yVGcbjWAh75vc3RW0
         KMIikbo2drKDiSMeXwWnSVWrbIeEiPIPFzKLbukN/r9AHNUjYNm/+Bi/mEgXas1+1XTF
         NozQWc7jNC5wWSpeNuPofcUQ2RxueYPTomM41lNEj4HSV4n0xwDek6lGxzYUVErBK+kZ
         61zsg0L1SHFmVlDB1VjjHL3cVMLxM4lLCDKLPDVcQsRpoEJFsvf81IPINh2gquYDLOef
         cvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693999989; x=1694604789;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F4ZnpdubhyYmtydqMWzP1BxA67KulQROyAS5/n5ddvg=;
        b=XRq3xLRvL+I3K63MngCNc8/Zx8SQ3Bh4GSB0AbFkLhTVpQxqaoGo56IGI0Nwyl9ZNK
         dT9uIIqit/Kkg6Fd5Oc1cmVzFgty+e/1xIbEq/e/kglz8hoQRIYrq+6F405Q203E5i6p
         QkBAs6Ceez+KePx5MGiG8YPTwGtR3UGTdQethptCSpO2UTsE5x26nJI1lxCml1WV09oy
         86jPxVV0XDEw8h4DBWo9/AliU+ER1C5lqhlaHihirAGuRbbZ5nw47gjA4e39Cwi2f1zm
         PsDR+JAc2PL/b2hcVjk8M9Wu1l2RyuHvriIOq6UpA1BHJtHnscz183NTYRHwUS7oI0oY
         9Ycw==
X-Gm-Message-State: AOJu0Yw7Vuht2uS4tA5d7wlXUquv48fX2bnMR2QRrS008/L1PczOW5nz
	q3arhJoW00IkWmCgEmzl4YCY4Q==
X-Google-Smtp-Source: AGHT+IHendEcILigzm+13T6wKgoeOTOCi5Gg0KhlfTRaErItptfzN10sryNjfJSw8Ig2bTdARTW8Fg==
X-Received: by 2002:aa7:d351:0:b0:523:c36e:ec8b with SMTP id m17-20020aa7d351000000b00523c36eec8bmr2531498edr.9.1693999988721;
        Wed, 06 Sep 2023 04:33:08 -0700 (PDT)
Received: from krzk-bin.. (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id m6-20020a056402050600b0052a404e5929sm8157907edv.66.2023.09.06.04.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 04:33:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Stanley Chu <stanley.chu@mediatek.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-scsi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] scsi: ufs: do not look for unsupported vdd-hba-max-microamp
Date: Wed,  6 Sep 2023 13:33:02 +0200
Message-Id: <20230906113302.201888-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_043311_679799_2F9C2701 
X-CRM114-Status: GOOD (  14.87  )
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

Bindings do not allow vdd-hba-max-microamp property and the driver does
not use it (does not control load of vdd-hba supply).  Skip looking for
this property to avoid misleading dmesg messages:

  ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: unable to find vdd-hba-max-microamp

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/ufs/host/ufs-mediatek.c  |  2 +-
 drivers/ufs/host/ufshcd-pltfrm.c | 15 ++++++++++-----
 drivers/ufs/host/ufshcd-pltfrm.h |  2 +-
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 2383ecd88f1c..941f58744d08 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -806,7 +806,7 @@ static int ufs_mtk_vreg_fix_vcc(struct ufs_hba *hba)
 		return 0;
 	}
 
-	err = ufshcd_populate_vreg(dev, vcc_name, &info->vcc);
+	err = ufshcd_populate_vreg(dev, vcc_name, &info->vcc, false);
 	if (err)
 		return err;
 
diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
index 797a4dfe45d9..61cf8b957da4 100644
--- a/drivers/ufs/host/ufshcd-pltfrm.c
+++ b/drivers/ufs/host/ufshcd-pltfrm.c
@@ -121,7 +121,7 @@ static bool phandle_exists(const struct device_node *np,
 
 #define MAX_PROP_SIZE 32
 int ufshcd_populate_vreg(struct device *dev, const char *name,
-			 struct ufs_vreg **out_vreg)
+			 struct ufs_vreg **out_vreg, bool skip_current)
 {
 	char prop_name[MAX_PROP_SIZE];
 	struct ufs_vreg *vreg = NULL;
@@ -147,6 +147,11 @@ int ufshcd_populate_vreg(struct device *dev, const char *name,
 	if (!vreg->name)
 		return -ENOMEM;
 
+	if (skip_current) {
+		vreg->max_uA = 0;
+		goto out;
+	}
+
 	snprintf(prop_name, MAX_PROP_SIZE, "%s-max-microamp", name);
 	if (of_property_read_u32(np, prop_name, &vreg->max_uA)) {
 		dev_info(dev, "%s: unable to find %s\n", __func__, prop_name);
@@ -175,19 +180,19 @@ static int ufshcd_parse_regulator_info(struct ufs_hba *hba)
 	struct device *dev = hba->dev;
 	struct ufs_vreg_info *info = &hba->vreg_info;
 
-	err = ufshcd_populate_vreg(dev, "vdd-hba", &info->vdd_hba);
+	err = ufshcd_populate_vreg(dev, "vdd-hba", &info->vdd_hba, true);
 	if (err)
 		goto out;
 
-	err = ufshcd_populate_vreg(dev, "vcc", &info->vcc);
+	err = ufshcd_populate_vreg(dev, "vcc", &info->vcc, false);
 	if (err)
 		goto out;
 
-	err = ufshcd_populate_vreg(dev, "vccq", &info->vccq);
+	err = ufshcd_populate_vreg(dev, "vccq", &info->vccq, false);
 	if (err)
 		goto out;
 
-	err = ufshcd_populate_vreg(dev, "vccq2", &info->vccq2);
+	err = ufshcd_populate_vreg(dev, "vccq2", &info->vccq2, false);
 out:
 	return err;
 }
diff --git a/drivers/ufs/host/ufshcd-pltfrm.h b/drivers/ufs/host/ufshcd-pltfrm.h
index 2df108f4ac13..a86a3ada4bef 100644
--- a/drivers/ufs/host/ufshcd-pltfrm.h
+++ b/drivers/ufs/host/ufshcd-pltfrm.h
@@ -32,6 +32,6 @@ void ufshcd_init_pwr_dev_param(struct ufs_dev_params *dev_param);
 int ufshcd_pltfrm_init(struct platform_device *pdev,
 		       const struct ufs_hba_variant_ops *vops);
 int ufshcd_populate_vreg(struct device *dev, const char *name,
-			 struct ufs_vreg **out_vreg);
+			 struct ufs_vreg **out_vreg, bool skip_current);
 
 #endif /* UFSHCD_PLTFRM_H_ */
-- 
2.34.1


