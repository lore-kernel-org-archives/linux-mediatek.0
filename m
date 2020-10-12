Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59FD1C43467
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 05:36:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F25602078E
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 05:36:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bftPdaG7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QX3Xduyf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F25602078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Zy7HxiYsIY1w9/3zhdJsF43yFPybh0H8C3Wg80rS6cA=; b=bftPdaG7SySYfxdDADl2xpGkZ
	8ls0uTCALC9id06kXZWIN/gCXkFxY6Pd3R7OF3luQK+7oHQBzLHO0L/GMSVjuI/9hm5CU3VPxQbgH
	E3lMlEhqbOYd3jm03SgRdGHRf0pPkWq+NvekZk5kMU7P2WWjKdQlqm7ypPwOfoagBAsBrFWPgmw9z
	AO43xGEVSau54M0uc4JzuVUMCGBLHnIACADzGIZC+7dsuGUDmWtKG+X8RCNXnECIFVDfEokEyy+07
	OEJmo79Q65ybDo+bEUMmC7GdCQpkEKbSSadIP3P69Nc0I+wFlMVWXR7mAdUwTZEgoX8g1DJqBZIYx
	/e1wMB3mw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRqVO-0000hp-7b; Mon, 12 Oct 2020 05:36:19 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRqVL-0000fg-JK
 for linux-mediatek@lists.infradead.org; Mon, 12 Oct 2020 05:36:17 +0000
Received: by mail-pg1-x542.google.com with SMTP id i2so13193368pgh.7
 for <linux-mediatek@lists.infradead.org>; Sun, 11 Oct 2020 22:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NGXxcVkdEIPxLMPM+DjvJ1L3Bp/KN7ULl6Fng8qdl50=;
 b=QX3XduyfaK5fSjHQCSvj2nkIhaFtCrbsbxGTYvDDsk6USd+sgaRveUMyi3ORztJDDg
 nQF8sp444G4IRgwBQSqpikV8zOMWULZM0B/yH3O72CzmCVkGa6RPJuOO/KPKeP08INkF
 5YCMNv6AAMqXcbg9+hKW5C67B0EazAs8yYC3Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NGXxcVkdEIPxLMPM+DjvJ1L3Bp/KN7ULl6Fng8qdl50=;
 b=W2wCLFJUJ8Q4TIhuaHfPTColUHIBtZdQud+Qq+TSJqv63yjTnmAytycnqPb+lseKpN
 BRvhw5vcsMxiACejHeqzzwJeqlu0/NnuHvGKfW26U7g62jHBV1EIKIv3OjBlvzMdxZKe
 LPsjGRJQyFmSvvF3vCk68uQfRhI4AshL1lUPKwO38TZHF8axP3drIWA1ZxFOyBL8dOB1
 EetbxhBCt+XopwYjf211/YwaFbIGhcr27VWCWTOtsIUWMc/rxNWHB/GpV97sjxho5bHP
 o+kP4EJnDsA2/eiWnRg+oTJPHZDpiWlT/rbsRHijVSAOUnGtGixQ08rF9lQXmyqHjaaB
 Zx2Q==
X-Gm-Message-State: AOAM531vVRQ0lcyxYWm03w6RNGUFvG6xdxOdM3ZalwaPyclnE+i8OSrH
 lH3jih3W/ri2Rx+AUY06B62whw==
X-Google-Smtp-Source: ABdhPJw2uksfn73q7EcvJsiYTd4dOgxOV3OXK8WpW8AEjEDE/iUxuK+aS4GEQFS8l9CyQlec74xZNg==
X-Received: by 2002:a17:90a:6d26:: with SMTP id
 z35mr17755363pjj.41.1602480973555; 
 Sun, 11 Oct 2020 22:36:13 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id z1sm17646817pgu.80.2020.10.11.22.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 22:36:12 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 2/2] media: mtk-vcodec: fix build breakage when one of VPU
 or SCP is enabled
