Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF7D1E7717D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 05:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ToTdfUFmfxqqBVuM594sv5/lAPTiIQZKFHPkEQ17A1c=; b=4tyPN0t5o/2SCn4dznQjaBzuRm
	Ra8fSyad3YI0q2olo3m4/KCFFLevjqe5WxkVFFajy4b8rIfP+7vSbvnNUvFp3UZKwtm+2wzv4Z7FX
	+whq5gF1hXy/7dVywN8po/Rj7ZBQagTXEdemOe2p8ruMAGFNQUXyzz2A9RepZ0UoOVL2KxIKQyp/n
	T3IXr0vz/9gGIYK9iyRAttoZsvgs5Ub4oYq5mGAhPu2fKOFBWkhYvm6MITlNqVtJ8TRLPgRtr6YHy
	WaqLTF+KuvGGJt666jyk3pCzGj9E8C7T134uT/FPbkJJARcpLQddJ6bG2ErIkBmplVusm7YJtlgUs
	GlpeXb1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFKM-0000000DqNT-3sJD;
	Wed, 11 Dec 2024 05:32:02 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLFDR-0000000Dp9f-1hA4
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 05:24:54 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-728f337a921so24247b3a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 21:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733894693; x=1734499493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ToTdfUFmfxqqBVuM594sv5/lAPTiIQZKFHPkEQ17A1c=;
        b=DUdXVVQhleKihfU0/9dNdZ+lSwMs51jH1xNmj5a/pH7WapHGQ7twtNegZXXjccQS8f
         PyDZqRHrzosXWrDseHb3RzelG1ay9vCRxun+hT7urWg7U/4Vuky0Z6BwgseR/jac4K8Z
         +X0OEOGoqZ85YTaUQFIJLZLwjtsY+XVljKxFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733894693; x=1734499493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ToTdfUFmfxqqBVuM594sv5/lAPTiIQZKFHPkEQ17A1c=;
        b=CRq0woy/x0EpBPWcMDSLKi+QpCFeOtyyLzKcQ+/w9jJCei1/9nOeuOhYCbul+pb//2
         iJyE66JnDwHdr6+MczdD/JLJfAcnDoQLu69Bvj47kenHyF0zIldVPiFA5EvRxlMa2dsg
         XE0fqaKZgqTI9zCpIa6AOitnC5DGaqFkIEwsKGtD5kDxxXvB/hMV0bguRykjm/ySpASw
         tLGjGyKmJ26tznPL4c89UU5s/cof+u4RHYFMMwKPGqhJuf5C5kqVC0mD2mVMElj1GoB5
         bDDlYvTMbUA/xPFC/uD26ONHvRFdL4bltLXZZXou95kiFCicQxDSVDx0+dmOKVk/Yp8l
         LsZw==
X-Forwarded-Encrypted: i=1; AJvYcCWvNETcQVvqHrM+gdeIH9r5V7MY7k4Y5kBlfHUcgW23ahMXtNDL9KHu9A5ya3uKvj05/pDAOxUJVFueZHBovw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBKpAMcH1vmsgHgIFjVxEK1TikKU3mUVfmYLfqsaFkCms6u2/L
	VSaLiuqI+BFdCivHWo8H8Yfrx92zO6mgWfAl2GnzpMAcNOva/lGSAMooCPuiFw==
X-Gm-Gg: ASbGnctWvFY6nXB3lmVBHUaGlCjiSS0htplghQevpyY2iBpzn5aviD5GB7C3kOuTf0t
	275I+dU7TfFt/yLwVNpv/BfFmuknR3Wds9mlrqWBwFH2fsreVDc2qnYCKmFYy7I5OBXturVk8ih
	ZdkLMO09wuOdejMrQeKba4ESHwkAhnbFk/yDxPblVxEr09CstTVO83A43dFUdt+/F1YYV86i9iA
	CB+kKJ3W4uBhvPgF7NknQedMHhL8khktQaxiNICvOvrzWvimwyP881QfkhINax21ZCK/Sc8
X-Google-Smtp-Source: AGHT+IGlSrx9j4anjyHnvyNo1U+TCm1tsOqFjYIOo+mjUoxzwUz0kLYufreA4nXpiCewnzAxgBLNnA==
X-Received: by 2002:a05:6a21:99a0:b0:1e1:a06b:375a with SMTP id adf61e73a8af0-1e1c1380cd4mr2924903637.35.1733894692966;
        Tue, 10 Dec 2024 21:24:52 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:4dfb:c0ae:6c93:d01e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725e66801e2sm5397702b3a.160.2024.12.10.21.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 21:24:52 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/8] arm64: dts: medaitek: mt8395-nio-12l: Drop regulator-compatible property
Date: Wed, 11 Dec 2024 13:24:25 +0800
Message-ID: <20241211052427.4178367-8-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241211052427.4178367-1-wenst@chromium.org>
References: <20241211052427.4178367-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_212453_444358_68BA3DA0 
X-CRM114-Status: GOOD (  11.16  )
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

The "regulator-compatible" property has been deprecated since 2012 in
commit 13511def87b9 ("regulator: deprecate regulator-compatible DT
property"), which is so old it's not even mentioned in the converted
regulator bindings YAML file. It should not have been used for new
submissions such as the MT6315.

Drop the "regulator-compatible" property from the board dts. The
property values are the same as the node name, so everything should
continue to work.

Fixes: 96564b1e2ea4 ("arm64: dts: mediatek: Introduce the MT8395 Radxa NIO 12L board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 14ec970c4e49..41dc34837b02 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -812,7 +812,6 @@ mt6315_6: pmic@6 {
 
 		regulators {
 			mt6315_6_vbuck1: vbuck1 {
-				regulator-compatible = "vbuck1";
 				regulator-name = "Vbcpu";
 				regulator-min-microvolt = <300000>;
 				regulator-max-microvolt = <1193750>;
@@ -829,7 +828,6 @@ mt6315_7: pmic@7 {
 
 		regulators {
 			mt6315_7_vbuck1: vbuck1 {
-				regulator-compatible = "vbuck1";
 				regulator-name = "Vgpu";
 				regulator-min-microvolt = <300000>;
 				regulator-max-microvolt = <1193750>;
-- 
2.47.0.338.g60cca15819-goog


