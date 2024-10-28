Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409B2D13596
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2024 11:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IdHIuXNcRTp7WeqJ7Dz3GAtmBDa+RGbotWoT8FSQELk=; b=4tHDJ0/BVKXI28YOaoA2GH7Mju
	nw65nDYWaAf/xLbUsWbpqExuueu6mMixrJrwJqpNIwYVqV+rBhIE+3B1klNlfN26svhkbvjh36pcQ
	YYRDe9vyi9D1MAQZH5ma+7UhO/uc39lIaSFSeyD58e42IS5eM6co95BivMNp8bvWwaBqlYKdtjqhK
	GnqxVNG5PeG1dn8FY0EoO2MOYZ5kb0Tm5eK4fvyyZZVtp1DcuMu7fsDotLLXut7vCq1tjqK2VSKic
	dXME/X3ZoecjO0OCmHRypSNpVson4UChGVqj2SO9pOWNbqZlCq19ngRnFQQ9SS5KEOoRaADbpXfJD
	HhQk86SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Nkn-0000000AYNW-1NHl;
	Mon, 28 Oct 2024 11:17:45 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Ngq-0000000AXSb-3l5N
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Oct 2024 11:13:52 +0000
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-4a47177cf6bso1425782137.3
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Oct 2024 04:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730114019; x=1730718819; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IdHIuXNcRTp7WeqJ7Dz3GAtmBDa+RGbotWoT8FSQELk=;
        b=QfSokwgtjYgpj3XpB8I3AFbOHS7AxUxMa8zaYLCtFU33pNvY2A2vrQztUsxQzHkStg
         3z5D81AKIayFqjzmlKnhpPfuc+UpsQnt2gAvSm5zOwpPC56RM+3+f+QkWoLRtHn3bsEN
         LwRRfzpaGkbcE2uQyQNCbHyqfAAqByf4rmE0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730114019; x=1730718819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IdHIuXNcRTp7WeqJ7Dz3GAtmBDa+RGbotWoT8FSQELk=;
        b=oQWfcM9EePJBOTrtFqqvh9RIZMvKE7S8CweZT5qiOdnTHN7GaoDtVnZ5mx29xEqIbq
         9gKe3YkF1x5KhkQshCHwPJ/n1tx9UqDJaVZKxiFJgPlop2I4LemnIPmRZh7CyCfNM+s8
         KnXm4LP1o19MCgoZkDMlqMB8i8OraVghIOApFCku4ChSP9R9fcq8nwiiCFEwg1tyuFoi
         OWKm+Ml23e552FQlzgwQtLWAo2p3R/2t6ZtrND1ZQ40n++O/5voS0GbiHOAssFoOwHam
         yrPCwW+RI0Mbjwx5K7DPzHxrrr/xwlhrP+UMJO8ZLsfWYglcaeu+gswPeh/5n6MN0hwI
         RpPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVL22GBo6uEaAM1ZgpOc7q4djeItYYfvpEY6sKB5g9NIXV2OTVQsJdTb/PBQ0NdlY2Zi68PcWsgm9U6TyqhhA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe6t5et35NsUaI6hUbKkWGW40s0aiWSPEgnLSi0G58aQQWQxm2
	u6cT81bdTCIsuxYThPOw1OiiN0VPLmtAZ8JKmBNLxKhIstWScJqxA5bVFXe+Y7Mdop9wVm5rdho
	=
X-Google-Smtp-Source: AGHT+IEe5hpz+ZcUKe+pY+IQRUiiJid6LM+5ACFn6AlSQgzjVDrsybaVg0rtj540qPOoqFeFQTTrsg==
X-Received: by 2002:a05:6102:160b:b0:4a3:d7ef:40c8 with SMTP id ada2fe7eead31-4a8cfb15671mr5098754137.1.1730114018710;
        Mon, 28 Oct 2024 04:13:38 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85580b3b0desm886598241.39.2024.10.28.04.13.36
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 04:13:37 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5101c527611so489864e0c.3
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Oct 2024 04:13:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUsrs548obzz5k82EszvJkm5aZM3zEce+qV0wofHf9OUd+WeKbAoCzEn/Ql0XSlVnMLdpZfBxVhFsYVoUXJ1w==@lists.infradead.org
X-Received: by 2002:a05:6122:1786:b0:509:e278:c28a with SMTP id
 71dfb90a1353d-5101504d301mr4253732e0c.7.1730114015383; Mon, 28 Oct 2024
 04:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <20241025104548.1220076-1-fshao@chromium.org> <20241025104548.1220076-3-fshao@chromium.org>
 <j5qw52grlce63mccduvryx467h4hvcnqrxrova74d52izq3g5r@wjiflssmq6a5>
