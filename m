Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB048C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 12:49:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 649F423382
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 12:49:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 649F423382
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j7YUr3UNmo/9+eqjlJEjV3t2Qt3zJ4WwmDK5RqBfdCU=; b=zdV6tsC9m2HV/naobJotcT9a+
	BLlQLA0pThBeqQTmQsbqwzOmxg1z8CHMFByZH8nmIt9gkZOw/G7hXiSSpEty0WqXl4VKEUWL/shAL
	IqIsSm1hulWxdCWEmpW5VSN7jbVKBmIs08h8NfeQri6hXdz5Uzr3C7VJW19stfrNcwJ6TUF25rzZj
	J/nHMLpg9ytcrFkizKNq0ltR2S8kXWmlm74/MeMI8gRh3g4xTrQETsW79AFefDbFsua/4iRUzL0r1
	hRgXMlKmt0Q2uCVjXvKFejzwynhWI8EokCkbJOvUyeKxiXBDMwuMMIGmAwmZdHNpzsfHaG7aos2FR
	CteP33t6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxUij-0002vE-21; Thu, 07 Jan 2021 12:48:53 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxUb4-00071t-Ge; Thu, 07 Jan 2021 12:40:59 +0000
Received: by mail-yb1-xb30.google.com with SMTP id j17so5957850ybt.9;
 Thu, 07 Jan 2021 04:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zl7djwpmLjy1jW3E6hQqnHl0pgGL/6JJGeNBRQUFtSk=;
 b=Sf23TslIOPqi97T41MqT/ab7uO7ZH1EtgRAhrqCB6/z0svychJId4hLcJDku/lkuIP
 a7joyUW2CnXbQZ/rvnD6z0S+zbXTJLP5sHumk4BIubMeauREgHQllQmoH6g+MMUNqV2G
 JImw9VIiMzSr2ug+Rqy3eH6ClegXoIwhkV3Ohy+n5tyJB93LAqKyA9AY26vc7yjrBQUc
 BneoG5/iP4a+JdanRqCyZqh+zEaB8fkJP/Ij9jgtZ8Ls1pw2/o5gZ71358ZwGvtcpTGX
 0I1KmBpEYf9xlCpbC355FvzTdXYYfl86UTfWYcCX+KxVyTTxQ6legY0EU4sikZTHCerc
 G7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zl7djwpmLjy1jW3E6hQqnHl0pgGL/6JJGeNBRQUFtSk=;
 b=lcQzHzT4J6u5LbhW9sIVzgDZdbrsrZDSz+0OE9XrsjYVFGuQWWNCFgx9EkEB59brZh
 CyAlVoyOT42G0mceUPcjOvr3FPF8QzQpRvShgkxD6UE4vIUaThBlMMmhWOWbqVm5ie18
 WuzE3X8JiJfnxNpkkjZmee4aJKWMuRg+cqumko/maZ+qnVBNFoq10x+pv5bp5zZZH9b8
 ohhkw1hafFEssWICy8XUjJ59b+4cq6JRicoqQsQJlEu7Aq6h8oOZkjnv33M62964se3K
 4N0XQyv7mcPOOelXmuDLXvBSFfhGJiOwvGT9a0V1C8FRhugA6vh66KZ7nsn/rPJhCjdW
 lmsA==
X-Gm-Message-State: AOAM533FMpIuey8XNrOeKKpeZjiLTg+TfYPQbs0YGSFvyBBpyr2nGjw4
 GLJqYNYjJazpj/zFvKDUoJXuNz8U2EGq6sMwcyg=
X-Google-Smtp-Source: ABdhPJxh6gtG+4rw4nSBsZz6+SLG8nuO5voOBfKuehN1oHdQz46lJI85Zc3J8QEOrzFnmzOe/kNboxHRTFnYNfn0VD0=
X-Received: by 2002:a25:4d83:: with SMTP id
 a125mr13172761ybb.371.1610023254761; 
 Thu, 07 Jan 2021 04:40:54 -0800 (PST)
MIME-Version: 1.0
References: <20210107122944.16363-1-allen.lkml@gmail.com>
 <20210107122944.16363-13-allen.lkml@gmail.com>
In-Reply-To: <20210107122944.16363-13-allen.lkml@gmail.com>
From: Emil Renner Berthing <emil.renner.berthing@gmail.com>
Date: Thu, 7 Jan 2021 13:40:43 +0100
Message-ID: <CANBLGcziNt5R9H2eh=3y=jUUjFzHJo+G1FgVVYRgxZpfE8W-6Q@mail.gmail.com>
Subject: Re: [PATCH v2 16/19] crypto: rockchip: convert tasklets to use new
 tasklet_setup() API
