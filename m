Return-Path: <SRS0=PAw8=BP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7EEBC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 21:47:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4C812086A
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 21:47:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LLdIM1VE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kali.org header.i=@kali.org header.b="I5SvK1oz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4C812086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kali.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8PFwWqHIQQPGyZX+VefUqKRsWxLNsn4R47vxb+Xy7p4=; b=LLdIM1VEyogXAA+p2DmdZ+qua
	cfCK5YqeMUyfm8TaqRjI9Nc11qAWlFtqBmZBHGKxwNzjzt6FRyIsvgY6JBgjjbetV9wStcFeEqpIC
	w6Mqdje9QhbKC76TM5Mo+sf45E6XYiadLgfOYrom4mazBE4g3CqsMCRouAEoKmJ5yiQr668TcdBKS
	9oZruFEg8EuL1RotAlPr1efOPP4Uu5x9tdHOkSXenKGB0E0o7awQ3NHy7jUU/UyLZK2dgezxvPFDL
	3WWgIbTotZxviSEnMMwZ5Ru8xHKE9EFz2MdSdRo74dB85Lb58/qzYp9u+hR5uCXSGiMRXA+VTO6it
	n0AvLl38g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3RGD-0002Y5-Qa; Wed, 05 Aug 2020 21:47:45 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3RG8-0002Wn-S4
 for linux-mediatek@lists.infradead.org; Wed, 05 Aug 2020 21:47:42 +0000
Received: by mail-oi1-x241.google.com with SMTP id h3so17397265oie.11
 for <linux-mediatek@lists.infradead.org>; Wed, 05 Aug 2020 14:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=iS1HIzC2VQtRzbEvLhI4Xg8Nj2mavELVrx/H/VkP64k=;
 b=I5SvK1ozfyQMTOos6/OHD9zLqGGZTErZKvjtYOxfeUWvVKhkj3s8uesaPhZeQi1s7t
 R2B1ccRmYfRdEGnpD8aPB5KNFlt9ZkRA/RPIPt94h9kv9Uz8fOz6hQsLAP2oFMjwvayx
 SmtjMLrhVXxrX+Y+wCwl4YAavbjzBXMLXIELo7p/Fdy3g7Qzw1w6u7Yhr4FT2ro46TS2
 jqzfOxUOImlDLNcjQ+GaQMz7Hy0ufGg9E7qVYDH/TA6MYoaj1nlixYl2a5SpnsFZCtZC
 6bO4mXkwFrDryDduRDBXg4jyp138x9bhWGSG6nu4cC3O7esBdNHPBxzAg2dUhYQIk0D2
 5Xxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=iS1HIzC2VQtRzbEvLhI4Xg8Nj2mavELVrx/H/VkP64k=;
 b=ijtZF9bcritajRBkH+387LvslHt+WhtVeaIwXnWtxyV8MuL3ZBiZgZ6hjFvickZXo3
 zOsXDznnZwcUotvIqTgOQQWZ8ol9AKrHdj729QdDLfDX4Y+Kd0Vkc85npByYuhD9Q2pD
 UQRzoQvI/OdblNEpr9BeHz6EUl2DKTgKFd07en2VAYiRwxm0RuehJoNbdlf5lVRCmuaJ
 xNWJRgzhMNvUW2qVgMOagomMmg9J7+xiPr+Imso0tJIK52F6r7UPFj5LaNwOCFL8xN77
 bva1s42kJN1Z2MsHtvsVE4UAj5w6McBNzBaqupB2lfg+oJ2em1JybeNSyI8vkoXo7n2T
 Om9g==
X-Gm-Message-State: AOAM532GfiXCmNe1U8Z2/fubHLtZA29jrJ+TP1Lr8QptoaqwocoTrD7F
 sP6nMDd+propTGmga2NC6ZSNjQ==
X-Google-Smtp-Source: ABdhPJzwG1Nuz0e+TG+qiJWstZZqXx4zRnncD8qI2Md0QHQfWUH0wUB/FqqLOT6Chto/xq+frey9aQ==
X-Received: by 2002:aca:6c6:: with SMTP id 189mr4314977oig.134.1596664058026; 
 Wed, 05 Aug 2020 14:47:38 -0700 (PDT)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com.
 [173.175.113.3])
 by smtp.gmail.com with ESMTPSA id 90sm666015oty.9.2020.08.05.14.47.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Aug 2020 14:47:37 -0700 (PDT)
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
From: Steev Klimaszewski <steev@kali.org>
To: Saravana Kannan <saravanak@google.com>,
 John Stultz <john.stultz@linaro.org>
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com>
 <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
 <f314b687-11a9-5a5e-e79e-c46dd2f16c6f@kali.org>
Message-ID: <78ad0914-6173-f753-9eba-b7cbfbb51fd6@kali.org>
Date: Wed, 5 Aug 2020 16:47:35 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <f314b687-11a9-5a5e-e79e-c46dd2f16c6f@kali.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_174741_142198_B1D14507 
X-CRM114-Status: GOOD (  26.94  )
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
Cc: CC Hwang <cc.hwang@mediatek.com>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <maz@kernel.org>, Hanks Chen <hanks.chen@mediatek.com>,
 Loda Chou <loda.chou@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Android Kernel Team <kernel-team@android.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 8/5/20 4:16 PM, Steev Klimaszewski wrote:
> On 8/5/20 3:19 PM, Saravana Kannan wrote:
>> On Wed, Aug 5, 2020 at 12:44 AM John Stultz <john.stultz@linaro.org> wrote:
>>> <sigh>
>>> So this is where I bashfully admit I didn't get a chance to try this
>>> patch series out, as I had success with a much older version of
>>> Saravana's macro magic.
>>>
>>> But unfortunately, now that this has landed in mainline, I'm seeing
>>> boot regressions on db845c. :( This is in the non-modular case,
>>> building the driver in.
>> Does that mean the modular version is working? Or you haven't tried
>> that yet? I'll wait for your reply before I try to fix it. I don't
>> have the hardware, but it should be easy to guess this issue looking
>> at the code delta.
> For what it's worth, I saw this too on the Lenovo C630 (started on -next
> around 20200727, but I didn't track it down as, well, there's less way
> to get debug output on the C630.
>
> In my testing, module or built-in doesn't matter, but reverting does
> allow me to boot again.
>
Actually - I spoke too soon - QCOM_PDC built-in with the commit reverted
boots, however, module (on the c630 at least) doesn't boot whether it's
a module or built-in.


>> The only significant change from what your probe function is doing is
>> this snippet. But it'd be surprising if this only affects the builtin
>> case.
>>
>> + if (par_np == np)
>> +         par_np = NULL;
>> +
>> + /*
>> + * If there's a parent interrupt controller and  none of the parent irq
>> + * domains have been registered, that means the parent interrupt
>> + * controller has not been initialized yet.  it's not time for this
>> + * interrupt controller to initialize. So, defer probe of this
>> + * interrupt controller. The actual initialization callback of this
>> + * interrupt controller can check for specific domains as necessary.
>> + */
>> + if (par_np && !irq_find_matching_host(np, DOMAIN_BUS_ANY))
>> +         return -EPROBE_DEFER;
>>
>>> I managed to bisect it down to this patch, and reverting it avoids the
>>> issue. I don't see what is wrong right off, but I really need to get
>>> to bed, so I'll dig further tomorrow.
>>>
>>> Saravana: Apologies for not getting around to testing this beforehand!
>> No worries. Apologies for breaking it accidentally.
>>
>> -Saravana

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
