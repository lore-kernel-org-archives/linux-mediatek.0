Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7880AC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 22:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c5OtwbUxmcTKUcw9nCm7KvLn2T2yQoHX2fxmIgn1joc=; b=xx6tGkLDehrqX7
	2us4s/LPIEoMxf/uBcdY1tD+r5rVg/ihaJ63PEPuhQQCX4MmB+5EkwY7o5QSSd5j4FJO/W07CotFW
	EUU+T8JnV2hXYuK1N2Z47Sa1NgkFLanSnmm7b+1SYjPyiQf3v0SBglnF29RvtRrnRLQwJ6KoNsOGu
	V1VcUrXmvJqDoMcdKIJ58gplNC+gnAzj6d8bhesZhMhouoTzE7pZDnbHP+t+8KCHpur9kTYc9qRCA
	qeAAz6Fv4r2BJdUsVVfFTsItR3s/TMD/s42OmLBOXC50kbh6cwh2hHdk3FZjXiwhcjTwWBVNI+2Gm
	zKbKqjgPqOX7ks+jFO8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdIpj-003bEz-0j;
	Fri, 17 Mar 2023 22:45:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdIph-003bEV-2i;
	Fri, 17 Mar 2023 22:45:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=c5OtwbUxmcTKUcw9nCm7KvLn2T2yQoHX2fxmIgn1joc=; b=NCfQ2S4bPW1z/Qr7RWrRuBSuxC
	tM0LK4luGOc/DfPnPFjz+FiOQCOnwQW7FR1ud81RhqZ7wJMYXPUe3kxaOTlK6Go9et7JKEYr8CaOT
	JugiI+8bAno1acsgukQxcVzmwD6jym8e7l5tpnKD/i2xb6SS45WOizsT8Yywd1LkvOU39kvtqYmEE
	GfYSWWReEyc37yQknW4sU2nazERs015UyVg2D3fcAqWuG+XkwLpLOz9csoDNqpoOI+QCQbQbpkQlh
	j2niYQA32/dBksidGXMv5iY847ZeL0rOzR9sqw4CIDjmYW+YUJw7Ng0xF45YcO1kYND028oPG7N4e
	0coPqnxg==;
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdHfF-002vWY-23;
	Fri, 17 Mar 2023 21:31:10 +0000
Received: by mail-ed1-x52d.google.com with SMTP id r11so25447329edd.5;
        Fri, 17 Mar 2023 14:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679088662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5OtwbUxmcTKUcw9nCm7KvLn2T2yQoHX2fxmIgn1joc=;
        b=k5HsOmpP6ocKUMcjWKrrBBicP5UP1XV0pgXiowNDsc8efI8SjF8Ug8j+PlzoizDdCN
         TJXVDLEFe2+yBx7YMqylpFiZYc1hLL8VE8uh7GmQAzjkaBOQWWOBDjAfBHvpqJ3TrzUs
         k75WwOjgSqSnCUaurN2DOiATz7dYdqiqiF7PoklCyXJjjVEwT4TviLtOQwmoFfgphtRX
         95f7pL99JgGaSGKa14DzIbTe/I3iUQ8i3dXvMQtsNG8kaSzJG2eQSqAV5k97W1Bydrmx
         xAahyDiV0s7RWznH1dju4uMZRmF/3eIWoY3j9E2POBe1trABTHRKGuqbp0Heozm1JkUg
         Rudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679088662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c5OtwbUxmcTKUcw9nCm7KvLn2T2yQoHX2fxmIgn1joc=;
        b=f6tlQVAmXpzZcZ31ST2QflIMi1pazw35L03PlsNgUEr39TfLyqkGuCTDdOdpoa8YIf
         8phFRAiuM+QN9SX6F0+7Spx4EyBS/X+H7FN6FoFxdY6x4ddqYgGdUuo+eAVjSX7JGFRm
         kGpsuAQvDMshb/c5NefzyJvQ5xuIMU00KTyddWTpmBB2wqv1gQyOcH9S155w3/pz9dmz
         KtcSbEva4OJlRWlkjqTSBhK2Nu+SKGsnmi9YDvf0Lu+JydVExKSsSBkUDgzhhX3ldkgD
         e52PyJeO+GYHlqiE1pFymR/5C5bvF/8eHef4JHpSXxiJXuNeyM266pyUakTyH87M5skD
         gpAg==
X-Gm-Message-State: AO0yUKX8mQYy6Z2QCZj6b3nxeA9OkiUgHU0JuAJ4gcoSMIWPJXyTDLfU
	Cr9R/QKOaxRoBAT/tdKR9EY=
X-Google-Smtp-Source: AK7set8dxol7s9TtQUQkUVdpCaiNcAKLEikKSgZOp+3/1rG7qVY0TV37G3jWDSdtBvXKUvmRn4xEcQ==
X-Received: by 2002:a17:906:810:b0:8f0:143d:ee34 with SMTP id e16-20020a170906081000b008f0143dee34mr844693ejd.1.1679088661990;
        Fri, 17 Mar 2023 14:31:01 -0700 (PDT)
Received: from arinc9-PC.lan ([149.91.1.15])
        by smtp.gmail.com with ESMTPSA id v19-20020a17090651d300b0092b86d41dbasm1404683ejk.114.2023.03.17.14.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 14:31:01 -0700 (PDT)
From: arinc9.unal@gmail.com
X-Google-Original-From: arinc.unal@arinc9.com
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 18/21] dt-bindings: pinctrl: mediatek: mt7986: fix patternProperties regex
Date: Sat, 18 Mar 2023 00:30:08 +0300
Message-Id: <20230317213011.13656-19-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230317213011.13656-1-arinc.unal@arinc9.com>
References: <20230317213011.13656-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_213105_994863_21DFB8D6 
X-CRM114-Status: GOOD (  10.56  )
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
Cc: linux-kernel@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, erkin.bozoglu@xeront.com, Rob Herring <robh@kernel.org>, =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Andy Teng <andy.teng@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org, Sean Wang <sean.wang@kernel.org>, Daniel Golle <daniel@makrotopia.org>, William Dean <williamsukatube@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

Set second level patternProperties to '^.*mux.*$' and '^.*conf.*$' on
mediatek,mt7986-pinctrl.yaml to be on par with other schemas.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
index 31c36689438c..0f615ada290a 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
@@ -72,7 +72,7 @@ patternProperties:
     additionalProperties: false
 
     patternProperties:
-      '.*mux.*':
+      '^.*mux.*$':
         type: object
         additionalProperties: false
         description: |
@@ -256,7 +256,7 @@ patternProperties:
                   items:
                     enum: [wf_2g, wf_5g, wf_dbdc]
                   maxItems: 3
-      '.*conf.*':
+      '^.*conf.*$':
         type: object
         additionalProperties: false
         description:
-- 
2.37.2


