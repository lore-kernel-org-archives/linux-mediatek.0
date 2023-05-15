Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B634C7EE2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 20:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bSFZLbNpPgEje16hneDjcdrQcGQsPzQHluB44E8FHjY=; b=uzLt/y+gJ8gdaH3vcSkkU8aNGI
	zt1dA4GDLkc5PHVHHkmFK36AZUH6nXunv+LOebqujxSJsitpoECS8b7Zch86xhUnS5PLW6Q8HCuD5
	9+CR/mHzP8987QjPOgG5Qgx5XCAZLdTluZYPxGG3RVJ8eP6S3RuYs9OpYBYyyC3tiDIGhPX/Cgcvn
	dMX0SuImLv0eBVnMGPGUhzbdBrjuEfsvUOBdM69BhWHM26vrrTvEUqQT+xHQdEHpZV/JO9jUZcEo3
	8mL+n2QYQ2RTHqSOpNB3iow9GiG/VKBri7Mbg4vmITUtHzEhLF/y0SDt86Q2aHyL2oYDlWn6G4zg+
	njhKqSkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyecK-003P72-1Q;
	Mon, 15 May 2023 20:16:24 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyecB-003Ozh-16
	for linux-mediatek@lists.infradead.org;
	Mon, 15 May 2023 20:16:18 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-643846c006fso14050985b3a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 15 May 2023 13:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684181774; x=1686773774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bSFZLbNpPgEje16hneDjcdrQcGQsPzQHluB44E8FHjY=;
        b=NzeeeyMk/hpNF9RAIv4WS+B4v3mYCs9HKMq562nfambK4GSGTB0CGnrcK2r+VFo780
         HOrS4BGRvf+d3B4kDMaLMX4m2Mw73l4go1EcX5Ax9aT0LcH8ZWquW7hE67EC5SC5ZbyG
         BFfEo7608Jp0pE+46I0xG19lunTRA96KvfVhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684181774; x=1686773774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bSFZLbNpPgEje16hneDjcdrQcGQsPzQHluB44E8FHjY=;
        b=XtjKmQ/vaFAIWt8NdDWHAuc7vOtXFS1o6JK7YnuWgptM8YPhqmhYyNj1x88uz+RrhX
         TB1fCNNik26sb29DbsjPHNIEKf3zwlbB55diiE58wL3s+aajbE/4OMi4ht5wX5eIHnB5
         OY2iu1l5sJiHBscfk7vP3+kco2LEmG/6VFDqVzEyOL7ZbGxkb3fIvfByE3nFWbKisq73
         1iZYXknrotLcSl+LEu5XzDUxV7zxCuzR/qsp9FHzBwTUAan682+Z8dmVAewDPpVurjs8
         NMnDPlKoSBwxMMD5c7/PZFEBrjh03naRqXJ54vFCpphim6A+xW2P8suxQLGYcmItJIuR
         neTQ==
X-Gm-Message-State: AC+VfDyBoo2sWOXLfxCh4iSbyfP7CO0eoTPirGV09g1bbMxZycgO/hwR
	6r/pbhKArDZFj5XsVubBv+1h4w==
X-Google-Smtp-Source: ACHHUZ6AiGghtlJlsLLlfd1VuDZv1nQaPFrstBdAfKOZ49IsIsdqeqYgi0pnJ00tpX1ojW99Y/UVeg==
X-Received: by 2002:a05:6a00:188f:b0:63b:8eeb:77b8 with SMTP id x15-20020a056a00188f00b0063b8eeb77b8mr50708074pfh.13.1684181774645;
        Mon, 15 May 2023 13:16:14 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:9f33:9d98:277a:d4cd])
        by smtp.gmail.com with ESMTPSA id a19-20020a62bd13000000b0063f0c9eadc7sm7981411pff.200.2023.05.15.13.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 13:16:14 -0700 (PDT)
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
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: mediatek: mt8192: Add mediatek,broken-save-restore-fw to asurada
Date: Mon, 15 May 2023 13:13:53 -0700
Message-ID: <20230515131353.v2.4.Ie7e600278ffbed55a1e5a58178203787b1449b35@changeid>
X-Mailer: git-send-email 2.40.1.606.ga4b1b128d6-goog
In-Reply-To: <20230515131353.v2.cover@dianders>
References: <20230515131353.v2.cover@dianders>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_131615_411381_00030692 
X-CRM114-Status: GOOD (  10.70  )
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

Firmware shipped on mt8192 Chromebooks is affected by the GICR
save/restore issue as described by the patch ("dt-bindings:
interrupt-controller: arm,gic-v3: Add quirk for Mediatek SoCs w/
broken FW"). Add the quirk property.

Fixes: 331fae2fc922 ("arm64: dts: mediatek: Introduce MT8192-based Asurada board family")
Reviewed-by: Julius Werner <jwerner@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Changed "Fixes" tag.
- Moved from mt8192.dtsi to mt8192-asurada.dtsi
- mediatek,gicr-save-quirk => mediatek,broken-save-restore-fw

 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 5a440504d4f9..0e8b34117090 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -275,6 +275,10 @@ &dsi_out {
 	remote-endpoint = <&anx7625_in>;
 };
 
+&gic {
+	mediatek,broken-save-restore-fw;
+};
+
 &gpu {
 	mali-supply = <&mt6315_7_vbuck1>;
 	status = "okay";
-- 
2.40.1.606.ga4b1b128d6-goog


