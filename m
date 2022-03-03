Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5469DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 15:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iVJt81jnIXKes+82o6CTNcBC7cYPf/3flBAjTYuJHUI=; b=ogFneVztENxaWN
	pRp4RnaWqmCk+w9NcqiddOfa0VdcPctnIWNsGyxxNpScgS7q5gtnu8kDvfketCb7AKqzlHvGeX2Wm
	YcE6nYtJJGc5EKip/rgVSN5Wk70mmdKSGjSathR6EH7SbHlQmJQ/H4qhbncyPp+MNcWPXoeheJEx3
	7qysxZKAXeVGiAFzGffhAAVOVIlel9vqJROSNV099Em3MTflq7pQmmL0gKpzbHjVF/uspHStwNgfq
	th8l7/VWBtiDn2DEkIWROu7RugVB7WIUFSYs0Qk38OBejar5AL/ihq/EuLppjeapLdOGsKQuUkEYy
	pf/tbBQPMlk0pwFPx27Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPnQh-006q3G-D8; Thu, 03 Mar 2022 15:31:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPnQ1-006poo-ST; Thu, 03 Mar 2022 15:31:10 +0000
X-UUID: f1fe399ef0fe4386b5600a2d9b5f980a-20220303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Q/FAlT8SuZC8YHmRR3bTb0dG25U96KfISVPTTAyEV5A=; 
 b=Entg52F+SVVkw1vME0sSqzQ4m8hwdt6MImX/NLxhjiPiI1hexi0LHte1LJW7Owyojbbxq9hbGxbju5rKDbkrLe2R0dknNe3SxYuX5Cx8V8ocUmBC5VDsytxlyTY/8uav+8/W2KgeK/zw/hL26BGRtQ05drUNQ6MNmQUGLR91svQ=;
X-UUID: f1fe399ef0fe4386b5600a2d9b5f980a-20220303
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 300533617; Thu, 03 Mar 2022 08:31:03 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 3 Mar 2022 07:31:01 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 3 Mar 2022 23:30:47 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Mar 2022 23:30:46 +0800
Message-ID: <a6a2c2e4acdd52bd3aa8b8551e0a9180255aecd2.camel@mediatek.com>
Subject: Re: [v2 11/17] ASoC: mediatek: mt8186: support gpio control in
 platform driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>, <perex@perex.cz>, <p.zabel@pengutronix.de>,
 <geert+renesas@glider.be>, <trevor.wu@mediatek.com>, <tzungbi@google.com>,
 <aaronyu@google.com>, <zhangqilong3@huawei.com>,
 <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Thu, 3 Mar 2022 23:30:46 +0800
In-Reply-To: <308642b6-3615-bb55-2667-e2e3150be015@collabora.com>
References: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
 <20220217134205.15400-12-jiaxin.yu@mediatek.com>
 <308642b6-3615-bb55-2667-e2e3150be015@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_073105_983880_965D1735 
