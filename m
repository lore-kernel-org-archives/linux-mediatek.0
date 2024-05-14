Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCA2C25B78
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 May 2024 01:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVvR14e2YIcHVGx8P2/Nr637H1Ups9lyNIyNluTcAKk=; b=XRTwiK3DwPShiapOFOihnD1jZz
	gNwUHy0QE3tO9NzjfJrkKzvhwgEfjhyc3aAQbxJ0guiQiqyVJfj4QIGJexqJULkD3PVhyysU/q0Eb
	i6LjuncBBvLW+HdY0NH53jrTRO+uC15kJud8k+RnTXcoo/v5BOBvw53246tGc4Fn3gYU5/8a2fBaN
	gsifpTlw6VnrPRRYDRtMFH7MFuW1hL3YX/jS1my1cQpbE+AaLrXAQD59nGY27Xm2xkf/YOwUmKVq5
	wdFtt8wAL5WF8lVCYWUDxd3nEZ9kIGh8OwalnLFEg9z6wjaQhi7qyThIS+q+LmUMlBu+rXj3qYmv5
	3IwurrCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6hMH-0000000EkTf-3Xt5;
	Tue, 14 May 2024 01:53:37 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6hMC-0000000EkRJ-2mUC;
	Tue, 14 May 2024 01:53:34 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5231efd80f2so2301900e87.2;
        Mon, 13 May 2024 18:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715651610; x=1716256410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVvR14e2YIcHVGx8P2/Nr637H1Ups9lyNIyNluTcAKk=;
        b=WE/3EcpKT28M7WJpcxuS4kQC93KiCi4HJgGZKqacXQUonf56+qZO72YOGoJpVkM/Ao
         b+n4BitrQknp/7ju2O5GFe+wgSQzz9p0Dtb/159Qfr1VgKgJJFL4JEp9sqyxzPDOXtJX
         9R7YRjGuPmdmR+TXQC88Jn9qP/hblCNyNQT/+a5/7jNwoePb6tXX++6fW/s+8SQzoVzm
         +io9BOE6sMziFi7NVQv5j9L9vaP+3osSv+U/ByWXWwQvD5Ha6nVCfhflNTlkZ8LzjZtM
         YW+oRV+zlzotLpaQHrQ+byvzUfRj+5hRdHpD1J+IPEyXhHgptv3SxcNzJ5co4izfUWXh
         RPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715651610; x=1716256410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MVvR14e2YIcHVGx8P2/Nr637H1Ups9lyNIyNluTcAKk=;
        b=c4ze8uXF1xsME1L/71IMfhkItSBSNi0t1mtWO2Z86YV41kjdGxWegyClRSfVZZTgEu
         2npmtNr5lHHiDQn4LJLzKw/FLvVy3FowkUBPJpup+GgaWEck9da+FsqHvZSgI+E/Wbyr
         LBKQ5/F3fLLZhUKbz/QOkhis3KzekW6GESEv0OQ08z6Ry+pZxKu86TYfB/BMdrknTHyP
         rPFvXsprTTBJcbhYufSSEMOU8PkV7/Fw8dgKd/tu4rVo9AuCr7tVtYYgSVchdTXoewN2
         MqC1URpmb2WeeylB9NYPM2Cb7vxEGNinR4MnuqIdeuFIL6QOyx9BKH3bA28TG2aFGdU8
         xCig==
X-Forwarded-Encrypted: i=1; AJvYcCXhrAuKuHOvfdQ0595QQEqYbMWEbJnSkm8+aeszkoalaETBoyrV3O4lyNwTYe8wjk+Vn3xxx95AAhKKqCUZg0i1Vd1FpJmQeihcT2OXobUdiv176FU2EOsjvvrZjg+2JrB93DhmBxC59WjXPwJHFM9tI/XMRwK4Guk=
X-Gm-Message-State: AOJu0Yy63ty7hBYYGZSM1fPRXPxAoKMtusFaWrGH2bnN73Zvk/09x9Hx
	e8KfMmUqMyusLMKSkAXm7nwy+MDIqBNRKeiSJarqjE2SzfWk7Z3m
X-Google-Smtp-Source: AGHT+IG628Tr0HzAe2H27xxGQHH3lCtm+/5k8g0eCpFMPeojAvpUj8I4i4Gyp8aq7ZsTv1ryhPRvag==
X-Received: by 2002:ac2:5bc6:0:b0:51b:9254:91e2 with SMTP id 2adb3069b0e04-522100749bbmr6048672e87.55.1715651610138;
        Mon, 13 May 2024 18:53:30 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a179c7ddfsm663377066b.121.2024.05.13.18.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 18:53:29 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Lala Lin <lala.lin@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH V2 2/2] arm64: dts: mediatek: mt7981: add efuse block
Date: Tue, 14 May 2024 03:51:54 +0200
Message-Id: <20240514015154.11206-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240514015154.11206-1-zajec5@gmail.com>
References: <20240514015154.11206-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_185332_733803_893C9771 
X-CRM114-Status: UNSURE (   9.74  )
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

From: Rafał Miłecki <rafal@milecki.pl>

MT7981 (Filogic 820) uses efuse for storing calibration data.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
V2: Use new compatible instead of MT7986's one

 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 2d7f91196e64..31d323e84967 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -133,6 +133,13 @@ pio: pinctrl@11d00000 {
 			#interrupt-cells = <2>;
 		};
 
+		efuse@11f20000 {
+			compatible = "mediatek,mt7981-efuse", "mediatek,efuse";
+			reg = <0 0x11f20000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		clock-controller@15000000 {
 			compatible = "mediatek,mt7981-ethsys", "syscon";
 			reg = <0 0x15000000 0 0x1000>;
-- 
2.35.3


