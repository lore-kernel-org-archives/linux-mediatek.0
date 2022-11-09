Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23CEC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 08:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0zbHYyI3ZOuc2iT4mRqGhJVf4w/uy1L6RiWzNixdzw=; b=ZH81HCAZAVx3S2MhVi+6tqEyt8
	LKCzZEVh2W5vI2pb6onRuO2nStDXV76913Y+vwBPjer20kwI59p8dquAJ75Hzt552lBOQTGIwBCjq
	qS61g6/nF/cbujbFlN1dzeqhbuYVd2I8O1Tkx7xU1FwrKRgiqJZCg7FFWUaIwOoV0LNtoUK9InGHD
	XwlROnlluH5JIOaz1naL4Svr5tR5P40EOfIZOUoqNO308tKnCJg4ZY9+kaYAwCfZK8ARKYoV+vc6F
	Fa+IUQbQEXJAMLejd0Asmi4Q1YfPID468AHqPazB61N9Dh2edHe7G9vzukhJ70IBbm/812nXCOygE
	ba9eDriA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osgbE-00Bvx4-6l; Wed, 09 Nov 2022 08:38:20 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osgbB-00BvtP-H1
	for linux-mediatek@lists.infradead.org; Wed, 09 Nov 2022 08:38:18 +0000
Received: by mail-ej1-x62d.google.com with SMTP id kt23so44708414ejc.7
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Nov 2022 00:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d0zbHYyI3ZOuc2iT4mRqGhJVf4w/uy1L6RiWzNixdzw=;
        b=QrtU63vqfuqIUrQ3kqQMZWDy6vEsvVjHcjlVfUpLrx71617/qp3+ZFH8CMJSjf68RY
         +RjQ58WQwSFw0FwaLRDMYCnnUNRozzE1/YVI4NobW/pkJwjJrMZQUTeYGBYzcotESyh5
         Ca08RMViWNc+ira8id0Qjg8IFx0Wt0Dr57vyJg+7TnxtJT+pRkAxFZ2FlfGCgH7M8ZlU
         ZqnjqMfpGNIudoOGIWluVanbb0krGGvBJjacfqUWHAdhQZinTFyWsu55WLCWb5QTOQ4t
         RscWB9DKYT8v1QIgs6rT63do3pmbdmfk6+Kpc3Dn4RZWK5wrAkFAdE1L6jq5rmAtS2Ra
         3Utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0zbHYyI3ZOuc2iT4mRqGhJVf4w/uy1L6RiWzNixdzw=;
        b=D1YsQuFBxEmYfpjIo1CCgtG/nOKHpCE0bjXtdJOKdoSryVkCFXzb8zq+qL98FiQ03R
         nmu7lCCO3oEEBkLgIblyZ7rE0ZDO2UK2TrELI9++Y60WZT4YuN/JvDCZHLbRdW0FtixP
         l2r3TwwuYuF5biDtakHHz3xDTHGgd6WBOndsuljnThN/7RDc8QUCVbYW9mkqFKA0V8Ry
         9/wzmwtgpUpaAYCd9Da50LPnNcmAPlCln7IMiqilgxEsi+1ZGuA3NVTtZCbFRkAr+tGu
         B9P+DHpDnwh+omldI8oZUKYQYDm219+jYQz85ajcLdbEyrjyDe+3QCmj3BZVDekahJkc
         QDtg==
X-Gm-Message-State: ACrzQf0KG6k9m+vs3PQR9SWYUYQ8khh79pP+XmZfcu9tIAfBFAeCvYko
	5MNLcBN6VscPQb/oBKlMb/w/OzLsS0n2DWTWR6YN7Q==
X-Google-Smtp-Source: AMsMyM791qMulyNHY+wAqFSetNq8SvPUdo/dK2HW5kOtjxO8R3MbKqGDnl96Qe5xE0gDRsx6zbRmaL1YlM970Fgq/bI=
X-Received: by 2002:a17:907:c1e:b0:7ae:31a0:571e with SMTP id
 ga30-20020a1709070c1e00b007ae31a0571emr24177907ejc.690.1667983094822; Wed, 09
 Nov 2022 00:38:14 -0800 (PST)
MIME-Version: 1.0
References: <20221105084905.9596-1-linux@fw-web.de> <20221105084905.9596-2-linux@fw-web.de>
 <166765939131.4158830.8416727494529058690.robh@kernel.org> <trinity-c732b826-2a12-4ab1-aaac-294ac5524926-1667660774779@3c-app-gmx-bap26>
In-Reply-To: <trinity-c732b826-2a12-4ab1-aaac-294ac5524926-1667660774779@3c-app-gmx-bap26>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Nov 2022 09:38:03 +0100
Message-ID: <CACRpkdZsP-aj6hcD2sOB8ypVqdxwC8dWOo0d52qnDpxppUwNAA@mail.gmail.com>
Subject: Re: Re: [PATCH v1 1/4] dt-bindings: pinctrl: mt7986: add generic
 bias-pull* support
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Rob Herring <robh@kernel.org>, Frank Wunderlich <linux@fw-web.de>, Sam Shih <sam.shih@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Sean Wang <sean.wang@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_003817_588843_D6EED2A1 
X-CRM114-Status: GOOD (  10.39  )
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

On Sat, Nov 5, 2022 at 4:06 PM Frank Wunderlich <frank-w@public-files.de> wrote:

> > Gesendet: Samstag, 05. November 2022 um 15:52 Uhr
> > Von: "Rob Herring" <robh@kernel.org>
>
> > yamllint warnings/errors:
> >
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.example.dtb: pinctrl@1001f000: mmc0-pins:mux:groups:0: 'emmc_51' is not one of ['emmc', 'emmc_rst']
> >       From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
>
> this is already solved by this Patch:
>
> https://patchwork.kernel.org/project/linux-mediatek/patch/20221105092500.12145-1-linux@fw-web.de/
>
> i decided to send a v3 or if instead of including it into this series

That patch in turn says it needs another patch first.

Now I am utterly confused, it is really hard to follow these trains
of patches depending on and breaking each other left and right...

Can you please tell me which patches I need to apply and
in which order?

Yours,
Linus Walleij

