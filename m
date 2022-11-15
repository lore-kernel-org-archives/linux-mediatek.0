Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2ABC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Nov 2022 10:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ip+ISJDAcRTM2ug+Duw+wqq2o/8yZP4Icjagift55aA=; b=ntxKSwTDFG698nx/0O5G/z4uUD
	sOIDzpCZ0WiiiECMGmjbLvJCUTx8USBuhGyolOOUFBAVXpKcM3K1kdsZaa6j7d39QSB/nWZiBbsgJ
	KynBfgDsg/kQzx39sIIEj65Ytp9b6os3LNQPuvvw7WTRTsKnD/WE2Y8GBrAGer8EJbLaG6QieDk8Q
	pwjOnxzZQjbHXuT4iFJpmo+iwWcMFlT+2x/kdc7nnOEkYDnWkB9/klL2FnLEDqfftE4JgMKkCPhVY
	khz1eU6Y3HRfasi17dlM7a5i3tq18UMQxO6f6isvcxQqZhTzHjm2paG4ylGOJTVbFNfdwckR1iiQv
	YJHKrrZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ousja-009f4d-Kb; Tue, 15 Nov 2022 10:00:02 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ousW0-009Xa1-K9
	for linux-mediatek@lists.infradead.org; Tue, 15 Nov 2022 09:46:02 +0000
Received: by mail-lf1-x136.google.com with SMTP id j4so23636463lfk.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Nov 2022 01:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ip+ISJDAcRTM2ug+Duw+wqq2o/8yZP4Icjagift55aA=;
        b=RGMas0JKwW6JdI5Hdx3B6SyrvA9IiiTRGXDFwvCHO2N60721dGjkxyB5FcI/mOIO/C
         W8wNpqQnPmReKfhyN8ITZMFjIB13qAElu1DfcQN+vKxbPScL8TmvxvOmUMFDoSi3fhE/
         DOuvujOpPuXmaSJ1uH6dGIGS2cVRvVT++5PplZRhpQxS0voVHLXUTqCia9FKSxR5Go7S
         EWCT872gHmXqYVGILlpLpPU4ZJq+0sywRRB846zl/m/g7H/fmR3Xnd2GYxdwCDfx02vn
         Iv3EVERSxk9AE/kOtI0c2+KbO7O+HZ5ia7jb4VJQHuSiP0gbJWUIsIAig2i2Q6beMQ5a
         urqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ip+ISJDAcRTM2ug+Duw+wqq2o/8yZP4Icjagift55aA=;
        b=JkRNeaKXgenb/pj+7pTXlwsuwciF1XvAnwfq8W9wG7B6Tsmm2idqHafSTrRSXW7tZj
         0yAQtux5yMiZy2Xe8NTDGwniYPaMvcSemJY4XMMTp91WGhuSYIVsMzju1lQMnkY7nHTV
         postWZvFcv6Q2iC6rWkaCVVfuOyDUXVdUXka33ciyAzhqcjQf1Ei/6r5haX7358cPm5y
         tLhdp9TGtPRPdVDNkm0I6GK4SekjlTZpruVjwqrwRyQ4GdrPrKSI48ViZ2vgAo+GtglZ
         rZZIRi1RYO/EPSI69RlVUokIJSOk5489ISzKoDH3NbsQIdzjPbA+2zXr8SxOkv8u/fUP
         jFbw==
X-Gm-Message-State: ANoB5pmX400MMa+r1Eknu7C2pHNPCBSXyH1TLvzsyQ6BovVLKrJ1ngpi
	A109fR5vAZd04/fBD/UbqB6QHA==
X-Google-Smtp-Source: AA0mqf6Zxkah72gQYNvUKzWMofrokvA0XwHdVi/kGdatNa7PbNXD1xN+922wNh/4l5cZQUa848QSxg==
X-Received: by 2002:a19:5056:0:b0:4b2:2cff:8446 with SMTP id z22-20020a195056000000b004b22cff8446mr5444661lfj.572.1668505556802;
        Tue, 15 Nov 2022 01:45:56 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a19-20020a2eb553000000b002776eb5b1cesm2441776ljn.8.2022.11.15.01.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 01:45:56 -0800 (PST)
Message-ID: <cbed5f5f-f372-b9ba-5208-62b50c61464f@linaro.org>
Date: Tue, 15 Nov 2022 10:45:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 09/15] dt-bindings: mfd: syscon: Add mt8365-syscfg
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
References: <20221107211001.257393-1-bero@baylibre.com>
 <20221115025421.59847-1-bero@baylibre.com>
 <20221115025421.59847-10-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221115025421.59847-10-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221115_014600_679745_A932904A 
X-CRM114-Status: UNSURE (   7.16  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 15/11/2022 03:54, Bernhard Rosenkränzer wrote:
> Document Mediatek mt8365-syscfg
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>

I am not going to review this - please go through comments you received.

Best regards,
Krzysztof


