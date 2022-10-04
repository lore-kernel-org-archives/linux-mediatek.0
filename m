Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CBEC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Oct 2022 10:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCHhyl70uAm4FbUL9mwyr19eGZ4dPDjyDFd/jrFReLo=; b=1ah+XC/Mm9CDnw9aa34HWgSo0Q
	DN9vlLxWFaHJ5oE6jtHrSk1cpOHZLkm/I6e2/LzLzVqm71BSIoc8n7kr2/zhsKuZ+YP78h3joiVOW
	gN3LNTDqASbYXJ5GNwuPbLbdtmejUQ3OjaASseAhGGjWAhH5hCXCMvNqoc45RQ18dzaECseIAbYSY
	af3RkdOxQspi300hDPnM0OJvCzlIUTSyvoYr5SqPHW0xkS2eIxvfmRmTDvfWNVbnNPHnSvnkC6NBs
	Pin6tvzVzyrKGy3MoTcym+r/kD+JfMzLM7DPpRAqbIm7/c1IdSbTzT907njs8vMgESyaKCyNRUaWE
	s54+UKfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofekc-009GIZ-3o; Tue, 04 Oct 2022 10:02:10 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ofekM-009GA7-NK
	for linux-mediatek@lists.infradead.org; Tue, 04 Oct 2022 10:01:58 +0000
Received: by mail-wm1-x334.google.com with SMTP id p36-20020a05600c1da400b003bd24ccae2eso525052wms.3
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Oct 2022 03:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=UCHhyl70uAm4FbUL9mwyr19eGZ4dPDjyDFd/jrFReLo=;
        b=fh3UfVbpdDeet/1XCkYWjg2/E4PiuHeDTJQd2hoe+94nACRvwOpOjzXKKpG/SdugwH
         kS81FUAqWb2I9Qv3zxN8iikHgCoUOxow06tYiAaYLyANwhWMQe/QSbp2sjqfUp+dFP7O
         ri/R1rLhuvBRfmfYzEklHSn9Vsa4RJtdARStFddh2SYBG9kRosE6C18fcVyegbFSh7E/
         nogpSKVd7v/BtGxISWOIZPJA/oRTQeTTRj3a/wJWVCjOVNTdjPUeWQT8Xy1zPxum1tPp
         b2+s8gVMbL4+tgazq0nE0Hh5QnNepHSbi4+cylfEr1Ykbn9+bfdh/UdWdGWkj8eSPOd7
         qimg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=UCHhyl70uAm4FbUL9mwyr19eGZ4dPDjyDFd/jrFReLo=;
        b=1xd2GoA7KpQWQMVn1zY/Yo3/3W677GI+FFlwb+cYjxiz1wT/vzjmiLwhAMj7qI5YCu
         TFBR6XWiVS/wPo30EGCtsn9KCqnY3SD0aVh3tP2q8PwPZ9gr4VRaxG3HrBRpX9EXLQG1
         uQsdOirInaukTMlab2YGnJlIEf0KSQmMOVhm7jX6NQmEqo53jhQL3LKrUEP+EEims+Xb
         IF9P05d/I1v9e1urwfhIqkzgyh3CGCKR+iRcwa8qiudDu7KlYSSqffzpTuQWLzDXDOwf
         Az+307lJkv5SvGSp8mRlLobQVYv2SyVEWc+bb3McE38lA7A2LBKDEQAmyH3+ik4OsjfM
         PRqg==
X-Gm-Message-State: ACrzQf0bdMVeI6kZRsJH8P+H69bN7j4C9EbuzkMUW3H2gwT+ifKzY20d
	KlADaZHnm+235sze4GbxknR+WA==
X-Google-Smtp-Source: AMsMyM7yAfzXC1KQcXOqONXs26gOwP9cvOo+9AGcMS4RfHc3wJ2L1C3VSCFQa/HL28Dt92Xi5bmQtQ==
X-Received: by 2002:a05:600c:4fd1:b0:3b4:c00d:230a with SMTP id o17-20020a05600c4fd100b003b4c00d230amr9327609wmq.62.1664877712628;
        Tue, 04 Oct 2022 03:01:52 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d3-20020a5d6dc3000000b0022e3cba367fsm5473645wrz.100.2022.10.04.03.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 03:01:52 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 04 Oct 2022 12:01:41 +0200
