Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D965DC5ACB2
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Nov 2023 23:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oek2kHOiJKwuGradh8KZUYYGEhpdoKxKkCGLT/Ex0Qs=; b=iMDqKWk6LV0xCaFiGbhzNViFSD
	yNV9+YEDJ9WUpEViDOD0mdk20Ln24V5vwGoPlJqSIp/TEAfgdzbI+fcoa5UzcGf+SrfyQUDezh5+F
	Q1SLzaGzc4n8hjy35HbDgYadgQftkuWORntlJTvqFdrPa2NhxJlTuzemGYlzGlUn8kVBbzcLLM8Ib
	L2L2XErT6kk0Ytas82dlLz4DzSbn2bhuIMo5lBvoI1VfLM/sm6j0QRQesjJbSu50T6wrBx5HULDNN
	ui1lyyHVXXxKNVDWwc6HbdJbGeg+E4YD7SwxXpDdUqVckSQAm8Kxlo+L04yQaHKgkPdv59DamuFeW
	GTXEp2Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3PPp-001zgD-1w;
	Wed, 15 Nov 2023 23:35:25 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3PPm-001zev-0O
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Nov 2023 23:35:23 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1cc30de471dso63445ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Nov 2023 15:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700091321; x=1700696121; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oek2kHOiJKwuGradh8KZUYYGEhpdoKxKkCGLT/Ex0Qs=;
        b=cacDgvJOUlbyFgcOBUE4O1gQNqOJvn4AImokVC7QZYKmfmnvhiV9NFCiFZDb7izo6m
         5PvZ93ybzOP1Q4Qdse5TTTCp3o+X5rUUUEFz6SMvqNPXFonDAnTXrLYj8d4mrZtcd5lk
         RiJBjwV5UkkTj19RtG6xZieohrlvRGm7Beddl8Pso97I4XcfKg7IKqkk8h+lwpVm6CLZ
         7qVq3K34V0j9yoxc2wsgTKs+tBHVHNN3Vdc9zVBTXlEdsnNmNUrXEspTLddFWjJC2Clw
         C2BMBW1KeKayX76wRjDv03SsY3q9mqdZHjoLw0GLFTR9O6Y2s6/9ahVE8SEuwh7f2s4Z
         jscg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700091321; x=1700696121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oek2kHOiJKwuGradh8KZUYYGEhpdoKxKkCGLT/Ex0Qs=;
        b=I3x4Od7uPhQiqbMb+nhnpM8nutrm+iSd0oGprxYxK/mVA2YZB/v8c+AcQPb1gvW59n
         CvV9B/UI0iA3dba4qDpMC3G2OSgV0f1zTm8i9gzXgUtNfQnzqGo3ZM0M05s0g2rZaEZx
         1ZqP3KSljPXtP97vl7XdbEV+41wkIy1yr9DUMXQfykfSQOrZSNVt10R+eMwu4ZLDogY7
         aN8TOtra60upoghrDZQxylE+ppHF+nU5PRetEC83/ctPkHjDzDRFgjVdags/FyMww2xg
         nIs6X8drcmb6YDbXGEoc/7syZNHuSZ1wQjGTAjwp+Ap4ZrsPA3veOF7EQGALzk4UQfcn
         jfjA==
X-Gm-Message-State: AOJu0Yw1VY3ni5oWUk3Zkm4A8dXM/qyCXk259HlI8K+VUhH0yPJBtfyx
	SZyyKLGsl4PFasWTcVdVpJN1NCrjObWYhUY4yEC/
X-Google-Smtp-Source: AGHT+IGz9f/SLu5mPtYfVW8CPrScTnMxwCAhNmSPfXNU6OOHTiFkG39zGsXsGPkZucRS05i+dhBhg89vqZQYyDxclRo=
X-Received: by 2002:a17:902:f684:b0:1cd:fbc7:271f with SMTP id
 l4-20020a170902f68400b001cdfbc7271fmr66903plg.20.1700091320785; Wed, 15 Nov
 2023 15:35:20 -0800 (PST)
