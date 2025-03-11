Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506CFC28B2F
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Mar 2025 15:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gtRbDS6fDgM8XxC/AJXySQKuvpMlmaYYWC0kn/IkeIg=; b=AV5geiZ6MOLYxDnvkaVldLREN2
	AmVZrUSouu/R6G9lB34ZGAomETAqAg5XeYSjNXlRW4AHrnUXp6a91RqwYi5bxmu59hDdpyRYGNAAf
	qeZefwGiG6dHom7kl48b3ESzO9SMb20SfFn5Z5eW0ml1jshd8jEfTn6TcisdJNEBBRlFNlKGVWsia
	9sF7+Kh0i/qNv8NIqjejE2byXKEXQb0wvju9987c33GHTWVB4xmd2N1zjkjS9bMvwLNlHyodYQ18m
	gqKxghmaQIFbK1DsrA4MVRrFaOMirlTlxC8IEc62u9ZPbEsMX8VlU4v0eEDZ8psEe+DVwfUR6vir+
	ajXZ20PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1wT-00000006DUk-2E0W;
	Tue, 11 Mar 2025 15:54:53 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1wQ-00000006DT8-34u0
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Mar 2025 15:54:51 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B15E8210F4;
	Tue, 11 Mar 2025 15:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741708487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gtRbDS6fDgM8XxC/AJXySQKuvpMlmaYYWC0kn/IkeIg=;
	b=BGoZODh98b6GhN3Bz2SpP/ZKwjqeurg03noBYn8Gctwq4S8uceZjTxlXC5lxNyRSowPPWu
	FsF/N5qS6BciXPxaHIooDQdLnT7sSETAvN27PeFZxjpfO6TeyZatwDabYXWYOiOiPnOSNq
	gsDCmYcCN4VFuBXQieJpP6iz/cbIy7E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741708487;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gtRbDS6fDgM8XxC/AJXySQKuvpMlmaYYWC0kn/IkeIg=;
	b=/2RlqKuG8buhgFxNjGATCt4+IrPiXxDTF9ghcLzNxss9u3SJFmzGKghROw7/HyPi4svMiE
	rIRSxbQoH+g78ZAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=BGoZODh9;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="/2RlqKuG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1741708487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gtRbDS6fDgM8XxC/AJXySQKuvpMlmaYYWC0kn/IkeIg=;
	b=BGoZODh98b6GhN3Bz2SpP/ZKwjqeurg03noBYn8Gctwq4S8uceZjTxlXC5lxNyRSowPPWu
	FsF/N5qS6BciXPxaHIooDQdLnT7sSETAvN27PeFZxjpfO6TeyZatwDabYXWYOiOiPnOSNq
	gsDCmYcCN4VFuBXQieJpP6iz/cbIy7E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1741708487;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gtRbDS6fDgM8XxC/AJXySQKuvpMlmaYYWC0kn/IkeIg=;
	b=/2RlqKuG8buhgFxNjGATCt4+IrPiXxDTF9ghcLzNxss9u3SJFmzGKghROw7/HyPi4svMiE
	rIRSxbQoH+g78ZAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 22E68134A0;
	Tue, 11 Mar 2025 15:54:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id P6cZB8dc0GdUdQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Tue, 11 Mar 2025 15:54:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: simona@ffwll.ch,
	airlied@gmail.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	geert@linux-m68k.org,
	tomi.valkeinen@ideasonboard.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	xen-devel@lists.xenproject.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 00/25] drm/dumb-buffers: Fix and improve buffer-size calculation
Date: Tue, 11 Mar 2025 16:47:04 +0100
Message-ID: <20250311155120.442633-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B15E8210F4
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[ffwll.ch,gmail.com,kernel.org,linux.intel.com,linux-m68k.org,ideasonboard.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[21];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_085450_923042_132489C3 
X-CRM114-Status: GOOD (  11.02  )
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

Dumb-buffer pitch and size is specified by width, height, bits-per-pixel
plus various hardware-specific alignments. The calculation of these
values is inconsistent and duplicated among drivers. The results for
formats with bpp < 8 are sometimes incorrect.

This series fixes this for most drivers. Default scanline pitch and
buffer size are now calculated with the existing 4CC helpers. There is
a new helper drm_mode_size_dumb() that calculates scanline pitch and
buffer size according to driver requirements.

The series fixes the common GEM implementations for DMA, SHMEM and
VRAM. It further changes most implementations of dumb_create to use
the new helper. A small number of drivers has more complicated
calculations and will be updated by a later patches.

v4:
- improve UAPI documentation
- document bpp special cases
- use drm_warn_once()
- add TODO lists
- armada: fix pitch alignment
v3:
- document UAPI semantics
- fall back to bpp-based allocation for unknown color modes
- cleanups
v2:
- rewrite series
- convert many individual drivers besides the shared GEM helpers

Thomas Zimmermann (25):
  drm/dumb-buffers: Sanitize output on errors
  drm/dumb-buffers: Provide helper to set pitch and size
  drm/gem-dma: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/gem-shmem: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/gem-vram: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/armada: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/exynos: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/gma500: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/hibmc: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/imx/ipuv3: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/loongson: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/mediatek: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/msm: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/nouveau: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/omapdrm: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/qxl: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/renesas/rcar-du: Compute dumb-buffer sizes with
    drm_mode_size_dumb()
  drm/renesas/rz-du: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/rockchip: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/tegra: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/virtio: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/vmwgfx: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/xe: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/xen: Compute dumb-buffer sizes with drm_mode_size_dumb()
  drm/xlnx: Compute dumb-buffer sizes with drm_mode_size_dumb()

 Documentation/gpu/todo.rst                    |  28 +++
 drivers/gpu/drm/armada/armada_gem.c           |  16 +-
 drivers/gpu/drm/drm_dumb_buffers.c            | 172 ++++++++++++++++--
 drivers/gpu/drm/drm_gem_dma_helper.c          |   7 +-
 drivers/gpu/drm/drm_gem_shmem_helper.c        |  16 +-
 drivers/gpu/drm/drm_gem_vram_helper.c         |  89 +++------
 drivers/gpu/drm/exynos/exynos_drm_gem.c       |   8 +-
 drivers/gpu/drm/gma500/gem.c                  |  21 +--
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  25 ++-
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c      |  29 ++-
 drivers/gpu/drm/loongson/lsdc_gem.c           |  29 +--
 drivers/gpu/drm/mediatek/mtk_gem.c            |  13 +-
 drivers/gpu/drm/msm/msm_gem.c                 |  27 ++-
 drivers/gpu/drm/nouveau/nouveau_display.c     |   7 +-
 drivers/gpu/drm/omapdrm/omap_gem.c            |  15 +-
 drivers/gpu/drm/qxl/qxl_dumb.c                |  17 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |   7 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |   7 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  12 +-
 drivers/gpu/drm/tegra/gem.c                   |   8 +-
 drivers/gpu/drm/virtio/virtgpu_gem.c          |  11 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c       |  21 +--
 drivers/gpu/drm/xe/xe_bo.c                    |   8 +-
 drivers/gpu/drm/xen/xen_drm_front.c           |   7 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c             |   7 +-
 include/drm/drm_dumb_buffers.h                |  14 ++
 include/drm/drm_gem_vram_helper.h             |   6 -
 include/uapi/drm/drm_mode.h                   |  50 ++++-
 28 files changed, 449 insertions(+), 228 deletions(-)
 create mode 100644 include/drm/drm_dumb_buffers.h

-- 
2.48.1


