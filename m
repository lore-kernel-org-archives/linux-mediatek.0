Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A3ACAC58E
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Sep 2025 15:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vT3zc1P7AscQ3qHt0AONayuX979LBsagO3ReeDrvc8E=; b=dr/AtcRZJeX/f8TKTia9X+Dw8l
	8feEII5uZm7Wp/GeI5FOIPotS6e13SwwcQXtAeBgbAlAywDJS2MoI6fx9PWxKnvxi6M65Xkj5T1mw
	xc+fLgGPwnkX67r+BOY63g+qYIuQ3rFePBew8TDNrKHIY/fdlkRi/NGNqozwGlKLIfP8EVfJDeRDW
	Sp7+NVja2mmZFfXax7Cavwd7XEcS3gAmvRr5iYcwU9r8rxuTvi3knJkAZkOdHVhq3yAa3AwqGswiP
	3Mop1bfhF0HOsVSaSer24fS9dIJ1EbUVAi+Wb0OSPpTQjHOzHl84TUV2EuAW2x0SfP5eREmTGKLN8
	/EYq1eig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwj1O-00000003oa2-3EjV;
	Thu, 11 Sep 2025 15:15:38 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwj1M-00000003oY5-0ScG;
	Thu, 11 Sep 2025 15:15:37 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1757603687; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fN1oUjrQCtFrarLOSqPeTAZ/qjlPA1iQBPsVZbcnUCqHoCsB2EdvpXJXjPzPyBvMaYVKAkO1B1fbjK9hxa0ADRTBHkDbucsqhAGUg8nEkj6fCc7goDzq/I+vEXbML4AWtW4O8Lwy04Jk3HlGxmSVAugYrGjouy6kM9U8xlG/QGI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1757603687; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=vT3zc1P7AscQ3qHt0AONayuX979LBsagO3ReeDrvc8E=; 
	b=lwu4fk9jAjv8xW9gu/KJ8VPUZvFT9wo547buNeskkF58nqNOr5asRRSxZBfTMexRMx8L2ya93Wff1m8dDKxDdket16UiTri2RTivj4g5QcPe5uH42vDAR+qa9PY6a6yoBDJhI/q4pZUCM4tMb+pSGGqiMY40/V4naKG+NIqxZtI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
	dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757603687;
	s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=vT3zc1P7AscQ3qHt0AONayuX979LBsagO3ReeDrvc8E=;
	b=W/8Q8TfPU9/6++HGf4rco1kTzpSzs3h5uRssn93jKUahoQlvfobdcE6OlWl/DQZw
	+gRZ4uKC4dRxMkrilsKjVwILidN22UsV2JUdbb1Y+nlmw5hTroUK7K4nN2PctgzEWUW
	SyxRxWIDGPvPVfmx37H3ZbYE/KS0YlrLA/6riH9c=
Received: by mx.zohomail.com with SMTPS id 1757603686217696.2957018828596;
	Thu, 11 Sep 2025 08:14:46 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com,
	amergnat@baylibre.com,
	andrew+netdev@lunn.ch,
	andrew-ct.chen@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	ariel.dalessandro@collabora.com,
	broonie@kernel.org,
	chunkuang.hu@kernel.org,
	conor+dt@kernel.org,
	davem@davemloft.net,
	dmitry.torokhov@gmail.com,
	edumazet@google.com,
	flora.fu@mediatek.com,
	heiko@sntech.de,
	houlong.wei@mediatek.com,
	jeesw@melfas.com,
	kernel@collabora.com,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	lgirdwood@gmail.com,
	linus.walleij@linaro.org,
	louisalexis.eyraud@collabora.com,
	luiz.dentz@gmail.com,
	maarten.lankhorst@linux.intel.com,
	marcel@holtmann.org,
	matthias.bgg@gmail.com,
	mchehab@kernel.org,
	minghsiu.tsai@mediatek.com,
	mripard@kernel.org,
	p.zabel@pengutronix.de,
	pabeni@redhat.com,
	robh@kernel.org,
	sean.wang@kernel.org,
	simona@ffwll.ch,
	support.opensource@diasemi.com,
	tiffany.lin@mediatek.com,
	tzimmermann@suse.de,
	yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sound@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH v2 10/12] arm64: dts: mediatek: mt8173-elm: Drop unused bank supply
Date: Thu, 11 Sep 2025 12:09:59 -0300
Message-ID: <20250911151001.108744-11-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_081536_206843_86A5AAA0 
X-CRM114-Status: UNSURE (   7.42  )
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

The mediatek,mt8173-thermal device tree binding schema doesn't allow
regulator supplies like the ones defined in mt8173-elm.dtsi. Drop these as
the associated driver doesn't implement them either.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index f52a9906f6a65..eb4f6ba555465 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -1149,11 +1149,6 @@ &ssusb {
 	status = "okay";
 };
 
-&thermal {
-	bank0-supply = <&mt6397_vpca15_reg>;
-	bank1-supply = <&da9211_vcpu_reg>;
-};
-
 &uart0 {
 	status = "okay";
 };
-- 
2.50.1


