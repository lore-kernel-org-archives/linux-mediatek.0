Return-Path: <SRS0=p0H4=GU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3405C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Jan 2021 17:44:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 240D2224DF
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Jan 2021 17:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 240D2224DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2XcGffBKQEhB4tGPFfzxm3WENiYBlH5+rcwASZiI7O0=; b=gBe6PLWkr01B4EO7C2T7bp3Ew
	bk100JxFL5YBWKFSEY7biAv8bBZr+O3Zrr+14r7ptGMl2sQGCT5gncmu2F2tlIc3S9P4pkHpMj19x
	xIgq8OPn+cn4etOSDMLE5hZ5FB+yKUByww/2zxbx0chsAOZ7tm8ojhrdOu7zFaFZ8mUUdUUuTIW3+
	Y32UYBSMZ0f6dmJgiPx5vM3LsEia9Ry6l+ohe3QWda4peBh/P2o4xdoeM+M8NUcuNFXYI5fWTYCzE
	+MAh2DSliUh3sUt+z0n+ZY/Pt3p2Bzlkhrs+2dPWqGgipUTrE+xTeLxm+KaAM0pRm3NhNCW6z0fzI
	6Q14Z3CxA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1C5r-0003OP-H8; Sun, 17 Jan 2021 17:44:03 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1C5o-0003Mc-ID; Sun, 17 Jan 2021 17:44:02 +0000
Received: by mail-ot1-x32b.google.com with SMTP id i30so1107823ota.6;
 Sun, 17 Jan 2021 09:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tMDYAz1pcj84nMeQHFK12E26S9/O9jmFFjULa1oURTA=;
 b=pLjOXjUntYAE/ggZnSXScD/DaoICvnle5d0XGm/a32S7PAxfN6QuhxNKsIF3FpSZMh
 nb5WMrfb9NayshRIO7QN4P70Vpf2if/ILkN0n7zr9xoQvpDQSdjhtV4jELZlY3BUZuEM
 trW6mJpGt6t4qhE50N0LoWjcy8X4mqYtqAo9QD1nucRNympCqZ2N/yHtD0exhfumM4Er
 c2qfsS+9Add6z2tU3dDWObKxTfnZnenetyNLv/Mz1cf3lK1XTvt0u+1qDl4sv99KCe+S
 TTGAofvOkJcaGgUvwhfWTCwWtbIklPeDTCP9LFishRNtFqdVo8kISVp1V8HKN/sMJ+lF
 wK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=tMDYAz1pcj84nMeQHFK12E26S9/O9jmFFjULa1oURTA=;
 b=WzywWPIPmJUYYsKA4NjK/LYw0l28uM408Ivu1+werV2OWu+D5kNJfVmQ0i1vQA/Q3c
 M+0b6N4+eDfwD1BQdrv1sbyvsXB9y2JohYXoOiNZbD2hOE5GFpnAWqgvgMXN5ItHcM/s
 VTqx9y0fy2iUYkFjb//ICtzbWR8c/aYpuQaS56aB1uHsxz8UrnteGvd6NORysOeyC+9B
 QQM3MFThuSYGcZEr/gSbE283dYgrBMhpCx1iXy+5QO+sf8bttDtXBoaPx4kwTVCGXL7g
 oXpER90/0gp5B7k61G+lmiZVd850qfSps16ch+wlITJfpGkQXBen3ia/9aim8few5lXI
 juag==
X-Gm-Message-State: AOAM532Ka5CDgfixes7N7ui0zMqeSFsKtBtXLQO2FqsvQrq0Bf9Z5y1S
 MAq0pIVSETsumYspFe91cRI=
X-Google-Smtp-Source: ABdhPJw1xzKjrlHsz0gVmd2NFTcsxhLrktpAuJiCemlq78SyrLFQkTyV8dbuErOUO1x8yxfC8/LqwA==
X-Received: by 2002:a9d:ea6:: with SMTP id 35mr15093975otj.188.1610905431845; 
 Sun, 17 Jan 2021 09:43:51 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 l12sm3142862ooq.22.2021.01.17.09.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 Jan 2021 09:43:51 -0800 (PST)
