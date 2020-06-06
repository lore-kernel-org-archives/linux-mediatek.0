Return-Path: <SRS0=8CO7=7T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86765C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jun 2020 06:45:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56A2F20656
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jun 2020 06:45:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lR9Qex9U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FdbHIASZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56A2F20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f/hNZF5t0iLRvNbYY6R7PxohER2bYD8UXwKKrhdMsx0=; b=lR9Qex9UyJ+zN5
	9XYSohp+daLZCJbwj8e6/f17PPVLfYHNcFax6S0E+8vsv0rZu9eLfQYUewae6SmaRnFLMAcjeZ+VM
	ivjrcV4EUXlLvyg0R/6M8MO6Y7vdSB44UjB7hGw9XsbJl/wtYw3GEg9rR7k1SrbcAzJHUeuE3bp2/
	Ze3Osuy+2SB3mG7zmkt6PDrZ9haktmRF3LIl3gCNhodFyt0c1JW96xOG5IrVi5RdGscvIOtXePt6E
	2PLNX6+7cyFC4veRMP1MhZLK0RJs2Wb6/N16iUiogEKpJLgNFUefs7OwZVEZ3jOVomVcuSEusbHva
	43zrQmU5CneXm97jd/3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jhSZu-0007S1-GZ; Sat, 06 Jun 2020 06:45:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jhSZr-0007RP-AA; Sat, 06 Jun 2020 06:45:12 +0000
X-UUID: 38d7d8c4b0e94843bfd3d4f75087e480-20200605
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=gfA1g5/tH05MT05A2pVcmlsW9osyUE+e/sPO14ohiIc=; 
 b=FdbHIASZI58luSV5uFQG/XI6f4Mo/Zt52ojxLxcgoI3pP2pCk8Ig8bsqhw/fjvrXultVWX6FA6TePA1HnJr6eUBw8llRjKeVjRbwjCPC2/Lz9zFxZZOI6+9qxCUDDbIUelnvtj4ovyEZRKhotSATXA2oSWA+ZrYqPW7lbeanLH4=;
X-UUID: 38d7d8c4b0e94843bfd3d4f75087e480-20200605
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 226666340; Fri, 05 Jun 2020 22:45:16 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Jun 2020 23:45:06 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 6 Jun 2020 14:45:03 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 6 Jun 2020 14:45:02 +0800
Message-ID: <1591425778.8804.614.camel@mhfsdcap03>
Subject: Re: [V7, 2/2] media: i2c: dw9768: Add DW9768 VCM driver
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Tomasz Figa <tfiga@chromium.org>
Date: Sat, 6 Jun 2020 14:42:58 +0800
In-Reply-To: <20200605134440.GA20379@chromium.org>
References: <20200605105412.18813-1-dongchun.zhu@mediatek.com>
 <20200605105412.18813-3-dongchun.zhu@mediatek.com>
 <20200605134440.GA20379@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 718D582639BC52F66AD8ADFFD42A73B5B3AEAE45CD98840B3A40295878A177332000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200605_234511_366546_D1292A3D 
