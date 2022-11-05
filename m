Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2711C4332F
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Nov 2022 08:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LLyTjEajQKXrzLut9HyKnIBDU1ImS4d+E858cGyWvT4=; b=OaYvBYuSBHl5ax
	tuTvmQRm71rIwWupR9TkmRqjxupJ/VQmx9clVKOXerKNkrGDeJ0IendSROgff/a/3Bck91Ih0NWTe
	95C/fFwVAknzOqOwJhwWbgzntrPZwQDQxWuF1GbcLmPE81Ck0GCkni63Zlsu3OxOYUy+/7zL1TBwP
	saK8/u07VSDrC1YRJzkZY8gurByYMpijgZINQCzAJlZeGvWi5j3Nz2udSDdGcjxZeIV0CFZLWGWlW
	SGppBc04eeue5riBE3KtLPuUaCLiNpWJ6vWHBMqtqb5Q3MFTZZ6rqFfFkOSrAQDaGXJObMGB8iP+j
	8gCsZqGl+AmA07GlwhAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orErr-0068it-Tu; Sat, 05 Nov 2022 08:49:31 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orErh-0068dy-K1; Sat, 05 Nov 2022 08:49:23 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id 797B940474;
	Sat,  5 Nov 2022 08:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1667638155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LLyTjEajQKXrzLut9HyKnIBDU1ImS4d+E858cGyWvT4=;
	b=fXzVRVhOEsem+/1MiKp6X6bosBSHDR6g4acMiVPeMafldXfTZGKdcf0Rjiso5oylBs43i8
	50wnqnAWFfYOHuyp0+eJSiJR1I2VltPFfvWPEb64Yux2Ww8j/Aq4hp3K/kQXy6jHg3X9hf
	8yrqDSUX//83jp/u0mje9/sDSI+Ufg4=
Received: from frank-G5.. (fttx-pool-217.61.159.50.bambit.de [217.61.159.50])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 6240710068B;
	Sat,  5 Nov 2022 08:49:14 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v1 0/4] update mediatek MT7986 pinctrl driver
Date: Sat,  5 Nov 2022 09:49:01 +0100
Message-Id: <20221105084905.9596-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: bfc0057b-9111-4c39-9cec-2accbbaa280c
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221105_014921_824581_C1EF8619 
X-CRM114-Status: UNSURE (   7.88  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

This patch series introduces common bias-pull* pinconf support to MediaTek
MT7986 pinctrl driver and fix some register offsets in the driver.

Sam Shih (4):
  dt-bindings: pinctrl: mt7986: add generic bias-pull* support
  pinctrl: mediatek: fix the pinconf register offset of some pins
  pinctrl: mediatek: extend pinctrl-moore to support new bias functions
  pinctrl: mediatek: add pull_type attribute for mediatek MT7986 SoC

 .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 50 +++++++++++-
 drivers/pinctrl/mediatek/pinctrl-moore.c      | 49 ++++++++++--
 drivers/pinctrl/mediatek/pinctrl-mt7986.c     | 80 ++++++++++++++++---
 3 files changed, 157 insertions(+), 22 deletions(-)

-- 
2.34.1


