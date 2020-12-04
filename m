Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B154C4361A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 14:55:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D999522B2D
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 14:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D999522B2D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h1fLY3eCkZR6hSyBJYrS/+NPLFUTfpS9SSqUWkAEUoU=; b=ry33DP063E+LnGjSMa5BLrJwD
	QHdKj18o0MeJR2RLv3RHZyoeebbCi8dAQaCuO0qNZztTWDD2zld5SuUyPGt8NmJGbTm/wrkQuSvTf
	UoGBLLTZFCQjDHKV2sAUO3NlyBuvZrWsYUi4Y/8p2oJGVczVFflTs2sqhDimTUmVXc6an6NpMSiK7
	O8rljEWzskfAVRDQ4SO1tNd6LPDeLxFwP+U88BRcm8E71qDRs3Wn+LycYFeBaJlF6UyITTEIxJcmk
	s6GimuB5vvoCr+ZB0IZyYYz01HqRToMVmhl54EYcmhT0p5d/wOQfyuVraQ7HtVUlD34sSlU+VBxOz
	tQtVwya4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klCUa-0008Vj-4l; Fri, 04 Dec 2020 14:55:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klCUV-0008Ur-2E; Fri, 04 Dec 2020 14:55:24 +0000
X-Gm-Message-State: AOAM532xA5b1QtxeQqPIrIhQDnUien82nKS6re+zaBZE53tKIaFMZiH6
 cxTsZnqbInLDdDIVde94SaUEjAT7jS6mELxHyyE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607093722;
 bh=qGUZ+1dL4G4WyrQWUkYKJEc8DutOEdYhYFuupUNzlyk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=A1dP7j+7Iu93950O3626NFqdsC0LKQdwiXFyBli4wzqASDhZy9+IXMpZKsGuDoDY6
 mdzabAv0QxoMk3lQd/Kwn15V3G6aUqUQ+a+nlhaaoEzJktP5+fAT/niQkLYKj9mvqF
 y7QCZohJuHfZGZAPXwTpFp+D35yCRj5VljQR3TqjvqguAswaxNTHoz1EKBl6CqGe60
 JjUi4oH8kYsK9kdntbO0cceE1FjdR3eKtkyF8AE3YvARoSANS6brW6ignZ9LPHNhtb
 fcVAm05ZwauaDLTXgD0vn2kXvF5KzlSqE6QPtvt5aC2DcH3NfFnSokytxYGRGL0zeg
 x3GricqBEeyug==
X-Google-Smtp-Source: ABdhPJxosiEcP3n8aXD6Ztpyp2agBQbOVGOw9SFaLMj/+6lrSftY4Ms6n1Z/TqYNWm3jQWaDwMiFp86WazgYRXqrNXQ=
X-Received: by 2002:a05:6808:9a9:: with SMTP id e9mr3493815oig.4.1607093721297; 
 Fri, 04 Dec 2020 06:55:21 -0800 (PST)
MIME-Version: 1.0
References: <20201203222922.1067522-1-arnd@kernel.org>
 <CAPDyKFqtFYqc8i_fVzOUnuZGJjtwjVLqE-vebtOKuYJ-4PrDBg@mail.gmail.com>
 <CAK8P3a3srmTdY69j+g-wazMkrTL8_Grsw=vCMyizyA_7oOC4tg@mail.gmail.com>
 <CAPDyKFqS5touMvORyovCS-QQrHZg+0LGob9DtS1m61quvXYezw@mail.gmail.com>
In-Reply-To: <CAPDyKFqS5touMvORyovCS-QQrHZg+0LGob9DtS1m61quvXYezw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 4 Dec 2020 15:55:05 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0PvxT3B+4WYmbarLPY_uHbKL_z5Jd7WU=PZ79QXjtwOw@mail.gmail.com>
Message-ID: <CAK8P3a0PvxT3B+4WYmbarLPY_uHbKL_z5Jd7WU=PZ79QXjtwOw@mail.gmail.com>
Subject: Re: [PATCH] mmc: mediatek: mark PM functions as __maybe_unused
To: Ulf Hansson <ulf.hansson@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_095523_248151_B10E3509 
X-CRM114-Status: GOOD (  18.80  )
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

On Fri, Dec 4, 2020 at 3:38 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
.
> >
> > I don't see a lot of other instances of that yet, and it's fairly new.
> > Maybe we should fix it before it gets propagated further.
> >
> > I would suggest we redefine pm_ptr like
> >
> > #define pm_ptr(_ptr) (IS_ENABLED(CONFIG_PM) ? (_ptr) : NULL)
>
> Why is this better than the original definition?

It tells the compiler that the _ptr is referenced from here, so it does
not warn about an unused symbol, but at the same time it still
knows that it can discard it along with the functions referenced by
it and should not emit any of that output.

> > and remove the __maybe_unused annotations on those that we
> > already have. This also has the effect of dropping the unused
> > data from the object, but without having to an an #ifdef or
> > __maybe_unused.
>
> I didn't quite get this (sorry it's Friday afternoon... getting
> tired), can you perhaps give a concrete example?

These work:

a)
static const struct dev_pm_ops __maybe_unused ops = { ... };
...
      .ops = &ops,
...

b)
static const struct dev_pm_ops ops = { ... };
...
      .ops = &ops,
...

c)
#ifdef CONFIG_PM
static const struct dev_pm_ops ops = { ... };
#endif
...
#ifdef CONFIG_PM
     .ops = ops,
#endif
...

d)
static const struct dev_pm_ops __maybe_unused ops = { ... };
...
#ifdef CONFIG_PM
     .ops = ops,
#endif
...

e)
static const struct dev_pm_ops ops = { ... };
...
     .ops = IS_ENABLED(CONFIG_PM) ? ops : NULL,
...

But these do not work:

f)
#ifdef CONFIG_PM
static const struct dev_pm_ops ops = { ... };
#endif
...
/* error: missing declaration for ops */
     .ops = IS_ENABLED(CONFIG_PM) ? ops : NULL,
...

g)
static struct dev_pm_ops ops = { ... };
...
/* warning: unused variable */
#ifndef CONFIG_PM
     .ops = NULL,
#else
    .ops = ops,
#endif
...

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
