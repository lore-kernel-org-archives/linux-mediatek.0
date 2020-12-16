Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21F5C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 14:53:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EB67233CF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 14:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EB67233CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5ibIyRB+tpBPDZdx6HmdCz8vx4OiCsCPiVUBw4fWKzQ=; b=b0N2cfzsRUDsTbiG8peYUqz8C
	4wjicZRy6yEGknKFYSMIFmfniKQ4Ukuhs9TkmTfOB9X8ayw5tOVQEmPN+toLD0opYcEEdREz/gZAa
	mAsDoXxNg15X1KngmuoqOHNynXILqA/hLXAwFg9u+9y0MzPI2tAsEPkaYiFL/hy5e7PBgG7pSTbql
	1dh/acmx68FP4khPU3doGBu04G3O7dTAGPTu7H37RwOvS+9iUGn+q0S0MusE2sXolTwlxDLrDutIC
	xHXm0Fv8ExZbcCigMyq6x8vKF08XW90kt64dl+3l3cWm9YF9sZi7o55sYFXlCxEI1RWqgrI4LO0ht
	JzO/uB6iQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpYBG-00017B-Du; Wed, 16 Dec 2020 14:53:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpYBE-00016n-CG
 for linux-mediatek@lists.infradead.org; Wed, 16 Dec 2020 14:53:29 +0000
X-Gm-Message-State: AOAM532l5/qxAl85+NnTgewmUVxWatLZNR7x4S9nJrzlbJKMoLavXLTs
 f7S0DeAbYRDcVaXW9XpweRIJ2OqD0y/KW/Mcaw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608130407;
 bh=kc+d51UhZrWJCsCqG2GwOMb22dkQfiIKZBMrx9fs0qM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=b9yx17BB4TuUif55PjWBcq5vroujzeALZJSdPYcgjb1jtIbZ6NU1LzDVTRbVz0Jr9
 xOYNS+TpBTAYo0pelyZi4AxXA7y95p5Sgrm45wAbsxUm7gMMAT5jU4eT/lv3vW40EN
 9etrhrj33gYkZMzy3yu3Hmdj34VEBxypuXX8CkHFIFpjC2ygxBrbnHfK8BKnQTKEYE
 ka3Bjzhkbi+HK4hGtlJJgE+8zxVrVufco2eLMmoyZMRENMlN1Jyq6ep2IPJfVaX5E2
 3WF0X9x3toIqSm/4Jleg03qlWVK6ycAx/ApJXUHzNMFSgHvw0nw0CKDVxpxGSh6tL3
 IbP/BoktAWImQ==
X-Google-Smtp-Source: ABdhPJzV/LnSjFVIUR+zRA1VDbKBtJC8kSTI5TQFsK6x5RrNdL68YocGY+go8vJ21dRHAOcGleDp/VtcmD+cIcTCFZc=
X-Received: by 2002:aa7:d154:: with SMTP id r20mr35708266edo.258.1608130405682; 
 Wed, 16 Dec 2020 06:53:25 -0800 (PST)
MIME-Version: 1.0
References: <20201216105819.31946-1-Yz.Wu@mediatek.com>
In-Reply-To: <20201216105819.31946-1-Yz.Wu@mediatek.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 16 Dec 2020 08:53:13 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+3=kjzpoSqVOLsAin7cQVThV41ShFsEwT9ACRW22b1AQ@mail.gmail.com>
Message-ID: <CAL_Jsq+3=kjzpoSqVOLsAin7cQVThV41ShFsEwT9ACRW22b1AQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: mt8192: add efuse support for MT8192 SoC
To: Yz.Wu@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_095328_514126_53AB69D8 
X-CRM114-Status: GOOD (  17.94  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 srv_heupstream <srv_heupstream@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 16, 2020 at 5:00 AM <Yz.Wu@mediatek.com> wrote:
>
> From: Ryan Wu <Yz.Wu@mediatek.com>

Use get_maintainers.pl please.

>
> to read Mediatek efuse

Complete sentences?

>
> Signed-off-by: Ryan Wu <Yz.Wu@mediatek.com>
> ---
> This patch dependents on "arm64: dts: Add Mediatek SoC MT8192 and evaluation board dts and Makefile"[1]
>
> mt8192.dtsi file is needed for this patch.
> Please also accept this patch together with [1].
>
> [1]http://lists.infradead.org/pipermail/linux-mediatek/2020-November/019378.html
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 69d45c7b31f1..55a805a61428 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -422,6 +422,13 @@
>                         #clock-cells = <1>;
>                 };
>
> +               efuse: efuse@11c10000 {
> +                       compatible = "mediatek,efuse";

Needs SoC specific compatible and to be documented.

> +                       reg = <0 0x11c10000 0 0x1000>;

> +                       #address-cells = <1>;
> +                       #size-cells = <1>;

These aren't needed unless you have child nodes.

> +               };
> +
>                 i2c3: i2c3@11cb0000 {
>                         compatible = "mediatek,mt8192-i2c";
>                         reg = <0 0x11cb0000 0 0x1000>,
> --
> 2.18.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
