Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF18C433E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 12:44:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C72F224DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 12:44:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qouZ2pjZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eDW3vgoS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C72F224DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uzirHYGMSOevlsrSnXpbO6Rimyc7pJt2jWdaiv4WOCM=; b=qouZ2pjZgFbx//V13qnXeFsst
	I4x4qH7K01nfaefdxfTmxhMjECp2fyiTM+l0RZEXoubtahVpkE7oInBUOSkZSx9Oa35fUz+QAL2lR
	1WmeObO19Xe2BpohTB6Nu1NjNA6EFDYoG4+4/nzWt58jJnQjh7wBwBtDlwtR+ctc7JZ7TdA6864Gb
	4yUT0hDmIE7Zbp7AiA7lIsBhE9zSnNRPXVzg43yJlUp5GsK7C8btp/WWKVlyO6Rlyzhb/Zk02mH5v
	YPzt0ko8j2dPHrG0D5ra3674ufuOey6Voz6Ptlc96PqCIZIA1G5HZPSNpFnTXUrkju1YGET9qdrVB
	NTf4Sws8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSJfb-0007VL-Vd; Tue, 13 Oct 2020 12:44:48 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSJfa-0007TY-4n
 for linux-mediatek@lists.infradead.org; Tue, 13 Oct 2020 12:44:46 +0000
Received: by mail-pj1-x1041.google.com with SMTP id u3so2126133pjr.3
 for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2020 05:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A1J1FFqE4TaVcT8yK2I3InKcPDjZwlb3XxiGUU1SQgg=;
 b=eDW3vgoS62vHVYJO8n0dz5zs+hzYx5++e5wCZXTPY8p8iKIDgBAfAUEc/l712Uf5Mb
 2LKE2AG9sG/gSvVtVIjwRrkCssw/Nx7cR7snu1hRvKbzDfmKfIIekfgbU7M8ePkz9+44
 AnOEn5Ut2ZmPSSJXCPTRjmEe8YVk0lmOm+u9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A1J1FFqE4TaVcT8yK2I3InKcPDjZwlb3XxiGUU1SQgg=;
 b=P5ATzsDc9ti6he+JU35UX6j5Nn2805HNABS9w74el8QTRWZBKAtdEpj3ywklXixUY4
 MYVMU+lpQBwz7DGjS+h6bKzE96Ez2HGDVpxSgmDitGN83a4/KXL5lrzU7TviPhuFHwZK
 RTviXm58Qx9nUSwE40B9RQat8uUuFCGXk2+xBAvv+P1QXdNcRoU+xVtIrEYs9uLBsDr4
 iI97sh/PCSJyqSzwQ3A+2cw7L23GmhiEho1nnhyvDc3zTH1v8fJyrDisQZIjVIeqDbzy
 W7PpBJnu/UWc16gLay/FsQ7gNs9/uApqRWnqDPXpEv3XCtWeUPEAylOLu1hHyMcgu3LJ
 t1XQ==
X-Gm-Message-State: AOAM532r7odapq6fbFXMlbuz1tbi5y6udZ5mnJzrsaPg6Eq8QVQ8rZrn
 pceLpxw+ZvfEcBfVxZXOFRULiA==
X-Google-Smtp-Source: ABdhPJx+QHG9+ml+rhwLtC/IlzRba159/wBY8WWuYYP7WtIx1xlGmYeYcCA4j+fGgbnhgD0V/3hAtA==
X-Received: by 2002:a17:902:9347:b029:d3:7c08:86c6 with SMTP id
 g7-20020a1709029347b02900d37c0886c6mr26862688plp.84.1602593084449; 
 Tue, 13 Oct 2020 05:44:44 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id b20sm18914536pjo.37.2020.10.13.05.44.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 05:44:43 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v4 2/2] media: mtk-vcodec: fix build breakage when one of VPU
 or SCP is enabled
Date: Tue, 13 Oct 2020 21:44:28 +0900
Message-Id: <20201013124428.783025-3-acourbot@chromium.org>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
In-Reply-To: <20201013124428.783025-1-acourbot@chromium.org>
References: <20201013124428.783025-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_084446_202313_44E14CDB 
X-CRM114-Status: GOOD (  18.79  )
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
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
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
---
 drivers/media/platform/Kconfig                | 28 ++++++++++++++-----
 drivers/media/platform/mtk-vcodec/Makefile    | 10 +++++--
 .../platform/mtk-vcodec/mtk_vcodec_fw_priv.h  | 18 ++++++++++++
 3 files changed, 47 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index a3cb104956d5..7e152bbb4fa6 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -253,17 +253,31 @@ config VIDEO_MEDIATEK_VCODEC
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
-	    Mediatek video codec driver provides HW capability to
-	    encode and decode in a range of video formats
-	    This driver rely on VPU driver to communicate with VPU.
+	  Mediatek video codec driver provides HW capability to
+	  encode and decode in a range of video formats on MT8173
+	  and MT8183.
+
+	  Note that support for MT8173 requires VIDEO_MEDIATEK_VPU to
+	  also be selected. Support for MT8183 depends on MTK_SCP.
+
+	  To compile this driver as modules, choose M here: the
+	  modules will be called mtk-vcodec-dec and mtk-vcodec-enc.
+
+config VIDEO_MEDIATEK_VCODEC_VPU
+	bool
 
-	    To compile this driver as modules, choose M here: the
-	    modules will be called mtk-vcodec-dec and mtk-vcodec-enc.
+config VIDEO_MEDIATEK_VCODEC_SCP
+	bool
 
 config VIDEO_MEM2MEM_DEINTERLACE
 	tristate "Deinterlace support"
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
2.29.0.rc1.297.gfa9743e501-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