Date: Mon, 12 Oct 2020 14:35:57 +0900
Message-Id: <20201012053557.4102148-3-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
In-Reply-To: <20201012053557.4102148-1-acourbot@chromium.org>
References: <20201012053557.4102148-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_013615_697764_AF6AF5C6 
X-CRM114-Status: GOOD (  18.92  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gnurou@gmail.com, Alexandre Courbot <acourbot@chromium.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The addition of MT8183 support added a dependency on the SCP remoteproc
module. However the initial patch used the "select" Kconfig directive,
which may result in the SCP module to not be compiled if remoteproc was
disabled. In such a case, mtk-vcodec would try to link against
non-existent SCP symbols. "select" was clearly misused here as explained
in kconfig-language.txt.

Replace this by a "depends" directive on at least one of the VPU and
SCP modules, to allow the driver to be compiled as long as one of these
is enabled, and adapt the code to support this new scenario.

Also adapt the Kconfig text to explain the extra requirements for MT8173
and MT8183.

Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/media/platform/Kconfig                | 22 +++++++++++++++----
 drivers/media/platform/mtk-vcodec/Makefile    | 10 +++++++--
 .../platform/mtk-vcodec/mtk_vcodec_fw_priv.h  | 18 +++++++++++++++
 3 files changed, 44 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index a3cb104956d5..457b6c39ddc0 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -253,18 +253,32 @@ config VIDEO_MEDIATEK_VCODEC
 	depends on MTK_IOMMU || COMPILE_TEST
 	depends on VIDEO_DEV && VIDEO_V4L2
 	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on VIDEO_MEDIATEK_VPU || MTK_SCP
+	# The two following lines ensure we have the same state ("m" or "y") as
+	# our dependencies, to avoid missing symbols during link.
+	depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU
+	depends on MTK_SCP || !MTK_SCP
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
-	select VIDEO_MEDIATEK_VPU
-	select MTK_SCP
+	select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
+	select VIDEO_MEDIATEK_VCODEC_SCP if MTK_SCP
 	help
 	    Mediatek video codec driver provides HW capability to
-	    encode and decode in a range of video formats
-	    This driver rely on VPU driver to communicate with VPU.
+	    encode and decode in a range of video formats on MT8173
+	    and MT8183.
+
+	    Note that support for MT8173 requires VIDEO_MEDIATEK_VPU to
+	    also be selected. Support for MT8183 depends on MTK_SCP.
 
 	    To compile this driver as modules, choose M here: the
 	    modules will be called mtk-vcodec-dec and mtk-vcodec-enc.
 
+config VIDEO_MEDIATEK_VCODEC_VPU
+	bool
+
+config VIDEO_MEDIATEK_VCODEC_SCP
+	bool
+
 config VIDEO_MEM2MEM_DEINTERLACE
 	tristate "Deinterlace support"
 	depends on VIDEO_DEV && VIDEO_V4L2
diff --git a/drivers/media/platform/mtk-vcodec/Makefile b/drivers/media/platform/mtk-vcodec/Makefile
index 6e1ea3a9f052..4618d43dbbc8 100644
--- a/drivers/media/platform/mtk-vcodec/Makefile
+++ b/drivers/media/platform/mtk-vcodec/Makefile
@@ -25,5 +25,11 @@ mtk-vcodec-enc-y := venc/venc_vp8_if.o \
 mtk-vcodec-common-y := mtk_vcodec_intr.o \
 		mtk_vcodec_util.o \
 		mtk_vcodec_fw.o \
-		mtk_vcodec_fw_vpu.o \
-		mtk_vcodec_fw_scp.o
+
+ifneq ($(CONFIG_VIDEO_MEDIATEK_VCODEC_VPU),)
+mtk-vcodec-common-y += mtk_vcodec_fw_vpu.o
+endif
+
+ifneq ($(CONFIG_VIDEO_MEDIATEK_VCODEC_SCP),)
+mtk-vcodec-common-y += mtk_vcodec_fw_scp.o
+endif
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h
index 51f1694a7c7d..b41e66185cec 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h
@@ -27,8 +27,26 @@ struct mtk_vcodec_fw_ops {
 	void (*release)(struct mtk_vcodec_fw *fw);
 };
 
+#if IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VCODEC_VPU)
 struct mtk_vcodec_fw *mtk_vcodec_fw_vpu_init(struct mtk_vcodec_dev *dev,
 					     enum mtk_vcodec_fw_use fw_use);
+#else
+static inline struct mtk_vcodec_fw *
+mtk_vcodec_fw_vpu_init(struct mtk_vcodec_dev *dev,
+		       enum mtk_vcodec_fw_use fw_use)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif /* CONFIG_VIDEO_MEDIATEK_VCODEC_VPU */
+
+#if IS_ENABLED(CONFIG_VIDEO_MEDIATEK_VCODEC_SCP)
 struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(struct mtk_vcodec_dev *dev);
+#else
+static inline struct mtk_vcodec_fw *
+mtk_vcodec_fw_scp_init(struct mtk_vcodec_dev *dev)
+{
+	return ERR_PTR(-ENODEV);
+}
+#endif /* CONFIG_VIDEO_MEDIATEK_VCODEC_SCP */
 
 #endif /* _MTK_VCODEC_FW_PRIV_H_ */
-- 
2.28.0.1011.ga647a8990f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
