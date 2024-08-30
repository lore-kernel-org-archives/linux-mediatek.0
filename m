Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0FBCA0EFC
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 09:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFoJ8uGU6Wt+2B+a3U8PT9o5qr4L6h8Nf/lLSdsGyCQ=; b=3z9OiKdbDAmfJYdoycJ3TSxB/N
	NLvMi0xLk7tESdRY5fsTvMIFvQ1Yojm/dDwktkGHbDZVKOrC95fGivLmNAMXi8xk3udiZT4Y9LY9Z
	AcXQwTzTI0bHrzJLd+CSiqpQy01pJDjUbT6PWCFQgW7k4QklA2lBIqdzXGGlxdvnvqf5wda9jhZTL
	7XUXqufWt4C8DO5+1NtYn2ZQ7kI/ZviCc4x2RWRTWMLucTiFK4sMJxPfq7WK2eq3gfjxiOsnNHpoS
	e4jcMPa4J6TiwidicR6Nc26RE+q+FppscK3R8JNMPUOZ29431lnT4MeP/fHxX654xwyrMtfRv9n8e
	5nvZo1Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjyCp-00000005cqv-2kFx;
	Fri, 30 Aug 2024 09:46:11 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjxDR-00000005P7Y-2RRs
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Aug 2024 08:42:47 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5de8b17db8dso886966eaf.2
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Aug 2024 01:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725007364; x=1725612164; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFoJ8uGU6Wt+2B+a3U8PT9o5qr4L6h8Nf/lLSdsGyCQ=;
        b=o9tB5QPR/lt9OYuTSVuoRfqsNuZoLpDlghZSwbdOS/w2m6cnvcCCZ+L9GtQpID6pxm
         gAi3uAQjnVcSaY7aogsT1ehuCO5Am7gdfX8b9FzwUr5NkB7MON2xuy5f+f57F60ZLwCG
         vWjLIqRVrITBtJ16hVQkqpnQ3+V+gdPd69ohOd6aCMFg+93cYBB0I0NAPfWDnLu/2NWZ
         7k+Q/rjZA6SV4+5a6GDO2Eg3qPPzyChDMkT7cY58i6Es9OdhhQk0ssb9dtX2mzoLd8DD
         ApB9cIqvKc2gJwcMGzqvEavfeh4UsCOC1vK5/ShxTWlg6X+U3rkIFmMhW8+WwLx3q8xu
         5laQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725007364; x=1725612164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hFoJ8uGU6Wt+2B+a3U8PT9o5qr4L6h8Nf/lLSdsGyCQ=;
        b=gNUAtIuJmu/kRuUMztikgrAYoElBRsSmH3P5kQTnmU0oIuEdWo4HVWoxZgMDR68p9A
         p3bqERQKA5XVaW+NgeQGdAJh5Sk3lrmqraQZAcgQuS0XACHPrsPe2A/BLc8JdONr1yGX
         6RJ4bl2iG9HQxynQoTM+ANbdD8GJbnTGPx4H2eMap84uK54AaHf7iNLO//Wqw418Vos9
         SVPOHfNrz1Oq4ElFELjCQph8oCApnpSIzus884yAOWO9H3UPi0NEmEELW2ZNaot9pRku
         r8vbda7wsWbAKqFqPuWY1h+GXxsYRCJqlSBuLpyW3rouyTRzfxl1299Pq8838YcF8/8C
         glBw==
X-Forwarded-Encrypted: i=1; AJvYcCWT7pUzow3zH9xhGTBqTkEJo+f4BswkdZIKRZW3hhEiF3icsdnYxhZhzEK7WwlqCwc6PRcInMDcWAmLL1tszA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkgUBttsCyuyQIvY4bnGNu1X+9QHvd7xzEgK2xGHhyDf9ZD3yx
	pLYiDCkvRtaHS3aM2o/zMDTzv+diBf2FTVFxcDmy/ccVhiBzCqJuHMjDg9i4q/vU0UWtDMMFIv9
	mcZ/j/12+88xfZ0rZu94eTI6A+Dh77Rciox8ZAg==
