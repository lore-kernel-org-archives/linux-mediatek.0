Return-Path: <SRS0=Yz5u=2N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95B61C2D0C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2019 11:45:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66233206D3
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Dec 2019 11:45:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rPmtrU4W";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net header.b="jX9LJcjW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66233206D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r1AB2Y8Lq5xb7PKcKbKA7Q7htJAZzMQa7Xih67ZzLOM=; b=rPmtrU4WPD00zYTvyZpEIxGzZ
	zGDP06n5ii7cZ1O5w/mhbSXmV4z3ALJXPotRB0FZ0WqIV/hCOsbdKU9K8b29KjwjMzegFyVgVP750
	JH0gKW1eAP0RvgsZI1f/G/GcqjXcB69aRrg40gI1zK1iYbtz6vJQYXjaVQUdoyOUcWohHBWtkOzeK
	V3TApqGLr3TI4/ZkNejWTa1ZJli8denzNWvidkK3sLlHvD5BXHb9l6FBcwEaAEWQsVg3Nz8T/QwVk
	eez1wmgQPOh3vK8oKdAYGf7vz0NfRlledDbufV312dE45uGXeJ8iIfp2NHhGCde6x1cGVL0HufQvG
	pkXZEad4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijM8t-0004OC-VB; Mon, 23 Dec 2019 11:44:55 +0000
Received: from outils.crapouillou.net ([89.234.176.41] helo=crapouillou.net)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijM8k-0004F7-1x; Mon, 23 Dec 2019 11:44:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1577101475; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uVdlO9cJhU3uZR9PsalU+9sk35dl6Zqn8751jyDz6hE=;
 b=jX9LJcjWIqPnnuyZly5BdZOoj2/inQqbVjiES4HFwhniV6JNaGO+ALAE433xhQmOf7hoHr
 74R9G8HAr3LeKzr0sbxjFJVOggyg28MPxpD0DHH9YfttM3lvpC+gmVq6n3+Ac/2Iy0eHBk
 VXMTWUiAs8EHGfFQgFmRp6lvylZSZUE=
Date: Mon, 23 Dec 2019 12:44:26 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/9] memory: jz4780_nemc: convert to
 devm_platform_ioremap_resource
To: Yangtao Li <tiny.windzz@gmail.com>
Message-Id: <1577101466.3.0@crapouillou.net>
In-Reply-To: <20191222185034.4665-2-tiny.windzz@gmail.com>
References: <20191222185034.4665-1-tiny.windzz@gmail.com>
 <20191222185034.4665-2-tiny.windzz@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191223_034446_289596_837769B8 
X-CRM114-Status: UNSURE (   8.84  )
X-CRM114-Notice: Please train this message.
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
Cc: kstewart@linuxfoundation.org, tony@atomide.com, ssantosh@kernel.org,
 rfontana@redhat.com, thierry.reding@gmail.com, krzk@kernel.org,
 digetx@gmail.com, linux-samsung-soc@vger.kernel.org, evgreen@chromium.org,
 jonathanh@nvidia.com, kgene@kernel.org, allison@lohutok.net, jroedel@suse.de,
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
 alexios.zavras@intel.com, linux-mediatek@lists.infradead.org, john@phrozen.org,
 matthias.bgg@gmail.com, tglx@linutronix.de, linux-omap@vger.kernel.org,
 yong.wu@mediatek.com, rogerq@ti.com, linux-arm-kernel@lists.infradead.org,
 sboyd@kernel.org, pdeschrijver@nvidia.com, linux-kernel@vger.kernel.org,
 info@metux.net, lukasz.luba@arm.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,


Le dim., d=E9c. 22, 2019 at 18:50, Yangtao Li <tiny.windzz@gmail.com> a =

=E9crit :
> Use devm_platform_ioremap_resource() to simplify code.
> =

> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>

Acked-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul


> ---
>  drivers/memory/jz4780-nemc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> =

> diff --git a/drivers/memory/jz4780-nemc.c =

> b/drivers/memory/jz4780-nemc.c
> index b232ed279fc3..857a9fa5cba5 100644
> --- a/drivers/memory/jz4780-nemc.c
> +++ b/drivers/memory/jz4780-nemc.c
> @@ -269,7 +269,6 @@ static int jz4780_nemc_probe(struct =

> platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	struct jz4780_nemc *nemc;
> -	struct resource *res;
>  	struct device_node *child;
>  	const __be32 *prop;
>  	unsigned int bank;
> @@ -287,8 +286,7 @@ static int jz4780_nemc_probe(struct =

> platform_device *pdev)
>  	spin_lock_init(&nemc->lock);
>  	nemc->dev =3D dev;
> =

> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	nemc->base =3D devm_ioremap_resource(dev, res);
> +	nemc->base =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(nemc->base)) {
>  		dev_err(dev, "failed to get I/O memory\n");
>  		return PTR_ERR(nemc->base);
> --
> 2.17.1
> =




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
