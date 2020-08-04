Return-Path: <SRS0=p2pa=BO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E141C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 01:51:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1349A2076C
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2020 01:51:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TQjttTSf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="aaf257HY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1349A2076C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Trh3yfape4gXMTjHEU9SfydqvJ6DTyN1FcO3XXdl9MI=; b=TQjttTSfiXcUOXE4Cm44SsXBg
	iaWqRL4dQSrC8x62YCKgAZsFDlhH9glrc1oZ7g5ONWk+71wYFHt6i1xkgxj9jpPf7MLfhF2EWNPYd
	KtfRQkJP331YKOVuvhLufYmMJf37AdyWssDO2BJPc7+DICgUREj1GVXh0mI6bCE1LASIOnDszw/Lr
	ZwhjWAvkEgeMta7ZTjW8HI4w58YhJ4f21rcPX4uJl4A29cE98NW4kYWsR25MTMjxBOF5WE4+2/Zqz
	YZbjISTqt+mnBtVvtWQ9p9fjx8eE++zVlk00e9BrDxwcMI6FJQrHsYeRpv6H2zGPIAymtZHMIBeR+
	PCZVzFgEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2m6v-0002QO-34; Tue, 04 Aug 2020 01:51:25 +0000
Received: from mail-vs1-xe44.google.com ([2607:f8b0:4864:20::e44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2m6q-0002P2-BD
 for linux-mediatek@lists.infradead.org; Tue, 04 Aug 2020 01:51:21 +0000
Received: by mail-vs1-xe44.google.com with SMTP id r7so4471748vsq.5
 for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2020 18:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZjddNGXz3YzU7Pvdk0bKn7EGChBBYHNzVV19el9GvN4=;
 b=aaf257HYCPeWHrjBXePaOYS8VFb1Q/czqyneX50WCTw9iwZoobQcG+o1I1MWB7iKJs
 smazrjiW0L6F2JZ72ElWTxCb5NTLzF2eL/KqMeWC9AHOwb9tlBgjdHwOTBLnOa+PAG0y
 GzfieF4oG1m72F66pbXCb9LhKUeoz73OImW5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZjddNGXz3YzU7Pvdk0bKn7EGChBBYHNzVV19el9GvN4=;
 b=PzKy0MNoHjx9Ji6o004Yut94fO+mIi3jHnRqL+d0GgQh3sN7gBuKEwIWvT8CnUDog1
 BhXQuJVjpQUIjetGtkdd9xjvoDZtHjujdcUqWP4ExetPkYgTSsjutg1QDfIp3gILxEuB
 IkD8oHoFoOkUXK6zMxc9IpjGPdqjFI0G8vmuVA4lYfzoc1I/J60urUAUrWndRCmAElTM
 GA1QfTgr7K4G/ZdrqwSGBbzj/10YxIPJ7Wgh8DHVNYEOrOrtBedDCy3BRUU6QVtmhCyo
 uwsn+R+pdP+IyAlWsHRslWSzEzL1tJc37TgXWHqkW/qbAuymeIA1+cqXmUti2cnS3dha
 1PRQ==
X-Gm-Message-State: AOAM5327+b504mem7I1Zkl4ER2yhJN9wNJ34vnf45m6qzpjMdLO0BdIb
 wpCGh4BRtoJnvxoAi0m82p9ETVnT7lL/eC4oRmqvdw==
X-Google-Smtp-Source: ABdhPJy1lRFt2xIEK6BlHw92IYkKS9uhFUQMHmq60wCSuWixqVxrgiG9sOnX8EEpNmGgC5HX8UN7Ug7KXZjZv9nKfx8=
X-Received: by 2002:a67:bb06:: with SMTP id m6mr13785000vsn.54.1596505874070; 
 Mon, 03 Aug 2020 18:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <1596445047-2975-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1596445047-2975-2-git-send-email-hsin-hsiung.wang@mediatek.com>
In-Reply-To: <1596445047-2975-2-git-send-email-hsin-hsiung.wang@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 4 Aug 2020 09:51:03 +0800
Message-ID: <CANMq1KCSiRwCvPcbdA-g4Xwm5Jwk7VLDNpsR-_zoxEOv9ZFHWQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] spmi: Add driver shutdown support
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_215120_404923_2F526CE4 
X-CRM114-Status: GOOD (  21.33  )
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Aug 3, 2020 at 4:57 PM Hsin-Hsiung Wang
<hsin-hsiung.wang@mediatek.com> wrote:
>
> Add new shutdown() method.  Use it in the standard driver model style.
>
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  drivers/spmi/spmi.c  | 12 ++++++++++++
>  drivers/spmi/spmi.c  | 12 ++++++++++++
>  include/linux/spmi.h |  1 +
>  2 files changed, 13 insertions(+)
>
> diff --git a/drivers/spmi/spmi.c b/drivers/spmi/spmi.c
> index c16b60f..5fde024 100644
> --- a/drivers/spmi/spmi.c
> +++ b/drivers/spmi/spmi.c
> @@ -357,6 +357,17 @@ static int spmi_drv_remove(struct device *dev)
>         return 0;
>  }
>
> +static void spmi_drv_shutdown(struct device *dev)
> +{
> +       const struct spmi_driver *sdrv = to_spmi_driver(dev->driver);
> +
> +       if (!sdrv)
> +               return;
> +
> +
> +       if (sdrv->shutdown)
> +               sdrv->shutdown(to_spmi_device(dev));

Slight more succinct (assuming sdrv _can_ actually be NULL, I'm not
sure about that)

if (srdv && sdrv->shutdown)

> +}
> +}
> +
>  static int spmi_drv_uevent(struct device *dev, struct kobj_uevent_env *env)
>  {
>         int ret;
> @@ -373,6 +384,7 @@ static struct bus_type spmi_bus_type = {
> @@ -373,6 +384,7 @@ static struct bus_type spmi_bus_type = {
>         .match          = spmi_device_match,
>         .probe          = spmi_drv_probe,
>         .remove         = spmi_drv_remove,
> +       .shutdown       = spmi_drv_shutdown,
>         .uevent         = spmi_drv_uevent,
>  };
>
> diff --git a/include/linux/spmi.h b/include/linux/spmi.h
> index 394a3f6..729bcbf 100644
> --- a/include/linux/spmi.h
> +++ b/include/linux/spmi.h
> @@ -138,6 +138,7 @@ struct spmi_driver {
>         struct device_driver driver;
>         int     (*probe)(struct spmi_device *sdev);
>         void    (*remove)(struct spmi_device *sdev);
> +       void    (*shutdown)(struct spmi_device *sdev);
>  };
>
>  static inline struct spmi_driver *to_spmi_driver(struct device_driver *d)
> --
> 2.6.4

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
