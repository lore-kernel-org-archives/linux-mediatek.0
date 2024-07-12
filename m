Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94F4C2BD09
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jul 2024 09:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7utu3QJC8mTbNTdqRZCsAKUoFWS0ymxi/xXdoh70jcE=; b=sAxSpqqVB2ONLC5i63ii2Bfikz
	kwu9QH1jANSNkephwVPauz9yrfhHY63zXdlCReFPiUTa9flOS2oPMPHYQ2WjJ9g5hd/QS2emLD6X6
	iKWx83chqT2XJeSNvtsDXThIugvJwo/miWRjytnqt9thB1FbOlwgy3IWFQJ1xAsKcmtdxIxxUNve4
	Uc1XZeC7ll5KvDykCH90wp/5CaCf9mU3YWgE4A8S4qTnX2X6XDC3/C6G9tXasPjqN0iB4uvtO5ORk
	rbpa9ZB2y/lDSBqoz6CWeBCMmGq3awSgdecums05vNblYzZFWPjOgd6Jx6X4iXYfzVvOKEdZA044u
	BOC43fJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSCP4-0000000H3UV-1DkU;
	Fri, 12 Jul 2024 09:17:22 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSCP0-0000000H3Rc-03hU;
	Fri, 12 Jul 2024 09:17:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720775836;
	bh=wFLcljlhEltmQSod5ZN/H9JvR5/jrjC4cd8jdXQmAVY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=4NUpWcrOPyYjbEjqNr1E5QC4hFir4s1GF2bJmq4hBt7c8NPyfSdk5dHZpDDYolXLF
	 mOx96WWg/+2GmQwZzZSEroyIVwUAi+CVUeSr8mnPnocfsUzZxQDZRAdXGYYGFd15eR
	 LYgCKegF4uvKiJtZTIVHF4nmy76RTd39NCUsF7XWuOuT5O/vemBb0cmeQzc3b79wgy
	 vVNOfPe3wwuJctGGssqxKm1aV7MlVlzqWuoHVPkztOgf90hQWcmpVLq+KXpKOTu7NB
	 x7Z66UQDYi+kC4taVha3rN/gIdoC9Vxt69mVts4aa3RnZxBNXyHbM4ndfmVpxk/PzF
	 +mY3Zx4MrAAew==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C785B3782211;
	Fri, 12 Jul 2024 09:17:13 +0000 (UTC)
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
Subject: [PATCH v7 1/5] drm/ci: arm64.config: Enable CONFIG_DRM_ANALOGIX_ANX7625
Date: Fri, 12 Jul 2024 14:45:45 +0530
Message-Id: <20240712091549.56635-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240712091549.56635-1-vignesh.raman@collabora.com>
References: <20240712091549.56635-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_021718_199890_3AC8D27D 
X-CRM114-Status: UNSURE (   8.22  )
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
2.40.1


