Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C235C6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 21:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xiHSmFYNeiiWUCdJJE7awZ5CHROEiUdBDPkAp1lTJfE=; b=UPfkYPMrG4FTUZK0DuNi238UgA
	GF/7rV5IYSpG/7sdR0bj2JBY5pw1TcW2B293LjGvltZxUruw4ns1mrrgF0dcFRFIIcp+utBwBHVkK
	VAvtIqRPtX5H7fNqqt85yXmFiVbeJQP8lm3I6El73/9hrJMxpbWWLIAGhMM3FhrWm0S/fWzKQtSEP
	E9iX45xHn1L/9v2297iF3phprt7mlGLiobJf08Ef2niOQT6hgjO18D/BiSou9UTCU3o3IHumdasI8
	iWG00GB9jIoNEvMe8ocgBG4Psxk3GrqXNcLIi4Q8BxrUJyG47mAPWm/vkiMzwLVoGoqvwn1t6U3FY
	8c7hgrvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poszT-003On5-2f;
	Tue, 18 Apr 2023 21:35:55 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poszP-003Olk-2T;
	Tue, 18 Apr 2023 21:35:53 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-187df75c906so828521fac.3;
        Tue, 18 Apr 2023 14:35:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681853750; x=1684445750;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xiHSmFYNeiiWUCdJJE7awZ5CHROEiUdBDPkAp1lTJfE=;
        b=C5Xtelfi7yuhN4dxouZndIU0gB34ZmBpzFO1vOuzPLw8VOFh5JFpMbPm+ZJBLRvm87
         EEzXXhRh8nqRTc2++Zg3lrul0xyNf/bH5LXsS63+AK8IRKvq+khiC00rZa2vLRDCNDcP
         Hbuf28Be05WFt+R3N9PrcnouFQb2PTufoCSavu50yoqUvJcV2fUindiH7FMTcHIvGB5F
         BzcwXUeR6B+RlMRXeRl0GbFzt7sauoDmNmFiOnFFLW5cxgFUk/h6WRNB4SEfL/lnUbij
         RjEAzPfKmpt4ucAJ7iCRtLBqMS4D/g89gY9wu5gPuDTR3DvoPiL96tJ23QDyizdLTLnR
         tUkQ==
X-Gm-Message-State: AAQBX9cHIfOdGcP8232c4d8IYI82zuArY/rwtChKO/Q798hpR9w4/e6v
	G/vxYXIqMVEMpu4EcH1feA==
X-Google-Smtp-Source: AKy350b0ZSpKu/WLBKWeRVPeqxp22rfWdezk+dC0nuELJwJCvQMHKkxlU6SbBCluwnUHFd3X49U/OA==
X-Received: by 2002:a05:6870:9723:b0:188:1096:246f with SMTP id n35-20020a056870972300b001881096246fmr1619351oaq.29.1681853750572;
        Tue, 18 Apr 2023 14:35:50 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k8-20020a4a9488000000b00524f381f681sm6317500ooi.27.2023.04.18.14.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Apr 2023 14:35:49 -0700 (PDT)
Received: (nullmailer pid 2372989 invoked by uid 1000);
	Tue, 18 Apr 2023 21:35:48 -0000
Date: Tue, 18 Apr 2023 16:35:48 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck <wim@linux-watchdog.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: watchdog: drop duplicated GPIO watchdog
 bindings
Message-ID: <20230418213548.GA2370489-robh@kernel.org>
References: <20230415095112.51257-1-krzysztof.kozlowski@linaro.org>
 <16d3bb91-af02-2504-1a8b-7805a2d30bb4@roeck-us.net>
 <abefdf2e-076c-6f0e-46e3-74dae3d068c1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abefdf2e-076c-6f0e-46e3-74dae3d068c1@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_143551_802472_1DF30C9F 
X-CRM114-Status: GOOD (  20.33  )
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

On Sun, Apr 16, 2023 at 07:26:27PM +0200, Krzysztof Kozlowski wrote:
> On 16/04/2023 18:04, Guenter Roeck wrote:
> > On 4/15/23 02:51, Krzysztof Kozlowski wrote:
> >> Two conversions to DT schema of GPIO watchdog binding happened and came
> >> through different trees.  Merge them into one:
> >> 1. Combine maintainers,
> >> 2. Use more descriptive property descriptions and constraints from
> >>     gpio-wdt.yaml,
> >> 3. Switch to unevaluatedProperties:false, to allow generic watchdog
> >>     properties.
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > 
> > For the series:
> > 
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > 
> > On a side note, the e-mail addresses in patchwork are messed up for
> > patches sent by you. As result, I can not reply to your e-mails after
> > pulling a patch from patchwork. This means that some replies get lost
> > if I did not keep the original e-mail.
> > 
> > That is how it looks like after I pull one of your patches from patchwork:
> > 
> > To:
> > +=?unknown-8bit?q?Wim_Van_Sebroeck_=3Cwim=40linux-watchdog=2Eorg=3E=2C_Gu?==?unknown-8bit?q?enter_Roeck_=3Clinux=40roeck-us=2Enet=3E=2C_Rob_Herring_?==?unknown-8bit?q?=3Crobh+dt=40kernel=2Eorg=3E=2C_Krzysztof_Kozlowski_=3Ckrz?==?unknown-8bit?q?yszt
> 
> (Trimmed cc list)
> 
> Thanks for letting me know, I wonder what's the problem. I am sending
> with send-email exactly the same way every day, but somehow this series
> have such header in Patchwork:
> https://patchwork.kernel.org/project/linux-watchdog/patch/20230415095112.51257-1-krzysztof.kozlowski@linaro.org/
> 
> Which I do not see in:
> 1. lore:
> https://lore.kernel.org/all/20230415095112.51257-1-krzysztof.kozlowski@linaro.org/
> 
> 2. Previous patches on Patchwork:
> https://patchwork.kernel.org/project/linux-watchdog/patch/20230310223012.315897-1-krzysztof.kozlowski@linaro.org/
> 
> Lore (1 above) points to possible unescaped UTF character for
> rafal@milecki.pl, but I wonder why send-email did not handle it.

Looks to me like Content-Type header is missing. Usually, I get a prompt 
from git-send-email with what encoding to use if it needs to use UTF8.

Rob