To: Allen Pais <allen.lkml@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_074058_633275_79E8B8E7 
X-CRM114-Status: GOOD (  19.59  )
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
Cc: giovanni.cabiddu@intel.com, alexandre.belloni@bootlin.com,
 aymen.sghaier@nxp.com, Heiko Stuebner <heiko@sntech.de>, schalla@marvell.com,
 jamie@jamieiles.com, jesper.nilsson@axis.com,
 linux-samsung-soc@vger.kernel.org, herbert@gondor.apana.org.au,
 horia.geanta@nxp.com, k.konieczny@samsung.com, qat-linux@intel.com,
 krzk@kernel.org,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 ludovic.desroches@microchip.com, thomas.lendacky@amd.com, arno@natisbad.org,
 vz@mleia.com, gilad@benyossef.com, gcherian@marvell.com,
 linux-mediatek@lists.infradead.org, lars.persson@axis.com,
 matthias.bgg@gmail.com, Allen Pais <apais@linux.microsoft.com>,
 john.allen@amd.com, bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 linux-crypto@vger.kernel.org, Romain Perier <romain.perier@gmail.com>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Allen,

On Thu, 7 Jan 2021 at 13:32, Allen Pais <allen.lkml@gmail.com> wrote:
>
> From: Allen Pais <apais@linux.microsoft.com>
>
> In preparation for unconditionally passing the
> struct tasklet_struct pointer to all tasklet
> callbacks, switch to using the new tasklet_setup()
> and from_tasklet() to pass the tasklet pointer explicitly.
>
> Signed-off-by: Romain Perier <romain.perier@gmail.com>
> Signed-off-by: Allen Pais <apais@linux.microsoft.com>
> ---
>  drivers/crypto/rockchip/rk3288_crypto.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/crypto/rockchip/rk3288_crypto.c b/drivers/crypto/rockchip/rk3288_crypto.c
> index 35d73061d156..af6ad9f49009 100644
> --- a/drivers/crypto/rockchip/rk3288_crypto.c
> +++ b/drivers/crypto/rockchip/rk3288_crypto.c
> @@ -201,9 +201,9 @@ static int rk_crypto_enqueue(struct rk_crypto_info *dev,
>         return ret;
>  }
>
> -static void rk_crypto_queue_task_cb(unsigned long data)
> +static void rk_crypto_queue_task_cb(struct tasklet_struct *T)
>  {
> -       struct rk_crypto_info *dev = (struct rk_crypto_info *)data;
> +       struct rk_crypto_info *dev = from_tasklet(dev, t, queue_task);

This doesn't look right. First it's called T and then t. I wonder how
this even compiles..

>         struct crypto_async_request *async_req, *backlog;
>         unsigned long flags;
>         int err = 0;
> @@ -231,9 +231,9 @@ static void rk_crypto_queue_task_cb(unsigned long data)
>                 dev->complete(dev->async_req, err);
>  }
>
> -static void rk_crypto_done_task_cb(unsigned long data)
> +static void rk_crypto_done_task_cb(struct tasklet_struct *t)
>  {
> -       struct rk_crypto_info *dev = (struct rk_crypto_info *)data;
> +       struct rk_crypto_info *dev = from_tasklet(dev, t, done_task);
>
>         if (dev->err) {
>                 dev->complete(dev->async_req, dev->err);
> @@ -389,10 +389,8 @@ static int rk_crypto_probe(struct platform_device *pdev)
>         crypto_info->dev = &pdev->dev;
>         platform_set_drvdata(pdev, crypto_info);
>
> -       tasklet_init(&crypto_info->queue_task,
> -                    rk_crypto_queue_task_cb, (unsigned long)crypto_info);
> -       tasklet_init(&crypto_info->done_task,
> -                    rk_crypto_done_task_cb, (unsigned long)crypto_info);
> +       tasklet_setup(&crypto_info->queue_task, rk_crypto_queue_task_cb);
> +       tasklet_setup(&crypto_info->done_task, rk_crypto_done_task_cb);
>         crypto_init_queue(&crypto_info->queue, 50);
>
>         crypto_info->enable_clk = rk_crypto_enable_clk;
> --
> 2.25.1
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
