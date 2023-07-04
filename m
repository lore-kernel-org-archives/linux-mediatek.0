Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71D4EB64DA
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 08:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83PIhF04XPHKfSUHRF3a+cwo1wWjE9iJPe9qg0zhai8=; b=C1AV+1PREI9whNRjkMbmBSlz61
	4MY3FkZcyVFC8IFSqRBvUgeL+1XvnkuTHkWCFYHuJUVxmXWrIAM3iY9kl6F7dXAZz3ynk7JYzkHYU
	SvQsAmUCCwKuLxpFtoi2yPtBqb8it1KUUcr/NfiZSes9OyxtGEp0D2CISym5QZ8FYdMijVsmSgiBD
	fjRn5YPGvru+dhN3h16U1y6q/3mKIYzGIpNzMwj7uUcvZVUSe69j+wFJNvKrR946t0wnyIYMpWEtU
	Th3pnQAvFRbb10jhuKAvclLC0whcR/mM9tfs1rfMf7dzF67hmNB7X1qvFVljW+ZGRMXr02Xopag49
	k6tzxzWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGbiX-00CcMr-0V;
	Tue, 04 Jul 2023 08:49:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGbiT-00CcLy-37;
	Tue, 04 Jul 2023 08:48:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 82E196119B;
	Tue,  4 Jul 2023 08:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BE33C433CA;
	Tue,  4 Jul 2023 08:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688460537;
	bh=zvTuVs2YUJIWjd+2H/rF7bPq86bQGD26x3z2S4w1GT0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SQCBl16RCbD2rUr46QYzQjQiy8fUncB9hDirEgp806O7bO2QpuP9QO4+HvOsToiRa
	 Udn3dCdv9ALWZnxrrTNoLN5+AW5egOWw7nN/w0NmOMlDIcN3sGRHD9VIogz2JfM+Q9
	 JsgukE7Tuyre8dRtUdxp181ekGeA9pRPvwLicR0IKX7veqZ0FDLBrtQjq6UGK3PCt7
	 729MviFxP037WA+dJmC6Boo9rhYMEbaMxVB0jiaQZULdvHeN/OYAZ3VP0fJjYZWHmN
	 k6Lc9lbgSelCZsJjcT1C7WBQ9DOPV4IX1HDul6RC36Gt6jqgifNUamQKspejCK8I2B
	 mZOuiPc/InTmA==
Message-ID: <11052797-b006-11bb-e4eb-987ddd568b24@kernel.org>
Date: Tue, 4 Jul 2023 10:48:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/5] genirq/devres: Add
 devm_request_threaded_irq_emsg()
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Yangtao Li <frank.li@vivo.com>, miquel.raynal@bootlin.com,
 rafael@kernel.org, daniel.lezcano@linaro.org, amitk@kernel.org,
 rui.zhang@intel.com, mmayer@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, florian.fainelli@broadcom.com,
 tglx@linutronix.de, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, bchihi@baylibre.com,
 wenst@chromium.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230703090455.62101-1-frank.li@vivo.com>
 <20230703090455.62101-2-frank.li@vivo.com>
 <f4873823-fd7e-c6dd-fbc0-eac4a9be52b1@kernel.org>
 <20230703174347.4m6hcmify4jwsozv@pengutronix.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230703174347.4m6hcmify4jwsozv@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_014858_044648_CE2197CB 
X-CRM114-Status: GOOD (  15.80  )
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

On 03/07/2023 19:43, Uwe Kleine-König wrote:
> Hello Krzysztof,
> 
> On Mon, Jul 03, 2023 at 02:31:59PM +0200, Krzysztof Kozlowski wrote:
>> On 03/07/2023 11:04, Yangtao Li wrote:
>>> There are more than 700 calls to the devm_request_threaded_irq method.
>>> Most drivers only request one interrupt resource, and these error
>>> messages are basically the same. If error messages are printed
>>> everywhere, more than 1000 lines of code can be saved by removing the
>>> msg in the driver.
>>
>>
>> ...
>>
>>> +int devm_request_threaded_irq_emsg(struct device *dev, unsigned int irq,
>>> +				   irq_handler_t handler, irq_handler_t thread_fn,
>>> +				   unsigned long irqflags, const char *devname,
>>> +				   void *dev_id, const char *emsg)
>>> +{
>>> +	int rc;
>>> +
>>> +	rc = devm_request_threaded_irq(dev, irq, handler, NULL, irqflags,
>>> +				       devname, dev_id);
>>> +	if (rc && rc != -EPROBE_DEFER) {
>>> +		dev_err(dev, "Failed to request %sinterrupt %u %s %s: %pe\n",
>>> +			thread_fn ? "threaded " : "", irq, devname ? : dev_name(dev),
>>> +			emsg ? : "", ERR_PTR(rc));
>>
>> It is open-coding dev_err_probe(). Just use dev_err_probe instead.
> 
> dev_err_probe is supposed to be only called in probe functions, while
> devm_request_threaded_irq might be called in other contexts (e.g. when a
> device is opened). That's why I asked to not use dev_err_probe() in v2

True, but then all the callers of this function will forget to set
deferred probe reason.

Best regards,
Krzysztof


