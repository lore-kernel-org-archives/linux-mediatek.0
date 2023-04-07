Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7A0C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 08:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HxTQKNVO9ztRpkc2329fvzZfgl6sigcHzow48LG+lXo=; b=4C900gAuRx6su/vsbNfoMzj9Oj
	ceAfA805qCAOkbm75WOticqSPUwCB4hnBZA8gFR4WKkNwGfq+my1+jlVFpr7X3XIOczuht+BhLm8R
	JFwXiQDLJHcbH/o5cbi93IATo20gTPTjJ8It6eLZ8uH9SCfW1Ar5YfYAefkKZPAaN6xth7MMutZko
	ofMc/Ff8rJCq+1YlPpuRZrogStTBpfWr4dWJ61rDDTLC1O2Q5hK2NZCoaHTLXU/cKfxQFuyWePqsQ
	gk9pBRF6nZctF0tyaV8i+ATuCTc1V9CKA+yfHxzicMD9akyfeFVvn1uNrFAA0tyMdbgyieebWrg28
	LxhTHAvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkhd2-009WrY-1l;
	Fri, 07 Apr 2023 08:39:28 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkhcx-009Wpp-0L
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 08:39:26 +0000
Received: by mail-wm1-x334.google.com with SMTP id v14-20020a05600c470e00b003f06520825fso4049670wmo.0
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 01:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680856760; x=1683448760;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HxTQKNVO9ztRpkc2329fvzZfgl6sigcHzow48LG+lXo=;
        b=8EVqZbtwbu2U8jJnTEzeZJ6A3/1LVcQdXSOpDE1X2virde+vRsRuh5k4MOeGCVlLSq
         7bBNCuHF9EILDe1lh1YuPbfZ/Tm49+ELdcYK+otsxjS/ErOP7XQAqZxGGOfNmv+Aid+/
         iMHsCYIryW4MAc9FV1G21UrlviNwEWrn6/wWNl19K4eVsk4ZWFGL1va1ZSoK9h5gLAKL
         KhMddTMytwK7+pyXXAD73Ttxv7tF4rHq7Acjy1bbynrCVL90wLvPYIP3PcudbNmRu++Y
         if6otrvaW8jx5xzowv4trDqD/cZfkyoMg60uMC83769+LT2CWPAQjdq1L7Jk4308EjdW
         6XmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680856760; x=1683448760;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HxTQKNVO9ztRpkc2329fvzZfgl6sigcHzow48LG+lXo=;
        b=6RA7hymxqtv6jkV7MIUWbsTRAqgk9bja03Q4rKmyQ7l2HneCKoF/cwB7/+ekNyKSI6
         NlxeirtlRzjv6BtZ4fAMEqhlykndX4TKBYwjPQzx8+kLUIzTchCa+98lslkxU3xfkl2I
         wcpb5hndEoPMmNsZDYN+IRZ4JW4Z3JeBWPq8aRhRclO95zI2nDDeipIXDBzdi53npJia
         Y32RO28iKHVBc6Ha0MH0ag8MCIu4HhJ7gHLOI+w+Q019kNWBkjjg1MNZUxbibP3/iP52
         IjVkr8IITtRf4hFmnvtVcF+VNaeGpkpwRhrn7sfRubmr96NxagulecurtbDwRLNGo1Me
         XSSA==
X-Gm-Message-State: AAQBX9ehImuJ4Ffe8BoSPtgJ2fgVkO7Pd5SrTm0QrbbK17ewkpAD44QJ
	h6nIfHBP+TNnKi5tYROCIN+pjg==
X-Google-Smtp-Source: AKy350Y1Ehajm7UApJN7ryVi+4T2kEuIMc+7Kv4o6f6TbSLPCsAdGmenWYJaFR2ifclFI2eQsY9hWA==
X-Received: by 2002:a7b:c7c6:0:b0:3ef:8b0:dbac with SMTP id z6-20020a7bc7c6000000b003ef08b0dbacmr754509wmk.31.1680856760582;
        Fri, 07 Apr 2023 01:39:20 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f5-20020a0560001b0500b002cfe3f842c8sm3960362wrz.56.2023.04.07.01.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 01:39:20 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 07 Apr 2023 10:39:18 +0200
