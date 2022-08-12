Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C23C00140
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Aug 2022 12:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VDtjYdN7YuCCQGXtkzjt2mpUoG4oHymLw4QsZRtpGcA=; b=tNA22S//2FDmKFXD2KgeLW2pxX
	i196oSr4rqHQEupZ8KyT8yDN/BnxNATyUxqxGhrccTT5QA2qNPlIBFBylalStJkIatgJk4Xx1Zz3k
	180bq7fJ8a/9yUyZZPfoKBLWH6UhjhYnopfGZcZAOE2u4V2rW5sKjXZT2SUY/f5w5CPb76VF7ItmG
	x3yFC1BgbMF9NtmplZWv3kJXaO2sXVPpbOQeWoEsBTMOI9Ho5R474AbhQbNud9fTyzBjH089M1sFT
	B4ddMZmQldVA4lKfwpfj1Lq21fRD6O/A4eY2Kk4sbshdLdZRVLHmyN58fXsQ81oNWrrXESVAzmN8+
	fXUk1AbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMUC7-007Pdu-By; Fri, 12 Aug 2022 12:55:19 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMUC4-007PYA-S9
	for linux-mediatek@lists.infradead.org; Fri, 12 Aug 2022 12:55:18 +0000
Received: by mail-pf1-x434.google.com with SMTP id y141so881519pfb.7
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Aug 2022 05:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=VDtjYdN7YuCCQGXtkzjt2mpUoG4oHymLw4QsZRtpGcA=;
        b=ZtiRlWNWkaU6Z2PXLHlk7ssDMikKDrLfWic9VYlZ2oIT92okEaAuGOPtfI3BG4z/zv
         Y0BULC7cG0h8Uy5jqa0KizQK7v9HJxL3apfawcsDCmR0KeBp8NGeyASaLZ5kpG0pb2O5
         AtIMj9qxIDvTmv/5SnwCqBQZDEZJARqx41RkgRm8iirYcFxLtpQt04GAYEhGRQGyETEd
         0fO7r2QGf5XxFjXa3CiPHlHurY2r6Crf9BhwKZ/5TLQBJQCF8Hgdtk1k5ddLSQraCSfn
         HAFypiKWrrbT969zpXcZEVE5bFC8gFgQQxKMLR7JHIaeUOFe6IPlyZpvs+ITSi4JAWSc
         CxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=VDtjYdN7YuCCQGXtkzjt2mpUoG4oHymLw4QsZRtpGcA=;
        b=s9yJNEgWMkiiJsZNjOarGHqdxCbivuXZJxFJfcTYuVVq2bZ9OdnrrqgqBaBwhodMAj
         TK7VM80590NUkSvxezThuxo6Ap/0QXhkPWaq3+fwRdHkBXf+3XgANI7ecdf5TOVDF6tb
         wqwcLDjIpEUXzo4LM6HbpiTvZGozS6sIkpzj1MYFnLKb130Ku5zlBhaHmofA4NwF+Cjb
         +UgRS+y7Cy9bKmf3o7ETARLqKcVYCAg3bPU03pTjYxYjIq1imEoDVnl00T/RGvPNqCiI
         lwz+PE6uJsyWxm0WK6PhfkiwxR0XWc9ReJDPmhu1l+9sN6Ph3ZizwEfwXgCRxfOatlnz
         h53g==
X-Gm-Message-State: ACgBeo0dNdGP1u76p1i5xZPAJFNIVQGwlRGlZ+wRYyi3bwdYAzYcZ+pA
	TCfWg1ljEtNZevBBCZuDafsHJpRjfIvv9o84KRJ4fw==
X-Google-Smtp-Source: AA6agR6g/ED6xi1uJYMOVfwr91Ky1x6MgRmKOFDBj2xqQ4zFX5QIer8237YskBzHZ2KBjjdKP6b/EXeWMLs7/+N3zLo=
X-Received: by 2002:a05:6a00:1352:b0:52f:bc83:c93e with SMTP id
 k18-20020a056a00135200b0052fbc83c93emr3489635pfu.45.1660308912604; Fri, 12
 Aug 2022 05:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220812092901.6429-1-zhiyong.tao@mediatek.com>
 <20220812092901.6429-2-zhiyong.tao@mediatek.com> <cbe761af-5011-83a2-0509-2b3c4fe0a79c@linaro.org>
 <4a49b619deb5453749a47874377cad6a36a9a054.camel@mediatek.com>
In-Reply-To: <4a49b619deb5453749a47874377cad6a36a9a054.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 12 Aug 2022 15:55:01 +0300
Message-ID: <CAGE=qrohYZ6f9bbEuYfF=2Rz21nbW_8ho3rBQmHt1D+kQG2-jA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] regulator: dt-bindings: mediatek: add mt6366
To: "zhiyong.tao" <zhiyong.tao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_055516_954532_C29DAA5F 
X-CRM114-Status: GOOD (  10.82  )
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
Cc: alexandre.belloni@bootlin.com, allen-kh.cheng@mediatek.com, linux-kernel@vger.kernel.org, macpaul.lin@mediatek.com, lee.jones@linaro.org, hsin-hsiung.wang@mediatek.com, linux-rtc@vger.kernel.org, wen.su@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, sean.wang@mediatek.com, hui.liu@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org, a.zummo@towertech.it, sen.chu@mediatek.com, lgirdwood@gmail.com, broonie@kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 12 Aug 2022 at 15:52, zhiyong.tao <zhiyong.tao@mediatek.com> wrote:
>
> On Fri, 2022-08-12 at 13:55 +0300, Krzysztof Kozlowski wrote:
> > On 12/08/2022 12:29, Zhiyong Tao wrote:
> > > Add mt6366 regulator document
> > >
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: mediatek,mt6366-regulator
> > > +
> > > +  regulators:
> > > +    type: object
> > > +    description: List of regulators and its properties
> > > +
> > > +    patternProperties:
> > > +      "^buck-
> > > v(dram1|core|coresshub|proc11|proc12|gpu|s2|modem|s1)$":
> > > +        type: object
> > > +        $ref: regulator.yaml#
> > > +        unevaluatedProperties: false
> > > +
> > > +      "^ldo-v(dram2|sim1|ibr|rf12|usb|camio|camd|cn18|fe28)$":
> > > +        type: object
> > > +        $ref: regulator.yaml#
> >
> > You miss unevaluatedProperties in most of the places.
>
> Hi Krzysztof,
>    Thanks for your suggestion,
>    Do you mean that all places should have the unevaluatedProperties
> Properties ?

Yes. You put it in some of the places which does not really make sense...

Best regards,
Krzysztof

