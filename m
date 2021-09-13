Return-Path: <SRS0=5OX0=OD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533D5C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 17:17:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E436610A6
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 17:17:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E436610A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OEMai0IzWXrSIXeofa9b3IsVPqOkFGjfb2+APKj6sW4=; b=fTbc9xnUsXqncF
	crpIFViEwgZ9kfqe3zesYny2dR4nR99cg69K71GME8r85RtgJDULgCKcyMgbqi4yPsZQHGQTZzzKa
	oBEGomnTDjCcXkieSx1fJnFzoZkDu9fj6RMCbxbF5Wr6/rR5Cfc6TSodtmUx9hYDX+ugE8ZXA/u9b
	SL0C0AQ4xqFNPFDtiACqGf49jiIIQvpLxMoTW+/DfsQBBHiaZPqW1BVeeJUr/lTOnE3qjRxuV4s16
	uXQJykNzwAbSOXNZ6cY2pp6fMRYVs4kNDIDvgDlNHZO4saDCtaqKApcRMWqYa4/6dJnCp5XW49PWg
	NrVF5CYnRaoF8bEb0D0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPpZp-002dSS-JQ; Mon, 13 Sep 2021 17:17:05 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPpBB-002WCL-Vs; Mon, 13 Sep 2021 16:51:39 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 17so10023232pgp.4;
 Mon, 13 Sep 2021 09:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kuABR48uUUXNiZompaszC47KST4UqyEqD5vKZv7sGis=;
 b=ncpvpEmFtmubH+lclgjmMMEMJU6nH4pbD8aM5zHsG+FSC4yd8KGtff43Ku5nI5qJ2O
 q7Y2Z5/5SmsKAzpxcm24Yepv5gpc+AkmIX/v4/PlCxNAsMRzfcU7saJkLZRd+lB/vFgZ
 +EUIxqSQSlqAh/aRkojoCWlq4ZXgAELDDOEbhBvxwHq+dXYAtFHEbkSCX4ZlSk2BJ4QI
 P5gmeJWLQ4WxwK3SNYoWeH3slNo0jn+HxC7tvoDMrDLeNab3UBrFdLLqqwwMCzfn7SRF
 GhIkil0aZT0DdZv3YXcA1bbc4rVsPX5NZtOYhReACGHowtcXaKX4LTNoGyiYsA7OHJwJ
 +85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kuABR48uUUXNiZompaszC47KST4UqyEqD5vKZv7sGis=;
 b=YPi3fpvIpVK3HcMYCle/JqNsXBsRosVXtVIdry18E1OliGtmCOdlHSMs8EN3++jUcV
 +WT8RwEUOc7zvS5qwefbDLbnyy/oY0DAjAOYMJ4JfvjpTkpviX+1c89Aw8Gw/urg5Xcz
 P4/TPI9RmCpHi7J47CA72mVi0TY1lIcO2QteeqYWaGIJSLgCqE0e/GtT9g2VNVcDcmf5
 4GAdKgS+6Exq4e2tSRnAvcR/VuE2Ep6iqCjC8N/qRv2YlWTDg0V4Hh3335VfkosZIdEQ
 6q2nBhmrrvZ9rVhYN1tqF9OWgGQ9Uo274MJIfhRA9c6ZgSRBy/lFewCYk/oddjMUeo+y
 U2nQ==
X-Gm-Message-State: AOAM5308xeylkkaKKs+z7ac181PrQeZLtOFDp5KJtVehkOsmgMPcjG+u
 xEoHUkxbipn6SeJS4jPCzFQ=
X-Google-Smtp-Source: ABdhPJy/qbesBC9mVbtT6RFEVPP5MgkwZFbvpeS0mQMfbsAjKfpFnvRq2dO50NwxbLmfTJZyD26Lug==
X-Received: by 2002:a63:ed4a:: with SMTP id m10mr12108087pgk.448.1631551895199; 
 Mon, 13 Sep 2021 09:51:35 -0700 (PDT)
Received: from [192.168.1.121] (99-44-17-11.lightspeed.irvnca.sbcglobal.net.
 [99.44.17.11])
 by smtp.gmail.com with ESMTPSA id g3sm7623652pfi.197.2021.09.13.09.51.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 09:51:34 -0700 (PDT)
Message-ID: <4ebab581-897e-e95b-c28f-8dc9f3bc17f5@gmail.com>
Date: Mon, 13 Sep 2021 09:51:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH net 5/5] net: dsa: xrs700x: be compatible with masters
 which unregister on shutdown
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
 <20210912120932.993440-6-vladimir.oltean@nxp.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20210912120932.993440-6-vladimir.oltean@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_095138_135633_B29E3343 
X-CRM114-Status: GOOD (  15.16  )
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
> Since commit 2f1e8ea726e9 ("net: dsa: link interfaces with the DSA
> master to get rid of lockdep warnings"), DSA gained a requirement which
> it did not fulfill, which is to unlink itself from the DSA master at
> shutdown time.
> 
> Since the Arrow SpeedChips XRS700x driver was introduced after the bad
> commit, it has never worked with DSA masters which decide to unregister
> their net_device on shutdown, effectively hanging the reboot process.
> To fix that, we need to call dsa_switch_shutdown.
> 
> These devices can be connected by I2C or by MDIO, and if I search for
> I2C or MDIO bus drivers that implement their ->shutdown by redirecting
> it to ->remove I don't see any, however this does not mean it would not
> be possible. To be compatible with that pattern, it is necessary to
> implement an "if this then not that" scheme, to avoid ->remove and
> ->shutdown from being called both for the same struct device.
> 
> Fixes: ee00b24f32eb ("net: dsa: add Arrow SpeedChips XRS700x driver")
> Link: https://lore.kernel.org/netdev/20210909095324.12978-1-LinoSanfilippo@gmx.de/
> Reported-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
