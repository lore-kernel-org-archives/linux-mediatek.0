Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C93C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 12:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tEvS5zuixhFkZoPcQ0ZOs8lknoy83Iml9hhevEpqclA=; b=xSFTAAySkEQ8dh
	zHdQ9M8CO3H1t4Ptaba/nOd9dcacEA3Ani3gdeqn0zXB2gFn0Yv3QEEN9VmxwpvD2Yidpzo0iwiSc
	WTns2qSEhkFelm1/zAiet6JrqoocwZEXXtwHJqDhH7u29/8inm5hTFCFE4DYNj07RCk0Yz5RiRhGu
	xIM1HMvVchSLXvl8JHjWhBGKpk5ug+PWIWurJZoLqNLoZfBS6eFGlKzNZk6zAcWYPE8NuDFE6MK6X
	fwzNJqCp28v5YECzeBNFHnAIa42YjGk6fsgHvTvTyVqHQw4StPMTAZwMIUR7ZebamhzIVrOvmrgPm
	DOlgpCQaGVC4yWWnt+CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkPny-00B9An-4t; Fri, 29 Apr 2022 12:33:02 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkPmi-00B8a5-SB; Fri, 29 Apr 2022 12:31:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 03BA4B83514;
 Fri, 29 Apr 2022 12:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50100C385A7;
 Fri, 29 Apr 2022 12:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651235501;
 bh=exjKm3VFVKzVcumY92xZaKOxxHTCyDMi2gjz1DFJ8rI=;
 h=From:To:Cc:Subject:Date:From;
 b=fEVj3LnRk4lpWxmpWy999am5gzNGlO8qKegbzHsH+//u6y0djwIHdkjluyMUX9JrV
 HF3X49/Mag5U/1atxeTQgCYNO1zkGoIw/Ws+76Mk/narioQwQktdkDV2IF8WGnTbOE
 QUjuL+GF43eLDcUDF/SId3MOE8J8kmIiuB9rRjl5ufQbrDUygLkCoC6qJLDM2mtSvX
 BikcctCmr3NSJC5C1B0JFtDBuqDqjWHU2UYYED1aAabNk4PfsQWPQJsqO5vlbK74Lq
 kCQsoFBB0pKKFmhVaKTSRUEgnb2s3ZiIdfr1iglryq/Wq+RJmZVpOesY22KL7EUEpB
 GJhTiJFurpD+g==
From: matthias.bgg@kernel.org
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: allen-kh.cheng@mediatek.com, weiyi.lu@mediatek.com,
 chun-jie.chen@mediatek.com, linux-kernel@vger.kernel.org,
 ikjn@chromium.org, miles.chen@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 0/2] Delete MT8192 msdc gate (was "clk: mediatek: Delete
 MT8192 msdc gate")
Date: Fri, 29 Apr 2022 14:31:30 +0200
Message-Id: <20220429123133.28869-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_053145_086321_35674DE9 
X-CRM114-Status: UNSURE (   8.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <matthias.bgg@gmail.com>


The mt8192-msdc clock is only a single clock gate. This gate is accessed
from the mmc driver directly. With
4a1d1379ebf6 ("arm64: dts: mt8192: Add mmc device nodes")
the only consumer of this binding was deleted. Delete the binding
decription and the clock driver bound to it.

Changes in v2:
- Delete compatible in binding descprition as well
- add Reviewed-by tag

Matthias Brugger (2):
  dt-bindings: ARM: Mediatek: Remove msdc binding of MT8192 clock
  clk: mediatek: Delete MT8192 msdc gate

 .../arm/mediatek/mediatek,mt8192-clock.yaml   |  8 -------
 drivers/clk/mediatek/clk-mt8192-msdc.c        | 21 -------------------
 2 files changed, 29 deletions(-)

-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
