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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E862C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 17:11:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAD8A610CB
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 17:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CAD8A610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aDdvg8B6qAlpyyfkghYex5c0AuRR5XWqqLtq8x5Ew1o=; b=MYEfnpTti5iBWQ
	ZWO6QSGG+y07fiBwBdWcyVZOj439Iwtv+dw57vhRmAyqPnrOBVEyncW3uQI48HOVB9r6zdndjqNY9
	/vsXTrIemN5xUNx8+N0tj1vjlx3IkenceK1N+9DcnJRJYHxGCQ9/yn2Dx/eaG4YkTZf8J7rS7v4+E
	zTyRQTd9m4/DbD/hoqqHRpjOTQRshOc5xMrkLLcuaEca/6j69Mnouwb9zGjMKZVuC5w0+er/J9rHi
	lA/ggohRoqZS/qR56S9AysL/mjQCiXN2p6RrH8Dcr6ysouMY71Aj5UnbmARK3LtUmiYXWHanlnO0J
	bWA3+ZtHUpvuCFHq3VGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPpU1-002btN-IW; Mon, 13 Sep 2021 17:11:05 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPpAK-002Vtx-5N; Mon, 13 Sep 2021 16:50:45 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 lb1-20020a17090b4a4100b001993f863df2so469799pjb.5; 
 Mon, 13 Sep 2021 09:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jKmrMtYAU38Ek0NsTISM2Zo8smzHINIMpeNn3tlnY80=;
 b=gCMrRKvqPWRUrkSrGMik2fdH4KgaFn6e7amxvH8g3f5m02GSWYxxZA5KVXZ+QmyxuS
 ngTNTvlGITaNNmuLrgSK6W1Lf3+gOT3SSrBj4I9VnjihlA5CQfO/drvGvwYB1EHjwfpN
 axizCznZzmp+Mi86btY97Sv53/NMUAYKAKfFkqw5pD8XztHkjadwTVt858bbnfDXIRU+
 b8c9puerZoOFpzulKdEmmsoisWUXJ41mKCo2moG39jr8qHopuPEqNjMV01I23V9SnUXo
 5VghUSpYCtkpGy5n4ZXIcG6LadKt4AmcBCOeuRb10NWrZcvVU38TBULHGrFZTIER4JIV
 CR0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jKmrMtYAU38Ek0NsTISM2Zo8smzHINIMpeNn3tlnY80=;
 b=SDTyfFa5MIHKR9jweyplUm5n5Pz1EaVDzjQsORksb8fJTfJ9TJ6aRNGori9OjamLja
 z+lyvh8QutR4ZgtFvYLQXKqnZDeMGVpTXvfy8Fti6NjHhdGl0ZUyTUcni/vO0mSfMQ6X
 7dL5R3W+x0kA/AxPTL35DZW4bjKxRj+8ArRoOMZmWXJxxUgA+SL1lLGegDkGLv6NwhQ9
 z03a5nXApuNKTF1cbGLGFPwZWe6D6Vu4VjAy6bPgKkyMHH/UaxJEdk73PjCvS84ITfvR
 sXF464WLSov1xTBeszvzknwu/NPftyBi7g9mUd9J+Ogs7HKh3klzBGFtoa8Yl6upEEz9
 XTnQ==
X-Gm-Message-State: AOAM531UeF1QrMhXeITqKRwS/a7e5uc5cIn6GmGTyWzwW7/vcBk3Qdta
 ttNOmO7zy9V8svQMHqhfxDM=
X-Google-Smtp-Source: ABdhPJywRgCWqJleziXMBtnAEhoFJMaZd/Llu0A0ZhV0dc/inc29V4ho7O1FsiUQKMXD1tig/GAbew==
X-Received: by 2002:a17:902:a407:b0:138:849b:56f6 with SMTP id
 p7-20020a170902a40700b00138849b56f6mr11398144plq.0.1631551841867; 
 Mon, 13 Sep 2021 09:50:41 -0700 (PDT)
Received: from [192.168.1.121] (99-44-17-11.lightspeed.irvnca.sbcglobal.net.
 [99.44.17.11])
 by smtp.gmail.com with ESMTPSA id u24sm7754410pfm.85.2021.09.13.09.50.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 09:50:41 -0700 (PDT)
Message-ID: <77c03355-f05e-2731-806d-df7e95c45b12@gmail.com>
Date: Mon, 13 Sep 2021 09:50:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH net 3/5] net: dsa: hellcreek: be compatible with
 masters which unregister on shutdown
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
 <20210912120932.993440-4-vladimir.oltean@nxp.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20210912120932.993440-4-vladimir.oltean@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_095044_303563_12538F3E 
X-CRM114-Status: GOOD (  15.58  )
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
> Since the hellcreek driver was introduced after the bad commit, it has
> never worked with DSA masters which decide to unregister their
> net_device on shutdown, effectively hanging the reboot process.
> 
> Hellcreek is a platform device driver, so we probably cannot have the
> oddities of ->shutdown and ->remove getting both called for the exact
> same struct device. But to be in line with the pattern from the other
> device drivers which are on slow buses, implement the same "if this then
> not that" pattern of either running the ->shutdown or the ->remove hook.
> The driver's current ->remove implementation makes that very easy
> because it already zeroes out its device_drvdata on ->remove.
> 
> Fixes: e4b27ebc780f ("net: dsa: Add DSA driver for Hirschmann Hellcreek switches")
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
