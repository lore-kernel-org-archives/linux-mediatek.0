Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F791C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 20:56:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B365D221EB
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 20:56:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qnTLIv4j";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDN5aR1m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B365D221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=BRrqyfQ6t9v+sSuMezePtpTCD+AianfAldFBHFjCJI4=; b=qnTLIv4jmmeOeCEYHSo0FdHYp
	oE7OvX9lIYkV97rTeJN39QG5AjFD+lTrrGqAnsbBWb9AyzRv4FONXncziDwDWq9fIu3GiPtRFpOxi
	1eAycjL+K8z5gWDxcAjBVdOXLXU0XWmH3cgvs6uL1VnVqfYGhEP6JNr4pAHYu6sxNZXVHl7AyLya1
	BpjogR7QMao+zWqz62SUsqCasxfeBcvZthKmvS0RUdJIAhPhuIwiFIC33k4FPQmxUeYdNidJGfits
	iIxn31+Uhruui49zdPc/Kgci4jsMY17rTYyl1s3qU8o+s4txB5+GYPPqib6DA2ZZtoj2PWlPwCxny
	CiwnhFqfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGq5k-0000iK-PX; Fri, 11 Sep 2020 20:56:20 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGq5g-0000gv-AU; Fri, 11 Sep 2020 20:56:17 +0000
Received: by mail-ed1-x541.google.com with SMTP id n22so11519593edt.4;
 Fri, 11 Sep 2020 13:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EN1aXepR2pAjS7TkWhKDjvai8AQzIN3Al8VaNg0aZds=;
 b=FDN5aR1mZNsEYGXCC1BPMBu0sm0hScQh2NjkB1fe3oZh5VizOrUpX/nnaUi4GgW5va
 L+LDwSSw9Qw/DpnuvmcdBJi6SbQwk3quhgcGiQqSBUIyeCSl7RHdwo49O18KQTsMjIop
 qDAcEgE7JoYcKXoh8woTdO8sumbjYbkyObegcVrcj3VouezYf+YgwmhTIhSEqit2Ou4Y
 koNwrjHNpGH0dnpObyb9djReB7CKAn7StrNDCyV3qt2Gn/6kEAJMKdMGlYW2+sSQhQy0
 qpX5oREBRaYK1lSFTy9AafMj8EdNSntKJ0pm4znDC7YvDZKVW5LnuiDKLfxOhAp38OBJ
 xAog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EN1aXepR2pAjS7TkWhKDjvai8AQzIN3Al8VaNg0aZds=;
 b=MUIQGK5y3piWE5zsEt6TVfyJn6Ih/VcaKsYGXI93GUELcuVpFI11YRcoZDrnQK4YeE
 rqm2Qykeyz++Y8NPqtrb/s6FAb0WMAFJgCcwnAiCClRyuxGdVUIp2osxGKW4PXUSeX/e
 SJuTxGxjpbJjJZ/rmJ0fxm52RxL7bZ626FJeJP0d5IY6gMknImCBmhEMORYF4g4JKX55
 ZLBVLvEAYrpmPTs/Vih+sytyTAssKcfjtuElNJIGv6KUuBp2dqycxJwX1qzArlGlCt4h
 RABJAjPA0C83GAqQti6yWNZ4vbkuJObJglUOuXNDRs90NDbhL96MW0ZZfz8N+a0bs/2q
 a8/g==
X-Gm-Message-State: AOAM532aWgOTF+KiZ65v8yHaemQ6nz/HzwGHpCzJk/4XbxKnk2Fywynp
 bg169BqliHDny2/XnzxENB8=
X-Google-Smtp-Source: ABdhPJwKOgIOcTcY6QqbJuRaVpQD5wA5CYwL5XmcohJ38wSTiq2WLVPUbKFzW9xX6/uwSYLc+ep2Pw==
X-Received: by 2002:a50:8c24:: with SMTP id p33mr4421467edp.330.1599857773391; 
 Fri, 11 Sep 2020 13:56:13 -0700 (PDT)
