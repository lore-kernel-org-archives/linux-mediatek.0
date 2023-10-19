Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BD6CDB483
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 07:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Btj4/2SuIRWGYNLQEl2+Bana67xfcszfzav37y1hs9M=; b=GnNP7dSwZptMI+7jqZKLKtW73Q
	JSscVf86giM7mj19yX6qbhdMPCMEon3CQ4AdE4zmDEcNsOtlP+2ZGaBw7FxMARrigtd9d9GugqNp7
	Np84XxWQNr7jC2m4nq8TmBMSho3Ehr2XN5OU4c1Ey+DfauyJFV/0d/YkNs5OfIAF6XabM4Ubn1kyH
	ZaoexwDk2hdr3Wb4enZ/yYyByY3M6iu0733TjIcax90qWWnug2QzGFaRHk+8sLX6t0FMU5LTw/okK
	EQEG5GVBFjRec29POk8LnAAL0iiltnjMrR4Q/rPMn1d1yex4Xl0A37E1cjzO2TLl1hyaDTrVR2+qI
	fD7JbvLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtN7y-00GZWN-1K;
	Thu, 19 Oct 2023 07:07:30 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtN7t-00GZTZ-2u
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Oct 2023 07:07:27 +0000
Received: from localhost.localdomain (unknown [103.93.195.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4CB326607328;
	Thu, 19 Oct 2023 08:07:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697699244;
	bh=+yq8SDifpHFGM+z+52kWgVFrOGBSyt5wsGw6fbaU1ls=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HPmSwk1V8xp7g4ejnUQOPno06sQBxmTqUpCGl1OicESL8WJ5cn76Jbs6pUsd9jrAx
	 dEHVGPZn4UA9C/MEYJAxw0HsY8sk+Z1j9tpH0RTpZ8XL8Cz4B66IWRGXrO2eKvT8HG
	 pBWCf/Rzm7oT1Q2MuXHuwCZL1FQl8ia7qSDG6wlit9aHGJolvRlMDTrpfs4ofOA89X
	 pf0CnjW/oowDBbC7BaU2UkQy2saCTnnQJr9g4uP3jod7hbNA9s/HgyJXzsVOyc4pgN
	 i9sgNQgqfwqT+C/wncgqnXMeyrKybWn7HDrjfRM6st1stoPKqRCDt7mBJolcZV3dXD
	 mwwb+60x5xcVQ==
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch
Cc: david.heidelberg@collabora.com,
	sergi.blanch.torne@collabora.com,
	guilherme.gallo@collabora.com,
	daniels@collabora.com,
	gustavo.padovan@collabora.com,
	emma@anholt.net,
	robdclark@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 3/9] drm: ci: Enable regulator
Date: Thu, 19 Oct 2023 12:36:44 +0530
Message-Id: <20231019070650.61159-4-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231019070650.61159-1-vignesh.raman@collabora.com>
References: <20231019070650.61159-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_000726_071147_178E2B78 
X-CRM114-Status: UNSURE (   7.80  )
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

Enable CONFIG_REGULATOR_DA9211=y to fix mt8173 boot issue.

Acked-by: Helen Koike <helen.koike@collabora.com>
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - No changes

v3:
  - Remove CONFIG_RTC_DRV_MT6397=y as it is already enabled in defconfig

v4:
  - No changes

v5:
  - No changes

---
 drivers/gpu/drm/ci/arm64.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index b4f653417883..8dbce9919a57 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -186,6 +186,7 @@ CONFIG_HW_RANDOM_MTK=y
 CONFIG_MTK_DEVAPC=y
 CONFIG_PWM_MTK_DISP=y
 CONFIG_MTK_CMDQ=y
+CONFIG_REGULATOR_DA9211=y
 
 # For nouveau.  Note that DRM must be a module so that it's loaded after NFS is up to provide the firmware.
 CONFIG_ARCH_TEGRA=y
-- 
2.40.1


