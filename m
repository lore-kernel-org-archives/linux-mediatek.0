Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831AFC43217
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Nov 2022 12:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WJeLrYqcWtMc9mhPkVpaKIYTLHS4W3xdI9EsCwSsotY=; b=EPl0US0TLtzZ5c8Qs/XpVlUop9
	VOozUwD037XXE26Ybeyke8uoHeJzeItVLFGC7Q6Aa9hEE7ggwsqgmAK0aNa4k7Y5urjI3/ytZJxw6
	KdSyULVHniph2UNKf+af49gPlx+rK4ysBemtWGrItkBAtMV86WI52vJeQJ3k3Xw6WBgFU6WdXOkSh
	Fl9brqRVQUnOwTp0cTahIYH3xHXKhcbmt/+7AhWmc2Bv4NiG4JdPpS2hGmeRdeWNEzubm11Jzxgce
	Pn4Fml1RJ8zxGKIswV6BGbK2B+Yzyecy40JI2lfeuIyNLNqGwtFvdhe7t9V6yj0Tp2BwSFdC4ckx1
	X54pEKxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovHsC-003ac1-Pv; Wed, 16 Nov 2022 12:50:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovHs1-003ZyC-8k
	for linux-mediatek@bombadil.infradead.org; Wed, 16 Nov 2022 12:50:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=WJeLrYqcWtMc9mhPkVpaKIYTLHS4W3xdI9EsCwSsotY=; b=GVPc08+at4cH44yvF8BOXw4PiU
	8kpPHDrdvmoo8ed0zCxi+IbHFYhdsylav08xymqIs7sPBcjHzO1ClUAFyTCYu+iDa3RzxP4dMoOVq
	M1as3YHtARpb5WgYnk2RmiYP0rfsioXJPoHSvC9tMaeMGp8xht9cN3nhLB2BURQVa59639I08QmLZ
	q32gX330rQ2PzEuwvIssjSVeBEAtJuFXu6B66Jh8wf639qpj87rRBuIoN45U8brbY6ZJ6biLtFVx6
	0cYPqtWB2Dr4tt9uohIilY48IOii5koMYFs2fIS02HyKQ/sktRNzGhdhmOp8btLK/yiXmac6zbQhq
	hh6DdGng==;
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovHbu-001Ja1-FY
	for linux-mediatek@lists.infradead.org; Wed, 16 Nov 2022 12:33:48 +0000
Received: by mail-wr1-x436.google.com with SMTP id y16so29669278wrt.12
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Nov 2022 04:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WJeLrYqcWtMc9mhPkVpaKIYTLHS4W3xdI9EsCwSsotY=;
        b=RE+scfJigrRMGaRyqu0nvEmq1ouw7HTydTee5XM1yNQHzz2DPFWGaPOLWChQ7hD/bw
         hs+CcD1wXGvVCf4y7B03pA9900k1R3YoSr8OO+M2pZglCBGrZza25ycrkmSaIGg5O/sG
         QMdl2tSrpofSupK8ENFv4BEeL8HzVzdUTjNs5+/N5ESObwI7N/RfvY0EIFyhmzcX2SRy
         juPjNn0YB9OvQsritJSAoiMojl5PQCzLCipb7lueI0SacRGPR53XB9bdiBmZLhTNGGFp
         vJPmEFyFPCB4ylVD9blqvfliP06L1nldV0B4W/8ogT0o6eb2zgnPxQuaX1YfjMDg1MkO
         A+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WJeLrYqcWtMc9mhPkVpaKIYTLHS4W3xdI9EsCwSsotY=;
        b=XNYUz5tl4hAZQxm1T4vUD6WnlJFptpJ8o7t/0oDcFNXT4RhAwiSLJC72jCZ4tnYKJP
         zbKFErrmTiwD+LAqtn+jeOfh67cjPu4+BPeXflAV1JpB6zFpG7z2/PqyOD+J0aVnAF5C
         BqfslhdN04MPwa2sxrg4V+8kLufJsDGkydE2UiajCfcorECV/y0K+jbFg969B3OZ/Uv/
         KlTSVk4uWd7JJZZglPlK7v/CRt9u6vLSdYB/g65JwNVwSu7EEhgrAHeejVeS8fVU48wg
         G/0xyv6C38hldTo6Sm+5ORxULNppChQRVlxYmTdKh3RWafzKkHY88aaIn30go2ZUYhdu
         z/UQ==
X-Gm-Message-State: ANoB5pkfRNyi1+0NOlrs69I4IEPByy971TCQiitcAgr7zRwau1qcyUP0
	oYfmjmFf4Kc99L4SwTRqtOoEFQ==
