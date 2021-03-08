Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52975C433E6
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 04:39:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2DE265159
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 04:39:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2DE265159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0Tc8apDvS6uKhVdESwC9R1TO5tHwyu4X8f+eEjQcQfo=; b=NtXe94n6LLURNNuilu/9rENL1
	CgrdtvQGYAiWMUdOcYWfsI8e6gAK1P3tlPbZTDEgltAqwSnOhPbP0uVGdfs4na0lGssro50DepTku
	0kUu0raUw1LyF3sdeOV3SEGCB63tvqvSuxtu3FhkAoyHpErCnzzc5A0fIDat5eK45BvdmUEz42z7H
	1sY4KOtljUQQ1VzUpCG5C73wQC7GVxVUSZSb7bTVhIYg6HW9tdjtuKK6CsoluVhYo2VIf4OJbznv8
	jGK6SXQWGBDwbI+5nnHljBLZkPB8FwysMm6wsnG8JFbZgB2xDCu17ub5jmgR4T6u4oaSIKw9em7/S
	xIJPsLnZg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ7fz-00F8DC-1A; Mon, 08 Mar 2021 04:39:27 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ7fq-00F8BH-7i
 for linux-mediatek@lists.infradead.org; Mon, 08 Mar 2021 04:39:20 +0000
Received: by mail-io1-xd30.google.com with SMTP id n14so8611398iog.3
 for <linux-mediatek@lists.infradead.org>; Sun, 07 Mar 2021 20:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bsbT519mzZdb7mcw/7+TNYojkJACyFMHn6cRnUT7eX0=;
 b=PTz+1nw9/NMgAcQ5v/H55nWKHg1I2Z8jcJgMvEMjg6HGSPnYvHylTDKy1hC89hNHro
 yHtPIYhPZpDRWp+v/va46n/eRPReJ3+tK1rf0I6SgqKPy2z4SGIsyiOPQjkY1XAIWl5Y
 X9RUDlJPPQYyU10FS6blP9+JMX9tyXUL98WPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bsbT519mzZdb7mcw/7+TNYojkJACyFMHn6cRnUT7eX0=;
 b=VqHXbdy/CtEnrclRk/B61sDeYoGstRiWChLaB1sKa85sWefC7A2lSsM6/xa36ms6vO
 BkkDx49y2LunhVyIctzE4c79zujULvtFlELqg0Bu/k1C6wdDxeb57sKHvL/1V6yzHtPF
 erXxdJbaqUqfU79Ze/5Uq4diY4bPhN1HAol9Zqdq1n9OVvshmJSLPGgWy3tmNwKjJC7t
 zZ7lSyj6EnvAI3ovyUsd4+5ndlTiZ94hrevjHu7JB9H7L6q7BZJJBSW7s16UNIoawfmy
 dHUaEpmw3C69ynUZ8BXeTHID6wHdvb8U7/SYMxewKSv+O0IoQbC0Sv3uj8Y5ALxb0b0s
 DGGQ==
X-Gm-Message-State: AOAM531kM9qfaGYZwiGzDbdxOlIA8tytNkhMxs4TtBpDGeA+xyUmCA2I
 //l4ZgjgvOtJcAtY+qtcEReYtEWB+++IA4XcvT4Ouw==
X-Google-Smtp-Source: ABdhPJwXbXBGNNcHdygZ3prUT42NljCsseOPVpwNtukWEbh01trlakkHXGLwXwTQWqw4QSgtc6p7Kc98nEGxgZ5S65w=
X-Received: by 2002:a5e:d61a:: with SMTP id w26mr17530414iom.40.1615178356732; 
 Sun, 07 Mar 2021 20:39:16 -0800 (PST)
MIME-Version: 1.0
References: <20210305102004.191209-1-hsinyi@chromium.org>
In-Reply-To: <20210305102004.191209-1-hsinyi@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 8 Mar 2021 12:38:50 +0800
Message-ID: <CAJMQK-iDgkETDOnExG3Opuave98q0Nbq2ZK+NpyD_bmB0SrpDA@mail.gmail.com>
Subject: Re: [PATCH] i2c: core: support bus regulator controlling in adapter
To: Wolfram Sang <wsa@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-i2c@vger.kernel.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 lkml <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_043918_579866_07740FEF 
X-CRM114-Status: GOOD (  27.22  )
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

On Fri, Mar 5, 2021 at 6:20 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> From: Bibby Hsieh <bibby.hsieh@mediatek.com>
>
> Although in the most platforms, the bus power of i2c
> are alway on, some platforms disable the i2c bus power
> in order to meet low power request.
>
> We get and enable bulk regulator in i2c adapter device.
>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> This patch is squashed from following patch and tested on mt8183 device
> which has eeprom at24 client under i2c, so the fix in [2] is also
> verified.
> [1] https://patchwork.ozlabs.org/project/linux-i2c/cover/20200519072729.7268-1-bibby.hsieh@mediatek.com/
> [2] https://patchwork.ozlabs.org/project/linux-i2c/patch/20200522101327.13456-1-m.szyprowski@samsung.com/
> ---

Sent again with document rebased in v16 here:
https://patchwork.ozlabs.org/project/linux-i2c/cover/20210308043607.957156-1-hsinyi@chromium.org/

