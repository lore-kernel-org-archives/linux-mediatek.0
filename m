Return-Path: <SRS0=xJt/=JE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C18C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 09:11:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB7C6611CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 09:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB7C6611CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bVOA4OqlIgu2/kgYaB70bycA6drfOlzYhvmeJETdVos=; b=nNEIW/1GHNePTsEJYUYF+yT49
	6zBku80DRGEHdKf91WZCSRAQ1AGn4bBd5G3zlHWvcP239VZlbO8T4rOV3XiLQRC1jAjr6otTYdykU
	fv/Vf5mdRQRFmjcR4tLTj5d2yG6BKysEYa7Kg4F2y/GGck9ROOIimhAbxlOrsdc/wDbJCkAWa6cdf
	B4vTufnQCBtc+oIcNID0ZeAaplxvhvqN48/6CEnfL3Yh1NLMDMKnZ9xqKiGCHuGsEJXSX4WnmZlhO
	Y99eN0Z35snqzl8Yt5LFBAGJJ4sw8bUzh+1tfVHxQTgRq0Tc9aFJ7NJP9jjFcW1M5F1FFTD7XPQeZ
	zylhtNMuA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lU4Do-004YwC-4y; Wed, 07 Apr 2021 09:11:36 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lU4CR-004Yfx-Sr
 for linux-mediatek@lists.infradead.org; Wed, 07 Apr 2021 09:10:16 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 b133-20020a1c678b0000b02901231346381dso759635wmc.0
 for <linux-mediatek@lists.infradead.org>; Wed, 07 Apr 2021 02:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=E701SlcCrVz67XXmWrxLLXJUKWXi3hhGVBswQflcfKc=;
 b=rcq+BxD8v9tMgxLwmSDs2SRxC0bboNhEvY6zfzGzUrzUNmiMb4dDVpB2lqfaoUQmZi
 2SdoDnDkrFXaX335+nCRrv7x0QTWIm6Zv5shcl1AskSULGdM/Ch9sKjSsI7FN7pnORE3
 +Rj0f3HsLOZpjmJjsWm0bz2S3MDaSZqSLL7IMlAjUALM7M2goYB1ZwWULnfki3Z2cqeS
 axJKtsm2AdexUF/R1H+xA5OxzJEhsUhiRL4Nzpq1Arz5GYgS7g3EcBVPuAB6CA3l/crY
 x4kD8ZQzJZDnqRUKUUyaB9w4/xPSi2i9MpyIOzz6+azi96xa/NtCZ6Z9Q/xUpfEerYOk
 56lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=E701SlcCrVz67XXmWrxLLXJUKWXi3hhGVBswQflcfKc=;
 b=m3Wa3/rHH5DKFSIvAXl/GLDCtm1nvf2Eprt78jYQ2k14zTIW7VS3O/Oyhxq/dS03kG
 hG34FCGlBggTbUvb97Ibl8KkYU7dqHSKB1s5FlgT/Y7vIQSyL9PRFRnxuKhhHkFg0ZJe
 PSsmvG1ztYKW0Q0OmiwuBhYXxEogmWH8plIipzNsTqjUFn1Ij2mRyCLPIQEt4xCeiOfT
 MMbwddyixdEz4AVomWZmA5ulInolXf0oZhllxxuxqbx18UdrJLuYDGkqXfrG3grRRpH3
 UnwNxiql/fHYSnv1xeyPm/lgixB40h8ug8OC0cwJmY+vqOgMD8xLq5IlDt2UyTopKzGw
 lxKw==
X-Gm-Message-State: AOAM531pm88ETKcIZG3Ogq599J4Dr8qvwAU0C78MhBgXT/vgLOdIfFEO
 C5BtvGp1zlSTH6xe/0Tf2xjcJgxAQedBWv9b
X-Google-Smtp-Source: ABdhPJzcgQhp66xKNb9OEInGvyad2APPTICANv9uTgAdL/J/3NtVusZS+eiTi1UhQBfdtgyn2rSb3Q==
X-Received: by 2002:a1c:4e07:: with SMTP id g7mr2112103wmh.29.1617786609946;
 Wed, 07 Apr 2021 02:10:09 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:90c5:36a9:5586:99b9?
 ([2a01:e34:ed2f:f020:90c5:36a9:5586:99b9])
 by smtp.googlemail.com with ESMTPSA id s83sm7418759wms.16.2021.04.07.02.10.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 02:10:09 -0700 (PDT)
Subject: Re: [v3,1/3] thermal: mediatek: Relocate driver to mediatek folder
To: Michael Kao <michael.kao@mediatek.com>, Zhang Rui <rui.zhang@intel.com>
Cc: linux-pm@vger.kernel.org, srv_heupstream@mediatek.com,
 Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, hsinyi@chromium.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20210312034018.17437-1-michael.kao@mediatek.com>
 <20210312034018.17437-2-michael.kao@mediatek.com>
 <1617786505.12846.1.camel@mtksdccf07>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <848df858-1f8d-bcf1-f885-546b70c37b9e@linaro.org>
Date: Wed, 7 Apr 2021 11:10:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1617786505.12846.1.camel@mtksdccf07>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_101012_721121_3A46CB09 
X-CRM114-Status: GOOD (  11.13  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMDcvMDQvMjAyMSAxMTowOCwgTWljaGFlbCBLYW8gd3JvdGU6Cj4gSGkgTWFpbnRhaW5lcnMs
Cj4gIAo+IEdlbnRsZSBwaW4gZm9yIHRoaXMgcGF0Y2guCj4gIAo+IFRoYW5rcwoKYWNrLCBwb25n
CgoKCi0tIAo8aHR0cDovL3d3dy5saW5hcm8ub3JnLz4gTGluYXJvLm9yZyDilIIgT3BlbiBzb3Vy
Y2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzCgpGb2xsb3cgTGluYXJvOiAgPGh0dHA6Ly93d3cuZmFj
ZWJvb2suY29tL3BhZ2VzL0xpbmFybz4gRmFjZWJvb2sgfAo8aHR0cDovL3R3aXR0ZXIuY29tLyMh
L2xpbmFyb29yZz4gVHdpdHRlciB8CjxodHRwOi8vd3d3LmxpbmFyby5vcmcvbGluYXJvLWJsb2cv
PiBCbG9nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
