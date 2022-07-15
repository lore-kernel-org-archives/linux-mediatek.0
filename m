Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA7FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 17:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uzkdv8Dc9Ar4VBcn4GaayOprsDjBshT27fyNEPPxRGo=; b=MqDyqfof4ndVhzYoZlvkYyz3GX
	ETQYzo7TZzoeXAb3sctVU4gtSECplgClWooMsWE8DeYnApw7Ir1E74XnHNtcgXIlou8ksKb9Z564a
	XTpzyGg8OpN8fjhXs/GFsfDa+21aacqUjWXo+VNhEfiStb7/GiS8wBbIhaQXy5nfL2UmHeQJPb3Yg
	acc29G0v7SAkw5uJdwzY1JWQRmUIgBVZ3z01Mq28F2K9J8DHRQDOgM7m2e5Vy8H8U6vvryawYMBOT
	+BlLB1E9HNCO+d3q3KFIjWjkingVK5PPOl1TjCgXAvvwP3TsOh/L4cCopY2x+VK6+MCKECXZsUcWr
	cvxdCQhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCP3q-0098pF-FU; Fri, 15 Jul 2022 17:25:06 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCP3a-0098j9-NQ; Fri, 15 Jul 2022 17:24:52 +0000
Received: by mail-ed1-x52b.google.com with SMTP id g1so7130132edb.12;
        Fri, 15 Jul 2022 10:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=uzkdv8Dc9Ar4VBcn4GaayOprsDjBshT27fyNEPPxRGo=;
        b=JUwWMv0ZzCp2g0wjmfhiQKPpxgYLDVk8Bg2DyDo9Nv2vPSfd4QlapKyKP8FZdKkrFc
         7eERvbWxPsVlaTQHmvMnihm8UJCfDaon/IhDJ8mvs6GITYempO4YeZ1VtXWCAuoagOLv
         04kwSfFeHfEoT/OCXdSWWkEcjSqjW188bJ9P0NEkeOEl+xrSTHN4CtXpYHNDWUBbLpxO
         YD8S2ulqe8kgtWrzgGCR/v0e9vq97PtpYq0TKnQmouIaPzHtQqB7Wf4vDH6PqEoZ/T3a
         OWjGLeSDymCeGZusix2ILZHOmKUODHHj7EEle1ll1IaHPOcgkO2XQwId7AHbJu5Mnq7G
         CKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=uzkdv8Dc9Ar4VBcn4GaayOprsDjBshT27fyNEPPxRGo=;
        b=JjZ/MDW3nk0v9V0rDVhMhhWFh6BgdoQC5GmS6sDn4pN8/Buy5gnQaVWZwXTtAYu1MT
         XheSf2z9UFpVxqbm4rnKgM2Aec3fJdlq8AsNliC6XSLicfHW/J9m5H0/GzB4SGO2R5tM
         QD+zUGCmPMtGQFDuYTEqpKk2hde2I0Ik4f1FUq6w0Z1sBuYTIBl8tdz8QvhQPAJ7kL4P
         s+K1h8jca6xXda7fNmimr8Mogh+xft9PAWesnKZnhJXR2evw3DZax43XzQaNyDVxKUKN
         K08VXbsIB2J18Pt1L1gAu48uAZW3UBDtYlM0prymKKFuBN7muCMBFYVWXcrDvcRWWiyL
         YJhw==
X-Gm-Message-State: AJIora+H4k18+yZRcAvTdzdWEQGlEujh4Jc2zCK3k6dMi+IGMUFvGD/l
	NPJcqQKMhHx7tz2FDok3Q/I=
X-Google-Smtp-Source: AGRyM1vuepFFiSFjYf3MRujnZNcXH+xzL522xFIr0DTGyEcuYI+92aAtZbe7Ugkj9wCdR0bqIYTxKw==
X-Received: by 2002:a05:6402:2802:b0:43a:9098:55a0 with SMTP id h2-20020a056402280200b0043a909855a0mr20176419ede.179.1657905888078;
        Fri, 15 Jul 2022 10:24:48 -0700 (PDT)
Received: from skbuf ([188.25.231.115])
        by smtp.gmail.com with ESMTPSA id fu20-20020a170907b01400b0072af2460cd6sm2228086ejc.30.2022.07.15.10.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 10:24:47 -0700 (PDT)
Date: Fri, 15 Jul 2022 20:24:44 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alvin __ipraga <alsi@bang-olufsen.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Daniel Scally <djrscally@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	George McCollister <george.mccollister@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sean Wang <sean.wang@mediatek.com>, UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Subject: Re: [PATCH net-next 3/6] net: dsa: add support for retrieving the
 interface mode
Message-ID: <20220715172444.yins4kb2b6b35aql@skbuf>
References: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
 <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
 <E1oCNl3-006e3n-PT@rmk-PC.armlinux.org.uk>
 <E1oCNl3-006e3n-PT@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E1oCNl3-006e3n-PT@rmk-PC.armlinux.org.uk>
 <E1oCNl3-006e3n-PT@rmk-PC.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_102450_809934_E7C41F7E 
X-CRM114-Status: GOOD (  21.22  )
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

On Fri, Jul 15, 2022 at 05:01:37PM +0100, Russell King (Oracle) wrote:
> DSA port bindings allow for an optional phy interface mode. When an
> interface mode is not specified, DSA uses the NA interface mode type.
> 
> However, phylink needs to know the parameters of the link, and this
> will become especially important when using phylink for ports that
> are devoid of all properties except the required "reg" property, so
> that phylink can select the maximum supported link settings. Without
> knowing the interface mode, phylink can't truely know the maximum
> link speed.
> 
> Update the prototype for the phylink_get_caps method to allow drivers
> to report this information back to DSA, and update all DSA
> implementations function declarations to cater for this change. No
> code is added to the implementations.
> 
> Reviewed-by: Marek Behún <kabel@kernel.org>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
(...)
> diff --git a/include/net/dsa.h b/include/net/dsa.h
> index b902b31bebce..7c6870d2c607 100644
> --- a/include/net/dsa.h
> +++ b/include/net/dsa.h
> @@ -852,7 +852,8 @@ struct dsa_switch_ops {
>  	 * PHYLINK integration
>  	 */
>  	void	(*phylink_get_caps)(struct dsa_switch *ds, int port,
> -				    struct phylink_config *config);
> +				    struct phylink_config *config,
> +				    phy_interface_t *default_interface);

I would prefer having a dedicated void (*port_max_speed_interface),
because the post-phylink DSA drivers (which are not few) will generally
not need to concern themselves with implementing this, and I don't want
driver writers to think they need to populate every parameter they see
in phylink_get_caps. So the new function needs to be documented
appropriately (specify who needs and who does not need to implement it,
on which ports it will be called, etc).

In addition, if we have a dedicated ds->ops->port_max_speed_interface(),
we can do a better job of avoiding breakage with this patch set, since
if DSA cannot find a valid phylink fwnode, AND there is no
port_max_speed_interface() callback for this driver, DSA can still
preserve the current logic of not putting the port down, and not
registering it with phylink. That can be accompanied by a dev_warn() to
state that the CPU/DSA port isn't registered with phylink, please
implement port_max_speed_interface() to address that.

