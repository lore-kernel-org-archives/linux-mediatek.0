Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D58BC55182
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2026 03:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/NmALyDnaea82VN1dJT9y4h9uKdhWB1U02N76kyw3U=; b=hHGEvfIaGBQcdo/VywICxX5SE1
	Rkb8x4DjW1gG6x/dKzjkWuEpYxeXVYGqywJ+y48tSLgGEAyb7vv/AuJ8ROrXIucKSll/jLbExJkKm
	/StVWnmhHseaTZVBDe3BZIsj0dakEEpNjb/uf28uEcve0iJ7nJBT6jWedVgUKM2mjhBBEC2CwsOwA
	mrZiMIxtJbDarxVmxdNdVRP1oy4h6cfOciMJnEpiRWeJsSdENFTQnEKpMh1KqHqQcSnnQT85LPPN1
	K+c5PM1HkaC46ZV6n6Q6Xofm6eY2foQYdDqkfDllQ03S3nIwUH8oyBKjQOcbYyfAf6Ek4q7dIbjtO
	ATziPXCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrScR-00000003Bkj-15Qb;
	Wed, 05 Aug 2026 03:48:39 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrScN-00000003BiG-157Q
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Aug 2026 03:48:37 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-820100e3504so5849777b3.2
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Aug 2026 20:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785901713; cv=none;
        d=google.com; s=arc-20260327;
        b=AN22oSV40l1wylz6L9EvKFED7whDJbUJw5w3GQlGlLGEidzdm8d3z7wFg1+aMqYLyS
         NqvMs4zohilpElY+obHYcnbMBJDulvbXizaFuchIcLQH1R5Be5APtOKI5T4SvCLdkao5
         wl75MV8t3DRnozAMAU0vPyxN83cmY2uhVWtoPNpagBz17twjNMiSUy8TdcGcVcpIQb+t
         HDPpXLo9e1kX7Le9KSvUwgxNjcSeJ6YF4Y5xfMQ0d6Dy2Z/dwJ/Poiq2WqCUGoxmi5ve
         JHpzRE2/1sn3AhWhwTXE9jRRekxWusCEF6lYNHrrr2RmJVDF27sHdwmrI8bPZRphEeko
         PFVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j/NmALyDnaea82VN1dJT9y4h9uKdhWB1U02N76kyw3U=;
        fh=PTEhSOa1EJDfR0VV7RYbmpO3T/5vNkW19MIC51HUtUo=;
        b=cU3Q+BKn2kJidnA+b02rjI0+KBMbgczBv0aF/0HmRtw/LwOe+lF+kFvSbiE/dLaMRv
         oYPoaQTsfsTgYlNgBdhFHoZ+lZ8CjW3TkKhDSjODPdWXnDSRd/HFQm3Fw1f1tjgIrCZw
         pZZNxDeHqXRLF/IdGckTvpFZRWkyODmGjMB+at3Gf/bcP4VzGZQ9r6puTTdvm7O1C3sj
         1/eQc+UuBM2pAhihcbTkpArCaEx9bBsDWaDG3Z0hk3K0lCFjh1nKUSLKISj2w7v+rusf
         zzCuqsEfdsdjGspzlibBHPGH3Iebb4/QBfrE3iQvkJSOF6lE45RA23epd1spHu/q5G4Q
         c2rA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785901713; x=1786506513; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j/NmALyDnaea82VN1dJT9y4h9uKdhWB1U02N76kyw3U=;
        b=N8uAkXPz0J97Vlj2S6yDIsUFNFYBR0F0DMY+wjAUHHXUAKKitHvBWRTjmO+Ea8UDiI
         i3SahlAFRJZBQIa1cXC2ckVxSOKpvliF7CceUJ4sfr9akHyMwsGeqzx7TVQNrhQYAmQ7
         oddY9ecjd1i543qfYj2u5AhRM5Z7zboVsBTzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785901713; x=1786506513;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j/NmALyDnaea82VN1dJT9y4h9uKdhWB1U02N76kyw3U=;
        b=UTq2UmYF8olmpXP21RQd/0DYsvb6BSJlZ1/Hfv6PYIQoWss5eZq+qHJkZA8PvAY7yf
         MOmQy+tss2L1fYSXBl9laQMQRbrz/lDCPuJMsm0WMMQKMxa+B2pvwkwvOG2w+CKJqCUz
         dpvdTs13CoG3TUhMsdMC3S0WKVTv7Q9xTOJauaxIW+IxXW6P02au0UhngKlswtQcezvM
         Ier0fl76fjaMlpIvrridohuX4fCypHQBpmRvBwiYpNJraghnE2DuPaO97HSQVct58eah
         OnapPCleBcuwfMixmo7nYemLHirXII4/tstO1wqdnFri7Lr1kv89K/UvYMmu0XcflMee
         WeVA==
