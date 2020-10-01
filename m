Return-Path: <SRS0=Oval=DI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B70C4727C
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 14:34:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3270D207FB
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 14:34:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qjXO+RZc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sjH0URHH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3270D207FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t3z9/iDU2dn2LY24LSoiO3kEfme1Fhoje2kgS2XOsdQ=; b=qjXO+RZca/2hWY2uYwyMsJmRb
	hyS3eQPy1Ike14FqrxujfNNxG3Wxr9XPUElRrBh0Ppq2J4Q1VqLOmU0Xk4QtPULpxsykgjgDJ5YSG
	BnAF34OanPcXp7jTa7ArSjv1lQByKLAmuDbrf84vUBaTaLXRhnP2g9MugfqLzpnArBqfzzoW972lZ
	xIVo4bR3O9ZQlgHA7Aw6nDpW9cxf9Xlqn78SLPom8tzxe3+XTL1UNJssBIbtOtfj4LyxdTSwehMrm
	A42iZyNkfjbeafqrUhHOqaRxUv1dzqHwz6gzmOfU7IVSoOsjLTdLTQib4zi9hG0xTP/NTi0g3xVy/
	Z6cb7SU0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNzeg-0008W8-Uj; Thu, 01 Oct 2020 14:33:58 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNzee-0008VV-9d; Thu, 01 Oct 2020 14:33:57 +0000
Received: by mail-wr1-x443.google.com with SMTP id m6so6065602wrn.0;
 Thu, 01 Oct 2020 07:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=b3P3LV9RhutiTsTO5Suv2CILZHpCdIFEhL9gMG13gMw=;
 b=sjH0URHHv1v932gE4pVV6KEJUXeW1bwdd/NKsLAqRnL953En3UJHLfhivZd1U4USGg
 oZdHqZX4Vo3MFvg7lGHG4NVwI0UWCLBv7km08T3rTR3cbP/9g4tSSaOHfJAgjgyMdOFX
 jlUjUpwTmzoaCzuwHtHHg2bVFpzSbgzo/oKY82QEpNt/6VP+2yxNzJsSJ6FnK6pZgnyu
 2tcN7DVOBDKK/KUB8F8kb4EIDbTHppMg2K5N4C+AZA4DJn1b3uwLdHFLLwkmJBw1PP4e
 My7EwZwjrEKBL9mih3YXF32qj6dPSwutX8OqXOkSW0Ew7pGDE0EH0xfxKFQ9+m9wkqt8
 6maw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b3P3LV9RhutiTsTO5Suv2CILZHpCdIFEhL9gMG13gMw=;
 b=ANc/0agf4f0CWKwmDVKqGZOaFdIDPX245cih79h+GJmHxYG7W3kC7jFhycxdGwIiGQ
 8a0f9jyycQLfJ8SdmYaZtLSiNbhPckGxT9841Qzf7XawO4M1PVBA596J9LY0z0O9Xjpj
 sl2YZID4ZjL7aB0QRhr08oQ4osEIdQh1Ptf2PMy+ELQxowwM+8/exlLuHEodrY7w4MDT
 wsHhO31lc3af76bvLBaPiDtUHjJ1m+4FuGjPS5fNCO4M0NXppwRZHijFfBgerveCCLu4
 /BKKNj8KBik/Zma5l4xgeg9lW62effhk7kPPW+lLgPnUVmktkb5WNSskeSFUBy0Ty3Gs
 WgzQ==
X-Gm-Message-State: AOAM530Cb8E2gb7Q/lW1zF1zWJbXFXEtIIsioCxJ32hvyR69iFNLxHwL
 KMTo9jMUe9h49CurxEnFn9o=
X-Google-Smtp-Source: ABdhPJylhiCucri9sPMCLR8/g4mcnNpPddQeyxJ58v14bLXNYPfCCAqVmUSj2SiOW/SyoMqa8Wa1xg==
X-Received: by 2002:adf:eacf:: with SMTP id o15mr9953527wrn.12.1601562835011; 
 Thu, 01 Oct 2020 07:33:55 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id 70sm219279wmb.41.2020.10.01.07.33.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 07:33:53 -0700 (PDT)
Subject: Re: [PATCH v17 06/12] soc: mediatek: Add support for hierarchical
 scpsys device node
To: Weiyi Lu <weiyi.lu@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>
References: <1596705715-15320-1-git-send-email-weiyi.lu@mediatek.com>
 <1596705715-15320-7-git-send-email-weiyi.lu@mediatek.com>
 <CANMq1KByYjeD0D81sPzDxx5SzrPvpGxPgm+xvLWcFsmfUJDWBQ@mail.gmail.com>
 <1601437039.28469.3.camel@mtksdaap41>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <0f750b5c-86b6-f78f-f03f-d63bb599922e@gmail.com>
Date: Thu, 1 Oct 2020 16:33:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1601437039.28469.3.camel@mtksdaap41>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_103356_353497_F2425D7B 
X-CRM114-Status: GOOD (  18.80  )
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
Cc: Rob Herring <robh@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 James Liao <jamesjj.liao@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 lkml <linux-kernel@vger.kernel.org>, Fan Chen <fan.chen@mediatek.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 30/09/2020 05:37, Weiyi Lu wrote:
> On Mon, 2020-09-28 at 15:14 +0800, Nicolas Boichat wrote:
>> On Thu, Aug 6, 2020 at 5:22 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>>>
>>> Try to list all the power domains of under power controller
>>> node to show the dependency between each power domain directly
>>> instead of filling the dependency in scp_soc_data.
>>> And could be more clearly to group subsys clocks into power domain
>>> sub node to introduce subsys clocks of bus protection in next patch.
>>>
>>> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
>>> ---
>> [snip]
>>> +static int traverse_scp(struct platform_device *pdev, struct scp *scp,
>>> +                       const struct scp_domain_data *scp_domain_data)
>>> +{
>>> +       struct device *dev = &pdev->dev;
>>> +       struct device_node *np = dev->of_node;
>>> +       struct device_node *sub;
>>> +       int ret;
>>> +
>>> +       INIT_LIST_HEAD(&scp->dep_links);
>>> +
>>> +       for_each_available_child_of_node(np, sub) {
>>> +               ret = scpsys_get_domain(pdev, scp, sub, scp_domain_data);
>>> +               if (ret) {
>>> +                       dev_err(&pdev->dev, "failed to handle node %pOFn: %d\n", sub, ret);
>>
>> minor comment: this error should not be printed if ret ==
>> -EPROBE_DEFER (use the new dev_err_probe?)
>>
> 
> You're right! I'll use dev_err_probe() instead if anyone is interested
> in this series. Thank you!
> 

I'd propose that we put all our effort of reviewing and testing into the series 
Enric send:
https://lore.kernel.org/linux-mediatek/20200910172826.3074357-1-enric.balletbo@collabora.com/

Regards,
Matthias

>>> +                       goto err;
>>> +               }
>>> +       }
>>> +
>>> +       return 0;
>>> +
>>> +err:
>>> +       of_node_put(sub);
>>> +       return ret;
>>> +}
>> [snip]
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
