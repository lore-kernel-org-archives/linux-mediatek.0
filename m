Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457C8C76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 06:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p29OP2afCO5DP1UJERSb7Ni6RNTt2pEu6Ob9e9f4YFY=; b=JB13rhsv8epA3KlylQJYKxEPTC
	f/Z5pyGOGbqfvXBQoxK1/YLzqc8D+eLm0WpPEyHTMwbvqn0+aojnFSLNJ2X9W8dL4kUna8Uk+HsoI
	wfJnlDlrFGvnAg1PYB56SuM0MNbryxtG9p6VNvxRDkJ1/Ma6G7jGaM6ym6jtZH194RhnOWEi8iHO4
	H1xZouF9I3hOEcVBr+5AbVC6PqkmjCTUwbHrY3/O2IQoBZa6txUfwsG8uhqJ2hPhA9L64KPXRDB30
	yGtc/9bUYkm8LRebzj79vigZgwELeTxLbngYdpxr89U9qoU6RnSJFTR06UKHRhjOO/JZ5U9E0j2SD
	PDXHj2FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph2RT-00DFGz-11;
	Tue, 28 Mar 2023 06:04:23 +0000
Received: from mg.richtek.com ([220.130.44.152])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph2RP-00DFDu-1T;
	Tue, 28 Mar 2023 06:04:21 +0000
X-MailGates: (flag:4,DYNAMIC,BADHELO,RELAY,NOHOST:PASS)(compute_score:DE
	LIVER,40,3)
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTP Server V5.0(26685:1:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>); Tue, 28 Mar 2023 14:03:31 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Tue, 28 Mar
 2023 14:03:30 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Tue, 28 Mar 2023 14:03:30 +0800
Date: Tue, 28 Mar 2023 14:03:30 +0800
From: ChiYuan Huang <cy_huang@richtek.com>
To: Pavel Machek <pavel@ucw.cz>
CC: ChiaEn Wu <chiaen_wu@richtek.com>, <corbet@lwn.net>, <lee@kernel.org>,
	<matthias.bgg@gmail.com>, <andriy.shevchenko@linux.intel.com>,
	<jacek.anaszewski@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<linux-doc@vger.kernel.org>, <peterwu.pub@gmail.com>,
	<linux-leds@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<szunichen@gmail.com>
Subject: Re: [PATCH v18 1/3] leds: rgb: mt6370: Add MediaTek MT6370 current
 sink type LED Indicator support
Message-ID: <20230328060330.GA32398@linuxcarl2.richtek.com>
References: <cover.1678430444.git.chiaen_wu@richtek.com>
 <1df93a583c3f508a7158b83b95857e9bce235e1b.1678430444.git.chiaen_wu@richtek.com>
 <ZCGCGb9E4KYlFNXR@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZCGCGb9E4KYlFNXR@duo.ucw.cz>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_230419_935191_573D547C 
X-CRM114-Status: GOOD (  13.94  )
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

On Mon, Mar 27, 2023 at 01:46:33PM +0200, Pavel Machek wrote:
> Hi!
> 
> > The MediaTek MT6370 is a highly-integrated smart power management IC,
> > which includes a single cell Li-Ion/Li-Polymer switching battery
> > charger, a USB Type-C & Power Delivery (PD) controller, dual
> > Flash LED current sources, a RGB LED driver, a backlight WLED driver,
> > a display bias driver and a general LDO for portable devices.
> > 
> > Add support for the MediaTek MT6370 Current Sink Type LED Indicator
> > driver. It can control four channels current-sink RGB LEDs with 3 modes:
> > constant current, PWM, and breath mode.
> > 
> > Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > Co-developed-by: Alice Chen <alice_chen@richtek.com>
> > Signed-off-by: Alice Chen <alice_chen@richtek.com>
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> 
> 
> > +++ b/drivers/leds/rgb/Makefile
> > @@ -2,3 +2,4 @@
> >  
> >  obj-$(CONFIG_LEDS_PWM_MULTICOLOR)	+= leds-pwm-multicolor.o
> >  obj-$(CONFIG_LEDS_QCOM_LPG)		+= leds-qcom-lpg.o
> > +obj-$(CONFIG_LEDS_MT6370_RGB)		+= leds-mt6370-rgb.o
> 
> I'd preffer leds-mt6370 name. We already have "rgb" in directory
> name...
> 
Yap, sure,

But for mt6370 leds, except rgb indicators, there are also flashes for camera.
To keep the postfix in filename can more precisely tell what the file for.


> Otherwise looks good. Thanks for doing this.
> 
> BR,
> 								Pavel
> -- 
> People of Russia, stop Putin before his war on Ukraine escalates.