X-Forwarded-Encrypted: i=1; AHgh+RqHvNtOMNV6q0LTEF/45xs89ItPmdzYWQjhGG7fvjzdU9ozduyYfos0WzkTmWndBNK+61Fs6BNug6ktubmzKg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMDuXGf03rSPy8a/K/0CtVAi1rSv1rnAa+bpAGijYh1md0HMcc
	gPDm9GBk0yDrkS1b3jbN0WeIUKSCLlHWwn6UBxsVqj+E5931Ysz9ufuWpuYgtcRU5TCpei5mmSo
	vvdJaX9MOEaZ9r18zZNzo+ME5T0vPo18g7A/8shSH
X-Gm-Gg: AR+sD13nbtvy/u9myKG/i1jZFmR79CXHGeWfUxA073pjo4CbwFs9hONCKWhT9766OMZ
	zUu1XhzQOqiwhVY5mtfiFvlZrc3kKZd/ku5/B3fVp1bJrSLDMU8TZ5HjKG7dq0AbgxM0att9rut
	yaMmXHWeecuE9my9Q8hsjf2FUAauyN5rDFj12E8hMivBGr89/BJLfZ27PXB7nfJN8OXTOVD5JUR
	7XrpQOKwD2DinwUZ06e5gZB/QoZOT1Iusa9xn+Xx1Y1LrolXFrc+M3aeEQTWPd9D1+Z7lsCRhDe
	f/s3S5nAtNi8U2+nECLmaq01rR32tUJ1bo/lyMzQdAE8JhX1dFlBrW2JrpLU9fFIhZ1riC/XE9w
	=
X-Received: by 2002:a05:690c:9a88:b0:81e:4e5d:484a with SMTP id
 00721157ae682-82022294eb4mr22113487b3.2.1785901713089; Tue, 04 Aug 2026
 20:48:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com>
 <20260714114414.184512-43-angelogioacchino.delregno@collabora.com>
 <CAL_JsqJXpY8jHEgSHcHz4QZTFEZe8PLbO6vbpxWH4qobs0MPyA@mail.gmail.com>
 <f3837531-2949-4741-a23e-387317485c02@collabora.com> <CAL_JsqLVAQ6uhU0fGK_qnOn1x559ErWSJTKkSjr0z791thwD3w@mail.gmail.com>
In-Reply-To: <CAL_JsqLVAQ6uhU0fGK_qnOn1x559ErWSJTKkSjr0z791thwD3w@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 5 Aug 2026 11:48:22 +0800
X-Gm-Features: AUfX_mymFrVaiYOLaCO3AlvD0Um00IkfLaFRQ7IWTs7XOa8ZsYdcyTa8_6zr7HM
Message-ID: <CAGXv+5GeYZ_et3bH9Udf=C3f30-zuM1=Z1meU47RnofG0NL+dQ@mail.gmail.com>
Subject: Re: [PATCH v2 42/46] dt-bindings: display: mediatek: Introduce MT8196
 2D Sharpness Processor
