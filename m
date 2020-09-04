Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5820EC43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:51:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FF3A20578
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 03:51:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kka/4HkX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="unJgQppA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FF3A20578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ndTU8AB0Dermn5Il6L9zBlg/1wHHpuBOJ0vHcDXDiWo=; b=Kka/4HkX3ZtrEdgOkKyOX4VXp
	VtJ3ZQC6RHouDPM5wY50bjTH7WtRCYVcVaaBa+US8pQMRGq/NvadYRRXQq6dFHmHWB1kxO7dkldU/
	QExkgQBEMhJA7OJVqii+jJ/mIDgrTEowd+Bt+2jVB6Ql5mAgw4ILo7pf6yuSxfYpndXbgO8d4kgeX
	h4W29a0guBi15T8VpxWycXJxixaaWGz4JjsLnNVDI41xZPJupuVL9n1XO35PQ8DeVzQF2sAs2hE2I
	zgJlxjrrkdvo6Fqx/+6zS/rP51eIzJm1WOKRSEN+taQW7GV4qcoZigygUqwKEN//OqR97lM0NG+v6
	BvdnN2nqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE2kh-00042k-T4; Fri, 04 Sep 2020 03:51:03 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE2ke-00040o-U6; Fri, 04 Sep 2020 03:51:01 +0000
Received: by mail-pj1-x1044.google.com with SMTP id k15so2558679pji.3;
 Thu, 03 Sep 2020 20:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4urzEhGn5hqssobDIK8yWQdnXlOAEOS8EvsZsVpYUxA=;
 b=unJgQppA06zOr+i/5lbVh8/37wSbu9UyAGsYiVHtrOVMiaivuyDFggzcwBjwWE9486
 C36prs5NCsLNwPTzYU+HswqW9oM9WRdEC1hBnOY6dJRMwEFNDdFJftTOSAQuj/qv0XFQ
 liObP3Qo30j5gZTNS73wLPXTS47i7s1b3F8P6BxVvltDZHOYarHQaowYKZK5yBx7lvM/
 9OMquEkKEQxvyjX6KwHr9nhQCBRaSVO7VzMPpmH0R6OIJq0bV42lA/M1WSgm8aJNL49h
 0iriiCn9BVoffTa28iE/0BHDCmEbEGzS4HMkRyLy5mxf8kqzVqiLHCbwoIOu/SHSEGAY
 uA3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4urzEhGn5hqssobDIK8yWQdnXlOAEOS8EvsZsVpYUxA=;
 b=NL5oP+gukdJxb1bdcJlZhXx3h1V70ausb0FVCAVJAMNr5KNFHyV7o8omwcPONWT09W
 DzyAfQypOVNzzE7l6A+r+zpGZucbIylPrWl39ZdCIvDc6/FDo54sVS0Qw992f2qNO7Ik
 RmZQ7CV4A6tR7YtPAKLolUULpZ3xR913WVd44rjt3a4hQaYzYhg2bp7mzBZNDOY1yxwB
 1hmhtKfbDCkQ4xlRf24OvVTb+VQc1ENh9Sw4L+Rq0Lwn2lwMjq7sPgz2HpL1YS0DLXK8
 uAp/2g7knh6Oh1PB97KNBbfGRHv/qL7zwBO9ym5fZ5cH9UKN17p6u8VaQfPCZIXfR4SH
 Be2w==
X-Gm-Message-State: AOAM531nXubTT9PXfn8Tw7Y1TVJMDIpIPPoSg6VlbDRAUHwcHeAYxCK/
 tJF/U7TuoUOAKlvP0LtpGwMPLKFCgHw=
X-Google-Smtp-Source: ABdhPJzSRvqOf63gxU/n6n9ZHFnZOmVFxEHhne1/T97JN+EH0qLWP6l41omxY+8DCxWGjFIHXsJUHg==
X-Received: by 2002:a17:90b:f01:: with SMTP id br1mr6465421pjb.2.1599191458528; 
 Thu, 03 Sep 2020 20:50:58 -0700 (PDT)
Received: from [10.230.30.107] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id u65sm4818759pfb.102.2020.09.03.20.50.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Sep 2020 20:50:57 -0700 (PDT)
Subject: Re: [PATCH v2 07/11] usb: gadget: bdc: avoid precedence issues
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Felipe Balbi <balbi@kernel.org>
References: <1597923046-12535-1-git-send-email-chunfeng.yun@mediatek.com>
 <1597923046-12535-7-git-send-email-chunfeng.yun@mediatek.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <8bdd213d-e16f-2e91-439e-cc5d26fe3770@gmail.com>
Date: Thu, 3 Sep 2020 20:50:54 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <1597923046-12535-7-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_235100_977847_206C0B6B 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: Peter Chen <peter.chen@nxp.com>, Sasi Kumar <sasi.kumar@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Al Cooper <alcooperx@gmail.com>, linux-kernel@vger.kernel.org,
 Minas Harutyunyan <hminas@synopsys.com>, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Colin Ian King <colin.king@canonical.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 8/20/2020 4:30 AM, Chunfeng Yun wrote:
> Add () around macro argument to avoid precedence issues
> 
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
