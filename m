Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 688B6CD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 13:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x3Y56dDS984KsDzs2nzTKgy6adBy9joM/agCd66RARo=; b=hJj7y4AVJ3ADkgLL+cCehx+BY0
	5apVqJUETvtowcBk2Yl464+ZAMBrf3pYYW0Q78In9IoAxtZDiK0jPk7jyZrCOvtJeaIRkp5iDBrS8
	JnMBSqXuUg8NaTgGvC/B3Ce3QLn0eaBF8L9XKiENprPXrMJzi2zNRRDdLIPWdxnTWmZTUNP6ersnb
	4WtWGIvQhZ8TnI94ZRvrkLgIzGBC2mCUpEhToJLrv+Raaxcjo9UnVKVFUfYkr2qLZnGG1yVAm+kSr
	j8ZLbIew2u2oNutIKI9uZqUf4qKhP4pfmsihVRxeVZ6Cl7o+L5ocfNjtYGoUSZYIYSkJJJSM8TIm3
	5/n4hbvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXbY-000000071t7-0NAW;
	Wed, 10 Apr 2024 13:03:08 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruXbT-000000071ru-2OSE
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 13:03:05 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1e3ca4fe4cfso28865465ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Apr 2024 06:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712754181; x=1713358981; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x3Y56dDS984KsDzs2nzTKgy6adBy9joM/agCd66RARo=;
        b=k8uQIb+TsvHAr8xRR4TUELDrC+2NqtGQaGty7StZ+0w+zBvOIIKP/LRPut1uBthmSy
         j8khV0r3jB0I9k1V1WSGoo/ViznvbwxY8qCspnEvvjPgiHr6PKwkqxs+DCi7tk48YZaK
         q9LecDWJRLp3OvWHafpvvLNRgOh13clYSbuvo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712754181; x=1713358981;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x3Y56dDS984KsDzs2nzTKgy6adBy9joM/agCd66RARo=;
        b=ARctpq+PgjJAhZb1gZBdyQqKlN25iwx6uFvQEtID+V2n41P2rqfdVJLttl//kGddg2
         TXybL5UuoP4x98VmzBmI7LAEMJpkB3AagA15qn22gXjkPXvXiDRyIQYGp7e/EDMZ1jij
         yllWPQW1AjlOIOdeuOlq0OgHAs29D2Kr3J0NXi5QF4Ku/yDXlC0GL4OZPqkt3NJQGpuA
         qr3e279uefv9Hx/OGvZ8zb9e7tzYcbO7+nojrBg3a1rpaMMaMzDWHEi4J4yrMUakz35U
         9yrU7z7d9Yknk5er9p6UISHxAijM26GSDv9XixfgLdDFPbV2xcnDz/UV2yj8s4hMn/kv
         qiUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLfjI9RR13/AixOSAB54Y53TgLF2OcXMhKOQ+kFIQ/5QxUoV3C00zENeLdKX9N3AxYHbf5ShAf1emVWLVYEAkrsTiIyK91KL00WNuv8HgCwsyO
X-Gm-Message-State: AOJu0Yyb6/nP0D3+pFWOpZ82EObVALbVD0oOLlSRncCrtxgMNp1+qCgT
	yhBzrb7u6Qns0TwBFhBfiJJ+TOEqqLmc9L05jw3wbB8HPLJ3AAmj8nkt239cWQ==
X-Google-Smtp-Source: AGHT+IHqZzwYa8MxtXFxj041lgd7J88+1a1m5BQKJBRqUvFpLKeI9bdlPRTEzn2uQM5glqcDtWs7AQ==
X-Received: by 2002:a17:902:fc48:b0:1e4:10d9:5dfb with SMTP id me8-20020a170902fc4800b001e410d95dfbmr3179942plb.38.1712754181302;
        Wed, 10 Apr 2024 06:03:01 -0700 (PDT)
Received: from yuanhsinte1.c.googlers.com (88.216.124.34.bc.googleusercontent.com. [34.124.216.88])
        by smtp.gmail.com with ESMTPSA id kq12-20020a170903284c00b001e29acb2d18sm10726341plb.4.2024.04.10.06.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 06:03:00 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 10 Apr 2024 13:02:48 +0000
Subject: [PATCH v2] thermal/drivers/mediatek/lvts_thermal: Add coeff for
 mt8192
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240410-lvts_thermal-v2-1-621cb7c07a32@chromium.org>
X-B4-Tracking: v=1; b=H4sIAPeNFmYC/3XMQQ6CMBCF4auQWVvTFgrqynsYYrBM6SRAzRQbD
 eHuVvYu/5e8b4WITBjhUqzAmChSmHPoQwHWd/OAgvrcoKWuZKWkGNMS74tHnrpRlH1Zm1PVdNY
 5yJcno6P3zt3a3J7iEviz60n91j9QUkIJRCMf+mxVY+qr9Rwmek3HwAO027Z9AUg9I3KrAAAA
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
 Balsam CHIHI <bchihi@baylibre.com>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_060303_685465_74878B9E 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

In order for lvts_raw_to_temp to function properly on mt8192,
temperature coefficients for mt8192 need to be added.

Fixes: 288732242db4 ("thermal/drivers/mediatek/lvts_thermal: Add mt8192 support")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v2:
- Reusing mt8195 coeff instead of creating duplicate definitions
- Link to v1: https://lore.kernel.org/r/20240410-lvts_thermal-v1-1-ee50b29c1756@chromium.org
---
 drivers/thermal/mediatek/lvts_thermal.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index fd4bd650c77a6..4e5c213a89225 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -1530,11 +1530,15 @@ static const struct lvts_data mt7988_lvts_ap_data = {
 static const struct lvts_data mt8192_lvts_mcu_data = {
 	.lvts_ctrl	= mt8192_lvts_mcu_data_ctrl,
 	.num_lvts_ctrl	= ARRAY_SIZE(mt8192_lvts_mcu_data_ctrl),
+	.temp_factor	= LVTS_COEFF_A_MT8195,
+	.temp_offset	= LVTS_COEFF_B_MT8195,
 };
 
 static const struct lvts_data mt8192_lvts_ap_data = {
 	.lvts_ctrl	= mt8192_lvts_ap_data_ctrl,
 	.num_lvts_ctrl	= ARRAY_SIZE(mt8192_lvts_ap_data_ctrl),
+	.temp_factor	= LVTS_COEFF_A_MT8195,
+	.temp_offset	= LVTS_COEFF_B_MT8195,
 };
 
 static const struct lvts_data mt8195_lvts_mcu_data = {

---
base-commit: 20cb38a7af88dc40095da7c2c9094da3873fea23
change-id: 20240410-lvts_thermal-3d365847acff

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


