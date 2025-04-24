Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 675EDC369AB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Apr 2025 11:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSScOVwhUO+K0/3KqN7maXbkfUTR6/cC4fz9TlS9l30=; b=rSA64Om0gkWt66SOQGQO1V/mV7
	yj5PVVI7R6VPceKdFigeDI+JovxKwTlk9XmHK+BTlh1DmfUh5cPKLQY4EXiggznjgpSuiT7lhwYhB
	SD1eNKjd2Frydz5dlJj6DW6kYn8rC1kfZ6fMog3g3PUj5VsFW/ijIo0zcxNo6l710jA0UA4HY14TH
	unvdDxkchEom1I2BqoNLAb5TyeQYsEgOpwiHpbS7pV6ki+5FKKhZewsosZ8Ac/ijOnLS9MhDZQaCJ
	UGQiPFeSV2hOh8hHfUZEo/PD0YAbuwthfc100DiPPPCF46i2x6FNOOBmg0aBYJtB/6sqB5hAcq6rn
	y4Cz/pWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7v0p-0000000DuKJ-0mo7;
	Thu, 24 Apr 2025 11:45:03 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7tmF-0000000Dfbn-3o9E
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Apr 2025 10:25:57 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-224341bbc1dso9313845ad.3
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Apr 2025 03:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745490355; x=1746095155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSScOVwhUO+K0/3KqN7maXbkfUTR6/cC4fz9TlS9l30=;
        b=mzfaIMR0BXWHld/TNlkseSxqnFEhU2mFApsiuw30sdU/zP1niMtHEfSqV2EZMcJH/E
         T6QdnRbl/LH9hmGHUmJH4hcr+jZnQGp6q6eOIlEQv6P+gF0Ohq1OS5jAhiZ6e+4oGpjn
         bZ1xu/A/i+85e8B5p4j8f09+rMJ8SernmYjFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745490355; x=1746095155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSScOVwhUO+K0/3KqN7maXbkfUTR6/cC4fz9TlS9l30=;
        b=W2q6c0S0McbPIW+ji9UvhOn+91u5YdE0WnRm4x3svB3oNwhesJnLAjLdyKMf+k1JD8
         YzMnyDNx05Ollial5KXhfisp0kkcZFc7QfUDiRKQvommCGFMkVNghoDAd37agzgpgRkY
         Oku4kL3Ua6u9c0oToWHmNT/XSzq81sUZLscYZIaKyWmOrleJZVXR0lJe8qbOhO4qReZc
         pLTs33bzHmzPmnYs6Ild1HFZ1WuzTLpqL9lbx1CBUuLrIlOADoO6cCS4lpJJylg7we0E
         fcl8Y8u3U1kFMYeqMS3YlUKo7kNmHWtSBCeNtJdkkLTAS34YH5nwx+d6nn6K2u+6e3SY
         DZ1w==
X-Forwarded-Encrypted: i=1; AJvYcCXCBS78Y//2twGnTOwOTB/LExLzul1VFjtQsvCBZI32FSugAgNqyqf5fRpioVXBdKDgR7ftlwNihawVZAoWew==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyw+4I5ncCZapeu60J9lk0Z/Bljeym8tX4/wXds3/kE/ca8CGG4
	vnV2p3BCkKDobvJKHlyycpUhoT5w49q3rSL/wR96GTCrkFqLk1RtpmvV9a2LHg==
X-Gm-Gg: ASbGncuc1cIV56KlG7v+OCWmjfRh/3D4ap3+rjP3OOKJ9DM9wmTK3rw7ULFDJLJW715
	xKO3LgYdqyy9z8DRiyPGNW9Kj+xv6RjrqaQnXlVszoyOWIzAezOm69jzBWsoUx+6U2WTLkf8Cm2
	pScuqey8N2NGTq/auH4wnIrdUis9157Ry2ySw0Q4AWyFbH1MPeogvvrrBqi0BBx+pH/Xkmj5mPN
	kKqrZShxEPC/Sn/95/fd75U17tLq0OvkEmtjaH3ZIcj4obnNN6eLLtMhBjQ1tPEoWv2kFgPz+TE
	kHQrczB7Xh7hxBtmlUFDW36daAYqlZaIKX17jXZYCicGOkkbwKxZwR+TDQ==
X-Google-Smtp-Source: AGHT+IGVWgP+9f44cPO1R7mfB5z1uFUey5yQnac/oTnGNxfAaOr9FFOdDrHbUFBI3ie8mEMC8Jfp1w==
X-Received: by 2002:a17:903:17ce:b0:223:5e76:637a with SMTP id d9443c01a7336-22db3c0e722mr27960035ad.23.1745490355124;
        Thu, 24 Apr 2025 03:25:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fa13:e633:684b:257])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dda40fsm9680305ad.104.2025.04.24.03.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 03:25:54 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 11/13] arm64: dts: mediatek: mt8183-kukui: Reserve memory for audio frontend
Date: Thu, 24 Apr 2025 18:25:05 +0800
Message-ID: <20250424102509.1083185-12-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
In-Reply-To: <20250424102509.1083185-1-wenst@chromium.org>
References: <20250424102509.1083185-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_032555_950118_5F995CDD 
X-CRM114-Status: GOOD (  13.36  )
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

Some MediaTek platforms already reserve a small block of memory for the
audio frontend. These platforms reserve it at a fixed address, though it
is unclear if that is due to hardware access restrictions or simply
compacting the reserved memory blocks together.

Reserve the same size of memory on the MT8183 Kukui & Jacuzzi families
as well, to align with the other MediaTek-based ChromeOS platforms. This
also helps with memory starvation as these devices commonly end up in
low memory conditions.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 0fe9f2d1b912..00b97cfa0eec 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -85,6 +85,13 @@ reserved_memory: reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
+		afe_dma_mem: audio-dma-pool {
+			compatible = "shared-dma-pool";
+			size = <0 0x100000>;
+			alignment = <0 0x10>;
+			no-map;
+		};
+
 		scp_mem_reserved: memory@50000000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x50000000 0 0x2900000>;
@@ -198,6 +205,10 @@ tboard_thermistor2: thermal-sensor2 {
 	};
 };
 
+&afe {
+	memory-region = <&afe_dma_mem>;
+};
+
 &auxadc {
 	status = "okay";
 };
-- 
2.49.0.805.g082f7c87e0-goog


