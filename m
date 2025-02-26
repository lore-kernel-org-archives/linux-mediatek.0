Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C53EC021B8
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2025 15:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wMlAkGP+ZbqMel9snxI5022ekm1uiLxuTMFZuJGVJF0=; b=RniKqIo/2SoJuj
	eRA+SRq133EFr3lA4c6UMtq48GgBGG52Ya4lcZeqbi/n3iuR4irvsgzTfNUDXQAy9fQNDH5MQXkQG
	wiqfCgAfoRjk4r3UtokhhdoWPbKfuk5LZF7D2HEN+vRvIJA3WvyJxCaH71GrW6v5itCB6S9/PFLyK
	yEXQZhXUE0dUZs11hah8raLdkohS0ZkigrwhMz8G2U2+4Fv0FjIe4r2k1QkeTMlnlUZ5C47JkJTBH
	5y/EaNbP71SWtrQPIbMJpaFEBM3HsVpbexz91XpwOr/V88ZtkoGDVNNUkcvJTZdqGvKGD07ZVtcLv
	p4PYOD7NhruXY8aIDTaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnJF7-00000004FqZ-2MUW;
	Wed, 26 Feb 2025 15:22:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnIVt-000000046tF-0Eaf;
	Wed, 26 Feb 2025 14:35:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740580550;
	bh=A5VQdEengpn4Lj83aQmBrB3YzBMuMsERvJHgZH4EMC4=;
	h=From:Subject:Date:To:Cc:From;
	b=J5zYn80VWULdUPgpp5pVm0O+ha4PKogDNV6tqzCssMLhjqbjR1Nu/2Ih3PFhjrpb6
	 5hayY+ce8nQhjBvmVxs8+MhPYg52cXMM07StOREaDyi2QrFjpA3JVmalM3OEpVq5db
	 xea5RGYe7hG5ndBbMe8Gcy3dQsmnA6yEQlANteKT2lQkYJ19yGlkZq4vm+TY9k2Xtq
	 LgMMiUJZ1BFNxlAsqyWxw/uwI0sUX3w5aDeRVGKZTjgveTXl2P4ncyIc8bVCiQqZQX
	 JWmFYqgvTvCHV20as0YQ9AkUfoKFbSpWSF3gvsBmzExufywuMfFV7eZyEqgPDU3soO
	 Hb1bS26StSg0A==
Received: from apertis-1.home (2a01cb088CcA73006086F5F072c6a07a.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:8cca:7300:6086:f5f0:72c6:a07a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5789817E05C1;
	Wed, 26 Feb 2025 15:35:50 +0100 (CET)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 0/2] mt8395-radxa-nio-12l: Add overlay for Radxa 8HD panel
Date: Wed, 26 Feb 2025 15:35:26 +0100
Message-Id: <20250226-radxa-panel-overlay-v1-0-9e8938dfbead@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK4mv2cC/x3MwQpAQBCA4VfRnE0xWbVeRQ7DDqa0NFsieXeb4
 3f4/weSmEqCrnjA5NSke8yoywKmleMiqCEbqCJXEbVoHC7Gg6NsuJ9iG9/oGmrC6J33boJcHia
 zXv+1H973AysLjMxlAAAA
X-Change-ID: 20250226-radxa-panel-overlay-5424db95995c
To: kernel@collabora.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel@collabora.com, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_063553_251681_5B05B3C0 
X-CRM114-Status: UNSURE (   8.05  )
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

Hi,
small series to enable a DSI panel on Radxa NIO 12L.

The first patch adds missing dts nodes to expose some
feature of the DSI0 port.

The second patch adds the Radxa 8 HD panel as an overlay.

Tested on top of linux-next tag:next-20250226

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
Julien Massot (2):
      arm64: dts: mediatek: mt8395-nio-12l: Prepare MIPI DSI port
      arm64: dts: mediatek: mt8395-radxa-nio-12l: Add Radxa 8 HD panel

 arch/arm64/boot/dts/mediatek/Makefile              |  2 +
 .../mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtso  | 64 ++++++++++++++++++++++
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     | 60 ++++++++++++++++++++
 3 files changed, 126 insertions(+)
---
base-commit: 8433c776e1eb1371f5cd40b5fd3a61f9c7b7f3ad
change-id: 20250226-radxa-panel-overlay-5424db95995c

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


