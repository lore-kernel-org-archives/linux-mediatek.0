Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65CE7C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 06:59:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 316F8610A7
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 06:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 316F8610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=odlPoUhy7aLfrsEZ5OhxuRMzUHPwx7ZGEZf2Afj/f9w=; b=rfVfta6Org+kR6
	iHltPA8WjN8cdn7S7/0MLbKT2QpHaj8jyo7oyiMuzGx12aUYRD8ICTMmnTQhPdu07Ac6BlmDsQtTv
	aEuJ0Pp9WhGD5I7xRg+TAo7nzqSRwE5I8reh0daNp31jmPCuA6fjQMeWj6hLbJDQj2bR25htMVYew
	cPgmBvq+kWf36dWoO6RcVCgyZM+5tSyzhE32BcG9LjPJgdLATcd6Xds6FWQYvHLAqTlArHb6sZfdJ
	bbNVj5PIRkyGejhKPLAto+XRWjmoOT5UxwaUP0F6uYZDZ1iGalNLJCMLpAbk8XBoaAr7fa/QbvsWa
	DYbMH7MvieVgE+MT9EUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2puP-006Cqn-HY; Mon, 12 Jul 2021 06:59:17 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2puM-006Co9-Ny
 for linux-mediatek@lists.infradead.org; Mon, 12 Jul 2021 06:59:16 +0000
Received: by mail-lf1-x12c.google.com with SMTP id a18so41266370lfs.10
 for <linux-mediatek@lists.infradead.org>; Sun, 11 Jul 2021 23:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uL4qOFQDnqgQ2aF2ahpw+LAZlHDuE//p49FyeqzSj44=;
 b=gYccxzvPvlG2CcKSgoZmZQNAI1Cd7bWaGHRirLbAwi7R0HIflJLo39Hhv4QzF1lkhH
 f+DKUfMwZXfPveOzOgEcvxYK5CwGoOGgOmZTs9dRP0WBJMnq/Ar6IWpPvRznLewwEcc6
 6BAFfW0eJijjHkgV5bZIzZiK6FxE08DvZJxzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uL4qOFQDnqgQ2aF2ahpw+LAZlHDuE//p49FyeqzSj44=;
 b=i41Mx6/syut/RJvqkw0G77VUcK7j0r33El4nlc+ynwQta3Y/0cCYKibKzcpk+5vwXD
 SoYP4R92bIRers/gYqLWTgqQiTiJVUGgQIp+KGDFwM1MWjPvMa276uSqTTRDtriR3CBH
 HwhuN6UeZxgHPUxhBXJb0yHs4j9rB/cap0miCPrwZcbndeuB8q6PbD1aAb5iekBcodvM
 z7Tzwy9oRkx7AZ9OOalVPJUtOCXxuSLjHJd7rVeVahaTmihsGHU82CLbYZOsjZltSm+c
 bTFXwUzTxWNevOgU8chfPfFPxIJXgw1jXKLvAm0rf2Z9F1cg+T8YEy4eFd8jeMSvqI+Z
 qQtA==
X-Gm-Message-State: AOAM5336d0WL2OlvJjJfdYV85PNLGND/QPth6i7pIr9LbYNKv8zvJXv0
 EIi5aHn/0mEDwFKe3rfcKhX62IOnJGMSrX4cHhTXgQ==
X-Google-Smtp-Source: ABdhPJxazF88IljSmFv7FTAnayUrL7XqJfcJPRRd4QyYr86AwfXQRElRMa5x7WctR+GIj9aB7/S2K9xgx3ANmjzXbCA=
X-Received: by 2002:ac2:53a3:: with SMTP id j3mr812475lfh.479.1626073151325;
 Sun, 11 Jul 2021 23:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210710122446.5439-1-tinghan.shen@mediatek.com>
 <CA+Px+wUVsY6CYwEdfSeK+KQGmvb224hvchgnTwX0rgBzMvXfqw@mail.gmail.com>
In-Reply-To: <CA+Px+wUVsY6CYwEdfSeK+KQGmvb224hvchgnTwX0rgBzMvXfqw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jul 2021 14:59:00 +0800
Message-ID: <CAGXv+5EtUqe=HECJFkZXdDX9cV_wMp0OykHDOBJVWPF3MwA4ZQ@mail.gmail.com>
Subject: Re: [v2 1/2] dt-bindings: remoteproc: mediatek: Add binding for
 mt8195 scp
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: Tinghan Shen <tinghan.shen@mediatek.com>, ohad@wizery.com,
 bjorn.andersson@linaro.org, 
 mathieu.poirier@linaro.org, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
 srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210711_235914_822642_87B20E48 
X-CRM114-Status: GOOD (  21.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jul 12, 2021 at 2:06 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Sat, Jul 10, 2021 at 8:25 PM Tinghan Shen <tinghan.shen@mediatek.com> wrote:
> > @@ -5,13 +5,15 @@ This binding provides support for ARM Cortex M4 Co-processor found on some
> >  Mediatek SoCs.
> >
> >  Required properties:
> > -- compatible           Should be "mediatek,mt8183-scp"
> > +- compatible           Should be one of:
> > +                               "mediatek,mt8183-scp"
> > +                               "mediatek,mt8195-scp"
> Just realized we forgot to add DT bindings for mediatek,mt8192-scp[1].
> Could you send another patch for adding the missing property?
>
> [1]: https://elixir.bootlin.com/linux/v5.13.1/source/drivers/remoteproc/mtk_scp.c#L879
>
> > -- clocks               Clock for co-processor (See: ../clock/clock-bindings.txt)
> > -- clock-names          Contains the corresponding name for the clock. This
> > +- clocks               Required by mt8183. Clock for co-processor (See: ../clock/clock-bindings.txt)
> > +- clock-names          Required by mt8183. Contains the corresponding name for the clock. This
> >                         should be named "main".
> Let's move clocks and clock-names to "Optional properties".  See [2]
> for your reference.  I guess it doesn't need to mention which chip
> needs the properties.  For those chips that need the clock properties,
> they won't work correctly without correct clock properties.

I would suggest still adding them. We will need to describe the requirements
anyway then the binding is converted to DT schema.

ChenYu

> [2]: https://elixir.bootlin.com/linux/v5.13.1/source/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt#L87
>
>
> Suggested to provide a cover letter for the series next time.
>
> nit: other patches usually use "[PATCH v2 1/2]" in the email title
> instead of the one used in the mail.
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
