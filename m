Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CABBC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 14:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7DdDsGhXcK90ynwzFc8Ey8lHFszMXZo5aRKhgEZd4uk=; b=Ah4VJYxj7MCwXv4/IPQx/b59dC
	0eRMe2th34RzGEjn86VNv7LUHOA010M4Dh703Ob8kJ5G1FGmzQGDApVolC7G5+D+k2J9sll3DhS22
	9qr30l8CoWL/CVrzKjXEZCNpgiZSRCf6IMdFYJ0outi2vPWC2pfaCC/6nX/Rch84Es7/3geT5yG5Y
	ispHNBsGdz1zRZ/6dvNsXHAn6wQrUDjzGrMk8mfE3dc2d5oacsEj6ykB4B2WtPK31HJh7GfnTGGEp
	SBvpBjgMlSHQdkZJFDQKcm8JFAzUka654ZT634dRxvoELrr0rV7KkCz+iHCDtJmbHxsNsj/8qpqId
	xJYK7dMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDRgj-00EeSp-RV; Mon, 18 Jul 2022 14:25:33 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDRgX-00EeHe-M0; Mon, 18 Jul 2022 14:25:23 +0000
Received: by mail-ej1-x634.google.com with SMTP id va17so21624879ejb.0;
        Mon, 18 Jul 2022 07:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7DdDsGhXcK90ynwzFc8Ey8lHFszMXZo5aRKhgEZd4uk=;
        b=OSVrgaaNfVM1U1imz3NejJXJRKz2xnHXN89Q1+rhR4nVNvKS6NKENr+a8Db+Q2mXH2
         J+FoL4gCap1b57EoOBvhTiIkeeq7ZsujMYcqI/4/DRyNBnNzKWPWnA9CDqU2qnW4EsV6
         nlDTskI7uy8IzD+jMRyUVWzkMH6kwmcfZQYW1t0v86bfCXCGgXn/GbHifkMcxAHXTwz1
         K4AVARbCPWWWv1f+b1j3maj3KcGBHgMajQPOtsgGOCmhvQtN/0vFLdmoj9OlJCEgP/oO
         315WJu8lb+uJleeExJzqKdNiGovqS7hN4Zj+etVfb+4v0yzMUKh3D08mAZLlx0wTQ1Cy
         zgMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7DdDsGhXcK90ynwzFc8Ey8lHFszMXZo5aRKhgEZd4uk=;
        b=UZ7ygza+9U6uwT5N4rIDq3fuWPVN7Cut1yc4PpEbuMK4znEN6TP53xyuDfvHrqgfxt
         wyxRGkIrL/UUsT9LhoabLk7uKG0kvLxXqy8YmVLXSlsZqpbHaHKTZtJzXYMhPnF8vA7M
         hyWkgZQ+HztjtT+LldLQGXtBT80GpbNDMBAIvaMxHd9dqWQ8yFmW5kf+yUqSjuy8UutV
         /VUaMi8JiSH38INazQucoq6WgXSRm417POi3c6vVQfXYtC8dqnjF9EdTt1kCyn7FZs/r
         xC7oLfdfcd5yN/6vEQ40GruxEgOTD5npSc7adMT+BS0PKz0EDix0enabj7m1DrcU8tSn
         E7Zg==
X-Gm-Message-State: AJIora9ZkhsRGrgI06QVI0oesOOZXxxESgUkt+V3i/yfeTjBp+SgNA6o
	nYfn7tUOengncpxZLQuY+30=
X-Google-Smtp-Source: AGRyM1sEheIFNl3MBseKFin6lSWB6ACjtHJGFOFj4+AFpV+dz3UFgxQDHhyuosVn1sXr8b6XrmMijw==
X-Received: by 2002:a17:906:ef8b:b0:72b:58da:b115 with SMTP id ze11-20020a170906ef8b00b0072b58dab115mr24890310ejb.417.1658154309632;
        Mon, 18 Jul 2022 07:25:09 -0700 (PDT)
Received: from skbuf ([188.25.231.190])
        by smtp.gmail.com with ESMTPSA id u7-20020a056402110700b0043a6c9e50f4sm8606780edv.29.2022.07.18.07.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:25:08 -0700 (PDT)
Date: Mon, 18 Jul 2022 17:25:05 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
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
Message-ID: <20220718142505.3shv2rwe4fakgsp2@skbuf>
References: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
 <20220715171719.niqcrklpk4ittfvl@skbuf>
 <YtHVLGR0RQ6dWuBS@shell.armlinux.org.uk>
 <20220715160359.2e9dabfe@kernel.org>
 <20220716111551.64rjruz4q4g5uzee@skbuf>
 <YtKkRLD74tqoeBuR@shell.armlinux.org.uk>
 <20220716131345.b2jas3rucsifli7g@skbuf>
 <YtUfg+WYIYYi5J+q@shell.armlinux.org.uk>
 <20220718124512.o3qxiwop7nzfjbfx@skbuf>
 <YtVZ6VI1yvbgSYDg@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtVZ6VI1yvbgSYDg@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_072521_744608_2A4E071B 
X-CRM114-Status: GOOD (  19.31  )
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

On Mon, Jul 18, 2022 at 02:02:33PM +0100, Russell King (Oracle) wrote:
> In the second RFC, I stated:
> 
> "Some of the questions from the original RFC remain though, so I've
> included that text below. I'm guessing as they remain unanswered that
> no one has any opinions on them?"
> 
> Clearly, I was soliciting answers from _everyone_ who received this,
> not just the two people in the To: header.
(...)
> This is _not_ the issue I'm raising. I am complaining about the
> "default_interface" issue that you've only piped up about, despite
> (a) an explicit question having been asked about that approach, (b) it
> appearing in not just one, not two, not three but four RFC series sent,
> and only finally being raised when a non-RFC series was sent.
> 
> This whole debarcle could have been avoided with providing feedback at
> an earlier stage, when I explicitly requested it _several_ times.

Please stop shoving quotes of your questions in my face, I'm still glad
I deleted my draft responses to them when they were originally asked,
because *when* (not *if*) things will have went sideways, I would have
blamed myself for people wanting to test/respond but not having whom to
talk to, because you rage quit.

You need to understand that a voluntary reviewer doesn't have a duty to
respond to you on any certain date, and that I'm not obliged to shut up
about where to place "default_interface" because I haven't said anything
about it in the first N series. I was on the fence whether it was even
worth saying anything about it at all, and the only reason I decided to
do it was because the patch to change every DSA driver's phylink_get_caps()
prototype now conflicts with concurrent changes done to drivers, and
doesn't apply to net-next anyway:
https://patchwork.kernel.org/project/netdevbpf/patch/E1oCNl3-006e3n-PT@rmk-PC.armlinux.org.uk/
So I really can't be reasonably accused of wanting to stall this series.

You have no reason whatsoever to pick a fight with me, so please stop it.

