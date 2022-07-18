Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8A8C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 01:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ai6PAExtnvwmvUQ1ZBj8kPBo45sFiw2ydYbB8VGvDYI=; b=Tc8jReqtv40MXk+TTjog2YDQxX
	gZgg2rIj3eh6U61TZdk2TJA9LTaDcdosi/zVVZPG+dOzesGwUcSv42lwoPRpjDvkugJ9eQzc8Bzbw
	TGda/kK8YSAVrA8aSXNqxKc1tivK572eROZjwd4yPxRenfeJ1jZiUWYsQ5eGHdQlI2z5lExvZE3TW
	VGnUX9SYrXWjx07WURk0slp6MH4LMQ55avpleGnVwXI7skBpsHIHYYeLR7Sz74bRmLs79Y2+xJ+IZ
	5vjSh4mQh0GmTRXFwn8JyCTIOpyd63QAVruuPQA2Sup1oL4aLxA0+p+bWy9r3Hm0iP3L+ebkHYjkY
	Pvmz3YlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDFnQ-009t9h-G8; Mon, 18 Jul 2022 01:43:40 +0000
Received: from mail-io1-f50.google.com ([209.85.166.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDFnE-009t4S-Uy; Mon, 18 Jul 2022 01:43:30 +0000
Received: by mail-io1-f50.google.com with SMTP id r70so7105641iod.10;
        Sun, 17 Jul 2022 18:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=Ai6PAExtnvwmvUQ1ZBj8kPBo45sFiw2ydYbB8VGvDYI=;
        b=qgguwhicJ89wWWTqVjV7RfrnDns+Z3cmdzTH3zwiJBs6vW9q+2DdR3gdly/WA26XBk
         MqAV5O1y5DqnaWiFUuKG4vLmKdIVY/rZ9L02sknWgYyImzq9N9A9WRKn6H44HVdY0/3e
         QvAuepg4KCs8F9MuGR6YoM2xh85jT3eN2YFZ6q7SNV/hY1+YrdnGUaAZsMOycEqgw+xm
         z65U/b+klbdENOAxOIoOIkQ7CJ0J5+gu9VyOlOgQjf7rM8qN46JdHiugU1zMGWBbuTPn
         Io0aerc2uo2xAMgfbTf4WXJjB86DxT1IYAsqS4eUMxQcIS6IuSyXAPNveWhUbwtqytrv
         HKxA==
X-Gm-Message-State: AJIora/nqd71+PnswC1zsEzcorVN4MXzLvr05ZMihVg98Pp4HzYjrjQ3
	CYDO5o48EB0ZFNwXdNy8Qg==
X-Google-Smtp-Source: AGRyM1tLIjs7nxXC1NQRkUwRt7fOytxB8Zpe8WQ0YFYZNW0mh8YXnaS8XfnnKx0jdKB9q/EM1AIwzA==
X-Received: by 2002:a05:6638:4685:b0:33f:65bb:3c3c with SMTP id bq5-20020a056638468500b0033f65bb3c3cmr13493423jab.99.1658108608273;
        Sun, 17 Jul 2022 18:43:28 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id f16-20020a05660215d000b0067c05df65aasm1456331iow.15.2022.07.17.18.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 18:43:27 -0700 (PDT)
Received: (nullmailer pid 1667785 invoked by uid 1000);
	Mon, 18 Jul 2022 01:43:21 -0000
From: Rob Herring <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Cc: Tomasz Figa <tfiga@chromium.org>, wenst@chromium.org, devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>, kyrie wu <kyrie.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, maoguang.meng@mediatek.com, xia.jiang@mediatek.com, srv_heupstream@mediatek.com, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, angelogioacchino.delregno@collabora.com, Rob Herring <robh+dt@kernel.org>, Project_Global_Chrome_Upstream_Group@mediatek.com, nicolas.dufresne@collabora.com
In-Reply-To: <20220716093435.29796-2-irui.wang@mediatek.com>
References: <20220716093435.29796-1-irui.wang@mediatek.com> <20220716093435.29796-2-irui.wang@mediatek.com>
Subject: Re: [V11,1/7] dt-bindings: mediatek: Add mediatek, mt8195-jpgenc compatible
Date: Sun, 17 Jul 2022 19:43:21 -0600
Message-Id: <1658108601.900307.1667784.nullmailer@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_184329_019407_20142C0A 
X-CRM114-Status: GOOD (  12.48  )
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

On Sat, 16 Jul 2022 17:34:29 +0800, Irui Wang wrote:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> Add mediatek,mt8195-jpgenc compatible to binding document.
> 
> Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> Signed-off-by: irui wang <irui.wang@mediatek.com>
> 
> ---
>  .../media/mediatek,mt8195-jpegenc.yaml        | 139 ++++++++++++++++++
>  1 file changed, 139 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml:98:5: [warning] wrong indentation: expected 2 but found 4 (indentation)
./Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml:102:9: [error] syntax error: expected <block end>, but found '<scalar>' (syntax)
./Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml:111:17: [warning] wrong indentation: expected 0 but found 16 (indentation)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.example.dts'
Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml:102:9: did not find expected key
make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml:102:9: did not find expected key
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegenc.yaml: ignoring, error parsing file
make: *** [Makefile:1404: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


