Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829A6C79F8C
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Sep 2026 06:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=86ZMXQ7rWbd5+Kz4WmVDnIj3yBwaLGUiWHIv6rRn9PQ=; b=2pdD4F25muALAESuw72rmgic8H
	+i6LNfqFGbqycCak45Fxs+s11JkKZSLMw2UlaJ6L8AGdl5L6U7YQ8ZoQTNr+2dFpDMpxT8hNw3Gqt
	CfVMbnoS54132PqG6oyfHDrDZ2sjH96t/FL/Sy0unLB0AoeiYHtMRtIAjxs+g6IBKHkgtlbyMx7rY
	g2HN0sGbxEmP7CBHn2SCQwSLL5vpV70MFycXBNWSt0ZOLaL1Z3jyu9hFpdaKTaE12wjSL5TQADKXx
	d7dMKpiSOc/W4VqRZwbXy+w315oEpDSHpoOjtYmpXcoA2cbLOO6DalInJEMrrWw/EzTKol0Q//uyE
	8kxRsHCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36D5-00000004k22-1Jb7;
	Sun, 06 Sep 2026 06:18:35 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x36Cx-00000004k0Q-1JpW
	for linux-mediatek@lists.infradead.org;
	Sun, 06 Sep 2026 06:18:33 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2d9004f39d3so30007725ad.2
        for <linux-mediatek@lists.infradead.org>; Sat, 05 Sep 2026 23:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788675506; x=1789280306; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=86ZMXQ7rWbd5+Kz4WmVDnIj3yBwaLGUiWHIv6rRn9PQ=;
        b=b0IwIOQlcEc9MqVA/NsomIJsRzEzCNW9lsOaFQA4qjotvbQjtwy9RJIVs/w93ffqf7
         lYL7Ng78WvQhFat5VYU5Eeu6vaWLFfrAR7bCajqTbclmk+yTCm2PAf53y2HR0BK2rcb1
         ok06B2L3rJK4jl33/urzhy2H2xHykKOeQpv1Ub1K5bQjchib6IVsJ6vHmvNNUMnqd3MX
         GSQRh7yDFxCEqWfK+1oPJnxUoTPdsV0gEFXOlkQ44SyNDlYhr8Y5nSEZwfPm+bVmrRx+
         rgex1ND5N6cVXLDrtZ/5cK+qHwXbcpVC4Ax8Mi2Trtl+XyspynulRE8irOX/bBCYxmXg
         Q2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788675506; x=1789280306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=86ZMXQ7rWbd5+Kz4WmVDnIj3yBwaLGUiWHIv6rRn9PQ=;
        b=dXhW7FYsT/lfr7ziNTMcp+XAr/ahPVPfrdkOr+oa1+XGfqOtTGXCZiB05uKutqyVyM
         y+uEonL1HNAqBIqNEXGCQIyUbZCsAtdwVuIo61aVNeNaem2Sfv0cXkt+LWWoV0Vzt/Jk
         5LL2TuE1V/xUB7wT+KHOcoBW903dV5gIJhjVSrjJtFcXKHSy5FfkFGvgCLAv1EoWhj5D
         7aHK5QVpChlkeNXMAlS0n1ezhyPEiMNISeu0uzSd+zrLTUwaikALkJQdqtsX4gKfFltf
         uwZaJOfdPwrFylXv9UGVhZ4V7boRJuTH4o1315emdEOsv1eDvcXiakmzkTzkdBw265qS
         FW8g==
X-Forwarded-Encrypted: i=1; AKwUvBy77WBfaQ27bKzKSnQwN7BqSgDT/lcLJ2OxWGYSJ6FNeo90Qq6k11TmTT0i6TKmSy3mq14QjMeZ+6OFILAYSg==@lists.infradead.org
X-Gm-Message-State: AFuF++k7/Kpt6kNHBmB87VHggh42ol/mHSdlBhngp9D5LUi9RRQE8lor
	BQtlEEGGvxq6KnFIEYnBghE9CkCWjXgWie8KAcQu8BetXR9v/4Ps3RJS
