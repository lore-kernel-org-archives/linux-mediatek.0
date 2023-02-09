Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6A8C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Feb 2023 19:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niG2EGz1c3OyIttax2i1EHaJSbYZ3YTZEcZ6nzjdxG0=; b=QnSBbPDcPl2p3tQB4gkQu63tbR
	bVr7PSiX9k/gnRgohfLC1MiCT4GD+lf/XS+RfYTQlkg/EZYktEOvCTqbMIr39wN6VjlRaNn4NZJom
	lVQ/21QeNFFU9ZyBoubOZ8gTjRJuXYuTZBDTVAyfKcO4Kz+nO4SWFF3I3NPAUStg1Zeyte0QWeCJh
	BRxodk0ysL+6Y0hpRwKR+3o7fgU565PQlUpqYjV1BkWbluT1Oi2ktejFN3TlaoGyoYc+vUBhObCwV
	/nIZ4hw/d2cYogSmhV8pqJZOu4haXrjJUMLbnjT1ekwiv02mrCbLJM/V9pHS7LE18fQNZ7NueE0y8
	Hod9PEQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQCLa-002y6n-Qr; Thu, 09 Feb 2023 19:12:42 +0000
Received: from mail-ej1-f54.google.com ([209.85.218.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQCLQ-002y4U-6C; Thu, 09 Feb 2023 19:12:33 +0000
Received: by mail-ej1-f54.google.com with SMTP id ml19so9605795ejb.0;
        Thu, 09 Feb 2023 11:12:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=niG2EGz1c3OyIttax2i1EHaJSbYZ3YTZEcZ6nzjdxG0=;
        b=P7ZKJuCmoM00O/9wzzl8nczo47Y8uAGtuj1Q7l+EfKOBXsf5xxWYoo6oc8dddzvZl1
         GhFrIvWC31rQBbTiwxpV6RHZJpolV3n5dVm/jQluG5q8klaZFPEvXLXlk4JBUt3upBuX
         Ap/T79lV8JDDFPiSZn3yKecqmMetinJQqjzrqSY+pqwXZ87zdn0CAE/9l+r7b604RTsE
         B/RFtB00Q99DFUz22dx2FQHjBs0B1grdE8y2QkljQKaxzwO2Ulr3CJ2Ibp9/kjl6i5SU
         2I6jIAEm8PJ2b3M9GUxB4bDVf3ZgKlYfjUVGOA76z5XgFP3IdKyljCAEe5IxkZ+gXEnU
         sLTQ==
X-Gm-Message-State: AO0yUKWU09grO4muEVuF00aB+nfA9690fGbQMTMMoruiUeTniJL5/kRX
	LgUrVMklmAarU/27cqEyPX/eyr3rZWJWzOFN+BM=
X-Google-Smtp-Source: AK7set/MBDxY2bsqoUNJIfYp1yC1dE/C3CJidAg9e+hMJUPfMqLOQ4lw0XH2Dx0dGNSmaYEZnFvIZYKr9ymv3Fd+uE8=
X-Received: by 2002:a17:907:7e82:b0:8ad:d366:54c4 with SMTP id
 qb2-20020a1709077e8200b008add36654c4mr899027ejc.4.1675969949277; Thu, 09 Feb
 2023 11:12:29 -0800 (PST)
MIME-Version: 1.0
References: <20230207195909.474953-1-u.kleine-koenig@pengutronix.de> <20230208050523.p6437bes6cmpd33k@vireshk-i7>
In-Reply-To: <20230208050523.p6437bes6cmpd33k@vireshk-i7>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 9 Feb 2023 20:12:17 +0100
Message-ID: <CAJZ5v0j8RCEE21Aj8j47k4bXV8-b=kKynBYWdf2tQL6Hfcsfbg@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: Make cpufreq_unregister_driver() return void
To: Viresh Kumar <viresh.kumar@linaro.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Markus Mayer <mmayer@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@kernel.org>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_111232_247873_570A6C6E 
X-CRM114-Status: GOOD (  15.22  )
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

On Wed, Feb 8, 2023 at 6:05 AM Viresh Kumar <viresh.kumar@linaro.org> wrote=
:
>
> On 07-02-23, 20:59, Uwe Kleine-K=C3=B6nig wrote:
> > All but a few drivers ignore the return value of
> > cpufreq_unregister_driver(). Those few that don't only call it after
> > cpufreq_register_driver() succeeded, in which case the call doesn't
> > fail.
> >
> > Make the function return no value and add a WARN_ON for the case that
> > the function is called in an invalid situation (i.e. without a previous
> > successful call to cpufreq_register_driver()).
> >
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/cpufreq/brcmstb-avs-cpufreq.c | 5 +----
> >  drivers/cpufreq/cpufreq.c             | 8 +++-----
> >  drivers/cpufreq/davinci-cpufreq.c     | 4 +++-
> >  drivers/cpufreq/mediatek-cpufreq-hw.c | 4 +++-
> >  drivers/cpufreq/omap-cpufreq.c        | 4 +++-
> >  drivers/cpufreq/qcom-cpufreq-hw.c     | 4 +++-
> >  include/linux/cpufreq.h               | 2 +-
> >  7 files changed, 17 insertions(+), 14 deletions(-)
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Applied as 6.3 material, thanks!

