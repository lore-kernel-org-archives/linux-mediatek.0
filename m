Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAC42C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 09:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WuH6Spu7kEGtr318jkaJLdpPHAfXuy0fjdcjIccyY4Y=; b=jU5HpFvJT38s5V
	eunLli1N4ANFGTyEgzfAAzcDjIyW77HVlPcptvf/zMw7MlOrQ7iLkjklOn8uxCtY1Q0ROCDBpG0/S
	BBJru4l5BsshSodMIeXrkF6la1dl+U6VZQeLUMftW2s1CL6A9SDGUfq87rTHeg0EpCN4+3EdV1903
	ATptKgPIoESp99WyHoMV59LK8YBOO2314ZeW3zUgGDXirardBH168hqOmXV5+Xa0Qy4eI0XDFxj9i
	2zHF5/ORkA8Q8RCRbbG4MKc1OIs+BySc1lgee+v+SoQ18EPAa009jvVLJ4q9juIxFRlXLqq6XJwJ2
	M9+icy3k2oP4A24Ns/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ7mM-00BaGt-2I; Tue, 29 Mar 2022 09:04:42 +0000
Received: from mail-qt1-f180.google.com ([209.85.160.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ7m7-00BaCg-Hz; Tue, 29 Mar 2022 09:04:28 +0000
Received: by mail-qt1-f180.google.com with SMTP id s11so14690288qtc.3;
 Tue, 29 Mar 2022 02:04:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7LLXUdiKn5zGolda6p6nU0L90Q8R5gkNG4kyWBHOgl4=;
 b=BsF7CrPUdzvdH7Ree8xyv/TBfmCxCvupTjY5RwBLO8axctk3JQQB22+3KpcuShkqW+
 rSHAzy45oA5yS1XrnhvqFzU5NsRNvgIX6sNqkM8oH+foNQ8Q3HUzRMIQvcfYuJq5EmCN
 0uDGD7aEhxqL5gzOgwh4e6Vf9zbQZXc9NCvHlH2c3ITwYLfEQAyQKefjBS3ZvXbGrA08
 uBQJXxAKZRIRfGx69hj/KsX4kStN21KnYRUpYwD89iqQR7RRrpESUxpGAFs1mJzkBmFZ
 Cw6ICcAUPq1DhUYDWozy6TN/5PVksIqpJ2abHuN3z1YgQwpkuKf8vZGegK17DVRetcxh
 JGcA==
X-Gm-Message-State: AOAM531u5x8Y+UxMSIDhwrP21IWmkqNVy1cppUnLd2D/zai621oMGruO
 6BMOlCioFYBDhXurxjUfDEFDf9L6KPq+WQ==
X-Google-Smtp-Source: ABdhPJzKUfBS9wwA2t5bSkI/jv9jjVcTtZn8Vg1KiZuQELGccecb9rhGRR/JpWgC5ZLZnMkERWQiYQ==
X-Received: by 2002:a05:622a:1d6:b0:2e2:db3:17c9 with SMTP id
 t22-20020a05622a01d600b002e20db317c9mr26036686qtw.665.1648544664574; 
 Tue, 29 Mar 2022 02:04:24 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com.
 [209.85.128.179]) by smtp.gmail.com with ESMTPSA id
 e20-20020ac84e54000000b002e06753cf70sm16162457qtw.6.2022.03.29.02.04.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Mar 2022 02:04:24 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-2e6ceb45174so136291607b3.8; 
 Tue, 29 Mar 2022 02:04:23 -0700 (PDT)
X-Received: by 2002:a81:24d6:0:b0:2e5:b253:f9fc with SMTP id
 k205-20020a8124d6000000b002e5b253f9fcmr30366724ywk.438.1648544663596; Tue, 29
 Mar 2022 02:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
 <YkK691VG6ON/6Ysn@atomide.com>
In-Reply-To: <YkK691VG6ON/6Ysn@atomide.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Mar 2022 11:04:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXDDNTgBdJTa8+H1H5v1gAarp07xxWu_E1JL8mXS8HPMg@mail.gmail.com>
Message-ID: <CAMuHMdXDDNTgBdJTa8+H1H5v1gAarp07xxWu_E1JL8mXS8HPMg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
To: Tony Lindgren <tony@atomide.com>
Cc: Daniel Palmer <daniel@0x0f.com>, Ansuel Smith <ansuelsmth@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 "open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-arm-kernel@axis.com, linux-aspeed@lists.ozlabs.org, 
 linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
 chrome-platform@lists.linux.dev, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, 
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com, 
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
 linux-tegra <linux-tegra@vger.kernel.org>, linux-oxnas@groups.io, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, linux-unisoc@lists.infradead.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 linux-realtek-soc@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_020427_642372_B712A560 
X-CRM114-Status: GOOD (  24.32  )
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

Hi Tony,

On Tue, Mar 29, 2022 at 10:03 AM Tony Lindgren <tony@atomide.com> wrote:
> * Daniel Palmer <daniel@0x0f.com> [220328 08:53]:
> > On Mon, 28 Mar 2022 at 09:09, Ansuel Smith <ansuelsmth@gmail.com> wrote:
> > > as the title say, the intention of this ""series"" is to finally categorize
> > > the ARM dts directory in subdirectory for each oem.
> >
> > While I agree with this change and think it's for the good (browsing
> > the ARM dts directory at the moment is frustrating..) I think
> > buildroot and others need to be told about this as it'll potentially
> > break their kernel build scripting for ARM and probably messes up the
> > configs they have for existing boards.
>
> Yeah.. And ideally this would be done in smaller steps as these will
> conflict with all the other pending patches.
>
> For example, I have a pile of pending omap clock clean-up dts patches
> posted and tested waiting for v5.19-rc1 to apply. I'd rather not start
> redoing or fixing up the patches with sed :)

Git merge/rebase/cherry-pick should handle renames fine?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