X-Gm-Gg: AYBFou1M5+03rVUkZWexUfwwHkTO7+VwblUGIxS969p1nO4iVrvThvylk8JSemRhB+7
	hHfRNKWlevMzKjntxjrcjeMbAznJarF4R/H8Wb0CvtMOpdO38f6p57QBXjoXDVSK78K2/Rkm9P4
	wLWif+zoPpMHNAJkoFbSr56Dgbl4OqOI71sM4h82wz9SW1ZXnPbLOU6p6P2/io3nhNNeLo+KvXR
	v5hj8FQFe+WshqZCy6m0r9813rrdC1qYp4XY9j4NS2cxgScvTxbhkuwM9AhCjDhX2Zs1klBj6He
	SnCd9NH1eM3dT7UNdwQCfNBRZvvOAr7PeaHuu2aBgngHpqHAus/nWZqjkjvEQYwPlIzOw/4gvEt
	2V5YDdAD2jiG7QzfrCB/pMBlEkXIbPVoQzcO9kEXmac93bpL9mcQ7YeBiKvhQS7DUNSby7bs+Y0
	D0PZsrh/jx7fJBUF7umP6H4MzqQZgz3DzV9kwa/8ElG0ngMAaagRbqLpytS2s=
X-Received: by 2002:a17:90b:4c4a:b0:398:bc52:825b with SMTP id 98e67ed59e1d1-39b2624c32amr22181806a91.21.1788675506361;
        Sat, 05 Sep 2026 23:18:26 -0700 (PDT)
Received: from gmail.com ([58.84.62.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm18280405eec.12.2026.09.05.23.18.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 23:18:25 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
	krzk@kernel.org,
	peter.griffin@linaro.org,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com,
	cw00.choi@samsung.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sven@kernel.org,
	j@jannau.net,
	marcan@marcan.st,
	casey.connolly@linaro.org,
	sre@kernel.org,
	wens@kernel.org,
	t.schramm@manjaro.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sumeet4linux@gmail.com
Subject: [PATCH 1/5] powercap: intel_rapl: Use %pe to print error pointers symbolically
Date: Sun,  6 Sep 2026 11:47:50 +0530
Message-ID: <20260906061755.5103-2-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260906061755.5103-1-sumeet4linux@gmail.com>
References: <20260906061755.5103-1-sumeet4linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_231828_064688_1461F8D1 
X-CRM114-Status: GOOD (  11.51  )
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

Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
to pr_debug() and dev_err(). The %pe format specifier prints a symbolic
error name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled,
otherwise it falls back gracefully and prints the raw integer value.
This makes messages more readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/powercap/intel_rapl_msr.c  | 4 ++--
 drivers/powercap/intel_rapl_tpmi.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/powercap/intel_rapl_msr.c b/drivers/powercap/intel_rapl_msr.c
index a34543e66446..46972ee1ff84 100644
--- a/drivers/powercap/intel_rapl_msr.c
+++ b/drivers/powercap/intel_rapl_msr.c
@@ -582,8 +582,8 @@ static int intel_rapl_msr_init(void)
 	rapl_msr_platdev = platform_device_register_data(NULL, "intel_rapl_msr", 0, def,
 							 sizeof(*def));
 	if (IS_ERR(rapl_msr_platdev))
-		pr_debug("intel_rapl_msr device register failed, ret:%ld\n",
-			 PTR_ERR(rapl_msr_platdev));
+		pr_debug("intel_rapl_msr device register failed, ret:%pe\n",
+			 rapl_msr_platdev);
 
 	return 0;
 }
diff --git a/drivers/powercap/intel_rapl_tpmi.c b/drivers/powercap/intel_rapl_tpmi.c
index 73f36d9c09b1..6baaad3c59ef 100644
--- a/drivers/powercap/intel_rapl_tpmi.c
+++ b/drivers/powercap/intel_rapl_tpmi.c
@@ -408,8 +408,8 @@ static int intel_rapl_tpmi_probe(struct auxiliary_device *auxdev,
 
 	trp->rp = rapl_add_package(info->package_id, &trp->priv, false);
 	if (IS_ERR(trp->rp)) {
-		dev_err(&auxdev->dev, "Failed to add RAPL Domain for Package%d, %ld\n",
-			info->package_id, PTR_ERR(trp->rp));
+		dev_err(&auxdev->dev, "Failed to add RAPL Domain for Package%d, %pe\n",
+			info->package_id, trp->rp);
 		ret = PTR_ERR(trp->rp);
 		goto err;
 	}
-- 
2.43.0


