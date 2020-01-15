Return-Path: <SRS0=47E0=3E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5977C33CB1
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 13:47:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5C8B222C3
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jan 2020 13:47:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="izb5WWsG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BpKz3ov4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5C8B222C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vuJUIqNCltXly1Njz6hjHfMOd+/VKgf1pRT9ec+yCdo=; b=izb5WWsG58W6ZvYVkrTNs/iIX
	F6m03Ax7MWr1ApJ5h29r2pMdcmnJrt4ojF396Jtjq7A3Hkadmyyaw4GoD9J9d5VRrSPV8a0umFbXv
	RD84MoDkgbHCnu8k6vKUk1Yb+2YfdlGNBpW+Uv6+o1u7IvobTPyFD77FBCQNNJLIcb8nFBNcTeBMa
	sMyBGwYTVXA1F/fy8b7r6Z74C5h9mNPH1jXRvMX6y6AQfV27+XPCM5DPf4qNt1LURxT4o02TVcrkn
	bbZbA59okXFGNc6gSeg8sDL/5mZbgkx8BGi5fgNiDWX3nKl+10DQhu6JDe+q5vANJ9gJ2Hm2kJK6i
	PraRUYbKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irj0x-0005e0-KX; Wed, 15 Jan 2020 13:47:19 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irj0t-0005dB-3B; Wed, 15 Jan 2020 13:47:19 +0000
Received: by mail-pj1-x1041.google.com with SMTP id m13so7738833pjb.2;
 Wed, 15 Jan 2020 05:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qCxb07O3jS5MzDJ5KpEFySLAZYUkoV5oCpYOYUF2fuA=;
 b=BpKz3ov4HpQHJOoXWclUr67slGzmMYVwSSgrOa57jr9BUR4E3B7OeMxkE75uSze3hR
 Z0278JymCg/BE1nrzEdute+6kSsczp22VUmgzc5/YBSP0bv39/DQHrhCRwE02D5xlJJ3
 IRJNCwrNr/a10bU+POKq0gQ8qeZ+BSYTCeGe2r9tgqMyHcm3/eG99rr3tXopHn5nFcsy
 gEpMcfMW4aEOCUSCOcII2jaU3hCnOXDMK+4erGjJws8+FBxnxDLHHtY6zGi2y9kgHuCe
 EBWpAi59dPYnY9XDodeluDZxo+BrvBhIkYsVrdOiBdgb9ejbt9tv5KxNdpjiLOL2P43R
 iT4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qCxb07O3jS5MzDJ5KpEFySLAZYUkoV5oCpYOYUF2fuA=;
 b=BREVJFFyEtDrKTlfnLD6IAzpMwCh1R4qc/2mxLLpk9iOLnR/AMJ0oqsB5YQW8VICqa
 XA6iIjQEX6FXUOjrTf8t3VqPddRpNS2tARMLBLvre0phkUb0Hm7Qz8FHCymrHcv9bmL9
 qB0ijIR21OdmRflCuoIjUixU29Q39RXoGTSLlSW6SyKXKgHVga1PwuUJkJaRhYXMcLEs
 xS39x2Rb0IBtWe64zGe51T2OIUtUu1JvAdNM7S4FryFfVW/TMgxUYQLKIB4W7AmhoC+P
 Qm/jcsXL1IPha4r11JSyaiE5Gy/rq0kxp2xP4kgi8WkM/PwKtJe0wpwd2LS6QCu5/4T6
 /DvQ==
X-Gm-Message-State: APjAAAXboBTFSC3Ifk4cOkP/hEzwlhPqrvloaOFTPmyNUmSlAMnAHtQd
 GoKGho3QtU1Soyje6MwoU6Q=
X-Google-Smtp-Source: APXvYqwv7ezrYAKzSWltLFywSXn+1dKl9mNzVXU+ZOl+9ohEy1e+HVp1oNtxEnD4ZXIF0ibvfgE2KA==
X-Received: by 2002:a17:902:a515:: with SMTP id
 s21mr19390176plq.177.1579096033818; 
 Wed, 15 Jan 2020 05:47:13 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 d26sm20414077pgv.66.2020.01.15.05.47.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jan 2020 05:47:13 -0800 (PST)
Subject: Re: [PATCH v12 3/4] watchdog: mtk_wdt: mt8183: Add reset controller
To: Yong Liang <yong.liang@mediatek.com>, wim@linux-watchdog.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, chang-an.chen@mediatek.com,
 freddy.hsin@mediatek.com, jiaxin.yu@mediatek.com
References: <20200115085828.27791-1-yong.liang@mediatek.com>
 <20200115085828.27791-4-yong.liang@mediatek.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <18c3d0ca-a5d9-ede4-d13e-279b71272d44@roeck-us.net>