>  drivers/i2c/i2c-core-base.c | 93 +++++++++++++++++++++++++++++++++++++
>  include/linux/i2c.h         |  2 +
>  2 files changed, 95 insertions(+)
>
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 63ebf722a424..667f4a4de7cc 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -439,12 +439,14 @@ static int i2c_smbus_host_notify_to_irq(const struct i2c_client *client)
>  static int i2c_device_probe(struct device *dev)
>  {
>         struct i2c_client       *client = i2c_verify_client(dev);
> +       struct i2c_adapter      *adap;
>         struct i2c_driver       *driver;
>         int status;
>
>         if (!client)
>                 return 0;
>
> +       adap = client->adapter;
>         client->irq = client->init_irq;
>
>         if (!client->irq) {
> @@ -510,6 +512,12 @@ static int i2c_device_probe(struct device *dev)
>
>         dev_dbg(dev, "probe\n");
>
> +       status = regulator_enable(adap->bus_regulator);
> +       if (status < 0) {
> +               dev_err(&adap->dev, "Failed to enable power regulator\n");
> +               goto err_clear_wakeup_irq;
> +       }
> +
>         status = of_clk_set_defaults(dev->of_node, false);
>         if (status < 0)
>                 goto err_clear_wakeup_irq;
> @@ -550,8 +558,10 @@ static int i2c_device_probe(struct device *dev)
>  static int i2c_device_remove(struct device *dev)
>  {
>         struct i2c_client       *client = to_i2c_client(dev);
> +       struct i2c_adapter      *adap;
>         struct i2c_driver       *driver;
>
> +       adap = client->adapter;
>         driver = to_i2c_driver(dev->driver);
>         if (driver->remove) {
>                 int status;
> @@ -564,6 +574,8 @@ static int i2c_device_remove(struct device *dev)
>         }
>
>         dev_pm_domain_detach(&client->dev, true);
> +       if (!pm_runtime_status_suspended(&client->dev))
> +               regulator_disable(adap->bus_regulator);
>
>         dev_pm_clear_wake_irq(&client->dev);
>         device_init_wakeup(&client->dev, false);
> @@ -576,6 +588,80 @@ static int i2c_device_remove(struct device *dev)
>         return 0;
>  }
>
> +#ifdef CONFIG_PM_SLEEP
> +static int i2c_resume_early(struct device *dev)
> +{
> +       struct i2c_client *client = i2c_verify_client(dev);
> +       int err;
> +
> +       if (!client)
> +               return 0;
> +
> +       if (!pm_runtime_status_suspended(&client->dev)) {
> +               err = regulator_enable(client->adapter->bus_regulator);
> +               if (err)
> +                       return err;
> +       }
> +
> +       return pm_generic_resume_early(&client->dev);
> +}
> +
> +static int i2c_suspend_late(struct device *dev)
> +{
> +       struct i2c_client *client = i2c_verify_client(dev);
> +       int err;
> +
> +       if (!client)
> +               return 0;
> +
> +       err = pm_generic_suspend_late(&client->dev);
> +       if (err)
> +               return err;
> +
> +       if (!pm_runtime_status_suspended(&client->dev))
> +               return regulator_disable(client->adapter->bus_regulator);
> +
> +       return 0;
> +}
> +#endif
> +
> +#ifdef CONFIG_PM
> +static int i2c_runtime_resume(struct device *dev)
> +{
> +       struct i2c_client *client = i2c_verify_client(dev);
> +       int err;
> +
> +       if (!client)
> +               return 0;
> +
> +       err = regulator_enable(client->adapter->bus_regulator);
> +       if (err)
> +               return err;
> +
> +       return pm_generic_runtime_resume(&client->dev);
> +}
> +
> +static int i2c_runtime_suspend(struct device *dev)
> +{
> +       struct i2c_client *client = i2c_verify_client(dev);
> +       int err;
> +
> +       if (!client)
> +               return 0;
> +
> +       err = pm_generic_runtime_suspend(&client->dev);
> +       if (err)
> +               return err;
> +
> +       return regulator_disable(client->adapter->bus_regulator);
> +}
> +#endif
> +
> +static const struct dev_pm_ops i2c_device_pm = {
> +       SET_LATE_SYSTEM_SLEEP_PM_OPS(i2c_suspend_late, i2c_resume_early)
> +       SET_RUNTIME_PM_OPS(i2c_runtime_suspend, i2c_runtime_resume, NULL)
> +};
> +
>  static void i2c_device_shutdown(struct device *dev)
>  {
>         struct i2c_client *client = i2c_verify_client(dev);
> @@ -633,6 +719,7 @@ struct bus_type i2c_bus_type = {
>         .probe          = i2c_device_probe,
>         .remove         = i2c_device_remove,
>         .shutdown       = i2c_device_shutdown,
> +       .pm             = &i2c_device_pm,
>  };
>  EXPORT_SYMBOL_GPL(i2c_bus_type);
>
> @@ -1446,6 +1533,12 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
>         if (res)
>                 goto out_reg;
>
> +       adap->bus_regulator = devm_regulator_get(&adap->dev, "bus");
> +       if (IS_ERR(adap->bus_regulator)) {
> +               res = PTR_ERR(adap->bus_regulator);
> +               goto out_reg;
> +       }
> +
>         pm_runtime_no_callbacks(&adap->dev);
>         pm_suspend_ignore_children(&adap->dev, true);
>         pm_runtime_enable(&adap->dev);
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 56622658b215..ec87758d9f40 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -15,6 +15,7 @@
>  #include <linux/device.h>      /* for struct device */
>  #include <linux/sched.h>       /* for completion */
>  #include <linux/mutex.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/rtmutex.h>
>  #include <linux/irqdomain.h>           /* for Host Notify IRQ */
>  #include <linux/of.h>          /* for struct device_node */
> @@ -721,6 +722,7 @@ struct i2c_adapter {
>         const struct i2c_adapter_quirks *quirks;
>
>         struct irq_domain *host_notify_domain;
> +       struct regulator *bus_regulator;
>  };
>  #define to_i2c_adapter(d) container_of(d, struct i2c_adapter, dev)
>
> --
> 2.30.1.766.gb4fecdf3b7-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
