Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F904CE7D10
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 11:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=23R0TZIA0axsqA2eYwuXEJ8B9IwUUAXH2P+ON9b6WwU=; b=oCcmm6WdY9vEb1
	wzBsJDoSTHUNGTA2pF9vNVKJqwzF0mA+ziNHbiLYq08vMPVwECqVIbTY9G4CQ1EVxQ0bngzLua5dx
	Up2rROPecRrwLXKMreXQ2gdwXfujFdzHzaj/qmauiWB+no/T8ZfjNLHQSKP8zDoO8bp5jeoS9rnY1
	UFluv8Gj5sUVfQfUGgUBzNp5YZ9iNKSW7fd74xi4zO7CH50efnouIcgRnPJqBtZWp7bTU1oPq3C6t
	cKEnliWM7BWQxLJWAGfSEP3PL1FIUC9prDl1Au/a8WH4axa4Cma0qp+7uJ9yoLTlJDsuoYtWW7jgl
	dRODM7xm/kFpk4qPy/Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svbCA-00000002Y0N-3hp1;
	Tue, 01 Oct 2024 11:37:34 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svb68-00000002WGX-4AX2
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Oct 2024 11:31:23 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-71dbdb7afe7so362237b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Oct 2024 04:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727782280; x=1728387080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=23R0TZIA0axsqA2eYwuXEJ8B9IwUUAXH2P+ON9b6WwU=;
        b=giZg4nvxjE11ZvdCmn+zWvtdyLxBeAJ9ZJ2lr+2GwVHTADaUrSpX164UUn43N/HP8g
         K4Kqk0AhFZU1d6ZlzubdzZckyQCrHQwckp1pIIK/yLsHWAxZt2cLleDMuyb8Kn6iE9Ll
         WZ48UxShw+S9ip/IZBcxeFOCLxUYqaVQ8KZRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727782280; x=1728387080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=23R0TZIA0axsqA2eYwuXEJ8B9IwUUAXH2P+ON9b6WwU=;
        b=LVRsnE/joTHf/QMWCvs6bIigyctsKyUnptO5hKcKpN1uvHB0CdoTBX17ZgRUmjSsBj
         PkwmICHZYVaS0dngRqio2mVDzZceNQdL/k8nIsjz89tnYf0xyT+SXAQwiIktdRWS/36j
         Hz4g9ixBA2E3MH/fqoD3kNLd4+kOseuuK6826E8R2Y+6k7q/6+Fktp2P3yC8438EZeUt
         mdZUD0zy7mPlZf6P31YE9HVcQC2DyIdf4m5Fg99Ge15DJVA1EgVRzpHGT9b3Lc+g0J3a
         wXiMewBio47EkzkzTXjm5ZdT0guBd4Hy1QVJsZ58KBV9MHvDfQGbt5kRIYT4xRKGBkI5
         69Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUixsraxOu/NtKZZ3xkYBUPf799zZqJlgYcia9S+psjdNvwc3oSO2MHsoFO6r5xCH0cI9p8kgQ1V7ob3FDQTw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyK9lNjvwCFok1SECFjqyf3lDXbg2HJyZQ1x5CbLes9BnMP53b6
	dJzEuUOz2fGCwAlUTRxfNebXeXOqDU/LrX+AA6RlxijrEzyBW7WT0FCHpeeYUw==
X-Google-Smtp-Source: AGHT+IF0uBLqB/6IIB8dOP9zNZ4TWM/ZpZfM3H+BJ9RdIgLyjCLjfViOtBRFUY/B925GuvlwYj39cg==
X-Received: by 2002:a05:6a00:194f:b0:70d:1dcf:e2b4 with SMTP id d2e1a72fcca58-71b25f00bf2mr23616838b3a.1.1727782279856;
        Tue, 01 Oct 2024 04:31:19 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:e044:f156:126b:d5c6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264b63d9sm7810646b3a.52.2024.10.01.04.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 04:31:18 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 1/8] dt-bindings: power: mediatek: Add another nested power-domain layer
Date: Tue,  1 Oct 2024 19:27:19 +0800
Message-ID: <20241001113052.3124869-2-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241001113052.3124869-1-fshao@chromium.org>
References: <20241001113052.3124869-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_043121_045685_98116FCD 
X-CRM114-Status: GOOD (  10.17  )
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
Cc: "Rob Herring \(Arm\)" <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org, MandyJH Liu <mandyjh.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MT8188 SoC has a more in-depth power-domain tree, and the
CHECK_DTBS=y check could fail because the current MediaTek power
dt-binding is insufficient to cover its CAM_SUBA and CAM_SUBB
sub-domains.

Add one more nested power-domain layer to pass the check.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 .../devicetree/bindings/power/mediatek,power-controller.yaml  | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
index 8985e2df8a56..a7df4041b745 100644
--- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
+++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
@@ -54,6 +54,10 @@ patternProperties:
             patternProperties:
               "^power-domain@[0-9a-f]+$":
                 $ref: "#/$defs/power-domain-node"
+                patternProperties:
+                  "^power-domain@[0-9a-f]+$":
+                    $ref: "#/$defs/power-domain-node"
+                    unevaluatedProperties: false
                 unevaluatedProperties: false
             unevaluatedProperties: false
         unevaluatedProperties: false
-- 
2.46.1.824.gd892dcdcdd-goog


