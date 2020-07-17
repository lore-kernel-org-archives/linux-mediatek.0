Return-Path: <SRS0=RXgq=A4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C6EC433E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 02:56:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F163521741
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2020 02:56:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BDS344du";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Zim79ws6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F163521741
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2FUIkUIVggpZIMnAxAsE7CFNvT65dEgQSidXpdrPKfs=; b=BDS344duU66p3MH//scdPzXQu
	rirG73t1ik+3Lwa2/Ym3MpQAx64ZqRDHo3nnG6/PVd7Icf0adTn+BDlXqUrhCkfHyv96+gKxcSkG3
	kBOJAC1/BbC8KipBpNKrLtiRORoarEwgSfpBZmDMka1rnRFDLh5RsTUMWtZBj+qvSvU5/9jjFUQvF
	ZGEVTlHnEgSKGdQwoGe6ZDMgmXwUDVAPyByPiXhWzBVjcKejq73DbGnvS4R8U6PCPbV03AUdzq9wf
	sIrNtWhjdAQYYqHr5ro0VZDyihkj2DWB+NP7ATzRtDln1gsyqnk1G86B47bYM/RgmMEY05e40ImBd
	qNZMhoPmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwGXv-0007JY-2t; Fri, 17 Jul 2020 02:56:23 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwGXt-0007Ik-0c
 for linux-mediatek@lists.infradead.org; Fri, 17 Jul 2020 02:56:21 +0000
Received: by mail-pj1-x1042.google.com with SMTP id ls15so5830035pjb.1
 for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2020 19:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8X8T8pz6At13CJCWKdkd4IkrZllcC3cL7n3XGkpoToo=;
 b=Zim79ws6Kq+0W4jp69vTApwxJi1ab1GZiZQmbPoc8ugOhcIoSw9LPZl0ztw2hGBqH1
 RKTDPHVJeM/qAS+KJdbxz7Jfxlu5ZwFIBaHVeX1uk8yLjjwI/qqF8/umOtCiA1fFvZrN
 4Mz1DgYnXqNWeRV+YbDi5KeqC2BsqGaa4DLXBB7nV8GDbekcrBrK36qc9L4AUuH/I2y7
 rJ8oSx9wMCp+IakhSKuK5+iyDQKabeC0JHx6OQBKCMdC3Rub/G2hu+RoZeqkEL/SOOQ4
 nIhE93A2nBDdvijxUUk5f0cNH6d7aqkqR/DWAHjgXuS2/jBKt2G39gjbPxdozOjKsL53
 Iwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8X8T8pz6At13CJCWKdkd4IkrZllcC3cL7n3XGkpoToo=;
 b=N3iIhC47PbFqW76F1x2Tm3/STdJa/cseVXe2OVoKVQoBkKDnvV2zwBfbTUc9POe4fF
 d26CQWdvPxfyklEgc5r80e8JE++hvv5wifViiLFsah/S7rfIKfsrRkDHX+PTGT+YTBxK
 lRk2PtuG1syAKpzqk1XZ0uIP8Cg08DXdmy2ReIJjH248Tc7Qbv7/+QrvSeegTi+ZKjQK
 Xs7s5uO+pCySAN0rhFKJm7Blt/3D+yWor1pSKTD4yauK/F7xL8gdkP+ceF/PA29S6wmk
 f/U9CwXR/PGpjMTSLGxnPeNPsuvTaJXU6zo1O5U1+fNO02OhwyiuS+1LzBAiS12y6K6V
 p2fQ==
X-Gm-Message-State: AOAM530MpluvilqZs6SJj6PzBXpukjxMz1gr5cBRUvBZNuHhnaGex/gm
 34x3QQH8LNCb8zqat46W6nGFXBxVPB0PUsI+VqnJ+A==
