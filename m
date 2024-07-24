Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A00C3DA70
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jul 2024 10:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KdfjRF5sjRfUxm6lspg/bjVePEQBNIdIPjjszwMxeTM=; b=buusGxqEzmMB1Pe0fHTKFGBvKg
	I8n9f7aoes/MCLskFvu+M5fKnD8Edtvm9Ni8xbib42GLuDV7xNhPqMAnTXM+JZiUpeEKxHzgaRCfx
	NY/WWYr1Nop2ZobOxC3sxzw7MBkj+Q6TI14WeoclERFmMXjtDk6nAZ5W+8oAaSFrnurlJ38X8Tlwp
	8R49WeoHVQAzruN5doUieUSZCnPO6ik53iLS7r7Xk/VKOoW3+Z233hhy4uivpAZujpkrkNe8wpU6K
	rfyC4gdRnA2Su0zgeq8GOK8JdYXlywax9TJMpS1RwU/s2v1XQYA6RKdsNDRr8Fy8Fky3T79lfwl5A
	YlY3YxLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWYyR-0000000F2iA-11tD;
	Wed, 24 Jul 2024 10:11:55 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWYyL-0000000F2f1-3HrB;
	Wed, 24 Jul 2024 10:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721815908;
	bh=TFq1Rj0XWofaCPyyni4j1/N7qsuqTiMf2WO89l/rlXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SCduKJlteMqo9M0bZTDxi3rS9ZEwdrhCR2J+4WWKhazltyn8wz3XkvMGGXf0IMPjj
	 AlsotlPN7LBT8e9/PvxIQxh9Qba9SvvPNQcqtbC0BMQaAh6RPyUePK58K8xknYA5NE
	 V+/sAXhvse3914CWmSQAuaOnumMfbn2vsHIQpNdFuIKYCKhp2PGnaDd4JiJAhEfWy9
	 UlZ730xNAKNm7BrBsDmmxbqWUedr8aZu3m8XV1EdIDtvB8yhKPNYe7T9boP5p85eyG
	 M7JTzK+z8dp5Xn0k1G2n9AeKc9oRS/MeviXLicIB46SEhJOiFOgGuhaCBVf4rMa2lL
	 tprO4HQuRwHFA==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 7B69837812FA;
	Wed, 24 Jul 2024 10:11:45 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	deborah.brouwer@collabora.com,
	robdclark@gmail.com,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 1/5] drm/ci: arm64.config: Enable CONFIG_DRM_ANALOGIX_ANX7625
Date: Wed, 24 Jul 2024 15:40:04 +0530
Message-ID: <20240724101015.523535-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240724101015.523535-1-vignesh.raman@collabora.com>
References: <20240724101015.523535-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_031149_970393_A28D50B2 
X-CRM114-Status: UNSURE (   8.48  )
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

Enable CONFIG_DRM_ANALOGIX_ANX7625 in the arm64 defconfig to get
display driver probed on the mt8183-kukui-jacuzzi-juniper machine.

arch/arm64/configs/defconfig has CONFIG_DRM_ANALOGIX_ANX7625=m,
but drm-ci don't have initrd with modules, so add
CONFIG_DRM_ANALOGIX_ANX7625=y in CI arm64 config.

Acked-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - No changes

v3:
  - No changes

v4:
  - No changes

v5:
  - No changes

v6:
  - No changes

v7:
  - No changes

v8:
  - No changes

---
 drivers/gpu/drm/ci/arm64.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index 4140303d6260..66e70ced796f 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -187,6 +187,7 @@ CONFIG_MTK_DEVAPC=y
 CONFIG_PWM_MTK_DISP=y
 CONFIG_MTK_CMDQ=y
 CONFIG_REGULATOR_DA9211=y
+CONFIG_DRM_ANALOGIX_ANX7625=y
 
 # For nouveau.  Note that DRM must be a module so that it's loaded after NFS is up to provide the firmware.
 CONFIG_ARCH_TEGRA=y
-- 
2.43.0


