Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E90C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 07:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIPSowxS+reJzRoxTsLwnerZZES7Q1Va8iysVO72+iE=; b=rkViMVF+f63iHTKRSjuONdXMdq
	9QfWk7EuzH3DWPSLJkp5VgS4BFxfcMHk02G0+2JBHHxrViYtiRe9Muh3kB/p5JQcGFpOnsKQ2wcKD
	aazKrq9AHWFo7mh152WL2yxkNxyVnN4RuDt5iYgguajS9fAaCv2FAHLRmvygnXOi7WrU2MPXZHMci
	s+DCY3EHiBEhJykqUeaKippz4nG79hJ287ray3fNXfCto+0Dj5BhhpQ6+wSlKkPyxtxFJKTY/h3Ob
	PsqmzBXYUVS36Dy+j+lyrw+/VTLK/b8iFBLAkdbegm+ImADRlbTeAcWfWYpNL8be7CvGOub+H7N4E
	hVsNKmuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Gzt-000lW1-0B;
	Tue, 07 Nov 2023 07:59:41 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0Gzp-000lVJ-0F
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Nov 2023 07:59:38 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-5a92782615dso65517177b3.2
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Nov 2023 23:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699343971; x=1699948771; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jIPSowxS+reJzRoxTsLwnerZZES7Q1Va8iysVO72+iE=;
        b=PQqa3Czuoq9neWQUNZF6/dE3JA08GX4xF+TkeeW+RqN7QXFwDfHTuzVW3+5c3dm/If
         ATNmeI47peSymKAldwoVRfJ9htbtN1MGlwuPnXiAjgs2uDSZCcDIx5C3YkalyT1u026z
         yK2UayqPAkgENfddjajmZVwTUZ6c+U1zJ/upQL8jaOOBovzpZkmxvw5FYtB3tz9gXYEC
         XsjopPcPSOt/5MFxOO//JmGTrV43eNaSPAP907iAefG9Kahd4e3RK9oDU2FlJs7X7nGA
         vpViaxHhTMIjfT3gfSbvGjoQSCNlfiZ69gyob/djvwXS3MWCTvin6Lvc9ZsM80AjR831
         NvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699343971; x=1699948771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jIPSowxS+reJzRoxTsLwnerZZES7Q1Va8iysVO72+iE=;
        b=N0jJYXiN5vHTdDilRvKL0TDC8lT9lRnNXB1LoRvIxhZIMnrPUEWTiMkbdyHr4FRaFA
         PQNbMHSzdjG7PlwEkwNeSVh5o4kKQbd/MMRSTTu3vESETRUGr8ABeQEp1yoy2vwPIu7o
         pjSXDL16djMv59uL2f9VrIYAKP5ZkJRql7IhaQhBaHHsru/27w/iJkadzO3PvtuMHub0
         FIccgfQnvxZa1vxXGlwlzRI530adbkzN/ORferL2HrU062Zw+4strk3chW7vfpQN731f
         v+ZAB7wuXsLJYF1BoxnII8WaDLHeocGGgmiqj5c1WlSkRZtTJRdjIQdc5Px9zmq1fEDa
         f0HA==
X-Gm-Message-State: AOJu0YxkgBnCIdMXUid1ELojIfT4yzGYw1QCj1k5uE70OV6lEWdFJr/j
	5Ad1YGcP9I5CKkuxxD0v+oDOI5HUAeSRh5VXbAD6Lw==
X-Google-Smtp-Source: AGHT+IEvolbqmV38AXkJ7n/FhA/W/IaFIDg+Pp103Px7QjwcM7CIQWMmkvleXTos1KRDla6s/o6p0T9DybRO342zTVc=
X-Received: by 2002:a25:738d:0:b0:d9a:e947:447b with SMTP id
 o135-20020a25738d000000b00d9ae947447bmr29843950ybc.14.1699343970479; Mon, 06
 Nov 2023 23:59:30 -0800 (PST)
MIME-Version: 1.0
References: <20231107031442.2768765-1-zhourui@huaqin.corp-partner.google.com>
 <20231107031442.2768765-2-zhourui@huaqin.corp-partner.google.com> <8a1f5d6e-3753-4ff5-94a6-dee7925b902b@linaro.org>
In-Reply-To: <8a1f5d6e-3753-4ff5-94a6-dee7925b902b@linaro.org>
From: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
Date: Tue, 7 Nov 2023 15:59:19 +0800
Message-ID: <CABRjgzstdYKDCBDiD=ciwmP2X3CJ4PnDN7dLFF-F4yOVR6ex-g@mail.gmail.com>
Subject: Re: [v1 1/3] ASoC: dt-bindings: mt8188-mt6359: add es8326 support
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	angelogioacchino.delregno@collabora.com, perex@perex.cz, 
	allen-kh.cheng@mediatek.com, kuninori.morimoto.gx@renesas.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_235937_135676_30A80E22 
X-CRM114-Status: GOOD (  14.69  )
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

Thank you very much for your reminder, I will pay attention next time.


On Tue, Nov 7, 2023 at 3:11=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 07/11/2023 04:14, Rui Zhou wrote:
> > Add compatible string "mediatek,mt8188-es8326" to support new board
> > with es8326 codec.
>
> Please use standard email subjects, so with the PATCH keyword in the
> title. `git format-patch` helps here to create proper versioned patches.
> Another useful tool is b4. Skipping the PATCH keyword makes filtering of
> emails more difficult thus making the review process less convenient.
>
> >
> > Signed-off-by: Rui Zhou <zhourui@huaqin.corp-partner.google.com>
> > ---
> >  .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml        | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt=
6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.=
yaml
> > index 4c8c95057ef7..9df5e44176d0 100644
> > --- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.ya=
ml
> > +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.ya=
ml
> > @@ -18,6 +18,7 @@ properties:
> >        - mediatek,mt8188-mt6359-evb
> >        - mediatek,mt8188-nau8825
> >        - mediatek,mt8188-rt5682s
> > +      - mediatek,mt8188-es8326
>
> Entries should be sorted alphabetically.
>
> Best regards,
> Krzysztof
>

