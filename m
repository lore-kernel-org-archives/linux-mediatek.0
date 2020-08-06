Return-Path: <SRS0=30uw=BQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4418C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 13:50:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C554E23128
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Aug 2020 13:50:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kDy/rjrV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="r5Rp1ZyQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C554E23128
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SW/fhYf/X/zpACqUoGI73ROS2pA2WRlcMukOmlyE2m0=; b=kDy/rjrVkRAKzHjUsBWHzCJPm
	l6I78/6E5L7k22WFlBAsFMSz+oeaVloD6WRKrcLylbEeHY8WEv9lXcrcX/PkfB4wyYga0G7ffP86R
	jQ/jfI4IZPW6iUzjUUOlADVMmOxatwO6IXWDTMq4owvcf84IbfH+2CesVqajmJyXixB6tBxp6s6sG
	mMp7a2uFCfrZ5zP7yPrJM2KanP9u3VPUF0QooKydXqavYhCgaC4YAGkRIdRMPIhmS6w35dWsJZauT
	BHjPw3qary+M7XF/E3+CzXOmhsyLfu5ZGS0IMNMsr4QIvE0ogjKvnR11ZFB2hyuBcY5O+mn2YerdE
	hFCASRQeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3gHI-0007ca-TN; Thu, 06 Aug 2020 13:49:52 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3gHG-0007bl-9V
 for linux-mediatek@lists.infradead.org; Thu, 06 Aug 2020 13:49:51 +0000
Received: by mail-wm1-x342.google.com with SMTP id q76so9757078wme.4
 for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2020 06:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=D2nPuh6+PfL0pW7ynAT+SzMECoPzN1zrqCQoSJsgD8I=;
 b=r5Rp1ZyQLReNIQzLJnzNIwfTUQ2LL3PCoGanIuiyoHll/QnJXJrqFFw5jOcck2mM+v
 L7IMLj4cPILDecQWjxOXKfxnlp37Rrn2Hkl6KflsSK+lZY8N1cipRb0fiPzy++JDQqt6
 l8t8g1L6iwhDQjazMh+Ay4NJ6VNloCD+tdnAogxjSHEho40vqMhitBoJQcuxt7l/ONws
 U0mzNbRE4E5OGJEnAawJUHfVaTTNL8KbpdA28hJ1IBahnFIug2GGzLTiXvRGiGlJf4Cu
 cM+roV5Uvye60/uRXodWvu0Og3luLHWs9GmuZlcfs5drdGBkDLqBTI8QCwKifYnnshMK
 JG5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=D2nPuh6+PfL0pW7ynAT+SzMECoPzN1zrqCQoSJsgD8I=;
 b=VCPmYcHdeG6Ai1ltrPpNH3k6+ht0z1KQYW9GU4Pt9LJP3B/FORUTHWbhgzRAIJdqJy
 HDvQ3+8j8Cr0PTAwNiNzTR3vqFBjJnjHADUgpAPINRRH/uJEf6IAB8SWFvQVX0w6gURn
 Rry02/0TU0djdDsKLrd/Ru40yJ8pSxeV3JF8LJqt863Ar3m0KtU1TfEkcNDWBSFAR3XJ
 itAnaLx9Pg73/LZ7vqfidqbY7zYh7EaYbhOnaWxKQzJ8aGhBmDUttNZnl0GdH3rZvR/+
 Upd6tq4jyFTUc5Pt2zdTiJjYIYxDL9iSQJ518B3KHsjBJO0ka5BIwcZg+7lFhW6Wsa6s
 2vkw==
X-Gm-Message-State: AOAM533XGiXx13enRD8+UoobI0UYQN36UL1vqFxAemgnJ2PKKg9I9xCT
 3joLnD9MBRgdmbDn13VZlUNCwQ==
X-Google-Smtp-Source: ABdhPJzCtC50wteJfCe1Z+M9Kc8c7ktFbmPycBp15RkNBzYTe4u5SEDG5ziRmdrOT3g3TUsL6szDNA==
X-Received: by 2002:a1c:28c4:: with SMTP id o187mr7776064wmo.62.1596721788974; 
 Thu, 06 Aug 2020 06:49:48 -0700 (PDT)
