Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269D3C61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 10:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OiFGc1hvU9VhxKMXFyUNXO2Gwzj0bxXzL9q4pdCqr5Y=; b=v+7ULIMeSia8cmBXkZ/XuMQCW4
	qW4jW8gicZvphyvnzZeBSHFH1WJzHdw8fYHFLhUyetl16nl1Wf+530bsWVvUk36SWWV9E3CEVp6Zx
	gnBzfHPlPR1ohiTOgmzG9wrxMLiJLFAJYnME8NGEOwiW15OizDDslUPh43l8eA58zNeuNX7GJbhtu
	o6ktJAABGwAESdR4/XmRUrWl7CkIjAAaCM7KDsrpkltMYw83W/dBMxeZ6al0ze8lyRlECSW4nDuek
	DEXR3Y0+mPTmHtJ8z3dQ3eKO2yNv58FI8Fi8SemsgzRaWDVdbcR70qtE0dG9ZT4Gi2ncMbhtCdW62
	vontnidg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNtQC-001PqK-NB; Fri, 03 Feb 2023 10:35:56 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNtQ9-001PoN-Dl
	for linux-mediatek@lists.infradead.org; Fri, 03 Feb 2023 10:35:55 +0000
Received: by mail-ej1-x633.google.com with SMTP id mf7so14097760ejc.6
        for <linux-mediatek@lists.infradead.org>; Fri, 03 Feb 2023 02:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OiFGc1hvU9VhxKMXFyUNXO2Gwzj0bxXzL9q4pdCqr5Y=;
        b=sazEFmGQ/yPDRcukt/2jabKqWss56+SM/dMS6noQWcmnCZuPntbr1osUd1DdPVtnp/
         PUJiddL9N4f8YKpiRH3pi/8nZnr9i0IHsD5cZ36XNJqkTA4q1YMstM6mFwGBk43z4Dkb
         pFDCQwed3o2L7ggIBc1u07Iqmrzbx8U7gZK2fWAQb9yn1QJt7s96BkNAMUgqba3Gzw+Q
         fC1koJ4PIAAPo28xfY8oX8O/8YGOBcWd67HvGqci/Y59xxcvZBRPYtP3eFvm6b4xb/E1
         FQgS1rma99kUn93ZXoKraHM2Ec0pbgcRxgo4we4XgCPP6T/4/TGF4fK2vV8YRFHlvSB4
         xGkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OiFGc1hvU9VhxKMXFyUNXO2Gwzj0bxXzL9q4pdCqr5Y=;
        b=0t3X1bQjg6sEtPdhj+zkey9Q+vdCeNaulAQCuF2AdaVlBjzkC7/gUeBkQOguvVp2aW
         v3qPfTfq+hDppr3tatZdaMEUpxmJqLfE/OFbx31kfgjBuGa65GBOavcw3snUewepVgrU
         Y8xTh3REYX/zyp/lQbTmaxML81sD9HqUwJaLuco1CLqRQiilYSSfKdDDdhCz2IlECoSP
         WQNac5yaJhFuK8XBfM/9pP2byO+T8cmYkvx7ik7oToPcA34+LmEp7WdObYeoJeqQjXQT
         N3cFoy3YyjGCDZIfsQk8E31ZAU+6VQOBhAQSX8fcFEjdC1O9O/yIG+zmsawpnguggcqp
         OPKw==
X-Gm-Message-State: AO0yUKWSynX2RoDPCNSnOxDaOzmwzKe51WtRV4b70mbF10H1PUdhMNBI
	QD5cIDPvxqOrfReYq8IrjQ84fjgJ3nurmX03qsSoFA==
X-Google-Smtp-Source: AK7set+HyDtAPr7xlvnHLTiVM3CyrgRd1MsKwlB5flwTkTAH2vWTXjkIbfN7erg4r2gqmRDekX4I6TLcEM6jA/K6Hyg=
X-Received: by 2002:a17:906:1803:b0:7c0:f45e:22ff with SMTP id
 v3-20020a170906180300b007c0f45e22ffmr3313742eje.104.1675420551371; Fri, 03
 Feb 2023 02:35:51 -0800 (PST)
