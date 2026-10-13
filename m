Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2096ECC6B0E
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 08:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3JNpbINCT92aZsJBPxNLGKRhNWG0Yp/YqatqTdttoJg=; b=IiuEtwJYb5TpiQXISMctzMcav8
	mpXDqyYOjYx8neTyljW5xFDZlT0rBCwZg25jYmL/Q1dqO+nInF5WENhmESv7zeLSIKFcgImp/vxp3
	b5jIP/lgAX/RrThUM6yPT8U8aoHgWrIGNE7POefsDDEEYWo0v0gck63Xivuwyo6Km88oZg6Q5vRev
	4VJLtWGPyRQnt5RHiePeQs24UV7jRQa5q5BI1FhcqeD4d7hI6nG7q6laZRzAmnFOFDm1yRfZyqWgz
	Y6eWDPuOexHyQ+fEsS4h9k9Y9DULhbCu6bGECzaI/uHTD1855J54JUBxQyxgUqT2TScIXwum+i5f1
	FhNVQ4EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXSQ-0000000CHTT-49rr;
	Tue, 13 Oct 2026 08:01:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXSN-0000000CHSg-1YFJ
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 08:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791878514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3JNpbINCT92aZsJBPxNLGKRhNWG0Yp/YqatqTdttoJg=;
	b=EO3d3dgHssZdEF9EWkZ3I9EgQCR/R6yIN1JaqO70pxBD7HOUPRntQqZpcEc+R6aoFUMSDI
	nzEAHo1JFpfggO7PUYDZzUqgqZ7GEoV2rc/4zQpdfzK61rX9vE6sAK1fRTrMt9QqxXNwp9
	Gi/tHl5STvE0KRgVpwSwPzSqv5L5Ftc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-lWNbxkGyO4aqmt-fuJKy8w-1; Tue, 13 Oct 2026 08:01:52 +0000
X-MC-Unique: lWNbxkGyO4aqmt-fuJKy8w-1
X-Mimecast-MFC-AGG-ID: lWNbxkGyO4aqmt-fuJKy8w_1791878511
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6a5d57a8d51so3019675a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 01:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791878511; x=1792483311;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3JNpbINCT92aZsJBPxNLGKRhNWG0Yp/YqatqTdttoJg=;
        b=bQOTts6MJVYUu/OhzvOXA0hDdVV1eedTUsaT7ptNPHLc8yJK+uaHlk0jpOxjCc/HBr
         ADlyWLdJmxpA99H/rPUpstCgYWUt+VpFouOsE8h+zxbwqDb99lCb7k2F+kslLHAUbkqX
         1cgNbQuCmWuNqiw+Tn5tFRFVQkPVKz6YGhLwJqLzABKWKUAEXoGYRyE9sUM2yvL9SWGo
         W4m04mYwWC1e3trvZiHDaepcfa+WKRf1Uyvy1Xu+Qom0dZNEVZDXthblGhcLJZnQTCBv
         44FHW2gmoz9gb63N90nr9WWDNhD4sQh+JHc/Gc/AOMbNIGx7wlWuu6MdejavpU3g/oNm
         wEUA==
X-Forwarded-Encrypted: i=1; AKwUvBxPjTBq9VKzUAlkYV9nOMv59qQyXegPLNdfh3084n5j9yR5a5Q8LbTlvFOgWhsDkdR2Di0y610R0RbNnv+DNw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLvxVD1Ppzdcw6xMvrSMyfR4XK5jG0LCmWMdW9v+x+2GslX1u6A
	OhTx4LnLjFXuNG9jDbrKwVKzlovxis7v2Q4ocQr3jtz4P6G/LRr4E/CdFEwO0Kh2ibroIhbAn33
	STSV0SLGN5vQqsEE4lgbR1p2gLZTtiyCy7y50DEeZbVBpM5iy3gRNP+E7VPuqH7dwm9Yn83jHmA
	==
X-Gm-Gg: AYBFou2Ju2YO/jKAJFmPFGX835qQK9Lx71s9jq3tL3+74WuU78DeiNqZDERn+NkaQub
	yCE7LmR6L/1C76dH7o1v98sXadQiU95966iBUL47j8AOJ7HViUGKp+KWHvLN96TSO79wuJfgG0A
	pXW7pzhBVXaH+GjHFGBTWJTdVdi9TUyLgd5ByOzL1njpSESluELICsKHz2A/lJDaxedjPzD3giC
	IDYb1ZOrdppVs7G0EAiJzAsg4IANxfcjEak4v8sHbDPhp3dN5dclkZywgWohLg8rYlGQx0UNTMY
	Ph7MpbFFc+NGLXuyWp+nWC4BGqdtDB11UK/b80XqSrpGz4ZRJRk5f4Af8gwQidY6c7wHI0J5Mwc
	LdwDQDZZmH96fbMsTPCbojZv+/6GDnc0Of4dCWsDZ1yc66ns0x0+R99m+SByGgbkwx8rYJISTbg
	==
