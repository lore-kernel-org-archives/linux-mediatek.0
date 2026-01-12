Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190B6CF45AE
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jan 2026 17:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LaqVKjn3HybXAaQGlHj3Cj3gxHUmIRrjkoaUVWLdE+o=; b=p3mb0zUXr3K3+V32+b276HlDTC
	cS06TD4KoSpvAViJApdGMznCAPl9og1G/vlE/gM+tcgROEo1cJDbxAbgtWn3njj6z1XxjMjyU9Fwb
	jxxQ8/nPQq8vnzWHGCU04uTkRe0/UfJ8MaRAx61YlSRe1PMGmXHDLHWXaGaomW82bjG6bLdsX9Qni
	ULVONMHZ+dCt5uhTkcwQqOlvTBRSfJQLCI0U7v1rAq0Ovjt1xDGg+BjJTk5+chYgNc4ARicQZOdaF
	fe+IHi+/2xOlMJ3Ui9l2pdE11kdQ7uLq4aXhZopBuIuRBCiYIM+VEbxlTBUtmHGmPtkujzpSb5hUc
	me7sPtTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLUk-00000005pwM-2X8q;
	Mon, 12 Jan 2026 17:14:22 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLUi-00000005pvE-2UwY
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Jan 2026 17:14:21 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b83122f9d78so1063463566b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 12 Jan 2026 09:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768238057; x=1768842857; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LaqVKjn3HybXAaQGlHj3Cj3gxHUmIRrjkoaUVWLdE+o=;
        b=Vy/2J8ye7Zgzhi09a+HlshsgSn0EeFkwJoqd5Cl8S7a4t1vB7iKgTk8M94eHNRr6mz
         gwAPPLG8SDn8/DdPJnTB7ipDHGQGhmOZlh/qnULU1OVF23eKSELY2y7Pn1RQwqk4yew/
         ic4dJq7i7wXwEq8vdgWVXI/ASFXM5agsenNHPM/U978tDLbAHASHARe3slOUwLiOIEO0
         cGsdbeS5yT6IsjZKVcDpOIECGU4MWf4nD0Qi8pFVOPrKlDKOBZj2KtBOvvTKn5c8ivSn
         DaEz3zFSkMLwWUUBKtlBECGr95gLVS/Bo8fFi9+GovnuzT6auk2IZSeYOp/ItRh/Pbah
         zW1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768238057; x=1768842857;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LaqVKjn3HybXAaQGlHj3Cj3gxHUmIRrjkoaUVWLdE+o=;
        b=r+PJ7yVWHf2E8AeYEzcnfXLs3k3uWVQM2CK0yfZMJNdB/5cYBU/WB53dzIbdlthCEF
         FlXjTIyiLp/m1mPKxZiec+aVD2KzRmoL7gqKd0N/3zSV3Drs8Seu7tSrI7T0igSvRALd
         j9h3XWQFCPRQUzjGDseJUQaxxFKJSArVVruc/rs5aAGYCYo1TC7J0qssYKCmmPJ30P2i
         AMD5Q10TKqpqvLKGyWDpzZH6cXjRWSC6vqEFLlHErAk0/K3sTjJaH5HTRJvDYO11DqmX
         4K+A21rA0JD+iLriAFrfhd1PyPszp9lRRgvTw61MDTjUjPHUviQ17id0r2YOppSmHDat
         b86Q==
X-Forwarded-Encrypted: i=1; AJvYcCXpk5ARZxrjrDiOdV3GiNilYlGj5DjUeEcMsah5XlwwOn+RtDiIjyLdTjQPvmb2nsA9z0oApm71f8TKJPTp7A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwioW8cO2mmLEKmnJSKHGEawc+EyNhUY26LplYylcmcU8Gsgvfl
	MVM3HCNvefJNXflbVUeEJ3IKNY4p4feXjE1GSJml7LUX1QaUSGtoOnwsQu2nRQ/zlD673+FrT3/
	KBj5QJO0veiqafgHmMVUb1Qzh0Ngzhvlp6JPKNbjgdQ==
