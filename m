Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0D16C77B73
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Apr 2023 03:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lhCOIWu5TyYboPWbdE5sGErQUzQeTZ3Ep4X13Ctc3Mc=; b=g4IMd5a2AYaUSW
	abJrgb9mi9rMXg53fkRR1xgJLTvJw7NWMTK6XAvjJ7EyEKDZuv3u1cn6VCU6mKzk47NG2NIl3m1V4
	KAFZCZYIFOYwonAFT5pJVxMur0aEk4CcumolCzPeQlM2WC0b8SR24YiLrifPoO5bSe72w47RS2wFL
	//ED4vl+3pqHVt6iUb+7OxeF0dZVM1FGxiTYid3K1ZjKIq4di/SSuLelpZk/NW/qtKjpuQFv4eBww
	UkpOW4FpNmGM3skcjE87coh3LJ3s5a4QTZ83urNqtI7p6jvlEWvAfW1CEjuNBujCHguKWeta3HZhX
	Kmm9NC+8CHYlbquVkWvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prsl4-005O91-1W;
	Thu, 27 Apr 2023 03:57:26 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prsl2-005O7t-0h
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Apr 2023 03:57:25 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-24b89b9a72cso3922464a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Apr 2023 20:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682567842; x=1685159842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhCOIWu5TyYboPWbdE5sGErQUzQeTZ3Ep4X13Ctc3Mc=;
        b=THVAPf/sJ9XbPlx4VFMwYf/sH8XzYmCLlTS+GixH/Hf/4I8JFrwhvFayxf7EQzZNqJ
         Y4ZHKZFprJVzEW9aqzYmfPgJtv4ess0b1n1GXiLiG3x+0+zgeIS/DN8e5O2Tbo93PANk
         5WJ6HE3PEoe4UJPHAWj1PnLofqErfs7zGrcc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682567842; x=1685159842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lhCOIWu5TyYboPWbdE5sGErQUzQeTZ3Ep4X13Ctc3Mc=;
        b=IZnPWJBywRGFUbPGNm73OqeSPgFdoE//U7KClDsegGfirtVQCnnQRCfij1pt2axN6E
         difxZM+IcEgt991ygVO7KEHxKLDDzxEov5PVN5VdPaAxWLFQhZnftcTybmpqf5Fszlic
         3NSw20jnuU1WfMNv/t4gwFfW3Rzuw3VZ8d/0ADXle6C4gmCqB1VZg0BgAHmMmLftlety
         FTVzGjFthAPHelXJkNFQ/FoJao9/v+L8tkmSkBIHlH2/LOFBKxH9yLw7qntS4nAZmsel
         /dWcsnLaq2fQu3/9czs2dSsmKrnNu4fdJx7WCxeLKhukwmlLFKuV+kyPp0IaG3sEmHa4
         cEJg==
X-Gm-Message-State: AC+VfDzodt/df/WrBQoq3ELkvcjPvEGw01ynTIV2Zj0Pmm+DYPkPCJTl
	V2bEzjbysKMcMDy+Jk/Z9f55Hg==
X-Google-Smtp-Source: ACHHUZ6+ODO9AiLzuUo+FLt7d2YQ0MHqALu5dymdPnnaR9OUwMHNGLKwHS6bsK+sP6eF7yD0+jXoAw==
X-Received: by 2002:a17:90b:204d:b0:247:a272:71be with SMTP id ji13-20020a17090b204d00b00247a27271bemr369502pjb.46.1682567842239;
        Wed, 26 Apr 2023 20:57:22 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com ([2401:fa00:1:10:dcf6:797f:140d:6d])
        by smtp.gmail.com with ESMTPSA id u1-20020a17090ae00100b002471f9a010dsm12214092pjy.21.2023.04.26.20.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 20:57:21 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Jeff LaBundy <jeff@labundy.com>,
	Douglas Anderson <dianders@chromium.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 1/2] dt-bindings: input: goodix: Add "goodix,no-reset-during-suspend" property
Date: Thu, 27 Apr 2023 11:56:55 +0800
Message-ID: <20230427035656.1962698-2-fshao@chromium.org>
X-Mailer: git-send-email 2.40.1.495.gc816e09b53d-goog
In-Reply-To: <20230427035656.1962698-1-fshao@chromium.org>
References: <20230427035656.1962698-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_205724_254918_AADF077C 
X-CRM114-Status: GOOD (  12.30  )
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
Cc: devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org, linux-mediatek <linux-mediatek@lists.infradead.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-input@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

We observed that on Chromebook device Steelix, if Goodix GT7375P
touchscreen is powered in suspend (because, for example, it connects to
an always-on regulator) and with the reset GPIO asserted, it will
introduce about 14mW power leakage.

To address that, we add this property to skip reset during suspend.
If it's set, the driver will stop asserting the reset GPIO during
power-down. Refer to the comments in the driver for details.

Signed-off-by: Fei Shao <fshao@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: Jeff LaBundy <jeff@labundy.com>
---

(no changes since v2)

Changes in v2:
- Use a more accurate property name and with "goodix," prefix.

 .../devicetree/bindings/input/goodix,gt7375p.yaml        | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
index ce18d7dadae2..1edad1da1196 100644
--- a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
+++ b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
@@ -43,6 +43,15 @@ properties:
       itself as long as it allows the main board to make signals compatible
       with what the touchscreen is expecting for its IO rails.
 
+  goodix,no-reset-during-suspend:
+    description:
+      Set this to true to enforce the driver to not assert the reset GPIO
+      during suspend.
+      Due to potential touchscreen hardware flaw, back-powering could happen in
+      suspend if the power supply is on and with active-low reset GPIO asserted.
+      This property is used to avoid the back-powering issue.
+    type: boolean
+
 required:
   - compatible
   - reg
-- 
2.40.1.495.gc816e09b53d-goog


