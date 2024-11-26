Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97544D59D94
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2024 10:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iX8xzwbYhyoqhIB2hSc4QZ8h9QtVSz/pkj+4ftY5rkE=; b=wuiWbpEnFKOvRidSoMPo8SR8FM
	4CuDnkAgMq3qWtYtBLpfA7WDmVEpV0xQNtVvo+p8mQ19T0kNp+VWc2+GZxueHaQTp8B6L9IWTteXl
	nOT259vE+ZcoMOCtamuSCMMFb/4TfTUayZkJDbc7cv8hLkn/PbZiLddVOMNkr1B/g+LJgd3tzrd9i
	1dsYdZ7+UocMAXnujbovHaxn+B8ikf+luWwG3tQELI75CvHcM6w4sg37OOcKYkP65YvO/cmMVMZ1M
	y5s698AH1JcNHXHYS9W3eubDLN0JZtQHXd0rmoHcqROffXpEgUrGyAWMMLuk1mSCUJoJL8rgW1VUL
	6d6IpzEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsxp-0000000AKQm-2CJP;
	Tue, 26 Nov 2024 10:38:37 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsvu-0000000AJwy-2Zmi
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Nov 2024 10:36:40 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aa530a94c0eso475223566b.2
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Nov 2024 02:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732617397; x=1733222197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iX8xzwbYhyoqhIB2hSc4QZ8h9QtVSz/pkj+4ftY5rkE=;
        b=FoWk8GxyiY3r6Evo+7z4NTIZw1k96D/Qm2Nr2RPUJvj+C4A9KzhybK5hACPOKFYgHi
         lgFBY6GG3YumMO3z82TnJmfD4FxaSJkZqC8vZVOn1frLddnaU58M045bsrviVcswELYY
         jL7rVv5sdLLY2PPY7Hrih7CGAVu/2snJl0cL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732617397; x=1733222197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iX8xzwbYhyoqhIB2hSc4QZ8h9QtVSz/pkj+4ftY5rkE=;
        b=sqQKBa05dKIr6iIROAjHZPKMzPcZYEtjilBz+5T0fin3oNcnUU09usVwuhUft8Zo4o
         TEuGieJSy+BGa4JMhBak0hBx56FOwJJkr6vN6Ji+sriUSX3zJ5wPdUMz9bBYQQJtBv0W
         v6s3PhlMnkec9pKFD4OFd0GHBf81Vfc6SWPTeMhe1/GqYjfezhsTfyVcV2WSa2pDBXLD
         zuYoaNGy4ZLClV2kjloK/nfr64HW8v/EIoDjKLKwRSu1xS+qNCMwpB6ZSOpgjG0X5lbp
         q3ZDfiqndh6MyxXB4OLhHzwDBei2dtXF7wbpVhhvAmhaPb07QyDlX27XD2AlbMS+ZuqL
         GPFw==
X-Forwarded-Encrypted: i=1; AJvYcCU+RzMLNfykg3azTerNt/Hj+qKt7A+nI7KsTPGLcHyzuc5LS2ASfntVv+vJQDst7uM3sqPieux95qWSlM+kSw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh1D6xi2eyTpXbVmz9uBidbbxfArB4PJJcGCRFEftnIUSlTLaZ
	MJrQlSFl20hgOMqxEn6q5MHrm3XiaayEsiH11QTC3GV/WS61g/4po+RDqMTMOw==
X-Gm-Gg: ASbGnctq28uZ8IG4bW8D5fcSdmRt12BG+yicvfCu+4bRMLD79VoTb74QvVrlfpSgT0g
	bA/yTp9dQ1F3cg50/8hYrf+2/ymnFySmEIc1ll8lv3ub5+vf55E9NfdAFhuhvye12OYIgBC3/qT
	9QcStoGRzyOqwYyttsVVVoQFPo8BczJF7cF1m3im+bPWsPnQkBnxbET6Xt+1FOej5i/hkpBxN1F
	XP2E6Y/gazRx58bM10513DNDrTUcOQPaVMOY2yXaAR+JzozEqXMVy2jHaVMKPQkGlEFHR/4tHPO
	6dX4nHcm
X-Google-Smtp-Source: AGHT+IH7pzt4uagb2/yHSWvl5yYjrOK0GvCI0T39Co0MwSq5iX+PgtgIfkrdFxk3mxGtBSslu+TfUg==
X-Received: by 2002:a17:906:308d:b0:aa5:4b7f:e705 with SMTP id a640c23a62f3a-aa54b7fe8bfmr702146366b.1.1732617396904;
        Tue, 26 Nov 2024 02:36:36 -0800 (PST)
Received: from localhost (30.171.91.34.bc.googleusercontent.com. [34.91.171.30])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aa54afde284sm292271266b.17.2024.11.26.02.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 02:36:36 -0800 (PST)
From: Wojciech Macek <wmacek@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Rafal Milecki <rafal@milecki.pl>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Wojciech Macek <wmacek@chromium.org>
Subject: [PATCH v3 1/2] dt-bindings: arm: mediatek: Add MT8186 Starmie Chromebooks
Date: Tue, 26 Nov 2024 10:36:31 +0000
Message-ID: <20241126103632.419469-2-wmacek@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
In-Reply-To: <20241126103632.419469-1-wmacek@chromium.org>
References: <20241126103632.419469-1-wmacek@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_023638_650373_B7CAD5F2 
X-CRM114-Status: UNSURE (   9.65  )
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

Add an entry for the MT8186 based Starmie Chromebooks, also known as the
ASUS Chromebook Enterprise CM30 Detachable (CM3001). The device is
a tablet style chromebook.

Signed-off-by: Wojciech Macek <wmacek@chromium.org>
---
Changelog v3-v2:
 - No changes
Changelog v2-v1:
 - Fixed items/const bidings description in mediatek.yaml

 Documentation/devicetree/bindings/arm/mediatek.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 1d4bb50fcd8d..6191a5320c14 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -263,6 +263,19 @@ properties:
           - const: google,steelix-sku196608
           - const: google,steelix
           - const: mediatek,mt8186
+      - description: Google Starmie (ASUS Chromebook Enterprise CM30 (CM3001))
+        items:
+          - const: google,starmie-sku0
+          - const: google,starmie-sku2
+          - const: google,starmie-sku3
+          - const: google,starmie
+          - const: mediatek,mt8186
+      - description: Google Starmie (ASUS Chromebook Enterprise CM30 (CM3001))
+        items:
+          - const: google,starmie-sku1
+          - const: google,starmie-sku4
+          - const: google,starmie
+          - const: mediatek,mt8186
       - description: Google Steelix (Lenovo 300e Yoga Chromebook Gen 4)
         items:
           - enum:
-- 
2.47.0.338.g60cca15819-goog


