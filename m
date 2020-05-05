Return-Path: <SRS0=+Wu7=6T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46736C47247
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 19:25:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15E2E206B9
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 19:25:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IP+mm64e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="SJdtgGTW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15E2E206B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7F7wW3eW9mYMav0IfcJlHeYyl513mTBJji1AJnBOyWQ=; b=IP+mm64eADtN9o
	82W7AFp5eMDmNA+sQLGN0Dwa9pLKjcPXmN5XNhXTlERTWT1Fr9jhSEMUXNPUXiNVlugSn12xrz3lQ
	7pd0lB/PTwrPoRFNPDr79K7zSn79Z0sEyvVgWPtqPE3Eul6+7GeEmXdc4kVvCztzdEIyBz3Da1jYL
	VfQ077fA+pSVaw99C/xxlVK2rfBKJ6oGHwVl5gUTrFHWvHslsnuneeuOMhunGwNpspsvhxzimdRDT
	haw7l934IOXoGhBrbnXB5p2Xp5vd2cECG+tAkk6HecYv86Rts2gwPrEaUe0JzGJ5PjqpInTweC1Ct
	noq1Ji2wLu0WNL2j4unw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jW3CK-0001cu-7f; Tue, 05 May 2020 19:25:44 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jW3CH-0001ba-Dl
 for linux-mediatek@lists.infradead.org; Tue, 05 May 2020 19:25:42 +0000
Received: by mail-oi1-x241.google.com with SMTP id c124so2834523oib.13
 for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2020 12:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RKLj+Bvazx+0GBaDeiW8XR54CzGKY4AHaP4cILqovw8=;
 b=SJdtgGTW5rf7rigkvrS0mGJrpwJvn5sAzRAkkSYrU2yWA/lI6TmCZF0sq1SvNFwlg1
 kREVUdbiAPDNjSfxcJ7oIXu434wnGVlmGdtL6WbnnD9hbqTKUgJpUSsrG2XH0oFtkDpS
 blRYXGrjL79B5wOO2fnZ53Ph/JTysPZXNngkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RKLj+Bvazx+0GBaDeiW8XR54CzGKY4AHaP4cILqovw8=;
 b=eZEXa1SrI6Hy3ocw6tnt2YyZ6yQcNdFq7HxR8wk1AAbdRvmLoJ0BXM5SS6m2nXBeMM
 2RW5b7khipAybG2G1qt0aS7WRXSAEwtdfgtRjb7wVromxDUvOahB+l9Zi7PFkc0wxiBa
 FuYq6pxqccAPuZUaMYe+ls63+zEnP9TfFE087vyd06kTKwmsbqpZpnCiuB72hyr/WaFE
 uQuway1SIvDcWde0NfMzkxy6GzxYGuBd0pbX8gSqhn3vzXS9dSAHz5f4L5F5CLcIzYvZ
 m4zyO5Kk2bi3O4vf0x6sPP9MbjBmwuA6uzUGUjOKsqSVlCA/wRYfaxabic1fthDLXx26
 Q7vA==
X-Gm-Message-State: AGi0PuZavDqqBRJYbIS4dUXGOHvupJK7hmHshhlzhP1pv6qpd/DK5n0M
 LZI6JUSGfqBIUeItn+p741ChRhtbNQ7cytu3E/l7ug==
X-Google-Smtp-Source: APiQypJj1DkGUZt7VIZXosUiRMoBR0Hk5xmD/ibsZ1474R2bICyoP6W/sR5eJX+NBmdVffk3jmYWOAdQstorpI7Bi6g=
X-Received: by 2002:aca:403:: with SMTP id 3mr227565oie.166.1588706739870;
 Tue, 05 May 2020 12:25:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200505140231.16600-1-brgl@bgdev.pl>
 <20200505140231.16600-6-brgl@bgdev.pl>
In-Reply-To: <20200505140231.16600-6-brgl@bgdev.pl>
From: Edwin Peer <edwin.peer@broadcom.com>
Date: Tue, 5 May 2020 12:25:03 -0700
Message-ID: <CAKOOJTzcNr7mc9xusQm3nCzkq5P=ha-si3fizeEL2_KJUOC3-Q@mail.gmail.com>
Subject: Re: [PATCH 05/11] net: core: provide devm_register_netdev()
To: Bartosz Golaszewski <brgl@bgdev.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_122541_469002_5A268434 
X-CRM114-Status: GOOD (  21.70  )
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
Cc: devicetree@vger.kernel.org, Felix Fietkau <nbd@openwrt.org>,
 Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, May 5, 2020 at 7:05 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Provide devm_register_netdev() - a device resource managed variant