X-Google-Smtp-Source: AA0mqf6HkkidY2au285VnM9daJO71u6fvJ/Ee92zMFYf2K2lAlbcB4yuAhtUtofCKcLOVlB4jTULzw==
X-Received: by 2002:adf:f244:0:b0:236:6fcb:a0b0 with SMTP id b4-20020adff244000000b002366fcba0b0mr13558904wrp.555.1668602023853;
        Wed, 16 Nov 2022 04:33:43 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id z13-20020adff1cd000000b0024166413a4fsm15051607wro.37.2022.11.16.04.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 04:33:43 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 16 Nov 2022 13:33:01 +0100
Subject: [PATCH v5 07/10] arm64: dts: mt6358: change node names
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221005-mt6357-support-v5-7-8210d955dd3d@baylibre.com>
References: <20221005-mt6357-support-v5-0-8210d955dd3d@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v5-0-8210d955dd3d@baylibre.com>
To: Flora Fu <flora.fu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tianping Fang <tianping.fang@mediatek.com>,
 Fabien Parent <fabien.parent@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Brown <broonie@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Chen Zhong <chen.zhong@mediatek.com>, Pavel Machek <pavel@ucw.cz>,
 Lee Jones <lee@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh@kernel.org>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-rtc@vger.kernel.org,
 linux-input@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1271; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=c7wPKy75bT8ebg54aEIMfSMAkZtNftilP/SW804aUPE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBjdNiejIJtPhWDcTqkPa+DfNFlbKX7l7D8TkEpyMUG
 ztTqHjqJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCY3TYngAKCRArRkmdfjHURcRyD/
 93F7fWMEdJHVtnI9fw/5HzQJKi6Nie03CM3jv3sTRmtBH6Ea3N4jGFw1znI5sNkLA1o8991rCWjgn2
 feUCtH8fz45tV+QWRpQQRUpz1qLsyu33zsYbd87ZILmN9U4iSaqhfYwq7f2G7HDpvlvyzYlaA6EW61
 yRyzPT1/ujM0XdKOuRbC4GtNLa6rBNuTE+aHdj+qVZLUf0vF8SMx3IKvyDOTxKxW3mu/5+S6YvZlWH
 cgGitiNc+OkIIP5EPBvNjFHupaSRdY1PObh/KRloKjUBks9CLmjO8I9QDmGE8TcUSnWo0/yGTy65Nv
 TnnzanzPfgb2RZ2hIC2cnuajyD+WX3dBI4AF28EgmlYj4f0BaWaoXySTDUKEXkBe3DP90/I6iue6A3
 m3gsO1h9wcs0wONAzTqGH42FHuoUUYlSwjzrMf20PzLHxia/qNWlWi+zJKjNM5PjZJpJ5eiDpnZzNn
 iu0+t5DlWavoYJWUAUNT77uQo0/HTIVJ8JTHTZNQpMLs08A+lXEPy/uoo2zl4nVTRdhEg8ANx5lsLw
 riNrVFh9Ela760/vFiT82nAdfKA5hfwLST7PpjVliBrioNb3g0TrK7P6ZplT1wQRBA6abt97wybCt8
 37UhsEWRGHba9hq3JF0fDrsrueGQUAihKf66SsTYBd1WO7DDA2eTHr6mKwRA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_123346_586687_F959E428 
X-CRM114-Status: GOOD (  10.89  )
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

- Change the node name from "mt6358" to "pmic" to be consistent
with mediatek,pwrap.yaml documentation.

- Change the node name from "mt6358rtc" to "rtc" to be consistent
with mediatek,mt6397-rtc.yaml documentation.

- Change the node name from "mt6358keys" to "keys" to be consistent
with mediatek,pmic-keys.yaml documentation.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6358.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6358.dtsi b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
index 98f3b0e0c9f6..b605313bed99 100644
--- a/arch/arm64/boot/dts/mediatek/mt6358.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
@@ -5,7 +5,7 @@
 #include <dt-bindings/input/input.h>
 
 &pwrap {
-	pmic: mt6358 {
+	pmic: pmic {
 		compatible = "mediatek,mt6358";
 		interrupt-controller;
 		interrupt-parent = <&pio>;
@@ -355,11 +355,11 @@ mt6358_vsim2_reg: ldo_vsim2 {
 			};
 		};
 
-		mt6358rtc: mt6358rtc {
+		mt6358rtc: rtc {
 			compatible = "mediatek,mt6358-rtc";
 		};
 
-		mt6358keys: mt6358keys {
+		mt6358keys: keys {
 			compatible = "mediatek,mt6358-keys";
 			power {
 				linux,keycodes = <KEY_POWER>;

-- 
b4 0.10.1