Received: from linux.local (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h11sm6535503wrb.68.2020.08.06.06.49.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Aug 2020 06:49:48 -0700 (PDT)
Subject: Re: [PATCH 3/6] remoteproc: mtk_vpu_rproc: Add support of JTAG
To: Mathieu Poirier <mathieu.poirier@linaro.org>
References: <20200713132927.24925-1-abailon@baylibre.com>
 <20200713132927.24925-4-abailon@baylibre.com>
 <20200721195231.GA1227776@xps15>
From: Alexandre Bailon <abailon@baylibre.com>
Message-ID: <cc53a2c1-4349-e489-0087-a31a13edef8f@baylibre.com>
Date: Thu, 6 Aug 2020 15:49:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200721195231.GA1227776@xps15>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_094950_375251_A11EE227 
X-CRM114-Status: GOOD (  38.52  )
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
Cc: ohad@wizery.com, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 7/21/20 9:52 PM, Mathieu Poirier wrote:
> On Mon, Jul 13, 2020 at 03:29:24PM +0200, Alexandre Bailon wrote:
>> The DSP could be debugged using JTAG.
>> The support of JTAG could enabled at build time and it could be enabled
>> using debugfs.
>>
>> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
>> ---
>>   drivers/remoteproc/Kconfig         |   9 ++
>>   drivers/remoteproc/mtk_apu_rproc.c | 156 ++++++++++++++++++++++++++++-
>>   2 files changed, 162 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>> index e116d4a12ac3..e1158563e2e8 100644
>> --- a/drivers/remoteproc/Kconfig
>> +++ b/drivers/remoteproc/Kconfig
>> @@ -52,6 +52,15 @@ config MTK_APU
>>   
>>   	  It's safe to say N here.
>>   
>> +config MTK_APU_JTAG
>> +	bool "Enable support of JTAG"
>> +	depends on MTK_APU
>> +	help
>> +	  Say y to enable support of JTAG.
>> +	  By default, JTAG will remain disabled until it is enabled using
>> +	  debugfs: remoteproc/remoteproc0/jtag. Write 1 to enable it and
>> +	  0 to disable it.
>> +
>>   config OMAP_REMOTEPROC
>>   	tristate "OMAP remoteproc support"
>>   	depends on ARCH_OMAP4 || SOC_OMAP5 || SOC_DRA7XX
>> diff --git a/drivers/remoteproc/mtk_apu_rproc.c b/drivers/remoteproc/mtk_apu_rproc.c
>> index fb416a817ef3..f2342b747a35 100644
>> --- a/drivers/remoteproc/mtk_apu_rproc.c
>> +++ b/drivers/remoteproc/mtk_apu_rproc.c
>> @@ -5,6 +5,7 @@
>>   
>>   #include <linux/bitops.h>
>>   #include <linux/clk.h>
>> +#include <linux/debugfs.h>
>>   #include <linux/delay.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/io.h>
>> @@ -14,6 +15,7 @@
>>   #include <linux/highmem.h>
>>   #include <linux/module.h>
>>   #include <linux/of_reserved_mem.h>
>> +#include <linux/pinctrl/consumer.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/remoteproc.h>
>>   
>> @@ -48,6 +50,11 @@
>>   #define CORE_DEFAULT1				(0x00000140)
>>   #define  CORE_DEFAULT0_ARUSER_IDMA_USE_IOMMU	(0x10 << 0)
>>   #define  CORE_DEFAULT0_AWUSER_IDMA_USE_IOMMU	(0x10 << 5)
>> +#define CORE_DEFAULT2				(0x00000144)
>> +#define CORE_DEFAULT2_DBG_EN			BIT(3)
>> +#define CORE_DEFAULT2_NIDEN			BIT(2)
>> +#define CORE_DEFAULT2_SPNIDEN			BIT(1)
>> +#define CORE_DEFAULT2_SPIDEN			BIT(0)
>>   #define CORE_XTENSA_ALTRESETVEC			(0x000001F8)
>>   
>>   struct mtk_vpu_rproc {
>> @@ -59,6 +66,13 @@ struct mtk_vpu_rproc {
>>   	struct clk *axi;
>>   	struct clk *ipu;
>>   	struct clk *jtag;
>> +
>> +#ifdef CONFIG_MTK_APU_JTAG
>> +	struct pinctrl *pinctrl;
>> +	struct pinctrl_state *pinctrl_default;
>> +	struct pinctrl_state *pinctrl_jtag;
>> +	bool jtag_enabled;
>> +#endif
>>   };
>>   
>>   static u32 vpu_read32(struct mtk_vpu_rproc *vpu_rproc, u32 off)
>> @@ -149,6 +163,133 @@ static irqreturn_t handle_event(int irq, void *data)
>>   	return IRQ_HANDLED;
>>   }
>>   
>> +#ifdef CONFIG_MTK_APU_JTAG
>> +
>> +static int vpu_enable_jtag(struct mtk_vpu_rproc *vpu_rproc)
>> +{
>> +	int ret = 0;
>> +
>> +	if (vpu_rproc->jtag_enabled)
>> +		return -EINVAL;
>> +
>> +	ret = pinctrl_select_state(vpu_rproc->pinctrl,
>> +				   vpu_rproc->pinctrl_jtag);
>> +	if (ret < 0) {
>> +		dev_err(vpu_rproc->dev, "Failed to configure pins for JTAG\n");
>> +		return ret;
>> +	}
>> +
>> +	vpu_write32(vpu_rproc, CORE_DEFAULT2,
>> +		    CORE_DEFAULT2_SPNIDEN | CORE_DEFAULT2_SPIDEN |
>> +		    CORE_DEFAULT2_NIDEN | CORE_DEFAULT2_DBG_EN);
>> +
>> +	vpu_rproc->jtag_enabled = 1;
> There should be mutex that gets taken at the beginning and released at the end of
> this function.
>
>> +
>> +	return ret;
>> +}
>> +
>> +static int vpu_disable_jtag(struct mtk_vpu_rproc *vpu_rproc)
>> +{
>> +	int ret = 0;
>> +
>> +	if (!vpu_rproc->jtag_enabled)
>> +		return -EINVAL;
>> +
>> +	vpu_write32(vpu_rproc, CORE_DEFAULT2, 0);
>> +
>> +	ret = pinctrl_select_state(vpu_rproc->pinctrl,
>> +				   vpu_rproc->pinctrl_default);
>> +	if (ret < 0) {
>> +		dev_err(vpu_rproc->dev,
>> +			"Failed to configure pins to default\n");
>> +		return ret;
>> +	}
>> +
>> +	vpu_rproc->jtag_enabled = 0;
> Same comment as above.
>
>> +
>> +	return ret;
>> +}
>> +
>> +static ssize_t rproc_jtag_read(struct file *filp, char __user *userbuf,
>> +			       size_t count, loff_t *ppos)
>> +{
>> +	struct rproc *rproc = filp->private_data;
>> +	struct mtk_vpu_rproc *vpu_rproc = (struct mtk_vpu_rproc *)rproc->priv;
>> +	char *buf = vpu_rproc->jtag_enabled ? "enabled\n" : "disabled\n";
>> +
>> +	return simple_read_from_buffer(userbuf, count, ppos, buf, strlen(buf));
>> +}
>> +
>> +static ssize_t rproc_jtag_write(struct file *filp, const char __user *user_buf,
>> +				size_t count, loff_t *ppos)
>> +{
>> +	struct rproc *rproc = filp->private_data;
>> +	struct mtk_vpu_rproc *vpu_rproc = (struct mtk_vpu_rproc *)rproc->priv;
>> +	char buf[10];
>> +	int ret;
>> +
>> +	if (count < 1 || count > sizeof(buf))
>> +		return -EINVAL;
>> +
>> +	ret = copy_from_user(buf, user_buf, count);
>> +	if (ret)
>> +		return -EFAULT;
>> +
>> +	/* remove end of line */
>> +	if (buf[count - 1] == '\n')
>> +		buf[count - 1] = '\0';
>> +
>> +	if (!strncmp(buf, "1", count) || !strncmp(buf, "enabled", count))
>> +		ret = vpu_enable_jtag(vpu_rproc);
>> +	else if (!strncmp(buf, "0", count) || !strncmp(buf, "disabled", count))
>> +		ret = vpu_disable_jtag(vpu_rproc);
>> +	else
>> +		return -EINVAL;
> I think we should simply stick with "enabled" and "disabled" to be in line with
> what is done in rproc_recovery_write().
>
>> +
>> +	return ret ? ret : count;
>> +}
>> +
>> +static const struct file_operations rproc_jtag_ops = {
>> +	.read = rproc_jtag_read,
>> +	.write = rproc_jtag_write,
>> +	.open = simple_open,
>> +};
>> +
>> +static int vpu_jtag_probe(struct mtk_vpu_rproc *vpu_rproc)
>> +{
>> +	int ret;
>> +
>> +	if (!vpu_rproc->rproc->dbg_dir)
>> +		return -ENODEV;
>> +
>> +	vpu_rproc->pinctrl = devm_pinctrl_get(vpu_rproc->dev);
>> +	if (IS_ERR(vpu_rproc->pinctrl)) {
>> +		dev_warn(vpu_rproc->dev, "Failed to find JTAG pinctrl\n");
>> +		return PTR_ERR(vpu_rproc->pinctrl);
>> +	}
>> +
>> +	vpu_rproc->pinctrl_default = pinctrl_lookup_state(vpu_rproc->pinctrl,
>> +							PINCTRL_STATE_DEFAULT);
> Indentation problem.
>
>> +	if (IS_ERR(vpu_rproc->pinctrl_default))
>> +		return PTR_ERR(vpu_rproc->pinctrl_default);
>> +
>> +	vpu_rproc->pinctrl_jtag = pinctrl_lookup_state(vpu_rproc->pinctrl,
>> +						       "jtag");
>> +	if (IS_ERR(vpu_rproc->pinctrl_jtag))
>> +		return PTR_ERR(vpu_rproc->pinctrl_jtag);
>> +
>> +	ret = pinctrl_select_state(vpu_rproc->pinctrl,
>> +				   vpu_rproc->pinctrl_default);
> What is the default configuration for?  It does not seem to be needed to
> properly boot the remote processor since it is not part of the example in the
> bindings or dts patch included in this set.   Moreover it is part of a
> configuration option so I really don't understand what it does.

I have a poor knowledge of pinctrl framework so I may have done things 
wrong here.
This is not really needed for the remote processor.
By default, I don't want pin to be configured for JTAG until we enable 
it and
I want to be able to revert it the default state.
May be this is too much and I should assume that if we build the driver 
with JTAG enabled
then we want the pins to be configured for JTAG by default.

>
>
>
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	debugfs_create_file("jtag", 0600, vpu_rproc->rproc->dbg_dir,
>> +			    vpu_rproc->rproc, &rproc_jtag_ops);
>> +
>> +	return 0;
>> +}
>> +#endif /* CONFIG_MTK_APU_JTAG */
>> +
>>   static int mtk_vpu_rproc_probe(struct platform_device *pdev)
>>   {
>>   	struct device *dev = &pdev->dev;
>> @@ -228,16 +369,16 @@ static int mtk_vpu_rproc_probe(struct platform_device *pdev)
>>   		goto clk_disable_ipu;
>>   	}
>>   
>> -	vpu_rproc->jtag = devm_clk_get_optional(dev, "jtag");
>> +	vpu_rproc->jtag = devm_clk_get(vpu_rproc->dev, "jtag");
> As I remarked in my comments on the previous patch, this should have been
> devm_clk_get() from the start.  Either that or the bindings are wrong.

I should have not made the change in this patch. I will fix it.

Thanks,
Alexandre

>
>>   	if (IS_ERR(vpu_rproc->jtag)) {
>> -		dev_err(dev, "Failed to enable jtag clock\n");
>> +		dev_err(vpu_rproc->dev, "Failed to get jtag clock\n");
> Why go from dev to vpu_rproc->dev?
>
>>   		ret = PTR_ERR(vpu_rproc->jtag);
>>   		goto clk_disable_axi;
>>   	}
>>   
>>   	ret = clk_prepare_enable(vpu_rproc->jtag);
>>   	if (ret) {
>> -		dev_err(dev, "Failed to enable jtag clock\n");
>> +		dev_err(vpu_rproc->dev, "Failed to enable jtag clock\n");
> Same here.
>
>>   		goto clk_disable_axi;
>>   	}
>>   
>> @@ -253,6 +394,12 @@ static int mtk_vpu_rproc_probe(struct platform_device *pdev)
>>   		goto free_mem;
>>   	}
>>   
>> +#ifdef CONFIG_MTK_APU_JTAG
>> +	ret = vpu_jtag_probe(vpu_rproc);
>> +	if (ret)
>> +		dev_warn(dev, "Failed to configure jtag\n");
>> +#endif
> Please don't use #ifdefs in the code like that.  It is better to introduce a
> #else (above) with stubs that don't do anything.
>
>> +
>>   	return 0;
>>   
>>   free_mem:
>> @@ -277,6 +424,9 @@ static int mtk_vpu_rproc_remove(struct platform_device *pdev)
>>   
>>   	disable_irq(vpu_rproc->irq);
>>   
>> +#ifdef CONFIG_MTK_APU_JTAG
>> +	vpu_disable_jtag(vpu_rproc);
>> +#endif
>>   	rproc_del(rproc);
>>   	of_reserved_mem_device_release(dev);
>>   	clk_disable_unprepare(vpu_rproc->jtag);
>> -- 
>> 2.26.2
>>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
