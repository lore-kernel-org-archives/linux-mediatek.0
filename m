Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA4DC43217
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Nov 2022 08:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mdh0JZbus3L1IA6cFN14kANToV9RcRy1oDUVqP1gpbA=; b=k4+1YzXR67ZzG3
	fQ/PjwqO6Kj7aFeSonuyivNibXozQLNv+gqLpovF1b6wh5gJtKmPS4jubcjIocdRKZ5mQGYKYieDb
	I/YSYmg0Yw4qUxSBi7wRp2YTrxNSrnRSfuN4mBKQSEs2Rjj+COh9OsXp/rQpElUgsQhZBzKe5z0J6
	XyFurJfxF1b4VQxAas3d5GhgCW9nvfmFp3dYLUlQfJedTDsZVvaGeM79UT3MHgJGSY+7UGXdsGDNW
	vcZz6rXtCNpvF+MghravG3Fhniv/3CiKU5oPuLt9V0+8UtuuqhshGsN3eWXBI6DIC8OW1YnvqcI1w
	H1Wxgky6c4QxOWENCxWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orab9-007dze-4m; Sun, 06 Nov 2022 08:01:43 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oraax-007dv8-2G; Sun, 06 Nov 2022 08:01:32 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id 3E118100067;
	Sun,  6 Nov 2022 08:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1667721688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mdh0JZbus3L1IA6cFN14kANToV9RcRy1oDUVqP1gpbA=;
	b=xHtUEUBvoMD2UHy2lWvVoW/VttiFBdmv2Cs1lqwaCXq7isW5cxsTF57/T6oOL9JYEOWXt5
	hX3Fc32pOwwttmWEmRZM1Qqi/2peCIuWYxMoOraDBuI4W59oiyFOahAmbTEYlCym6Fneyi
	FnYCHT6RYRd3Ai+aIEr6zWLn2OAM+KM=
Received: from frank-G5.. (fttx-pool-80.245.79.199.bambit.de [80.245.79.199])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 701C03602A8;
	Sun,  6 Nov 2022 08:01:27 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/6] update mediatek MT7986 pinctrl driver
Date: Sun,  6 Nov 2022 09:01:07 +0100
Message-Id: <20221106080114.7426-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: a546a87b-a989-4c8a-a19b-b2a470829b89
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_010131_292841_CCB56A9A 
X-CRM114-Status: UNSURE (   8.34  )
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

v2:
- added patches previously postes separately which are needed to have
  dt binding checks clean
- fixed odd numbers in comments for mt7986_pull_type

Frank Wunderlich (2):
  dt-bindings: pinctrl: update pcie/pwm/spi bindings for MT7986 SoC
  dt-bindings: pinctrl: update uart/mmc bindings for MT7986 SoC

Sam Shih (4):
  dt-bindings: pinctrl: mt7986: add generic bias-pull* support
  pinctrl: mediatek: fix the pinconf register offset of some pins
  pinctrl: mediatek: extend pinctrl-moore to support new bias functions
  pinctrl: mediatek: add pull_type attribute for mediatek MT7986 SoC

 .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 108 ++++++++++++++++--
 drivers/pinctrl/mediatek/pinctrl-moore.c      |  49 ++++++--
 drivers/pinctrl/mediatek/pinctrl-mt7986.c     |  80 +++++++++++--
 3 files changed, 207 insertions(+), 30 deletions(-)

-- 
2.34.1


