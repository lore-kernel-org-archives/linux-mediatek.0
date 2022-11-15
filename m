Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45360C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 02:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vMatkpXRBfYZcOpwK4gKTH0eFwLe1XO/MVtN1h01A6s=; b=joywpvDbyxJPnbFHiA3vlAOqg/
	EM8EBDd3zr/2OyfcZWrPEsqw9qFrYtYTgINqSZj3lLWigiAzCGz7SoNgzUX8NL12n4BBa1GzSYRA/
	edCZlIIzO77ovN+wWw9DTZV15lNzS15sEIrput0dpzI/3VaXWEtvFhrleEJTRgZ785uvkGv+8/FBh
	2sumj3Pn2BsSGUKBA7pO+QL/MHBxGamSz54+IXiGZSlAqdSo3QUuvKpL5YQGG0m6XSZgXqEhOzH4U
	raZOgmBt0GgH7+9ez1R4XOpGP/PClanxnzvmgrzEIZjcs62bRIzx6mX1EKQCjy5yzJQrRG+ranFqz
	zUZTEFdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oum7j-006z8m-BU; Tue, 15 Nov 2022 02:56:31 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oum5s-006yMN-6G
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 02:54:40 +0000
Received: by mail-ej1-x62a.google.com with SMTP id bj12so32827209ejb.13
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Nov 2022 18:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vMatkpXRBfYZcOpwK4gKTH0eFwLe1XO/MVtN1h01A6s=;
        b=pRx3zIId767gjM7NXVu8V8PmGqYcR/4i6pri81J2dVsTmGdFdrOVQS9XriPKKLrM2J
         HcM20wGyaSiFQ8RMvwo7QxPuGX3QZa+wzUO2vp54uCA3+kTb98+EbYTsOfCDZCb73VXR
         CV67lwPGw3xS5VvxUMJsPuI/U5112u40Ltq6VsXTZ3VOQJBT8fsLEmFmbyNaHClpeSij
         mE4/7af4eNSDOYLZhNMzXu4KzBdWKcRKQy+wk5FUHrOuckKoHpRyw0K59WZcLmEB2JoG
         1hPsAxDy/cfLbqlgFXhx2CWBcXO2qBIcn3fFsxXE+ok1XQDbMpqhdE9nbCf+eRqR7FrY
         /Ljg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vMatkpXRBfYZcOpwK4gKTH0eFwLe1XO/MVtN1h01A6s=;
        b=wUbqKYEmcDuyVP6o+9f7NvXTBjVTLcsrAre9uld0l3Fud+UkBQ5Mw6q4KykCaEdjRC
         qI2fxLcP9Q5fRp6VFYA5F7m1cUJY6x46Z3wQcpwix7DkgW9G1RHPKE2ymlmAhIf90v1Q
         aB+cbluc5NmCFvVfFoZ+CM3m1GNPXnd6yeBQrYt9gg7QwXO5Aw+0e34RcC7lePmASpgO
         JXHRfNgOhf+1oNoChG47hnWbhhvrCxbfkBVVD7SCVoz1NQ7qe5VAPfDBkX2ZCClDbeyG
         i7U+qMFlIc0eo0JvRoARyRwHPE1FiJ78/5qXSu13p5enrDjYHC6m3CwXK+2D95tda6Dq
         X2yw==
X-Gm-Message-State: ANoB5pm4YdVHXigJwNG5YMRwrZyhAWwrRmn3Jd1gdj6ExN57bB0fAE83
	MV0eQL2O7hfPR93S9xUp+1nJOoXlOo6N9NDA
X-Google-Smtp-Source: AA0mqf7yVrSTl6QoiMkprqkNQ9/YAbx/qUv/mivAcZBzk781qq/v68Bm/XB1ajZuwcArbC0YNAE3pg==
X-Received: by 2002:a17:906:6007:b0:78d:b6ea:174e with SMTP id o7-20020a170906600700b0078db6ea174emr12023955ejj.95.1668480874794;
        Mon, 14 Nov 2022 18:54:34 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id l9-20020a1709063d2900b0073d9a0d0cbcsm4861177ejf.72.2022.11.14.18.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 18:54:34 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com
Subject: [PATCH v2 07/15] dt-bindings: mmc: mtk-sd: add bindings for MT8365 SoC
Date: Tue, 15 Nov 2022 03:54:13 +0100
Message-Id: <20221115025421.59847-8-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221115025421.59847-1-bero@baylibre.com>
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_185436_267937_D23490C9 
X-CRM114-Status: UNSURE (   8.57  )
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

From: Fabien Parent <fparent@baylibre.com>

Add MMC bindings for MT8365 bindings.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index 6f8ecb4788eb8..36f9fce8f4795 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -35,6 +35,9 @@ properties:
               - mediatek,mt8192-mmc
               - mediatek,mt8195-mmc
           - const: mediatek,mt8183-mmc
+      - items:
+          - const: mediatek,mt8365-mmc
+          - const: mediatek,mt8183-mmc
 
   reg:
     minItems: 1
-- 
2.38.1


