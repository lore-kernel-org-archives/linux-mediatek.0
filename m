Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63041C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 11:04:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E76A52242A
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 11:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E76A52242A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kvY6waKp4mOK8RRvxYCQ9k1E9PALAUU+RU8ncn70aEE=; b=ZlpQkacqUUDGEt8FY2AJ9gpEZ
	EavVYROYa8auFB5VK+g9KDBubwZ7Uh2LgE+/TQxI+1M0QJfdOawy/uq24cuRxOw+Dcsgn5K27Jrsh
	/Cvelyg7YdEESkRTcWG+0xtcviGvTUlFh0e0V4t2SvIowmIQMXIMobKiCyXR/sL+wcu8PXdcYYTa7
	IFljlynk4kMwUP/qHoxo8gMcz3jmSH4DUB/y6Ha+tQIlTZc6OCzhthN8VpSz21y6dmLrczWxDmX4+
	cwHOrj3LCmZ3LPEXl2+clBNkxq0EgfmRzMRdZjKiM/tOr4n9Hp4LlVZM6awJ3fJiYPIzENGh7FTQT
	sOglf6EMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyuzs-0000Oo-R1; Mon, 11 Jan 2021 11:04:28 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyuzo-0000NR-Ix; Mon, 11 Jan 2021 11:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L+GBxSxQTI4Xb+fBuV7rsaceskolDWPmYIZDlSCrKEA=; b=Sb6+uLCnIDe9NNSGTDhKzutUR
 3XCa5whm7rOxRR2NqRXfjjnuMhKhz2ginjFbvJi/KOEwMYKQnkby0iYFFyVCayFxgrXbSoMdYUeV6
 tmD562vzE6D9MZp/yRnWkbzGbjHzv90Haeejy9+IRa/plE6JHMM7ZFF7ExcVtAr+Pa/F1de836+79
 2pLD9tOzsHgdMbVvoxq9jydHrE/N3CMs96arbO/hEI0LLvSbHSMhJX65fS+I35XiZO05y4XTGbXFj
 EsUTwkmUBuZ1zWjWu8C6OUA5u/gmQ7cssfqiftQLA1J3MD2cLhpgj+7yRoxjWQSBEQ0wugwRfKcO8
 TB485TmFg==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46558)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1kyuzb-0006rM-1o; Mon, 11 Jan 2021 11:04:11 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1kyuzX-0005At-T2; Mon, 11 Jan 2021 11:04:07 +0000
Date: Mon, 11 Jan 2021 11:04:07 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: DENG Qingfang <dqfext@gmail.com>
Subject: Re: [PATCH net-next 2/2] drivers: net: dsa: mt7530: MT7530 optional
 GPIO support
Message-ID: <20210111110407.GR1551@shell.armlinux.org.uk>
References: <20210111054428.3273-1-dqfext@gmail.com>
 <20210111054428.3273-3-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210111054428.3273-3-dqfext@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_060424_675179_D5FF9941 
X-CRM114-Status: GOOD (  12.21  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Frank Wunderlich <frank-w@public-files.de>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 11, 2021 at 01:44:28PM +0800, DENG Qingfang wrote:
> +static int
> +mt7530_gpio_direction_output(struct gpio_chip *gc, unsigned int offset, int value)
> +{
> +	struct mt7530_priv *priv = gpiochip_get_data(gc);
> +	u32 bit = mt7530_gpio_to_bit(offset);
> +
> +	mt7530_set(priv, MT7530_LED_GPIO_DIR, bit);
> +	mt7530_set(priv, MT7530_LED_GPIO_OE, bit);
> +	mt7530_gpio_set(gc, offset, value);

FYI, Documentation/driver-api/gpio/consumer.rst says:

  For output GPIOs, the value provided becomes the initial output value.
  This helps avoid signal glitching during system startup.

Setting the pin to be an output, and then setting its initial value
does not avoid the glitch. You may wish to investigate whether you
can set the value before setting the pin as an output to avoid this
issue.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