X-Received: by 2002:a05:6402:a6cc:20b0:6b1:df89:7df7 with SMTP id 4fb4d7f45d1cf-6b1df899148mr1522582a12.3.1791878510905;
        Tue, 13 Oct 2026 01:01:50 -0700 (PDT)
X-Received: by 2002:a05:6402:a6cc:20b0:6b1:df89:7df7 with SMTP id 4fb4d7f45d1cf-6b1df899148mr1522525a12.3.1791878510286;
        Tue, 13 Oct 2026 01:01:50 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ab4053sm3308846f8f.21.2026.10.13.01.01.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 01:01:49 -0700 (PDT)
Message-ID: <91736242-7836-4eef-9415-738e48a63a52@redhat.com>
Date: Tue, 13 Oct 2026 10:01:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 2/3] net: phylink: wait for PHYs that are
 known to probe late
To: Aleksei Sviridkin <f@lex.la>, Russell King <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20261006124731.1528963-1-f@lex.la>
 <20261006124731.1528963-3-f@lex.la>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261006124731.1528963-3-f@lex.la>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _jXZxMEghCuYnXUhlnRuZ4BTHVZYfenBBnpspW-IiJ8_1791878511
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_010156_432940_A0284C78 
X-CRM114-Status: GOOD (  56.01  )
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

