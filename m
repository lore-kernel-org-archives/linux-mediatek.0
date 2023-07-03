Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C78EB64DC
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jul 2023 13:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OPUZYhyodxcCmLUl0WDrUi+poUxf6QoAmYTlmwL3wxk=; b=BzlAqoWIvLHTIsKec5KKqcGmVQ
	LEkeYDgv45bvnMZNQM5QrWTMfbTd9Fb0jMAmJFdNW/gS68JyNnzn910K4b7BW4siwU0mZsiGu2m9y
	6L+5jPpwXn4CuDSl7Y5a1wzC/j/NsxAJJV2Y8um9r1wX2JocBnzA+qfZ27NN6QnY85uUhVlOZA634
	dbwxTMRU2ijvnjRHlwq99m0a8HW8ZvMuzCxsiWGEl/vVF0+qJ1S4hyR9MKiGJsKov/1hdSo++133U
	cAk1NfuRLRLb4ZgQHvsenWJ7VThzozm2c8QgrKDic3RTSYAKro+WQoDKXQbtuhs21sTFche7ksfTF
	+/Rw9PaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJkD-00Aehg-25;
	Mon, 03 Jul 2023 13:37:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGJkA-00Aegc-1C;
	Mon, 03 Jul 2023 13:37:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 90E6C60F3A;
	Mon,  3 Jul 2023 13:37:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1778C433C8;
	Mon,  3 Jul 2023 13:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688391449;
	bh=mdjfMlB9hWcQuuvCh4C/RYuY26QuKk1rnzzxz5iy9LE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HWly50qCniJRfYL/8TVUTx0uAx63NuOfafqUc1CDwazaJHgukKtR4vIsogPXIdRt4
	 MZuxFHzroI5/HtF6nbqBB7WZcaqYKjDKioVxgRly8qj8QOWuZM+6f1CuYt0PG5ver9
	 Gg1gWu9hPpYIJ4K1ddZ6+62/PiomO8RdxN0Uc/HQlg0sJkVZVnhnIZe/kVhSXYwwlD
	 xR1IfGq01iU1KwqfEb46gCbvw/pRB/AnlUk723++yPV+0QDbxQ2fbR4s3PvwxNzCan
	 B7J0qrDhqJppnh5DIbq7UBILkuJcS4VKviT0LCGAvIyr9bH2PUt2cinafyLwLn0vNV
	 dldZyfRbt6QoQ==
Message-ID: <cce616da-fb1b-ef0b-69de-11a14d4b3e7b@kernel.org>
Date: Mon, 3 Jul 2023 15:37:16 +0200
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
 <f4873823-fd7e-c6dd-fbc0-eac4a9be52b1@kernel.org>
 <930003c4-c90d-0008-a6cf-9298240e7d93@vivo.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <930003c4-c90d-0008-a6cf-9298240e7d93@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_063730_516504_D29D4598 
X-CRM114-Status: GOOD (  14.89  )
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

On 03/07/2023 15:24, Yangtao Li wrote:
> 
> On 2023/7/3 20:31, Krzysztof Kozlowski wrote:
>> [你通常不会收到来自 krzk@kernel.org 的电子邮件。请访问 https://aka.ms/LearnAboutSenderIdentification，以了解这一点为什么很重要]
>>
>> On 03/07/2023 11:04, Yangtao Li wrote:
>>> There are more than 700 calls to the devm_request_threaded_irq method.
>>> Most drivers only request one interrupt resource, and these error
>>> messages are basically the same. If error messages are printed
>>> everywhere, more than 1000 lines of code can be saved by removing the
>>> msg in the driver.
>>
>> ...
>>
>>> +int devm_request_threaded_irq_emsg(struct device *dev, unsigned int irq,
>>> +                                irq_handler_t handler, irq_handler_t thread_fn,
>>> +                                unsigned long irqflags, const char *devname,
>>> +                                void *dev_id, const char *emsg)
>>> +{
>>> +     int rc;
>>> +
>>> +     rc = devm_request_threaded_irq(dev, irq, handler, NULL, irqflags,
>>> +                                    devname, dev_id);
>>> +     if (rc && rc != -EPROBE_DEFER) {
>>> +             dev_err(dev, "Failed to request %sinterrupt %u %s %s: %pe\n",
>>> +                     thread_fn ? "threaded " : "", irq, devname ? : dev_name(dev),
>>> +                     emsg ? : "", ERR_PTR(rc));
>> It is open-coding dev_err_probe(). Just use dev_err_probe instead.
> 
> 
> How about the following? If possible, I would like to start modifying 
> more drivers in the next version.
> 
> 
> int devm_request_threaded_irq_emsg(struct device *dev, unsigned int irq,
>                                     irq_handler_t handler, irq_handler_t 
> thread_fn,
>                                     unsigned long irqflags, const char 
> *devname,
>                                     void *dev_id, const char *emsg)
> {
>          int rc;
> 
>          rc = devm_request_threaded_irq(dev, irq, handler, NULL, irqflags,
>                                         devname, dev_id);
>          if (rc) {
>                  dev_err_probe(dev, rc, "Failed to request %sinterrupt 
> %u %s %s\n",
>                                thread_fn ? "threaded " : "", irq, 
> devname ? : dev_name(dev),
>                                emsg ? : "");

That's not the syntax already used - see existing code with `git grep`.
Instead - return dev_err_probe().


Best regards,
Krzysztof