MIME-Version: 1.0
References: <20231111111559.8218-1-yong.wu@mediatek.com> <20231111111559.8218-7-yong.wu@mediatek.com>
 <0ccee72f-98ac-4a08-9253-9c22dad4d95a@linaro.org> <5d7b2458b8d1896ce575f4ed2d413f4e8eeb92b4.camel@mediatek.com>
 <3daaa2aa-61d4-40db-b36d-cd825a340d2b@arm.com>
In-Reply-To: <3daaa2aa-61d4-40db-b36d-cd825a340d2b@arm.com>
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Wed, 15 Nov 2023 15:35:09 -0800
Message-ID: <CA+ddPcM5CuiOs+JGGBtn7ea1vzwHvawyApa_wRcGWNLD=yrrnw@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] dt-bindings: reserved-memory: Add secure CMA
 reserved memory range
To: Robin Murphy <robin.murphy@arm.com>
Cc: =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"christian.koenig@amd.com" <christian.koenig@amd.com>, 
	"krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, 
	"sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"jstultz@google.com" <jstultz@google.com>, "nicolas@ndufresne.ca" <nicolas@ndufresne.ca>, 
	"linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	=?UTF-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?= <Jianjiao.Zeng@mediatek.com>, 
	=?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>, 
	"quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>, 
	"ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>, 
	"benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>, 
	"tjmercier@google.com" <tjmercier@google.com>, 
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"joakim.bech@linaro.org" <joakim.bech@linaro.org>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_153522_184035_8C423BD7 
X-CRM114-Status: GOOD (  19.09  )
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

May I suggest the following for the device tree binding? (I'm not very
familiar w/ device trees, so apologies for any oversights, but trying
to process the feedback here and help move Mediatek along). This
should align with my other suggestions for having an MTK specific
portion to their secure heap implementation; which also means there
should be an MTK specific device tree binding.

# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
%YAML 1.2
---
$id: http://devicetree.org/schemas/reserved-memory/mediatek,dynamic-secure-=
region.yaml#
$schema: http://devicetree.org/meta-schemas/core.yaml#

title: Mediatek Dynamic Reserved Region

description:
  A memory region that can dynamically transition as a whole between
secure and non-secure states. This memory will be protected by OP-TEE
when allocations are active and unprotected otherwise.

maintainers:
  - Yong Wu <yong.wu@mediatek.com>

allOf:
  - $ref: reserved-memory.yaml

properties:
  compatible:
    const: mediatek,dynamic-secure-region

required:
  - compatible
  - reg
  - reusable

unevaluatedProperties: false

examples:
  - |

    reserved-memory {
        #address-cells =3D <1>;
        #size-cells =3D <1>;
        ranges;

        reserved-memory@80000000 {
            compatible =3D "mediatek,dynamic-secure-region";
            reusable;
            reg =3D <0x80000000 0x18000000>;
        };
    };

On Tue, Nov 14, 2023 at 5:18=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 13/11/2023 6:37 am, Yong Wu (=E5=90=B4=E5=8B=87) wrote:
> [...]
> >>> +properties:
> >>> +  compatible:
> >>> +    const: secure_cma_region
> >>
> >> Still wrong compatible. Look at other bindings - there is nowhere
> >> underscore. Look at other reserved memory bindings especially.
> >>
> >> Also, CMA is a Linux thingy, so either not suitable for bindings at
> >> all,
> >> or you need Linux specific compatible. I don't quite get why do you
> >> evennot
> >> put CMA there - adding Linux specific stuff will get obvious
> >> pushback...
> >
> > Thanks. I will change to: secure-region. Is this ok?
>
> No, the previous discussion went off in entirely the wrong direction. To
> reiterate, the point of the binding is not to describe the expected
> usage of the thing nor the general concept of the thing, but to describe
> the actual thing itself. There are any number of different ways software
> may interact with a "secure region", so that is meaningless as a
> compatible. It needs to describe *this* secure memory interface offered
> by *this* TEE, so that software knows that to use it requires making
> those particular SiP calls with that particular UUID etc.
>
> Thanks,
> Robin.

