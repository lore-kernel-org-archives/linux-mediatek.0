Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23807C4361A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 14:39:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C36EC22571
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 14:39:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C36EC22571
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KsQfLWmEBfUwvCnXvPcmNtme0h2S9WhMdQ4HdRz5nBc=; b=hHVaes8P87q1wWnGrSMLwJQ8i
	U+Dx8AOdQcboBNRTMfGuDeRcYNL1PzXdP4/ItMCG8u00BR0efdf9sQRcqaY19PWO0F7HebzfGAs77
	nkhZ2lZf88gN3lFjWtM66lKMhDOggDkNtleTMZzbXvdSUL0l/52cJh5LmMpCbYBGY7BeScCQdgh8O
	NIjtVRXVHJaq0AJL3Jfgmre/IAVGegAfWSsaKVtAlWDIZMFpXdq9L2Cf8DfXc69GLk3Yrcw2b3oNF
	QhqdaYobACJhoZNVKFL4rtHk9H8zA9LcFodRzXOIb0NuSBXRsts+4te8x3OnOc/qQ+5iMPAHNA+pI
	l8fjwzq7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klCFF-0006Ta-7Y; Fri, 04 Dec 2020 14:39:37 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klCF9-0006RJ-Bd
 for linux-mediatek@lists.infradead.org; Fri, 04 Dec 2020 14:39:32 +0000
Received: by mail-lj1-x242.google.com with SMTP id r18so6901149ljc.2
 for <linux-mediatek@lists.infradead.org>; Fri, 04 Dec 2020 06:39:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6sWIE6MSVnFN2Z1SFZ8QW/N7guFxVpjF1mW79UulhJs=;
 b=RfcUNAfKbPRmMKo7OcV+vcKhf8gkhXXWbgOjRQECyb79B5Kr8J55uu34UsLfxxUPom
 7NEJDhsiYI7XXFxNqQi/41lLal9d1LYqnr2vQSWhl3ZGT+woctsjPXr9Xr09HeUYzwTH
 4sYKrvzexNplNWsyr+AQys2/4I7jeyHKWANdgJPA6jBiijImp0602h+mSteHCWlDfmdQ
 YXwBsfYJFRRA/jFkwq66l0qkO33EWCS+8WPE3EkBo2bnFfj2+Uqy0cJgUfub/OsjLexQ
 u9GN3Y0hEQuLeV1vRg2wJQtiSAp8QqgrVOF0XuFxzBGyVyWGORmIgknoFXE6kB3bnUWZ
 7dZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6sWIE6MSVnFN2Z1SFZ8QW/N7guFxVpjF1mW79UulhJs=;
 b=t5LQywMEpoEAUyTgHxRMt/v7NmDfhcXqwnIkQV1y2WcGikQNkM1M2iDJv0uVQmNwD0
 yjF+eNH2nCeH0fyopCnkEEzE+84vABBqpzt3yggPVqkPQ9+jlrNCrj28S+tuZF1DlgYt
 /X1rjMBB4e/C6ublKau81guAKgMyWBxqCORnRgia/SzSbe6i7TUeSKnXgiq/36vqt+Ci
 ROVHzJ8Mrbkl0BLSTyOBc8OK+6kacgfMx4ha3Ism97Yb7RgOdbopTk6fjBkz7M+uLLvP
 TYKJEwqbEa80a6LSHM/evFYXyM3dNIglofDGMqN2GysIRRjacaogYfhpW+3omPmGNNZi
 OYmA==
X-Gm-Message-State: AOAM530gVK9Uhbn60xJFgT3p79hXBxlzl8vyBB1IPwTefM0c6VxvUw0Z
 8dAve6ocdJX8t2sU9RgENJsbJZRDuXkJg4gu4J1g8g==
X-Google-Smtp-Source: ABdhPJyskVYAzDS48JDvWbmfiXfOC8BuBYtUHBD5BXTQ5EFVNcQqiqycMB0UDj7GVEp894YzQizdbfY9OTD5WfpyvaY=
X-Received: by 2002:a2e:3608:: with SMTP id d8mr3697375lja.68.1607092769314;
 Fri, 04 Dec 2020 06:39:29 -0800 (PST)
MIME-Version: 1.0
References: <20201203222922.1067522-1-arnd@kernel.org>
 <CAPDyKFqtFYqc8i_fVzOUnuZGJjtwjVLqE-vebtOKuYJ-4PrDBg@mail.gmail.com>
 <CAK8P3a3srmTdY69j+g-wazMkrTL8_Grsw=vCMyizyA_7oOC4tg@mail.gmail.com>
In-Reply-To: <CAK8P3a3srmTdY69j+g-wazMkrTL8_Grsw=vCMyizyA_7oOC4tg@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 4 Dec 2020 15:38:49 +0100
Message-ID: <CAPDyKFqS5touMvORyovCS-QQrHZg+0LGob9DtS1m61quvXYezw@mail.gmail.com>
Subject: Re: [PATCH] mmc: mediatek: mark PM functions as __maybe_unused
To: Arnd Bergmann <arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_093931_454052_FDFC4B9F 
X-CRM114-Status: GOOD (  22.76  )
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

On Fri, 4 Dec 2020 at 15:14, Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Fri, Dec 4, 2020 at 11:02 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > On Thu, 3 Dec 2020 at 23:29, Arnd Bergmann <arnd@kernel.org> wrote:
>
> > > -#ifdef CONFIG_PM
> > >  static void msdc_save_reg(struct msdc_host *host)
> >
> > Shouldn't msdc_save|restore_reg() be turned into "__maybe_unused" as well?
>
> There is no need since the compiler can figure that out already when there
> is a reference to the function from dead code.

Alright, thanks for clarifying.

>
> > >
> > > -static int msdc_resume(struct device *dev)
> > > +static int __maybe_unused msdc_resume(struct device *dev)
> > >  {
> > >         return pm_runtime_force_resume(dev);
> > >  }
> > > -#endif
> > >
> > >  static const struct dev_pm_ops msdc_dev_pm_ops = {
> >
> > You may also change this to a __maybe_unused, as long as you also
> > assign the .pm pointer in the mt_msdc_driver with
> > pm_ptr(&msdc_dev_pm_ops).
> >
> > Ideally the compiler should drop these functions/datas entirely then.
>
> I don't see a lot of other instances of that yet, and it's fairly new.
> Maybe we should fix it before it gets propagated further.
>
> I would suggest we redefine pm_ptr like
>
> #define pm_ptr(_ptr) (IS_ENABLED(CONFIG_PM) ? (_ptr) : NULL)

Why is this better than the original definition?

>
> and remove the __maybe_unused annotations on those that we
> already have. This also has the effect of dropping the unused
> data from the object, but without having to an an #ifdef or
> __maybe_unused.

I didn't quite get this (sorry it's Friday afternoon... getting
tired), can you perhaps give a concrete example?

That said, I have applied your patch for fixes, but let's try to sort
out the above to make sure we are all on the same page.

Kind regards
Uffe

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
