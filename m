Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F23C41513
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 09:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7hNOY+dThHbU9Qau2FafRezzuRCollmxvUf5w5jtPJg=; b=iPA53Ug2/yziwrCuOHnTzDQ0xv
	hTkSeF7J87Ursv0NO1xdIbTcx862X4nh8nnsGazzFdxcTUZ8WOzY4aHajxHVe8Wi5uLCPTK0uAYnx
	unM/87KFjdKzOeQDHZjsGWiwJEKtVCg5nHrUWmm8K7jq426i437/zHVHMLLmXydSieqQsK5hPpIR7
	SekiVkD2eR9zoShUsaxY24KgYlyjK+g2PTWoHu+rRGvrDNsbSIOzrAYg+l87U4029qyqahcl/5h/6
	H/POxtr9qb5pgvCnx/md8w3aKkiD5kC3o6vGmxWhQIcqM5H9GKK5zOCCSdGB9I4+q0WnH7ctYnjnK
	TYA8pQNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBWbf-0000000EOSQ-0e6b;
	Mon, 27 May 2024 09:25:27 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBWbZ-0000000EOOt-3uDC;
	Mon, 27 May 2024 09:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716801916;
	bh=AjVXj1OoeM119VTDcnK+q4iv8gMO2nea9gJqqFXcka4=;
	h=From:To:Cc:Subject:Date:From;
	b=SoLhD/G4q+46qWolyFE5jDNvHg1xik37vKcdsBjlxf28588SbHgzgtAdmgjqvz/zb
	 Ai67IgeuACIJyaxzdIQ9xP5IRDVtZCgjF2V3NzTOj1+1lHQIdZ8hJ6HWp4HD8e2A7w
	 bnziQxSRIwx4MyuPXLCpD/YHQeqeFGOiRXRePNrMffMY+H5gcLFUN60HBT2tyaa1bM
	 jCf3yr45KS5yC1tO2pUksb1VrWW5RkfjnJ3nBt857ZeNQFd9znRR9PN/90OqXBwMoI
	 KgEMboBylqWYtMfz9MMRD9PDGC9AE5X8R6FvRFgNyMp8dr1oCMOT5tk8KdHCMdPp6y
	 wK0Rm7jtF4LQA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9A021378203F;
	Mon, 27 May 2024 09:25:15 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Cc: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	steven.price@arm.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/2] drm/panfrost: Add MT8188 support
Date: Mon, 27 May 2024 11:25:11 +0200
Message-ID: <20240527092513.91385-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_022522_159925_603EBC81 
X-CRM114-Status: UNSURE (   7.28  )
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

This series adds support for MT8188's Mali-G57 MC3.

AngeloGioacchino Del Regno (2):
  dt-bindings: gpu: mali-bifrost: Add compatible for MT8188 SoC
  drm/panfrost: Add support for Mali on the MT8188 SoC

 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml        | 1 +
 drivers/gpu/drm/panfrost/panfrost_drv.c                  | 9 +++++++++
 2 files changed, 10 insertions(+)

-- 
2.45.1


