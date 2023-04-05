Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DCAC76188
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 09:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=33253isHt4S+J+nSLFy8mmWQtMLkRh8HjGdIrP7lEuQ=; b=cGkg/zBvHbqLa4Fr9iJuPVurKc
	beQl517G+AekMvKUU78PoAoq7ndPgE2dgM+HEkhy29Kf2uFqvjBqj+rbZtxKx3lQyv+hevBoYDuOb
	tK+IJ62AIidIPqtb9DowyN4V/ie11gI+rwcy+6SK2wfaUXoFc/pwqwNn1/s3etA4MN9FVhBfVQCfz
	AHjhMeBMYZ++9m0aaGcH395Ixy6Jx6q8nUfXe9zRH3klDbz/JN6z8YYGddRfnrqa8Xp57c3RwJ19t
	dhogmqEc9q3fL0NOmYu2LasP2rt8eIt1J7/GPdAf0hPvDzy3JM4rnTlEtxgaI6ZdU8SxgcBjkeUTM
	VEZ7f++Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjzjl-0040Ub-10;
	Wed, 05 Apr 2023 09:47:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjyli-003pgN-0I
	for linux-mediatek@bombadil.infradead.org;
	Wed, 05 Apr 2023 08:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=33253isHt4S+J+nSLFy8mmWQtMLkRh8HjGdIrP7lEuQ=; b=EdzJrOHp8iwUVIzfzNQIL8QfHV
	A6qaBfUs2YFpFM0NJ06obT8HCGjSffDDcuEfOToOWKkgabymaKV2h2aoq2nuWCKiJIW68uanLFuJ+
	OyzczeGrxVdqUlQA3YHZqD9E7/N5JNZcC6FSzoI+8n0rZTLA/CL6gKm7A/Qf9CDjI9K0X4wCOVuOT
	NusursPraI+dTGreU7G5YNBMLco1dZvLwCs5t3tTYFnbohstfdDwiJ+EGlz/SyFH3cfLdu4F0hlnb
	Y2GBnB98mtY4enJfL3brZiA5QTDTtaBvg1nuB4Ke3RfsW7ZN2ICR84fyQNlsgqCOMuWQNKiR1Xq2I
	xgqGd2ZQ==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjyBT-009pUZ-26
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Apr 2023 08:08:40 +0000
Received: by mail-wm1-x330.google.com with SMTP id m8so9465560wmq.5
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Apr 2023 01:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680682078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=33253isHt4S+J+nSLFy8mmWQtMLkRh8HjGdIrP7lEuQ=;
        b=Yc0/OBGpl7E8efDzxB5jgr2ofIfukmILIBfP2QyerHUtDy5nkPLJ3RoLd5pgQS9eZP
         eXgMfqiWxFlb3SGYMfy7+KO33PVHgc5o+iTysoWqWRKVqLAHoUZYn56XnIsnIDxwQspD
         VPZUEktSxHQVUb5SvQnC82cCQue8ELO5rxTkBGzTqhjeleM6aqQFk3q0jtggEjqYGNog
         s2exPDJI4a7khjCU3mqDzSM1BWyOYA2LXjlUFbZFbuLsDRvC3VcNywbTmoxBqSAXwlR8
         uCD7I5dAJNY4TcHBU+MwdrAycwdtxDIypzdNqmiQ8FQaP/ZE5C2/GLT+lc0qVy1rZYHh
         zMcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680682078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=33253isHt4S+J+nSLFy8mmWQtMLkRh8HjGdIrP7lEuQ=;
        b=pnB9CT5cXQiuDdmYYq3delYfQ0jciVTUwyYq2jc3kTwuUQ1UqDQ7h8DL908NLwe1jL
         zP7nfp/0t42xl8mFYr0SIVRR41JUjcHpvu/J00ZkNXVIwTl6mDm6p4euWY2ozNALHRjZ
         IMRO73uQq7GbF2BEqVEycWzQD7jrADaxkm6gI8Q5EB+KLWZ8KpoovKYuhVJSmF1qo3BD
         3qN+sVcp7ZeK6gI8LdUziTzQdu30bSwZthOM24DubSlVgF8AMoJLsCa68XEtfrbVq0eT
         zmZfAfuo0cYdD8q4NtEt4GVXBZ3ugeGZomb+1Vrfb56J1p46yrLyfQSqV1LSyhjXgth9
         fbYQ==
X-Gm-Message-State: AAQBX9cj8blGDMtltRZ1J3avc0eVfOypEOx2aqksk0sX9+kyHdFhWTV0
	6CfTfH0rKRiagxWvCb6N2Ha75A==
