Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED0FC433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 23:40:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDBAD6147D
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 23:40:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DDBAD6147D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DKTL5aNnuqZAKJWKBJmr9NpqV/TL+D1/8safRnxmog8=; b=gza+/Zg4fHR1KkxYJGfFOVvXv
	Bzc7C48yo9RlJkr8TL3L+axZcF6v0a3AJOH0L05lFJ9EcZEO4uPmsjX0/qCzcnUXStyJVAzv6BSXH
	/IE8ujPVKfizL7SOCivty7Fl4E2jNcd+rn7aEjrPqLPICNoe2zm1QWeXOP+L5AazcdgWKIb1cDrni
	7bDLRf4ULHiJE0cL+uAwvVD73zv5eB4oqH9Coahn2lxMuGlNtSgHAwShJemRPI1w/I3a0Cc8N0Z0r
	HSdahc+2yHSIMxIKqsiCSybqa9p83maPouMylUf6LZU99I+lN6FNY4CSWKN91AxG++NFNwIY8JzGV
	r5l/qp97g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcGGL-006jaj-1x; Thu, 29 Apr 2021 23:40:05 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcGGG-006jZs-FS
 for linux-mediatek@desiato.infradead.org; Thu, 29 Apr 2021 23:40:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=zgaDDh4BUeyEBjSVBWx2i16ce3Mp8d1zatBCmh68Njs=; b=gtaP5t8LBgwF/rXriV3IM30XGt
 KCqMg1kYGgDix4Ph32EfukiO27Ea/xeQIpfFjvi83TYlqXDDVhWcy5hY9/EkSxniclmjA0ghUG4EL
 uiQN1vhOxneKY0UumuP4MSukf3k6V2G8CdSdRIATN0ZaucdUwEKp9GRXgV2x5vgyj9IWwNNWrcvuS
 1Rm53VGSRi/yUAsvudgCfOSaSWBK/uW3oOk7i3vEmE363vCT5xYKth03TOBbhmSsi3Q36Gg+E42f/
 uYfuEAlNqUWU7lakoKJfg7WVaTyz2IXnS0wmgDqjQJay1XBkmmKpjS4tIQ5osA/eocUT0vq/z2Fvg
 Izs6ytwQ==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcGG3-0011zZ-Is
 for linux-mediatek@lists.infradead.org; Thu, 29 Apr 2021 23:39:49 +0000
Received: by mail-pl1-x632.google.com with SMTP id y1so19986286plg.11
 for <linux-mediatek@lists.infradead.org>; Thu, 29 Apr 2021 16:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zgaDDh4BUeyEBjSVBWx2i16ce3Mp8d1zatBCmh68Njs=;
 b=nlBO0mtiBX1r26jk9N2JBN6egc5zeh6PPGLYteCeRrYoCBnmmUTtwdJ3MPJEfXD9mS
 x+/bn+w/B0D+3YsdSA1QHnCpy3Gs8fe/YQ8LYnMNw9IZuc4oA8vSegOSuGqtvmXePe4P
 PgEV1ejjf2JbRjgVTbiyVD5nwu5UUEiU3Y/xzd96cj+gTqruB5MJgtXs3WUHVrmX4QYD
 +rCHpJN90E0SCHUW0y94J0JHgwHW5qM+W0InHSibzf05rbVHdlunQGh8gN4mvA+TgHZc
 EM7VKlTQEf5tyGIrjAjxnIiDG/vIWOW+PITaDBzY7XTyIK1YtH+8XtF7//huvphbDj4t
 hjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zgaDDh4BUeyEBjSVBWx2i16ce3Mp8d1zatBCmh68Njs=;
 b=dZ5HKYjkvuaEZDaJldXUCxra8Pk781x9sNbLh0Tmd+vvDxuOH4TBH09e8kmOxWPDOJ
 qfgOkvrcofCtUgtgewX3jU7UJuP9FOzkjWMumAQDkaHmRLIhTjtLqBSNE52oeri1wIww
 WERF9t3Vwiz7P2lZN+DE91azyy7pAt2FUiU0E/SRCLmNJjS0jeSvMMMf76Fp5nkn86ui
 45NQHtY5k8qRapTxxRaDtT+1VYMtX2E+nkn7M3o04KVOhRnpC7eYrO8/BB0TZ3sW1RHW
 KjgEAm1hIh1A+OGZaD8M5h5n4c2/WbKH4Yt9gp13hjXnMs2gbejVLwwqdb1oTq6o4K2J
 R3NQ==
X-Gm-Message-State: AOAM533XCeMD8w4eSpfiChkI9Dsfl5yt/VEfix8rIOBeeoBSpSZu53j8
 RAjk4SAcmjdPwSzy+w8bEVE=
X-Google-Smtp-Source: ABdhPJyt83TO8FVBQMwQgJp4Ea5UUt4m4YH828W/K6Lk8CqG4H2PP+Go8XhmZqX77olKMuKZi8V2uw==
X-Received: by 2002:a17:902:bf0b:b029:ec:b656:6357 with SMTP id
 bi11-20020a170902bf0bb02900ecb6566357mr2231222plb.66.1619739586465; 
 Thu, 29 Apr 2021 16:39:46 -0700 (PDT)
