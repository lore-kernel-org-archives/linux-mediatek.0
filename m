Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE32DC88E53
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Sep 2026 19:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ji3o+ulSbP+i9U1/Xrwb9df+nl0gS/1m0flRPEBpn8=; b=WcPpqWg1eqKvXaSb1Gpf3Ynplz
	RMdPfPn/TrWj28kEvjJZV0UPhq9tMpwvKsGRbtorSeWtQ+hHaM8jFtFHRvOO5zewZsBIAwgf/2L9t
	WlOoWfm7ty/6bnmQZo0bjf1Q4CiLNvoCgn1NUTmuoC1tQOe4+bJ98+e1K+1PEyJlK+0FQzKNGQizp
	ISsI3wCv2lKOvQK8Yy5n6pZ1JPXC2Muqxqq9hqXE4bIb8n7UxY6mqOsjhNZHhjsbzbCw5NJkcioxz
	l2hWy3vtcBBlBy2eRvxjiHEdq+ok5EpZIw747FVHaaGJRsB6RGvSlTTvH2tx4n0tzKelhnN3l5gxH
	hhGDBNDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5T9a-000000015tT-3lKU;
	Sat, 12 Sep 2026 19:12:46 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5T9Y-000000015rv-2nFB
	for linux-mediatek@lists.infradead.org;
	Sat, 12 Sep 2026 19:12:45 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccda24a3so615427a91.0
        for <linux-mediatek@lists.infradead.org>; Sat, 12 Sep 2026 12:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240364; x=1789845164; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ji3o+ulSbP+i9U1/Xrwb9df+nl0gS/1m0flRPEBpn8=;
        b=OB1kjzRmtz/KdctT5oOuIoFQcCcgWClUoHC/+jjzMnsHajXKBFu1y1TbJQtcpf6n7c
         DidPrhn0VotXnPNFh1Ry9RXTeGVMEcxP4WhjNMcGmaKebrwl4HyDMuaHAwMaeCYG/9jb
         THZk9TTcBdgprBZ6qWtPp9H5zQ0zCawnmXiN5ZtKqKl9dfGUajtE9UuBcmH/AOZz9bgZ
         MnYL+e+dlTCHMGK5nLiASoAABcYBany6T4FEICGJn8tu0TJ2oJev1Uc+qJasgMB+RwVO
         WQrU3dUV7NmXEqOTuX8CRZ9pm1TsJ412e1E1wjpzltFOnvpZ3UqyBC6uORbjXU2oP6Yu
         MB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240364; x=1789845164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4ji3o+ulSbP+i9U1/Xrwb9df+nl0gS/1m0flRPEBpn8=;
        b=N4XKtKy6gJ/Cbe6rtx7js+cFflpmVOn+2WUSnlb+lgiBXX6uMqjnSmel/cUhQvA+gv
         UPZrCNrzgcPUnp5FR3Czqmo+DNvZxt6oK+Jt0li9snN+47ZtQ8Zlikqmf2HokMMwZLFj
         wYKyqtidSeR3Ro3KZfrALJHixYrP8yJE/5/9QBFVn2lh9S9rgq5nIzUIQyCZ6T80clGg
         J2C15KqpwoFha4dNU+6ZFyVs15H1T6ppQQLBL/nmTQb78f/nK/pju0pDMcHfFt7L2Eu5
         GIkuFw9MEKbUmbrLmtWTlrz0/kSOf3HF980w2BBw7D0V/Hwn5cGu7Ia57yfYHnF0x01F
         wSLg==
X-Forwarded-Encrypted: i=1; AKwUvByxomyQrW3RXSpUv3FsfBeNRLpYChXtPrzCBNjtTCn5JRweqvbHLM0vAOSBwzUTvQl8XMFfDR0qWQJvha9sIQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nuyJG3nev1PxnorS51bFJVHqUnVgilnr6lCQLuUW4HvjSIgRkE
	MiG8KlbABNGm1I2dr9ksmy8pilSDf55Jf0sqhGVsyoc0DJiCjwLvFlu/