X-CRM114-Status: GOOD (  28.85  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2022-02-18 at 15:54 +0100, AngeloGioacchino Del Regno wrote:
> Il 17/02/22 14:41, Jiaxin Yu ha scritto:
> > This patch add gpio control for all audio interface separately.
> > 
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > ---
> >   sound/soc/mediatek/mt8186/mt8186-afe-gpio.c | 210
> > ++++++++++++++++++++
> >   sound/soc/mediatek/mt8186/mt8186-afe-gpio.h |  19 ++
> >   2 files changed, 229 insertions(+)
> >   create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
> >   create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-gpio.h
> > 
> > diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
> > b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
> > new file mode 100644
> > index 000000000000..6faec5c95bf3
> > --- /dev/null
> > +++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
> > @@ -0,0 +1,210 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +//
> > +// mt8186-afe-gpio.c  --  Mediatek 8186 afe gpio ctrl
> > +//
> > +// Copyright (c) 2022 MediaTek Inc.
> > +// Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > +
> > +#include <linux/gpio.h>
> > +#include <linux/pinctrl/consumer.h>
> > +
> > +#include "mt8186-afe-common.h"
> > +#include "mt8186-afe-gpio.h"
> > +
> > +struct pinctrl *aud_pinctrl;
> > +
> > +enum mt8186_afe_gpio {
> > +	MT8186_AFE_GPIO_CLK_MOSI_OFF,
> > +	MT8186_AFE_GPIO_CLK_MOSI_ON,
> > +	MT8186_AFE_GPIO_CLK_MISO_OFF,
> > +	MT8186_AFE_GPIO_CLK_MISO_ON,
> > +	MT8186_AFE_GPIO_DAT_MISO_OFF,
> > +	MT8186_AFE_GPIO_DAT_MISO_ON,
> > +	MT8186_AFE_GPIO_DAT_MOSI_OFF,
> > +	MT8186_AFE_GPIO_DAT_MOSI_ON,
> > +	MT8186_AFE_GPIO_I2S0_OFF,
> > +	MT8186_AFE_GPIO_I2S0_ON,
> > +	MT8186_AFE_GPIO_I2S1_OFF,
> > +	MT8186_AFE_GPIO_I2S1_ON,
> > +	MT8186_AFE_GPIO_I2S2_OFF,
> > +	MT8186_AFE_GPIO_I2S2_ON,
> > +	MT8186_AFE_GPIO_I2S3_OFF,
> > +	MT8186_AFE_GPIO_I2S3_ON,
> > +	MT8186_AFE_GPIO_TDM_OFF,
> > +	MT8186_AFE_GPIO_TDM_ON,
> > +	MT8186_AFE_GPIO_PCM_OFF,
> > +	MT8186_AFE_GPIO_PCM_ON,
> > +	MT8186_AFE_GPIO_GPIO_NUM
> > +};
> > +
> > +struct audio_gpio_attr {
> > +	const char *name;
> > +	bool gpio_prepare;
> > +	struct pinctrl_state *gpioctrl;
> > +};
> > +
> > +static struct audio_gpio_attr aud_gpios[MT8186_AFE_GPIO_GPIO_NUM]
> > = {
> > +	[MT8186_AFE_GPIO_CLK_MOSI_OFF] = {"aud_clk_mosi_off", false,
> > NULL},
> > +	[MT8186_AFE_GPIO_CLK_MOSI_ON] = {"aud_clk_mosi_on", false,
> > NULL},
> > +	[MT8186_AFE_GPIO_CLK_MISO_OFF] = {"aud_clk_miso_off", false,
> > NULL},
> > +	[MT8186_AFE_GPIO_CLK_MISO_ON] = {"aud_clk_miso_on", false,
> > NULL},
> > +	[MT8186_AFE_GPIO_DAT_MISO_OFF] = {"aud_dat_miso_off", false,
> > NULL},
> > +	[MT8186_AFE_GPIO_DAT_MISO_ON] = {"aud_dat_miso_on", false,
> > NULL},
> > +	[MT8186_AFE_GPIO_DAT_MOSI_OFF] = {"aud_dat_mosi_off", false,
> > NULL},
> > +	[MT8186_AFE_GPIO_DAT_MOSI_ON] = {"aud_dat_mosi_on", false,
> > NULL},
> > +	[MT8186_AFE_GPIO_I2S0_OFF] = {"aud_gpio_i2s0_off", false,
> > NULL},
> > +	[MT8186_AFE_GPIO_I2S0_ON] = {"aud_gpio_i2s0_on", false, NULL},
> > +	[MT8186_AFE_GPIO_I2S1_OFF] = {"aud_gpio_i2s1_off", false,
> > NULL},
> > +	[MT8186_AFE_GPIO_I2S1_ON] = {"aud_gpio_i2s1_on", false, NULL},
> > +	[MT8186_AFE_GPIO_I2S2_OFF] = {"aud_gpio_i2s2_off", false,
> > NULL},
> > +	[MT8186_AFE_GPIO_I2S2_ON] = {"aud_gpio_i2s2_on", false, NULL},
> > +	[MT8186_AFE_GPIO_I2S3_OFF] = {"aud_gpio_i2s3_off", false,
> > NULL},
> > +	[MT8186_AFE_GPIO_I2S3_ON] = {"aud_gpio_i2s3_on", false, NULL},
> > +	[MT8186_AFE_GPIO_TDM_OFF] = {"aud_gpio_tdm_off", false, NULL},
> > +	[MT8186_AFE_GPIO_TDM_ON] = {"aud_gpio_tdm_on", false, NULL},
> > +	[MT8186_AFE_GPIO_PCM_OFF] = {"aud_gpio_pcm_off", false, NULL},
> > +	[MT8186_AFE_GPIO_PCM_ON] = {"aud_gpio_pcm_on", false, NULL},
> > +};
> > +
> > +static DEFINE_MUTEX(gpio_request_mutex);
> > +
> > +int mt8186_afe_gpio_init(struct device *dev)
> > +{
> > +	int ret;
> > +	int i = 0;
> > +
> > +	aud_pinctrl = devm_pinctrl_get(dev);
> > +	if (IS_ERR(aud_pinctrl)) {
> > +		ret = PTR_ERR(aud_pinctrl);
> > +		dev_info(dev, "%s(), ret %d, cannot get
> > aud_pinctrl!\n",
> > +			 __func__, ret);
> 
> dev_err()
> ... and return ret.
> 
> > +		return -ENODEV;
> > +	}
> > +
> > +	for (i = 0; i < ARRAY_SIZE(aud_gpios); i++) {
> > +		aud_gpios[i].gpioctrl =
> > pinctrl_lookup_state(aud_pinctrl,
> > +							     aud_gpios[
> > i].name);
> > +		if (IS_ERR(aud_gpios[i].gpioctrl)) {
> > +			ret = PTR_ERR(aud_gpios[i].gpioctrl);
> > +			dev_info(dev, "%s(), pinctrl_lookup_state %s
> > fail, ret %d\n",
> > +				 __func__, aud_gpios[i].name, ret);
> 
> dev_err()
> 
> P.S.: I think that this function should return ret, at this point, to
> avoid
>        unexpected behavior.

Because we maybe don't need to config all of audio interface gpio in
dtsi. for example, we may only use I2S0/I2S1 instead of I2S3/I2S4, so
there only config I2S0/I2S1's pinctrl in dtsi. So I think there only
need dev_info() as a reminder. How do you suggest for it?

> 
> 
> > +		} else {
> > +			aud_gpios[i].gpio_prepare = true;
> > +		}
> > +	}
> > +
> > +	/* gpio status init */
> > +	mt8186_afe_gpio_request(dev, false, MT8186_DAI_ADDA, 0);
> > +	mt8186_afe_gpio_request(dev, false, MT8186_DAI_ADDA, 1);
> > +
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(mt8186_afe_gpio_init);
> > +
> > +static int mt8186_afe_gpio_select(struct device *dev,
> > +				  enum mt8186_afe_gpio type)
> > +{
> > +	int ret = 0;
> > +
> > +	if (type < 0 || type >= MT8186_AFE_GPIO_GPIO_NUM) {
> > +		dev_info(dev, "%s(), error, invalid gpio type %d\n",
> > +			 __func__, type);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (!aud_gpios[type].gpio_prepare) {
> > +		dev_info(dev, "%s(), error, gpio type %d not
> > prepared\n",
> > +			 __func__, type);
> > +		return -EIO;
> > +	}
> > +
> > +	ret = pinctrl_select_state(aud_pinctrl,
> > +				   aud_gpios[type].gpioctrl);
> > +	if (ret)
> > +		dev_info(dev, "%s(), error, can not set gpio type
> > %d\n",
> > +			 __func__, type);
> > +
> > +	return ret;
> 
> Please change it like so:
> 
> 	if (ret) {
> 		dev_err(dev, "Failed to select picntrl state for type
> %d\n", type);
> 		return ret;
> 	}
> 
> 	return 0;
> 
> > +}
> > +
> > +static int mt8186_afe_gpio_adda_dl(struct device *dev, bool
> > enable)
> > +{
> > +	if (enable) {
> > +		mt8186_afe_gpio_select(dev,
> > MT8186_AFE_GPIO_CLK_MOSI_ON);
> > +		mt8186_afe_gpio_select(dev,
> > MT8186_AFE_GPIO_DAT_MOSI_ON);
> > +	} else {
> > +		mt8186_afe_gpio_select(dev,
> > MT8186_AFE_GPIO_DAT_MOSI_OFF);
> > +		mt8186_afe_gpio_select(dev,
> > MT8186_AFE_GPIO_CLK_MOSI_OFF);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int mt8186_afe_gpio_adda_ul(struct device *dev, bool
> > enable)
> > +{
> > +	if (enable) {
> > +		mt8186_afe_gpio_select(dev,
> > MT8186_AFE_GPIO_CLK_MISO_ON);
> > +		mt8186_afe_gpio_select(dev,
> > MT8186_AFE_GPIO_DAT_MISO_ON);
> > +	} else {
> > +		mt8186_afe_gpio_select(dev,
> > MT8186_AFE_GPIO_DAT_MISO_OFF);
> > +		mt8186_afe_gpio_select(dev,
> > MT8186_AFE_GPIO_CLK_MISO_OFF);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +int mt8186_afe_gpio_request(struct device *dev, bool enable,
> > +			    int dai, int uplink)
> > +{
> 
> I think that it's more readable and even shorter if you do:
> 
> 	enum mt8186_afe_gpio sel;
> 
> 	int ret = -EINVAL;
> 
> 
> 
> 	mutex_lock(&gpio_request_mutex);
> 
> 
> 
> 	switch (dai) {
> 
> 	case MT8186_DAI_ADDA:
> 		if (uplink)
> 			ret = mt8186_afe_gpio_adda_ul(dev, enable);
> 		else
> 			ret = mt8186_afe_gpio_adda_dl(dev, enable);
> 		goto unlock;
> 	case MT8186_DAI_I2S_0:
> 
> 		sel = enable ? MT8186_AFE_GPIO_I2S0_ON :
> MT8186_AFE_GPIO_I2S0_OFF;
> 
> 		break;
> 
> 	case MT8186_DAI_I2S_1:
> 
> 		sel = enable ? MT8186_AFE_GPIO_I2S1_ON :
> MT8186_AFE_GPIO_I2S1_OFF;
> 
> 		break;
> 
> 
> 
> 	.................... all other cases ................
> 
> 	default:
> 
> 		dev_err(dev, "invalid dai %d\n", dai);
> 
> 		goto unlock;
> 
> 	}
> 
> 
> 	ret = mt8186_afe_gpio_select(dev, sel);
> 
> 
> unlock:
> 
> 	mutex_unlock(&gpio_request_mutex);
> 
> 	return ret;
> }
> 
> > +	mutex_lock(&gpio_request_mutex);
> > +	switch (dai) {
> > +	case MT8186_DAI_ADDA:
> > +		if (uplink)
> > +			mt8186_afe_gpio_adda_ul(dev, enable);
> > +		else
> > +			mt8186_afe_gpio_adda_dl(dev, enable);
> > +		break;
> > +	case MT8186_DAI_I2S_0:
> > +		if (enable)
> > +			mt8186_afe_gpio_select(dev,
> > MT8186_AFE_GPIO_I2S0_ON);
> > +		else
> > +			mt8186_afe_gpio_select(dev,
> > MT8186_AFE_GPIO_I2S0_OFF);
> > +		break;
> > +	case MT8186_DAI_I2S_1:
> > +		if (enable)
> > +			mt8186_afe_gpio_select(dev,
> > MT8186_AFE_GPIO_I2S1_ON);
> > +		else
> > +			mt8186_afe_gpio_select(dev,
> > MT8186_AFE_GPIO_I2S1_OFF);
> > +		break;
> > +	case MT8186_DAI_I2S_2:
> > +		if (enable)
> > +			mt8186_afe_gpio_select(dev,
> > MT8186_AFE_GPIO_I2S2_ON);
> > +		else
> > +			mt8186_afe_gpio_select(dev,
> > MT8186_AFE_GPIO_I2S2_OFF);
> > +		break;
> > +	case MT8186_DAI_I2S_3:
> > +		if (enable)
> > +			mt8186_afe_gpio_select(dev,
> > MT8186_AFE_GPIO_I2S3_ON);
> > +		else
> > +			mt8186_afe_gpio_select(dev,
> > MT8186_AFE_GPIO_I2S3_OFF);
> > +		break;
> > +	case MT8186_DAI_TDM_IN:
> > +		if (enable)
> > +			mt8186_afe_gpio_select(dev,
> > MT8186_AFE_GPIO_TDM_ON);
> > +		else
> > +			mt8186_afe_gpio_select(dev,
> > MT8186_AFE_GPIO_TDM_OFF);
> > +		break;
> > +	case MT8186_DAI_PCM:
> > +		if (enable)
> > +			mt8186_afe_gpio_select(dev,
> > MT8186_AFE_GPIO_PCM_ON);
> > +		else
> > +			mt8186_afe_gpio_select(dev,
> > MT8186_AFE_GPIO_PCM_OFF);
> > +		break;
> > +	default:
> > +		mutex_unlock(&gpio_request_mutex);
> > +		dev_info(dev, "%s(), invalid dai %d\n", __func__, dai);
> > +		return -EINVAL;
> > +	}
> > +	mutex_unlock(&gpio_request_mutex);
> > +	return 0;
> > +}
> > diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.h
> > b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.h
> > new file mode 100644
> > index 000000000000..1ddc27838eb1
> > --- /dev/null
> > +++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.h
> > @@ -0,0 +1,19 @@
> > +/* SPDX-License-Identifier: GPL-2.0
> > + *
> > + * mt6833-afe-gpio.h  --  Mediatek 6833 afe gpio ctrl definition
> > + *
> > + * Copyright (c) 2022 MediaTek Inc.
> > + * Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > + */
> > +
> > +#ifndef _MT8186_AFE_GPIO_H_
> > +#define _MT8186_AFE_GPIO_H_
> > +
> > +struct mtk_base_afe;
> > +
> > +int mt8186_afe_gpio_init(struct device *dev);
> > +
> > +int mt8186_afe_gpio_request(struct device *dev, bool enable,
> > +			    int dai, int uplink);
> > +
> > +#endif
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
