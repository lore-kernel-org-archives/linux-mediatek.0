Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B45CAECE586
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 11:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e6ySKWEzCsAiAa/TsjxPZ6peBrSGtqkTqiQKSlr9U20=; b=XKuRHYKaNfI9K9
	RA+ci3pFXrvCmg6lh4Ho3f8HSX7c0DCGmJOFSVMdrfyqk0UQJ1PdTYnefqFZ2U1Vq7JmVIfeoVmVU
	7+w4HADYUHv1rjev+rBxaY6EmTGVW9oMjL9wSOJKGyC/cpXpOPKVrysNMrzz9FhZdMIyLbeCxJDK3
	wShsngPv0NGBviwzoAkCh5HKZf+Tn7fqTqm6ljm71UgxWbEAsKw+ncQeTi9zjt0TKtoND1WG8uikx
	4tdEE/nv4KYOTrwPlYGCdf6BKub1q5mHmgWmd9JB4KjbQvhTedAJPLt+5EUIbqyBfHVDCJqipoO0U
	FmPJfAAVlrv0hdnPTQIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncj7-00000001hSe-1ZyL;
	Mon, 09 Sep 2024 11:38:37 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncPH-00000001dGc-18TJ
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 11:18:09 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2054feabfc3so36354805ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 04:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725880686; x=1726485486; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6ySKWEzCsAiAa/TsjxPZ6peBrSGtqkTqiQKSlr9U20=;
        b=dsmnqSMhIioBl37SFTq/MxgAb8JBC6JFNpLtTWjvsAt2ET6+lqxFlNGz6xcrK4kjSy
         BYSxCHe7LvhxyG3Yl9rsX1Y2nLkrwNo9SArS5MYhtrelGB8Or+744Z1KTP3xQ5v2kkA3
         XQ4b0XKrnLICpAxcWkxm/0zGpGT/IFK/QLmUg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725880686; x=1726485486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e6ySKWEzCsAiAa/TsjxPZ6peBrSGtqkTqiQKSlr9U20=;
        b=XbGqPRkvW9O6PIT7XG6L95DPYOFyTMi7DLzZBQb3Sznvaif4BeAp7GvUByB4FBJX0z
         4T9k92+8W859lBtA9ncg0VBAOoBMfakbyPnxeg3wonjZaA74Ng5Q3O4JIakSZf3p5JQ7
         JvUnBdnB8bZlvWxeSEotY3RZf3Gt3phCKxEL9tALiPX6BOtuRqxBfIDcEU1VT0hr8DTD
         CyfGnDGamP83aR+mqsdtLwvQuuyCixv5RdUP1uyLkI3awIwsyrbpcsPaUGQf781YEMiD
         mDbyNnd4fP0atfgt5WTmvldcq362ZgY8/GX3iFBOjSPj5LaO5yfrhgOySpdgUkDcQxI1
         FUTA==
X-Forwarded-Encrypted: i=1; AJvYcCWVEy6VnhvsIb95IvNg1qwPgVh312RAw4i/M9piOmxWpBysthzKRXHnwfaP8B1y7PRxx+pQuYxa44gwRtNJlw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwupFNrykUEtDzanfaqzRtVGWUkhRMOLs7+uxBddF/ymCjxVkvW
	jw2T3oBdMs6nZcR6pqoFEq1woS1zDMKjie8KtB4Ulc61Ks2l1s29HB1vrjtq/g==
X-Google-Smtp-Source: AGHT+IEtPOD3nWUNQpY+7PlvHwLnD7f1Wes3G0ale4Gg3bhBQDbwb+Q3fTCcQ8bAAZ8Ozw65h4c4OQ==
X-Received: by 2002:a17:903:1c5:b0:205:8b9e:964b with SMTP id d9443c01a7336-206f0612c09mr132152285ad.39.1725880686059;
        Mon, 09 Sep 2024 04:18:06 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:6647:6d5f:dd48:8f5c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f1dc55sm32039745ad.186.2024.09.09.04.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:18:05 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 07/13] dt-bindings: power: mediatek: Add another nested power-domain layer
Date: Mon,  9 Sep 2024 19:14:20 +0800
Message-ID: <20240909111535.528624-8-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240909111535.528624-1-fshao@chromium.org>
References: <20240909111535.528624-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_041807_335385_8EE73F93 
X-CRM114-Status: UNSURE (   9.90  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Markus Schneider-Pargmann <msp@baylibre.com>, Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org, MandyJH Liu <mandyjh.liu@mediatek.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MT8188 SoC has a more in-depth power-domain tree, and the
CHECK_DTBS=y check could fail because the current MediaTek power
dt-binding is insufficient to cover its CAM_SUBA and CAM_SUBB
sub-domains.

Add one more nested power-domain layer to pass the check.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

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
2.46.0.469.g59c65b2a67-goog