X-Google-Smtp-Source: ABdhPJyZ06nWdGCY8udX+H9WVLsopOuNsRhvU02zYFga6C7Wo1f6074+kEATFxvtpKfRKQE0LABLbsIy3/c1apoANY4=
X-Received: by 2002:a17:902:b706:: with SMTP id
 d6mr5977536pls.244.1594954576802; 
 Thu, 16 Jul 2020 19:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <1592483471-14806-1-git-send-email-hanks.chen@mediatek.com>
 <f47e8a1e70c982ecf6245db573630f51@kernel.org>
 <1592490123.10773.16.camel@mtkswgap22>
 <1592894173.10773.42.camel@mtkswgap22>
 <3dc953265ed4cd4300bd9600bf7e33d6@kernel.org>
In-Reply-To: <3dc953265ed4cd4300bd9600bf7e33d6@kernel.org>
From: Saravana Kannan <saravanak@google.com>
Date: Thu, 16 Jul 2020 19:55:41 -0700
Message-ID: <CAGETcx-daJxJ=Werw9fkmWHz=iUq1S-S63fz8KaKB4S-D+0oZA@mail.gmail.com>
Subject: Re: [PATCH 1/1] irqchip: Add config MTK_SYSIRQ and MTK_CIRQ
To: Marc Zyngier <maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_225621_108097_2C2E5432 
X-CRM114-Status: GOOD (  18.69  )
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
Cc: CC Hwang <cc.hwang@mediatek.com>, Jason Cooper <jason@lakedaemon.net>,
 wsd_upstream@mediatek.com, Hanks Chen <hanks.chen@mediatek.com>,
 Loda Chou <loda.chou@mediatek.com>, LKML <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jun 23, 2020 at 1:37 AM Marc Zyngier <maz@kernel.org> wrote:
>
> + Saravana
>
> On 2020-06-23 07:36, Hanks Chen wrote:
>
> [...]
>
> > Hi Marc,
> >
> > I want to break the dependency between ARCH_MEDIATEK and CIRQ/SYSIRQ,
> > because we need to follow the GKI.
>
> This isn't what GKI mandates. GKI requires that the SoC code is compiled
> as modules, not that it is dissociated from its platform (which would
> be completely pointless).
>
> > Could I add the MTK_CIRQ and MTK_SYSIRQ into defconfig?
> > (arch/arm64/config/defconfig)
>
> I don't deal with defconfig at all. That's a patch for the arm-soc
> people.
>
> >
> > It would ensures all platform are executable.
> >
> > e.g.
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> >
> >  CONFIG_QCOM_PDC=y
> > +CONFIG_MTK_SYSIRQ=m
> > +CONFIG_MTK_CIRQ=y
> >  CONFIG_RESET_QCOM_AOSS=y
> >
> > --- a/drivers/irqchip/Kconfig
> > +++ b/drivers/irqchip/Kconfig
> > @@ -572,4 +572,18 @@ config LOONGSON_PCH_MSI
> >         help
> >           Support for the Loongson PCH MSI Controller.
> >
> > +config MTK_SYSIRQ
> > +       tristate "Mediatek interrupt polarity controller"
> > +       depends on ARCH_MEDIATEK || COMPILE_TEST
> > +       help
> > +         Interrupt polarity controller driver to swap polarity for
> > +         interrupts for Mediatek mobile chips.
> > +
> > +config MTK_CIRQ
> > +       bool "Mediatek low-power interrupt controller"
> > +       depends on ARCH_MEDIATEK || COMPILE_TEST
> > +       help
> > +         Low-power interrupt controller driver to monitor IRQS
> > +         in the sleep mode for Mediatek mobile chips.
> > +
> >
> >
> > P.S I'll make the irq-mtk-sysirq driver as a loadable kernel module for
> > GKI
>
> You might as well turn both drivers into modules. Saravana was working
> on a set of patches to ease this transition.

Sent out v2 of that patch now.
https://lore.kernel.org/lkml/20200717024447.3128361-1-saravanak@google.com/T/#u

-Saravana

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
