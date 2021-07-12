Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3DAEC07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 07:02:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7252161108
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 07:02:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7252161108
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/zEA+lZ2Tj4+tQvwF+N/xYs1Nlvkdzh7+QniIkcR82w=; b=pwxmCx9s8UihBi
	yuzWBG9IJkjB7ibbgZ0J2uhSm/DyCsctmZhDKzBnaWPj/lUMr++uoDr4COkA9rBqZMIG5Wm7+MVB9
	eaygunAaMCvLKmFUU8E0QxjW432bFk8nZZ3jNGPXeOs4vTo55+wtxsEHk5+O4iQuqNeKiv0cOQcUh
	sbUcpLyPP+fP93g47hFXQJG3TmfuaPUIBfKLDhKxzBCn7eCS4n13lXWnJqmwglJSr4h+SZKQCiTtu
	BOZ4Rzbaddkr0NHTnZoq2qnDVaBdSXjyLq4G6C6KWK4z4X1IuYxqPpF8zJbiQR04XOqo1wFI/rPc3
	tqdheuEUycBQbQ19EaSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2pww-006Df1-ES; Mon, 12 Jul 2021 07:01:54 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2pwi-006DcL-Nd
 for linux-mediatek@lists.infradead.org; Mon, 12 Jul 2021 07:01:42 +0000
Received: by mail-lj1-x234.google.com with SMTP id h9so7175654ljm.5
 for <linux-mediatek@lists.infradead.org>; Mon, 12 Jul 2021 00:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VYxdyspSXWiwtPigXq/rsDU61HEXCt6NK9gvUcQWdw8=;
 b=j9Vqu0fE81dKuB+kJrj1mFKs1Q4XuZf15mdQ7y/28wrgXUmux6EGDh3Kqzc0D6Soyh
 x4glUdP6MiOg1LSsMctR2/tU3EPVNIM5mAtqztMYzmeGxNhimHPfdbtt9VU6ew3ecE7A
 7ZhwHClVVPOUnoVqqTpfiHDdu1GFefzp/GoZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VYxdyspSXWiwtPigXq/rsDU61HEXCt6NK9gvUcQWdw8=;
 b=LoghQbk2hiF2BTzlnU1sN92p/Km+V1VBm4f1WwW4lxIKkjwSdPpzLl1K8qGP1lhmmZ
 +ysaG+sTIB3m4GsDTlUCC1amO0PEea95AQ7oZqlIT+qtyS9XpQEWKX4mGaiwkcl3pHuL
 WK2DFi/GDCKc/N3K2NEmld6bKaMvnGAoclyPL2OnTDKM9cp8C247Pug3Ucl/C1xbkH8e
 uw1ijDLB4s7DcJVEqMMpuZS8V78ViJu17Wo4IVC2Vjj6BfOE+zi+lzGDDV2fi63Qz8Za
 5vEIlnSVo0gA3Lp4Pc9aYa2D42shKphg3Q2NAHdnIRAZZBsPtot6ZOBwZEnKmDLI0I2p
 LEmA==
X-Gm-Message-State: AOAM5300mBPl8qfWkLz9hiG95GA/9OTb+6c++9f/e2aNSX1DVjDCOmMh
 Lv7mr3hdh4ofV5rkifFSjvpJLJIpeJaf+5bVlRtwxQ==
X-Google-Smtp-Source: ABdhPJyfLdmeFKBf+PLnkJ30PFYffQcwVgdTfzPp/i11j8aApmws194sn2QFP1ISlk6TVNbu9PCbxv1IXO8m7OC1XiY=
X-Received: by 2002:a2e:a583:: with SMTP id m3mr41042486ljp.305.1626073298718; 
 Mon, 12 Jul 2021 00:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210710122446.5439-1-tinghan.shen@mediatek.com>
 <CA+Px+wUVsY6CYwEdfSeK+KQGmvb224hvchgnTwX0rgBzMvXfqw@mail.gmail.com>
 <CAGXv+5EtUqe=HECJFkZXdDX9cV_wMp0OykHDOBJVWPF3MwA4ZQ@mail.gmail.com>
In-Reply-To: <CAGXv+5EtUqe=HECJFkZXdDX9cV_wMp0OykHDOBJVWPF3MwA4ZQ@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jul 2021 15:01:27 +0800
Message-ID: <CAGXv+5Hww-fgvEkjOtLQod6wbnThgdg0eiEx=45nQVY2wtWHcQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210712_000140_811546_8DE709A3 
X-CRM114-Status: GOOD (  23.79  )
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

On Mon, Jul 12, 2021 at 2:59 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Mon, Jul 12, 2021 at 2:06 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
> >
> > On Sat, Jul 10, 2021 at 8:25 PM Tinghan Shen <tinghan.shen@mediatek.com> wrote:
> > > @@ -5,13 +5,15 @@ This binding provides support for ARM Cortex M4 Co-processor found on some
> > >  Mediatek SoCs.
> > >
> > >  Required properties:
> > > -- compatible           Should be "mediatek,mt8183-scp"
> > > +- compatible           Should be one of:
> > > +                               "mediatek,mt8183-scp"
> > > +                               "mediatek,mt8195-scp"
> > Just realized we forgot to add DT bindings for mediatek,mt8192-scp[1].
> > Could you send another patch for adding the missing property?
> >
> > [1]: https://elixir.bootlin.com/linux/v5.13.1/source/drivers/remoteproc/mtk_scp.c#L879
> >
> > > -- clocks               Clock for co-processor (See: ../clock/clock-bindings.txt)
> > > -- clock-names          Contains the corresponding name for the clock. This
> > > +- clocks               Required by mt8183. Clock for co-processor (See: ../clock/clock-bindings.txt)
> > > +- clock-names          Required by mt8183. Contains the corresponding name for the clock. This
> > >                         should be named "main".
> > Let's move clocks and clock-names to "Optional properties".  See [2]
> > for your reference.  I guess it doesn't need to mention which chip
> > needs the properties.  For those chips that need the clock properties,
> > they won't work correctly without correct clock properties.
>
> I would suggest still adding them. We will need to describe the requirements
> anyway then the binding is converted to DT schema.

Also, a coprocessor without any clock feeding it makes little sense.
Any processor requires a running clock. Whether that clock is controllable
is beside the point.

> ChenYu
>
> > [2]: https://elixir.bootlin.com/linux/v5.13.1/source/Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt#L87
> >
> >
> > Suggested to provide a cover letter for the series next time.
> >
> > nit: other patches usually use "[PATCH v2 1/2]" in the email title
> > instead of the one used in the mail.
> >
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
