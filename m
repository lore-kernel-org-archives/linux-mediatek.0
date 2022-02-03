Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F07BC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 07:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sJkOEpQMpkQjT3uYoEBuuVQ1c0rS7FdQmSssK4fadDY=; b=b15jlPTHqN7yZy
	dCoFCJZ1sDJLMkKAIpJ8a28yVjKFKMpvrEBxkWCh5fzTSbC4GgXklcY0PAfMBQPeBsXnkeWs/osHP
	P2PHWSRADO+lQVjQ+/85IOqhY79gocYXDo+3QWoDT9A3A1rS797pbxw/jzvAft1VJtGJv9Vdxl8g+
	n3kzgsVL4wS4apnD1OhNLfv6l8Kdt+ZJiSdpiLUIHcPvg9P+Y9wZDHOCb37MqTxsXiCp07quZlEFC
	tAqulQj/AD/6ACpqECXBhu7AYT9P1CMZS/ZSuBhGYwxI81SV17jLspKd0+USFJ6DQMGhqe5ExhT+Q
	U6oNyPgykBdO6+CYZLTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFWOH-000A4k-L2; Thu, 03 Feb 2022 07:18:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFWO5-000A0t-1K; Thu, 03 Feb 2022 07:18:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 119A7617C9;
 Thu,  3 Feb 2022 07:18:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70585C36AE3;
 Thu,  3 Feb 2022 07:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643872715;
 bh=5H5/k5olynjeqCdmMW5v7q2bRtXHy37Na6heaQilUwA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=A3qNuibCnfG1vzIEmqyA1hhMwUy4zY58OPEDKygk3LkVjTn35fJuNVWwdHkdcHJ1u
 9F33AuDoF6cF7U+xH5wKCd8fAW2RLw6+YqN3bw52bfUPfksoPyWh5uXA2to9CZ5Xar
 YR4bqATC9komeJpFQVwshHLcHUzqAgOf8I7rPndsvdgx/b+tgZu+xCsmBwJDm7c4Bu
 uKGCAsbsOJxBNGm+12+vfAeNEmuoytXLTrhFXYnwdiLY22EtVX20vgyyQjaLm02ELY
 JmnnYlNiBwVVw/B06++DPpK+YtgbqobFv8xU7S0cvsnlIHCk3AkGFQc1PmKyka0Vch
 pn72Kt3KU6rFw==
Received: by mail-wr1-f49.google.com with SMTP id v13so3103095wrv.10;
 Wed, 02 Feb 2022 23:18:35 -0800 (PST)
X-Gm-Message-State: AOAM532+ZPAXaH/AIGrsNN6KazD+uHbovQjf84wzHZHhHYxhYdHkTa07
 F8iJeFjw8uqrceXMWQ5O2goRgSL3YwHOIf2hrJs=
X-Google-Smtp-Source: ABdhPJyRCdrTnIbw1EbQEAwvRcn64WxftR6K+xurhn6IWOiTvTZn+f6oHgNzFyWKMIgR1DlwEhyWySVgzm4jWEghz1w=
X-Received: by 2002:a05:6000:144f:: with SMTP id
 v15mr29005306wrx.407.1643872713707; 
 Wed, 02 Feb 2022 23:18:33 -0800 (PST)
MIME-Version: 1.0
References: <6fc4a81f-1a13-bff9-7b2e-d5bec382cb42@synopsys.com>
 <9bab4777-3034-b789-fdf6-ca8d7e6a8c35@infradead.org>
 <CAOMZO5Aa4WxuadfoFGwwyYyD4UGPm-E258xTWU3-ozp_hwG-7g@mail.gmail.com>
 <d8981e2a-4f61-72bb-e5cc-bf4ded29c08a@synopsys.com>
 <CAK8P3a3ELrSC=KX6cr8UnP6kkJN0AXeAE4EG4oUY=Zz7gG_dgg@mail.gmail.com>
 <b44de208-6d5f-3fcd-0e36-f05745297747@synopsys.com>
