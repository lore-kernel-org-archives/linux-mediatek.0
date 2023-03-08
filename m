Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78421C64EC4
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 15:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rJPmzdZE4NSQdkz7wFZ0jochMCQuk6LumCoRhBy4k2I=; b=L2xnYF+DY7krauWgZ6yoc3K7ND
	razbwBwOqnoQNMYP/OMls1cCGpfyTJNoysohWNAESMUauyYPTblLm6nAVCo+BsV6QvZrKehGKHHmj
	lwgQxbgxR7i1o5n1zsDkypTOqF0A0r4Jb5ev5HQtuRKIIntgg9Y8aUlAtB6w/akskxYsnfnnK0uuL
	rnmEgZkgsaJxvf2CPuBjGvTHrXnhCh+sh2ZECtmZXE3UNBqc9lqYmqa8Ybd6uORd3Cx8b07SvnJ9w
	5rNnpOmz6K4KTG8hM2ocewumtrPh4C9fMz4mqWn90oSNkRQpuinAQ9fV0LSJlYCcLCfu5o8pb+TIq
	hWcaDCnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZvoB-005j6Y-EE; Wed, 08 Mar 2023 15:34:27 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZvo6-005j3L-Ll
	for linux-mediatek@lists.infradead.org; Wed, 08 Mar 2023 15:34:25 +0000
Received: by mail-qt1-x82f.google.com with SMTP id r16so16820380qtx.9
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Mar 2023 07:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678289657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rJPmzdZE4NSQdkz7wFZ0jochMCQuk6LumCoRhBy4k2I=;
        b=VakQlAXPBwXadUCnmy2qfP2seck4Mcu4X2hhm8QJIhsMasnL/ScseQIP6fkikJJauh
         r4z9bsiNUoCTbjYA9jN0bdUho8reXLT9yzOseDXTgEIddxl1Gk2gocrTKU7QZTQ2Ezve
         IvZU5EFRkzm2GELvjrkQMbVjAziM8VazNi614=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678289657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rJPmzdZE4NSQdkz7wFZ0jochMCQuk6LumCoRhBy4k2I=;
        b=EWnIgvE6ydInKGEntCUB1erJN095rN+49PAjJGHtZAOiD8h/eXjYpOZX90k7Dwdvk1
         B/Hl0e8v+gcI4JxLpflT5WlxCR0jMHHD79qrXULM9AjbUx1Bc6qNzj+ARFDA89YhLQgE
         ch6Wp7boxpvTmIANskkoCQ3fD5Jl0x8ZmQKpvIqbbbQ+LgrW8aERkYj9tg4N/VSSxVYd
         tKkPGC/7dwG/yxv19ZM2cDx3GVVpDk4VjUC6/GG4FeZfIIcPr3+8zYIL37Op0iKbgUVy
         iAyjKX9VT1WRA++QFQKcXYmDXDApnfmjDE1IBMmbsUPKpjPphXSQAXHvTXeUn/UEmhtz
         zHJA==
X-Gm-Message-State: AO0yUKWbJ2WZCfIFdAGhaMFL+3t0bID27JjlVJwDKiUVv9FdjfHJhsdt
	SJ3t2sY+bUjRe36AgF5baY0QEQyx9ilN3Jv/NLAB2g==
X-Google-Smtp-Source: AK7set94y1LoGb6TI2c5F8OOyhxTynG9RJHPpWlMkkXZiFAVpPpXIBgOHtqCI0Ftilyiq6xU6yVpGQ==
X-Received: by 2002:ac8:7d84:0:b0:3b9:fb0e:adba with SMTP id c4-20020ac87d84000000b003b9fb0eadbamr31631153qtd.25.1678289656877;
        Wed, 08 Mar 2023 07:34:16 -0800 (PST)
Received: from greenjustin3.nyc.corp.google.com ([2620:0:1003:314:8752:d0ab:8bcc:f9a8])
        by smtp.gmail.com with ESMTPSA id c134-20020ae9ed8c000000b0073d873df3fesm10506884qkg.30.2023.03.08.07.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 07:34:16 -0800 (PST)
From: Justin Green <greenjustin@chromium.org>
To: linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Cc: angelogioacchino.delregno@collabora.com,
	jason-jh.lin@mediatek.com,
	justin.yeh@mediatek.com,
	wenst@chromium.org,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	matthias.bgg@gmail.com,
	daniel@ffwll.ch,
	daniel@fooishbar.org,
	greenjustin@chromium.org
Subject: [PATCH v7 RESEND 0/3] drm/mediatek: Add support for 10-bit overlays
Date: Wed,  8 Mar 2023 10:33:55 -0500
Message-Id: <20230308153358.333297-1-greenjustin@chromium.org>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_073422_768038_A84F601B 
X-CRM114-Status: GOOD (  10.70  )
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

This patch series adds support for 10-bit overlays to the Mediatek DRM driver.
Specifically, we add support for AR30 and BA30 overlays on MT8195 devices and
lay the groundwork for supporting more 10-bit formats on more devices.

1. Refactor plane initialization logic to allow individual DDP components to
provide their supported pixel formats.

2. Add AR30 and BA30 support to overlay driver.

3. Enable AR30 and BA30 overlays on MT8195.


Version history:
v2:
 * Rebase and resolve merge conflicts with the AFBC patch.
v3:
 * Moved 10-bit support detection to mtk_disk_ovl.c
v4:
 * Moved formats to mtk_disp_ovl.c and mtk_disp_rdma.c
v5:
 * Minor style adjustments per checkpatch.pl
v6:
 * Refactor patch into patch series.
 * Add formats directly to private data.
v7:
 * Gate setting OVL_CLRFMT_EXT register on compatibility.
 * Split patches for adding 10-bit support and enabling 10-bit support on
   MT8195.


Justin Green (3):
  drm/mediatek: Refactor pixel format logic
  drm/mediatek: Add support for AR30 and BA30 overlays
  drm/mediatek: Enable AR30 and BA30 overlays on MT8195

 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  4 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 94 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 38 +++++++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  4 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  4 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 20 +++++
 drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 24 ++----
 drivers/gpu/drm/mediatek/mtk_drm_plane.h    |  3 +-
 8 files changed, 173 insertions(+), 18 deletions(-)

-- 
2.39.1.456.gfc5497dd1b-goog