> of register_netdev(). This new helper will only work for net_device
> structs that have a parent device assigned and are devres managed too.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  include/linux/netdevice.h |  4 ++++
>  net/core/dev.c            | 48 +++++++++++++++++++++++++++++++++++++++
>  net/ethernet/eth.c        |  1 +
>  3 files changed, 53 insertions(+)
>
> diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> index 130a668049ab..433bd5ca2efc 100644
> --- a/include/linux/netdevice.h
> +++ b/include/linux/netdevice.h
> @@ -1515,6 +1515,8 @@ struct net_device_ops {
>   * @IFF_FAILOVER_SLAVE: device is lower dev of a failover master device
>   * @IFF_L3MDEV_RX_HANDLER: only invoke the rx handler of L3 master device
>   * @IFF_LIVE_RENAME_OK: rename is allowed while device is up and running
> + * @IFF_IS_DEVRES: this structure was allocated dynamically and is managed by
> + *     devres
>   */
>  enum netdev_priv_flags {
>         IFF_802_1Q_VLAN                 = 1<<0,
> @@ -1548,6 +1550,7 @@ enum netdev_priv_flags {
>         IFF_FAILOVER_SLAVE              = 1<<28,
>         IFF_L3MDEV_RX_HANDLER           = 1<<29,
>         IFF_LIVE_RENAME_OK              = 1<<30,
> +       IFF_IS_DEVRES                   = 1<<31,
>  };
>
>  #define IFF_802_1Q_VLAN                        IFF_802_1Q_VLAN
> @@ -4206,6 +4209,7 @@ struct net_device *alloc_netdev_mqs(int sizeof_priv, const char *name,
>                          count)
>
>  int register_netdev(struct net_device *dev);
> +int devm_register_netdev(struct net_device *ndev);
>  void unregister_netdev(struct net_device *dev);
>
>  /* General hardware address lists handling functions */
> diff --git a/net/core/dev.c b/net/core/dev.c
> index 522288177bbd..99db537c9468 100644
> --- a/net/core/dev.c
> +++ b/net/core/dev.c
> @@ -9519,6 +9519,54 @@ int register_netdev(struct net_device *dev)
>  }
>  EXPORT_SYMBOL(register_netdev);
>
> +struct netdevice_devres {
> +       struct net_device *ndev;
> +};
> +
> +static void devm_netdev_release(struct device *dev, void *this)
> +{
> +       struct netdevice_devres *res = this;
> +
> +       unregister_netdev(res->ndev);
> +}
> +
> +/**
> + *     devm_register_netdev - resource managed variant of register_netdev()
> + *     @ndev: device to register
> + *
> + *     This is a devres variant of register_netdev() for which the unregister
> + *     function will be call automatically when the parent device of ndev
> + *     is detached.
> + */
> +int devm_register_netdev(struct net_device *ndev)
> +{
> +       struct netdevice_devres *dr;
> +       int ret;
> +
> +       /* struct net_device itself must be devres managed. */
> +       BUG_ON(!(ndev->priv_flags & IFF_IS_DEVRES));
> +       /* struct net_device must have a parent device - it will be the device
> +        * managing this resource.
> +        */

Catching static programming errors seems like an expensive use of the
last runtime flag in the enum. It would be weird to devres manage the
unregister and not also choose to manage the underlying memory in the
same fashion, so it wouldn't be an obvious mistake to make. If it must
be enforced, one could also iterate over the registered release
functions and check for the presence of devm_free_netdev without
burning the flag.

> +       BUG_ON(!ndev->dev.parent);
> +
> +       dr = devres_alloc(devm_netdev_release, sizeof(*dr), GFP_KERNEL);
> +       if (!dr)
> +               return -ENOMEM;
> +
> +       ret = register_netdev(ndev);
> +       if (ret) {
> +               devres_free(dr);
> +               return ret;
> +       }
> +
> +       dr->ndev = ndev;
> +       devres_add(ndev->dev.parent, dr);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL(devm_register_netdev);
> +
>  int netdev_refcnt_read(const struct net_device *dev)
>  {
>         int i, refcnt = 0;
> diff --git a/net/ethernet/eth.c b/net/ethernet/eth.c
> index c8b903302ff2..ce9b5e576f20 100644
> --- a/net/ethernet/eth.c
> +++ b/net/ethernet/eth.c
> @@ -423,6 +423,7 @@ struct net_device *devm_alloc_etherdev_mqs(struct device *dev, int sizeof_priv,
>
>         *dr = netdev;
>         devres_add(dev, dr);
> +       netdev->priv_flags |= IFF_IS_DEVRES;
>
>         return netdev;
>  }
> --
> 2.25.0
>

Regards,
Edwin Peer

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