On 10/6/26 14:47, Aleksei Sviridkin wrote:
> A PHY that needs firmware from the host and whose driver has not bound
> when the MAC sets up its port is either taken by the generic driver,
> which cannot drive it, or not found at all; a MAC that connects once at
> setup, as DSA does, gets no working PHY on that port for the rest of the
> uptime. The case this reaches is a driver built as a module on a
> filesystem that is mounted after the MAC probes. Let the PHY declare it
> with needs-host-firmware and, for a MAC that opts in with
> phy_may_probe_late, poll until the driver binds instead of failing. A
> driver that has bound is not covered, whatever it does about firmware
> afterwards. Neither is one whose probe has already failed: the driver
> core does not retry it, and the poller cannot tell that apart from a
> driver that has yet to load, so it keeps polling.
> 
> Deferring the MAC's own probe is not an option: it keeps every port of
> that MAC down until the module loads, and forever if it never does, and
> those ports can include the one needed to mount the filesystem that
> holds the module. Return 0 rather than -ENODEV, because DSA reads
> -ENODEV as permission to look for the PHY on the switch's internal MDIO
> bus, which is the wrong device.
> 
> The deferral is opt-in because it returns 0 with no PHY attached, and
> some callers read 0 as a PHY being there: ucc_geth dereferences
> dev->phydev later in the same open, and enetc, stmmac, mvneta, sparx5
> and lan743x do one-time PHY setup at that point that a late attach
> would skip.
> 
> The deferral also needs an interface mode known up front, as without one
> the MAC would be configured for PHY_INTERFACE_MODE_NA when started
> before the PHY supplies its own. It is limited to PHY mode without an
> SFP cage: in-band, the PCS can bring the link up with no PHY to gate it,
> and an SFP PHY can take the port while the wait is armed and drop the
> wait on removal. The poll runs only while phylink is started, so nothing
> touches the PHY of a stopped port, as at switch shutdown; a port that is
> down attaches at its next start.
> 
> Wait for a driver that has bound, not for a device that exists, because
> the generic driver would otherwise bind and cannot drive such a PHY. If
> the real driver goes away between that test and the attach, the generic
> one binds instead or the attach fails; when the driver is gone after the
> attach, the poll keeps waiting without counting a failed connect. The
> attach-versus-unbind window itself is phylib's to close and is not
> closed here.
> 
> A connect that fails with the real driver bound is retried a few times
> and then given up on with one line, because silence from a poller reads
> like success. Each retry re-runs the PHY's init and, on boards whose DT
> gives it a reset line, pulses that reset, at a cost that depends on the
> board and the PHY, so the retries are bounded. Stopping after the first
> failure would leave a DSA port, which connects once, dead until the
> switch driver is rebound.
> 
> Until a PHY attaches, report no link modes and refuse the ethtool
> settings that would configure the MAC alone for a link that cannot come
> up.
> 
> Found on a Keenetic KN-1012 (MT7981B with an MT7531 switch): the EN8811H
> behind lan4 has its driver on the root filesystem, the switch sets its
> ports up before that is mounted, and lan4 was lost for the uptime. With
> this change and the DSA opt-in that follows, lan4 attaches once the
> module has loaded and the port is up. The retry path was driven there by
> a local debug parameter that fails the connect after a successful
> attach: two injected failures were retried a second apart and the third
> attempt attached, and with failures that never stop, four attempts ended
> in one "giving up" line and no further polls.
> 
> Assisted-by: LLM
> Signed-off-by: Aleksei Sviridkin <f@lex.la>
> ---
> Changes in v6:
>   - defer only in MLO_AN_PHY and without an SFP bus
>   - poll only while started: phylink_start() queues the poll,
>     phylink_stop() cancels it, the poller's STOPPED test is gone
>   - a failed attach with no usable driver is a lost race, not a retry
>   - commit message: ndo_open argument dropped, board sentence updated
> 
>   drivers/net/phy/phylink.c | 232 ++++++++++++++++++++++++++++++++++++--
>   include/linux/phylink.h   |   5 +
>   2 files changed, 229 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index a7d086cdc9b2..ec76138f1065 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -98,6 +98,16 @@ struct phylink {
>   
>   	u32 wolopts_mac;
>   	u8 wol_sopass[SOPASS_MAX];
> +
> +	/* The poller writes these while it runs; arming cancels it first. */
> +	struct fwnode_handle *late_phy_fwnode;
> +	u32 late_phy_flags;
> +	struct delayed_work late_phy_poll;
> +	unsigned int late_phy_poll_ms;
> +	unsigned int late_phy_waited_ms;
> +	u8 late_phy_retries;
> +	bool late_phy_warned;
> +	bool late_phy_gave_up;
>   };
>   
>   #define phylink_printk(level, pl, fmt, ...) \
> @@ -1831,6 +1841,18 @@ int phylink_set_fixed_link(struct phylink *pl,
>   }
>   EXPORT_SYMBOL_GPL(phylink_set_fixed_link);
>   
> +static void phylink_late_phy_poll(struct work_struct *work);
> +
> +/* Synchronous: the poller reads the node put here. It only trylocks
> + * rtnl, so a caller holding rtnl cannot deadlock on it.
> + */
> +static void phylink_late_phy_cancel(struct phylink *pl)
> +{
> +	cancel_delayed_work_sync(&pl->late_phy_poll);
> +	fwnode_handle_put(pl->late_phy_fwnode);
> +	pl->late_phy_fwnode = NULL;
> +}
> +
>   /**
>    * phylink_update_pause_state() - Update the phylink pause frame configuration
>    * @pl: a pointer to a &struct phylink instance
> @@ -1989,6 +2011,7 @@ struct phylink *phylink_create(struct phylink_config *config,
>   	mutex_init(&pl->phydev_mutex);
>   	mutex_init(&pl->state_mutex);
>   	INIT_WORK(&pl->resolve, phylink_resolve);
> +	INIT_DELAYED_WORK(&pl->late_phy_poll, phylink_late_phy_poll);
>   
>   	pl->config = config;
>   	if (config->type == PHYLINK_NETDEV) {
> @@ -2068,6 +2091,8 @@ EXPORT_SYMBOL_GPL(phylink_create);
>    */
>   void phylink_destroy(struct phylink *pl)
>   {
> +	phylink_late_phy_cancel(pl);
> +
>   	sfp_bus_del_upstream(pl->sfp_bus);
>   	if (pl->link_gpio)
>   		gpiod_put(pl->link_gpio);
> @@ -2337,10 +2362,8 @@ static int phylink_bringup_phy(struct phylink *pl, struct phy_device *phy,
>   }
>   
>   static int phylink_attach_phy(struct phylink *pl, struct phy_device *phy,
> -			      phy_interface_t interface)
> +			      phy_interface_t interface, u32 flags)
>   {
> -	u32 flags = 0;
> -
>   	if (WARN_ON(pl->cfg_link_an_mode == MLO_AN_FIXED))
>   		return -EINVAL;
>   
> @@ -2378,7 +2401,7 @@ int phylink_connect_phy(struct phylink *pl, struct phy_device *phy)
>   		pl->link_config.interface = pl->link_interface;
>   	}
>   
> -	ret = phylink_attach_phy(pl, phy, pl->link_interface);
> +	ret = phylink_attach_phy(pl, phy, pl->link_interface, 0);
>   	if (ret < 0)
>   		return ret;
>   
> @@ -2390,6 +2413,134 @@ int phylink_connect_phy(struct phylink *pl, struct phy_device *phy)
>   }
>   EXPORT_SYMBOL_GPL(phylink_connect_phy);
>   
> +#define PHYLINK_LATE_PHY_POLL_MS	1000
> +#define PHYLINK_LATE_PHY_WARN_MS	60000
> +#define PHYLINK_LATE_PHY_POLL_MAX_MS	30000
> +#define PHYLINK_LATE_PHY_RETRIES	3
> +
> +static bool phylink_late_phy_pending(struct phylink *pl)
> +{
> +	return pl->late_phy_fwnode && !pl->phydev;
> +}
> +
> +/* Stale the moment it returns: the device lock this wants cannot be held
> + * across the attach, whose own failure path takes it again.
> + */
> +static bool phylink_phy_is_usable(struct phy_device *phy_dev)
> +{
> +	return phy_dev && device_is_bound(&phy_dev->mdio.dev) && phy_dev->drv;
> +}
> +
> +static void phylink_late_phy_backoff(struct phylink *pl)
> +{
> +	pl->late_phy_poll_ms = min_t(unsigned int, pl->late_phy_poll_ms * 2,
> +				     PHYLINK_LATE_PHY_POLL_MAX_MS);
> +}
> +
> +static void phylink_late_phy_poll(struct work_struct *work)
> +{
> +	struct phylink *pl = container_of(to_delayed_work(work), struct phylink,
> +					  late_phy_poll);
> +	struct phy_device *phy_dev;
> +	bool again = false, lost_race = false;
> +	int ret;
> +
> +	if (!rtnl_trylock()) {
> +		pl->late_phy_waited_ms += pl->late_phy_poll_ms;
> +		goto requeue;
> +	}
> +
> +	/* A PHY arrived by another path while queued. */
> +	if (!phylink_late_phy_pending(pl)) {
> +		rtnl_unlock();
> +		return;
> +	}
> +
> +	/* Stable here: whoever clears it waits for this work first. */
> +	phy_dev = fwnode_phy_find_device(pl->late_phy_fwnode);
> +	if (!phylink_phy_is_usable(phy_dev)) {
> +		if (phy_dev)
> +			phy_device_free(phy_dev);
> +
> +		if (!pl->late_phy_warned &&
> +		    pl->late_phy_waited_ms >= PHYLINK_LATE_PHY_WARN_MS) {
> +			pl->late_phy_warned = true;
> +			phylink_warn(pl,
> +				     "still waiting for %pfw (needs-host-firmware)\n",
> +				     pl->late_phy_fwnode);
> +		}
> +		/* Past the warn it may never come: stop paying 1 Hz for it. */
> +		if (pl->late_phy_waited_ms >= PHYLINK_LATE_PHY_WARN_MS)
> +			phylink_late_phy_backoff(pl);
> +		/* The first run is immediate, so count the sleep ahead. */
> +		pl->late_phy_waited_ms += pl->late_phy_poll_ms;
> +		rtnl_unlock();
> +		goto requeue;
> +	}
> +
> +	ret = phylink_attach_phy(pl, phy_dev, pl->link_interface,
> +				 pl->late_phy_flags);
> +	if (!ret && phy_driver_is_genphy(phy_dev)) {
> +		/* Lost the race: the attach bound the generic driver, which
> +		 * is the outcome this poller exists to avoid.
> +		 */
> +		phy_detach(phy_dev);
> +		lost_race = true;
> +		ret = -EAGAIN;
> +	} else if (ret && !phylink_phy_is_usable(phy_dev)) {
> +		/* The driver went away under the attach: wait for it again. */
> +		lost_race = true;
> +	}
> +	if (!ret) {
> +		ret = phylink_bringup_phy(pl, phy_dev,
> +					  pl->link_config.interface);
> +		if (ret) {
> +			phy_detach(phy_dev);
> +		} else {
> +			/* Only a major config programs the masks bringup
> +			 * narrowed.
> +			 */
> +			mutex_lock(&pl->state_mutex);
> +			pl->force_major_config = true;
> +			mutex_unlock(&pl->state_mutex);
> +			/* MAC before the PHY, the order a start uses. */
> +			phylink_run_resolve(pl);
> +			flush_work(&pl->resolve);
> +			phy_start(phy_dev);
> +		}
> +	}
> +	if (lost_race) {
> +		/* Not a failed connect: the next poll waits for the real
> +		 * driver.
> +		 */
> +		again = true;
> +	} else if (ret) {

The above `if` chains feels unneedly complex. I think you can simplify
it consolidating the out/error paths using more labels.

/P


