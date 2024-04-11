Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D20C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 14:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7n9sPVcJ4cwm7wLdynLPv6UEp0NysnuRVub+rz0c1rc=; b=wenPyb9JpnKYy88vGEc1TVVXXg
	/3T76dtjS9XAy/wAEjlHISbYu8fi8kKG/Dw5QFa98Z9yMrzvmv8QOfNvvXYHhAJoT743geY9mhE1I
	fwcIhrkNXIr0/bOeEz7JeCutuS8V7Nd1jCl/YKxNImqWZABDT+NhK7afagDllmKncb+vYnRdfBrRX
	INVmUAS6h47lf0zdOeEUCXrYvcSDFAKLukEhYX8n2uC5+KxCTTM5XIPLJqZIsWAd7D/JsHKtzEn58
	/oT1SZLv/6W2acnr1jdMiPBUNtAfwFzmUwwlWjsOrMZkuj6oxsDTebDRmBbDJtHXDZEH0i+B8LfiO
	tolvhtBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruvQN-0000000CSMr-1u0U;
	Thu, 11 Apr 2024 14:29:11 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruvQJ-0000000CSKv-1ih8;
	Thu, 11 Apr 2024 14:29:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B6075CE35A9;
	Thu, 11 Apr 2024 14:29:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C86ADC4AF08;
	Thu, 11 Apr 2024 14:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712845744;
	bh=/6/pHHNCDaJr4U1eB4i1Ub63noExMP9hU0/7JXz8Tj0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=o/uY6WlZ9ZusFx/d0QGV7pqL3nqPlWFth84p3CC2B7Wzi083oQb+y2bzn0vSI1hf4
	 MriX6liSPCjmfhdbi24tl/5vH1yJFj4QcejKXVLzhAsYJlbYUOhVI696/NJq8hcSTP
	 TvenZV1IgBebPQSfK6/cO2whrfyVynwaabqpIdc//9OZab9GH5Pog7bhmBvlUs+14Y
	 lsUuGgDEXeC+pv7pmqxdFed+cvwBc5Q7C+TD0KtQjlwO3W99/rLQwmsX9udkuFFJbS
	 RpGnHAJS4qn3+GswMnRdugYUHNU2ncjvmlVHlQ1GeP0D5KQp81oyx5TnmvqJNkFRzA
	 Gd/84fX+fIK0g==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d700beb60bso127219051fa.1;
        Thu, 11 Apr 2024 07:29:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+d9mfi34U4vvCWp7RVKxr8+yu4ad4snlL20F7EoMEx8YYxsRX77uZSepyHXLrUMk1NEhdeheBzcf4XEuaRYayvtB2uAAUFjrLCkiGi3i7V2GTfccBJ9yvGzMbocV16f+UlQ9jpF8o3n52vMgC4fINiGPInwXV+yw=
X-Gm-Message-State: AOJu0YzdAY4wux3WqmFH5R12EBH3k5kKcNTjZK4KZ6FIx41JhHMbvU1F
	F4/H0qsTjuzOjxMz4Xijc4YTr4yTlAmv2TxVkqbMBF1vYotexdafVY8UwBO4T5v6ALi7WGMm+E/
	XxnD6nwvK81mZoEC/8YQLom7NpQ==
X-Google-Smtp-Source: AGHT+IHkxgk8HKIxXpgItwvxPouHfWy0GKfJySBa0JwtLQxB2FzUk/Bj/CMepI9EU70gf7zgbYKm98yjt5ElfnrOemA=
X-Received: by 2002:a2e:9acb:0:b0:2d8:687d:b22 with SMTP id
 p11-20020a2e9acb000000b002d8687d0b22mr5503851ljj.20.1712845742968; Thu, 11
 Apr 2024 07:29:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240402202413.757283-1-robh@kernel.org> <171283980874.2354899.3662943965972729204.b4-ty@kernel.org>
In-Reply-To: <171283980874.2354899.3662943965972729204.b4-ty@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 11 Apr 2024 09:28:49 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL5M0gvjBa7VvRm9B3kRpj8=c6f8k2MnG7LbA-jZstB8A@mail.gmail.com>
Message-ID: <CAL_JsqL5M0gvjBa7VvRm9B3kRpj8=c6f8k2MnG7LbA-jZstB8A@mail.gmail.com>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: syscon: Add missing simple
 syscon compatibles
To: Lee Jones <lee@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_072907_662489_3DF86591 
X-CRM114-Status: GOOD (  11.98  )
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

On Thu, Apr 11, 2024 at 7:50=E2=80=AFAM Lee Jones <lee@kernel.org> wrote:
>
> On Tue, 02 Apr 2024 15:24:11 -0500, Rob Herring wrote:
> > Add various "simple" syscon compatibles which were undocumented or
> > still documented with old text bindings.
> >
> > apm,xgene-csw, apm,xgene-efuse, apm,xgene-mcb, apm,xgene-rb,
> > fsl,ls1088a-reset, marvell,armada-3700-cpu-misc,
> > mediatek,mt2712-pctl-a-syscfg, mediatek,mt6397-pctl-pmic-syscfg, and
> > mediatek,mt8173-pctl-a-syscfg were all undocumented, but are in use
> > already. Remove the old text binding docs for the others.
> >
> > [...]
>
> Applied, thanks!

Note that something is going haywire with b4 or you applied a subset
of a single patch... I really wish b4 didn't change the subjects at
all since Gmail is incapable of following standard threading.

>
> [1/1] dt-bindings: mfd: syscon: Add missing simple syscon compatibles
>       commit: 9f43ae67db2a3d85cf2b5eebc3b54c8891200b5c
>
> --
> Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
>

