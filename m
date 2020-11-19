Return-Path: <SRS0=wQP+=EZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73BB8C63777
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 22:27:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD9CE208FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2020 22:27:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ryIDi9a+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LfNizfWw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD9CE208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+ViE6i/RAd3cRsQSFnKdzCRpxnLZx3+UfnPFXeuKmdM=; b=ryIDi9a+YgBzhTNrLYJnp+4Uh
	pYxDnTfDlTLENlM455pq8ybnYxOOG+Uslws31yPE8pt4yPXVLLwBktqSd8/fKtk89S4ld9O97/jNW
	r36zDLWztegd328pMwFruaqFQr2eUa1UTZQwxB9BpoGPv3Ih1l7FXKaNmXA+HM0zxyiO2rlzo9pAh
	3nK4OA9K9HUPxft+7MQVghC2exMPzz5Bad9OrZL81HJYKiPouBW24vi6WnpmBYTCu3Udgqn9k8Pt6
	u8LpQlSZW+cDIDcvG8gh6GaBwU0yn12bB2KPKxJtpbb0xtw9SoW/xSzDG1kteRnJeDwTPQWMDfod3
	yFS5GjACg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfsOJ-0008JS-LO; Thu, 19 Nov 2020 22:26:59 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfsOH-0008Ij-Hf; Thu, 19 Nov 2020 22:26:58 +0000
Received: by mail-ej1-x643.google.com with SMTP id f20so10164716ejz.4;
 Thu, 19 Nov 2020 14:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LbNQsMFkK1yV1B1LtL5N3Qufx4e03bP9/878SJx99ZY=;
 b=LfNizfWwMJlvsDK7TkuVLjpZmsZJ47u3qRc+5tuIayvySsP/F42X1P3q7d0Y2Tjryi
 r4N/ChZgBGa/Lvda+9kRXn4gKMr4m8DUqTNqQSdbcxr3GLh3hknmKq3Z6iGP3ckt+r38
 1OQz+W7d2W71tTvoQxBsAHoAlPShWNceF7OzdXcqyPScS0SLoLLfUhn+S9KuOssyetwI
 Oy46k9O5vCnntSmz4qHUzKnNiUujMgL9dl+Gr4ON7tdPTyBRATASB+c8Nl0r5Fwb8UnU
 2ckq6uegVBO91pPF6UvKFXij9vVmqJ754lnSyoAau+yoWZejMp6T2s3AZoEF8HY7fzfR
 q6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LbNQsMFkK1yV1B1LtL5N3Qufx4e03bP9/878SJx99ZY=;
 b=ZOsn+cQhv38uVk+T6tJZgsCtdO/s51uLJgNGMD0fhyUXrC5JtDVaNYz5xECM3Lz5pk
 qscY1kANvfzV7+PiAP3AQelzYYINuR+hmoysYjygqkT9CgJXq76Nr3Jfmys3W3oZ5dJE
 YR6AhlFo91qx03mdUPvu26J30lwZMPHu3XBuuR4OI0AwEnjQC1Nmi0MzucaGkCb2icsU
 IiJUatW4lV0bCLSrwUSvzqkBehDxPXAnFLVXvt/TLPZpk72NGX7kmcFhYtp31UwG5WPd
 G5Tv8sIXHhGx5z99vbxMTrZPFeFnuaYMr5WfePcHdlQK3EvahLrRYVNUnvV0q8VipRAN
 JiHA==
X-Gm-Message-State: AOAM5310DtLbb/CbUrj7UaHa4p6LdZpFUI6WM249gwoQw8a2MDFZH8fB
 xqaryK8VWheE0IPAXr85nT8=
X-Google-Smtp-Source: ABdhPJxm/T3wnrw3Zcv7cp66ZFcGtFhRT7XBaN1zQUgG4VBx5/eLl4bxa8i8fMHRnq6Y0sVcIldDog==
X-Received: by 2002:a17:906:6b86:: with SMTP id
 l6mr30525271ejr.524.1605824815814; 
 Thu, 19 Nov 2020 14:26:55 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:5807:584b:19c8:e7be?
 ([2a01:110f:b59:fd00:5807:584b:19c8:e7be])
 by smtp.gmail.com with ESMTPSA id n22sm342031edr.11.2020.11.19.14.26.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 14:26:55 -0800 (PST)
Subject: Re: [PATCH v7 2/5] dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT
 definitions
To: Pavel Machek <pavel@ucw.cz>
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
 <20201118213712.GA22371@amd> <6068b1e3-a4c8-6c7d-d33d-f2238e905e43@gmail.com>
 <20201119215721.GA5337@amd>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <0700c32d-643b-fedb-06f0-21547b18205d@gmail.com>
Date: Thu, 19 Nov 2020 23:26:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201119215721.GA5337@amd>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_172657_615729_D49E5AAD 
X-CRM114-Status: GOOD (  17.57  )
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

On 11/19/20 10:57 PM, Pavel Machek wrote:
> On Thu 2020-11-19 22:03:14, Jacek Anaszewski wrote:
>> Hi Pavel, Gene,
>>
>> On 11/18/20 10:37 PM, Pavel Machek wrote:
>>> Hi!
>>>
>>>> From: Gene Chen <gene_chen@richtek.com>
>>>>
>>>> Add LED_COLOR_ID_MOONLIGHT definitions
>>>
>>> Why is moonlight a color? Camera flashes are usually white, no?
>>>
>>> At least it needs a comment...
>>
>> That's my fault, In fact I should have asked about adding
>> LED_FUNCTION_MOONLIGHT, it was evidently too late for me that evening...
> 
> Aha, that makes more sense.
> 
> But please let's call it "torch" if we do that, as that is already
> used in kernel sources... and probably in the interface, too:

I'd say that torch is something different that moonlight,
but we would need more input from Gene to learn more about
the nature of light emitted by ML LED on his device.

Please note that torch is usually meant as the other mode of
flash LED (sometimes it is called "movie mode"), which is already
handled by brightness file of LED class flash device (i.e. its LED class
subset), and which also maps to v4l2-flash TORCH mode.

> ./arch/arm/mach-pxa/ezx.c:    	       	  .name = "a910::torch",
> 
> Best regards,
> 							Pavel
> 

-- 
Best regards,
Jacek Anaszewski

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