MIME-Version: 1.0
References: <20230124131717.128660-5-bchihi@baylibre.com> <20230131153816.21709-1-bchihi@baylibre.com>
 <ab1e4822-d5f4-79f6-ea38-47e2342ebe49@linaro.org> <CAGuA+oqLiCxb1g7pwf+RwUTWHV37pXdAWUXHV51TnUy1-xUOXQ@mail.gmail.com>
 <68466850-ddb0-119a-ea82-636ec2c5368e@gmail.com>
In-Reply-To: <68466850-ddb0-119a-ea82-636ec2c5368e@gmail.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Fri, 3 Feb 2023 11:35:15 +0100
Message-ID: <CAGuA+oq1jZvDUK01rX-jJH7-5waWA4JnytoBmCeD7+SbndPgrw@mail.gmail.com>
Subject: Re: [PATCH v12] thermal: drivers: mediatek: Add the Low Voltage
 Thermal Sensor driver
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, daniel.lezcano@linaro.org, 
	angelogioacchino.delregno@collabora.com, rafael@kernel.org, amitk@kernel.org, 
	rui.zhang@intel.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com, 
	rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_023553_472603_F68D97C0 
X-CRM114-Status: GOOD (  23.67  )
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

Hi Matthias,

On Wed, Feb 1, 2023 at 5:59 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
>
>
>
> On 01/02/2023 17:46, Balsam CHIHI wrote:
> > Hi Krzysztof,
> >
> > Thank you very much for the review!
> >
> > On Wed, Feb 1, 2023 at 8:55 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 31/01/2023 16:38, bchihi@baylibre.com wrote:
> >>> From: Balsam CHIHI <bchihi@baylibre.com>
> >>>
>
> [...]
>
> >>> +
> >>> +static irqreturn_t lvts_ctrl_irq_handler(struct lvts_ctrl *lvts_ctrl)
> >>> +{
> >>> +     irqreturn_t iret = IRQ_NONE;
> >>> +     u32 value, masks[] = {
> >>
> >> Don't mix different types in one declaration. u32 and a pointer are
> >> quite different types.
> >
> > I'm not sure to understand.
> > LVTS_INT_SENSORx are not pointers but register values.
> >
>
> u32 mask[] is a pointer to a array of u32 values of undefined length.
>

I will change this to :
u32 value;
u32 masks[] = {

> [...]
>
> >>> +static int __init lvts_golden_temp_init(struct device *dev, u32 *value)
> >>
> >> You did not test it, right? Build with section mismatch analysis...
> >
> > I'm not sure to fully understand this comment.
> > Would you explain, please?
> >
>
> AFAIU:
>
> lvts_golden_temp_init() and lvts_ctrl_init() are called from a function that is
> not in __init section:
> lvts_domain_init()
>
> So if you free up the first to functions after init but not the callers, things
> can explote.
>

__init will be removed for all functions.

> [...]
>
> >>> +
> >>> +static int lvts_probe(struct platform_device *pdev)
> >>> +{
> >>> +     struct lvts_data *lvts_data;
> >>> +     struct lvts_domain *lvts_td;
> >>> +     struct device *dev = &pdev->dev;
> >>> +     struct resource *res;
> >>> +     int irq, ret;
> >>> +
> >>> +     lvts_td = devm_kzalloc(dev, sizeof(*lvts_td), GFP_KERNEL);
> >>> +     if (!lvts_td)
> >>> +             return -ENOMEM;
> >>> +
> >>> +     lvts_data = (struct lvts_data *)of_device_get_match_data(dev);
> >>
> >> Why do you need case?
> >
> > Would you explain, please?
> >
>
> Typo by Krysztof, he meant the cast.
> lvts_data = of_device_get_match_data(dev);
> should be good enough.
>

OK,
It will be like you suggested.

> Regards,
> Matthias

Thank you for the review!

Best regards,
Balsam

