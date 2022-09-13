Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A925C6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 12:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ojWNsJ0rluRcqYktEyaDZd9eILi+oezzsv2WzXG7msU=; b=FP4tM/4nXUURIZsAjfVx8xZSyI
	nkaMVZQDBFPbRNh2uHU9KH51nhRS3eV1wNGuEnSfNiZHr9jxbNqFJh0jiYiwSgQEJurPkLbwJDb/s
	HOXDVEDVI55gv+LezkdfoG3m0cdoUcYr4GnuKZUpyRkVQM5h5onltncoxJkJIzL0jSqZ9UJa5ktBd
	WQo37eglVSfIrERcvEgbN2pKmy9Mi5wWXoQPMrLfQXO7kx1mYP1ID325IgP/9uzK5fQ8hKtnZ6qxa
	crs1qvMuAeI0guYX4akqRl7PR1A13QeYNtqrOzhjU1ZQgLQgwfF6qJB80vjWscikSNLTwQdf9IIRy
	ySXc6JFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY58X-00A3l1-9O; Tue, 13 Sep 2022 12:35:33 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY586-00A3WE-1C; Tue, 13 Sep 2022 12:35:07 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D95976602004;
	Tue, 13 Sep 2022 13:35:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663072504;
	bh=arXXRyviojxzK2161tTWG0B0Y0ZjNohDB8F9CsAPFw8=;
	h=From:To:Cc:Subject:Date:From;
	b=GLGf8B0ZPwyHun1rN6tWm0s2flKhGxaJxBaqib8Ah7laLwLmcJltRoaFSKEZjBJoe
	 F0C8mwAYl195QrlIaqiH2qJ3e29uydkJVJhDMs6/z760sdhxYaWfAwWcqAAvtAWUAe
	 nddnr5nyYpuYxUMAh+BX2JoYgS27rnHdeyBXK7PDE2YXmLHQNxrwK1uvcj83qa5uLZ
	 aiStZvHX+LT6sCe1S1crxUNMI4eS0C0rcg88ubc5yQcnNeBYkcICJUT0vzyJgNJWe6
	 jPglZAqD1V1wCBoJCnfK9mLLYt1widMeKb15NDv9xvg5Xm0WGCHBpc1+rSmrTqXMUe
	 nbKKvBQjc+pGQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 0/4] MediaTek Helio X10 MT6795 - MT6331/6332 Regulators
Date: Tue, 13 Sep 2022 14:34:52 +0200
Message-Id: <20220913123456.384513-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_053506_245635_D3CB83E9 
X-CRM114-Status: GOOD (  13.54  )
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

In an effort to give some love to the apparently forgotten MT6795 SoC,
I am upstreaming more components that are necessary to support platforms
powered by this one apart from a simple boot to serial console.

This series adds support for the regulators found in MT6331 and MT6332
main/companion PMICs.

Adding support to each driver in each subsystem is done in different
patch series as to avoid spamming uninteresting patches to maintainers.

Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.

Changes in v4:
 - Rebased on next-20220912

Changes in v3:
 - Sorry, one of the commits picked both the pre-rename file and
   the new one... the v3 fixes the mt6332 bindings commit.
 - Changed comment style on top for mt633[12]-regulator.c as
   suggested (missed that in v2)

Changes in v2:
 - Refactored description in dt-bindings
 - Simplified get_status() function and removed callback
   where not needed
 - Simplified set_mode()/get_mode() functions and removed
   callback where not needed
 - Added new regulator_ops for no_qi (no .get_status) and
   for no_ms (no .{get, set}_mode)
 - Fixed vsel mask on some regulators and removed pattern of
   repeated voltage entries present in some voltage tables,
   avoiding to set higher bits for safety
 - Reordered regulators (and some formatting fixes) in
   mt6331-regulator.c in per-type alphabetic order
AngeloGioacchino Del Regno (4):
  dt-bindings: regulator: Add bindings for MT6331 regulator
  regulator: Add driver for MT6331 PMIC regulators
  dt-bindings: regulator: Add bindings for MT6332 regulator
  regulator: Add driver for MT6332 PMIC regulators

 .../regulator/mediatek,mt6331-regulator.yaml  | 273 ++++++++++
 .../regulator/mediatek,mt6332-regulator.yaml  | 112 ++++
 drivers/regulator/Kconfig                     |  18 +
 drivers/regulator/Makefile                    |   2 +
 drivers/regulator/mt6331-regulator.c          | 507 ++++++++++++++++++
 drivers/regulator/mt6332-regulator.c          | 422 +++++++++++++++
 include/linux/regulator/mt6331-regulator.h    |  46 ++
 include/linux/regulator/mt6332-regulator.h    |  27 +
 8 files changed, 1407 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6331-regulator.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6332-regulator.yaml
 create mode 100644 drivers/regulator/mt6331-regulator.c
 create mode 100644 drivers/regulator/mt6332-regulator.c
 create mode 100644 include/linux/regulator/mt6331-regulator.h
 create mode 100644 include/linux/regulator/mt6332-regulator.h

-- 
2.37.2