X-Gm-Gg: AY/fxX7IFaQfZTsUHk2wZPuxxh2u1Try6fIOrmR8d/Cx2tgQbUljmt3XQA+0l3nnOBQ
	3GlpekjcwXNCNFEjBTsPi3ItRXEGBAlLJbjv1mmnKE/9KB+J/hqYuVzhijZvQ98muD7LgPtXECV
	rBuv9CLWRAXswRBd8ocj19VijNkhGzhkhjRjkDJsxQRh3bmuM0K4wMs4v8yjlTkOrvz2XXNQob1
	4O/aouSgxgEPuPv+2aXY114K85cpWDcSvIc0sOIswjXBhX+irrTx0MYIpkpoj0ygtKk7tDPTXC9
	Ny1wHHZ7FQRjyetrY3qOIXR2wz0U+A==
X-Google-Smtp-Source: AGHT+IF5+xfVIsZA2wr8JPc/95fH1etbn20R3Fu8kJxC0WL69/X8MM6hCVu3p0Vm0yktQncN5rrF9RQBGHp7Wczm3Z4=
X-Received: by 2002:a17:907:2d2c:b0:b87:29a3:27f9 with SMTP id
 a640c23a62f3a-b8729a3328bmr215457466b.18.1768238057187; Mon, 12 Jan 2026
 09:14:17 -0800 (PST)
