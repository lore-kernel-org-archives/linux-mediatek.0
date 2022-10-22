Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBE1C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Oct 2022 09:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5u/+U3WMoQOALWqYdkq+g/H0rCbuuXYSAnM9TAS61+s=; b=r3KpiE791IQ598
	gwRWmhShM95a99xZuUe0c10i4lHRpcr509QKbphpWViTPyqKCgiHl4Al5umwnVF1kyiy+wNpmRbCb
	fl6zmCnFi0U9GVrLPKaOe1U9RCSlPZDu0YUDQIdEKjh7/FmfhQ+BwGUO3RM8imYRvCU9NthcJROg8
	4X+F64jMI9Q6SxRYX68gkTYOoVW/eqKGoWy/XHhPhOHYzOZbuo8xQqV79oBExnSCpWOe7v9xBDXLz
	VWLWfxQ3jV6yXWXLLplygfsT0cjKQINMkrBfl7u307i3xiOMpE3V9QPupzMDr3Z8oBPpCDuLhBS3f
	uhWnd9ye1YoM8RwP+WLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omAS9-00Bt4N-85; Sat, 22 Oct 2022 09:06:01 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omARp-00BsxE-L2; Sat, 22 Oct 2022 09:05:43 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout3.routing.net (Postfix) with ESMTP id D818E605AA;
	Sat, 22 Oct 2022 09:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666429537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=5u/+U3WMoQOALWqYdkq+g/H0rCbuuXYSAnM9TAS61+s=;
	b=DUsU397IVw2enhP8d7YRHxAuzAHL12nlD+bX3frXXHde7f1AVIA2yoMKBemaRsIuXw8F+M
	Mz28YQ1804U+l6zrfnxUzrLLjNaFznEa38wjwVdiRyWXw6Gzl024h7H7m9QVT6IeD1B8nc
	8M8aCAf2UqInZ9RztMHRIHmdkRJXmcw=
Received: from frank-G5.. (fttx-pool-80.245.73.148.bambit.de [80.245.73.148])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id DD7F5405AF;
	Sat, 22 Oct 2022 09:05:35 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/5] Add mmc-support for mt7986
Date: Sat, 22 Oct 2022 11:05:25 +0200
Message-Id: <20221022090530.16265-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mail-ID: 3d4a4418-e83c-4c0f-bb27-e18e2915e9b8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_020541_890706_DF97E641 
X-CRM114-Status: GOOD (  10.98  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

I've noticed the mtk-sd binding needs a bit more work get into a more
clean state.

There are 2 properties missing that maybe need to be added later or
dropped from devicetrees:
drv-type (which is used in mt8183-kukui.dtsi and set to <2>)
and
r_smpl (used in mt7622-rfb1.dts and mt7622-bananapi-bpi-r64.dts, both
times set to <1>)

i don't know their function and boundaries and i do not find them in
driver. I guess they are added by accident, but before removing them i
want to fix the other problems.

Frank Wunderlich (2):
  arm64: dts: mediatek: mt2712e: swap last 2 clocks to match binding
  dt-bindings: mmc: mtk-sd: add mt7986

Nícolas F. R. A. Prado (1):
  dt-bindings: mmc: mtk-sd: Set clocks based on compatible

Sam Shih (2):
  dt-bindings: mmc: Add compatible for Mediatek MT7986
  mmc: mediatek: add support for MT7986 SoC

 .../devicetree/bindings/mmc/mtk-sd.yaml       | 140 ++++++++++++++----
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |   6 +-
 drivers/mmc/host/mtk-sd.c                     |  14 ++
 3 files changed, 127 insertions(+), 33 deletions(-)

-- 
2.34.1


