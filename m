Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E35C001B2
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Dec 2022 15:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mFoV6r2Py6GshiOCvPnrxtODe6D8zJrK6BHfPk7hlxg=; b=ijT8RE84u6xHfBIKnh685YhwAG
	o56GYoo2xlsPxZn33etbsHx0e6f9QJHgClpi/T4DcMA1hX5hAmO/8R4ZG4UPvskzdmmAhgVrtS1hg
	S/g9htx5rPV+/PAtNBFpq9cIJ1SO8pV3AeN3LovXmQFEc2APBvW/bKV7Bm+L2ZMRqHZ8ZbdLDLQLj
	fr2C7fjuWCL+iD3R6rtAsPbHra1Cb+dhreiKVgC6ilmLsyDWyFJjbj6PD9jAZfR9AsKI/VjksnSgb
	7SfveNH9911UH1vQK7LR+C9XguuBuS7nDSNuEeNyDXDjuVYWE2Iqa4xdcsVKWDCN3AEHcwiPhu9ng
	htc6hY/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8NsS-00DjW6-T4; Thu, 22 Dec 2022 15:53:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8NrP-00DivA-Jt; Thu, 22 Dec 2022 15:51:57 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 48CD06602CD4;
	Thu, 22 Dec 2022 15:51:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671724311;
	bh=uMlzR3jzAgZKgQ0SsvIc9RuzeNPQqYhO11Dbd9G7z0U=;
	h=From:To:Cc:Subject:Date:From;
	b=FsqezhQ0340vo0CDb+ED7Q92XVeu1d+mK9Lik1j2SBpi5KjRWJWBcXUGiFms90yBS
	 yfP/HDrgdiP6u69tbMEYaeu2vNpY8Fsz+w9EmykXgwqBeGqo4ThhJp4nWcMaC66pGj
	 c+q9dr9R2f7YZAFXlsPJ/uqU+D23lj7b6pr/QQyNHU/LjLDe6iArHWLXh2VEoTBBqu
	 crxpIIosnH70dYgiTN2Z+TYLM3Uw1/iyhJqdKE7LIMhFzbAPYCCUvK0bcLkExVrR++
	 xN89VlCn+1hAplqfNEMKfb1T7BWq/exbuxrmHdJz3IBHzGqJ4JpbPCUl6vmOupbJwg
	 rX8Hxup7xFrLQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mturquette@baylibre.com
Cc: sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	edward-jw.yang@mediatek.com,
	johnson.wang@mediatek.com,
	wenst@chromium.org,
	miles.chen@mediatek.com,
	chun-jie.chen@mediatek.com,
	rex-bc.chen@mediatek.com,
	jose.exposito89@gmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 0/6] MediaTek Frequency Hopping: MT6795/8173/92/95
Date: Thu, 22 Dec 2022 16:51:41 +0100
Message-Id: <20221222155147.158837-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_075155_863672_02F49C4B 
X-CRM114-Status: UNSURE (   8.68  )
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

This series adds support for Frequency Hopping (FHCTL) on more MediaTek
SoCs, specifically, MT6795, MT8173, MT8192 and MT8195.

In order to support older platforms like MT6795 and MT8173 it was
necessary to add a new register layout that is ever-so-slightly
different from the one that was previously introduced for MT8186.

Since the new layout refers to older SoCs, the one valid for MT8186
and newer SoCs was renamed to be a "v2" layout, while the new one
for older chips gets the "v1" name.

Note: These commits won't change any behavior unless FHCTL gets
      explicitly enabled and configured in devicetrees.

AngeloGioacchino Del Regno (6):
  clk: mediatek: fhctl: Add support for older fhctl register layout
  dt-bindings: clock: mediatek,mt8186-fhctl: Support MT6795,
    MT8173/92/95
  clk: mediatek: mt6795: Add support for frequency hopping through FHCTL
  clk: mediatek: mt8173: Add support for frequency hopping through FHCTL
  clk: mediatek: mt8192: Add support for frequency hopping through FHCTL
  clk: mediatek: mt8195: Add support for frequency hopping through FHCTL

 .../bindings/clock/mediatek,mt8186-fhctl.yaml |  7 +-
 drivers/clk/mediatek/clk-fhctl.c              | 26 ++++++-
 drivers/clk/mediatek/clk-fhctl.h              |  9 ++-
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c  | 63 ++++++++++++++++-
 drivers/clk/mediatek/clk-mt8173-apmixedsys.c  | 65 ++++++++++++++++-
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c  |  2 +
 drivers/clk/mediatek/clk-mt8192.c             | 67 +++++++++++++++++-
 drivers/clk/mediatek/clk-mt8195-apmixedsys.c  | 69 ++++++++++++++++++-
 drivers/clk/mediatek/clk-pllfh.c              | 23 +++++--
 drivers/clk/mediatek/clk-pllfh.h              |  1 +
 10 files changed, 311 insertions(+), 21 deletions(-)

-- 
2.39.0