X-Google-Smtp-Source: AKy350a6vYxum9a+B7CUUnBSWwVcA/VkgqgawFsnIiacY7QtYMO9m0nHPcUziXUysydrFPVUfZdi4Q==
X-Received: by 2002:a7b:c5c1:0:b0:3ef:67fc:ff02 with SMTP id n1-20020a7bc5c1000000b003ef67fcff02mr4088941wmk.7.1680682078427;
        Wed, 05 Apr 2023 01:07:58 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d4-20020a05600c3ac400b003ee8a1bc220sm1378395wms.1.2023.04.05.01.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 01:07:58 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 05 Apr 2023 10:06:52 +0200
Subject: [PATCH v2 10/10] memory: mtk-smi: mt8365: Add SMI Support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v2-10-60d5fa00e4e5@baylibre.com>
References: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
In-Reply-To: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1318; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=z26cWVr1UM3WDlPLOHdYFNM2IHS6opWfJrlRsd4fTCY=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkLSxTsz6MktT8KmhJmOCte7lvIAMRb5YfYP6mGtBz
 Tuody/mJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZC0sUwAKCRArRkmdfjHURW48EA
 CY1vLd79NTra4MIV+COGshV23I/tjs0l86iK561zWyv6IFf6I6eV4l5XJo9t0pM+H35/79rGeCNZw9
 Ru96C6/1sPUSEK7MccPSyavM/1pMv0VY9DbyFYsoKmcPcNjrAWpiCMTNYhkN/NpMNOPPTRHcBn5Ts9
 lB2jkZkcwEX+aVYIoJY9Nn3lAUyLFs2G4EX5ut430Q52qgF/6tLgXNg9htaYK3BsL4hJkD/jQ0BJaJ
 ezvB8rnPno5pS5W90Bi/MM8R/bCKZn5JQsjw2CGPPEmHFBksYCMrg+1eaQSEvqJlgNYSA8LeDQ87V1
 tKmPavZBUH+5zTRA0boN4bNO6d5e4+CQk8xEoPPQZwFmdtuxyJHhLzad+okWzOyfk7vVd8Rh+oIXQO
 MC1Dz2eRp/sV1QlHsZqJoPLP3wHgTeQG2w5iY6EIGQE50CXQXQ0JAbk0PaZq7FgTXK+bGwVk6Wk8cc
 HVxN57HMFJxvd3gZJaFKPak98NrK0jEA4XAZVF9SftZmO/7dCn7t85UsVSBqck4IkVr0ZW8BFm81vB
 qcgUoLW4uo+NI+9Zfzp059IUV+jdZieNKI1rryphymiuGNSTPH6u9F32VoIjcDVfY8CAX5HvSIrIvH
 CDxM9Aw0ddm8mRxjyK8nevYIlQcbu9RvAlkTtiwjR23FqNevGEdAtFNb2rGg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_090800_084821_99B9D91C 
X-CRM114-Status: UNSURE (   9.17  )
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

Add MT8365 SMI common support.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/memory/mtk-smi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 5a9754442bc7..477b5d1ffd46 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -713,6 +713,12 @@ static const struct mtk_smi_common_plat mtk_smi_sub_common_mt8195 = {
 	.has_gals = true,
 };
 
+static const struct mtk_smi_common_plat mtk_smi_common_mt8365 = {
+	.type     = MTK_SMI_GEN2,
+	.has_gals = true,
+	.bus_sel  = F_MMU1_LARB(2) | F_MMU1_LARB(4),
+};
+
 static const struct of_device_id mtk_smi_common_of_ids[] = {
 	{.compatible = "mediatek,mt2701-smi-common", .data = &mtk_smi_common_gen1},
 	{.compatible = "mediatek,mt2712-smi-common", .data = &mtk_smi_common_gen2},
@@ -728,6 +734,7 @@ static const struct of_device_id mtk_smi_common_of_ids[] = {
 	{.compatible = "mediatek,mt8195-smi-common-vdo", .data = &mtk_smi_common_mt8195_vdo},
 	{.compatible = "mediatek,mt8195-smi-common-vpp", .data = &mtk_smi_common_mt8195_vpp},
 	{.compatible = "mediatek,mt8195-smi-sub-common", .data = &mtk_smi_sub_common_mt8195},
+	{.compatible = "mediatek,mt8365-smi-common", .data = &mtk_smi_common_mt8365},
 	{}
 };
 

-- 
2.25.1


