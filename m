Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBA99C61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 16:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xsOJXGLbfzP71TUh7HGZHmnH27it70kEg3aQ8dGEbAY=; b=VAhjp/Ro4+SRnjgKkGJunx4eTW
	4jjmDirWkeipVshjrgFmIJmVZxlpLaQJkRK8VCRV7wGWfJNYSTx4qFdmbfFjdzfm/DuUAxhCS3KLJ
	yqTbZs28LhBvABxJRCmH/7/mSfUCYq2cENzTpLxjHEiZOoJieY1UC6NZkPMwNqvB25QPMJASYTOWu
	DBF8wUSJj+W+io8GPu5bzzA3xkrEq2eUgmTPJagikWIMC9g2D4FpHfyS+/7vqqTDH/fSVjqsYf3Uj
	VvTxi7wN10M5sKC6jZKnpeBjEcki9M0xiD95JkX6R+xw7P1hjvZDkL+RbzVGFhobupe1hzpFd31pv
	iAkwv/EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNybQ-002s7w-Lc; Fri, 03 Feb 2023 16:07:52 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNybE-002s43-85; Fri, 03 Feb 2023 16:07:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BB63861F82;
	Fri,  3 Feb 2023 16:07:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A323C433A0;
	Fri,  3 Feb 2023 16:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675440459;
	bh=zKmjPVFEtNDSBXoOI9UXflM0Sd030QsBid++FCTj9a8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KCZFCV0l0H/S8DfZ12ZyuwUPpalMdOIG4AQnLd51yD76Q1ONGjslziezKEteefy5J
	 baLG7VSVB92tcZvq3dvulixb2uBE3HK1OKHEOeA9MeGq70fY/dhGdTQ4LI1PCeHtka
	 +qslJuriyAOi7B6Yxx0fDk9Ae27ItNvamV5bKoAIea26TgXdNFyhchbA0smWIgi0nE
	 Ac23dx2EQNy67fPe+LBz6KinbcJo38qORfKMPBvyFN1wFKKwd5biXzgVtTIbQ8pAag
	 ic03GSWR/aC8m3zE0g4cKFlAUlxjmnybkVfCtYPJPCpPK2S4V/aVy3hJmhBXEPFJZF
	 rAOUVt1zzqzoA==
Received: by mail-vs1-f43.google.com with SMTP id h19so5802975vsv.13;
        Fri, 03 Feb 2023 08:07:39 -0800 (PST)
X-Gm-Message-State: AO0yUKX8Jm2wepsQ3NxbFUkgLEJ6fPK23y8zwWE+Ch9ufBz8JcuRsQu0
	kLCfMyWFrENwje/NLnQ2BeDO8up/8/2cHe9QdQ==
X-Google-Smtp-Source: AK7set+p/4oE02Qtrd3KwUPO2TJMoCv7VYc0zIaV/SZKSXWLDPZxq/rLmvpgU5zF2KcbzmAfoLSdEu2R7mH3ELmM7nc=
X-Received: by 2002:a67:eb03:0:b0:3ea:c8c:48a5 with SMTP id
 a3-20020a67eb03000000b003ea0c8c48a5mr1730235vso.53.1675440457975; Fri, 03 Feb
 2023 08:07:37 -0800 (PST)
MIME-Version: 1.0
References: <20230111032830.20447-1-jian.yang@mediatek.com> <20230111032830.20447-3-jian.yang@mediatek.com>
In-Reply-To: <20230111032830.20447-3-jian.yang@mediatek.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 3 Feb 2023 10:07:26 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+eAQ-M9a+9g7Kk3GC9WjE_4mZXXrsdm4PucOJ4p2QYVQ@mail.gmail.com>
Message-ID: <CAL_Jsq+eAQ-M9a+9g7Kk3GC9WjE_4mZXXrsdm4PucOJ4p2QYVQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: PCI: mediatek-gen3: Add support for
 controlling power and reset
To: Jian Yang <jian.yang@mediatek.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Jianjun Wang <jianjun.wang@mediatek.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Ryder Lee <ryder.lee@mediatek.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	chuanjia.liu@mediatek.com, jieyy.yang@mediatek.com, 
	qizhong.cheng@mediatek.com, rex-bc.chen@mediatek.com, 
	david-yh.chiu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_080740_403513_27EDFD78 
X-CRM114-Status: GOOD (  19.43  )
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

On Tue, Jan 10, 2023 at 9:28 PM Jian Yang <jian.yang@mediatek.com> wrote:
>
> From: "jian.yang" <jian.yang@mediatek.com>
>
> Add new properties to support control power supplies and reset pin of
> a downstream component.
>
> Signed-off-by: jian.yang <jian.yang@mediatek.com>
> ---
>  .../bindings/pci/mediatek-pcie-gen3.yaml      | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> index 7e8c7a2a5f9b..46149cc63989 100644
> --- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> +++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
> @@ -84,6 +84,29 @@ properties:
>      items:
>        enum: [ phy, mac ]
>
> +  pcie1v8-supply:
> +    description:
> +      The regulator phandle that provides 1.8V power to downstream component.
> +
> +  pcie3v3-supply:
> +    description:
> +      The regulator phandle that provides 3.3V power to downstream component.
> +
> +  pcie12v-supply:
> +    description:
> +      The regulator phandle that provides 12V power to downstream component.

While in some bindings we've allowed these in the host bridge node,
that is a mistake. These should be in the root port node. You probably
don't have one in DT, so add one.

> +
> +  dsc-reset-gpios:
> +    description:
> +      The reset GPIO of a downstream component.
> +    maxItems: 1
> +
> +  dsc-reset-msleep:

Doesn't the PCI spec define this time? We're talking about PERST#, right?

> +    description:
> +      The delay time between assertion and de-assertion of a downstream
> +      component's reset GPIO.
> +    maxItems: 1
> +
>    clocks:
>      minItems: 4
>      maxItems: 6
> --
> 2.18.0
>