Received: from [192.168.1.67] (99-44-17-11.lightspeed.irvnca.sbcglobal.net.
 [99.44.17.11])
 by smtp.gmail.com with ESMTPSA id d199sm95891pfd.187.2021.04.29.16.39.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 16:39:45 -0700 (PDT)
Subject: Re: [PATCH net-next 2/4] net: dsa: mt7530: add interrupt support
To: DENG Qingfang <dqfext@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Cc: Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo
 <gch981213@gmail.com>, =?UTF-8?Q?Ren=c3=a9_van_Dorst?=
 <opensource@vdorst.com>, Frank Wunderlich <frank-w@public-files.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
References: <20210429062130.29403-1-dqfext@gmail.com>
 <20210429062130.29403-3-dqfext@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <18aa9a3b-e286-86b2-8b9b-e519ad884d77@gmail.com>
Date: Thu, 29 Apr 2021 16:39:36 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210429062130.29403-3-dqfext@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_163947_671188_4201FC2C 
X-CRM114-Status: GOOD (  21.30  )
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



On 4/28/2021 11:21 PM, DENG Qingfang wrote:
> Add support for MT7530 interrupt controller to handle internal PHYs.
> In order to assign an IRQ number to each PHY, the registration of MDIO bus
> is also done in this driver.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---

[snip]

> +static int
> +mt7530_setup_irq(struct mt7530_priv *priv)
> +{
> +	struct device *dev = priv->dev;
> +	struct device_node *np = dev->of_node;
> +	int ret;
> +
> +	if (!of_property_read_bool(np, "interrupt-controller")) {
> +		dev_info(dev, "no interrupt support\n");
> +		return 0;
> +	}
> +
> +	priv->irq = of_irq_get(np, 0);

Using platform_get_irq() may be a bit nicer to avoid using too many
OF-centric APIs, but this does not have to be changed right now.
Likewise for the interrupt-controller above.

> +	if (priv->irq <= 0) {
> +		dev_err(dev, "failed to get parent IRQ: %d\n", priv->irq);
> +		return priv->irq ? : -EINVAL;
> +	}
> +
> +	priv->irq_domain = irq_domain_add_linear(np, MT7530_NUM_PHYS,
> +						 &mt7530_irq_domain_ops, priv);
> +	if (!priv->irq_domain) {
> +		dev_err(dev, "failed to create IRQ domain\n");
> +		return -ENOMEM;
> +	}
> +
> +	/* This register must be set for MT7530 to properly fire interrupts */
> +	if (priv->id != ID_MT7531)
> +		mt7530_set(priv, MT7530_TOP_SIG_CTRL, TOP_SIG_CTRL_NORMAL);
> +
> +	ret = request_threaded_irq(priv->irq, NULL, mt7530_irq_thread_fn,
> +				   IRQF_ONESHOT, KBUILD_MODNAME, priv);

Maybe dev_name() would be more unique in case a system happens to have
more switches in the future so you can easily differentiate them.

> +	if (ret) {

Can you call mt7530_free_irq() to avoid the error repetition?

> +		irq_domain_remove(priv->irq_domain);
> +		dev_err(dev, "failed to request IRQ: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void
> +mt7530_free_mdio_irq(struct mt7530_priv *priv)
> +{
> +	int p;
> +
> +	for (p = 0; p < MT7530_NUM_PHYS; p++) {
> +		if (BIT(p) & priv->ds->phys_mii_mask) {
> +			unsigned int irq;
> +
> +			irq = irq_find_mapping(priv->irq_domain, p);
> +			irq_dispose_mapping(irq);
> +		}
> +	}
> +}
> +
> +static void
> +mt7530_free_irq_common(struct mt7530_priv *priv)
> +{
> +	free_irq(priv->irq, priv);
> +	irq_domain_remove(priv->irq_domain);
> +}
> +
> +static void
> +mt7530_free_irq(struct mt7530_priv *priv)
> +{
> +	mt7530_free_mdio_irq(priv);
> +	mt7530_free_irq_common(priv);
> +}
> +
> +static int
> +mt7530_setup_mdio(struct mt7530_priv *priv)
> +{
> +	struct dsa_switch *ds = priv->ds;
> +	struct device *dev = priv->dev;
> +	struct mii_bus *bus;
> +	static int idx;
> +	int ret;
> +
> +	bus = devm_mdiobus_alloc(dev);
> +	if (!bus)
> +		return -ENOMEM;
> +
> +	ds->slave_mii_bus = bus;
> +	bus->priv = priv;
> +	bus->name = KBUILD_MODNAME "-mii";
> +	snprintf(bus->id, MII_BUS_ID_SIZE, KBUILD_MODNAME "-%d", idx++);

Likewise using dev_name() here would provide an unique name in case you
have multiple switches.

Feel free to address my comments later, they do not seem to be blocking:

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
