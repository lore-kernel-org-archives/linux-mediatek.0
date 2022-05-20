Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDB2C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 13:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yzXXVD26HY863ojWIUu0czJRrPTOT12FEDvcOiGcD/k=; b=SVSpNKyyKbzF1B
	BhoMX5B4Xl56hJa3zJMTbg3f09iO+wEhxBpoXbTi1U+bunasumnCfAdpOHgR2hPcTlhaY3jBrbSoY
	sblyxkIFKfWUgzEeWAA4M42WavSvsI/cI8rDrEBC8ZMdru/b+uLhvnk4OSuekzURKC2bx6xQf4m0G
	OpD8fIE5pmLkzaVibnga9cwJwHcnCZ/zUres2eEsZy8cwPDC/I0qpF39/CwI6BGQvB3IjwOnz7seL
	3FAaivApPZ69cHdincT0cgDDa2PsCMTggttJ5o6MFJhe477ZmStH6BnGCbteaoDasguLFHE1Fuoz8
	OzI1dtvJP6o/sEywKY+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns2ku-00CedN-J3; Fri, 20 May 2022 13:33:24 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns2ki-00CeXm-By; Fri, 20 May 2022 13:33:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 204D91F463B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653053590;
 bh=8KLuVu3txTnM/nSthOFcN4DBOUEkvxmQX7KR8mdY4Lg=;
 h=From:To:Cc:Subject:Date:From;
 b=TYoK5tGrNJ6bTRE1lpIm3PtL5mWX0G1AnQN78EdvqsXLDO21IXgVgOE53he0CxlUG
 +qPldosnsFfIxHmK2p3AE2Nt/RCyBQqsKTUvvd3VQYalvzdEwbRZst51Gx/igtWIx5
 EkOlTXHNNbqev7yZd4/xEm4YTHZMB+Kgl+YgmK2NunX26MWDEW6SXW7PwzEr0VWJrF
 4CTJN3zyet0nlP336/+1aYX442dJbpcz22+6+t9jBmCvhs8YJbOkg7CIURCmK0V9EV
 qhueVm6MoJOUU0h/B80vI48sCm6MWAbJryEXSMcpvq3x/rFIF3uPrBIzb6OzfsMFo0
 mq0KTxeOdwbww==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 0/4] MediaTek Helio X10 MT6795 - MT6331/6332 Regulators
Date: Fri, 20 May 2022 15:33:01 +0200
Message-Id: <20220520133305.265310-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_063312_575800_7379EC65 
X-CRM114-Status: GOOD (  11.15  )
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

AngeloGioacchino Del Regno (4):
  dt-bindings: regulator: Add bindings for MT6331 regulator
  regulator: Add driver for MT6331 PMIC regulators
  dt-bindings: regulator: Add bindings for MT6332 regulator
  regulator: Add driver for MT6332 PMIC regulators

 .../bindings/regulator/mt6331-regulator.yaml  | 272 ++++++++++
 .../bindings/regulator/mt6332-regulator.yaml  | 111 ++++
 drivers/regulator/Kconfig                     |  18 +
 drivers/regulator/Makefile                    |   2 +
 drivers/regulator/mt6331-regulator.c          | 507 ++++++++++++++++++
 drivers/regulator/mt6332-regulator.c          | 431 +++++++++++++++
 include/linux/regulator/mt6331-regulator.h    |  46 ++
 include/linux/regulator/mt6332-regulator.h    |  27 +
 8 files changed, 1414 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/mt6331-regulator.yaml
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
