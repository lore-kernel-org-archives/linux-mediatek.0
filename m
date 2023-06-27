Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFB97C001B3
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jun 2023 21:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lovDh0f1HoN/hr+c8ZKChGSkRfc9AwqDwegn/jkLxsk=; b=qEyndOTIfmVXK4ByOTBegxnaYB
	s+Jb1+Qts+467cHw8xH74wJTPM5ck1mpyd0PYimDykKYJKa6LGBdh2uJi8c4cUqI/2BT8cClKqIfA
	l06hL278qLPZJ0mTPsLgXw2GmiBRRxCy9XPyySrDL+pCdq27j9ky6SDXjZNwrr+b2Y3bTVfxCiP0M
	9n4K4hfn9SD66M3eVz6X44ydZxbcxgiZXBTONe9piVEF+Y2vOe8LJiDPvm8bIcRFCakRYcJnb9pki
	xGfpWlfu/MdsEJaxUAbWzICQSBoJjCEIQV5iJuw/K6bSIeQtC2I7QEblpZpiMSe6neymyVVGCCWPH
	peCn+hpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEGWH-00EEiH-0h;
	Tue, 27 Jun 2023 21:46:41 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEGW3-00EEY3-2K;
	Tue, 27 Jun 2023 21:46:29 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A80B16607165;
	Tue, 27 Jun 2023 22:46:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1687902383;
	bh=kkctlcmF7HHs9xmRVKmHoOLxTdyllUjYdjDvH2KJ+iM=;
	h=From:To:Cc:Subject:Date:From;
	b=ayyHcKhCA4DCZx5dTMACPJUsF4zsnIbu4EJzI+jyCdJUuGS8MjA+LnswqAFBCHFRR
	 j2Hg14iJyo1nDnoPdQ8M6RB8dys5mvt0QspJzqpmx4vGUoorDwywBPe8iri2BYgfi7
	 KGiDU5hUX+r9/hiPHY/yAzX5nagnFcWD4/GcCB3V0+Bje7EkxgB9bwjvISS86e8pDN
	 AntFF1mbj2vMTtte+quz9tDCGjY6xYWV2J2VXIFSZzxIkMGtW8lyefHJG72b1Cev4P
	 Kx04gPTfwYE0Wr7AlNfXdq5PgOi5UogFYg/JXKmIQpUST0E5OYM/rAdtPHcxLX1zfh
	 BXbEodfJ0LUlQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 0/7] Enable decoder for mt8183
Date: Tue, 27 Jun 2023 17:45:50 -0400
Message-ID: <20230627214615.1503901-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_144627_890749_031C4986 
X-CRM114-Status: GOOD (  12.37  )
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


This series enables the hardware decoder present on mt8183. At first
glance, the only missing piece is the devicetree node for it, however,
simply adding it as is would cause an address collision between the
first register iospace and the clock-controller node, so a rework of the
dt-binding and driver, as well as addition of a new syscon phandle
property, were needed first.

Tested that H264 decoding works with the hardware decoder on
mt8183-kukui-jacuzzi-juniper-sku16, giving a fluster score of 98/135 on
the JVT-AVC_V1 test suite. And ensured other SoCs (MT8192 and MT8195)
still work as usual.

Changes in v4:
- Removed VDEC_SYS reg from mt8173 as well
- Made driver handling cleaner

Changes in v3:
- Switched the handling of the VDEC_HW_ACTIVE bit to use a syscon
  instead of the 'active' clock

Changes in v2:
- Merged commit 1 (media: dt-bindings: mediatek,vcodec: Allow single
  clock for mt8183) into commit 3 (media: dt-bindings: mediatek,vcodec:
  Remove VDEC_SYS for mt8183)
- Further constrained properties in dt-binding
- Added CLK_IGNORE_UNUSED flag to active clock
- Reformatted reg-names in DT node

Nícolas F. R. A. Prado (6):
  media: dt-bindings: mediatek,vcodec: Allow single clock for mt8183
  media: dt-bindings: mediatek,vcodec: Don't require assigned-clocks
  media: dt-bindings: mediatek,vcodec: Remove VDEC_SYS register space
  media: mediatek: vcodec: Define address for VDEC_HW_ACTIVE
  media: mediatek: vcodec: Read HW active status from syscon
  arm64: dts: mediatek: mt8173: Drop VDEC_SYS reg from decoder

Yunfei Dong (1):
  arm64: dts: mediatek: mt8183: Add decoder

 .../media/mediatek,vcodec-decoder.yaml        | 67 ++++++++++++----
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |  8 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 30 ++++++++
 .../mediatek/vcodec/mtk_vcodec_dec_drv.c      | 76 ++++++++++++++++---
 .../mediatek/vcodec/mtk_vcodec_dec_hw.c       |  4 +-
 .../mediatek/vcodec/mtk_vcodec_dec_hw.h       |  3 +-
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h |  1 +
 .../mediatek/vcodec/mtk_vcodec_util.c         | 15 ++++
 .../mediatek/vcodec/mtk_vcodec_util.h         |  2 +
 .../mediatek/vcodec/vdec/vdec_vp8_if.c        | 10 +--
 10 files changed, 177 insertions(+), 39 deletions(-)

-- 
2.41.0


