Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602A8C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 22:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2O5vWkp4VVtby7fo8I+jnDE21EM4qyO7JPmEHu2zBIc=; b=Fqtp57LittHY6C
	Dg1iEzMAehgZHbx8o578Ym2OzaM0cvlFtJ7gLuWtQ3S/xDuCgq/JKskaqoQ1LOzZtP8cHbk6dJx84
	fzXbMWcRLQoqeMl8ELxZRfiFCY+ogPSsJdoNZ7OMufNaSPM3czZ8kwET1elAgjsLVloJYP6c6NATM
	AAkIDOZ0BgoBqS8/fIaCr+yrBe6Imp736kg7k84TJ51pVfJycxGkB+TxuVXZZ5vEmk7tSne0VfeM3
	RHi4uVKvGkLR71XXJAlZiJCHaHg9zBuauVJ5OCbSeDg6iuAJO660kxjuOJLwjciqvLVeRHCEXtENG
	J/oNKQTWMTCIFiZZq4Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCqVU-00Ddib-DT; Wed, 26 Jan 2022 22:11:12 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCqVG-00DddN-SM; Wed, 26 Jan 2022 22:11:00 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 z25-20020a0568301db900b005946f536d85so673585oti.9; 
 Wed, 26 Jan 2022 14:10:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=ErA2xJGyfWSYJZEIE4ymjWq+FHZjiaQLmgdO3g2KNUc=;
 b=uW930lYYhDMsV4N8lkyaVBaTbZfkpDiZCcxMKzY+KJpBr+AvpvqFFzJ7GM9FnPTi77
 06YzLLHtUC8PgO+Alg1qUK2mXpcqN67ClBH/ltEB9EYRjiE6yeNYoY8UmkVwwgb0eydY
 JQi3LBP2NRFpQdayapMIBvZqp0s5cSCbNn5759jyLJkBMyzU2XUAKerOO5wszzJfj9rz
 96/sLoyfIdyslO0aBPQWvmVq/Pb/8gscHhJvSVAtMRSnU8qKOjXuFvDGqc5y1Gg9Ze+u
 PzgmJ/VBFZp2C/lwKlyqzuMhGhBdD8U4bsMGO0Gi/xKWxGyTwyQLifdLp/V0SJTfuCFn
 9/8g==
X-Gm-Message-State: AOAM532QMzCn9knQzo3L1jwcIulMv+HZSaHo6VSsVHcJ7W5bBKQFXXIv
 XjQKaFzH0q/N5sM8f2Mnxw==
X-Google-Smtp-Source: ABdhPJxTBZ7c6Wq5DHgltU/Q1WMSaZYDKppblBxy9TQyb8u7AQ+3YgLWJ4jobGbI7xEs0woA2CBcMg==
X-Received: by 2002:a9d:4c0f:: with SMTP id l15mr538154otf.104.1643235056485; 
 Wed, 26 Jan 2022 14:10:56 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id b8sm6704762otk.36.2022.01.26.14.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 14:10:55 -0800 (PST)
Received: (nullmailer pid 1535098 invoked by uid 1000);
 Wed, 26 Jan 2022 22:10:52 -0000
From: Rob Herring <robh@kernel.org>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Fengping Yu <fengping.yu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Marco Felsch <m.felsch@pengutronix.de>, linux-mediatek@lists.infradead.org,
 linux-input@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
In-Reply-To: <20220126153519.3637496-2-mkorpershoek@baylibre.com>
References: <20220126153519.3637496-1-mkorpershoek@baylibre.com>
 <20220126153519.3637496-2-mkorpershoek@baylibre.com>
Subject: Re: [PATCH v19 1/3] dt-bindings: input: Add bindings for Mediatek
 matrix keypad
Date: Wed, 26 Jan 2022 16:10:52 -0600
Message-Id: <1643235052.864878.1535097.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_141058_945366_2DB6422D 
X-CRM114-Status: GOOD (  13.34  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 26 Jan 2022 16:35:17 +0100, Mattijs Korpershoek wrote:
> From: "fengping.yu" <fengping.yu@mediatek.com>
> 
> This patch add devicetree bindings for Mediatek matrix keypad driver.
> 
> Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> ---
>  .../input/mediatek,mt6779-keypad.yaml         | 80 +++++++++++++++++++
>  1 file changed, 80 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml:28:13: [warning] wrong indentation: expected 14 but found 12 (indentation)
./Documentation/devicetree/bindings/input/mediatek,mt6779-keypad.yaml:43:8: [warning] wrong indentation: expected 6 but found 7 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1584526

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
