Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 850B1C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 15:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hpXqamm0VTeO1Cjt8AAhybmRRQRhijVLuPCmphb2J3U=; b=Cz8Tz/38nNRmCV
	UCdhyJcQwljht+5UyR8Hg0l2I0OBnYrBCtBETIOgPHto+1PbcODDvw/8kKkrjNTq362c49Z/rF2Ge
	VBpIQeCfxWItG9gsXnfwsbUrvJE9wzb2ujBWREEC3599HsOT7zXUWUbU6+yfL60ta6HhSJwIwpSyQ
	I6pzE8NsxScrICBzOzbCwvMcPIQXt8Vx13fzIwHetaTe/MXWzddQCnBTJdz3ajGF2vJqezKF3SHCw
	4VVsnC61/HQOa570OrvVZ1QNDd5ZA428mfYHQ+VCqRqL89FowX4Eit2L7/ooEreuiEB80MmhFN6wS
	8xQ9CGG1IRdxW/0wwcXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt9yH-004vgH-UO; Mon, 23 May 2022 15:27:49 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt9y2-004vaW-Ny; Mon, 23 May 2022 15:27:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D2CF31F4388B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653319647;
 bh=ECuRIHZVc4uUQwghJj0RU9C81x2ASHEftsiIARksYqk=;
 h=From:To:Cc:Subject:Date:From;
 b=nZdlCDvArOlyITPdldlyl5Cu42ag/8ys2ryteghMhhDm1emAO0Ty+NelQBuz5ryEv
 ZT4uUT0QjLiwwCv8eu0l/sGUNpIqWwGez+zVn3Dvk2E/V+V5Uk33JigGe05nEXTq5x
 z3uV7GPONCImnCN007v6Hdm52TuotU0my3zz+/4KgFWIszwbzihSn8v8wA+6x2F8y1
 AJtldlQ04T4Oe04tS0/OxLfqPtrSZCm7CpO/lzCYxUVVBmhukHDD5ODp7METgfmlvC
 hAFWvsg5ipYhRyyw+paYNR+vrmfahgVRaoOEuCzAkPcWkluM6oH6XX2HL38zEYqSye
 7gSNDjy2b6hIA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/4] MediaTek Helio X10 MT6795 - MT6331/6332 Regulators
Date: Mon, 23 May 2022 17:27:12 +0200
Message-Id: <20220523152716.117062-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_082735_038209_A6CA7F21 
X-CRM114-Status: GOOD (  12.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In an effort to give some love to the apparently forgotten MT6795 SoC,
I am upstreaming more components that are necessary to support platforms
powered by this one apart from a simple boot to serial console.

This series adds support for the regulators found in MT6331 and MT6332
main/companion PMICs.

Adding support to each driver in each subsystem is done in different
patch series as to avoid spamming uninteresting patches to maintainers.

This series depends on another two series series [1], [2] named
"MediaTek Helio X10 MT6795 - MT6331/6332 PMIC Wrapper" and
"MediaTek Helio X10 MT6795 - MT6331/6332 PMIC MFD integration"

Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.

[1]: https://lore.kernel.org/lkml/20220520124039.228314-1-angelogioacchino.delregno@collabora.com/T/#t
[2]: https://lore.kernel.org/lkml/20220520124617.228808-1-angelogioacchino.delregno@collabora.com/T/#t

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
 .../bindings/regulator/mt6332-regulator.yaml  | 111 ++++
 drivers/regulator/Kconfig                     |  18 +
 drivers/regulator/Makefile                    |   2 +
 drivers/regulator/mt6331-regulator.c          | 507 ++++++++++++++++++
 drivers/regulator/mt6332-regulator.c          | 422 +++++++++++++++
 include/linux/regulator/mt6331-regulator.h    |  46 ++
 include/linux/regulator/mt6332-regulator.h    |  27 +
 9 files changed, 1518 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6331-regulator.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6332-regulator.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6332-regulator.yaml
 create mode 100644 drivers/regulator/mt6331-regulator.c
 create mode 100644 drivers/regulator/mt6332-regulator.c
 create mode 100644 include/linux/regulator/mt6331-regulator.h
 create mode 100644 include/linux/regulator/mt6332-regulator.h

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
