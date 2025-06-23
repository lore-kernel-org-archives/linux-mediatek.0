Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 799D9C77B7F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jun 2025 14:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LOjXmaimuYzCDVD8J8YQj7tqbZLwH8GSuglqbXGHcbA=; b=YooONbFQUsOpfM2h5tHNHG2jeA
	D1Q7Pid36004hVKK9m5gqIYLRU1ENkCDK8e+YUWu7chS5RXb99uE8+svFkR7g7EWX2mVqFkieCtuT
	UzcMQYVQN7LdCvYMhSI393ojMs5cxO7rnM5jp0kQNzu3rUGRnxAX2tOwFle99AMvwkN6niM2g+ic6
	eUoSpX9ANbM0ZC3fnOYkA86x974MKIldoGJWeXsIAX6slhbQM0ovV1Gx9kW77P88DpVKhfRB53LFz
	0RdS56L2T/C/F3nvFN3K/WhsUhjzGQDdxgiboInncKKgox67Fz9nvUeVY114leVp09aYqp4iPkuUf
	Dv7VuGCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTi2m-000000031gF-05cR;
	Mon, 23 Jun 2025 14:21:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfrY-00000002atu-2L8E;
	Mon, 23 Jun 2025 12:01:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680083;
	bh=YMJ1LS+KoR0M9I0Sxf/wRosogdBiBEWRZnfRRB9Zjw8=;
	h=From:To:Cc:Subject:Date:From;
	b=eNMZ7LqnqvnP39GaVTEhiQlRuMnKYwlHyzY38hOHZKoLBeZK9aMwYAcf5fcIsmJGP
	 7U1UIEGty2G7qpEZwwS/cwnMe62eIaRPbKLRyBZiYsmjbbF7IvdSVSJRhJgzMZtjRe
	 9c5rOLlEjFd5NxKTFg8a3yogSfUlvJAgn/4Ze7shDUp3fThXSSI8/2LkJso2BmmruE
	 y9Kwb1uDXBKzaTg4GTY6odYw5PqBaHQLlDh/LZWTNOWqqpYX/rnDYTiGJbzx67vxKv
	 SRk65wYFI958m3ByiUETTYyRQ+T6vgRjaQ1r/V0wyMcvd7wJAVGGvnZqu8DQabcIkf
	 blaf4EoYLAgFw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4F33117E0EC0;
	Mon, 23 Jun 2025 14:01:22 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: ukleinek@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	john@phrozen.org,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 0/3] pwm-mediatek: Add support for MT6991/MT8196 SoCs
Date: Mon, 23 Jun 2025 14:01:15 +0200
Message-ID: <20250623120118.109170-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050124_770900_3474B3B6 
X-CRM114-Status: UNSURE (   7.91  )
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

This series adds support for the PWM IP, version 3.002, found in the
MT6991 Dimensity 9400 Smartphone SoC and in the MT8196 Chromebook SoC.

AngeloGioacchino Del Regno (3):
  dt-bindings: pwm: mediatek,mt2712-pwm: Add support for MT6991/MT8196
  pwm: pwm-mediatek: Pass PWM_CK_26M_SEL from platform data
  pwm: pwm-mediatek: Add support for PWM IP V3.0.2 in MT6991/MT8196

 .../bindings/pwm/mediatek,mt2712-pwm.yaml     |  5 +++
 drivers/pwm/pwm-mediatek.c                    | 38 +++++++++++--------
 2 files changed, 28 insertions(+), 15 deletions(-)

-- 
2.49.0


