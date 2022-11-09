Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7ADC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Nov 2022 08:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t6EfFhYH21wXCx5kjRB3VR+RjAOXhDuqMYuEWR7pfrc=; b=0+VlXQi5EJ5OL54FqdAcqnD9fK
	JCcoX12Ye5HVttJpq6CaPQHuRhlSNjK0HNcCgKKZ+ZnXg5K7TKw/eBUGahqTdRl/KbK2UFPApp2Vk
	QkemgTOT96Cw8+DXQSNZNR1KZYe3o8ZOrD7OLIVundIEbrXzgAbnIr+uGaPvHAralhdw9Yj4W3/FB
	PKhQhghJ9m9jz6u47PhOKUw+XtAvbHMnZ7ksjuDaujpham6nj3u0p/jQE8p2/AdSIOVl/xaC5VSfi
	Z1L3Z79BkSXzZMYSzK9Mcldh2aiGT7KXfbU1l9ehzZixX3OyPDCGW+DimD53xA0xNdQGxkQblLaK5
	utn5QDhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osglh-00C0ZI-49; Wed, 09 Nov 2022 08:49:09 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osgle-00C0Xv-Ea
	for linux-mediatek@lists.infradead.org; Wed, 09 Nov 2022 08:49:07 +0000
Received: by mail-ej1-x62d.google.com with SMTP id n12so44730050eja.11
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Nov 2022 00:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t6EfFhYH21wXCx5kjRB3VR+RjAOXhDuqMYuEWR7pfrc=;
        b=Nv7TuRYLaRfjIJzC6Ibfw2k09vxMwaZUw45xYAICJVBRgjbKOKg8PUDAQG2g6d8HJi
         t3pRsguCdxuipvLzx/0kRwuRJ/DG4SSvIuzTQHtUAJTnMywRLHL/PXt8UYYTsOB7ALyg
         BQZ9ocCaax4iGoUDpLJ6QXNKRZDL7RVGCaBkwgQwePtVY3amGCcBqLVTItoKRHSgpmQB
         q0PTk8/L3xeNCBKUOFkI3tNolnWCJ7IPG6Drl7RKCIv/3hmqJ9vA5R/rpLgLO6CFazxy
         REOPyLV2fG236cF/HQWDda+X47ZFZ2W6zCDiJnpJOF41PUgxFx680dNyvZLLT7mM12xA
         IkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t6EfFhYH21wXCx5kjRB3VR+RjAOXhDuqMYuEWR7pfrc=;
        b=69W3z+GmIxx1miHZzD/bvzVY2lGfc2rJw4daYYSV00S+2ApijsaimAvl4VtzHVtghy
         Ku6LtAnWZfgDypJP9+UvxWWxKflI1gspSZhieltvxUpj/we+11yjIiIAylnYwB8b7LgV
         HDFxC2g8ciWfDGX72tTYwupku2pECezdy13wIY/h2N9gRGm6W6XdNc1xkSFMsg8R5QXN
         PRhNvY31g3nrU2FwWys4yLmvymKiWGXu3Icz2kK8aiwMD+23E4w8vM9Wsy3rVGW8ot8d
         GEElsEyO+Saw8gb24/zUqoTxZIUvhTFoGM6X64wD6ajJc5rGbZhdeKBlYc3hW6g45K55
         cZXA==
X-Gm-Message-State: ACrzQf1YFvHPCsk6ToBnuF3TllpUqzemnjqhNLdLSk7VfL74Gsyq2bFK
	siz+uleK6a1XvoA4mhrO1Mgd+6NFarreuxo9ynVN7Q==
X-Google-Smtp-Source: AMsMyM7nxsdRqbV99dDWXx3gc/r8zrl4uOIAkQi5rHuFSGiwieq/RYyQHXEPHnWl7E/GjBRB/NOZh8cH3d+9Df2IBdQ=
X-Received: by 2002:a17:907:c1e:b0:7ae:31a0:571e with SMTP id
 ga30-20020a1709070c1e00b007ae31a0571emr24200210ejc.690.1667983745034; Wed, 09
 Nov 2022 00:49:05 -0800 (PST)
MIME-Version: 1.0
References: <20221105084905.9596-1-linux@fw-web.de> <20221105084905.9596-2-linux@fw-web.de>
 <166765939131.4158830.8416727494529058690.robh@kernel.org>
 <trinity-c732b826-2a12-4ab1-aaac-294ac5524926-1667660774779@3c-app-gmx-bap26>
 <CACRpkdZsP-aj6hcD2sOB8ypVqdxwC8dWOo0d52qnDpxppUwNAA@mail.gmail.com> <6752A6BE-3750-4195-821A-917205F59258@public-files.de>
In-Reply-To: <6752A6BE-3750-4195-821A-917205F59258@public-files.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Nov 2022 09:48:53 +0100
Message-ID: <CACRpkda+yxwUhPSZ1EFHJJRFONKW63caBb_X1qPVVKxSA+QNhg@mail.gmail.com>
Subject: Re: Re: [PATCH v1 1/4] dt-bindings: pinctrl: mt7986: add generic
 bias-pull* support
To: frank-w@public-files.de
Cc: Rob Herring <robh@kernel.org>, Frank Wunderlich <linux@fw-web.de>, Sam Shih <sam.shih@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Sean Wang <sean.wang@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_004906_546529_6B556B4D 
X-CRM114-Status: GOOD (  13.26  )
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

On Wed, Nov 9, 2022 at 9:46 AM Frank Wunderlich <frank-w@public-files.de> wrote:
> Am 9. November 2022 09:38:03 MEZ schrieb Linus Walleij <linus.walleij@linaro.org>:
> >On Sat, Nov 5, 2022 at 4:06 PM Frank Wunderlich <frank-w@public-files.de> wrote:
> >
>
> >That patch in turn says it needs another patch first.
> >
> >Now I am utterly confused, it is really hard to follow these trains
> >of patches depending on and breaking each other left and right...
> >
> >Can you please tell me which patches I need to apply and
> >in which order?
>
> Sorry, picked the wrong link. Put all pinctrl patches together into this series to make it easier to follow (but v2 because v1 was for changing only mmc pinctrl and to have no conflicts or "broken" commits):
>
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=692462

Thanks I figured it out I think, even managed to apply it now!

Yours,
Linus Walleij