X-Gm-Gg: AYBFou3EuMet4mdRX0iL08NpLuUsHCCoHqtmfgYBwyXMhNJS2K0a2CXCiIA0tjnAKQO
	3hGvtM/h8Zm1JsikmwdgvJBpkTyyBtK8iwue6IOk4q6h/BfvVJ1fMGV6RZs0fZmiVnivvxd1Gtd
	RdsMJ6iORCarwWW76P7GPbIdbzjuE0Ip/3/JJ6l84tQGycx3zyFI2bnTOMLkCycNQECXQSu4ZG8
	W1k+FZgqACII9MBowqRkzfcG46GCQ7Af15QiYTfALbqw84JfefRnSLxROMa+yhk6CCHf3HyxCR7
	73s1QfZI4rFhN3qNyu73UmKBNamwQa+vvnCgBo14OgTaBy1ZJitu/R8j49LcB7qGUGBYODo8cAH
	qjYaqWzqyZBa8yAMBC3ZkwBzYUEjwdlfqsgh+mbi/KMVAybyVtK2cXqL05gA5fRsiCNep0qR2UZ
	uQegxda0tNlnMGpb+ylOjF4vmWPCxpeHgjsn6qkYtKN0KlBYCk8dqyGzbHDX32dno7Hye8
X-Received: by 2002:a17:90b:498c:b0:39b:2b10:d05c with SMTP id 98e67ed59e1d1-39d9bbfa327mr18115862a91.5.1789240363673;
        Sat, 12 Sep 2026 12:12:43 -0700 (PDT)
Received: from gmail.com ([58.84.61.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b348cbsm14722239c88.3.2026.09.12.12.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 12:12:43 -0700 (PDT)
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
To: rafael@kernel.org,
	krzk@kernel.org,
	amit.kachhap@gmail.com,
	daniel.lezcano@kernel.org,
	thara.gopinath@gmail.com,
	talel@amazon.com,
	hayashi.kunihiko@socionext.com,
	mhiramat@kernel.org,
	mmayer@broadcom.com,
	viresh.kumar@linaro.org,
	sumitg@nvidia.com,
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
Subject: [PATCH v2 2/5] devfreq: Use %pe to print error pointers symbolically
Date: Sun, 13 Sep 2026 00:41:52 +0530
Message-ID: <20260912191156.185448-3-sumeet4linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912191156.185448-1-sumeet4linux@gmail.com>
References: <20260912191156.185448-1-sumeet4linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_121244_701586_42FA963B 
X-CRM114-Status: GOOD (  12.38  )
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
to dev_err(). The %pe format specifier prints a symbolic error name (e.g.
-ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it falls back
gracefully and prints the raw integer value. This makes messages more
readable without any functional change.

Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
---
 drivers/devfreq/imx-bus.c    | 4 ++--
 drivers/devfreq/imx8m-ddrc.c | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/devfreq/imx-bus.c b/drivers/devfreq/imx-bus.c
index 49798f542d68..dba76d8b9e5a 100644
--- a/drivers/devfreq/imx-bus.c
+++ b/drivers/devfreq/imx-bus.c
@@ -75,8 +75,8 @@ static int imx_bus_init_icc(struct device *dev)
 	priv->icc_pdev = platform_device_register_data(
 			dev, icc_driver_name, -1, NULL, 0);
 	if (IS_ERR(priv->icc_pdev)) {
-		dev_err(dev, "failed to register icc provider %s: %ld\n",
-				icc_driver_name, PTR_ERR(priv->icc_pdev));
+		dev_err(dev, "failed to register icc provider %s: %pe\n",
+				icc_driver_name, priv->icc_pdev);
 		return PTR_ERR(priv->icc_pdev);
 	}
 
diff --git a/drivers/devfreq/imx8m-ddrc.c b/drivers/devfreq/imx8m-ddrc.c
index 52beeb5b7d65..28d7c595fa17 100644
--- a/drivers/devfreq/imx8m-ddrc.c
+++ b/drivers/devfreq/imx8m-ddrc.c
@@ -340,8 +340,7 @@ static int imx8m_ddrc_check_opps(struct device *dev)
 	for (i = 0, freq = 0; i < opp_count; ++i, ++freq) {
 		opp = dev_pm_opp_find_freq_ceil(dev, &freq);
 		if (IS_ERR(opp)) {
-			dev_err(dev, "Failed enumerating OPPs: %ld\n",
-				PTR_ERR(opp));
+			dev_err(dev, "Failed enumerating OPPs: %pe\n", opp);
 			return PTR_ERR(opp);
 		}
 		dev_pm_opp_put(opp);
-- 
2.43.0


