Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32218C678D5
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 01:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nv/5roHotBHwk0pSeQW2CWNoxspRvcm/UdO/iZIzjXU=; b=bzgYO+z/NItF/TO5O2eAiD0oUP
	+ddVG1FMmqc/3m6zCghNVRYOMrLeyOCPufsAsCtAF0N/XiC8mmiabwRVd1YHXP7dKOEo/vzjjFuMu
	CegqFiW2Y6XTUKigDjIA6Oc2miucCb/9T94GUBXLgvlUd6SleTkdz7np5TofhJ4xa5DVEmMOosvQK
	N8Y0REysC8FoSoMhV1UxKdjmmrASByNGjZ6VPtrO7vj9o35/SxEZR71z+xSRPxGvWZlL6YHFThD5S
	cGbgyS6Dq4HZSSYF4kVqwtgZc0MHkYtUhGuVRPk4fARHWuc0yzbZwyaFU63Tq5oi4be1vLuQQCy55
	toX/1DOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa5QK-007SSh-9m; Thu, 09 Mar 2023 01:50:28 +0000
Received: from mg.richtek.com ([220.130.44.152])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa5QF-007SQL-PQ; Thu, 09 Mar 2023 01:50:26 +0000
X-MailGates: (flag:4,DYNAMIC,BADHELO,RELAY,NOHOST:PASS)(compute_score:DE
	LIVER,40,3)
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTP Server V5.0(20041:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>); Thu, 09 Mar 2023 09:49:28 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Thu, 9 Mar
 2023 09:49:27 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1118.25 via Frontend
 Transport; Thu, 9 Mar 2023 09:49:27 +0800
Date: Thu, 9 Mar 2023 09:49:27 +0800
From: ChiYuan Huang <cy_huang@richtek.com>
To: Lee Jones <lee@kernel.org>
CC: ChiaEn Wu <chiaen_wu@richtek.com>, <corbet@lwn.net>, <pavel@ucw.cz>,
	<matthias.bgg@gmail.com>, <andriy.shevchenko@linux.intel.com>,
	<jacek.anaszewski@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<linux-doc@vger.kernel.org>, <peterwu.pub@gmail.com>,
	<linux-leds@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<szunichen@gmail.com>
Subject: Re: [PATCH v17 RESEND 2/3] leds: flash: mt6370: Add MediaTek MT6370
 flashlight support
Message-ID: <20230309014927.GA12537@linuxcarl2.richtek.com>
References: <cover.1677150607.git.chiaen_wu@richtek.com>
 <dc467984ebfc443685af62310aadb45389e804d6.1677150607.git.chiaen_wu@richtek.com>
 <20230305100608.GD2574592@google.com>
 <20230307034433.GA10739@linuxcarl2.richtek.com>
 <20230308135433.GL9667@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230308135433.GL9667@google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_175024_279175_8EF1A93D 
X-CRM114-Status: GOOD (  35.30  )
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