X-Google-Smtp-Source: AGHT+IHBEq2kXBcob7OwHZwxMgPl68xRTiaqYdA20dFyB6L5ns13TYFSRrWJQJLVdlnc+h48Q+Hs/qXBirYHpgAHAeU=
X-Received: by 2002:a05:6820:2216:b0:5d6:ae6:a852 with SMTP id
 006d021491bc7-5dfacf28289mr1998086eaf.6.1725007364035; Fri, 30 Aug 2024
 01:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
 <20240830070351.2855919-4-jens.wiklander@linaro.org> <3bqb6mktkvbdl6h4eekad4mpjhyvzx7mjidhnanboygbwu2asz@6ros56bp6isd>
In-Reply-To: <3bqb6mktkvbdl6h4eekad4mpjhyvzx7mjidhnanboygbwu2asz@6ros56bp6isd>
From: Jens Wiklander <jens.wiklander@linaro.org>
Date: Fri, 30 Aug 2024 10:42:32 +0200
Message-ID: <CAHUa44Fd-Eo5-CUfxDgCFpRVbJP0gzA7LX_-5=cBfBd8NxhpDw@mail.gmail.com>
Subject: Re: [RFC PATCH 3/4] dt-bindings: reserved-memory: add linaro,restricted-heap
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, op-tee@lists.trustedfirmware.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Olivier Masse <olivier.masse@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Yong Wu <yong.wu@mediatek.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Sumit Garg <sumit.garg@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_014245_670845_A69C9A7C 
X-CRM114-Status: GOOD (  23.85  )
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

On Fri, Aug 30, 2024 at 10:20=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On Fri, Aug 30, 2024 at 09:03:50AM +0200, Jens Wiklander wrote:
> > From: Olivier Masse <olivier.masse@nxp.com>
> >
> > DMABUF reserved memory definition for OP-TEE secure data path feature.
> >
> > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
> > ---
> >  .../linaro,restricted-heap.yaml               | 56 +++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/reserved-memory/l=
inaro,restricted-heap.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/reserved-memory/linaro,r=
estricted-heap.yaml b/Documentation/devicetree/bindings/reserved-memory/lin=
aro,restricted-heap.yaml
> > new file mode 100644
> > index 000000000000..0ab87cf02775
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/reserved-memory/linaro,restrict=
ed-heap.yaml
> > @@ -0,0 +1,56 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/reserved-memory/linaro,restricted-h=
eap.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Linaro Secure DMABUF Heap
> > +
> > +maintainers:
> > +  - Olivier Masse <olivier.masse@nxp.com>
> > +
> > +description:
> > +  Linaro OP-TEE firmware needs a reserved memory for the
> > +  Secure Data Path feature (aka SDP).
> > +  The purpose is to provide a restricted memory heap which allow
> > +  the normal world OS (REE) to allocate/free restricted buffers.
> > +  The TEE is reponsible for protecting the SDP memory buffers.
> > +  TEE Trusted Application can access restricted memory references
> > +  provided as parameters (DMABUF file descriptor).
>
> And what is the difference from regular reserved memory? Why it cannot
> be used?

Good question. I need a compatible =3D "linaro,restricted-heap" to find
it, but it appears that's permitted with regular reserved memory.
Let's drop this patch. Thanks for pointing me in the right direction.

>
> > +
> > +allOf:
> > +  - $ref: "reserved-memory.yaml"
>
> It does not look like you tested the bindings, at least after quick
> look. Please run  (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> Maybe you need to update your dtschema and yamllint.

You're right, sorry.

>
> > +
> > +properties:
> > +  compatible:
> > +    const: linaro,restricted-heap
> > +
> > +  reg:
> > +    description:
> > +      Region of memory reserved for OP-TEE SDP feature
> > +
> > +  no-map:
> > +    $ref: /schemas/types.yaml#/definitions/flag
> > +    description:
> > +      Avoid creating a virtual mapping of the region as part of the OS=
'
> > +      standard mapping of system memory.
> > +
> > +unevaluatedProperties: false
>
> This goes after "required:" block.

OK

>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - no-map
> > +
> > +examples:
> > +  - |
> > +  reserved-memory {
> > +    #address-cells =3D <2>;
> > +    #size-cells =3D <2>;
> > +
> > +    sdp@3e800000 {
> > +      compatible =3D "linaro,restricted-heap";
> > +      no-map;
> > +      reg =3D <0 0x3E800000 0 0x00400000>;
>
> lowercase hex
>

OK


Thanks,
Jens

> Best regards,
> Krzysztof
>

