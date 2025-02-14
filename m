Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77696C021A6
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2025 00:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:MIME-Version:Message-Id:Date:Subject:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tF6nQiuAoGdDRaxi4ffFK8y97AsM0p7biyz4jaKoW/4=; b=3Vb1r+CbYpjQfNGU3Rzyw2+Atx
	HwaUM5A8uF8UVCZfDPU/qawN8RdVzhhL94DJe+h1TaRiN55ojjG6U1gpE1DZjuiZwgu+wyIU6DvSs
	FHAw823RxlWm9hJNxYJj7Vn+Lz5daa4M4ZbnZfi/eNgknObcJP2Rcn98E4PaIx/ZcsIXMUI2mksjW
	M5y/9oeKyli4zWykX2FK/TYdrLPKUoch6188NoYi7/HqqCVrkeGx2EBMYf+vMGk96T7JjAKRiYy4P
	Hi6LfVR278R6FjCpQcxc8fndPntDT0dkKfax3r0vkkvQ45X/gaLGh86a26gaLABIWm6c6KOdvjsFn
	nPmxa8Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tijQr-0000000D28j-1Wph;
	Fri, 14 Feb 2025 00:19:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tijQo-0000000D26R-1L3P
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Feb 2025 00:19:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739492383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tF6nQiuAoGdDRaxi4ffFK8y97AsM0p7biyz4jaKoW/4=;
	b=edHck6GM6Ax684no8GM1g5cVYNRPbnfu8eyKtQq5sQLHoGjaiSaOkCzrDCtMW+koOz9ERK
	VGp30ErPdpn62ANkoGnon/XH3xp3SFKVAmx5A2jzg/P4nSJzlkaQbJlNIuD1rpGj3wx8Sp
	/TxhpgsD6/7m7qR8iHnueheoQY5s1Hs=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-300-zfNw4zUWPoCPxlmZ-VC4NA-1; Thu,
 13 Feb 2025 19:19:41 -0500
X-MC-Unique: zfNw4zUWPoCPxlmZ-VC4NA-1
X-Mimecast-MFC-AGG-ID: zfNw4zUWPoCPxlmZ-VC4NA_1739492375
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 73DD9180087D;
	Fri, 14 Feb 2025 00:19:30 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.199])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9123019373C4;
	Fri, 14 Feb 2025 00:19:16 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Subject: [PATCH 00/12] drm: Move to using devm_platform_ioremap_resource
Date: Thu, 13 Feb 2025 19:19:13 -0500
Message-Id: <20250213-mem-cocci-v3-v1-0-93466d165349@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAKMrmcC/x3MQQqAIBBA0avIrBvQCSG6SrSIaapZqKEQgXj3p
 OVb/F+hSFYpMJsKWR4tmmKHGwzwtcVTUPduIEvekhsxSEBOzIrPiJ6dFXKeZDqgJ3eWQ99/t6y
 tfbaoKWFeAAAA
X-Change-ID: 20250213-mem-cocci-v3-5c10e2152e8f
To: Joel Stanley <joel@jms.id.au>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Alexey Brodkin <abrodkin@synopsys.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>, 
 CK Hu <ck.hu@mediatek.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739492356; l=4546;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=RYl8F5/aPh8ikJsFxMU1SMqP5uI28pqwHX8dD7l8K/U=;
 b=WnxWQhBi5C/L81rTjcUFFGzsRo89PrH4LR3kqQyjFGJ7KK2bxR5gH52AZgGYsQJmH1QxT+UZU
 m56uJ8jVm3wDxtsSjBgC7XvMz5uL+Ep+Zw75J7pRo4h0Sv4qNV2Ryxi
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 91-TBipccAeIUhgMcOaBP_wM6rT9trP4jBZJBIVJXv4_1739492375
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_161946_424314_36FC759C 
X-CRM114-Status: UNSURE (   9.90  )
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

Start replacing the below occurences with the newer API:
- (devm_)platform_get_resource + devm_ioremap_resource
- (devm_)platform_get_resource + (devm_)ioremap
- platform_get_resource_byname + devm_ioremap
Move all these occurences to uses devm_platform_ioremap_resource
instead.

