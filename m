Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1F4C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 13:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Acrc8CuJb9673RJheAp2PuGkCR+tTGJM3uZl4Pw8JA=; b=hahLcVD+I9/o2cLFmtZP0yLMI/
	EDt5mQz3/NarXwO9gPJkDRMu23Mibdvd4x0oLhakAn8ohjbElIY3082skZDHTm3KcPQqn/LPXPXyr
	kwVE+oQYUMxgLp3MwZFsifvVCTlxWE5oyO8QwTnloGJE6u8nDxaN2GmEXKHtv2T8sdZA/3As6VCCv
	wdKxpJxKMo1Egw4a/vHM7JWfKfPkcwafWU6xxVS0pHbvqTDEwzdR6jJ6c+IS1bQOIkbQCYdir9uHa
	JBjAA2lyYjqVoYabSeMK/2Olg521lcDdJ1Z7ZDziDLvaM7szS2mz+uiYLqGjPC9Uqb5VIoEuUBc4w
	y08Edivw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVC4P-00GemQ-By; Thu, 23 Feb 2023 13:55:37 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBtG-00GYQf-UL; Thu, 23 Feb 2023 13:44:08 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2DDFE6602206;
	Thu, 23 Feb 2023 13:44:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677159845;
	bh=862noHI/rREDzYDVTtjiXXlf1hVscfBOCM0dedbpEnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MGWa/tZWigRcJxgxhM8A1iWWkGMGzeUFou1U0A3VjGFkhm0eJ0rD6ThrC22N/K3pm
	 U1DDgnyOzUqJVhcZhI4RR971z9KFzH/cBaPKtISZHOH9+u6Jm9qoCyzEx6O+Ub62xU
	 pdLvmXZ0VihuTVW1bc6iZxSlh1NqCv/pgjSbEd0xeD33jT+r7ArI9k/AL/1UWEmiwk
	 AGdJFK6hu7hK87LRdIKMlnuJ+Sqs/0OMb8e+H6Sh3gsganlfZuGiJdHsVZAC+dCtLF
	 OTteXY0QB+l7iR+EiSUOkvEgtFhlc+OJm/Ch8jErxR0TfNBPAzNaXwX7iT88BW/EuK
	 iY59O+s5v/wbQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org
Subject: [PATCH v2 15/16] arm64: dts: mediatek: mt8195-cherry: Enable Mali-G57 GPU
Date: Thu, 23 Feb 2023 14:43:44 +0100
Message-Id: <20230223134345.82625-16-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com>
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_054407_187336_83C66F7B 
X-CRM114-Status: UNSURE (   8.37  )
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

Enable the Mali-G57 found on this platform with the open-source
Panfrost driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 56749cfe7c33..24669093fbed 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -238,6 +238,11 @@ dptx_out: endpoint {
 	};
 };
 
+&gpu {
+	status = "okay";
+	mali-supply = <&mt6315_7_vbuck1>;
+};
+
 &i2c0 {
 	status = "okay";
 
-- 
2.39.2


