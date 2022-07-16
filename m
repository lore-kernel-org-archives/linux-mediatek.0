Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7417CC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jul 2022 11:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSuKOTkU3shP0EBSGkZH4bPjOmCNN0weweRSI39rxR4=; b=EQAZHSdqpQdi9SSv23Q3eUsnBf
	rvkUaanKiYRLVlUnKKfvScGgMqmigM2ikkkm1uR/G86AYebi5gzOhcMliCoY0688n7HCMvrOULdTg
	INNB5pxEbyYRTrbWQwJ6yC0D544HWggTnvRt7FT1D7zKabmziPN3DMS0alC7ZPETQiGoQcr+mQciP
	a8755HwKjoAqjiI30QeuF57pFq5Ep/KeiZVOBPaWFvcgvnWZM1Bj3sClV4IChW5jH5NVdbJcWhEV1
	kixNbjRxVlNNpjBdWpuGpvt/B/HZBMeQ1hccgl4qn7uTlaJ/3KZb1nr2DH9gwDyujRkW/Uqg/clka
	wqk7yb0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCfmM-00FfgP-Gz; Sat, 16 Jul 2022 11:16:10 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCfmA-00FfZ8-AO; Sat, 16 Jul 2022 11:15:59 +0000
Received: by mail-ej1-x62d.google.com with SMTP id z23so13044222eju.8;
        Sat, 16 Jul 2022 04:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=GSuKOTkU3shP0EBSGkZH4bPjOmCNN0weweRSI39rxR4=;
        b=LmTfJY0C2KyehmNxK1ghGj/zlJEMylOOKJbogqEpNjvqB6ZH0PxovI/7v+v1fOSdBC
         M6iw1J/y0vD6r7uFeq3sB9GKHprjqIq5Ct6xVM81/IQgLMAMwDzAUlwWt7Wi3lPo3/Y4
         tLfI8OhFHzxN6JSMmA//PC68Do/mdkZKDiTpB1cUYgH3fw9dTMlSqhWy+FEh5GxM2PkQ
         ZS2ctOw7eNQFgnRDTINyhdA4ZroolRfCl8MMF5IQ/oJQUl2nlJV2FHgIGCO/77oLldmp
         o31Nm7kIK0HoIH24IY9VAOR+r6keNDGQZ9n5NNFvpkPQSkKJoI0HxALT5rPnX9zqcYGN
         8jhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=GSuKOTkU3shP0EBSGkZH4bPjOmCNN0weweRSI39rxR4=;
        b=XMXoQPtvC4SwD1ouF4csuavY9KroAUP5QIaLcqJTAdM0NhZelh5jUf2HfAIbNytttM
         Ar0n2Y5UgYnXRgnzsTRqKGkb/U+481KpHKcqbeDTAQeq0bs0xAma5sYvawvzTGURp8mV
         PX2J+LE1HgOHdrs7F/pLwpTKUEGavSfwKpkXS0JEbcusK7D37L+RoPtPJhiDyFEWXSQ1
         nIoyD7FKp//SJDjjCFrZ6eDYC4Q+ISNFK8Z0R2FE75p+JujihBxeEC5NmGdbMQxEilvA
         A3SX02DQDQ9zNHMgy0jCMA9RO6U9r6tYUu4GqMk0u9v9rcscdz9gRRbylrTvWkeVatYb
         NO5w==
X-Gm-Message-State: AJIora+4DaUZAkgttEwxHZdELDQOJc7lpSHzmUHztsV/0WDLFa+WotmX
	Ay+al1mMnvuz03D+Ymqdaow=
X-Google-Smtp-Source: AGRyM1sLb4uqrhY6SDkuMORlJ7TVbmlpoUkrp8ICgwzrq8QuVsTAX0TDXJWnC5I3SzDQW8/0IZykNQ==
X-Received: by 2002:a17:906:8461:b0:72e:e3f5:373b with SMTP id hx1-20020a170906846100b0072ee3f5373bmr10571972ejc.199.1657970155263;
        Sat, 16 Jul 2022 04:15:55 -0700 (PDT)
Received: from skbuf ([188.25.231.115])
        by smtp.gmail.com with ESMTPSA id 2-20020a170906218200b006fefd1d5c2bsm3128699eju.148.2022.07.16.04.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 04:15:54 -0700 (PDT)
Date: Sat, 16 Jul 2022 14:15:51 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
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
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sean Wang <sean.wang@mediatek.com>, UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH net-next 0/6] net: dsa: always use phylink
Message-ID: <20220716111551.64rjruz4q4g5uzee@skbuf>
References: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
 <20220715171719.niqcrklpk4ittfvl@skbuf>
 <YtHVLGR0RQ6dWuBS@shell.armlinux.org.uk>
 <20220715160359.2e9dabfe@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220715160359.2e9dabfe@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_041558_402454_AC31BB19 
X-CRM114-Status: GOOD (  20.36  )
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

On Fri, Jul 15, 2022 at 04:03:59PM -0700, Jakub Kicinski wrote:
> On Fri, 15 Jul 2022 21:59:24 +0100 Russell King (Oracle) wrote:
> > The only thing that delayed them was your eventual comments about
> > re-working how it was being done. Yet again, posting the RFC series
> > created very little in the way of feedback. I'm getting to the point
> > of thinking its a waste of time posting RFC patches - it's counter
> > productive. RFC means "request for comments" but it seems that many
> > interpret it as "I can ignore it".
> 
> I'm afraid you are correct. Dave used to occasionally apply RFC patches
> which kept reviewers on their toes a little bit (it kept me for sure).
> These days patchwork automatically marks patches as RFC based on
> the subject, tossing them out of "Action required" queue. So they are
> extremely easy to ignore.
> 
> Perhaps an alternative way of posting would be to write "RFC only,
> please don't apply" at the end of the cover letter. Maybe folks will 
> at least get thru reading the cover letter then :S

Again, expressing complaints to me for responding late is misdirected
frustration. The fact that I chose to leave my comments only when
Russell gave up on waiting for feedback from Andrew doesn't mean I
ignored his RFC patches, it just means I didn't want to add noise and
ask for minor changes when it wasn't clear that this is the overall
final direction that the series would follow. I still have preferences
about the way in which this patch set gets accepted, and now seems like
the proper moment to express them.

