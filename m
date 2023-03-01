Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33B9C64ED6
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 10:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Dict3KCgiP6hVNnCRnTepgtvSnJK9y9O5Se/KN8XyQ=; b=dE7umO6LVgxI6h/ytLVcRmakr+
	DrfZbJ1qp/vIu0MGszZnw8NGwccocbBTJnWLYdJk9nNo04zNBe0Q4CvrxuYAiEMxVnw5ulsioTa/3
	IS5PKU2GtzD/1eriyEFb6BHYIjig/3BpqZwueRru8CUj+6XPwJ+mNHSnapz2OitHYG7GHr3013YVE
	kfCpnU1GzvPNYG5BlJqt0qJ9FLJO+vinpaVgpuCr5sOSo0BYUvu5L98qWL4N1lHGzqqbdtKKcXy/P
	1HVdh8yXR/3JRBxmIwkRFJqr2H1AIxTyJQNzuBn8VIsAQ6mH6foPAmeW1KQ6JA2qopb2OW2+pX3DN
	iV7zMShA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJFv-00FgH8-0L; Wed, 01 Mar 2023 10:00:15 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJBT-00FdOt-8B; Wed, 01 Mar 2023 09:55:40 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 833FC6602126;
	Wed,  1 Mar 2023 09:55:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677664538;
	bh=mY4hfSUTwSHqh4eiis9sq5UHYdSJwKcNza4C9t+I8c4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZtO9PRfSN0kIoXXl1gTXx2bnYG9+nSCiHkjmLShKx0sMNLpLhig0ayN/SGKNI9Hl0
	 v2HUBw6vvyOtyazIXL27MqkHiv+sTGOqEZHxaRJDQhYbB0P0fLF8+/e/MKzC7rQrvD
	 CGegsyzWXJkl7P8sv8jyGrq9AU/rVPEYCK+4dUl0JMJl5NSfD4fF7pe29jIjeGC08W
	 Dw3+bEDs5bUP6aGfMLAnGoPVId6DcHiq2NA5onKi6gVceuQg/qiZj9YdD8Awew+kR/
	 rkEeXj/+6tuf94gqPgsfQkc342hP/IVId6Ew6pFeeEG9vuBNQQJ8LwlEaUdDS5ghy7
	 UThANP0zQ08Bw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v4 13/19] arm64: dts: mediatek: mt8192-asurada: Enable GPU
Date: Wed,  1 Mar 2023 10:55:17 +0100
Message-Id: <20230301095523.428461-14-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
References: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_015539_446026_94EFD6C5 
X-CRM114-Status: UNSURE (   8.62  )
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

From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

Enable the GPU with its power supplies described.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
[wenst@: patch split out from MT8192 GPU node patch]
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
[Angelo: Minor commit title fix]
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index f858eca219d7..5a440504d4f9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -275,6 +275,11 @@ &dsi_out {
 	remote-endpoint = <&anx7625_in>;
 };
 
+&gpu {
+	mali-supply = <&mt6315_7_vbuck1>;
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
-- 
2.39.2


