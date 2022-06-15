Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB55C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 13:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VaDlzhe/4P2Kqx2Bwnrxn27JBdo5H/KOFM+Hot3AAmE=; b=C2p8ePE1nZSW+A71peV1C+dL68
	LnUQ2YI46OYgGHUnc+qZhDcftSeeoT2h9Ocxr9vIbQu9M/9CvGPDOJ1RC3jWhQL3se+krA+fDI962
	44LvEje5Ew6jsxQYvvlj/2YVBPIcVMLacdWtlt+pNdOclH69ofmVLM5E/67GVJ+5isDyfmvIrI4Qf
	ahHf30oCZq5lExsTpyxv1CNO1dV4NAj5qz5ZffPpsv/HgzoTLQXkePnOjo5trSkKK6fCKPyjHRvZP
	PxjJdWGN5FVlx2MG9KgR7+c8kWnCq3Z3zrH9ybSXMoYlOL+wmDrDi3LQA10qyPSDnG3DD3WqREVVo
	+EMquoVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1T76-00Eibf-OA; Wed, 15 Jun 2022 13:31:16 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1T73-00EiZw-Hy
	for linux-mediatek@lists.infradead.org; Wed, 15 Jun 2022 13:31:15 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-31756c8143aso12626997b3.12
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jun 2022 06:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=VaDlzhe/4P2Kqx2Bwnrxn27JBdo5H/KOFM+Hot3AAmE=;
        b=VjGtmxbDwO5KvtVwDsx0byMAEpIZJFQyb1385NLVlSIaOVXqE4BRBKo0Q+CB1K6clR
         osZqtBgQQ8vtGi+c0v87jnfzT4gXOLYWe5IeLTNQzsEjRjWgU/37rSGtmIIP5/g5pZ2E
         lRlL/CzFxL41AeCMnOPafpbPqgLCEOtcuVtvIwqP0YPBmvflkjGDMv2YXNFYCqNmizpP
         MobXUKMIkpAVxy3trUAjZTIH+cU/LOqCng4dHafCdu9rFFkLByjosnAeyfeNtJtAcOIZ
         49svvBvQUZS1pKEfKA2X8TKUMQsmlN4k+URgZm5RgfnljyrQO5mKlPbajY+LqYncEtnj
         JxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=VaDlzhe/4P2Kqx2Bwnrxn27JBdo5H/KOFM+Hot3AAmE=;
        b=DYoYIlFQBOusHMt8g445RrUwZkesAIDRdHbOCG34B7bAxfy7fzxlSNwmhtyxa3oCBC
         I7n+cUHvK3qSgL8/KXi0lMj+uEKvhzF9D3ZuVVNAYOMviSWrTo1f+ZLAVLX0hbkM+vaT
         y9MAaN5TZyL8nyC5To0LLNdxFtusB9fUpYP2YIhUkfwi502xOxuJ0Prj+DekZPPKzSNs
         cwfTlD8a3JQWbxYQU2VBP6TZpWULg72PLIdyIqaRth1+9C87NeY8QCa9hEgyTq/sNEJU
         UF+dr+9B4o5oFN/hE/EJLDZOXsZisyOkpyn9/8vhv6c7HDSTldJPFUjIYQWX0l4XyItT
         m0bQ==
X-Gm-Message-State: AJIora8zIJ2H/ZmKzQLpv1UY8D1aLeLzrsTtTG19tkKQrh7uleWom2RS
	rZmYZN4Iwsnov3WLeHH0ywWkbiIWL+Uv70fHe2zjEg==
X-Google-Smtp-Source: AGRyM1uhDAk/ild2A1mNKUqVV7KIjDeNtFQGXSjhxjTW8mxcpzZcCXEnXrU9MrIb4NLDnIGXlsp+0mACPztyzwGZO9I=
X-Received: by 2002:a81:6807:0:b0:313:35ba:79da with SMTP id
 d7-20020a816807000000b0031335ba79damr11666091ywc.268.1655299871601; Wed, 15
 Jun 2022 06:31:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220531221954.160036-1-nfraprado@collabora.com>
In-Reply-To: <20220531221954.160036-1-nfraprado@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 15 Jun 2022 15:31:00 +0200
Message-ID: <CACRpkdYe=qhUvyCw-xKRUihWiaezaEyQdHFhPt2aD6bmkWTpBw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] MT8192 pinctrl properties adjustments
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_063113_695587_C2B97B84 
X-CRM114-Status: GOOD (  11.71  )
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

On Wed, Jun 1, 2022 at 12:19 AM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:

> The two patches in this series substitute properties in the mt8192
> pinctrl dt-binding for ones which have a clearer meaning and are more
> standardized. At this point there's no DT using the mt8192 pinctrl
> binding, so if such changes are to be made, they need to happen now.
>
> v1: https://lore.kernel.org/linux-mediatek/20220525155714.1837360-1-nfrap=
rado@collabora.com/
>
> Changes in v2:
> - Dropped Fixes tags
> - Added 'if' blocks to enforce mutual exclusion of properties

This does not apply on the current pinctrl devel branch:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/lo=
g/?h=3Ddevel

Could you please rebase onto my branch and resend as v3?

Yours,
Linus Walleij

