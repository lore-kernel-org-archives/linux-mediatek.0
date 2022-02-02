Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1194FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Feb 2022 14:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NH9drm7/RY6yXSbQ0lO7kC9dHVN8InYUrZpVPu9G3cA=; b=dKYlDe7Uo2JyS6
	kHm/49xCJmySaAu1IDvEw5NjmVK/PB9tDo4c8Pf3nZaqTBdOi4LGNcP5wFij6nMcCrVW863cLCl7Y
	inZ9zFFAwW4gMxwIzFBfZj1vuJm0XM3NWAIGvd+PjmdIyN/X6BphBJVhTp9WLppsomv9G+pwOFFdR
	mLsU7X0+5LwT+iaKekeULOTVPKvLwsx/2oNpYD3VWI95ByWklrOpPoOfi4VBsNQrunjZLRz9kvfCn
	mmYURaz4bErUVS3EnB851zq6XzqGDii+GjdQCPuj3P+5T6Z8aJA8UKbSR8lAjNnBWTfd5EebVU/zE
	vCA+2Pd+8F43ikMRNQCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFGbW-00FgOS-Gi; Wed, 02 Feb 2022 14:27:26 +0000
Received: from mail-ua1-f48.google.com ([209.85.222.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFGaH-00Ffpo-33; Wed, 02 Feb 2022 14:26:10 +0000
Received: by mail-ua1-f48.google.com with SMTP id l1so19400950uap.8;
 Wed, 02 Feb 2022 06:26:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ad4RQzdAEV72aNypfbZ9YuoMVU2rEDrZVxH/YYvAS6A=;
 b=q7dIdI6Nn5xSBjPbkQbYf+flYtIOAutw6YN/to1TG/5MUbjImPfGu5JfCV5eVxgeLB
 YBPq2xg2WCeTkU5w0wrqkRztmz9Z4RvSucrd0Ze0S5Cuda7Ttrc8uOCoovNuSHIJb6rF
 CWyjS/1GMfiS1SRW5o1WNxfk9mW3EPS6E1mvCt2sobPOIED4DOMkcX19tc3mF6SrJ4mr
 EmcOhnAIm9JCRgUMsS85BpexOfSPXC5Ub+RSAc3Y/JzzlvBxYDWqqzFt/WynMTu6PX5x
 SqM2KXzVGLWZ110kTcsW1KYy6tgjfi+NpGeWZi7zKN0tog65EEmZkFbhzesvRl9xsr77
 XkDQ==
X-Gm-Message-State: AOAM533RBiajgBi3SuClKk1nnPo6/sT706TgkdiUMIP44oQ+d6fHgMvG
 Hv8dBSkVa3/xS90aD+dfXHnt7mCNkgw6Zg==
X-Google-Smtp-Source: ABdhPJwteHW0+17080wEZ8RhYuY5LUaxarCoX/Z51PmVCLq8xhIfILbZjEOfV6+nP9WaGg+50YdmGg==
X-Received: by 2002:a05:6130:315:: with SMTP id
 ay21mr14129405uab.49.1643811968095; 
 Wed, 02 Feb 2022 06:26:08 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com.
 [209.85.222.41])
 by smtp.gmail.com with ESMTPSA id k204sm6103739vkk.0.2022.02.02.06.26.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 06:26:07 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id n15so19448102uaq.5;
 Wed, 02 Feb 2022 06:26:06 -0800 (PST)
X-Received: by 2002:a67:fd63:: with SMTP id h3mr10854285vsa.77.1643811966714; 
 Wed, 02 Feb 2022 06:26:06 -0800 (PST)
MIME-Version: 1.0
References: <20220201120310.878267-1-maz@kernel.org>
 <20220201120310.878267-3-maz@kernel.org>
In-Reply-To: <20220201120310.878267-3-maz@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Feb 2022 15:25:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX7RqQPw=H2AzMPaCJDy_pFqhM30hpNN-G4-_HP2tx_WA@mail.gmail.com>
Message-ID: <CAMuHMdX7RqQPw=H2AzMPaCJDy_pFqhM30hpNN-G4-_HP2tx_WA@mail.gmail.com>
Subject: Re: [PATCH 02/12] irqchip/gic: Move PM device over to irq domain
To: Marc Zyngier <maz@kernel.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mediatek@lists.infradead.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Matthias Brugger <matthias.bgg@gmail.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, 
 Kevin Hilman <khilman@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Avi Fishman <avifishman70@gmail.com>, 
 Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
 Emil Renner Berthing <kernel@esmil.dk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_062609_198242_5A30DABA 
X-CRM114-Status: GOOD (  19.33  )
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

On Tue, Feb 1, 2022 at 1:16 PM Marc Zyngier <maz@kernel.org> wrote:
> Move the reference to the GIC device over to the irq domain.
> This allows for some localised cleanup.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
