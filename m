Return-Path: <SRS0=5OX0=OD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C1EC43217
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 17:21:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C855C610A2
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 17:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C855C610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qIlp/zkLfsmib7WBjBGHYhZcEQXUkswhKRkBMIPpYrc=; b=retnAel3wgJ1et
	5U5Ueb73dGLn18GexMHyqHOyOcKP13veUg01Yck1yvuWj91IFAFwzLgLeb6EiyR+n7q5yK8EYh5uw
	E22v+TRhAMObP5T4JVqZS2bM0id2xh9F+7YeTNBavJ4LxsOPxIpRIK7WLJ5CJZgQtgzPZ01SU/+PY
	/IQd23kmk2E4PoeavBCrBwEvnumfJLaGA+Qk00ALsrckesY9TZ8gT5x95lFzI7Mcxuke9gi/Gw9Hm
	pRVs+A/nxAW+ZZ7loWPvPnnfspFBtzOhUx0L+BQ/lcvno7exhqnnI0Y8fc1dMcmRFnzISMSfh3OU5
	yq4NgNCG74vYcY9KkzFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPpeI-002enr-Ae; Mon, 13 Sep 2021 17:21:42 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPpFc-002Xkb-SA; Mon, 13 Sep 2021 16:56:14 +0000
Received: by mail-pj1-x102d.google.com with SMTP id t20so6783320pju.5;
 Mon, 13 Sep 2021 09:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=s7JXjudNAvVAT8INF+9UU5Gmm38N1/XGnQ2A94jG1bk=;
 b=SX5baUWspzyFSQ2AFuob8sstRM5Ha/Y1VxXQEQgIbgOJFaTfvJkC2iAgL52ErHsZ0i
 xmiV1acAbL+M1taGIYFo6nMLcaU424EyH1TAEOb7UVY/TofnN+/DNYtP2z6Qo4LG9hL8
 X6eTlEtbh+fOzN61hHvmV+GfRkHlQcUwO7X/BOvbnB14pO23728IHXRLYNi6CVN1a740
 4n6Ri3BZbplT2QEuUdBqf2hTIltST4r7SZadpaLQkzz35l0LeTToi8d2L6H2T1jtqPQv
 44yLmDtskYqHFB1YCNFGEuNlUPHDV9q2sgEUMtLDHoaffvhyGbHdXeWH26iV2NaRicI9
 4N/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s7JXjudNAvVAT8INF+9UU5Gmm38N1/XGnQ2A94jG1bk=;
 b=jR+n50t5DXuIk3XwmPFmB9MC1n/Mc8i8kFQDhCFCO9V4LhLU8xzo6GMA2w+L91e4Mu
 4J6c0qgOd4ohLlERdMluTMJjpk13QtPl6ntojstMmbcriU9Fs6pWWuM+9AdPg079zsSr
 GmCZ2Ebjo1k02slSQ4NX5OToR0PsicrBGFHAamOx8HnXNBk11gOHtnV6llZNzqhljwVK
 TfZtqCXLF4CSWV4/Wz2PI3ccyqLGLZP5rIUQJBlqZzQsjeuOsGu0x4D6utzKdnZS+Z+I
 +VkgHsNp1r1ZzuIwIcpr9xFET+R/b4Wkawu1E8NcxxLeOC0ipFeAhj0KrR2RA1qeKjC8
 zoEQ==
X-Gm-Message-State: AOAM531oQJV4etBK/dz/UcmrXLKFyEwVKiE1bl63IKL/w+01tznkmgeU
 erS3RJL5y+OsaUCB0dc/D1I=
X-Google-Smtp-Source: ABdhPJyoLFc+poLIjiuG0ZAogAYR00iOdxLlkK0HZFX9tOSs/Mi7cwpVZhz13ZDtTRsX3WUyIkMWMw==
X-Received: by 2002:a17:90b:1212:: with SMTP id
 gl18mr484897pjb.146.1631552172057; 
 Mon, 13 Sep 2021 09:56:12 -0700 (PDT)
Received: from [192.168.1.121] (99-44-17-11.lightspeed.irvnca.sbcglobal.net.
 [99.44.17.11])
 by smtp.gmail.com with ESMTPSA id mi18sm7945827pjb.15.2021.09.13.09.56.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 09:56:11 -0700 (PDT)
Message-ID: <7ba3fe1c-009a-15b4-3049-4fd9d96dbf3f@gmail.com>
Date: Mon, 13 Sep 2021 09:56:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH net 2/5] net: dsa: be compatible with masters which
 unregister on shutdown
Content-Language: en-US
To: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Kurt Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens <hauke@hauke-m.de>,
 Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 George McCollister <george.mccollister@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Oleksij Rempel <linux@rempel-privat.de>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Lino Sanfilippo <LinoSanfilippo@gmx.de>
References: <20210912120932.993440-1-vladimir.oltean@nxp.com>
 <20210912120932.993440-3-vladimir.oltean@nxp.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20210912120932.993440-3-vladimir.oltean@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_095613_026555_6CFD224B 