In-Reply-To: <b44de208-6d5f-3fcd-0e36-f05745297747@synopsys.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 3 Feb 2022 08:18:17 +0100
X-Gmail-Original-Message-ID: <CAK8P3a27RtHxYwtj=rjxcDzkMdKhC-w9ho=SApHpczma_vU8JQ@mail.gmail.com>
Message-ID: <CAK8P3a27RtHxYwtj=rjxcDzkMdKhC-w9ho=SApHpczma_vU8JQ@mail.gmail.com>
Subject: Re: Kconfig CONFIG_FB dependency regression
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Fabio Estevam <festevam@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, 
 Kees Cook <keescook@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 John Youn <John.Youn@synopsys.com>, Bing Yuan <Bing.Yuan@synopsys.com>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220202_231837_207190_5D03BF53 
X-CRM114-Status: GOOD (  43.49  )
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

On Thu, Feb 3, 2022 at 12:55 AM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
> Arnd Bergmann wrote:
> > On Wed, Feb 2, 2022 at 1:14 AM Thinh Nguyen <Thinh.Nguyen@synopsys.com> wrote:
> >> Fabio Estevam wrote:
> >
> > CONFIG_FB should not normally be needed for booting, so unless
> > you have a graphical application in your initramfs that requires the /dev/fb0
> > device to work, it is not supposed to make a difference.
> >
>
> I'm not sure, but it seems like the setup we have isn't the only one
> that needed it. Fabio also noted that the imx_v6_v7_defconfig also needs
> to have CONFIG_FB set.

No, that one is different: the change for imx_v6_v7_defconfig was
done because they actually use a framebuffer console on some devices,
so the patch just adds the symbol to enable the drivers they are using.

This is expected with my original patch that doesn't implicitly enable
the framebuffer layer any more. What is not expected is for the kernel
to hang during boot as you reported for your unidentified platform.

> > Are there any other differences in your .config before and after the patch?
> > It's possible that you use some other driver that in turn depends on
> > CONFIG_FB. Does your machine have any graphical output device?
> > If yes, which driver do you use?
>
> I don't have the answer to those questions yet. Need more investigation.
> I'm new to this particular test setup.

Do you mean you don't know if there is a screen attached to the system?

> >
> > You may also want to make sure that you have 9d6366e743f3 ("drm:
> > fb_helper: improve CONFIG_FB dependency") in your kernel, which
> > fixes a minor problem with my original patch.
> >
>
> The issue also occurs in mainline, which has your minor fix commit
> above. The revert isn't clean for the latest kernel version. I also have
> to revert some of the changes along with CONFIG_FB. The revert looks
> more like this for the latest kernel:
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index b1f22e457fd0..7cbc733a8569 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -118,8 +118,9 @@ config DRM_DEBUG_MODESET_LOCK
>
>  config DRM_FBDEV_EMULATION
>         bool "Enable legacy fbdev support for your modesetting driver"
> -       depends on DRM_KMS_HELPER
> -       depends on FB=y || FB=DRM_KMS_HELPER
> +       depends on DRM
> +       select DRM_KMS_HELPER
> +       select FB
>         select FB_CFB_FILLRECT
>         select FB_CFB_COPYAREA
>         select FB_CFB_IMAGEBLIT
>
>
>
> I attached the configs for kernel v5.17-rc1. The "bad" config is without
> any revert, the "good" config is with the change above.

Looking at the config, I see that this is for an x86 machine,
and you have the FB_EFI driver and EFI_EARLYCON enabled.

What I suspec is going on is that you are looking at a screen rather
than a serial console, and the kernel doesn't actually hang but you
just don't see any more messages after the DRM driver takes
over from EFI_EARLYCON because there is no console driver.

In this case, what you see is the intended behavior, not a bug.
If you want a graphical console in your system, you need to
enable the support for this in your config.

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