MIME-Version: 1.0
References: <20260112110755.2435899-1-tzungbi@kernel.org>
In-Reply-To: <20260112110755.2435899-1-tzungbi@kernel.org>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 12 Jan 2026 10:14:06 -0700
X-Gm-Features: AZwV_QhFTOKB8Mb4toZTdxIgZzuORUy3V9mQRfv_0RLRLo19pmsGVWf9Wr41giU
Message-ID: <CANLsYkxuh6duedGuzR7We4T1KSXA613SXg+HWL=TONdhtP4XMQ@mail.gmail.com>
Subject: Re: [PATCH v2] remoteproc: mediatek: Break lock dependency to `prepare_lock`
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-remoteproc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_091420_685932_0DDCCF26 
X-CRM114-Status: GOOD (  30.12  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 12 Jan 2026 at 04:08, Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> A potential circular locking dependency (ABBA deadlock) exists between
> `ec_dev->lock` and the clock framework's `prepare_lock`.
>
> The first order (A -> B) occurs when scp_ipi_send() is called while
> `ec_dev->lock` is held (e.g., within cros_ec_cmd_xfer()):
> 1. cros_ec_cmd_xfer() acquires `ec_dev->lock` and calls scp_ipi_send().
> 2. scp_ipi_send() calls clk_prepare_enable(), which acquires
>    `prepare_lock`.
> See #0 in the following example calling trace.
> (Lock Order: `ec_dev->lock` -> `prepare_lock`)
>
> The reverse order (B -> A) is more complex and has been observed
> (learned) by lockdep.  It involves the clock prepare operation
> triggering power domain changes, which then propagates through sysfs
> and power supply uevents, eventually calling back into the ChromeOS EC
> driver and attempting to acquire `ec_dev->lock`:
> 1. Something calls clk_prepare(), which acquires `prepare_lock`.  It
>    then triggers genpd operations like genpd_runtime_resume(), which
>    takes `&genpd->mlock`.
> 2. Power domain changes can trigger regulator changes; regulator
>    changes can then trigger device link changes; device link changes
>    can then trigger sysfs changes.  Eventually, power_supply_uevent()
>    is called.
> 3. This leads to calls like cros_usbpd_charger_get_prop(), which calls
>    cros_ec_cmd_xfer_status(), which then attempts to acquire
>    `ec_dev->lock`.
> See #1 ~ #6 in the following example calling trace.
> (Lock Order: `prepare_lock` -> `&genpd->mlock` -> ... -> `&ec_dev->lock`)
>
> Move the clk_prepare()/clk_unprepare() operations for `scp->clk` to the
> remoteproc prepare()/unprepare() callbacks.  This ensures `prepare_lock`
> is only acquired in prepare()/unprepare() callbacks.  Since
> `ec_dev->lock` is not involved in the callbacks, the dependency loop is
> broken.
>
> This means the clock is always "prepared" when the SCP is running.  The
> prolonged "prepared time" for the clock should be acceptable as SCP is
> designed to be a very power efficient processor.  The power consumption
> impact can be negligible.
>

I certainly would have appreciated this kind of information upon first
looking at this patch.  It would have saved me valuable time, time
that could have been spent on reviewing other people's work.

> A simplified calling trace reported by lockdep:
> > -> #6 (&ec_dev->lock)
> >        cros_ec_cmd_xfer
> >        cros_ec_cmd_xfer_status
> >        cros_usbpd_charger_get_port_status
> >        cros_usbpd_charger_get_prop
> >        power_supply_get_property
> >        power_supply_show_property
> >        power_supply_uevent
> >        dev_uevent
> >        uevent_show
> >        dev_attr_show
> >        sysfs_kf_seq_show
> >        kernfs_seq_show
> > -> #5 (kn->active#2)
> >        kernfs_drain
> >        __kernfs_remove
> >        kernfs_remove_by_name_ns
> >        sysfs_remove_file_ns
> >        device_del
> >        __device_link_del
> >        device_links_driver_bound
> > -> #4 (device_links_lock)
> >        device_link_remove
> >        _regulator_put
> >        regulator_put
> > -> #3 (regulator_list_mutex)
> >        regulator_lock_dependent
> >        regulator_disable
> >        scpsys_power_off
> >        _genpd_power_off
> >        genpd_power_off
> > -> #2 (&genpd->mlock/1)
> >        genpd_add_subdomain
> >        pm_genpd_add_subdomain
> >        scpsys_add_subdomain
> >        scpsys_probe
> > -> #1 (&genpd->mlock)
> >        genpd_runtime_resume
> >        __rpm_callback
> >        rpm_callback
> >        rpm_resume
> >        __pm_runtime_resume
> >        clk_core_prepare
> >        clk_prepare
> > -> #0 (prepare_lock)
> >        clk_prepare
> >        scp_ipi_send
> >        scp_send_ipi
> >        mtk_rpmsg_send
> >        rpmsg_send
> >        cros_ec_pkt_xfer_rpmsg
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---
> v2:
> - Re-organized commit message.
> - Rebased to next-20260109.
>
> v1: https://lore.kernel.org/r/20251229043146.4102967-1-tzungbi@kernel.org
>
>  drivers/remoteproc/mtk_scp.c     | 39 +++++++++++++++++++++++---------
>  drivers/remoteproc/mtk_scp_ipi.c |  4 ++--
>  2 files changed, 30 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 328541e62158..4651311aeb07 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -283,7 +283,7 @@ static irqreturn_t scp_irq_handler(int irq, void *priv)
>         struct mtk_scp *scp = priv;
>         int ret;
>
> -       ret = clk_prepare_enable(scp->clk);
> +       ret = clk_enable(scp->clk);
>         if (ret) {
>                 dev_err(scp->dev, "failed to enable clocks\n");
>                 return IRQ_NONE;
> @@ -291,7 +291,7 @@ static irqreturn_t scp_irq_handler(int irq, void *priv)
>
>         scp->data->scp_irq_handler(scp);
>
> -       clk_disable_unprepare(scp->clk);
> +       clk_disable(scp->clk);
>
>         return IRQ_HANDLED;
>  }
> @@ -665,7 +665,7 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
>         struct device *dev = scp->dev;
>         int ret;
>
> -       ret = clk_prepare_enable(scp->clk);
> +       ret = clk_enable(scp->clk);
>         if (ret) {
>                 dev_err(dev, "failed to enable clocks\n");
>                 return ret;
> @@ -680,7 +680,7 @@ static int scp_load(struct rproc *rproc, const struct firmware *fw)
>
>         ret = scp_elf_load_segments(rproc, fw);
>  leave:
> -       clk_disable_unprepare(scp->clk);
> +       clk_disable(scp->clk);
>
>         return ret;
>  }
> @@ -691,14 +691,14 @@ static int scp_parse_fw(struct rproc *rproc, const struct firmware *fw)
>         struct device *dev = scp->dev;
>         int ret;
>
> -       ret = clk_prepare_enable(scp->clk);
> +       ret = clk_enable(scp->clk);
>         if (ret) {
>                 dev_err(dev, "failed to enable clocks\n");
>                 return ret;
>         }
>
>         ret = scp_ipi_init(scp, fw);
> -       clk_disable_unprepare(scp->clk);
> +       clk_disable(scp->clk);
>         return ret;
>  }
>
> @@ -709,7 +709,7 @@ static int scp_start(struct rproc *rproc)
>         struct scp_run *run = &scp->run;
>         int ret;
>
> -       ret = clk_prepare_enable(scp->clk);
> +       ret = clk_enable(scp->clk);
>         if (ret) {
>                 dev_err(dev, "failed to enable clocks\n");
>                 return ret;
> @@ -734,14 +734,14 @@ static int scp_start(struct rproc *rproc)
>                 goto stop;
>         }
>
> -       clk_disable_unprepare(scp->clk);
> +       clk_disable(scp->clk);
>         dev_info(dev, "SCP is ready. FW version %s\n", run->fw_ver);
>
>         return 0;
>
>  stop:
>         scp->data->scp_reset_assert(scp);
> -       clk_disable_unprepare(scp->clk);
> +       clk_disable(scp->clk);
>         return ret;
>  }
>
> @@ -909,7 +909,7 @@ static int scp_stop(struct rproc *rproc)
>         struct mtk_scp *scp = rproc->priv;
>         int ret;
>
> -       ret = clk_prepare_enable(scp->clk);
> +       ret = clk_enable(scp->clk);
>         if (ret) {
>                 dev_err(scp->dev, "failed to enable clocks\n");
>                 return ret;
> @@ -917,12 +917,29 @@ static int scp_stop(struct rproc *rproc)
>
>         scp->data->scp_reset_assert(scp);
>         scp->data->scp_stop(scp);
> -       clk_disable_unprepare(scp->clk);
> +       clk_disable(scp->clk);
>
>         return 0;
>  }
>
> +static int scp_prepare(struct rproc *rproc)
> +{
> +       struct mtk_scp *scp = rproc->priv;
> +
> +       return clk_prepare(scp->clk);
> +}
> +
> +static int scp_unprepare(struct rproc *rproc)
> +{
> +       struct mtk_scp *scp = rproc->priv;
> +
> +       clk_unprepare(scp->clk);
> +       return 0;
> +}
> +
>  static const struct rproc_ops scp_ops = {
> +       .prepare        = scp_prepare,
> +       .unprepare      = scp_unprepare,
>         .start          = scp_start,
>         .stop           = scp_stop,
>         .load           = scp_load,
> diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
> index c068227e251e..7a37e273b3af 100644
> --- a/drivers/remoteproc/mtk_scp_ipi.c
> +++ b/drivers/remoteproc/mtk_scp_ipi.c
> @@ -171,7 +171,7 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
>             WARN_ON(len > scp_sizes->ipi_share_buffer_size) || WARN_ON(!buf))
>                 return -EINVAL;
>
> -       ret = clk_prepare_enable(scp->clk);
> +       ret = clk_enable(scp->clk);
>         if (ret) {
>                 dev_err(scp->dev, "failed to enable clock\n");
>                 return ret;
> @@ -211,7 +211,7 @@ int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
>
>  unlock_mutex:
>         mutex_unlock(&scp->send_lock);
> -       clk_disable_unprepare(scp->clk);
> +       clk_disable(scp->clk);
>
>         return ret;
>  }
> --
> 2.52.0.457.g6b5491de43-goog
>
>

