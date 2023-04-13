Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654A0C77B71
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 18:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2A0Cbt+qgxFGgrMPnwGwp48JgCRL27ag+TlcYsekpC4=; b=dj1XfIxf0AuOtjyHYOJGItoapE
	Q3xLQgPbcckRButBh2Onf62HdunnP6w95a2LPuI2TsczqoHTKRPtfMvB7jyQ/iy2EMYf+hvmapBic
	ug760WAInsdssgz6pTbbFZ6hnC+npUgFf9pJAyI06P1zyDkh+bRrbLNJl2F1VVliOtXNFF43T1rZg
	Kg4GqVm1sQeQSNFLebkdDKsCrpy3ByhO89idkzOeGtR7+cjul69hduGpzcG8vMlB4ofCY7NqJCUKS
	RuC8CAVde2b85T+bHOeco5mZoZ0iVPIDgYzlCsH7yTZgF0tKL/mP2Cy7SFVrLE0oUltV/N5+hp0HZ
	ra2Ab6uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pn1rx-006vX2-10;
	Thu, 13 Apr 2023 18:40:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pn1rt-006vW5-2W;
	Thu, 13 Apr 2023 18:40:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2401C640D0;
	Thu, 13 Apr 2023 18:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536EDC433EF;
	Thu, 13 Apr 2023 18:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681411224;
	bh=mwYnTH2xTUlzJflPd1vC123IfsPEl3nEWJIFOU/ryso=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=C1b7JS3gODDSYYlBDTIpxlgxG1R4XL1R85N0pALFWGPerftCQh/QgRTkSYmNuEYE9
	 L/Edkv3kS7VyqrGIxRIIdjjQO2xm/Qoe5ITC3m4M51owUTozFTFYrb45KhE0FrHJ9E
	 yjniCCFn4wdkU5OC0UqrILGm8af4piU0eXT+ootGLCww0CkSFCgOTSkv41JoWKduH1
	 wNXgpYg6SbGBH3SUhdHfLx6632/mSuRMo2Q/jkQfKPur8yk4bqg7cVIAPHLTp5pE43
	 rCPZVphcdd8JaZowPPREGMbP25Ke1cssVQFxLKe/7IZLp0MzhMSd+NPktv81meIG13
	 zpAqAywMfmBGA==
Message-ID: <f09425fde83f4b21ee301ef8810c4c29.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230413090128.60119-1-gehao@kylinos.cn>
References: <20230413090128.60119-1-gehao@kylinos.cn>
Subject: Re: [PATCH] mediatek/clk-mt8173-apmixedsys: convert to devm_platform_ioremap_resource
From: Stephen Boyd <sboyd@kernel.org>
Cc: gehao@kylinos.cn, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
To: Hao Ge <gehao@kylinos.cn>, matthias.bgg@gmail.com, mturquette@baylibre.com
Date: Thu, 13 Apr 2023 11:40:22 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_114025_859492_C909E10D 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

Quoting Hao Ge (2023-04-13 02:01:28)
> diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt8173-apmixedsys.c
> index a56c5845d07a..fe386bf8225d 100644
> --- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> +++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> @@ -90,7 +90,7 @@ static int clk_mt8173_apmixed_probe(struct platform_dev=
ice *pdev)
>         struct clk_hw *hw;
>         int r;
> =20
> -       base =3D of_iomap(node, 0);
> +       base =3D devm_platform_ioremap_resource(pdev, 0);
>         if (!base)

This needs to be updated.

>                 return PTR_ERR(base);

And PTR_ERR(NULL) is 0, which is wrong.

