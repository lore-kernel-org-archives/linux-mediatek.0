Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CF4C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 08:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jgKw+Gh28HJpy0lOLg2VuN1GbSzQApQ/IwdWYvuR8jc=; b=ZWl+WebHmX/36h2b1qYrxaGO1Y
	6sEIV/r41auUDXw1p3nyPNlw4MKiPHGfHKgSzeGnTnAsXY3L1L3VplKwWeHPaqIIDN1X45/dNDxH3
	XLHg+3pwDrKJoTwOwZQu/Wj7SM6CvO3z2u/s7ASvOlUtqRcZGkI1HZZFssUTK2Kz9DSuq+yjrJyM1
	gjf3IJo2COerLRlcxMom3IhQHld/I08cdGt8SE5gTSkSZZ2WR96xh6JD1KibjdrTM1Zp4XbRY+j7E
	BqFhhTOesk6qr5zTOZLzsmieCcaDqco3nK9u9wZSWB7/6mMGRkbTts2TSx4YoN3gVoiy80jCbxXmQ
	HNokfsuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osgkr-00C0Hi-3r; Wed, 09 Nov 2022 08:48:17 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osgkj-00C0Bo-8Q
	for linux-mediatek@lists.infradead.org; Wed, 09 Nov 2022 08:48:10 +0000
Received: by mail-ed1-x52c.google.com with SMTP id a67so26127678edf.12
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Nov 2022 00:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jgKw+Gh28HJpy0lOLg2VuN1GbSzQApQ/IwdWYvuR8jc=;
        b=sQTRYJ/yi+sjBa5mWm8+48njabEHftow78Vc2hvDFKSRNfgxhj4XHmCZu9G/DTuOuQ
         DQ8TVkL3J+i2xGZhkZOT8jFGS7uRl5d3ojLBScdxVOPXBjNG25XY+N1sU0ctSK3qq+z0
         sDPr4j4+CctAxiwDtsIvv5bz/6dii0MPmkODbiF997PIUDoYCeK4zpGT07TU1toufbL1
         jn2DcS2fw4v70fGnjol0kcmXjOPLnN3KwwOIDQUHus+BHWr1EZuz+pePsoaleUcE8B14
         Ik6RPnZcbKVXmy+XPbAEMZQ9wxLKflPKUpNfBGyzEkKnPjIKS665N1M+/xvuiTUGUH/u
         A2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgKw+Gh28HJpy0lOLg2VuN1GbSzQApQ/IwdWYvuR8jc=;
        b=3Py6IVUAOy0Cp/ISfD5WwfTcMLPC6uJwJVzPH6ax+r2peAn2LslkdWOohPU6L28Ads
         9UVuX1BgYtGIZeT/kQJaBoiPMxpszaytgdUbqpWMEBA+ZZDAcJhbAB2jQHt7iz6LUOx/
         AqLW4HVRFDTRSEdVOqbgIL2sf147zMrHVt5X5/nGtniPFaWQFgduJfdNVGqgkCX231be
         jFvWs8+2ynVeqijZuECN7jeO3BGOWNPgFx4laZOgflSGZNGGJ9B9DCmbYgmSZ0eUxit3
         GJQ1+io/XqD5hg4K02LcLkEYtTzM67iYyiJCaR9UKZmeAY1XaBHVG+mGTwXCnbqFmRFv
         H13Q==
X-Gm-Message-State: ACrzQf3W9+37aIFtBPEtJ4SoO1D6lifbinkOkHBPn70OcW/cYyfbPe/e
	1vxFLl+NFyeKRMh52ca9bbwNez9esb8PL0LzR2bT5w==
X-Google-Smtp-Source: AMsMyM66HMeRmiFNje6X1hfW+hyz2r0uhBi6Gv73jHX8UHIxvtNoaoS0yeuG7bndaaSvkLkoHDD5JCKCirUHEp1hUe0=
X-Received: by 2002:a05:6402:d0b:b0:458:a244:4e99 with SMTP id
 eb11-20020a0564020d0b00b00458a2444e99mr59337467edb.46.1667983683311; Wed, 09
 Nov 2022 00:48:03 -0800 (PST)
MIME-Version: 1.0
References: <20221106080114.7426-1-linux@fw-web.de>
In-Reply-To: <20221106080114.7426-1-linux@fw-web.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Nov 2022 09:47:51 +0100
Message-ID: <CACRpkdY87GBYCK0RCD89aZT8Pg5ihTpUK=GXvSf5eD0Xj2psmA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] update mediatek MT7986 pinctrl driver
To: Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_004809_329562_4E9EE88A 
X-CRM114-Status: GOOD (  13.32  )
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
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Nov 6, 2022 at 9:01 AM Frank Wunderlich <linux@fw-web.de> wrote:

> From: Frank Wunderlich <frank-w@public-files.de>
>
> This patch series introduces common bias-pull* pinconf support to MediaTek
> MT7986 pinctrl driver and fix some register offsets in the driver.
>
> v2:
> - added patches previously postes separately which are needed to have
>   dt binding checks clean
> - fixed odd numbers in comments for mt7986_pull_type

Oh OK thanks for collecting the stuff I need, I applied this series,
I had to use some fuzz on patch 5/6 due to other patches I have
applied so please check the result once I push it out.

Yours,
Linus Walleij

