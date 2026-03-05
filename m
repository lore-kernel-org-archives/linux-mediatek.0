Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05663F47CD9
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2026 21:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UcA4dGEpWdmHw4cn/b0YaR4yqWgiR2CVpGOd1+AB5JA=; b=alFOj2TFZF0oUkL8m2U/SNmkU1
	f8xNIZU8zBqKexgMUnNElfO/Sc0f2gMAJu12/DT3Tx05z1zOk/6dRXHTVrTzs8AbvKYsDMx16Xd3p
	fREr7ZbOEueZYJK5Z2vuplCLPyyHNyu4T88PQsoMBtcY4giA7zOKTWt7G33K+ZgEwSroDDBJNh5hd
	hykO7iSK0hNNMxHU0wx+1ELyOBoadMpb3pmmvsCNIGaWTOq+1islrMReM3sIy1u0q1QSwB+Ec6HGS
	gLWUg4tTa+ysPTBwdATOeXK4Oo8tMhtYCfudLcalK1wk3NIk78vtdk6V5lUMSpcsOFzCmWXLjFvwr
	1ms5Ebsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyFrR-00000002YRI-0lUo;
	Thu, 05 Mar 2026 21:03:57 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyFrM-00000002YLe-0XAY
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Mar 2026 21:03:53 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-45effa36208so5736016b6e.1
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Mar 2026 13:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1772744631; x=1773349431; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UcA4dGEpWdmHw4cn/b0YaR4yqWgiR2CVpGOd1+AB5JA=;
        b=U3Ph/uV7YjHgNok5PPbWZpB7TPH9mqk45rniGjDBLOns6ZiJSUKyo31dToGa5PJ0nK
         6GMCAd/Kvw8RR+qkHPI0Z+Fw5ihSlD4uvkpmyWo06sk+w2TKKKLh2J/kLv836ALwctXT
         mWGxNeLyH7jbwfSVz2aH2xdJ4vn56g4/0Ev4w5yuNCcB0qn4UDDZ+aZKrQXeZymArDJN
         qr0Rz/bBXqR1uMSAW/wO8p8OpTHEYUh8Cnerm7yAc4kugycp49+pYerBjWin0iprQpI6
         YSAiUkHkxsh60s3GKu/kfwp0koWB/OCtvN/x2su0XID2SaA4vGysStJ168BRcdFDXOH/
         NSWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772744631; x=1773349431;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UcA4dGEpWdmHw4cn/b0YaR4yqWgiR2CVpGOd1+AB5JA=;
        b=W4xfTJywB/IRwxu6BEjG13QO5+SPYUSSev/Zw5Ysw+5IIA7oD110FxhYis5rLcZtPa
         WHP7bF92i0BwpRt/y9lnX52lIyT6oCOPj2G6PCUR3CRKlXWny1tsczn/L3NSyoqMYneB
         g1cxHmhK4K91x/APljwWsfUbAaME+eIwfDSkC8hVPRpuF4+0MGn+l42GaWdMMo37clUK
         NH6K5nZ2+HTsWOcTALwRwIGHKPoNB6/1JKH0+56qcESQwynPeZRtvN67PuZ8RM2Z2r12
         oHQ+JNzs1cLfceUe8yRU0gOP5uz3ZKZd6AbZzbAWB+USg2nDHxmPDDCn9XYae2OMwepW
         Ep6g==
X-Forwarded-Encrypted: i=1; AJvYcCWrsHKAbh8PVTx01DnIwHXZGN+iQ+tCoUAeO8oS9gRJUwDCpK5TegN9cwc3w05oQCV/RK+WdSg6Q7Ye5Tahkw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxAA/F3B9TeP1Y/BJotrJC7wGhIN6TfAhk7hBkmOH/aKt1AVdFR
	/Kjhe3uy9NuM3BdFvZaLZ3IU5ATdwZgfY7XiU6XXFvorpruZ6w77VoSRlIS6O41qXrU=
