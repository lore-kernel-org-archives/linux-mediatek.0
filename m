Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75EA3C25B76
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jun 2024 08:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+yT9+nrIONS8V2lgafK2fP888zDafeTzonebnFRtylk=; b=qByTsbzXkvMFcSRokEtEn8VdSg
	k/bxXSaxeY03XePEWw9ftSIDf2CtevipfKV2xDoIpSKfQQWVkHcQT//vdVSJC4p82Sguld+Iv77dW
	ia2SaQctfS75Wf7Iv8fMmtw+H39A/jPNWwJXEey+fKDkjBeLqpdjo0P7F4vxAdUyg7faWw/rhh52Z
	f92tF2WAEUwHv3HH4G1fG3ode1Q8+ThXagY8xqYUGVU6LKzq79fh2zIfREyOs6dn2ExDDGGqGSFPP
	ukneAmlMV0aHdxjj+DHiUXenG4WRigKNdg53HSmvc5Ci0zJVX2PQWT78FbQgl2SfHl01yt0GZI9eH
	yRzIAdng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGxIZ-00000008DG0-3vLd;
	Tue, 11 Jun 2024 08:56:11 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGxIW-00000008DD1-2iju;
	Tue, 11 Jun 2024 08:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718096166;
	bh=jyXZ6Jmf602HyTlI6R8H2s9bUCikY0FkUQKhwDBS4eE=;
	h=From:To:Cc:Subject:Date:From;
	b=EXoraPiEN270DmvqR7ysOyaTy9JXeBNGVwFlanfv/WHqUC2RULZGc6Mgz77ahE6Vj
	 p2E4Eml5aApaJ+fFwaBuBIAlySQc8Iuj0y8c9wDWps/O0hlse2GlUQ+rn4OLDhb3iM
	 mRshvN0fNDbVom4oWFIod6+u1peB+B2asyb3hGmu4g1CgYHQc3KjIMZ7EHpeqKFHCD
	 ncnU9QRe20Oj1Gbvm/Mhz7schrzmNyDo3F+pJL2207yfnqf/hiuuSO/6IvmOJLPES9
	 h4B8Lw3R9VLuTJO15Xw85/qupnYsBaJv2BrFL3ME/AeBtSqH/F5+NN1BKWtncPhORe
	 nK7yE+iJhevoQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 832AD378020A;
	Tue, 11 Jun 2024 08:56:05 +0000 (UTC)
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
Subject: [PATCH v3 0/2] drm/panfrost: Add MT8188 support
Date: Tue, 11 Jun 2024 10:56:00 +0200
Message-ID: <20240611085602.491324-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_015608_871163_0A3F5D04 
X-CRM114-Status: UNSURE (   9.11  )
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

Changes in v3:
 - Added comment stating that MT8188 uses same supplies as MT8183
   as requested by Steven

Changes in v2:
 - Fixed bindings to restrict number of power domains for MT8188's
   GPU to three like MT8183(b).

This series adds support for MT8188's Mali-G57 MC3.

AngeloGioacchino Del Regno (2):
  dt-bindings: gpu: mali-bifrost: Add compatible for MT8188 SoC
  drm/panfrost: Add support for Mali on the MT8188 SoC

 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml      |  5 ++++-
 drivers/gpu/drm/panfrost/panfrost_drv.c                | 10 ++++++++++
 2 files changed, 14 insertions(+), 1 deletion(-)

-- 
2.45.2


