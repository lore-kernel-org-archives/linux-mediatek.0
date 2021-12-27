Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135DDC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Dec 2021 04:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dV6mhIX0L1LDlJCfZMwBMQ6gUe675RPkjx9J5x5a3og=; b=1Mm+iNp8LPvcYs
	NBqEROVqS8HGSHWrnS3DwC1pKhg7SGc3pYMgqFcTrt7riq25rUxY0GxmKFQyjL50BaphlXeoEMJ/R
	O+r7D8gkbE0VLDSnpTYb3ZBbRSGLl3kFmhG8O5+aLv8+fH29E7Ck3hTCJsyW8k2cxqM1PGrBK7RXX
	94VY6xlK4Bmpc2FDS7HQnsSq6A1Sj72q/qVWOL4s65cCAoCby+MHNTqM2s8rEu3L2tY7QZzAPqxuJ
	K+WBU7kKj8dzd+TBAHpwPni2WiXITUX3yN3w01xgz1DSWVLVk+Euwh1Q/Slcsa0ugtEed0yoq+8ju
	2uMmxEr5HHS5tcIUHFjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1hQI-00GArO-02; Mon, 27 Dec 2021 04:15:46 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1hQ7-00GApk-13
 for linux-mediatek@lists.infradead.org; Mon, 27 Dec 2021 04:15:36 +0000
Received: by mail-pf1-x430.google.com with SMTP id c2so12697196pfc.1
 for <linux-mediatek@lists.infradead.org>; Sun, 26 Dec 2021 20:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dZHrX8TEd1s1Rvq7azrt0NBXkVOb5WFezTF0/TFNa/E=;
 b=CmnCQPPWTzj+M0BTCCL947qVsPfzWjH3Pl606mcz9a2S5Bxtez5W7iqDw2ZQN+yLUR
 RQXdeIg9rqH1ROQYts0zkZHAPEq8tsbFRH0WtkeTvTB6+oQQAI6OCkZc4HEIVMUIajvG
 mo/Td2ueAp7Ay8a41BAO79BigDIkTnhCR9RcheSGFCBohp5Wbosa1oRXtt3PBiPXJTN9
 taJU9hdO5yRyzUMhVRMKXXcKnNt4duYCVynwMa9cxFuhvlLdYN9mSn+cviQrbjC9LaiU
 s54fTFde9PX2uJz88Zs0SGnAHq1TUTYoYFqKE1bfeQVKAwLmgz/OBiTQ+XoxCYiwyzUY
 qg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dZHrX8TEd1s1Rvq7azrt0NBXkVOb5WFezTF0/TFNa/E=;
 b=MznWl+wxGx0x9SuIeD8c7BIOkZLTXvirU1fAwIlZfLJvLLpEcVrc47b8vgZHTtSvQN
 L2TU3tlV8O4w7SZurdKO/EN2L3sq1RZRagdz1NfjMt6WIKlNF1Yd+HkV0yOK4+V5vdNH
 3zM40K8Zf8x+P5dIQPDBygkLlHajDDENUBS6jJYfRAui/zSsZe0ViCMTD7h2nPFqTWeL
 2ntGHav/OwK8y21X6Dmjh1trgsZsVQ17B6ozyPAJWTs/OP9C4zr2VM8ipRAbf+ffnvlt
 oRAGOoz/KzVCMUwfBKd3rpcoRhm5r5jfI4HVJXb8wysKIY9lWxA1mX4ay6nzV+pc/Cp8
 DuvA==
X-Gm-Message-State: AOAM531pU6gJrGYEDm8lOXhFV1ho/wTx57vzuTIdoWWmCZd4PPq3tdOw
 F2c/S9FFFMCmHyhUUMMcKtCGYg==
X-Google-Smtp-Source: ABdhPJzz/7eIXRXYn/RgMkdl62Ozc24gm2sKtZeKxBbyT2flMNofiYyzcfQjK+wvgEeGVQVlly1E3Q==
X-Received: by 2002:a05:6a00:14d3:b0:4ba:8ccb:73f1 with SMTP id
 w19-20020a056a0014d300b004ba8ccb73f1mr16105452pfu.65.1640578533460; 
 Sun, 26 Dec 2021 20:15:33 -0800 (PST)
Received: from localhost ([106.201.42.111])
 by smtp.gmail.com with ESMTPSA id g5sm16502101pfj.143.2021.12.26.20.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 20:15:32 -0800 (PST)
Date: Mon, 27 Dec 2021 09:45:31 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Cc: linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH v1 1/1] cpufreq: mediatek-hw: Fix double devm_remap in
 hotplug case
Message-ID: <20211227041531.5w5lhrk4a7jzz64x@vireshk-i7>
References: <1635507743-17919-1-git-send-email-hector.yuan@mediatek.com>
 <1635507743-17919-2-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1635507743-17919-2-git-send-email-hector.yuan@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_201535_135248_F6692462 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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

On 29-10-21, 19:42, Hector Yuan wrote:
> From: "Hector.Yuan" <hector.yuan@mediatek.com>
> 
> When hotpluging policy cpu, cpu policy init will be called multiple times.
> Unplug CPU7 -> CPU6 -> CPU5 -> CPU4, then plug CPU4 again.
> In this case, devm_remap will double remap and resource allocate fail.
> So replace devm_remap to ioremap and release resources in cpu policy exit.
> 
> Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq-hw.c |   33 ++++++++++++++++++++++++++++++---
>  1 file changed, 30 insertions(+), 3 deletions(-)

Applied. Thanks.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
