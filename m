Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F98DC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jan 2024 16:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fn9i81xP7ZEmQqZw0cHUB5qam/4Zd8WwUWJ3g2A50Zs=; b=DLMgH11TRtyVDK
	Rct8apohiIxDw6XFm9u6KMpm98VJOF8kfc30FPMvsi0jWVfvHMouLWx7q5L6m+AHQo/7O7p7qOvcb
	O11aFhABqZw5Ro7hmmg5+NkfeJMMkrRVSpa+//iqisb0Q+gFhpgKnh3+91MPnhSBl84fIhliBNbWq
	7MxJjrxNw2kprRiTxDjus7H2Fgd049elU1DPHezSVNhQWDf73aqcazwpmUVhsbDdepnbiWwZC7P9B
	jRDN4eA9YmKPvLiQUJMiIzJphQjGnt20jFUctLWSzW6YBp5ZAm2264EDhMbdjbd662GJ3P/swmDfM
	bkKCvXbMEggLPDRCLV/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLmwe-00HIh1-1q;
	Fri, 05 Jan 2024 16:21:16 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLmwW-00HIcX-2e;
	Fri, 05 Jan 2024 16:21:12 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id CB4AE5FD8F;
	Fri,  5 Jan 2024 16:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1704471664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fn9i81xP7ZEmQqZw0cHUB5qam/4Zd8WwUWJ3g2A50Zs=;
	b=S1GKJ1tAYxprTNflZhTx9uOs6ybollM4dzkhgH7awAEpawoFGquR+ImYthbmzCyujR8uMn
	H2ARnzNafZr1Jh9zPlXOlEGVy6zP/+bIivUFnU/5Dq0G1CI+Qki/PVvAlwNC3ZPKrsIDkp
	DxgkmjUS0us2GbPrEc1CxKmfetbsc/E=
Received: from frank-G5.. (fttx-pool-80.245.77.34.bambit.de [80.245.77.34])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id B682B360303;
	Fri,  5 Jan 2024 16:21:02 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 0/2] Add reset controller to mt7988 infracfg
Date: Fri,  5 Jan 2024 17:20:53 +0100
Message-Id: <20240105162056.43266-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: d5bc6535-430f-4be9-8228-d74279bce75c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_082109_008102_C5600E96 
X-CRM114-Status: UNSURE (   8.27  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Infracfg on mt7988 supports reset controller function which is
needed to get lvts thermal working.

Patches are based on clk-next due to recently added mt7988 clock driver:
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git

changes:
  v2:
    - change value of constant to 0 from 9
    - add missing SoB and commit-message for binding-patch

Frank Wunderlich (2):
  dt-bindings: reset: mediatek: add MT7988 LVTS reset ID
  clk: mediatek: add infracfg reset controller for mt7988

 drivers/clk/mediatek/clk-mt7988-infracfg.c    | 20 +++++++++++++++++++
 .../reset/mediatek,mt7988-resets.h            |  4 ++++
 2 files changed, 24 insertions(+)

-- 
2.34.1


