Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F088C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 09:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mbBgxU/nrdTQ7UHrmW/WCAfYtq4epifWJKm4OVfwxEQ=; b=rZ6B3JYIN6eMc2
	rVvGvxQhNZzZwG5M6/JNpdvK5VFhk4aruO2ArzvOb38f6ZVKH/Mi2JnM/kv0l0nYxAKX93ET9BcTk
	ztlaOefuKLMFcqqq35rPkUNpCvSdYNnPcRU2MuyuTGsCVt71LN5hDKtKTFsVxmren1BntReZKl4Uw
	EmMI6iGVPmYrEueJJpuqr7ao0ThEZFiH1zkVhx3PEb8bXag2O/wBf8NGF/Xe8UgBVvFTWn8kV3g8y
	vyZb2cA8dOAw5zZa/15Px0fG2t3c67hDItZZU47gZ6lYlp0VbgpYuRN5C1HFOQgRNCkpLkpyBrL6C
	vcfGvKIOfZgV4z6SSvHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9kej-000rsz-0F; Tue, 18 Jan 2022 09:19:57 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9keO-000rlI-3k; Tue, 18 Jan 2022 09:19:38 +0000
Received: by mail-ed1-x52b.google.com with SMTP id j7so28155358edr.4;
 Tue, 18 Jan 2022 01:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SB0wh1JvYuxb1nJDI7PyGganrQILU5xtGUXZvsW6ko0=;
 b=Eb3i4SvXu8XdwLGqOWL+zhPFAIwvhYqMVIWvCZjfeZ5ZrgYQD20Lhib1bopL3XrTDl
 YRO+tDpWXFKJmz+2BkS0nLE4ds0vw8VwIQblDXUFEDBghIwU93IgPJ5g8rXupxy2Wh2u
 NQfas8Nf0ifp3WNIDFayWkEArYkMRkZ3Rg+hab33gvawGk3aYLJDkfjrZtwqVsSohRkQ
 MbVlMgd+APnIHBIVW4drs9yPcKC9Fq5Z2axKha6s2Q/zUly2ttNFau2Ze08+VZyS4OHp
 2PiRK8RbKEPnCZUwEYIkOE5cun6lc2SmJTZ+9eRdXHaC2yFnmBl3Q1ZSnBsaujANHhuL
 jiig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SB0wh1JvYuxb1nJDI7PyGganrQILU5xtGUXZvsW6ko0=;
 b=JRnylz/fsD85A4rhyFUF2+eNdjc05o7bTTatSB+CIRSvhQsonWXfHYJfsiMAdq1wlC
 Fi5IN24LKe75UcM4fh1zgHfBAYhLFiHdZYRx6ONs6mpTYjt9pGdkW9SEhab6UzpyJsXR
 RnUOR+oHtT4M314jZfmGF0+YDBVsHyJH5x27IodZQWLqcob5Ihsi/tUaYToSbSPLEuJi
 rU3RR74TtLAskG3PTm59p+PkFFeb/y3krUHPz6jqkE0rrnNzg4epr+4DEMadjytbAYb4
 21buFTHOUndSBUEXmpl8lIT2Gg/x1dfl16L92xq/+6t5KLwDgws8Htzpe/4my5UrBOOd
 tVrw==
X-Gm-Message-State: AOAM532A7z3YxJ2knuWLu5/cA+6asoG03kd1zs3awOh07Q1I0aarLWPA
 8/fovgaKtJDVnbqO6hZA7O/nTBvXy/RyupAVVkY=
X-Google-Smtp-Source: ABdhPJxSbMd+HQ6M+bgVFr1+OvobdOGajiL40zRQ24757+JEdYZ/E9oYJtr25sD0StBm4K7Oyl/FGS1x2frkSyRibbQ=
X-Received: by 2002:a17:907:6ea3:: with SMTP id
 sh35mr5517133ejc.497.1642497573955; 
 Tue, 18 Jan 2022 01:19:33 -0800 (PST)
MIME-Version: 1.0
References: <20220117082539.18713-1-axe.yang@mediatek.com>
 <20220117082539.18713-4-axe.yang@mediatek.com>
In-Reply-To: <20220117082539.18713-4-axe.yang@mediatek.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 18 Jan 2022 11:18:57 +0200
Message-ID: <CAHp75VdkKYujGZOdGkLK-tzC9q+RjkX59fFZe5cHajGOnDdL2w@mail.gmail.com>
Subject: Re: [RESEND v3 3/3] mmc: mediatek: add support for SDIO eint IRQ
To: Axe Yang <axe.yang@mediatek.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Satya Tangirala <satyat@google.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach <dev@lynxeye.de>, 
 Eric Biggers <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>, 
 Stephen Boyd <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>,
 Yue Hu <huyue2@yulong.com>, 
 Tian Tao <tiantao6@hisilicon.com>, angelogioacchino.delregno@collabora.com, 
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Yong Mao <yong.mao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_011936_200553_0927AC4B 
X-CRM114-Status: GOOD (  17.41  )
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

On Mon, Jan 17, 2022 at 7:33 PM Axe Yang <axe.yang@mediatek.com> wrote:
>
> Add support for eint IRQ when MSDC is used as an SDIO host. This
> feature requires SDIO device support async IRQ function. With this
> feature, SDIO host can be awakened by SDIO card in suspend state,
> without additional pin.
>
> MSDC driver will time-share the SDIO DAT1 pin. During suspend, MSDC
> turn off clock and switch SDIO DAT1 pin to GPIO mode. And during
> resume, switch GPIO function back to DAT1 mode then turn on clock.
>
> Some device tree property should be added or modified in MSDC node
> to support SDIO eint IRQ. Pinctrls named state_dat1 and state_eint
> are mandatory. And cap-sdio-async-irq flag is necessary since this
> feature depends on asynchronous interrupt:
>         &mmcX {
>                 ...
>                 pinctrl-names = "default", "state_uhs", "state_eint",
>                                 "state_dat1";
>                 ...
>                 pinctrl-2 = <&mmc2_pins_eint>;
>                 pinctrl-3 = <&mmc2_pins_dat1>;
>                 ...
>                 cap-sdio-async-irq;
>                 ...
>         };

...

> +static irqreturn_t msdc_sdio_eint_irq(int irq, void *dev_id)
> +{
> +       struct msdc_host *host = dev_id;
> +       struct mmc_host *mmc = mmc_from_priv(host);

> +       unsigned long flags;

Same Q as per v2. Why do you need this?

Yes, you did the first step to the answer, but I want you to go deeper
and tell me why you need the spin_lock_irqsave() variant.

> +       spin_lock_irqsave(&host->lock, flags);
> +       if (likely(host->sdio_irq_cnt > 0)) {
> +               disable_irq_nosync(host->eint_irq);
> +               disable_irq_wake(host->eint_irq);
> +               host->sdio_irq_cnt--;
> +       }
> +       spin_unlock_irqrestore(&host->lock, flags);
> +
> +       sdio_signal_irq(mmc);
> +
> +       return IRQ_HANDLED;
> +}

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
