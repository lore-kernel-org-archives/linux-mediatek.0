Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3094C05027
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Feb 2023 14:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=63FbMXrHnvr/mXxfnNiaGgvC6f2V9Ec37cTVHS6GGy8=; b=2+ulId9WEh1bRZIFos3JG2oDHd
	mlYEi0ZNbeCo8EqM6gMjA2gqRNtuawDsJAwaHSz16DB98nkvgDFJumb09PjEcC3VJeXEiyjX0n9j2
	aebLuDKFv8hLrUQCsyJnCMV6dh2zxe1/8LWn/A8EyX+7W+KUyRS1C8V1TjT9Qo7Xdqas51Gaf0rdw
	pFJDy32yt0IG8pcRa6klUBbbNueHbnW7UdXIUjcxBvzytL3IB9u76Z8ikpGZYaR67VnY93c34Xcvf
	pmob48jXsTSG0y/2O42Ukbf/TnrVgbKHXUP8TzGK0Dft7B4Y+KCbWkd8Psh4CPwz6ha/0l5woHOPf
	K3aoXkOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP29T-008itB-OR; Mon, 06 Feb 2023 14:07:23 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP29Q-008irU-KZ
	for linux-mediatek@lists.infradead.org; Mon, 06 Feb 2023 14:07:21 +0000
Received: by mail-wm1-x32b.google.com with SMTP id f23-20020a05600c491700b003dff4480a17so2457690wmp.1
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Feb 2023 06:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=63FbMXrHnvr/mXxfnNiaGgvC6f2V9Ec37cTVHS6GGy8=;
        b=d4qoiTd/w/GXkJAEplSab84iZwfJhUKLODfoDrE3nJbWhZOgdFwifmvmvr+Bmwzxqc
         byxgxKovHjY8IDjqE8Ht2MvAeRE8pWaijnXpDAswjl9O/Xb7m+M8suBagdJpsKeNYIZG
         SzKZxuqtVOwpfCtgxJXY7cUFwUmSyE99TOG//W+q0rNq+R2ur7A3hIhyyVTDBgvEPmT4
         WtTVI78kyLPX2GQywXjKGOK0WHUQwrD7cQOuxOgp321t9Wp0YKZlDwz5/Sr6ZOnd7tu9
         Wa056N7SCsz88EAsaIE1rKK0tY2mQB6SMwdkbSHdud9lVDpWIQSWfomNb6dHx6OmZwO/
         x4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63FbMXrHnvr/mXxfnNiaGgvC6f2V9Ec37cTVHS6GGy8=;
        b=Ajs7bjo0RqAG49mPbH5NFIcuwJskiNgY8QXeNuPQuihHNYgsly9atQELNIsRN8qthq
         zZ2jdrRU3saDac6iEnUeOsTPZWYc9kGtj36e8Ce8BiEgJYXTLEslVB8drZlCOWBBr6aF
         +kzKIcxSYWNfU3fiHXm6OPh17+9tzZgJW4yfYec5T9yARQUUs2syWK9RrB9c9FAAg7cX
         U9I3y3pK5Ynj+xL12mTxN1G8sXLbY0uxgl3Ar2naIHDMV3s3OZAPtFwWUX2EWUtEOqQb
         LO/wDb6cxZ1ttEH9KMNcYk+3xr4JfyahNw3dm9WNkOEN8eefwkbcvnyNv4cIijzfOBJ1
         P/Qw==
X-Gm-Message-State: AO0yUKWnCBH60NcyuCI6I/VjY2RrOlnep6tnO6QHN37alsnb1JCz0Xl+
	a8a6DsGL9B6fCZUBKKKYUDkIvg==
X-Google-Smtp-Source: AK7set/TdtA74eFvGRdYxYzvd4ZKtZvFhWEOzAAXv1InLpgvOTG5k3hLRNddq+oAvmj/I4LxwoFEKw==
X-Received: by 2002:a05:600c:1c0e:b0:3d0:6a57:66a5 with SMTP id j14-20020a05600c1c0e00b003d06a5766a5mr19373315wms.0.1675692436728;
        Mon, 06 Feb 2023 06:07:16 -0800 (PST)
Received: from linaro.org (wifi-eduroam-trans.univ-tlse3.fr. [195.220.58.237])
        by smtp.gmail.com with ESMTPSA id ip20-20020a05600ca69400b003dd19baf45asm10543114wmb.40.2023.02.06.06.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 06:07:16 -0800 (PST)
Date: Mon, 6 Feb 2023 15:07:13 +0100
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: bchihi@baylibre.com, angelogioacchino.delregno@collabora.com,
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com,
	matthias.bgg@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, rdunlap@infradead.org,
	ye.xingchen@zte.com.cn, p.zabel@pengutronix.de,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	khilman@baylibre.com, james.lo@mediatek.com,
	rex-bc.chen@mediatek.com
Subject: Re: [PATCH v12] thermal: drivers: mediatek: Add the Low Voltage
 Thermal Sensor driver
Message-ID: <20230206140713.GB15176@linaro.org>
References: <20230124131717.128660-5-bchihi@baylibre.com>
 <20230131153816.21709-1-bchihi@baylibre.com>
 <ab1e4822-d5f4-79f6-ea38-47e2342ebe49@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab1e4822-d5f4-79f6-ea38-47e2342ebe49@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_060720_702040_03C8B1AE 
X-CRM114-Status: GOOD (  15.57  )
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

On Wed, Feb 01, 2023 at 08:55:07AM +0100, Krzysztof Kozlowski wrote:
> On 31/01/2023 16:38, bchihi@baylibre.com wrote:
> > From: Balsam CHIHI <bchihi@baylibre.com>
> > 
> > The Low Voltage Thermal Sensor (LVTS) is a multiple sensors, multi
> > controllers contained in a thermal domain.
> > 
> > A thermal domains can be the MCU or the AP.
> > 
> > Each thermal domains contain up to seven controllers, each thermal
> > controller handle up to four thermal sensors.
> > 
> > The LVTS has two Finite State Machines (FSM), one to handle the
> > functionin temperatures range like hot or cold temperature and another
> > one to handle monitoring trip point. The FSM notifies via interrupts
> > when a trip point is crossed.
> > 
> 
> (...)
> 
> > +
> > +struct lvts_domain {
> > +	struct lvts_ctrl *lvts_ctrl;
> > +	struct reset_control *reset;
> > +	struct clk *clk;
> > +	int num_lvts_ctrl;
> > +	void __iomem *base;
> > +	size_t calib_len;
> > +	u8 *calib;
> > +};
> > +
> > +#ifdef CONFIG_MTK_LVTS_THERMAL_DEBUGFS
> > +
> > +static struct dentry *root;
> 
> How do you handle two instances of driver?

For now, we can put the entry in /sys/kernel/debug/<dev_name>

I'm preparing a debugfs series for the thermal framework and that will provide
an entry to hook in for the sensors debugfs if available

