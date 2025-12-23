Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 458A1E6F086
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Dec 2025 17:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nck6W2kcIiP++rumyNfPIr2NPQS0LMMghoE45KMIusU=; b=aqVnUyond3d3eP
	4exVuoZ6ggyYC+YPeAYCaicMYPr2tVaYEGBzcD/vt6Xw/sKriDcjiNQmRJ7f0xUxmz1krQx0AwSsH
	BQle/XHH7d3jbhvNOkZQaOu0cFMatBaOpe7soa6A+PHRJC31XCfgd1odxWtuv/xl/oo2BQ1D8Pj55
	iUDgYAAoASZ2J1nTa6ZQK6PSuZ1KaWeUdpXJCFQHv01ba90ptVQVMnF5GlKl1vNAFQb/C9Zl1Z8gu
	MhDGIGbMtOKIwaMTL81Rw7Sz0clo/vZBHJlEcAqmTDzlQ44kNxTXXDFdp0nkMrnyM7Ttv7EctVgYg
	06IrMGSRI/p27I9rScNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6dX-0000000FsRq-1M27;
	Tue, 23 Dec 2025 17:57:31 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY6dT-0000000FsQY-2ey5;
	Tue, 23 Dec 2025 17:57:29 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout4.routing.net (Postfix) with ESMTP id 752C9100374;
	Tue, 23 Dec 2025 17:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1766512641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nck6W2kcIiP++rumyNfPIr2NPQS0LMMghoE45KMIusU=;
	b=Bq02R1vb4kWrr1miBXc4PF1ul2xhuQPLLZFkF/dpoEXwAnoF3IfbNauyQtg8X/HFiXMi5H
	K+hVXD3ajaDWCUyV5TTAmUWvw6JqTySF3vFoNvM1LWHvlL/6MJaRm86hET22nadesxpXID
	yc2PAhL+a3WgbyorUC5bedBiN4VsIqQ=
Received: from frank-u24.. (fttx-pool-217.61.156.193.bambit.de [217.61.156.193])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 2151D122700;
	Tue, 23 Dec 2025 17:57:21 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/2] Add MT7987 Thermal support
Date: Tue, 23 Dec 2025 18:56:25 +0100
Message-ID: <20251223175710.25850-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_095727_962337_24CC5763 
X-CRM114-Status: UNSURE (   8.06  )
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
Cc: devicetree@vger.kernel.org, Mason Chang <mason-cw.chang@mediatek.com>, =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Balsam CHIHI <bchihi@baylibre.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This series adds Thermal support for MT7987.

v2:
- dropped non-irq patches
- dropped patch for golden_temp
- moved mt7987 COEFF above mt7988

Frank Wunderlich (2):
  dt-bindings: thermal: mediatek: Add LVTS thermal controller definition
    for MT7987
  thermal/drivers/mediatek/lvts_thermal: Add mt7987 support

 .../thermal/mediatek,lvts-thermal.yaml        |  1 +
 drivers/thermal/mediatek/lvts_thermal.c       | 36 +++++++++++++++++++
 .../thermal/mediatek,lvts-thermal.h           |  3 ++
 3 files changed, 40 insertions(+)

-- 
2.43.0


