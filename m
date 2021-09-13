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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7130C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 17:13:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92296610CE
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 17:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92296610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=49ju0gCeMWJjaShLAQCz/3qG537bl+UwuaZpYI1Il2g=; b=KpetfqFToiyWHJ
	UbeVt4KJvLR2JOiplu7ofdvi5cvK75nvpZx6JIYw3+ZXkDbQv3PJD+UAMH4l/U7KWoTTbv1o53yo3
	ZjD+JXzZO7XUNLBb1dnBLOHfWWsoGCja5XhnTlVZyEB9jjWBc4h8fg64AUklZYFtLMJTtkAUjSz3K
	vmuUj3R8oXMDyIMwMCZpXDmGgtmlgBVzRHwv8NDx7YkydF8t48lkCB/aOYgHjaDoH7108ovMeNT/d
	R6ZM/y7rfNOvfQoE5jCi8Kh/BUj0wtDr6PZzXV8uy2OebR2uiy9wcB1jh6eUWz+0XXWiE5XZuoxnu
	KQtNC+UfLA4s6BLZVvpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPpW5-002cPi-Ss; Mon, 13 Sep 2021 17:13:13 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPpAf-002W18-6R; Mon, 13 Sep 2021 16:51:06 +0000
Received: by mail-pg1-x532.google.com with SMTP id s11so9990394pgr.11;
 Mon, 13 Sep 2021 09:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=u8LSn204FDqhGyF0mRHlJ+uof8bjln9ACZwGJ4VJX/Q=;
 b=ilq7JmMnDjs41l5IclgdcW1Z9freZdaRf+3oq0i6Qet/fxHzA1mxEv62jZdGc887or
 J6tCtrBXyQZUYUqXNoh1IYCjNoRIoB+/sar4zeOnxSvp+ppk2NDc4WwX+RzZtkKS+ZKa
 DZaOijUuOBfdVZcg4BHr9lavDRCjYp1HH++4Qf4+W+ScdynyF1SVi9+ppm+uRiXpc4sV
 D4kd+0A3TFVUyTjTtSwAmZpVNBtKL3xNkQ5feex8wsGB4rI6w2QrZgZLsq632cLZKWB0
 oB3naggJovqO0tgQ5x4VN/C+A6d7S082F4Q+gtPMxO2z7i3mLKRzKH1oHl2Je8P0qi1A
 HHfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=u8LSn204FDqhGyF0mRHlJ+uof8bjln9ACZwGJ4VJX/Q=;
 b=3BBPrstuqhICA1TPaBAAR8Gn7LRdRYzJT+6RHnlSHXk3T84XUEZINDeA3ElbnEVV2P
 2PQfgYOF0K4247Mwkes0ZDV20w7YwPVNDghXsKxftFCXaiTDOLfcaF1iHjBIRmeU8MPl
 ne+M1vMlPJZMDIfZ9/ZafsNnkXxKABm7R6EOy39RlberwViXdnpacrbeX2HSVRvozIaN
 Ohkd3Ax5L40aOFa9p1Q1xh7OKTpVCP4qEC0nJ2Nd/JIh51Oop8qNZw0LcyfL6JqaTfBI
 VLxc4BTsCIdAGxbjEr+qa+Sy37E7fhvBDjevnDtumT7g9eTrZ3J9vr0zhYEPZPOpPAwi
 +1ZQ==
X-Gm-Message-State: AOAM531rrQxs530GG6Y/qpRHV+JqEIfn9OawcIMLt3xloZk6kQ9JV7El
 Ni8sBU4Kou3WEh3d8gIwgU8=
X-Google-Smtp-Source: ABdhPJz+Z/0fZXWXpqmgD1KoL8aLN+20FwGJLzMhTXASueU2yb4r9RmckOLdl8484bbj9ONhKCycbg==
X-Received: by 2002:a62:8281:0:b0:3f6:3b92:3698 with SMTP id
 w123-20020a628281000000b003f63b923698mr331543pfd.55.1631551863939; 
 Mon, 13 Sep 2021 09:51:03 -0700 (PDT)
Received: from [192.168.1.121] (99-44-17-11.lightspeed.irvnca.sbcglobal.net.
 [99.44.17.11])
 by smtp.gmail.com with ESMTPSA id w11sm8570713pgf.5.2021.09.13.09.51.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 09:51:03 -0700 (PDT)
Message-ID: <d8bcc915-8b3d-f68e-8a04-1b33eaeca165@gmail.com>
Date: Mon, 13 Sep 2021 09:51:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH net 4/5] net: dsa: microchip: ksz8863: be compatible
 with masters which unregister on shutdown
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
 <20210912120932.993440-5-vladimir.oltean@nxp.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20210912120932.993440-5-vladimir.oltean@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_095105_305311_584C73D6 
X-CRM114-Status: GOOD (  15.56  )
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
> Since the Microchip sub-driver for KSZ8863 was introduced after the bad
> commit, it has never worked with DSA masters which decide to unregister
> their net_device on shutdown, effectively hanging the reboot process.
> To fix that, we need to call dsa_switch_shutdown.
> 
> Since this driver expects the MDIO bus to be backed by mdio_bitbang, I
> don't think there is currently any MDIO bus driver which implements its
> ->shutdown by redirecting it to ->remove, but in any case, to be
> compatible with that pattern, it is necessary to implement an "if this
> then not that" scheme, to avoid ->remove and ->shutdown from being
> called both for the same struct device.
> 
> Fixes: 60a364760002 ("net: dsa: microchip: Add Microchip KSZ8863 SMI based driver support")
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
