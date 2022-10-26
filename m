Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596BBC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Oct 2022 11:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oZbe2wun9Nqu6qN8s5Py+mfA179UedFb0/HlEHAJWEc=; b=ptZjMxeDQkMOCN
	CL+aHBGeJDMZBRx+8BHDIBPb8zQbKk6ZymQ0Zp6ezSbmv7t3/IieXjGxebkaIrykuc40lmmOgXdSt
	JOHzDvYetxPwVcBZBTKjXepDt71Q0dr+Eo/GCstVv2Y5uqvuCfOOFdSe0vDsU8U/nPjgOc2ePRnai
	3rvt/TWMGH4uHzZBvGv0YbGlgJMPQIPNUi2e1IaTXLpGdmxBSsSYsU1TtJzLJltREL6rHF0s9NqHc
	hVD94dxgDGPplJp29KF78sfidZ+Mo5lJpknqLyqHQH+ktYYyYx9y/QuzRonlcj7k6GBk26fNhwcZx
	uN/u4ajPkZ4is0EdJm1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oneYT-0092Mz-Nd; Wed, 26 Oct 2022 11:26:41 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oneYE-0092IT-Vg
	for linux-mediatek@lists.infradead.org; Wed, 26 Oct 2022 11:26:28 +0000
Received: by mail-pf1-x42c.google.com with SMTP id g16so9510538pfr.12
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Oct 2022 04:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZbe2wun9Nqu6qN8s5Py+mfA179UedFb0/HlEHAJWEc=;
        b=EY5krOyeSYND3rduuFqwBBQ44JAqBopN5Xu5jOFIsv72ahGrxHHLp1MfYafE9C5vgw
         Q3p5dav+LMO9R/ySL7vNZ4zI0AYd1T1YefdjQieSumzAu4KFvD99qresxYYsmm6oIBCU
         ONpuS5z+0RqbiV1Y5SmSGUv8rBAZhY+ot9DkugNM4FXhamq9ccaxjldh3r78a4ld1/K1
         63eaAIhTys4cxp+77j/ZUGx+8Uztt19FFFLmRNaWyoxgboxJUvx+mjgJQR6ZJsqBBfWL
         /GJC9d/VZ8pClzR9BYoWXiXTv/HdVZkyyXDNEe5AS83M9CdKT3LxG97BHA0Jcu+YYG8u
         oNYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZbe2wun9Nqu6qN8s5Py+mfA179UedFb0/HlEHAJWEc=;
        b=wTyJGyKK3g2mYgBHkr6LNhEU4+gEfNzdaFZ0Fp8eJ7UhuWngL6NgdmFOqouXOqrBEc
         3GQ/i1F34iTRp9LhgyTva3rnykfdd9XODIVbKkzXRbIxDT3zzPzXL1GpiMJXLvuI4le8
         gU4sdWDZMANVzKIOYTvRhpm9cks50SV4xHBily2WA8Z6H1e0ifRtuv/sYpUoAyEKzgkU
         En71zZ3soup5Z7Bpf8OdQWfJD4ORExE3+FgOIIAZk/BkI70yHyH/k4hBWOtFInHPzchq
         MdhdpQUkmO8mdMgcwuJAUM9kqESKEKJkWV9xQ8JnoR8Fpx8qi83xIpmIaqClm/D0Q469
         3o7w==
X-Gm-Message-State: ACrzQf1kuvI0ptDD2/xO/8cMxc8G9kKMrzQHo3y/HVCpJ9eo+z+n/Myl
	jEX/DRqL61H4sqiPhPx56cH8ugmi47q7xzStk6fFBQ==
X-Google-Smtp-Source: AMsMyM4MAUEdyO44glc1foFoVeqTE3QX++as8FdjLMcBxQeUfsJYaBq3EgRucpKQzyGQqRc80yatWSut0rZNtR0Sc1g=
X-Received: by 2002:a63:90c4:0:b0:45f:c571:67eb with SMTP id
 a187-20020a6390c4000000b0045fc57167ebmr35995880pge.541.1666783584883; Wed, 26
 Oct 2022 04:26:24 -0700 (PDT)
MIME-Version: 1.0
References: <20221025132953.81286-1-linux@fw-web.de>
In-Reply-To: <20221025132953.81286-1-linux@fw-web.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 26 Oct 2022 13:25:48 +0200
Message-ID: <CAPDyKFriLmsSsy5LfiJJH-s7uQMD1AycE7R4NtN1_Td3XocyOQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] Add mmc-support for mt7986
To: Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_042627_040869_66632785 
X-CRM114-Status: GOOD (  20.00  )
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
Cc: devicetree@vger.kernel.org, Wenbin Mei <wenbin.mei@mediatek.com>, Sam Shih <Sam.Shih@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 25 Oct 2022 at 15:29, Frank Wunderlich <linux@fw-web.de> wrote:
>
> From: Frank Wunderlich <frank-w@public-files.de>
>
> I've noticed the mtk-sd binding needs a bit more work get into a more
> clean state.
>
> There are 2 properties missing that maybe need to be added later or
> dropped from devicetrees:
> drv-type (which is used in mt8183-kukui.dtsi and set to <2>)
> and
> r_smpl (used in mt7622-rfb1.dts and mt7622-bananapi-bpi-r64.dts, both
> times set to <1>)
>
> i don't know their function and boundaries and i do not find them in
> driver. I guess they are added by accident, so i removing them in the
> patches 5+6.
>
> v2:
> - add compatible based binding
> v3:
> - solve "not" statement in binding and reorder if statements,drop mt8183
> - added patches removing invalid properties (not in driver)
> v4:
> - squashed part 1 (compatible) and 3 (SoC specific clock config)
> - new mt7986 clock bindings based on info from mtk
> - re-add mt8183 reg boundary
> v5:
> - add fixes-tags to Patches 4+5 and reviewed-by to 6
> - drop quotes from mt7986 clock-names from patch 2
>
> Frank Wunderlich (3):
>   arm64: dts: mediatek: mt2712e: swap last 2 clocks to match binding
>   arm64: dts: mt8183: drop drv-type from mmc-node
>   arm64: dts: mt7622: drop r_smpl property from mmc node
>
> N=C3=ADcolas F. R. A. Prado (1):
>   dt-bindings: mmc: mtk-sd: Set clocks based on compatible
>
> Sam Shih (2):
>   dt-bindings: mmc: Add support for Mediatek MT7986
>   mmc: mediatek: add support for MT7986 SoC
>
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 149 ++++++++++++++----
>  arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |   6 +-
>  .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  |   1 -
>  arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts  |   1 -
>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   1 -
>  drivers/mmc/host/mtk-sd.c                     |  14 ++
>  6 files changed, 136 insertions(+), 36 deletions(-)

I have dropped the earlier two patches I have applied for MT7986 and
applied patch1, 2 and 6 from this series instead, thanks!

Kind regards
Uffe

