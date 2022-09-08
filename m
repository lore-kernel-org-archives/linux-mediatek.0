Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E2AC38145
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 07:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7QJckYHfQwgitlIa4fG9VvM/7DgqgL5ob2UbtTxt+g=; b=SMoNHHYEuCSUquRMiuhmJYKuSu
	mlQ+gvWKy3NCqOU+dOHdu6pn4v9jztrgqp3m3NB7t30xSA3Mt6rAkjYu2cWTGRpLxSasWRhAxuLxt
	yYs0IIPMrwx0X3G64fTyMymSrA9+KN6qV5hmjtricdpD82rj54OyMwoTFRlCKiV4c507hNkRZR8Tm
	thaJR+VBbNipr3gUc+QrH9H5uP2cSFwbsk4yutf5pwnHqQMRQqfhNzHAc21T2apI2JTtUtxiCf7na
	XImMUFDLIoDK9lM0pus4eXVrd4s5G7twTUWnDcZoJ4jkED1ai7iSN/15kBuSFwSrcKyRdPl98vMlo
	OGaafGxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWCNA-000Xh4-KC; Thu, 08 Sep 2022 07:54:52 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWCMz-000Wgq-LZ; Thu, 08 Sep 2022 07:54:42 +0000
Received: by mail-qk1-x72f.google.com with SMTP id c9so12281814qkk.6;
        Thu, 08 Sep 2022 00:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=P7QJckYHfQwgitlIa4fG9VvM/7DgqgL5ob2UbtTxt+g=;
        b=nZpnmUeuYkLB/UZcdQdqTJfcOGeCfKdJjqpqUXHIkWTitN/FL7CFmMExTnxbW2Li4Z
         5cY+KPyH3JAAcSOOBn9rQqi4TsUFjP9juX4R9vWdV+llvioUaWYg+OV0PuFRNYLnzH5y
         3uMmP2oARIVgVBudecdLunDG8ZWDA8Dr4z+FaiwRlTigNeKOhrnhVpZiq8ynchCf2rMf
         iB7xomzse/T+/VSEyp4RXs6eRF3nAaNW9grid1ir2FwB41pUsV+oFdxXmG1X43m0xyAB
         09oh2pRq3y88H7Io6MiztJZwTkiSAqp5mZDgjz2/0N5Q85RZ+Wi6FJlZ0A0wDbx0NaL+
         nm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=P7QJckYHfQwgitlIa4fG9VvM/7DgqgL5ob2UbtTxt+g=;
        b=ahNg9OymKIUqdgaXU0VPzVktR4gmJqmuVphTJFeFxFOyY43+/0ApcnahWZI38XE0qs
         moNI7UFJFVDB2nUPyRcJzCcictXgXSgtueVi9uXKMcjAUpD33AcyZq2nX45Gi8SLlaTd
         ltJza70qd/81hrq5UydXnrl6lrsQVJENeHFklGK+1QEWCu3VnqF0k8Jb7TSibJvesv0b
         GDuWk1EsREzMipxyPqPPtpynRuO9GcJcJ1ghGBu5o1L7TOTmRfsXq4VgrP087rMhAM+U
         bHiL7vjdd88RTyx68Wy7k9XvaowktifGp0MB2YvK9oJKt9PIWinNvnxn7kxiHuxK+GxA
         99Cg==
X-Gm-Message-State: ACgBeo1LUmPSefSmO8BMiA55NLSjjBy7PtMFzoEBy91X5DYQAA2r5fBq
	enoda/rSBB/8rbQUZ33/JllmfFu0SaMSOq1V3KhckEDBzoE=
X-Google-Smtp-Source: AA6agR7UWtA+s2qtZryD2Or2q9oVtlOm566IlOUwu9dQJoQJuRnmMrQ+EJuOdwhcqVqGpfuockZlK6Lm01yDZP8/nNQ=
X-Received: by 2002:a37:a80b:0:b0:6cb:dc5f:2ded with SMTP id
 r11-20020a37a80b000000b006cbdc5f2dedmr165175qke.320.1662623678848; Thu, 08
 Sep 2022 00:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <Yv8ezribLQbq5ggv@kili> <CAHp75VcotcJzqc4iSwNTKcvF3vAYz6VUuMrsj7LF6mi6Xu8D=Q@mail.gmail.com>
 <20220822125705.GD2695@kadam> <YxmSTH5ETSC0D3Rp@google.com>
In-Reply-To: <YxmSTH5ETSC0D3Rp@google.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 8 Sep 2022 10:54:02 +0300
Message-ID: <CAHp75Vc+fGiSw-CZ-A=2Apy7MeQ7W72-LZyCNN_LaxvpnAKAjA@mail.gmail.com>
Subject: Re: [PATCH] mfd: mt6370: add bounds checking to regmap_read/write functions
To: Lee Jones <lee@kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, ChiYuan Huang <cy_huang@richtek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, ChiaEn Wu <chiaen_wu@richtek.com>, 
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	kernel-janitors <kernel-janitors@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_005441_733680_3B35332E 
X-CRM114-Status: GOOD (  19.42  )
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

On Thu, Sep 8, 2022 at 9:57 AM Lee Jones <lee@kernel.org> wrote:
> On Mon, 22 Aug 2022, Dan Carpenter wrote:
> > On Fri, Aug 19, 2022 at 09:27:13AM +0300, Andy Shevchenko wrote:

...

> > I spent a long time looking at this code before I sent it and I've
> > spent a long time looking at it today.
> >
> > Smatch said that these values come from the user, but now it seems
> > less clear to me and I have rebuilt the DB so I don't have the same
> > information I was looking at earlier.
> >
> > So I can't see if these come from the user but neither can I find any
> > bounds checking.
>
> What's the consensus please?

From my point of view it's not needed, and we may fix it later when a
real problem happens / revised analysis done. But OTOH it is harmless,
if you think it worth applying. I have no objections to the way Dan
and you choose.

-- 
With Best Regards,
Andy Shevchenko