On Wed, Mar 08, 2023 at 01:54:33PM +0000, Lee Jones wrote:
Hi, Lee:
> On Tue, 07 Mar 2023, ChiYuan Huang wrote:
> 
> > Hi, Lee:
> >    Reply below the comments.
> >
> > On Sun, Mar 05, 2023 at 10:06:08AM +0000, Lee Jones wrote:
> > > On Thu, 23 Feb 2023, ChiaEn Wu wrote:
> > >
> > > > From: ChiYuan Huang <cy_huang@richtek.com>
> > > >
> > > > The MediaTek MT6370 is a highly-integrated smart power management IC,
> > > > which includes a single cell Li-Ion/Li-Polymer switching battery
> > > > charger, a USB Type-C & Power Delivery (PD) controller, dual Flash
> > > > LED current sources, a RGB LED driver, a backlight WLED driver,
> > > > a display bias driver and a general LDO for portable devices.
> > > >
> > > > Add support for the MT6370 Flash LED driver. Flash LED in MT6370
> > > > has 2 channels and support torch/strobe mode.
> > > >
> > > > Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
> > > > Co-developed-by: Alice Chen <alice_chen@richtek.com>
> > > > Signed-off-by: Alice Chen <alice_chen@richtek.com>
> > > > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > > > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> > > > ---
> > > > v17
> > > > - Update the year of Copyright from 2022 to 2023
> > > >
> > > > ---
> > > >  drivers/leds/flash/Kconfig             |  13 +
> > > >  drivers/leds/flash/Makefile            |   1 +
> > > >  drivers/leds/flash/leds-mt6370-flash.c | 596 +++++++++++++++++++++++++++++++++
> > > >  3 files changed, 610 insertions(+)
> > > >  create mode 100644 drivers/leds/flash/leds-mt6370-flash.c
> 
> [...]
> 
> > > > +static int _mt6370_flash_brightness_set(struct led_classdev_flash *fl_cdev,
> > > > +					u32 brightness)
> > > > +{
> > > > +	struct mt6370_led *led = to_mt6370_led(fl_cdev, flash);
> > > > +	struct mt6370_priv *priv = led->priv;
> > > > +	struct led_flash_setting *setting = &fl_cdev->brightness;
> > > > +	u32 val = (brightness - setting->min) / setting->step;
> > > > +	int ret, i;
> > > > +
> > > > +	if (led->led_no == MT6370_LED_JOINT) {
> > >
> > > What is a "JOINT"?
> > >
> > Since MT6370 has two flash led channels. Per channel can drive the current up to 1.5A.
> > 'JOINT' case is used if 1.5A driving current is not enough, like as flash current 2A.
> > They can use two channels to drive 'one' flash led by the HW application.
> > This will make the driving current larger than the capability of one channel.
> 
> Is "joint" the term used in the datasheet?
>
Nope, this term is not clearly defined in the datasheet. but this kind of HW application is
allowed. 
> Please make this definition clear in the code.
> 
> If I'm asking, others are likely to too.
> 
Thanks, I'll add more comments to clearly describe what the 'JOINT' code did.
> [...]
> 
> > > > +static int mt6370_init_flash_properties(struct device *dev,
> > > > +					struct mt6370_led *led,
> > > > +					struct fwnode_handle *fwnode)
> > > > +{
> > > > +	struct led_classdev_flash *flash = &led->flash;
> > > > +	struct led_classdev *lcdev = &flash->led_cdev;
> > > > +	struct mt6370_priv *priv = led->priv;
> > > > +	struct led_flash_setting *s;
> > > > +	u32 sources[MT6370_MAX_LEDS];
> > > > +	u32 max_ua, val;
> > > > +	int i, ret, num;
> > > > +
> > > > +	num = fwnode_property_count_u32(fwnode, "led-sources");
> > > > +	if (num < 1)
> > > > +		return dev_err_probe(dev, -EINVAL,
> > > > +				     "Not specified or wrong number of led-sources\n");
> > > > +
> > > > +	ret = fwnode_property_read_u32_array(fwnode, "led-sources", sources, num);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	for (i = 0; i < num; i++) {
> > > > +		if (sources[i] >= MT6370_MAX_LEDS)
> > > > +			return -EINVAL;
> > > > +		if (priv->leds_active & BIT(sources[i]))
> > > > +			return -EINVAL;
> > > > +		priv->leds_active |= BIT(sources[i]);
> > > > +	}
> > > > +
> > > > +	led->led_no = num == 2 ? MT6370_LED_JOINT : sources[0];
> > > > +
> > > > +	max_ua = num == 2 ? MT6370_ITORCH_DOUBLE_MAX_uA : MT6370_ITORCH_MAX_uA;
> > > > +	val = MT6370_ITORCH_MIN_uA;
> > >
> > > In what scenario does this not get overwritten?
> > >
> > Only if the property is missing. This will make the value keep in minimum.
> 
> If the property is missing, fwnode_property_read_u32() returns an errno, no?
> 
> If that's the case, val will be over-written in the if() clause?
> 
In this funciton, three properties needs to be paresed from DT. Each one need to clamp the value.
There're two ways to write the code.

[Option 1]
ret = fwnode_property_read_u32(...)
if (ret)
    val = MIM_uA;

val = mt6370_clamp(val, MIN, MAX);

[Option 2]
val = MIN_uA;
if (!ret)
    val = mt6370_clamp(val, MIN, MAX);


From the above, the sencond one can save more LOC, no?
But it seems the first one is more preferable by you, right?
> --
> Lee Jones [李琼斯]

