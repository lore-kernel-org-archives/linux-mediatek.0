Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65744C072A2
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 08:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZJKMDimG5VHPHHKbAgU+T5U75qsS9Rx3Q6Jk4ns1Nh8=; b=Sw4rcFCLPwItmg
	p6vMiJL7kpTqieaQCpHO4ESE7fNK/Y7qkRXhWx/0N8WI/Ye14Qggxi7XI76YWc9MuW/NoGxd1jwXA
	YZ7RE/TpZOB4CNG/ygYKrqNR0kDwdmKGCN+DyKPgf92qsf5D+iHh2pNhIYodoPa2M43AVL084pGH0
	OgBvb3OxUzlXmTCzGwXwU7MYsm0oae0ipMGcMkV6JPwA/Z/eSs87DRlNM4qIGL/rSxLd9uri8dTI+
	XYBLYoA0rM6DKnzDjxiNznzdlx+BnOyN/a19mIkxYKBkrrAEBOis7c3Q5wEgrSX0Tzo6uNaEEXFPq
	6yGRl/jf3ixw+Wq+Wpgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5iIQ-0010qX-1B;
	Wed, 22 Nov 2023 08:09:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5iIM-0010p4-1N;
	Wed, 22 Nov 2023 08:09:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EDB69616BE;
	Wed, 22 Nov 2023 08:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EEE3C433C9;
	Wed, 22 Nov 2023 08:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700640552;
	bh=PHQsh6F5XvgFUnaiWxcwLwUn3OBKs5yGFFQ41WrpYbs=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=nbJ2SK6lwZUEu6ZnwTSH+Oa/pBWa+sX/Htt/x2OReGd8JoH8z85C27DzRYTHJBlVi
	 3wDe3x5yRyGX5qAMhcpfKXHDb9VRNeNThxVKhdlyx1h9TbC6wosV8PHWzu2uTL/7Am
	 ZWlKfb6oi0Cn+Ic/KuwFQalQJhUOwrmMosWHgVwHC2Cz6C0mqCCOKTxXIRm3FodZqc
	 a5DVliVMdZJxlKjgLRaCcUtozoEbeFe5NuT8tHE9n86xS+d7H2vfDsWjbaRg0Z56Vf
	 5KU1r/sIqOWweRJ36Zhtl3j2xC4aB6yAvdaF7pTTjplwjMbpiRtNuVc7wneOEmh45p
	 iqsEGA8VNAjSA==
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-280260db156so5180675a91.2;
        Wed, 22 Nov 2023 00:09:12 -0800 (PST)
X-Gm-Message-State: AOJu0YylkX95xjkLekYFllA7Lru+c/zogQiQpYcEDQ1GVxvGqImMzx73
	znmWRqA9m3vJVhymKMirT1SdDxwvt9ddSdNDj70=
X-Google-Smtp-Source: AGHT+IEr9UvTFqYZYbRvMse6NIITfqbwjuUq1G6lDkVVXaxwMJVX1684jPAX+uFy+o0fSjl0iAD8WjSqBj6oqY9ODoU=
X-Received: by 2002:a17:90b:1d92:b0:27f:ecd9:6d0e with SMTP id
 pf18-20020a17090b1d9200b0027fecd96d0emr1639810pjb.34.1700640552241; Wed, 22
 Nov 2023 00:09:12 -0800 (PST)
MIME-Version: 1.0
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
 <6b288a2e-d147-4bd3-b1d4-daf56295d939@gmail.com> <01f9ce3b-e6e5-4b05-bf7f-0b3a5f74910a@linaro.org>
In-Reply-To: <01f9ce3b-e6e5-4b05-bf7f-0b3a5f74910a@linaro.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 22 Nov 2023 16:09:00 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Vf5dDwq=KTrxwc=+w+0KUD2KVPMjmHg68Y_yukES5dQ@mail.gmail.com>
Message-ID: <CAGb2v64Vf5dDwq=KTrxwc=+w+0KUD2KVPMjmHg68Y_yukES5dQ@mail.gmail.com>
Subject: Re: [PATCH v2] docs: dt-bindings: add DTS Coding Style document
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>, 
	Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michal Simek <michal.simek@amd.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_000914_573529_5821F954 
