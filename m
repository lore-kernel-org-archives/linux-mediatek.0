Return-Path: <SRS0=z/aX=IX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93241C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 13:22:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0E9E61A1E
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Mar 2021 13:22:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0E9E61A1E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=163.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bEz8+qgO78O8tpLrz7HzsJcmNfKscvG9ZjfW28iXii4=; b=Rh2DiJxVbTSn9pmIevyvD3uHM
	5J+qrVYscDDP94l7z8z075+jMIuqWAh27PYmVuLd6LRet4NTrcrdtLyTbBj8AYAufDUX6AyjvhQgA
	AJXsXSTw5K7nA2gDYuZH1H7kgvE8OJtVl4tFXzv2iurX4ehYqXA3EOA+/LRPQJ+j+k78nYg0ZSqsq
	2+wSjCEy9SCWQjSzGIx6TS2/OLjJJIydRHurIsAm2ge4BbTEi77Zc/C6WUQhWy9Sx4LGdi7beK3zU
	m+tBHuF7HahrU6lJXOK0cmgxvdxYqDBy5hiTJsUC5ZYs8am14vplSb9p1u90To9knZhR2a4VmRqzy
	EJkrrVgew==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPPwX-001WHx-J9; Thu, 25 Mar 2021 13:22:33 +0000
Received: from m12-15.163.com ([220.181.12.15])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPPwM-001WGu-RF; Thu, 25 Mar 2021 13:22:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version; bh=JRD1+
 IbMgofiTsnnszT7a1aFxuD+Rf4DtFRzrZnMNik=; b=fg4iER1k4piyUUO9dUwn4
 Ncsl16Gy4EuD5Wzb8XucNFBN7aBIi6qlPmAbQgND8EMxnqj2/7U4abJ+Dwl61/7f
 wIbVSAxavP5csnSPsGW8CarO+iIqT6gVGqeB3cZuspu9cEF0tz8oG0A09JDIRl2Q
 Oyj2Ud+b/01tBod3NPznqM=
Received: from localhost (unknown [218.94.48.178])
 by smtp11 (Coremail) with SMTP id D8CowAAHxlqcilxgDDJIGQ--.59166S2;
 Thu, 25 Mar 2021 21:05:39 +0800 (CST)
Date: Thu, 25 Mar 2021 21:05:43 +0800
From: Jian Dong <dj0227@163.com>
To: Felipe Balbi <balbi@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 matthias.bgg@gmail.com, agross@kernel.org, bjorn.andersson@linaro.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 huyue2@yulong.com, Jian Dong <dongjian@yulong.com>
Subject: Re: [PATCH] regulator: Use IRQF_ONESHOT
Message-ID: <20210325210543.000001d4@163.com>
In-Reply-To: <87v99fju29.fsf@kernel.org>
References: <1616501538-120724-1-git-send-email-dj0227@163.com>
 <9428d264-aafa-793f-8c6c-86c55213f5f9@canonical.com>
 <87v99fju29.fsf@kernel.org>
Organization: yulong
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
X-CM-TRANSID: D8CowAAHxlqcilxgDDJIGQ--.59166S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxCFW8XF1xZr4fCrWDGF1xXwb_yoW5KrWkpF
 4UZFnrCFW0yFW8Z3y7C34Iy3WYq3W0k3s7ArW8Aw4fXF1YvFn7tF1DArW5CF18Xr93Jw4a
 yrWq9ayxGFWrZFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07bU_M-UUUUU=
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: dgmqjjqx6rljoofrz/xtbB0gNg3VUMa+drhAAAsW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_132223_677023_58E05A3A 
X-CRM114-Status: GOOD (  22.23  )
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

On Thu, 25 Mar 2021 14:29:02 +0200
Felipe Balbi <balbi@kernel.org> wrote:

> Hi,
> 
> Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> writes:
> > On 23/03/2021 13:12, Jian Dong wrote:  
> >> From: Jian Dong <dongjian@yulong.com>
> >> 
> >> Fixes coccicheck error:
> >> 
> >> drivers/regulator/mt6360-regulator.c:388:8-33: ERROR:
> >> drivers/regulator/pca9450-regulator.c:781:7-32: ERROR:
> >> drivers/regulator/slg51000-regulator.c:480:8-33: ERROR:
> >> drivers/regulator/qcom-labibb-regulator.c:364:8-33: ERROR:
> >> Threaded IRQ with no primary handler requested without IRQF_ONESHOT
> >> 
> >> Signed-off-by: Jian Dong <dongjian@yulong.com>
> >> ---
> >>  drivers/regulator/mt6360-regulator.c      | 4 ++--
> >>  drivers/regulator/pca9450-regulator.c     | 2 +-
> >>  drivers/regulator/qcom-labibb-regulator.c | 3 ++-
> >>  drivers/regulator/slg51000-regulator.c    | 4 ++--
> >>  4 files changed, 7 insertions(+), 6 deletions(-)
> >> 
> >> diff --git a/drivers/regulator/mt6360-regulator.c
> >> b/drivers/regulator/mt6360-regulator.c index 15308ee..947350d
> >> 100644 --- a/drivers/regulator/mt6360-regulator.c
> >> +++ b/drivers/regulator/mt6360-regulator.c
> >> @@ -385,8 +385,8 @@ static int
> >> mt6360_regulator_irq_register(struct platform_device *pdev, return
> >> irq; }
> >>  
> >> -		ret = devm_request_threaded_irq(&pdev->dev, irq,
> >> NULL, irq_desc->handler, 0,
> >> -						irq_desc->name,
> >> rdev);
> >> +		ret = devm_request_threaded_irq(&pdev->dev, irq,
> >> NULL, irq_desc->handler,
> >> +					IRQF_ONESHOT,
> >> irq_desc->name, rdev);  
> >
> > This does not look like trivial rename/replace fix. This should be
> > tested but it looks that you just did what coccinelle asked for,
> > without testing.  
> 
> Right, but it must be done. If things work today, they work out of
> sheer luck. Also, which evidence is there that $subject wasn't tested?
> 
it just use coccinelle to check again, the warning didn't rise after
modify

> >> diff --git a/drivers/regulator/pca9450-regulator.c
> >> b/drivers/regulator/pca9450-regulator.c index 2f7ee21..d4bc1c3
> >> 100644 --- a/drivers/regulator/pca9450-regulator.c
> >> +++ b/drivers/regulator/pca9450-regulator.c
> >> @@ -780,7 +780,7 @@ static int pca9450_i2c_probe(struct i2c_client
> >> *i2c, 
> >>  	ret = devm_request_threaded_irq(pca9450->dev,
> >> pca9450->irq, NULL, pca9450_irq_handler,
> >> -					(IRQF_TRIGGER_FALLING |
> >> IRQF_ONESHOT),
> >> +					IRQF_TRIGGER_FALLING |
> >> IRQF_ONESHOT,  
> >
> > How this is related to the missing IRQF_ONESHOT?  
> 
> agreed.
> 
> >> diff --git a/drivers/regulator/slg51000-regulator.c
> >> b/drivers/regulator/slg51000-regulator.c index 75a941f..3f310ab
> >> 100644 --- a/drivers/regulator/slg51000-regulator.c
> >> +++ b/drivers/regulator/slg51000-regulator.c
> >> @@ -479,8 +479,8 @@ static int slg51000_i2c_probe(struct
> >> i2c_client *client) if (chip->chip_irq) {
> >>  		ret = devm_request_threaded_irq(dev,
> >> chip->chip_irq, NULL, slg51000_irq_handler,
> >> -
> >> (IRQF_TRIGGER_HIGH |
> >> -						IRQF_ONESHOT),
> >> +						IRQF_TRIGGER_HIGH
> >> |
> >> +						IRQF_ONESHOT,
> >>  						"slg51000-irq",
> >> chip);  
> >
> > How this is related to the missing IRQF_ONESHOT?  
> 
> agreed.
> 
I thnik it maybe the result of the coccinelle rule. it need to check 
value explicit. another wanring like this:  define irq_flag
= IRQF_ONESHOT, then reference irq_flag in fuction, it also will trigger
coccinelle warning. it seems not the code error but coccicheck bug.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
