Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912CBCD1284
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 08:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JkEX43/yNDpmgM1f3ofWewEiI6V0mjt3jeTLzl4BOWY=; b=uKZ8oKhgONoIypzd/9uK6WO8py
	Qp72VTzI1FHSVOg0QQJ1J8XRRv/5mCD3I2F+r44K3ZPOw6aQsKDFJxX/N5iowVHlxk150CxCm/3JH
	KhDRnoXBgoiyPB+MfxLQSRUOd3ehLEc0vstPiTlWvDxOI6DblCZfz4a/kxIpgn5iiR///kJR9dZdI
	oH547a0aibE7NPSW2gEfX18EXsSD5fsTDw5rfGzzHn6Xh6iUhBCDC3Pzg/8MZ6OqylYsxZxJon8vq
	VyIINMfqv2IIer7vrFMXDiGIwWx+3cOdsHUZJ7F3st/sh1RRjRgKwRYqCKy2MptDUeCHxX7Ub3JSj
	zg51i6oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru6ce-00000000tTg-06yD;
	Tue, 09 Apr 2024 08:14:28 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru6cZ-00000000tRl-3xtD;
	Tue, 09 Apr 2024 08:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712650462;
	bh=z5AaZgRdCHKMFiwqPoJfl7Drtx40Uhi+HYFqiKBiDZc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TAT/PqQJVMseLBdzIEdVoYbzVayfhEZ1XQ0s2DYOBN0z9ekIq1UEsHJ/hEyY9BWA/
	 BvfluflROD5gCqjZvtn7gOCI7ptVhmwadVg/YxsdvV6fB/v02AMQMTglXhRNMFTqTt
	 g1gt05UWsowgejj+Di3b8p/i96lJTNtqis+3Zz8lY/9E6UBb+VRVWVTFSL+cl9wjm/
	 Iz50LKFsoEDD7nNGKvLKKhYNHLvvBqts+hMrQ+nWeTsJZk7okiAWkL1LzFljYnUpCy
	 40fdeo0ZM734STDfndruUJbm9Sic3yRYat/g7NB/BQtNG4SLKhC0k7GhnmWhAskX1s
	 8gDkAZfsUgeGQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DA4D637820E2;
	Tue,  9 Apr 2024 08:14:18 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	emma@anholt.net,
	robdclark@gmail.com,
	david.heidelberg@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	hamohammed.sa@gmail.com,
	rodrigosiqueiramelo@gmail.com,
	melissa.srw@gmail.com,
	mairacanal@riseup.net,
	mcanal@igalia.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/8] drm/ci: arm64.config: Enable CONFIG_DRM_ANALOGIX_ANX7625
Date: Tue,  9 Apr 2024 13:43:22 +0530
Message-Id: <20240409081329.472463-2-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240409081329.472463-1-vignesh.raman@collabora.com>
References: <20240409081329.472463-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_011424_160216_C9999C21 
X-CRM114-Status: UNSURE (   8.11  )
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

---
 drivers/gpu/drm/ci/arm64.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index 8dbce9919a57..37d23fd7a367 100644
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


