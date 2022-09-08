Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1AAC6FA8B
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 16:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yuVLdlSivq+NIS0Hljijl4vxyP+EL8e1oE/4CeAIbUU=; b=PH1gTw27ki1guKGfnanNvW2/RK
	uMxu6ILfrGh3cMy9kt70sgtsGLeNp384Y1/lHmxWUcXUYNasQFBxw/H8c3F2UQ92A/t/fEFmKYlkN
	1fzva7R7CmQLZuaj8UJQQgywuQ9y/PIqGErjkJ/2Q/A7wiOmyXNpYdIUZ8sTstXzAn6Z3q67zm4Nq
	4XH3ZErmzrnrVScEqEJfY5xkZSnH/EXK9FMSnIhEZ6XPSOzQer4ksXSC4uJO3kzNTIdT3zZSFftuj
	0u9Pz+rTpGwk6RXtmcUj5Rw5h2EVn6YQKmz6d+5wkfaPFVK5R0b8P5alL4Iqt+bPzVCxTKhlJaGzU
	cPWNu61A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWKAg-005chs-Em; Thu, 08 Sep 2022 16:14:30 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWK8S-005b7X-W6; Thu, 08 Sep 2022 16:12:14 +0000
Received: from notapiano.myfiosgateway.com (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AD3D96601FB8;
	Thu,  8 Sep 2022 17:12:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662653531;
	bh=SRRZEDOrigFe40m70uP1YOWQu2qUoAwATpVN85CzcVE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DDPSnmG0UfBIcXfnojcglupeBBvqwhIGgyQTiJG2yrEFFrW+KHmjVRnzK7wZTpb5g
	 a2YXS6j9sGIKnS2F2UD9gyMjE+p/F3iRQZT/ryRH69sqCBc8rR2fPUpKrd2i7Bi5s4
	 gonOnjVhA5Vhh8ftRQKYBJBXbmER6nVvTOaGLbfvdgDqqA/uklVrALNOhPJT1fWM0d
	 CEI4GETryx6577pHhAh9R5wFjEZwXrbmUROvKbQHltXREKkr2ojZvPkKdsBSfVSCQz
	 H0dzIq4mrrE80P24DPIiftk/8PrIf0NXvuFyWkocbGL5CJDAIJXvKfOaMzbpXr+ZNc
	 q08piEW35Io9Q==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 07/10] arm64: dts: mediatek: kukui: Remove i2s-share properties
Date: Thu,  8 Sep 2022 12:11:51 -0400
Message-Id: <20220908161154.648557-8-nfraprado@collabora.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220908161154.648557-1-nfraprado@collabora.com>
References: <20220908161154.648557-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_091213_205698_F69E2C62 
X-CRM114-Status: UNSURE (   9.86  )
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

The i2sN-share properties were never documented in the dt-binding and
thus shouldn't be used. Now that the ASoC machine drivers are setting
the I2S clock sharing internally, these properties are no longer needed,
so remove them.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index b4b86bb1f1a7..42191b3025a9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -221,11 +221,6 @@ tboard_thermistor2: thermal-sensor2 {
 	};
 };
 
-&afe {
-	i2s3-share = "I2S2";
-	i2s0-share = "I2S5";
-};
-
 &auxadc {
 	status = "okay";
 };
-- 
2.37.3


