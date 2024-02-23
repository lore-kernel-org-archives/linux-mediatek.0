Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED75FC5478C
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Feb 2024 10:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=85mVdfmieSyePN9kKLLWp/rml6afpBa0DNNt1hnWsOg=; b=juL35CV6Bg8/PIgvg2lj3iJUB8
	M1G8/H93qLj8qDHw+1i19FxR02rD8bFQ/JBHJGx+zwdwum11+Lw0gemJTY0a2+FrnZCiv85Dzpgu9
	uSssWyivJ+Y1SDq/ROOqsWIKau63c+Ktbf4hzgiV70Y/XZVB7Qrtq8OExQL9CemVcUWF+3scUuC5h
	uAgt2ukyFqqfUsTOu+yFu/YCjXP8BjG9L//vex4JGYnO1yAqMZa2qxzLFKP2NFVUxbaI+tJ4r4Oit
	mdpebFENRdUtSuKfvRS7fm2MHMpT9V/iiwPikaemTND0/tiajfenJcqPj5fkOYzWrwlc0vaW92XnQ
	BRVfnLHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdSdG-00000008rwI-1Izo;
	Fri, 23 Feb 2024 10:18:18 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdScM-00000008rZL-36of;
	Fri, 23 Feb 2024 10:17:32 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5655c7dd3b1so367987a12.0;
        Fri, 23 Feb 2024 02:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708683437; x=1709288237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85mVdfmieSyePN9kKLLWp/rml6afpBa0DNNt1hnWsOg=;
        b=Q2MFQLfW4gFZVbeEcaTgO4H4dkYbwSNmDeCgzt6UwH3DfD2y20hJcLuJX3y70zBnbZ
         RNLXtjY8F6g6xR/RAjDN2QIsyE6Mz96CoZhGaecrC0twJc24PzAF84/m81jjZHg9xPuC
         dYo9npCPcLu2LgqjB05Y6PHy2YDluXzzCQNmouQnYV5xcSWDR2S05PLNwIb5weyq+RLL
         EkNkWYrcwQoxyd131eNJ3sYXgMlcG8L543sL+f5DlFqag4AjogIuP8Yi8x+49BLL35q/
         BEXB53+ZH+s3UaluABgmMoKKsRuU4O3lKi0lZYN4RgshzKvSIgxgeUd//HcnVBscf1Rd
         6oBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708683437; x=1709288237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85mVdfmieSyePN9kKLLWp/rml6afpBa0DNNt1hnWsOg=;
        b=tSK6A3/eiIqhf5TQ0naWdx8mBsfLvhtdV5qoR/QoOT5gAPLvpNe4gnYq8yLaiUcG9Q
         GbeQ7Kv3llQpWZkHR7JLchwjXo3F3M2W/w1lsmsNHEPLaJaPZdgdISWsAEHqsMw6QhFF
         StuD922fl72HGkAT7VlWcyR1uL0d3V2x5c9jcajMTPoejE/ffIuAvuG9zoXuqA/9cRQz
         Y6JnJfG1LsKdWDpScViNErqMSaaONDcidI4LcSvasMSVdwRr7+u8awFeRjQrYW3GUCj4
         NEA2EfWvXJNQWB80UNNxCnUX1L06gH7drDG1jU1mAtosApIUjRvaE2xr++FsMUn+28x5
         g/0A==
X-Forwarded-Encrypted: i=1; AJvYcCUN+Z1PRRzvpvfEWPCraIH2TEl5FFr2AZTAG3uV0r1ldwpxCERJmQjp3I4iZHrhReh+9x6O+I3MqMYhTpSF+yuQx/t8tHumvn3tjr4NFbDGo/r3YvU+heTzyV0073xwdUBg2Cns+lgmZuNjad1P4O5YZs9gYEZkAMg=
X-Gm-Message-State: AOJu0YyqiI/s20yaJyafrj7NfNUBboZeYe1L7RvFv71sc5KA2zyoOPGs
	++kGQu44ZmOdvX/5dFlZKlh15erTSlEZVv8TAzA8ywsmFv41QGPkBMyR1CbV
X-Google-Smtp-Source: AGHT+IGPRSEDB/NYZrCr0iipCPdM8Mj0L6+q/X1kjeEbb5aISJQ4+uGlmTeluLm0fPU3TnORdwZqGg==
X-Received: by 2002:a17:906:3b12:b0:a3e:53d9:c7d5 with SMTP id g18-20020a1709063b1200b00a3e53d9c7d5mr1075726ejf.36.1708683436768;
        Fri, 23 Feb 2024 02:17:16 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id ti7-20020a170907c20700b00a3d99dc3f3asm6667250ejc.67.2024.02.23.02.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 02:17:16 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH V2 1/4] dt-bindings: vendor-prefixes: add Cudy
Date: Fri, 23 Feb 2024 11:17:06 +0100
Message-Id: <20240223101709.30072-2-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20240223101709.30072-1-zajec5@gmail.com>
References: <20240223101709.30072-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_021723_052639_1A02ED5C 
X-CRM114-Status: UNSURE (   9.56  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Cudy is a Chinese company providing networking products.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 20ed04148092..57f91c83152e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -334,6 +334,8 @@ patternProperties:
     description: Czech Technical University in Prague
   "^cubietech,.*":
     description: Cubietech, Ltd.
+  "^cudy,.*":
+    description: Shenzhen Cudy Technology Co., Ltd.
   "^cui,.*":
     description: CUI Devices
   "^cypress,.*":
-- 
2.35.3


