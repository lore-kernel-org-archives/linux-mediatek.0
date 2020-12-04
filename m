Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581A0C4361A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 14:15:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E96FB22B2D
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 14:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E96FB22B2D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xF7p9pK41/UIIyRLbgshaXawcJUlswfpzTM3QuF9u5k=; b=hVmtQm+U5wS62/fp9RMUzPjcf
	x7GiK+XpQxrramsuPTg4P8F/w8AHNl7Y5zlITF+7EbBDnX8LWoEdzuJPuHTBTB6tRmr2A8OyxK/72
	eGNmc7IZI6puTBIx/KTwBa7KuNcNWTfZWfkMrgUOhnqik8enYGc0e+DFlmyQbW3KpqvY+74tUexmp
	9jy8k1HN1Ele3Uos0cKHaMF6eOduoc0nZLrbJmEYeWL6WctTsPKQe8D/Mh9Ql7KFU6D4boDYlkpPe
	P6LV3hOor7jNydYQTWqup+YQkke2EPDomw+Prgmw/kK5q65TRAGdn5Jj/Dzj/aPnauPBCE/GxgBqx
	wydNszGPg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klBrI-00031i-Az; Fri, 04 Dec 2020 14:14:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klBrD-0002zg-1l; Fri, 04 Dec 2020 14:14:47 +0000
X-Gm-Message-State: AOAM530URKxVtwJPva1cWZAE7n1R+V3DNrVebsjnvBO9z2Y9Te0jzruV
 qt956joW3tGfKdYm9w0faVzglBcgA6V3UD4225w=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607091286;
 bh=tIDO5wu/h3iugtm6EuT3IRty5Sei5IsCyw0gw/9uM+A=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Z3/sbcYVvUTJhWMSd3RYaU/IetceyoHh8ACdVYKbFy5NldapW4wpCViXJZ/YUYB8n
 Qq1dpciIgustxCId64mgd/El0x6cxxRZrdl+dtocwQLTB1+mK5Yx6/GKFj8La1ID3Q
 rMODFaN56hG8zvZ0QzVISrqZtl2s9Sc+SMgucZyZHU6xJDUyigSA8ATxdvd3oVao5l
 C0KLe1iq06GClkP5k/R/SkU4340LLAGK/3wl2Rbn63wnAAvPWnCXdYEcLx1hk/U165
 mQCZNHGeFfssOVzv7plny26VNZfzxBdxlFq4wRhBCXJkXq+5KbMI9rHInJLteqEKfj
 x+5uCHJphKxaw==
X-Google-Smtp-Source: ABdhPJwxym/mU9bR1admW/kOH0JVRSYw6YjCWCAcHxsvuVRLLDVdF2nlbFSj4oIRatquO+QNtEj4N/04EluuruTGCBQ=
X-Received: by 2002:a9d:6317:: with SMTP id q23mr3785791otk.251.1607091285516; 
 Fri, 04 Dec 2020 06:14:45 -0800 (PST)
MIME-Version: 1.0
References: <20201203222922.1067522-1-arnd@kernel.org>
 <CAPDyKFqtFYqc8i_fVzOUnuZGJjtwjVLqE-vebtOKuYJ-4PrDBg@mail.gmail.com>
In-Reply-To: <CAPDyKFqtFYqc8i_fVzOUnuZGJjtwjVLqE-vebtOKuYJ-4PrDBg@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 4 Dec 2020 15:14:29 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3srmTdY69j+g-wazMkrTL8_Grsw=vCMyizyA_7oOC4tg@mail.gmail.com>
Message-ID: <CAK8P3a3srmTdY69j+g-wazMkrTL8_Grsw=vCMyizyA_7oOC4tg@mail.gmail.com>
Subject: Re: [PATCH] mmc: mediatek: mark PM functions as __maybe_unused
To: Ulf Hansson <ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_091447_159767_41EA2439 
X-CRM114-Status: GOOD (  15.16  )
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
Cc: Marek Vasut <marex@denx.de>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 Chun-Hung Wu <chun-hung.wu@mediatek.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 yong mao <yong.mao@mediatek.com>, Paul Cercueil <paul@crapouillou.net>,
 Amey Narkhede <ameynarkhede03@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Dec 4, 2020 at 11:02 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Thu, 3 Dec 2020 at 23:29, Arnd Bergmann <arnd@kernel.org> wrote:

> > -#ifdef CONFIG_PM
> >  static void msdc_save_reg(struct msdc_host *host)
>
> Shouldn't msdc_save|restore_reg() be turned into "__maybe_unused" as well?

There is no need since the compiler can figure that out already when there
is a reference to the function from dead code.

> >
> > -static int msdc_resume(struct device *dev)
> > +static int __maybe_unused msdc_resume(struct device *dev)
> >  {
> >         return pm_runtime_force_resume(dev);
> >  }
> > -#endif
> >
> >  static const struct dev_pm_ops msdc_dev_pm_ops = {
>
> You may also change this to a __maybe_unused, as long as you also
> assign the .pm pointer in the mt_msdc_driver with
> pm_ptr(&msdc_dev_pm_ops).
>
> Ideally the compiler should drop these functions/datas entirely then.

I don't see a lot of other instances of that yet, and it's fairly new.
Maybe we should fix it before it gets propagated further.

I would suggest we redefine pm_ptr like

#define pm_ptr(_ptr) (IS_ENABLED(CONFIG_PM) ? (_ptr) : NULL)

and remove the __maybe_unused annotations on those that we
already have. This also has the effect of dropping the unused
data from the object, but without having to an an #ifdef or
__maybe_unused.

Adding Paul and Rafael to Cc for clarification on this.

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
