Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257C7CEDD9D
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 14:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hxlFPX8eU72F7FwcsQseu7FqbxMilUfVuvRnr1Il9Q=; b=VS1lGYo6TYSKNFhsNwC4Tnjw+U
	PT6ka7IJTNMX/vPuRp/AqZoxQLOoafRrJhw9yCK040kJFBNxdqwfOcoDECAyYUSDEQtP6G5yKy9/G
	qO/GMlYQ8WP4t7mgVR8eHSv5oOXjfqwkkfOde+5b/RHdrIEOslnW4rEwfaXrabsSI8l5GGyZ7/hi/
	1lYZFOjL9Uei6u0qbDy3zwxfuuchKTG1JfYGxdB8qlSx0zZ8SfMysIqZUBKZwdOdlz2Sl4AGi5KZx
	G2jpw+axjByfid45k+MBeCIqqaSM3IvGXU3t07esEccpJlGr0b/04+1cja/UCSNulmN2J+vls+RbM
	2arj5bww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syXTh-00000009YPJ-3xlF;
	Wed, 09 Oct 2024 14:15:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syWIJ-00000009K8a-0F3h
	for linux-mediatek@bombadil.infradead.org;
	Wed, 09 Oct 2024 12:59:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9hxlFPX8eU72F7FwcsQseu7FqbxMilUfVuvRnr1Il9Q=; b=UCQq/d43FokLDzPx6atvg73mD9
	dth83qS0iw7gmJh8PlgtSW9Xr5V/lHWtxAOGRnLE8LdsiemiB09TxsdfmJOrGotjPyBQrlHQMxWTk
	E218h6gQaL9sA+w0u4FWnozXGnG7Fy4oRzr2Kc7AccjS0SgkVC6GfwLBrSdsV/b13Nzqdch6LE4wa
	F9V82xU9IYS2oJz5kSIb1kNc5wZj1afJx9vzRjX+9zsaA9+5aLAicUVVhdSYJ3KkisPCdSR6e7DiG
	sffXVQyvFFCOKdy0LgE9uBy3plD5c/86fb3o2Q3B7aWNDuJOCE6wA2QczVcIcf8OdW5TDNyPlTnJu
	84IvylzQ==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syWIF-00000004xAa-3yid
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Oct 2024 12:59:57 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20b78ee6298so43684715ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Oct 2024 05:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728478792; x=1729083592; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hxlFPX8eU72F7FwcsQseu7FqbxMilUfVuvRnr1Il9Q=;
        b=QaBf2yQdsHlE3NO1dthvZm7mkx8O/PcWm5zaHXh2BD7OiTf0497TpVvmPLIElgcXBd
         mRh+pPKX1/XfrVI3uTdHYPE+OwsT0MKt0C1r57yUiLGR72kxXJ7jhZpZdQdkc8LLk/xJ
         hOkY8H5mMUpB9OpV2RzDOsEUQq99OjxcpVJdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728478792; x=1729083592;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9hxlFPX8eU72F7FwcsQseu7FqbxMilUfVuvRnr1Il9Q=;
        b=Y22eRx9IyvEFaIIzj0RaS8yt6la+1ZT5O6Zb7z/s+SJjCL+J78vpWvqID1r5jC9IZz
         XHVuVXI7Fjk0oIC7wl3ur/vtIUof40Zo9OSwul754PZ94CB6vmi1r4Peoo+yHPc2ubnk
         0J4Y9erdkiy36iKXCkkNb1P2A6t9ICOQdkgFF1uT4GMMGkZ26w1ecfHN8rudtaxMMTQp
         qXvtcF/FPm66xsENhES8/ekyBDls6sjV6oAAWdjoNKspZIT+jH5nGE8bgXG8fIaemgOi
         WMCL1pAhklpAAhQSJywauerwpicym9xQxAckCDpC0jQTZjev57b6W4T8yrvxAAZuTjI8
         3ZBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtL2IHpKDg6cmyTUKwaU8OIowju6kS1aZvzFn1Dy3K6zlXBkywRpZw3q+vEgPONxVKHEVSa77b6x8tSakbwg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0F17xxnfS6Bntp0QlsJ+fbWBgA5MmaPxpu6Ikq6FpfKjklPQp
	o/3Es2s+1A3dxvrNK27aE/F27w8fpZUlHpDMo+k298Yvo6M0vnGkt+hK82Erqg==
X-Google-Smtp-Source: AGHT+IFDu4AhDNmbXgd5KWOArr6Td/4dAJ1kW8iH1FVAygBKnTNX/w2syHGhkwtp4UeSFsqMKl5FEw==
X-Received: by 2002:a17:902:fc44:b0:20b:b21e:db21 with SMTP id d9443c01a7336-20c6377fd21mr35072335ad.47.1728478792207;
        Wed, 09 Oct 2024 05:59:52 -0700 (PDT)
Received: from yuanhsinte-p620-1.tpe.corp.google.com ([2401:fa00:1:10:bfd7:eb4:8571:b3f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c51c21535sm27434005ad.216.2024.10.09.05.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 05:59:51 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 09 Oct 2024 20:59:44 +0800
Subject: [PATCH 1/4] arm64: dts: mt8183: fennel: add i2c2's
 i2c-scl-internal-delay-ns
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-i2c-delay-v1-1-6cf59721c1d1@chromium.org>
References: <20241009-i2c-delay-v1-0-6cf59721c1d1@chromium.org>
In-Reply-To: <20241009-i2c-delay-v1-0-6cf59721c1d1@chromium.org>
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
X-Mailer: b4 0.15-dev-2a633
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_135956_166307_5DAA4AC8 
X-CRM114-Status: UNSURE (   9.14  )
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

Fixes: 6cd7fdc8c530 ("arm64: dts: mt8183: Add kukui-jacuzzi-fennel board")
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi
index bbe6c338f465ee7c11bfbfc30767bdb142706480..f9c1ec366b26607581c116b364cc2f80f8621a57 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi
@@ -25,3 +25,6 @@ trackpad@2c {
 	};
 };
 
+&i2c2 {
+	i2c-scl-internal-delay-ns = <21500>;
+};

-- 
2.47.0.rc0.187.ge670bccf7e-goog


