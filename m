Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB151C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Dec 2021 17:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AQ8/xWF8OW0pLZW06Z1c/W02XMLAz1nu3IHMoABl5T0=; b=lnoWL0lnVdevDV
	7a4KYIFjb78zRrrlHDhG9tc0VMNd+VwJ18wRGqW5nkarbaxVXnnI36Ed+x2yFPbeZDP4K3tg1ycjh
	GiYiSqA2gB20XMLXfoq3aWW7rV6wN8edlb+vwOrGZEHX5HZOjjKQZxCvqz04pWnzuA8hb9zW/u3Wx
	NPO5Xf89A7hCgqWFoq9AIO2e2NRjLkxKjfFu3vMNSKBu61ZRWhsw/feqFMuFatLEf0kHTnnf+e97V
	J4NEo9HduE4Jq0asMXpeXjW/Et3NNmmzB3bRCCjil8QGNvmSbei2cuW8At/eKHRV9UGT8aVcEN//y
	sovMKIPA04hm1rbW6yfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1tng-00H8dC-Pe; Mon, 27 Dec 2021 17:28:44 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1tnU-00H8bb-C7; Mon, 27 Dec 2021 17:28:33 +0000
Received: by mail-ed1-x52a.google.com with SMTP id f5so64151557edq.6;
 Mon, 27 Dec 2021 09:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fvswGQErb/IXWp0Ujxv53FZ/wcn6vDPizJMswGWYt8k=;
 b=aEMf3nbv9x24qgp4OFEQiFZrAXHzGkp7M3MCwIk4+HnvH3pFPlLBWPibXCATBAB7DP
 vdfVC5yi2yOPNyV8uSN4FQXnET0HHVlXNmBzYMsz5celB929zqcc+wq/DWXuLSiIo8XI
 kn4uMfielj16oEo/6WczySrmt6COrDTwJyzXPqll3HP4tfqvwi+0I34rMInWidzeFqPK
 EuWZRDPEJr6Un5PnLSlZSEF5pdYuUNfaH+kmOVtcAzGJ7pqh+XkJ3uLpC867HRXqX3Xe
 oKSzX0mgDL4QlclhTiPS6tC08q6usMTM/aQCNgUrJnRNOTqkZ6R6HdJcgNeG5mSz2UE4
 3XPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fvswGQErb/IXWp0Ujxv53FZ/wcn6vDPizJMswGWYt8k=;
 b=YUEtgcY13UfOUmDoqPUeVZs8BvubIqbwk2ZG29L33oDJNxio7FGxKJ5iQ9z0liGInm
 dzXy8My8OgLmPMpH1WonkjyXll5m4YO3NfVaUQ/7RuhGb33ROaOdKCwiLrqZXRoXPUhe
 Lymf+Bha2N/l56sMF2RgIV06V/HMmT8uwfpou3vcPmy4cbIF0asSEgXarLA0qg+9LDxO
 dpGFhhUbt4jRBlMK6E2vpj0V51JpZSYiSQrmJFA2wi4cFVrbV3a9qXh1KjKe1SfSwnWn
 zdaw4v99LI1BfcAEvuQL3DCmWXp1TpEuSY45N+BxxYpYyj2x8r2Lry1HdB63mP1Dxo/p
 z6ow==
X-Gm-Message-State: AOAM530M5xgVZXofWOUxcNyd/3WLeWrtDwkvswZBvkDMIX/yH2iAI5Ms
 AQUlIq5itOg4l5IuxJjWJWIzpRlmW0H7omI7YTI=
X-Google-Smtp-Source: ABdhPJwMGxE07ANpk+vQAh+chlk8FEfyr4VtcPtxTYO2uTEqvp91J9JDPq3tRLAak0uFSD/dsB9drtwjBOUh92a1XeY=
X-Received: by 2002:a05:6402:2ce:: with SMTP id
 b14mr17294314edx.122.1640626110012; 
 Mon, 27 Dec 2021 09:28:30 -0800 (PST)
MIME-Version: 1.0
References: <20211227083641.12538-1-axe.yang@mediatek.com>
 <20211227083641.12538-4-axe.yang@mediatek.com>
In-Reply-To: <20211227083641.12538-4-axe.yang@mediatek.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 27 Dec 2021 19:27:53 +0200
Message-ID: <CAHp75VcVx4Yf69TEoSy8GL-he9ZAW+yvoH8-DXAotQ3Mwx7n2A@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] mmc: mediatek: add support for SDIO eint irq
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
 Tian Tao <tiantao6@hisilicon.com>, linux-mmc <linux-mmc@vger.kernel.org>, 
 devicetree <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_092832_458663_73DE60E3 
X-CRM114-Status: GOOD (  15.20  )
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

On Mon, Dec 27, 2021 at 6:46 PM Axe Yang <axe.yang@mediatek.com> wrote:

...

> +       if (mmc->card && !mmc->card->cccr.enable_async_int) {
> +               if (enb)

Spell it fully, i.e. enable.


> +                       pm_runtime_get_noresume(host->dev);
> +               else
> +                       pm_runtime_put_noidle(host->dev);
> +       }

...

> +       int ret = 0;

Redundant assignment, see below.

...

> +       desc = devm_gpiod_get_index(host->dev, "eint", 0, GPIOD_IN);

Why _index variant? By default devm_gpiod_get() uses 0 for index.

> +       if (IS_ERR(desc))
> +               return PTR_ERR(desc);

...

> +       irq = gpiod_to_irq(desc);

ret = ...
if (ret < 0)
  ...handle error...

> +       if (irq >= 0) {

(for the record, 0 is never returned by gpiod_to_irq() according to
all its versions).

> +               irq_set_status_flags(irq, IRQ_NOAUTOEN);

Use corresponding flag:
https://elixir.bootlin.com/linux/latest/source/include/linux/interrupt.h#L83

> +               ret = devm_request_threaded_irq(host->dev, irq, NULL, msdc_sdio_eint_irq,
> +                                               IRQF_TRIGGER_LOW | IRQF_ONESHOT,
> +                                               "sdio-eint", host);
> +       } else {
> +               ret = irq;
> +       }
> +
> +       host->eint_irq = irq;

Is it okay if you assign garbage here in case of error?

> +       return ret;

...

> +       host->pins_eint = pinctrl_lookup_state(host->pinctrl, "state_eint");
> +       if (IS_ERR(host->pins_eint)) {
> +               dev_dbg(&pdev->dev, "Cannot find pinctrl eint!\n");
> +       } else {
> +               host->pins_dat1 = pinctrl_lookup_state(host->pinctrl, "state_dat1");
> +               if (IS_ERR(host->pins_dat1)) {

> +                       ret = PTR_ERR(host->pins_dat1);
> +                       dev_err(&pdev->dev, "Cannot find pinctrl dat1!\n");

ret = dev_err_probe(...); ?

> +                       goto host_free;
> +               }
> +       }

...

> +       if (!IS_ERR(host->pins_eint)) {

I'm wondering if you can use a pattern "error check first"?

> +               disable_irq(host->irq);
> +               pinctrl_select_state(host->pinctrl, host->pins_eint);
> +               spin_lock_irqsave(&host->lock, flags);
> +               if (host->sdio_irq_cnt == 0) {
> +                       enable_irq(host->eint_irq);
> +                       enable_irq_wake(host->eint_irq);
> +                       host->sdio_irq_cnt++;
> +               }
> +               sdr_clr_bits(host->base + SDC_CFG, SDC_CFG_SDIOIDE);
> +               spin_unlock_irqrestore(&host->lock, flags);
> +       }

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