Received: from ?IPv6:2a01:110f:b59:fd00:e953:3254:5e71:3177?
 ([2a01:110f:b59:fd00:e953:3254:5e71:3177])
 by smtp.gmail.com with ESMTPSA id i17sm2151979ejy.79.2020.09.11.13.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 13:56:12 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] leds: mt6360: Add LED driver for MT6360
To: Pavel Machek <pavel@ucw.cz>
References: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
 <1599474459-20853-2-git-send-email-gene.chen.richtek@gmail.com>
 <559a568e-3a2e-33c6-43aa-547a18f8e26b@gmail.com> <20200911070503.GA9818@amd>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <d2721bb7-6f0e-19af-41b9-0f3ae95cf4f9@gmail.com>
Date: Fri, 11 Sep 2020 22:56:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200911070503.GA9818@amd>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_165616_397723_8EA9B970 
X-CRM114-Status: GOOD (  19.45  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 cy_huang@richtek.com, linux-kernel@vger.kernel.org, gene_chen@richtek.com,
 benjamin.chao@mediatek.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, dmurphy@ti.com, matthias.bgg@gmail.com,
 Gene Chen <gene.chen.richtek@gmail.com>, Wilma.Wu@mediatek.com,
 linux-leds@vger.kernel.org, shufan_lee@richtek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Pavel,

On 9/11/20 9:05 AM, Pavel Machek wrote:
> Hi!
> 
>>> +{
>>> +	struct mt6360_led *led = container_of(lcdev, struct mt6360_led, flash.led_cdev);
>>> +	struct mt6360_priv *priv = led->priv;
>>> +	u32 enable_mask = MT6360_TORCHEN_MASK | MT6360_FLCSEN_MASK(led->led_no);
>>> +	u32 val = (level) ? MT6360_FLCSEN_MASK(led->led_no) : 0;
>>> +	u32 prev = priv->fled_torch_used, curr;
>>> +	int ret;
>>> +
>>> +	dev_dbg(lcdev->dev, "[%d] brightness %d\n", led->led_no, level);
>>> +	if (priv->fled_strobe_used) {
>>> +		dev_warn(lcdev->dev, "Please disable strobe first [%d]\n", priv->fled_strobe_used);
>>
>> Doesn't hardware handle that? IOW, what happens when you have enabled
>> both torch and flash? If flash just overrides torch mode, than you
>> should not prevent enabling torch in this case.
> 
> Yep, this is strange/confusing... and was reason why I asked for not
> supporting strobe from sysfs.

What you say now is even more confusing when we look at your ack
under this patch:

commit 7aea8389a77abf9fde254aca2434a605c7704f58
Author: Jacek Anaszewski <j.anaszewski@samsung.com>
Date:   Fri Jan 9 07:22:51 2015 -0800

     leds: Add LED Flash class extension to the LED subsystem

     Some LED devices support two operation modes - torch and flash.
     This patch provides support for flash LED devices in the LED subsystem
     by introducing new sysfs attributes and kernel internal interface.
     The attributes being introduced are: flash_brightness, flash_strobe,
     flash_timeout, max_flash_timeout, max_flash_brightness, flash_fault,
     flash_sync_strobe and available_sync_leds. All the flash related
     features are placed in a separate module.

     The modifications aim to be compatible with V4L2 framework requirements
     related to the flash devices management. The design assumes that V4L2
     sub-device can take of the LED class device control and communicate
     with it through the kernel internal interface. When V4L2 Flash 
sub-device
     file is opened, the LED class device sysfs interface is made
     unavailable.

     Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
     Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
     Cc: Richard Purdie <rpurdie@rpsys.net>
     Acked-by: Pavel Machek <pavel@ucw.cz>
     Signed-off-by: Bryan Wu <cooloney@gmail.com>


> Could I get you to remove code you are not commenting at when
> reviewing?
> 
>>> +MODULE_AUTHOR("Gene Chen <gene_chen@richtek.com>");
>>> +MODULE_DESCRIPTION("MT6360 Led Driver");
> 
> Led -> LED.
> 
> 									Pavel
> 

-- 
Best regards,
Jacek Anaszewski

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
