Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC64FC4707B
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jan 2024 17:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sOz1O4pjxE/REIdHLNp2qfDDHbv7PuT58fkQ9O14R/E=; b=xvjGq7v69/dIvM
	vQ+rRx2DtBfLYbHre89FFb/QRwvc/LgNqs1dzUL1DOgfagCJSYrCEX5bn+drNd4Tkr3mizzcvuSc9
	XtGJzkPftT2SfaJUQgtnIuG8ROv+MjfcToPpMeATF5r5yA5LGn/Cn70qkQTT+84dWp6fS1opmzxkp
	B/xG8uFMd5QWwP+YJ6FGpRtyH4HAni4Q0ZtX+32Xx00J5lJIRR/Sj3SaCp35ZVWK4evd3ODG6LqVx
	iyGrZcegt9u9WqsV7syI8h7RELXAeJHsV1SwLALIqkI5u/CYp/qffSdQmAsmt4I9L1v0h5Ra9SQO+
	gU8IVzWpZ0Lid6JLChAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLRhD-00ErdY-2K;
	Thu, 04 Jan 2024 17:39:55 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLRh9-00Erbi-0W;
	Thu, 04 Jan 2024 17:39:52 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout4.routing.net (Postfix) with ESMTP id CF7AB1014B6;
	Thu,  4 Jan 2024 17:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1704389986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sOz1O4pjxE/REIdHLNp2qfDDHbv7PuT58fkQ9O14R/E=;
	b=c975Y8NJKjmPAZwNvp6m95HCwfoTLvEEwhYOj405qHLejD130sBUkMvTEDp4Boi5+g6UJJ
	n31KX0wNmaG4nKwgMRCvyguYW/E5jWC43/gA5+ZFFCbk0Ui6zZjup8kYDmRpY8d3FrcDjN
	LIMOMlbVQ6ZyA7bX1h7kMpuXIRIjSFE=
Received: from frank-G5.. (fttx-pool-157.180.226.237.bambit.de [157.180.226.237])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id A3BA5100671;
	Thu,  4 Jan 2024 17:39:44 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH 0/2] Add reset controller to mt7988 infracfg
Date: Thu,  4 Jan 2024 18:39:28 +0100
Message-Id: <20240104173930.13907-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: ec8c89cb-a0c3-4261-a987-75d4585d7863
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_093951_392317_9C3C13D8 
X-CRM114-Status: UNSURE (   7.26  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Sam Shih <sam.shih@mediatek.com>, Michael Turquette <mturquette@baylibre.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Infracfg on mt7988 supports reset controller function which is
needed to get lvts thermal working.

Patches are based on clk-next due to recently added mt7988 clock driver:
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git

Frank Wunderlich (2):
  dt-bindings: reset: mediatek: add MT7988 LVTS reset ID
  clk: mediatek: add infracfg reset controller for mt7988

 drivers/clk/mediatek/clk-mt7988-infracfg.c    | 20 +++++++++++++++++++
 .../reset/mediatek,mt7988-resets.h            |  4 ++++
 2 files changed, 24 insertions(+)

-- 
2.34.1


