Return-Path: <SRS0=wX2S=OC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18FF3C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Sep 2021 16:14:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3A78610CE
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Sep 2021 16:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A3A78610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ltw6st3GmmM8OC8UNNBmTpP7s0WUQPa5kOTwx4hoqE=; b=TAAW0k4ejjStPU
	z8xjTmlWceRAv5Vrui3LKHOvmIl3SDT7TGIimD4fN5N6lVc0KSaA2oiY4enRWBECvSWUN+IH7KTmx
	Ms44otOa9ruYPEYT4gBOrI/aUxE5t8pjuws7RD+r/OfvlDjFD9l+Zo98dTVyJI32P72SKe14f4cWd
	HNlznCvGxCCHqmgnMSuAnmFdxkZwr+nf0enDAxlqp6QMTMI/QagghkL4OHFY71BV300f8rEWkZl0t
	LQuYH7hhRuitc43MqL8Lxb4/yOhrZ8T3RQrf7OBVImcfSJl7jLfOftNf2m5lvfk3pkXhQwXEOQbo/
	76zxc0xBhbm/qxuWI/qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPS7m-00GgW3-KJ; Sun, 12 Sep 2021 16:14:34 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPS7Z-00GgU4-0A; Sun, 12 Sep 2021 16:14:22 +0000
Received: by mail-qk1-x735.google.com with SMTP id p4so7912533qki.3;
 Sun, 12 Sep 2021 09:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=P60SQ/CsW1eZndcpQR8AR/xrEVIdL+Rao4L2rbgdhaA=;
 b=HUwk6qnr0kgyqmTOdj14K7PvRl+vIgLwhfa/Soxserjlx37Q0bl82oHT4huLR3WgeI
 ulPWtV72/igDuyPZofm4nb4dckNhxmprUg38UWVo82a3Ykx8O2lBRxLO3iNi63n2Tu4f
 HOf9CaMXpjic2WE20hT1aDR7vdocgvMZDfCkWbq6EmVifM3Z54ZbqLU9GGkNE+Bv41S5
 jHaTArKj1jA2hXTnoF+JnyIZOpCvlyn+m9mau3lq0PprQygy/o20YjltGrBjt31GQEJ+
 EE7gWGuBUAOOfH/adHuIEKG0qB2zLImFBPmodyG7nJdrHzzSsd3OTUomkJBeeKHlIdR/
 9Q1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=P60SQ/CsW1eZndcpQR8AR/xrEVIdL+Rao4L2rbgdhaA=;
 b=wzvPd65Z4lr1P8SFL7cjC6YCmzQbwq/hOjLswvbsHguKParAiGtb88Y8U7I0IDQFXc
 +DLgf4pj819j0ubZNflel26YJdjNTbCjsmmQRRgP7RIPaOXyO9G9fiR722Rj6xY3oMP8
 doGDg1YiQK5vPqL4TXSUnPS+dLU4sdqMxIiikPJkKPsf/4t6vqvv22ian+5R/fJgVuHB
 AWJksWqFxD/aVQi85MAEnkSctvEgD64PYp1FVb3yEaGrSqJ64GwWYR5I/eL7u1VQrpCc
 h0z1NlfgqshDf0Ud6OPDinAxsJq7YKEr/nVz1CatFwACholnV81d0tsB4kcVaYrY8LhI
 Xp2Q==
X-Gm-Message-State: AOAM531J2064ykBuYAoZUMuMWdZMAcRIsoZpUhFA2kPp0BKjjuuNVbgA
 4BY1BF4Zo+ipfHj44qnorrk=
X-Google-Smtp-Source: ABdhPJwCHzJ7tC9DgCi07ahFY8D4qJ10evt3UqKBcCnZz212piHDTdmcK+JNd5y6GzOPE3C02xNDQw==
X-Received: by 2002:ae9:f40b:: with SMTP id y11mr6289972qkl.107.1631463259134; 
 Sun, 12 Sep 2021 09:14:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:dfe0:49f0:b198:60c0:9fe:66c9?
 ([2600:1700:dfe0:49f0:b198:60c0:9fe:66c9])
 by smtp.gmail.com with ESMTPSA id y12sm2693999qtj.3.2021.09.12.09.14.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Sep 2021 09:14:18 -0700 (PDT)
Message-ID: <c745be4c-2b7f-3f36-36ce-75ae8601a697@gmail.com>
Date: Sun, 12 Sep 2021 09:14:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [RFC PATCH net 1/5] net: mdio: introduce a shutdown method to
 mdio device drivers
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
 <20210912120932.993440-2-vladimir.oltean@nxp.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20210912120932.993440-2-vladimir.oltean@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210912_091421_100209_A549C74F 
X-CRM114-Status: GOOD (  12.45  )
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
> MDIO-attached devices might have interrupts and other things that might
> need quiesced when we kexec into a new kernel. Things are even more
> creepy when those interrupt lines are shared, and in that case it is
> absolutely mandatory to disable all interrupt sources.
> 
> Moreover, MDIO devices might be DSA switches, and DSA needs its own
> shutdown method to unlink from the DSA master, which is a new
> requirement that appeared after commit 2f1e8ea726e9 ("net: dsa: link
> interfaces with the DSA master to get rid of lockdep warnings").
> 
> So introduce a ->shutdown method in the MDIO device driver structure.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
