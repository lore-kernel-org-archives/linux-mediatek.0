Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962D4CE7AB0
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 07:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YAga99RtDUol5nztZ6d/wilK6vSssHP6o4Rh71ltfyY=; b=WoXRtz7k6u5PkVg9C209orsgbU
	1cpK/j1dYhP5clnCFZIUC5XomcVaDXSvX6fhD8YuC5qfa/J+ix4omrVGEk/viDZFuwC8Bv/mh6ys4
	roQgQeRNQ13iREsiEhOqYVV3XDclXvvoAoYvk0NDAaLOt0WsygRj0n2vH67nl6GQ+wOxDK6BJqk8Z
	I6CA4yqiUawdrOUkxMxle5SRksyb8hthHLDvtABMueUtgSVP6DgS4kaOu0Stav6n/JCGD9GX3E4Jg
	wO68rxu22CMR/NxE9Cfj3gZLFgR0inUWk68QnZ5GeoMAF4Jkzq5IBEHSJ9aFZ6+dvOMg9qjjIqZ2I
	3s0nfT4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYus-00000000r2D-0dBd;
	Mon, 09 Sep 2024 07:34:30 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYps-00000000pKZ-2Fnz
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 07:29:22 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2daaa9706a9so3097590a91.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 00:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725866959; x=1726471759; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YAga99RtDUol5nztZ6d/wilK6vSssHP6o4Rh71ltfyY=;
        b=IPWcqKHoWKL/SdCdY4FUDxNOkmE7EWt+hjLC+/Pot+MAcM8NiajCYCPyFXnKNBvsGq
         7x0TuETKQHa93glArnPCIMA72FtE8wKRbu0j4BMeK+crC2Mk7tzKoBcsFw7GPYASW+Y4
         YlMVY9LFujH/7amu3f3m+3lA8eEsxui6VCJgw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725866959; x=1726471759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YAga99RtDUol5nztZ6d/wilK6vSssHP6o4Rh71ltfyY=;
        b=tO/iGJtNs3+gbqbbIUf1941osJz1NgtNvwqSoUm42cggLhAC1wvWVRkg9v2pFyabpr
         S9Q5VXzLpZFp+nuahKNlxtC8RmFG7Nrv4ZI35J8lIdlpzOQnMaczKsB8hxWFc7CEwyGP
         JGgQXsUWHvKwVObcm/ATAE8ykflUbK5G3iEjYXYpY63114KXfeqtVHGxNMJ/fVzJBKQ/
         iGjYTu5GFBcCN1OUCVIkt+4CrFT0cUTchp4qPwY6IqxPTnXYdeg9+hV3Yrs0mYLhSDYM
         VlXIJn4kFxR1o0+W+xK7NllgTjVDudQoMlRi/5olK+X/CZ9iBd57AWFAFj6932dwn9x1
         knIA==
X-Forwarded-Encrypted: i=1; AJvYcCXLqR6lf9sjtMq5WazhHtwtZqgnhbOaENrkv2nJtKE6k9hjHUv+ln5+QsTgmKVnZudCIUy1oldC37ZJmuuPiA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3vFwmqZXs86EPpv99BQszxpzAw0VD9uD5Q8VRNBN4ju7djATQ
	Zw8DghvMRYBzEiKJ45Xg+/ozgXP+WR4DLwgfSe/LG2c9SuaA0cBPf/HQPbyNnQ==
X-Google-Smtp-Source: AGHT+IFOFn7KFliMFXZhJS+1DjD3nGceHUQ+MLINIRmfOOKFMkSweXelfVQlmNIhzSyLnEOORZxjhw==
X-Received: by 2002:a17:90b:180e:b0:2c5:10a6:e989 with SMTP id 98e67ed59e1d1-2dad51182a5mr8700853a91.35.1725866959336;
        Mon, 09 Sep 2024 00:29:19 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (30.191.80.34.bc.googleusercontent.com. [34.80.191.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db043c3c51sm3841065a91.21.2024.09.09.00.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:29:19 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Mon, 09 Sep 2024 07:29:06 +0000
Subject: [PATCH 4/4] arm64: dts: mt8183: Damu: add i2c2's
 i2c-scl-internal-delay-ns
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-i2c-delay-v1-4-4b406617a5f5@chromium.org>
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
X-CRM114-CacheID: sfid-20240909_002920_674239_C6861565 
X-CRM114-Status: UNSURE (   9.44  )
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

Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
index 0b45aee2e29953b6117b462034a00dff2596b9ff..65860b33c01fe832f3a4b2e21d24ea6b4f0cba2b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
@@ -30,3 +30,6 @@ &qca_wifi {
 	qcom,ath10k-calibration-variant = "GO_DAMU";
 };
 
+&i2c2 {
+	i2c-scl-internal-delay-ns = <20000>;
+};

-- 
2.46.0.469.g59c65b2a67-goog


