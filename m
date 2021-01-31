Return-Path: <SRS0=AqdA=HC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64514C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 22:23:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FFD364DFA
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 Jan 2021 22:23:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FFD364DFA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TeT8GrfVUBt7eeZyfP1+z/Op4kJ+xEBEoxWmfm2ydWY=; b=onDHkb11u4dCBO/mJLvOHX6BB
	4zWyFrzLsaWQCqm8KJ4IDjy0zUYrwYj+wpvAYs5atmDWCUHwmnJDEA43IwllP85CcY5dzJIcZRymy
	fGBHCCcO9rQTFSUO+SmmyZ5AFvvMdLy0XaUXEQkZYHUc8hzuSZkKPjx1nnUnfJlRvT3rzjka66xYg
	dc+B5rbvHy9Ph6PAGjsJVsKGU4wMTqnFGuJ3cAZO/uc735B+i8msV2lJi9tSJz8XVK0/vcWOYH14r
	Bd1A7ROv84hNS9elOUA9h/t13F+D0LxcT1eMspC8wv5Xi3n/kLd1XCxSPc9U9i8bUMHIDgc3Z4YZL
	K6nYCh8RA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6L88-0002Fk-7d; Sun, 31 Jan 2021 22:23:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6L84-0002ED-BZ; Sun, 31 Jan 2021 22:23:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE09564E2A;
 Sun, 31 Jan 2021 22:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612131814;
 bh=1zFi1O/OfYRPJDpm+YetAkissf3owl4zMydwrZGKhtA=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=c/SetFTgjDQen2386CJ8OpClyi1IQL+o1fM0exttg7g76Edj/2OnTgpANm4CGLIoU
 9AUmk+fosA9M5z2V5SWEmOYhl/ALjJ8FJhdulR7cbUe2vxnbWWT1DPcjMRlxbYQ3k2
 AxqjNQhSD0IJMXro4+G+3EVrC4QNsSqtHfZzH3fBZV7EwxBTnxbKq5kifeBagRy8IP
 EHml06Cl256UCTYXiDCsQ0i8ILsdV8Z4qaGVWgy2HSKpbNi3cZcHLUd37F1qWEaZFO
 f7hlxApr48faFQaEUCwS6htTA2BKKO2G1dSqNLJnjJwfH1mewrWC3mLMlXpbQPEKVn
 zQQz4Ieb7Utaw==
Received: by mail-oo1-f54.google.com with SMTP id g46so3774424ooi.9;
 Sun, 31 Jan 2021 14:23:33 -0800 (PST)
X-Gm-Message-State: AOAM533WEuuG2w5UN3T5iMsO1J4JhGvKExhVJ+wlGvu9Lan7QA60ASai
 3IOrQScYSGrL/RM43fmGsJMZ5juofu/2PbrxTXs=
X-Google-Smtp-Source: ABdhPJzJdLOj/vjVeCo4tCU0t8VtADnGPEnXFXXeUhxRbWkkiD6RvXIuBjxJ2kZqzBEd/nUmDyfOMYGYA4dCL0LKoBk=
X-Received: by 2002:a4a:870c:: with SMTP id z12mr3228398ooh.15.1612131813154; 
 Sun, 31 Jan 2021 14:23:33 -0800 (PST)
MIME-Version: 1.0
References: <1608713092-26952-1-git-send-email-neal.liu@mediatek.com>
 <1608713092-26952-3-git-send-email-neal.liu@mediatek.com>
 <68442164-d649-aee0-cfe8-c9ebb868612d@gmail.com>
In-Reply-To: <68442164-d649-aee0-cfe8-c9ebb868612d@gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 31 Jan 2021 23:23:17 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1DLX6y5GM3O7+T0gMH_JLRp6nUkHFZc4Shjn_bTKWWSw@mail.gmail.com>
Message-ID: <CAK8P3a1DLX6y5GM3O7+T0gMH_JLRp6nUkHFZc4Shjn_bTKWWSw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] arm64: configs: Support DEVAPC on MediaTek
 platforms
To: Matthias Brugger <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_172336_501785_543F0578 
X-CRM114-Status: GOOD (  18.23  )
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
List-Id: <soc.lore.kernel.org>
Cc: DTML <devicetree@vger.kernel.org>, wsd_upstream <wsd_upstream@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Hanks Chen <Hanks.Chen@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Neal Liu <neal.liu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Will Deacon <will@kernel.org>,
 Jackson-kt Chang <Jackson-kt.Chang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jan 31, 2021 at 3:07 PM Matthias Brugger <matthias.bgg@gmail.com> wrote:
> On 23/12/2020 09:44, Neal Liu wrote:
> > Support DEVAPC on MediaTek platforms by enabling CONFIG_MTK_DEVAPC.
> >
> > Signed-off-by: Neal Liu <neal.liu@mediatek.com>
> > ---
> >  arch/arm64/configs/defconfig |    1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index 17a2df6..a373776 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -257,6 +257,7 @@ CONFIG_MTD_NAND_MARVELL=y
> >  CONFIG_MTD_NAND_FSL_IFC=y
> >  CONFIG_MTD_NAND_QCOM=y
> >  CONFIG_MTD_SPI_NOR=y
> > +CONFIG_MTK_DEVAPC=m
> >  CONFIG_SPI_CADENCE_QUADSPI=y
> >  CONFIG_BLK_DEV_LOOP=y
> >  CONFIG_BLK_DEV_NBD=m
> >
>
> From my understanding, defconfig is for a minimal config that allows to boot a
> machine. As MTK_DEVAPC is a rather exotic driver to detect bus access
> violations, I think it's not a good candidate for inclusion in defconfig.
>
> In any case, I added the SoC maintainer, so that they can correct me, if I'm
> wrong :)

I generally don't mind adding platform specific drivers as loadable modules
even if they are somewhat obscure. For built-in drivers, this is
different though,
as those have a noticeable impact on other platforms.

I haven't kept track of what this particular driver does, but from the Kconfig
description, I'd say it should get enabled in defconfig.

        Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
