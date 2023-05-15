Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4143EC7EE2C
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 20:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jqiqb2iWttvdC3HhbyFxiKycIZ3v56zeARkXn2CaIG8=; b=jRfrB2bL08iORU00YHIVLoOpEd
	OhnVmyDbYWDiX2Pw2ueTP+wrdfYpbdS655RpwZlHQmxEzxXxhmeet3FfJc9eZloct63d85o7cbTK4
	Q6MI/f4qFkSjJMjQln8h4kfZBn5JWg4ekdNkM98QHVBRI7eJAAJMd2x0QCS7WYI1HeoS25YmN4351
	BTuCnQxQHn5d6qlj8W3hbeM8nme1IjnICyRMHlFgx0G8zQR6+QziRcFQZHti9pZ2Gi1Db1CNFP9/2
	2HviAytfq1gyqeySYvqOHJuxVb2u6yifxbwa7c4bBavw+6J8K0JZSd5euUA5CTAfMS0M2PNDqB29a
	Yzoeqt9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyecH-003P4g-0X;
	Mon, 15 May 2023 20:16:21 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyecB-003Oxj-13
	for linux-mediatek@lists.infradead.org;
	Mon, 15 May 2023 20:16:16 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-643995a47f7so13765093b3a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 15 May 2023 13:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684181772; x=1686773772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jqiqb2iWttvdC3HhbyFxiKycIZ3v56zeARkXn2CaIG8=;
        b=BA3eC9fLQ13vqDEGsDHWDDvCuyngMEyna4+dAlzia76PnarszsniqtMipx0u6e/Cgu
         pZhndmlgcmZL7Gzwwo/LJO6pj3Xy+eIAe7K/9wo4PDEpUyEfaxXYbjl62N6VDTzs+HYc
         rEYn7k3sYXQ8wqyaLPlkSZ/xbOOQKI//ZA1iM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684181772; x=1686773772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jqiqb2iWttvdC3HhbyFxiKycIZ3v56zeARkXn2CaIG8=;
        b=cEUuj2YtEW4irZeGFqD0IouEhZo+KWl3e8FymtTxQzwCvHpydG518sTDzNyqCxa8dX
         0DyIV0/fWcvRIJpfKcQfmoLMj85/AO0z6fxynuLM6KB6MLv8RxftKlMDnxsk9pmQoYfx
         GSMg5g8Lzi6r0A6of2Kj8y+QUbKgT+h/pPhyYOZmJNf5FQTP9NN0MIrdlPkuSputq48t
         7QVu+ib7UQ70pXCGC6qyc3Ny6oaoX53CK+PMNO2Q/PDEaEhuS6/H/OwnaB4P4+twUCdt
         1LAgNyDQMg///En1vABGKRY9sSlEBVddNQQMVS3OxSCrcJENaTfXzaw5YKVrVRMn5gY2
         U9cQ==
X-Gm-Message-State: AC+VfDziEbN77JJBld22tmMAPcTMEVfRFkQeesGN9Ohf4jEYUc8b7Lz6
	HJRhi7hv/2MA1Y3HGAh8OJCHuA==
X-Google-Smtp-Source: ACHHUZ4afNWoz/IHm3+tYuCUS2VKPE/E3iS8LS0IzUgQs4MtgxjGipjnhVX+ILNAtW2aKIz0GlGgLw==
X-Received: by 2002:a05:6a00:2285:b0:643:88b1:9bd1 with SMTP id f5-20020a056a00228500b0064388b19bd1mr45311433pfe.26.1684181772491;
        Mon, 15 May 2023 13:16:12 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:9f33:9d98:277a:d4cd])
        by smtp.gmail.com with ESMTPSA id a19-20020a62bd13000000b0063f0c9eadc7sm7981411pff.200.2023.05.15.13.16.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 13:16:11 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	Eddie Huang <eddie.huang@mediatek.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	wenst@chromium.org,
	yidilin@chromium.org,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	jwerner@chromium.org,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	Ben Ho <Ben.Ho@mediatek.com>,
	Seiya Wang <seiya.wang@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/5] arm64: dts: mediatek: mt8183: Add mediatek,broken-save-restore-fw to kukui
Date: Mon, 15 May 2023 13:13:52 -0700
Message-ID: <20230515131353.v2.3.I525a2ed4260046d43c885ee1275e91707743df1c@changeid>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
In-Reply-To: <20230515131353.v2.cover@dianders>
References: <20230515131353.v2.cover@dianders>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_131615_387093_AC24CA80 
X-CRM114-Status: GOOD (  10.95  )
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

Firmware shipped on mt8183 Chromebooks is affected by the GICR
save/restore issue as described by the patch ("dt-bindings:
interrupt-controller: arm,gic-v3: Add quirk for Mediatek SoCs w/
broken FW"). Add the quirk property.

Fixes: cd894e274b74 ("arm64: dts: mt8183: Add krane-sku176 board")
Reviewed-by: Julius Werner <jwerner@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Changed "Fixes" tag.
- Moved from mt8183.dtsi to mt8183-kukui.dtsi
- mediatek,gicr-save-quirk => mediatek,broken-save-restore-fw

 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 63952c1251df..8892b2f64a0f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -292,6 +292,10 @@ dsi_out: endpoint {
 	};
 };
 
+&gic {
+	mediatek,broken-save-restore-fw;
+};
+
 &gpu {
 	mali-supply = <&mt6358_vgpu_reg>;
 };
-- 
2.40.1.606.ga4b1b128d6-goog