X-Gm-Gg: ATEYQzzGC+15dUmDvQlpp9i0rQdef7z6eyxZ5VQrZvS0z0pajL8BOsEjalc5xgfT4Ac
	2MnT9P8sCS9J5IFGPSERiIiz5aKqMMG2WUT+VunAntCkPj9MAjS2+dTXJn60kQdXiZTFmFoQCR4
	5fVFtCdIhe+trf7HcEq50kDXGRj9AypwoTsZo1V3+ErpmNE8OoThouhzhqM3oeKsViXdGU/Hwwh
	hE07EhsjVJBap5IL+5HfpiydLWnvq11rNtzJIipzTGUjfDPl89kpZCmo7wLZrlj+DO/cIMUY0uQ
	ntVGUuBuPMqdrko6aLZM76kW6lASgVhtwjixZbd+7ZHIQNkqYkw6HuJTWV0alpTXv6dZv9l9vh6
	m6StvsMSoEPaWquiYsBWkQ0iLKzWH9Vq/OReQgP1Tixi399hYBdQvKLum67DtePZgo2hr4jwcob
	KM6BNZ25iUfZiRz/dGoDXeqXmspjS0
X-Received: by 2002:a05:6808:3a1b:b0:45a:770c:d77b with SMTP id 5614622812f47-466d868336cmr549783b6e.35.1772744630984;
        Thu, 05 Mar 2026 13:03:50 -0800 (PST)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:874e:e775:4f67:b3a5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-464bb5d0a8csm13729227b6e.14.2026.03.05.13.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 13:03:49 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 05 Mar 2026 15:03:17 -0600
Subject: [PATCH v2 2/3] arm: dts: mediatek: mt7623: fix pinctrl controller
 node name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-mtk-fix-mt7623-pinctl-name-v2-2-a68854a51065@baylibre.com>
References: <20260305-mtk-fix-mt7623-pinctl-name-v2-0-a68854a51065@baylibre.com>
In-Reply-To: <20260305-mtk-fix-mt7623-pinctl-name-v2-0-a68854a51065@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=748; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=eCmJ2QYY/pzXcaJOToFECzaVPUqi4rn0enxXy1DnBG8=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpqe+keeDzlj/E9xT/ACGFnG7mZ1wqlrX2M/rwS
 3c+QMzSXkOJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaanvpAAKCRDCzCAB/wGP
 wPkSB/9rDXk0Atd75mMJ7zGgLiDNplnqqhch8xpKQT3e9Hrrvm4iPLGSt+OGOW205Azmy+tC/wI
 V02tpJATSjdnLprbEYQvZwXlAyJ6AxL7C4EQJO55whtjDwp96tVdYsdOq37NizfgirQDCONMJoI
 P63sli4TVU1sOfExOxVoKxV7i9KfdxuGEWYsLIwPew6A2tX7waOgNQB2JQT33CSnNFaxbQISdTC
 U0HHTprNfh8M069tJGkqrS0uYLUY0DeY68TgBMwIbquiB1J6K0ZTJpXBwxLUCeMc/wB1QvVzU+W
 aYD8s63dWpUxCzNW7hbBKeH573kI4/JE+9A07USkrsXZPLnm
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_130352_176092_D071FCD7 
X-CRM114-Status: GOOD (  10.81  )
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

Correct the pinctrl controller node name to use the same address as the
reg property.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 arch/arm/boot/dts/mediatek/mt7623.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mediatek/mt7623.dtsi b/arch/arm/boot/dts/mediatek/mt7623.dtsi
index f34f60cde594..aa42377b47da 100644
--- a/arch/arm/boot/dts/mediatek/mt7623.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7623.dtsi
@@ -249,7 +249,7 @@ pericfg: syscon@10003000 {
 		#reset-cells = <1>;
 	};
 
-	pio: pinctrl@10005000 {
+	pio: pinctrl@1000b000 {
 		compatible = "mediatek,mt7623-pinctrl";
 		reg = <0 0x1000b000 0 0x1000>;
 		mediatek,pctl-regmap = <&syscfg_pctl_a>;

-- 
2.43.0