In-Reply-To: <j5qw52grlce63mccduvryx467h4hvcnqrxrova74d52izq3g5r@wjiflssmq6a5>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 28 Oct 2024 19:12:59 +0800
X-Gmail-Original-Message-ID: <CAC=S1ni-F_oudNyskSbxS1s2gZG7m4U4+nLxt0=dt5+DDkhV4Q@mail.gmail.com>
Message-ID: <CAC=S1ni-F_oudNyskSbxS1s2gZG7m4U4+nLxt0=dt5+DDkhV4Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: mediatek,mt8188-mt6359: Update DAI
 link node pattern
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Rob Herring <robh@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_041340_990999_CC78D55D 
X-CRM114-Status: GOOD (  30.96  )
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

On Mon, Oct 28, 2024 at 4:56=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Oct 25, 2024 at 06:44:42PM +0800, Fei Shao wrote:
> > The associated machine driver is not dependent on the format of DAI lin=
k
> > node names. This means we are allowed to use more descriptive names
> > instead of indices without impacting functionality.
> >
> > Update the binding to accept arbitrary DAI link names with a "-dai-link=
"
> > suffix. This is the common pattern used by the target (MT8188) and othe=
r
> > (MT8195, MT8186 etc.) MediaTek-based Chromebooks.
>
> We do not want arbitrary names. Why for example green-batman-dai-link
> should be correct? The existing pattern looks wrong. Please read DT spec
> and chapter about recommended names.

At first I was thinking about regex like
`^[a-z-]+(-[a-z]+)*-dai-link$` based on the DTS coding style guide,
but your example is not suggesting that.
and the name like "hs-capture-dai-link" was rejected, so it's not just
about enumerating the names either.
Or "^dai-link@[0-9a-f]+$"? But they don't tie to particular register
addresses... or just for some pseudo indices?
I could miss something about DAI links under the sound documentation.
Still trying to figure it out.

>
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > ---
> >
> >  .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml     | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt=
6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.=
yaml
> > index 701cedfa38d2..2da34b66818f 100644
> > --- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.ya=
ml
> > +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.ya=
ml
> > @@ -40,7 +40,7 @@ properties:
> >        name defined in the machine driver.
> >
> >  patternProperties:
> > -  "^dai-link-[0-9]+$":
> > +  ".*-dai-link$":
>
> This breaks existing users.

There's no existing users in upstream, and the only downstream user is
the MT8188 Chromebook DT that I'm trying to upstream, which I can fix.
This binding was upstreamed exclusively for that DT.
Even if we take a step back and assume someone has another DT already
following this pattern (and that would be a surprise), this wouldn't
break anything except a dtbs_check error, which would be trivial if
they don't run that or attempt upstreaming. The driver doesn't use
node names to distinguish DAI links.
I want to fix this pattern before any actual users are in the tree if
possible, but I'm also fine to stick with dai-link-0 to dai-link-10 in
the case that nothing is changed and the DT has to follow the existing
patterns.

Regards,
Fei

>
> >      type: object
> >      description:
> >        Container for dai-link level properties and CODEC sub-nodes.
> > @@ -112,7 +112,7 @@ examples:
> >              "Headphone", "Headphone L",
> >              "Headphone", "Headphone R",
> >              "AIN1", "Headset Mic";
> > -        dai-link-0 {
> > +        hdmi-dai-link {
>
> No. Not really justified.
>
> Best regards,
> Krzysztof
>