Subject: [PATCH] memory: mtk-smi: mt8365: Add SMI Support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230407-smi-driver-v1-1-036d6d8e8993@baylibre.com>
X-B4-Tracking: v=1; b=H4sIALXWL2QC/x2Oyw6CMBBFf4V07aS1GjH+inHRxwCTwNBMW2JC+
 HeLy7M4955dZRTCrF7drgQ3yrRyg+ulU2FyPCJQbKyssTdzNz3khSAKbSjQP63tjX9EZ1E1wbu
 M4MVxmE6lJh1mdFwTJOJQZAZPHIlHXdZEQS91LgQDulKl/XDBUVw5A9pYEhzo+y97f47jByB8S
 0WpAAAA
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1858; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Oj9DT/lxZQLpb1GTgR0bpejsWFy9jETdEDcuOZxmHV0=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkL9a3x7Lq9N1F0ungt3avZJRtAYDeq+QGgEX5jK3j
 Pbm4r92JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZC/WtwAKCRArRkmdfjHURVXbEA
 CEZLQQUxpRnEoF4/T62/ae1W5bCjIO+y/d6AFlnAnp94WB1hMZS5NbG9lSKpAaG0+OYJOtQJ63EiIx
 tZ4/l0iKwp4h07FUFsHEnmnnE2suaE7/oH+T8JO9zTpsOuf+dq21DvSBFQVXL1VMFRFrEl7HW+AwNb
 I0FUhB7oUMbg9GCfhAVRNHTt1Kc1X3RjAQYO4h6vDN8zSrIImN8+IgMy8XMTCwdygLlycgEa6erC0y
 6qypcFXMrWeSfpX9jx/MTvDGm/8ngNeM7tHqi75D+i3hH7bVhcw7eqhR+Ncq7LKGsF4LhJWvU7pdRc
 e1SOxnXDhqL9nU0Awb7/WhBEkmPowWYBPd6VbX9G6dPkB2H2JXe1M9PmnZYlK9bnvLHEaRux31ffTZ
 mtv5sIf+mrt4Okwk+Kt6EhnkCQLJGLdFRMDN9sXb/1Lr6GgOjdRYMmwyaqFBLN7ZbQb/g7jLMqP1K0
 tAPETkWe921rHHMwxDIooGWZal/2e48AkuoihMykVA28Ej2yr1OgFntFCTMzpy6hhOwwcZ8/NqErR3
 XF++a0KwYlAWfNwVLzawTrqmdn/89UXCos2Wcmdz6zupWewMS20nJLwa1m1IAuSXfX4rgDeOC8REba
 wDlcX526m3z/NeRVQ1uVsnuzuM8NwnUg14n8LOI8p+z91YUt9XTjMqsP/9zw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_013923_372017_00C50ABC 
X-CRM114-Status: GOOD (  10.04  )
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

Add MT8365 SMI common support.

Reviewed-by: Yong Wu <yong.wu@mediatek.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
This serie add MT8365 SMI common driver support only because, to be
bisectable and avoid issue, this driver change and the related change in
the DTS should be applied in the right order (driver first).

Here the related DTS change: [1]

Regards,
Alexandre

[1]: https://lore.kernel.org/all/20230207-iommu-support-v2-7-60d5fa00e4e5@baylibre.com/
---
 drivers/memory/mtk-smi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 5a9754442bc7..6523cb510518 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -713,6 +713,11 @@ static const struct mtk_smi_common_plat mtk_smi_sub_common_mt8195 = {
 	.has_gals = true,
 };
 
+static const struct mtk_smi_common_plat mtk_smi_common_mt8365 = {
+	.type     = MTK_SMI_GEN2,
+	.bus_sel  = F_MMU1_LARB(2) | F_MMU1_LARB(4),
+};
+
 static const struct of_device_id mtk_smi_common_of_ids[] = {
 	{.compatible = "mediatek,mt2701-smi-common", .data = &mtk_smi_common_gen1},
 	{.compatible = "mediatek,mt2712-smi-common", .data = &mtk_smi_common_gen2},
@@ -728,6 +733,7 @@ static const struct of_device_id mtk_smi_common_of_ids[] = {
 	{.compatible = "mediatek,mt8195-smi-common-vdo", .data = &mtk_smi_common_mt8195_vdo},
 	{.compatible = "mediatek,mt8195-smi-common-vpp", .data = &mtk_smi_common_mt8195_vpp},
 	{.compatible = "mediatek,mt8195-smi-sub-common", .data = &mtk_smi_sub_common_mt8195},
+	{.compatible = "mediatek,mt8365-smi-common", .data = &mtk_smi_common_mt8365},
 	{}
 };
 

---
base-commit: ea2dcf9394947d5d8e24cb9d52144923f6645632
change-id: 20230407-smi-driver-782270b6da2e

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


