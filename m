Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A572C77B6F
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 13:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgFPvyHrHPtWE9sKCzX6mH86Owceqhrm+Hat2sO8n/A=; b=Rg59FhNzXf7kFfs0/RTtHO9OEo
	v9S2mhsMZllBoxqLcoI/iCpFVxgf65hzo98ur6EVKom+juz4Kn47M3Kf/aeuCPsFdpTWe3o2C70fh
	zA+rMU2SQ8P1tiYMqGO95XjVzirHBN/DoaAl64hsqsFuM1v3JBT/t7w62Nl1H7mOFYuEzJZhAyamb
	BdNawAHYYC7aJ3hlStehYrPrsme3KJ1gnwK/7DvlcoXPHw0d3QDpKst4Acf2AVuc47RAt05Pf7Uq/
	lbE1dEz58Oyi25lovP0Z+gI3bNuqqQsxGKDbkxAxJTb84/rIqoho/IwQXPRSdJnbN3XEbglMAe2AA
	MB0Io1ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEEh-0008ba-02;
	Tue, 11 Apr 2023 13:40:39 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEEc-0008aQ-2T;
	Tue, 11 Apr 2023 13:40:35 +0000
Received: by mail-ot1-f45.google.com with SMTP id bu14-20020a0568300d0e00b0069fab3f4cafso3855667otb.9;
        Tue, 11 Apr 2023 06:40:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681220433; x=1683812433;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kgFPvyHrHPtWE9sKCzX6mH86Owceqhrm+Hat2sO8n/A=;
        b=TA7KTmBflHV5jHu/pShU+SvGuPaAI2lwdRv5swp80YhzPOOs81VWFxcEyOLfPT2lgM
         oE0ZU+cUIPY5/fHCJzolTAfsX/+9a5Z1ZOEw9JrosGLcZcmSXSrIrZqxZSP8txuvXCmX
         YZFaiJHl6fZhcOEDlHNghocNDiBkaTg4Fugom23l/lN9zfZFIvUAkjeasPk1JD6h5hZ5
         Ao2OkjpI65KgghJOPpLge8Z2fBJ1+fi6pQahDqcY8BpgDE+qJOMx69lQAHs3bub86e9e
         NKPDCYqFXOoy98/Fy3eUNQHD4kHiTHzmsmnIpEO38NtqNm35P5bVbaHaqWBqPGkFasA9
         UegA==
X-Gm-Message-State: AAQBX9dV7ftOsBQ4TciNkTq8FcAlv9Ysf9gzwttWtJB4XKKbIVJpr3A+
	Fqyhu+yF2HtL3iiI8r/jwQ==
X-Google-Smtp-Source: AKy350YG5U9QNvXG9urYlKAKQZf2PCcV3KsTjbecvU+8kIfA5d1v5KG8LereLUse+pLSeMjkUuqZwQ==
X-Received: by 2002:a9d:6659:0:b0:6a3:c70d:bb94 with SMTP id q25-20020a9d6659000000b006a3c70dbb94mr5785020otm.17.1681220433511;
        Tue, 11 Apr 2023 06:40:33 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id g25-20020a9d6c59000000b0069f95707335sm5338427otq.69.2023.04.11.06.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 06:40:33 -0700 (PDT)
Received: (nullmailer pid 2941891 invoked by uid 1000);
	Tue, 11 Apr 2023 13:40:31 -0000
Date: Tue, 11 Apr 2023 08:40:31 -0500
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, Zhiyong Tao <zhiyong.tao@mediatek.com>, Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>, catalin.marinas@arm.com, Will Deacon <will@kernel.org>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, Fabien Parent <fparent@baylibre.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v5 03/12] dt-bindings: watchdog: mediatek,mtk-wdt: add
 mt8365
Message-ID: <20230411134031.GA2934043-robh@kernel.org>
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
 <20230203-evk-board-support-v5-3-1883c1b405ad@baylibre.com>
 <CAFGrd9oi0AT3L8DVs7OYq-RjzBTqD+CB5mjKOwEbgNJDdyj2=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFGrd9oi0AT3L8DVs7OYq-RjzBTqD+CB5mjKOwEbgNJDdyj2=g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_064034_806945_9274BADA 
X-CRM114-Status: GOOD (  15.86  )
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

On Fri, Apr 07, 2023 at 03:11:18PM +0200, Alexandre Mergnat wrote:
> + To: Catalin Marinas <catalin.marinas@arm.com>
> + To: Will Deacon <will@kernel.org>

Why? They don't take bindings or dts files. Those go thru the subsystem 
(watchdog (for bindings) or Mediatek sub-arch tree.

Second, if they did pick this up, they likely need the original mail 
sent to them, not a reply.

Rob

> 
> Sorry for the noise.
> 
> Regards,
> Alexandre
> 
> Le ven. 7 avr. 2023 à 14:59, Alexandre Mergnat <amergnat@baylibre.com> a écrit :
> >
> > Add binding description for mediatek,mt8365-wdt
> >
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> > ---
> >  Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> > index 55b34461df1b..66cacea8e47f 100644
> > --- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
> > @@ -38,6 +38,7 @@ properties:
> >                - mediatek,mt7623-wdt
> >                - mediatek,mt7629-wdt
> >                - mediatek,mt8173-wdt
> > +              - mediatek,mt8365-wdt
> >                - mediatek,mt8516-wdt
> >            - const: mediatek,mt6589-wdt
> >
> >
> > --
> > 2.25.1
> >

