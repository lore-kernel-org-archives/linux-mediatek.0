Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3670CC54798
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 19:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4ETKftWBVy6GzKkutN2GcCGR5cKv1VIm/ZISCNpvf9s=; b=CyS1dk7ohQ8qa5iCCsYd/R9Zr8
	0Sh/9ZXNg+JjdYNgig65XxzPF5K63AM3es19W6dza+zsB+hoGjGv1Pda7zET0fhBt9t/YFkqFBhef
	YTK1gNJx5qC8v39PAKdeG82trTONnhialsf7sV1GeeYHckl9FihABeoMPfcvg/W673ZO5WlEID49l
	XilFkiBLgJSM0rszi/N35+SKac5hrNMJLN5kaOBRHEHrl0NJEIO5iv2oxA2tTEjeghzaNzOrVNlEE
	gBmFoeD42BothESJo4nZf3oOhR+OkbQ+76gPE+wULtLry/q4krKOS56Z2guF1kpOcdPg7DlSEl8DX
	NaEZQ7BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfm86-0000000Etez-0PmJ;
	Thu, 29 Feb 2024 19:31:42 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfm82-0000000Etbv-3NYw;
	Thu, 29 Feb 2024 19:31:39 +0000
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6e4c402c85bso104913a34.1;
        Thu, 29 Feb 2024 11:31:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709235092; x=1709839892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ETKftWBVy6GzKkutN2GcCGR5cKv1VIm/ZISCNpvf9s=;
        b=AuI4lswJj3PLPzknro+uRaxrTQR0dBvafj4qsWNQG/L7H1VjAfaZiH+P/OywiuoHYq
         RnaExImYUv9RaJH0KcvlubFxAq0JpjNUgg1REU4zrhjzKh373yp6InZTJTr+4cw2eJg4
         fjakTSP6Au1eyV6iOgfsR+Uq24n6d4qi5ajkqSSsIiavzqUQDISJ+V/r4RJc61aGY9cF
         3Gmfo2sOFEiYlaO8Aj5HBTNyZf7pv7bDfX4W92egSrw1G1qMcj7ZrwpKeyIba0E00vrY
         8oTUoZBBnSRnqFNXZmzgQqrp0EGLXBpFU+XVKxccGwy+2SGMuGUXcohL/SSDk3SRxiYE
         jlQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNvx0bFKddLnlOWflBHRBuc6daInfcD5cY8Ga6FKcnxX8Bc5X9DJpQYg71XY7Jx3rBzi0dnqKZoOXCnK24yIUCRTmyXZPN+nTRLrqeRD9liBEPQQJtSUYp3emoLL52QCuT2ibbeF1xwxUc8B5b0QOpcAYlHMJhzao=
X-Gm-Message-State: AOJu0YxyqfF0d6W1Su7WR0+F4g2OsLxZrt2DpsZtfGjs5wqPTCC3skhs
	h2B/TVqRYeybH0D7klHycHvcBJmjhvV8vIDW7QYsgti1wjj8y2NsCOq9XKA3Vwpo7hxauVRf6gR
	yMJ0641brgivXJ1AaE35nNcJoh0U=
X-Google-Smtp-Source: AGHT+IGmr8Ws2ZZbxr8S3XY9PtvJNcuSafyT8K4yK9nszYjX3GohlNi6UZMc36dkoILMAHC9DHOnJq0GkmPsY/Iw+do=
X-Received: by 2002:a05:6820:352:b0:5a0:6ef3:ed8e with SMTP id
 m18-20020a056820035200b005a06ef3ed8emr3073771ooe.1.1709235092242; Thu, 29 Feb
 2024 11:31:32 -0800 (PST)
MIME-Version: 1.0
References: <20240228020040.25815-1-qingliang.li@mediatek.com>
 <1390e743-2216-4435-b2ef-7d92a55605b1@ti.com> <0c1e972cf506b22cb1de73c8509bf2b917c0806b.camel@mediatek.com>
In-Reply-To: <0c1e972cf506b22cb1de73c8509bf2b917c0806b.camel@mediatek.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 29 Feb 2024 20:31:20 +0100
Message-ID: <CAJZ5v0hPBbri9Y+VPqA8iisWg+fyZXouLnP=DQLN4j+W0pq6Pg@mail.gmail.com>
Subject: Re: [PATCH] PM: wakeirq: fix wake irq warning in system suspend stage
To: =?UTF-8?B?UWluZ2xpYW5nIExpICjpu47mmbTkuq4p?= <Qingliang.Li@mediatek.com>
Cc: "johan+linaro@kernel.org" <johan+linaro@kernel.org>, "d-gole@ti.com" <d-gole@ti.com>, 
	"pavel@ucw.cz" <pavel@ucw.cz>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"tony@atomide.com" <tony@atomide.com>, "len.brown@intel.com" <len.brown@intel.com>, 
	"rafael@kernel.org" <rafael@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?B?QXhlIFlhbmcgKOadqOejiik=?= <Axe.Yang@mediatek.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_113138_871845_C91EF68C 
X-CRM114-Status: GOOD (  23.10  )
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

On Wed, Feb 28, 2024 at 9:33=E2=80=AFAM Qingliang Li (=E9=BB=8E=E6=99=B4=E4=
=BA=AE)
<Qingliang.Li@mediatek.com> wrote:
>
> On Wed, 2024-02-28 at 11:34 +0530, Dhruva Gole wrote:
> >
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  Hi,
> >
> > On 28/02/24 07:30, Qingliang Li wrote:
> > > When driver registers the wake irq with reverse enable ordering,
> > > the wake irq will be re-enabled when entering system suspend,
> > triggering
> > > an 'Unbalanced enable for IRQ xxx' warning. The wake irq will be
> > > enabled in both dev_pm_enable_wake_irq_complete() and
> > dev_pm_arm_wake_irq()
> > >
> > > To fix this issue, complete the setting of
> > WAKE_IRQ_DEDICATED_ENABLED flag
> > > in dev_pm_enable_wake_irq_complete() to avoid redundant irq
> > enablement.
> >
> >
> > Just trying to understand, why not in dev_pm_arm_wake_irq ?
> > Is it cuz it's called much after dev_pm_enable_wake_irq_complete ?
> > Not sure what's the exact call order, but I am assuming
> > dev_pm_enable_wake_irq_complete is more of a runtime thing and
> > dev_pm_arm_wake_irq happens finally at system suspend?
>
> You are right, the involvement of 'dev_pm_enable_wake_irq_complete' is
> due to the driver selecting 'pm_runtime_force_suspend' as the callback
> function for system suspend. In this scenario, the call sequence during
> system suspend is as follows:
> dpm_suspend_start -> dpm_run_callback -> pm_runtime_force_suspend ->
> dev_pm_enable_wake_irq_check/complete
> suspend_enter -> dpm_suspend_noirq -> dev_pm_arm_wake_irq
>
> Based on the above, if the driver (i) chooses pm_runtime_force_suspend
> as the system suspend callback function and (ii) registers wake irq
> with reverse enable ordering, the wake irq will be enabled twice during
> system suspend.

It would be good to put the above information into the patch
changelog, as it actually explains the problem.

Thanks!

