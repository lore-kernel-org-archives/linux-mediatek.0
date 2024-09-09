Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82295E6FE49
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 07:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pM8txHWCWm2GJm5rpiUSna+befFEZvb0Ph4a1zYyG00=; b=re/soYG33oBJ6pePVcW3MdF7zk
	AVoBfFyRk5J1+U1t7iZtrzpfTtI4+LRqUZ6essg7+HY4+Nd9K0EhVB3oSF57bmankt9ADV9VG2uN1
	ShtTpYGUz9OPrCUqlvNyPT/xuTndvji3PEUN84PFetAZ+V1OMLU6ivEzRYvW9dkAHEcsQ8iK44+Dy
	YaEIdBu0YbdFI3J8cmifSOXjSVEJX9Es5GJzuVRKzeolkXVqr5AMof9XZS6AHogBLZTRYqWERkhRP
	Ew0JGJzTuQmyKRsw9zrG2fkyrPGglcUyr+mqysu5kq45dDsY/k27W8MBAxQ8jkaylvk9xwI3tJGiH
	19LGUDCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYrt-00000000q84-0hgq;
	Mon, 09 Sep 2024 07:31:25 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYpn-00000000pFH-1Hst
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 07:29:17 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2053a0bd0a6so42273375ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 00:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725866954; x=1726471754; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pM8txHWCWm2GJm5rpiUSna+befFEZvb0Ph4a1zYyG00=;
        b=al04NoAS+qpuRBCRTnPiwbBHJlsBQhQioC3IdsYLxweJ7Lj2puOmGchJaWdLKiZfxk
         lruuODxOIyP8H1zVeNivSJyTJxMhvsXK66v4SsukYE+YigPNW1PKaTc5k+9+zvTOyKYd
         ThKtwJEzy2ZGIhH5Pii484htUuCxw6Tz6NKpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725866954; x=1726471754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pM8txHWCWm2GJm5rpiUSna+befFEZvb0Ph4a1zYyG00=;
        b=pxFIrmEylYky46rYtgPY7unKvsYcxS/D1BjnBaNIRm81I0KuiyJzQ9Ljei50HS1NfK
         7m1z+5XBz7kVDTGRj2n5XwdRWN/m1u3yq56s2vNxluUGUANMe1k6sA7k98Fp39/Sy4BQ
         t4WM02SLnOmwVhk35O+ZCtvQ7boMAcRdlEK7k4/sQITABjYgYjcDhYUpQC58YH5uDetr
         Otc+CKUDvYNw65FGeCuoCV9etoNi1BXIzaJkespHuqQaXKRY4+ZP7468K5H8b8EZc4u9
         Zue7plANWUtyx5rUtCGWXOlyB9ca6NZBmjWe1H9l3mDAh3BZWQuiJseC/o4sJJJi2rh+
         fr+A==
X-Forwarded-Encrypted: i=1; AJvYcCXBKw0T02oKMCfN5aYY1vPIBj/RjoA/5Wy1hzl7T7mTAb3/WhdfZ0yJwjZuFP33Tf/Gal2fq3Yy7SMaQIpvBA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu1OFCM94JMmAxccfIhsjBbw1DPE41I2nrBmF4zbuFpAQ5xaP/
	jDsyQpD72C+FxUTS4Vz057MsfBW6hT14S2HnTFve+a7AsIqC2g6aTr7O+bTCGg==
X-Google-Smtp-Source: AGHT+IEbTOHDb3hQFJmEAFiA5/NZjRgBdCrO8hmFdHehHIQt4lO8vgj12wqm+tEvF2kI0aM1EP9upQ==
X-Received: by 2002:a17:90a:983:b0:2d8:ea11:1c68 with SMTP id 98e67ed59e1d1-2dad50e8827mr8779270a91.31.1725866953932;
        Mon, 09 Sep 2024 00:29:13 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (30.191.80.34.bc.googleusercontent.com. [34.80.191.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db043c3c51sm3841065a91.21.2024.09.09.00.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:29:13 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Mon, 09 Sep 2024 07:29:04 +0000
Subject: [PATCH 2/4] arm64: dts: mt8183: burnet: add i2c2's
 i2c-scl-internal-delay-ns
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-i2c-delay-v1-2-4b406617a5f5@chromium.org>
References: <20240909-i2c-delay-v1-0-4b406617a5f5@chromium.org>
In-Reply-To: <20240909-i2c-delay-v1-0-4b406617a5f5@chromium.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>, 
 Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_002915_421353_5F0D8E22 
X-CRM114-Status: UNSURE (   9.36  )
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

From: Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>

Add i2c2's i2c-scl-internal-delay-ns.

Fixes: dd6e3b06214f ("arm64: dts: mt8183: Add kukui-jacuzzi-burnet board")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts
index 19c1e2bee494c98c0db87308494713a26e304cd2..20b71f2e7159ade7e7d2135aabe6587c8f8d64de 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts
@@ -30,3 +30,6 @@ touchscreen@2c {
 	};
 };
 
+&i2c2 {
+	i2c-scl-internal-delay-ns = <4100>;
+};

-- 
2.46.0.469.g59c65b2a67-goog