To: Rob Herring <robh@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, chunkuang.hu@kernel.org, 
	p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, justin.yeh@mediatek.com, 
	jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_204835_383649_541C44E8 
X-CRM114-Status: GOOD (  21.27  )
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

On Wed, Aug 5, 2026 at 2:19=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Jul 28, 2026 at 8:49=E2=80=AFAM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > On 7/28/26 15:40, Rob Herring wrote:
> > > On Tue, Jul 14, 2026 at 6:45=E2=80=AFAM AngeloGioacchino Del Regno
> > > <angelogioacchino.delregno@collabora.com> wrote:
> > >>
> > >> Add documentation for the Two-Dimension Sharpness Processor, or
> > >> "TDSHP", found in many MediaTek SoCs including MT8196 and its
> > >> variants.
> > >>
> > >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno=
@collabora.com>
> > >> ---
> > >>   .../mediatek/mediatek,mt8196-tdshp.yaml       | 98 +++++++++++++++=
++++
> > >>   1 file changed, 98 insertions(+)
> > >>   create mode 100644 Documentation/devicetree/bindings/display/media=
tek/mediatek,mt8196-tdshp.yaml
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/display/mediatek/medi=
atek,mt8196-tdshp.yaml b/Documentation/devicetree/bindings/display/mediatek=
/mediatek,mt8196-tdshp.yaml
> > >> new file mode 100644
> > >> index 000000000000..ccd6a8443443
> > >> --- /dev/null
> > >> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mt=
8196-tdshp.yaml
> > >> @@ -0,0 +1,98 @@
> > >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > >> +%YAML 1.2
> > >> +---
> > >> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8196=
-tdshp.yaml#
> > >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > >> +
> > >> +title: MediaTek Display Two-Dimension Sharpness Processor (TDSHP)
> > >> +
> > >> +maintainers:
> > >> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora=
.com>
> > >> +
> > >> +description:
> > >> +  The MediaTek 2D Sharpness Processor (TDSHP) is responsible for pe=
rforming
> > >> +  image sharpness adjustments/enhancements in a display pipeline.
> > >> +  This hardware block supports adjusting the luma and contour 2d hi=
stograms,
> > >> +  frequency weighting, luma-chroma gain and others, with adaptive w=
eights.
> > >> +
> > >> +properties:
> > >> +  compatible:
> > >> +    const: mediatek,mt8196-disp-tdshp
> > >> +
> > >> +  reg:
> > >> +    maxItems: 1
> > >> +
> > >> +  clocks:
> > >> +    maxItems: 1
> > >> +
> > >> +  power-domains:
> > >> +    maxItems: 1
> > >> +
> > >> +  ports:
> > >> +    $ref: /schemas/graph.yaml#/properties/ports
> > >> +
> > >> +    properties:
> > >> +      port@0:
> > >> +        $ref: /schemas/graph.yaml#/properties/port
> > >> +
> > >> +      port@1:
> > >> +        $ref: /schemas/graph.yaml#/properties/port
> > >> +
> > >> +    required:
> > >> +      - port@0
> > >> +      - port@1
> > >> +
> > >> +  trigger-sources:
> > >> +    maxItems: 1
> > >> +
> > >> +required:
> > >> +  - compatible
> > >> +  - reg
> > >> +  - clocks
> > >> +  - clock-names
> > >
> > > This causes a warning.
> > >
> > > Seems this is in linux-next already, but no reviews?
> > >
> > > Rob
> >
> > Wow. No idea how clock-names got into the list of required properties: =
there is
> > only one possible clock, and this doesn't need any clock-names at all.
> >
> > Same for the resizer binding.
> > Sorry for the mistake.
>
> Why is this still in linux-next?

This is in your dt/next branch, applied 13 days ago. Maybe you applied it
by mistake?


ChenYu