X-CRM114-Status: GOOD (  42.13  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 9/12/2021 5:09 AM, Vladimir Oltean wrote:
> Lino reports that on his system with bcmgenet as DSA master and KSZ9897
> as a switch, rebooting or shutting down never works properly.
> 
> What does the bcmgenet driver have special to trigger this, that other
> DSA masters do not? It has an implementation of ->shutdown which simply
> calls its ->remove implementation. Otherwise said, it unregisters its
> network interface on shutdown.
> 
> This message can be seen in a loop, and it hangs the reboot process there:
> 
> unregister_netdevice: waiting for eth0 to become free. Usage count = 3
> 
> So why 3?
> 
> A usage count of 1 is normal for a registered network interface, and any
> virtual interface which links itself as an upper of that will increment
> it via dev_hold. In the case of DSA, this is the call path:
> 
> dsa_slave_create
> -> netdev_upper_dev_link
>     -> __netdev_upper_dev_link
>        -> __netdev_adjacent_dev_insert
>           -> dev_hold
> 
> So a DSA switch with 3 interfaces will result in a usage count elevated
> by two, and netdev_wait_allrefs will wait until they have gone away.
> 
> Other stacked interfaces, like VLAN, watch NETDEV_UNREGISTER events and
> delete themselves, but DSA cannot just vanish and go poof, at most it
> can unbind itself from the switch devices, but that must happen strictly
> earlier compared to when the DSA master unregisters its net_device, so
> reacting on the NETDEV_UNREGISTER event is way too late.
> 
> It seems that it is a pretty established pattern to have a driver's
> ->shutdown hook redirect to its ->remove hook, so the same code is
> executed regardless of whether the driver is unbound from the device, or
> the system is just shutting down. As Florian puts it, it is quite a big
> hammer for bcmgenet to unregister its net_device during shutdown, but
> having a common code path with the driver unbind helps ensure it is well
> tested.
> 
> So DSA, for better or for worse, has to live with that and engage in an
> arms race of implementing the ->shutdown hook too, from all individual
> drivers, and do something sane when paired with masters that unregister
> their net_device there. The only sane thing to do, of course, is to
> unlink from the master.
> 
> However, complications arise really quickly.
> 
> The pattern of redirecting ->shutdown to ->remove is not unique to
> bcmgenet or even to net_device drivers. In fact, SPI controllers do it
> too (see dspi_shutdown -> dspi_remove), and presumably, I2C controllers
> and MDIO controllers do it too (this is something I have not researched
> too deeply, but even if this is not the case today, it is certainly
> plausible to happen in the future, and must be taken into consideration).
> 
> Since DSA switches might be SPI devices, I2C devices, MDIO devices, the
> insane implication is that for the exact same DSA switch device, we
> might have both ->shutdown and ->remove getting called.
> 
> So we need to do something with that insane environment. The pattern
> I've come up with is "if this, then not that", so if either ->shutdown
> or ->remove gets called, we set the device's drvdata to NULL, and in the
> other hook, we check whether the drvdata is NULL and just do nothing.
> This is probably not necessary for platform devices, just for devices on
> buses, but I would really insist for consistency among drivers, because
> when code is copy-pasted, it is not always copy-pasted from the best
> sources.
> 
> So depending on whether the DSA switch's ->remove or ->shutdown will get
> called first, we cannot really guarantee even for the same driver if
> rebooting will result in the same code path on all platforms. But
> nonetheless, we need to do something minimally reasonable on ->shutdown
> too to fix the bug. Of course, the ->remove will do more (a full
> teardown of the tree, with all data structures freed, and this is why
> the bug was not caught for so long). The new ->shutdown method is kept
> separate from dsa_unregister_switch not because we couldn't have
> unregistered the switch, but simply in the interest of doing something
> quick and to the point.
> 
> The big question is: does the DSA switch's ->shutdown get called earlier
> than the DSA master's ->shutdown? If not, there is still a risk that we
> might still trigger the WARN_ON in unregister_netdevice that says we are
> attempting to unregister a net_device which has uppers. That's no good.
> Although the reference to the master net_device won't physically go away
> even if DSA's ->shutdown comes afterwards, remember we have a dev_hold
> on it.
> 
> The answer to that question lies in this comment above device_link_add:
> 
>   * A side effect of the link creation is re-ordering of dpm_list and the
>   * devices_kset list by moving the consumer device and all devices depending
>   * on it to the ends of these lists (that does not happen to devices that have
>   * not been registered when this function is called).
> 
> so the fact that DSA uses device_link_add towards its master is not
> exactly for nothing. device_shutdown() walks devices_kset from the back,
> so this is our guarantee that DSA's shutdown happens before the master's
> shutdown.
> 
> Fixes: 2f1e8ea726e9 ("net: dsa: link interfaces with the DSA master to get rid of lockdep warnings")
> Link: https://lore.kernel.org/netdev/20210909095324.12978-1-LinoSanfilippo@gmx.de/
> Reported-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

LGTM, after you fix the b53_mmap.c build fix.
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