X-CRM114-Status: GOOD (  19.34  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, drinkcat@chromium.org,
 andriy.shevchenko@linux.intel.com, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linus.walleij@linaro.org,
 shengnan.wang@mediatek.com, louis.kuo@mediatek.com, bgolaszewski@baylibre.com,
 sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 dongchun.zhu@mediatek.com, sakari.ailus@linux.intel.com,
 matthias.bgg@gmail.com, bingbu.cao@intel.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Tomasz,

Thanks for the review.

On Fri, 2020-06-05 at 13:44 +0000, Tomasz Figa wrote:
> Hi Dongchun,
> 
> On Fri, Jun 05, 2020 at 06:54:12PM +0800, Dongchun Zhu wrote:
> > Add a V4L2 sub-device driver for DW9768 voice coil motor, providing
> > control to set the desired focus via IIC serial interface.
> > 
> > Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> > ---
> >  MAINTAINERS                |   1 +
> >  drivers/media/i2c/Kconfig  |  13 ++
> >  drivers/media/i2c/Makefile |   1 +
> >  drivers/media/i2c/dw9768.c | 566 +++++++++++++++++++++++++++++++++++++++++++++
> >  4 files changed, 581 insertions(+)
> >  create mode 100644 drivers/media/i2c/dw9768.c
> > 
> 
> Thank you for the patch. Please see my comments inline.
> 
> [snip]
> > +/*
> > + * DW9768 requires waiting time (delay time) of t_OPR after power-up,
> > + * or in the case of PD reset taking place.
> > + */
> > +#define DW9768_T_OPR_US				1000
> > +#define DW9768_Tvib_MS_BASE10			(64 - 1)
> 
> Kernel macro names are uppercase only.
> 

Aha... This is caused by my carelessness.
Fixed in next release.

> [snip]
> > +	/* Set AAC Timing */
> > +	if (dw9768->aac_timing != DW9768_AAC_TIME_DEFAULT) {
> > +		ret = i2c_smbus_write_byte_data(client, DW9768_AAC_TIME_REG,
> > +						dw9768->aac_timing);
> > +		if (ret < 0)
> > +			return ret;
> > +	}
> > +
> > +	move_delay_us = dw9768_cal_move_delay(dw9768->aac_mode,
> > +					      dw9768->clock_presc,
> > +					      dw9768->aac_timing) / 100;
> 
> We could calculate this once in probe() and store the ready us value in
> the dw9768 struct.
> 

Great idea :-)
From the perspective of 'move_delay_us' itself, it defines VCM Operation
Time, which is indeed an intrinsic parameter that belongs to DW9768
private structure.

> > +
> > +	for (val = dw9768->focus->val % DW9768_MOVE_STEPS;
> > +	     val <= dw9768->focus->val;
> > +	     val += DW9768_MOVE_STEPS) {
> > +		ret = dw9768_set_dac(dw9768, val);
> > +		if (ret) {
> > +			dev_err(&client->dev, "%s I2C failure: %d",
> > +				__func__, ret);
> > +			return ret;
> > +		}
> > +		usleep_range(move_delay_us, move_delay_us + 1000);
> > +	}
> > +
> > +	return 0;
> > +}
> [snip]
> > +	pm_runtime_enable(dev);
> > +	if (!pm_runtime_enabled(dev)) {
> > +		ret = dw9768_runtime_resume(dev);
> > +		if (ret < 0) {
> > +			dev_err(dev, "failed to power on: %d\n", ret);
> > +			goto err_clean_entity;
> > +		}
> > +	}
> > +
> > +	ret = v4l2_async_register_subdev(&dw9768->sd);
> > +	if (ret < 0) {
> > +		dev_err(dev, "failed to register V4L2 subdev: %d", ret);
> > +		goto error_async_register;
> > +	}
> > +
> > +	return 0;
> > +
> > +error_async_register:
> 
> The recommendation is to name the labels after the clean-up task that needs
> to be done. Should this one be called error_power_off?
> 

Understood.
'error_async_register' would be replaced of 'err_power_off' in next
release.

> > +	if (!pm_runtime_enabled(dev))
> > +		dw9768_runtime_suspend(dev);
> 
> Shouldn't we also call pm_runtime_disable() here?
> 

Thanks for the reminder.
We would add pm_runtime_disable() in next release.
Just like:
err_power_off:
	pm_runtime_disable(dev);
	if (!pm_runtime_enabled(dev))
		dw9768_runtime_suspend(dev);

> > +err_clean_entity:
> > +	media_entity_cleanup(&dw9768->sd.entity);
> > +err_free_handler:
> > +	v4l2_ctrl_handler_free(&dw9768->ctrls);
> > +
> > +	return ret;
> > +}
> > +
> > +static int dw9768_remove(struct i2c_client *client)
> > +{
> > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > +	struct dw9768 *dw9768 = sd_to_dw9768(sd);
> > +
> > +	v4l2_async_unregister_subdev(&dw9768->sd);
> > +	v4l2_ctrl_handler_free(&dw9768->ctrls);
> > +	media_entity_cleanup(&dw9768->sd.entity);
> > +	pm_runtime_disable(&client->dev);
> > +	if (!pm_runtime_status_suspended(&client->dev))
> 
> pm_runtime_status_suspended() doesn't consider the runtime PM disable
> state. There is also pm_runtime_suspended() and that should be correct
> here.
> 

Fixed in next release.

> Best regards,
> Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
