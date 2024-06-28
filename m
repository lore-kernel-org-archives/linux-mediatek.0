Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CCC7C2BBCA
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jun 2024 09:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ULp93nyLmCNiiU858JBh+ewZFxYho3FWRYejW3x38c=; b=4rFXgk5sM75esZUQkR4AgTWMcx
	Bm2nPINFAp9CvyM5HNJgW8yFNXvitCE+g6J1qcqRbp5g0MMm6zjWr6bCdYt8Ujio5MF/YO/fkTmVP
	6EZFzuNA+rnevqGvPvGF8TBg4WDZD3fuvDm1V5/Y7t7jkeEkiVC1T9agXa4hAb+tsmx7300RtnBk/
	TBHiCsjpwd0zlw+irrbxrHTQiVwj/isLHEgmtJy1kiSZNkGDVuABZkuBJCbAOYqahAdp5gGHq8iJW
	1esmGZ8piWvZJw0Rfgg3OkkiBdXgCpfHimNwhlSFZ20/4tpZQFJfQSzCK+U5uva/PbPYm7c7QUpxI
	HqrV0D3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN83f-0000000DHbB-4AbI;
	Fri, 28 Jun 2024 09:38:19 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN83S-0000000DHT1-2WaU;
	Fri, 28 Jun 2024 09:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1719567485;
	bh=gwCQ0evIwYjqKaT2ejjuFQ7K02f2CL1hfwcnELPQuiA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Z+qtk3K0+X7F2daaBP5WcpXwsfeN9G+Rg4fgHMSi++y1JRJuSajDAFMyeXyW6OUsY
	 IOXQMwdwVVYLIxvK1lDJ0P33an+zAoyMtiHag8JErMa5muAkR/4k5ZhLQxG2w3E7Nc
	 9ejiZyOLAwT2lZytJwdbRA+8teZH5D5urF07EXkPONJ5INnCxp4zvGnWnbbZ3m9MBR
	 S8S4I1SogdaCfTSBBjYJrcCJE88wNTlREpthDYjJ3+EYT5+4EHTycNS+8CD6G63h0G
	 2pmRWG6TMqbplQ+HXxtzUtIF4TPDGtdH/bJgiYRDtcKJWpkqx3ybM6OKNc/saUvhCa
	 /U0bIFZuW8whg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 03C1837821F9;
	Fri, 28 Jun 2024 09:38:04 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,3/3] MediaTek driver updates for v6.11
Date: Fri, 28 Jun 2024 11:37:59 +0200
Message-ID: <20240628093801.126013-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240628093801.126013-1-angelogioacchino.delregno@collabora.com>
References: <20240628093801.126013-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_023806_841659_179E6D2D 
X-CRM114-Status: UNSURE (   8.03  )
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

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-soc-for-v6.11

for you to fetch changes up to 58de63ddd0ecc84548b8fd24c72deb3739365c78:

  soc: mtk-cmdq: Add cmdq_pkt_logic_command to support math operation (2024-06-27 12:41:51 +0200)

----------------------------------------------------------------
MediaTek driver updates for v6.11

This adds the previously missed Tone Curve Conversion (TCC)
MuteX bit to enable the same in MDP3 on the the MT8188 SoC,
disables 9-bit Alpha for display HDR support in MT8195 and
adds math operation support in the Global Command Engine for
all MediaTek SoCs, which will be used in the near future in
the ISP driver.

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      soc: mediatek: mtk-mutex: Add MDP_TCC0 mod to MT8188 mutex table

Hsiao Chien Sung (1):
      soc: mediatek: Disable 9-bit alpha in ETHDR

Jason-JH.Lin (1):
      soc: mtk-cmdq: Add cmdq_pkt_logic_command to support math operation

 drivers/soc/mediatek/mtk-cmdq-helper.c | 34 ++++++++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c       |  1 +
 drivers/soc/mediatek/mtk-mutex.c       |  1 +
 include/linux/soc/mediatek/mtk-cmdq.h  | 42 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 78 insertions(+)


