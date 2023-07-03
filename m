Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39183EB64DC
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jul 2023 12:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=odHihNpFSgixfRGViprTm9KlbFZhrekN7PTU36mYY3g=; b=rl6E+iIhFTWDv2+81Nt/x0dOqr
	RNL6AGoBsBx9WFyeAvtYinzGb0sPxek7kRQ+LpjQ+wp6uhWyTialp89ynnxka2r96kRBexZr/MVtn
	OQuqXzozmsZ52wdskqD3Giq5Hxsh1UfTEkRaXdMYxAyNsfu/MxQGyu8PqI8lBWpbpWATlHfFWhLiO
	HVpShes2S7Ig+hi/Q9i359re/Kh9muF5tX2dT044fzU/lU9iXJtVZsgssLF0wjw7tZv61WSbekxX4
	FAtiL6qhTMo8h2tYb7w0Tme63NXGJSPJm+6n1Efb5N2CCfX1o1zhzqT3Fcz4b67cfKTWyY9ysD0Z4
	mXKB+xlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGIj1-00AUfu-0C;
	Mon, 03 Jul 2023 12:32:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGIix-00AUei-0T;
	Mon, 03 Jul 2023 12:32:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 13BA260F06;
	Mon,  3 Jul 2023 12:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B2C0C433C8;
	Mon,  3 Jul 2023 12:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688387529;
	bh=2/husCvkcEMDjaWaMzRO/j2CEaYbnp5CmDWbmX1r1QQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dkIdbcljYerHxxzOkD8YGtGbav2domP/skg5GFO/rT9F5JYTNyeWqmCVQAGu/IG8B
	 DJlFy9VDya8IIdUg7hT50LkzzWjxHw8wL9VVOZyA21mCXQjk0S+gwheicj/WnfySeR
	 NhRqnKAeQjFp9wRddwfHxvucHvRFsy+wvWxTn7rObIhnSiowZyzc750cgYjyCKWSjF
	 5vMiuVl1bWSJB15mx4MbLjwRVr0/ewW5KJFKmh9eDfZjaeDGix44iPYZHwisRwLH92
	 TObYw8fL2C1tt8iHS59/T7JMHRJXnavVYm5L3xpQHNarZ9sPKKrF1YNUOOuzjZbJB6
	 pcruE309cNNTA==
Message-ID: <f4873823-fd7e-c6dd-fbc0-eac4a9be52b1@kernel.org>
Date: Mon, 3 Jul 2023 14:31:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/5] genirq/devres: Add
 devm_request_threaded_irq_emsg()
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, miquel.raynal@bootlin.com,
 rafael@kernel.org, daniel.lezcano@linaro.org, amitk@kernel.org,
 rui.zhang@intel.com, mmayer@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, florian.fainelli@broadcom.com,
 tglx@linutronix.de, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, bchihi@baylibre.com,
 wenst@chromium.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230703090455.62101-1-frank.li@vivo.com>
 <20230703090455.62101-2-frank.li@vivo.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230703090455.62101-2-frank.li@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_053211_251311_D38ABF3A 
X-CRM114-Status: GOOD (  11.91  )
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

On 03/07/2023 11:04, Yangtao Li wrote:
> There are more than 700 calls to the devm_request_threaded_irq method.
> Most drivers only request one interrupt resource, and these error
> messages are basically the same. If error messages are printed
> everywhere, more than 1000 lines of code can be saved by removing the
> msg in the driver.


...

> +int devm_request_threaded_irq_emsg(struct device *dev, unsigned int irq,
> +				   irq_handler_t handler, irq_handler_t thread_fn,
> +				   unsigned long irqflags, const char *devname,
> +				   void *dev_id, const char *emsg)
> +{
> +	int rc;
> +
> +	rc = devm_request_threaded_irq(dev, irq, handler, NULL, irqflags,
> +				       devname, dev_id);
> +	if (rc && rc != -EPROBE_DEFER) {
> +		dev_err(dev, "Failed to request %sinterrupt %u %s %s: %pe\n",
> +			thread_fn ? "threaded " : "", irq, devname ? : dev_name(dev),
> +			emsg ? : "", ERR_PTR(rc));

It is open-coding dev_err_probe(). Just use dev_err_probe instead.

Best regards,
Krzysztof