Subject: Re: [PATCH 1/2] usb typec: tcpci: mt6360: Add vsafe0v support and
 external vbus supply control
To: cy_huang <u0084500@gmail.com>, heikki.krogerus@linux.intel.com,
 matthias.bgg@gmail.com, robh+dt@kernel.org
References: <1610720001-15300-1-git-send-email-u0084500@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <3a4a88a9-f0e3-2b65-9df4-6c1d4e3f1c14@roeck-us.net>
Date: Sun, 17 Jan 2021 09:43:48 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1610720001-15300-1-git-send-email-u0084500@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210117_124400_828802_7D358B6A 
X-CRM114-Status: GOOD (  26.74  )
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
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 1/15/21 6:13 AM, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> MT6360 not support for TCPC command to control source and sink.

does not

> Uses external 5V vbus regulator as the vbus source control.
> 
Use

> Also adds the capability to report vsafe0v.
> 
add

So far this driver works without regulator. Unless I am missing something,
this patch makes regulator support mandatory, meaning existing code will fail.
I am not sure if that is appropriate/acceptable. Can we be sure that this will
work for existing users of this driver ?

Thanks,
Guenter

> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  drivers/usb/typec/tcpm/tcpci_mt6360.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci_mt6360.c b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> index f1bd9e0..0edf4b6 100644
> --- a/drivers/usb/typec/tcpm/tcpci_mt6360.c
> +++ b/drivers/usb/typec/tcpm/tcpci_mt6360.c
> @@ -11,6 +11,7 @@
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/usb/tcpm.h>
>  
>  #include "tcpci.h"
> @@ -36,6 +37,7 @@ struct mt6360_tcpc_info {
>  	struct tcpci_data tdata;
>  	struct tcpci *tcpci;
>  	struct device *dev;
> +	struct regulator *vbus;
>  	int irq;
>  };
>  
> @@ -51,6 +53,27 @@ static inline int mt6360_tcpc_write16(struct regmap *regmap,
>  	return regmap_raw_write(regmap, reg, &val, sizeof(u16));
>  }
>  
> +static int mt6360_tcpc_set_vbus(struct tcpci *tcpci, struct tcpci_data *data, bool src, bool snk)
> +{
> +	struct mt6360_tcpc_info *mti = container_of(data, struct mt6360_tcpc_info, tdata);
> +	int ret;
> +
> +	/* To correctly handle the already enabled vbus and disable its supply first */
> +	if (regulator_is_enabled(mti->vbus)) {
> +		ret = regulator_disable(mti->vbus);
> +		if (ret)
> +			return ret;
> +	}

Is it really a good idea to disable vbus if it happens to be already enabled
and there is (another ?) request to enable it ?

> +
> +	if (src) {
> +		ret = regulator_enable(mti->vbus);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int mt6360_tcpc_init(struct tcpci *tcpci, struct tcpci_data *tdata)
>  {
>  	struct regmap *regmap = tdata->regmap;
> @@ -138,7 +161,13 @@ static int mt6360_tcpc_probe(struct platform_device *pdev)
>  	if (mti->irq < 0)
>  		return mti->irq;
>  
> +	mti->vbus = devm_regulator_get(&pdev->dev, "vbus");
> +	if (IS_ERR(mti->vbus))
> +		return PTR_ERR(mti->vbus);
> +
>  	mti->tdata.init = mt6360_tcpc_init;
> +	mti->tdata.set_vbus = mt6360_tcpc_set_vbus;
> +	mti->tdata.vbus_vsafe0v = 1;
>  	mti->tcpci = tcpci_register_port(&pdev->dev, &mti->tdata);
>  	if (IS_ERR(mti->tcpci)) {
>  		dev_err(&pdev->dev, "Failed to register tcpci port\n");
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