Date: Wed, 15 Jan 2020 05:47:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200115085828.27791-4-yong.liang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200115_054715_164198_2BA00CFA 
X-CRM114-Status: GOOD (  19.86  )
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
Cc: sboyd@kernel.org, yingjoe.chen@mediatek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 1/15/20 12:58 AM, Yong Liang wrote:
> From: "yong.liang" <yong.liang@mediatek.com>
> 
> Add reset controller API in watchdog driver.
> Besides watchdog, MTK toprgu module alsa provide sub-system (eg, audio,
> camera, codec and connectivity) software reset functionality.
> 
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/mtk_wdt.c | 99 +++++++++++++++++++++++++++++++++++++-
>   1 file changed, 98 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> index 9c3d0033260d..e88aacb0404d 100644
> --- a/drivers/watchdog/mtk_wdt.c
> +++ b/drivers/watchdog/mtk_wdt.c
> @@ -9,6 +9,8 @@
>    * Based on sunxi_wdt.c
>    */
>   
> +#include <dt-bindings/reset-controller/mt8183-resets.h>
> +#include <linux/delay.h>
>   #include <linux/err.h>
>   #include <linux/init.h>
>   #include <linux/io.h>
> @@ -16,10 +18,11 @@
>   #include <linux/module.h>
>   #include <linux/moduleparam.h>
>   #include <linux/of.h>
> +#include <linux/of_device.h>
>   #include <linux/platform_device.h>
> +#include <linux/reset-controller.h>
>   #include <linux/types.h>
>   #include <linux/watchdog.h>
> -#include <linux/delay.h>
>   
>   #define WDT_MAX_TIMEOUT		31
>   #define WDT_MIN_TIMEOUT		1
> @@ -44,6 +47,9 @@
>   #define WDT_SWRST		0x14
>   #define WDT_SWRST_KEY		0x1209
>   
> +#define WDT_SWSYSRST		0x18U
> +#define WDT_SWSYS_RST_KEY	0x88000000
> +
>   #define DRV_NAME		"mtk-wdt"
>   #define DRV_VERSION		"1.0"
>   
> @@ -53,8 +59,90 @@ static unsigned int timeout;
>   struct mtk_wdt_dev {
>   	struct watchdog_device wdt_dev;
>   	void __iomem *wdt_base;
> +	spinlock_t lock; /* protects WDT_SWSYSRST reg */
> +	struct reset_controller_dev rcdev;
> +};
> +
> +struct mtk_wdt_data {
> +	int toprgu_sw_rst_num;
>   };
>   
> +static const struct mtk_wdt_data mt8183_data = {
> +	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
> +};
> +
> +static int toprgu_reset_update(struct reset_controller_dev *rcdev,
> +			       unsigned long id, bool assert)
> +{
> +	unsigned int tmp;
> +	unsigned long flags;
> +	struct mtk_wdt_dev *data =
> +		 container_of(rcdev, struct mtk_wdt_dev, rcdev);
> +
> +	spin_lock_irqsave(&data->lock, flags);
> +
> +	tmp = readl(data->wdt_base + WDT_SWSYSRST);
> +	if (assert)
> +		tmp |= BIT(id);
> +	else
> +		tmp &= ~BIT(id);
> +	tmp |= WDT_SWSYS_RST_KEY;
> +	writel(tmp, data->wdt_base + WDT_SWSYSRST);
> +
> +	spin_unlock_irqrestore(&data->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int toprgu_reset_assert(struct reset_controller_dev *rcdev,
> +			       unsigned long id)
> +{
> +	return toprgu_reset_update(rcdev, id, true);
> +}
> +
> +static int toprgu_reset_deassert(struct reset_controller_dev *rcdev,
> +				 unsigned long id)
> +{
> +	return toprgu_reset_update(rcdev, id, false);
> +}
> +
> +static int toprgu_reset(struct reset_controller_dev *rcdev,
> +			unsigned long id)
> +{
> +	int ret;
> +
> +	ret = toprgu_reset_assert(rcdev, id);
> +	if (ret)
> +		return ret;
> +
> +	return toprgu_reset_deassert(rcdev, id);
> +}
> +
> +static const struct reset_control_ops toprgu_reset_ops = {
> +	.assert = toprgu_reset_assert,
> +	.deassert = toprgu_reset_deassert,
> +	.reset = toprgu_reset,
> +};
> +
> +static int toprgu_register_reset_controller(struct platform_device *pdev,
> +					    int rst_num)
> +{
> +	int ret;
> +	struct mtk_wdt_dev *mtk_wdt = platform_get_drvdata(pdev);
> +
> +	spin_lock_init(&mtk_wdt->lock);
> +
> +	mtk_wdt->rcdev.owner = THIS_MODULE;
> +	mtk_wdt->rcdev.nr_resets = rst_num;
> +	mtk_wdt->rcdev.ops = &toprgu_reset_ops;
> +	mtk_wdt->rcdev.of_node = pdev->dev.of_node;
> +	ret = devm_reset_controller_register(&pdev->dev, &mtk_wdt->rcdev);
> +	if (ret != 0)
> +		dev_err(&pdev->dev,
> +			"couldn't register wdt reset controller: %d\n", ret);
> +	return ret;
> +}
> +
>   static int mtk_wdt_restart(struct watchdog_device *wdt_dev,
>   			   unsigned long action, void *data)
>   {
> @@ -155,6 +243,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct mtk_wdt_dev *mtk_wdt;
> +	const struct mtk_wdt_data *wdt_data;
>   	int err;
>   
>   	mtk_wdt = devm_kzalloc(dev, sizeof(*mtk_wdt), GFP_KERNEL);
> @@ -190,6 +279,13 @@ static int mtk_wdt_probe(struct platform_device *pdev)
>   	dev_info(dev, "Watchdog enabled (timeout=%d sec, nowayout=%d)\n",
>   		 mtk_wdt->wdt_dev.timeout, nowayout);
>   
> +	wdt_data = of_device_get_match_data(dev);
> +	if (wdt_data) {
> +		err = toprgu_register_reset_controller(pdev,
> +						       wdt_data->toprgu_sw_rst_num);
> +		if (err)
> +			return err;
> +	}
>   	return 0;
>   }
>   
> @@ -219,6 +315,7 @@ static int mtk_wdt_resume(struct device *dev)
>   
>   static const struct of_device_id mtk_wdt_dt_ids[] = {
>   	{ .compatible = "mediatek,mt6589-wdt" },
> +	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
