Return-Path: <SRS0=XaoX=OK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F344EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 12:55:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1B8A610A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 12:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1B8A610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jOAvYRhlTkKPfpcZlQaWOqMRXr/GXaIClM/5NfdhlM4=; b=EB/KamIns+7l9s
	/yjChQJFe1/t7D59DD0vk71n9JSGyjoC1u40KIn84n6EzuHEtRxPmtIsrKXTnEwAQq6VtM3ZFvbte
	FjI9Acv1qULuwGIeF5im20H7vMqaQnpoEpI1teQoiBsz4DHMusCSJwW/sFJXwDRl6QfuvHE6VaCFA
	1SbZBpu7pKPetihyAyqvKkm5FQW+Ry4atTzGQLQ1OylyIZezpl3w4UnuCuCe0IpYhy8PNrOqXN7wi
	tsVwbcqUg2+jfj5LXzZ2EjnVp/aL+q6dQS00wMTTo8r2TYaYVPI22spvcUk1ZUxYZh07s01GPHKUD
	sI986NMOdJB5FV2mW69Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSIov-001gKL-OI; Mon, 20 Sep 2021 12:54:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSIo4-001fvy-11; Mon, 20 Sep 2021 12:54:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A6C8E610A0;
 Mon, 20 Sep 2021 12:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632142439;
 bh=W1eYMmg9H2jFhknPdndD+apjfXD08+jcBBvof7g6zWw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=S7MJFsqD329nVxBkT3qwZRjVziZdooDG/bJRPvx0Q9Iq3SPPXzDGYDb+9aSViTfS7
 7SXCE6oiiFvWGI+1XYBiwps+OZoeEXZIVulXjF6zI1a3BuzLgVGtJLEgGRRFi4k5H2
 wvf4P7hbXWrcNIXiU0FL940HN90ryprb+4Qv/w6MUY8kItqxzd0k2iinbx7TW6g/pb
 4vYAIGMdwbagWgjGpjWTACn0kkA7eDZvVyg1RshPDqgPee6wuvkwNPJw6jSywFuxJr
 LymfjSSgslnzgDwl8eoxu99g5NOfpmNw3DU+7VJczwV4sQRaLkvE+6qxI3gHS76Fv2
 q2S9mgfzC/0vQ==
Received: by mail-wr1-f54.google.com with SMTP id q11so29384402wrr.9;
 Mon, 20 Sep 2021 05:53:59 -0700 (PDT)
X-Gm-Message-State: AOAM5302EeXZBvDZAp7QbJf8C110qpAwIyilt/WvR0DjHFFiBrmjRaxs
 G++Sc9w42roqJRFhGgnKt9korWMo0uekr2ScyVY=
X-Google-Smtp-Source: ABdhPJwgSLeOA+5EYUZWyMXPW6vc2urD0vjnW6PXs7wvXSXhdxd/LtmNdjYm/cajU/C5Q3kNTl/tQUp6tjS8FOlAVrE=
X-Received: by 2002:a1c:4c14:: with SMTP id z20mr29348860wmf.82.1632142438279; 
 Mon, 20 Sep 2021 05:53:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210920100206.1418649-1-arnd@kernel.org>
 <20210920123542.GA14852@sirena.org.uk>
In-Reply-To: <20210920123542.GA14852@sirena.org.uk>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 20 Sep 2021 14:53:42 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0uz0Uy1p1Ku9_rqwgh0hnEhWrDqxzgd9cU4Dcd++TMMQ@mail.gmail.com>
Message-ID: <CAK8P3a0uz0Uy1p1Ku9_rqwgh0hnEhWrDqxzgd9cU4Dcd++TMMQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: force COMMON_CLK dependency
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Trevor Wu <trevor.wu@mediatek.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>, 
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Tzung-Bi Shih <tzungbi@google.com>, 
 ALSA Development Mailing List <alsa-devel@alsa-project.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_055400_123339_CA7B5935 
X-CRM114-Status: GOOD (  10.73  )
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

On Mon, Sep 20, 2021 at 2:35 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Sep 20, 2021 at 12:01:58PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Without CONFIG_COMMON_CLK, this driver fails to link:
> >
> > ERROR: modpost: "clk_unregister_gate" [sound/soc/mediatek/mt8195/snd-soc-mt8195-afe.ko] undefined!
> > ERROR: modpost: "clk_register_gate" [sound/soc/mediatek/mt8195/snd-soc-mt8195-afe.ko] undefined!
>
> This doesn't apply against current code, please check and resend.

It's already fixed the way that Geert suggested in your asoc/for-5.15,
sorry for the dup.

        Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