Subject: [PATCH v2 3/3] iommu/mediatek: add support for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221001-iommu-support-v2-3-dbfef2eeebc9@baylibre.com>
References: <20221001-iommu-support-v2-0-dbfef2eeebc9@baylibre.com>
In-Reply-To: <20221001-iommu-support-v2-0-dbfef2eeebc9@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Fabien Parent <fparent@baylibre.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>, devicetree@vger.kernel.org,
 iommu@lists.linux.dev
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1834; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=gxfKtOcvwaqvfxbBFQC1V9d4zYH8j2MMwYTDkwSvA64=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjPASL1Deu6Z2zUrYCapL6mHfzitqM2lCpSojrm1ZA
 FReZPU+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCYzwEiwAKCRArRkmdfjHURZUGD/
 9O7uNTCvNAEKKImI7SsasH1T+l0x/ce701ne1kIqklNfeP/U44HmutCEmxEUnam83dDuM8705t9l1T
 nFpn8NIAvLZ+pxn1+UuBHimCFs8R+CzPaMBQbeX9moANniY0a8UjHDwr1BrTfxyJeooP9nnwatyqwh
 YK1X2Kdzv0sv4QLz3vdC8DUBjDD4/82gDc4qfN3mQmsbneZR4NU8BMXd+NNoP0p6voRIvVoj9KEibU
 4l+6w+WPpLziPQPUhLYNs/WsDOWrg67S/pU/AhSgXYKoAm6/SnasDMc4M0AndwCVnnVAkYR9nqBB38
 iDeeZKXzPp27BFvkUi07tkywwGknAG7Io7byvmyP28wDWoDvJGWsV4vY6kMdBMumxa4RbyjyIm63vR
 6lo2acvS6CRUkx9QtWWsCQDhItHwqKUec5Hia2xidfFEmWy1j42jdBm29FHJXLOewfXNz1lga+bjsK
 7aX2h7ZevTDEq+1k1nD9YuFYTRcXFiTGVgkPO0qDPH+6HIfMv7+u593LPpef/AQRk+86zUDnFPDvOj
 MG+en9irRvaumGU+vnwdhEGhaz2iRfxpTN7oZoeSbyZE1DGfSmsEjkkNP3tZZbGXplI8yq1bMMdF5/
 U+TAiTFa4DRPmXssdkT/K3LORzI2RN1rctlJabAVBHirP3hQp1lamp91EWBA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_030154_809369_ED88F40B 
X-CRM114-Status: GOOD (  10.52  )
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

From: Fabien Parent <fparent@baylibre.com>

Add IOMMU support for MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Tested-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/iommu/mtk_iommu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index a57ce509c8b5..ce8c9660208e 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -167,6 +167,7 @@ enum mtk_iommu_plat {
 	M4U_MT8186,
 	M4U_MT8192,
 	M4U_MT8195,
+	M4U_MT8365,
 };
 
 struct mtk_iommu_iova_region {
@@ -1531,6 +1532,18 @@ static const struct mtk_iommu_plat_data mt8195_data_vpp = {
 	.int_id_port_width = 5,
 };
 
+static const struct mtk_iommu_plat_data mt8365_data = {
+	.m4u_plat	= M4U_MT8365,
+	.flags		= RESET_AXI,
+	.inv_sel_reg	= REG_MMU_INV_SEL_GEN1,
+	.banks_num	= 1,
+	.banks_enable	= {true},
+	.iova_region	= single_domain,
+	.iova_region_nr	= ARRAY_SIZE(single_domain),
+	.larbid_remap	= {{0}, {1}, {2}, {3}, {4}, {5}}, /* Linear mapping. */
+	.int_id_port_width = 6,
+};
+
 static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt2712-m4u", .data = &mt2712_data},
 	{ .compatible = "mediatek,mt6779-m4u", .data = &mt6779_data},
@@ -1543,6 +1556,7 @@ static const struct of_device_id mtk_iommu_of_ids[] = {
 	{ .compatible = "mediatek,mt8195-iommu-infra", .data = &mt8195_data_infra},
 	{ .compatible = "mediatek,mt8195-iommu-vdo",   .data = &mt8195_data_vdo},
 	{ .compatible = "mediatek,mt8195-iommu-vpp",   .data = &mt8195_data_vpp},
+	{ .compatible = "mediatek,mt8365-m4u", .data = &mt8365_data},
 	{}
 };
 

-- 
b4 0.10.1