X-CRM114-Status: GOOD (  26.66  )
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
Reply-To: wens@kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Nov 22, 2023 at 4:05=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 21/11/2023 14:50, Rafa=C5=82 Mi=C5=82ecki wrote:
> >> +Order of Nodes
> >> +--------------
> >> +
> >> +1. Nodes within any bus, thus using unit addresses for children, shal=
l be
> >> +   ordered incrementally by unit address.
> >> +   Alternatively for some sub-architectures, nodes of the same type c=
an be
> >> +   grouped together (e.g. all I2C controllers one after another even =
if this
> >> +   breaks unit address ordering).
> >> +
> >> +2. Nodes without unit addresses should be ordered alpha-numerically b=
y the node
> >> +   name.  For a few types of nodes, they can be ordered by the main p=
roperty
> >> +   (e.g. pin configuration states ordered by value of "pins" property=
).
> >> +
> >> +3. When extending nodes in the board DTS via &label, the entries shou=
ld be
> >> +   ordered alpha-numerically.
> >
> > Just an idea. Would that make (more) sense to make &label-like entries
> > match order of nodes in included .dts(i)?
> >
> > Adventages:
> > 1. We keep unit address incremental order that is unlikely to change
> >
> > Disadventages:
> > 1. More difficult to verify
>
> Rob also proposed this and I believe above disadvantage here is crucial.
> If you add new SoC with board DTS you are fine. But if you add only new
> board, the order of entries look random in the diff hunk. Reviewer must
> open SoC DTSI to be able to review the patch with board DTS.
>
> If review is tricky and we do not have tool to perform it automatically,
> I am sure submissions will have disordered board DTS.
>
> >
> >
> >> +Example::
> >> +
> >> +    // SoC DTSI
> >> +
> >> +    / {
> >> +            cpus {
> >> +                    // ...
> >> +            };
> >> +
> >> +            psci {
> >> +                    // ...
> >> +            };
> >> +
> >> +            soc@ {
> >> +                    dma: dma-controller@10000 {
> >> +                            // ...
> >> +                    };
> >> +
> >> +                    clk: clock-controller@80000 {
> >> +                            // ...
> >> +                    };
> >> +            };
> >> +    };
> >> +
> >> +    // Board DTS
> >> +
> >> +    &clk {
> >> +            // ...
> >> +    };
> >> +
> >> +    &dma {
> >> +            // ...
> >> +    };
> >> +
> >> +
> >> +Order of Properties in Device Node
> >> +----------------------------------
> >> +
> >> +Following order of properties in device nodes is preferred:
> >> +
> >> +1. compatible
> >> +2. reg
> >> +3. ranges
> >> +4. Standard/common properties (defined by common bindings, e.g. witho=
ut
> >> +   vendor-prefixes)
> >> +5. Vendor-specific properties
> >> +6. status (if applicable)
> >> +7. Child nodes, where each node is preceded with a blank line
> >> +
> >> +The "status" property is by default "okay", thus it can be omitted.
> >
> > I think it would really help to include position of #address-cells and
> > #size-cells here. In some files I saw them above "compatible" that seem=
s
> > unintuitive. Some prefer putting them at end which I think makes sense
> > as they affect children nodes.
> >
> > Whatever you choose it'd be just nice to have things consistent.
>
> This is a standard/common property, thus it goes to (4) above.

It's probably a mix, but AFAIK a lot of the device trees in tree have
#*-cells after "status". In some cases they are added in the board
.dts files, not the chip/module .dtsi files.

+1 that it makes sense at the end as they affect child nodes.

ChenYu

