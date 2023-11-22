Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FB8C61D9B
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 14:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DohKjEGbANqOIwtlp0thtS5jfJs3ErxUnipdG2SdgrA=; b=icWJhJ/rxbE/Z3uxuavKdhX7Ag
	sUfGmE7yRENzdihB453l7Vl4pVSXczR6/Cip0CeZnPqmuYYjW+cJ4cJOI+JQ6YqG90eigZN6UdjuR
	LX7ffvk13TzaHIj7QfBe0ISv/3F2UXGy0jptdIRF2vutpCBN9JflEgkjjjGsi1UXRnaFBVIuEBb3V
	CpYIS84x3QUuEY72a9Vyw18CpscUh2dLCJsdzr3q/H1CjpaqKUor2xI/1SxU1vo/enw0Wj6Svbkmi
	BbWusF17lcSF0FjBNLjG5gtX9VKpKHMc/bA+62jb3Euk4/nXCfGqkstrWVJd6KapLlyefgPA6/5gY
	CuI0oJXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5oe5-0029qv-1d;
	Wed, 22 Nov 2023 14:56:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5oe2-0029q5-0e;
	Wed, 22 Nov 2023 14:56:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7098B61E1E;
	Wed, 22 Nov 2023 14:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 202DEC433C8;
	Wed, 22 Nov 2023 14:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700664961;
	bh=KtNL8iqiwxX+GpchCheqctmEAkNmwKSHMEBfjYdIYfA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jMWFROHsemWBLYudu+R0KFIYjkxN+OYS38HYbkxT6hliS5CGuPtvyqBwurcxMxfnQ
	 /iN3YL36okDmIdjncXf6CWKc4rf8O5RV02aYb9qWyDrKmqvqm/vNIu3HkhuWeT/byG
	 gMFBvzQQ6JD+1VBQrIuZOTTBeZZ/pdLn6QIYXb/xDRVedL3Nk2GeL9oQ/FJUpiPx4c
	 NTAbUbdzD3N8IaaRzLSzjZMsx/fmb+z9cl6/NGCBsjj2C+2oWU0F1q6PRSkc4Xgm+C
	 RTVI4Py6HBGOEj3GlcUX2Dd9p6BnVMRypZVEJ82an8lWtodpAFFeQ5Pw7rxk9TlwFk
	 WARyK/6iZiACw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50797cf5b69so9432926e87.2;
        Wed, 22 Nov 2023 06:56:01 -0800 (PST)
X-Gm-Message-State: AOJu0YybLIqXcFMQqqvMT8E2PVIXlu02d8LaEXZEe51faT9YL3obqxVT
	RjrN56dnVtyiaQfgkAYg1g3kucVc4FZAEYp5zg==
X-Google-Smtp-Source: AGHT+IEDtzsjOwck99QtWT4cq2cTvv6FyJkSzHZICZds9G5M/6EfSs1GNZZ86r1YlxgmzIe8zoQcthvqAgxSHpLL35E=
X-Received: by 2002:ac2:5e8d:0:b0:500:b63f:4db3 with SMTP id
 b13-20020ac25e8d000000b00500b63f4db3mr1826037lfq.35.1700664959349; Wed, 22
 Nov 2023 06:55:59 -0800 (PST)
MIME-Version: 1.0
References: <20231120084044.23838-1-krzysztof.kozlowski@linaro.org>
 <6b288a2e-d147-4bd3-b1d4-daf56295d939@gmail.com> <01f9ce3b-e6e5-4b05-bf7f-0b3a5f74910a@linaro.org>
In-Reply-To: <01f9ce3b-e6e5-4b05-bf7f-0b3a5f74910a@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 22 Nov 2023 07:55:46 -0700
X-Gmail-Original-Message-ID: <CAL_JsqL_caP2Adh5ntrHb24sXOY9x=TxvCSnnSCq--rm3B0FoA@mail.gmail.com>
Message-ID: <CAL_JsqL_caP2Adh5ntrHb24sXOY9x=TxvCSnnSCq--rm3B0FoA@mail.gmail.com>
Subject: Re: [PATCH v2] docs: dt-bindings: add DTS Coding Style document
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
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
X-CRM114-CacheID: sfid-20231122_065602_347161_3E726DC0 
X-CRM114-Status: GOOD (  20.15  )
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

On Wed, Nov 22, 2023 at 1:05=E2=80=AFAM Krzysztof Kozlowski
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

I'm certainly in favor of only (or mostly?) specifying things we can
check with tools. I don't need more to check manually...

It wouldn't be too hard to get path from labels. dtc generates that
with -@ already. So I don't buy "we don't have a tool" if a tool to
check seems feasible.

Rob

