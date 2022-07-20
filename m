Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECB8C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 22:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4MvgsP4srg9f8E2HWMF3FD8P6Q9jUuZxC4vOXa9tjY=; b=bQ7xNfiaGLcvGJ+6EYVG+qkxKS
	mFbTbxLXq3FueWetYyA/Zj7E3kqS64QaTPnMFkZQYj0sdbKc3UkLUzbgt488uTVqjSn5b/cFBFymZ
	n2KlZE4PTll+hkaQd2DSFQkxnrt/aPH73cy6QpRwYgFSTXFuaIwDUDds/KTK5PmqSutuzLj8RSiWt
	M+fPsbWlngFyeYIjinj6SVv+hsj8VnXClwbcGIvF+XRuOMK1ICQta7elyWLUgq/L+derLSbOAIgeh
	BuKv4O/Hrimk04czHKznwSJ5yskw7czIqAfTMJW29F0zykkpR2GoBctKhtn8AyCHMKc/tRHgUat0z
	yYUBnWjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEIcx-00Cly0-DO; Wed, 20 Jul 2022 22:57:11 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEIcl-00ClXF-Le; Wed, 20 Jul 2022 22:57:01 +0000
Received: by mail-ej1-x62f.google.com with SMTP id fy29so58183ejc.12;
        Wed, 20 Jul 2022 15:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g4MvgsP4srg9f8E2HWMF3FD8P6Q9jUuZxC4vOXa9tjY=;
        b=Ko5J0JM40COndr6nYcLGfiin1SEVsO15qiCVzL5YOseZ6mmoOQSCQi0AYxw9YAnpF8
         Gr4/1p1cCKG4kt6SJeODxCrHnDo7aecB4EGQaIUxJIYtwdHE1e0kuLwkgs/jQDdvGY6N
         iKuCHuM8Lv6bGQewHojd1VFz0K3HBU58Zv36dhB994g2LslYiRxfpPfjHfbFU5W+01kM
         LTKIzfT3yiT96KcFPmp5q6oJu83L30OZ7oMynHD0biZzCXl9O+1NWvz/uBqGU0roPrw/
         GxtkzBC2TN0MtF9QEbPghAANVW2tgtQ+bAlJlCdBZuwq7Pp4tqtox2H8vWxC4c8WBz22
         5HYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g4MvgsP4srg9f8E2HWMF3FD8P6Q9jUuZxC4vOXa9tjY=;
        b=ksBJ8ihvamBZIoyjn++zzoDeJuKpeLCjEUY1VG1rVm6T8t+SlU322hlxbCvVm7I+lX
         +2c6suT77lDNtK/Q4w4cEE3NS+B1NIsAuF5f8stEM/zCY/bSSnHsLK0dmWFtWfcYygTh
         vvfSVBldr5COHb4VJYDkQ5oj0mXls2sFrayyH+7nF1siLD63NordTmROfwAQ9wQXJQL1
         3Xppw8UBPQD8Iga2AjE+SFKMJjRvZb9gKHaKCufxUNoGK3m+smXD/3ZXAW3houUNd7na
         w/LBYOUzvyDArrBp+bvrXd61DLRltdh5vYZFWSVs8Qp3eOuoK9hKaqGYyRZupxVw0t/T
         +JNg==
X-Gm-Message-State: AJIora8c3qUnJi9bl3ICPp7pC2CHYLISxThpSStKf+KsD3eOcSIvfjdX
	1ydVScgbjmHKP4+baNB0QWY=
X-Google-Smtp-Source: AGRyM1sEjwZqpdJnhnIi/sybxziNdCXoqRVcRlhVQNFjiWCgtSwmMYgElHOvt4zxzelhEKIf5A6ggg==
X-Received: by 2002:a17:907:1b16:b0:72b:8c16:dac0 with SMTP id mp22-20020a1709071b1600b0072b8c16dac0mr36517314ejc.286.1658357816062;
        Wed, 20 Jul 2022 15:56:56 -0700 (PDT)
Received: from skbuf ([188.25.231.115])
        by smtp.gmail.com with ESMTPSA id kw2-20020a170907770200b0072b609d9a36sm161874ejc.16.2022.07.20.15.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 15:56:55 -0700 (PDT)
Date: Thu, 21 Jul 2022 01:56:52 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alvin __ipraga <alsi@bang-olufsen.dk>,
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
	Sean Wang <sean.wang@mediatek.com>, UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Subject: Re: [PATCH net-next 2/6] software node: allow named software node to
 be created
Message-ID: <20220720225652.4uo6fcdcunenej3j@skbuf>
References: <20220715201715.foea4rifegmnti46@skbuf>
 <YtHPJNpcN4vNfgT6@smile.fi.intel.com>
 <20220715204841.pwhvnue2atrkc2fx@skbuf>
 <YtVSQI5VHtCOTCHc@smile.fi.intel.com>
 <YtVfppMtW77ICyC5@shell.armlinux.org.uk>
 <YtWp3WkpCtfe559l@smile.fi.intel.com>
 <YtWwbMucEyO+W8/Y@shell.armlinux.org.uk>
 <YtW9goFpOLGvIDog@smile.fi.intel.com>
 <YtXE0idsKe6FZ+n4@shell.armlinux.org.uk>
 <YtZwU9BKAO/WSRmK@paasikivi.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtZwU9BKAO/WSRmK@paasikivi.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_155659_750470_64427EFD 
X-CRM114-Status: GOOD (  19.89  )
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

Hi Sakari,

On Tue, Jul 19, 2022 at 08:50:27AM +0000, Sakari Ailus wrote:
> Basically what your patch is doing is adding a helper function that creates
> an fwnode with a given name. This functionality was there previously through
> software_node_register_nodes(), with node allocation responsibility residing
> on the caller. It's used e.g. here:
> drivers/media/pci/intel/ipu3/cio2-bridge.c .
> 
> The larger question is perhaps when can you safely remove software nodes.
> And which of these two APIs would be preferred. I haven't checked how many
> users each has. There's no refcounting nor locking for software nodes, so
> once made visible to the rest of the kernel, they're always expected to be
> there, unchanged, or at least it needs to be known when they can be removed.

Just for my clarity, are you saying that this printf selftest is
violating the software nodes' expectation to always be there unchanged
and never be removed?

static void __init fwnode_pointer(void)
{
	const struct software_node softnodes[] = {
		{ .name = "first", },
		{ .name = "second", .parent = &softnodes[0], },
		{ .name = "third", .parent = &softnodes[1], },
		{ NULL /* Guardian */ }
	};
	const char * const full_name = "first/second/third";
	const char * const full_name_second = "first/second";
	const char * const second_name = "second";
	const char * const third_name = "third";
	int rval;

	rval = software_node_register_nodes(softnodes);
	if (rval) {
		pr_warn("cannot register softnodes; rval %d\n", rval);
		return;
	}

	test(full_name_second, "%pfw", software_node_fwnode(&softnodes[1]));
	test(full_name, "%pfw", software_node_fwnode(&softnodes[2]));
	test(full_name, "%pfwf", software_node_fwnode(&softnodes[2]));
	test(second_name, "%pfwP", software_node_fwnode(&softnodes[1]));
	test(third_name, "%pfwP", software_node_fwnode(&softnodes[2]));

	software_node_unregister_nodes(softnodes);
}

The use case in this patch set is essentially equivalent to what printf
does: exposing the software nodes to the rest of the kernel and to user
space is probably not necessary, it's just that we need to call a
function that parses their structure (essentially an equivalent to
calling "test" above). Could you indicate whether there is a better
alternative of doing this?