This is v3 of the series. Changes from v2 [1]:
- Keep the old snippet of documentation and add further
clarification (Thomas)
- change in vc4 driver for the a resource is not needed.
Add a comment to clarify why that is left behind (Maxime)

[2] - https://patchwork.freedesktop.org/series/144073/

Used Coccinelle to make the code changes.Semantic patch:

//First Case
//rule s/platform_get_resource + devm_ioremap_resource/devm_platform_ioremap_resource
@rule_1@
identifier res;
expression ioremap_res;
identifier pdev;
@@
-struct resource *res;
...
-res = platform_get_resource(pdev,...);
-ioremap_res = devm_ioremap_resource(...);
+ioremap_res = devm_platform_ioremap_resource(pdev,0);

//Second case
//rule s/(devm_)platform_get_resource + (devm_)ioremap/devm_platform_ioremap_resource.
@rule_2@
identifier res;
expression ioremap;
identifier pdev;
@@
-struct resource *res;
...
-res = platform_get_resource(pdev,...);
<...
-if (!res) {
-...
-}
...>
-ioremap = devm_ioremap(...);
+ioremap = devm_platform_ioremap_resource(pdev,0);

//Third case
//rule s/(devm_)platform_get_resource_byname + (devm_)ioremap/devm_platform_ioremap_resource_byname.
@rule_3@
identifier res;
expression ioremap;
identifier pdev;
constant mem;
expression name;
@@
-struct resource *res;
<+...
-res = platform_get_resource_byname(pdev,mem,name);
<...
-if (!res) {
-...
-}
...>
-ioremap = devm_ioremap(...);
+ioremap = devm_platform_ioremap_resource_byname(pdev,name);
...+>

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
Anusha Srivatsa (12):
      drm/aspeed: move to devm_platform_ioremap_resource() usage
      drm/fsl-dcu: move to devm_platform_ioremap_resource() usage
      drm/hisilicon: move to devm_platform_ioremap_resource() usage
      drm/mediatek: move to devm_platform_ioremap_resource() usage
      drm/mxsfb: move to devm_platform_ioremap_resource() usage
      drm/sprd: move to devm_platform_ioremap_resource() usage
      drm/sti: move to devm_platform_ioremap_resource() usage
      drm/stm: move to devm_platform_ioremap_resource() usage
      drm/tegra: move to devm_platform_ioremap_resource() usage
      drm/tiny: move to devm_platform_ioremap_resource() usage
      drm/vc4: move to devm_platform_ioremap_resource() usage
      Documentation: Update the todo

 Documentation/gpu/todo.rst                      | 13 +++---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c         |  4 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c       |  4 +-
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c    |  4 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c |  4 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c       |  4 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c       |  4 +-
 drivers/gpu/drm/mediatek/mtk_disp_merge.c       |  4 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c         |  4 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c        |  4 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c              |  4 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c             |  4 +-
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c         |  4 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c               |  4 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c               |  4 +-
 drivers/gpu/drm/sprd/sprd_dpu.c                 |  9 +----
 drivers/gpu/drm/sprd/sprd_dsi.c                 |  9 +----
 drivers/gpu/drm/sti/sti_compositor.c            | 10 +----
 drivers/gpu/drm/sti/sti_dvo.c                   | 10 +----
 drivers/gpu/drm/sti/sti_hda.c                   |  9 +----
 drivers/gpu/drm/sti/sti_hdmi.c                  | 11 +----
 drivers/gpu/drm/sti/sti_hqvdp.c                 | 10 +----
 drivers/gpu/drm/sti/sti_tvout.c                 | 10 +----
 drivers/gpu/drm/sti/sti_vtg.c                   | 10 +----
 drivers/gpu/drm/stm/ltdc.c                      |  4 +-
 drivers/gpu/drm/tegra/dsi.c                     |  4 +-
 drivers/gpu/drm/tiny/arcpgu.c                   |  4 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c                  | 54 +++++++++----------------
 28 files changed, 51 insertions(+), 172 deletions(-)
---
base-commit: 68763b29e0a6441f57f9ee652bbf8e7bc59183e5
change-id: 20250213-mem-cocci-v3-5c10e2152e8f

Best regards,
-- 
Anusha Srivatsa <asrivats@redhat.com>


