Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6661C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 15:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JsASPOg5Mb/ocjj8YVVzjXjvr1ADpJsiQMdePAl5Yw=; b=sNgzTm7Oq1QZLmso9J/375yZeu
	UiXalE2dX6l5R/R8604tlffZ9PPLjmx0b26uLMG9UjNuA/fJ3z4kA/l7ZPuM8NDlB1DLpt5KpmQ2y
	WUXc4VQBD300zJx3z3XfP+Y82IoPTpLOsg9iRDBHN+JXFi0T2qxc89zWPe84V1pYac+hOMCJfarrV
	Sxq7mOvMwKXN33l/7L+ZMQPIrlpqLihiUaOYxCdUCMZ+fzgkuvSDHuru0KYNRSU4U0NVWPflh/qR3
	j0+ov79GxWO2QuQEhlIkZgSrrPtPx0I++kz8DvsXwY18DkjoCD0laL05SoVlRIS80DrgDOFL0w5TI
	lNIrBgzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngpob-004fgf-1P; Tue, 19 Apr 2022 15:30:53 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngpC3-004PTk-IX; Tue, 19 Apr 2022 14:51:05 +0000
Received: by mail-il1-x12c.google.com with SMTP id r11so10690588ila.1;
 Tue, 19 Apr 2022 07:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=2/CLF6HwL0IQsaCNZtZxcU3NkwNds1QQIy0mQEierNo=;
 b=IVU18bp77G6GNO2M46k8FQ4vC23PrIiOqenVp0QBE3NQIyU5oZmqz7Wz79xyimgR1O
 HarbGV1HZn0PsQJo9loLD06pawA5m2K530CGOPPfNIHhgpZEZF8MwbKyB22RiIOevcur
 AUuN/6kUIWhmQItev/LyQQhcS4va+4k0tLOkjWJkhoh0/ACrLCbyPdYz1b3uwBrfJuVj
 N568P8hJL0mKWujn0+MmHmUZ440cwphsZbO1XYTTYOyaTQtq7THeGDg0ihHckD6ot6tR
 ZAmqbfesjffnmNkjm7w2O/PT8Co8HxHwhPIKCuX4cgeud1By9ItvofqhtIu7lk0G0fEz
 rYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2/CLF6HwL0IQsaCNZtZxcU3NkwNds1QQIy0mQEierNo=;
 b=30FDIs2bGtawNgJRnKxLCbZfU/t1pqn77jSP3+oI2hjYlbgA9/cSK1VMIvu3Qx5bMj
 aUP/xSKcxyGhb2lUNvdaZzwGHY0e7KaIe4o2b7UaargJIQLvXUele+wUIMChrwpG+Guo
 o5aVhD+M8eR+dG2/HWqFQGUtgxQW6Mia8BiHjmu8ugBUqhfdmWfsi5EY4feNqgRetDo9
 HgqLB5mz8Jb6HARgOt5GVWS77KbidL5thssp3xEBetTLHJPsF6+khTxEPurJPsfpNndl
 28LS4VNviFq4wFV4pe/tc6fxhVIxC1moZSMdOUQ02TFIOB47/oW6g8TXNtTXq0jrpuLb
 8gng==
X-Gm-Message-State: AOAM533yv1dN8HK4kr/2m/iAd9fVuLs6usZYBtgcyQ8S1T/GEM8VUo+S
 4uYT4FuGpbugUFvKum8VSHU=
X-Google-Smtp-Source: ABdhPJyW3L77tWAzuH7FzU57Z0U26kp0CzYvcDUc7c4NjVWDuIlOF9zEAf31P5AKUEhQZnwi5g12lg==
X-Received: by 2002:a05:6e02:1486:b0:2cc:3ee4:f27f with SMTP id
 n6-20020a056e02148600b002cc3ee4f27fmr2768124ilk.67.1650379862180; 
 Tue, 19 Apr 2022 07:51:02 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a6b6009000000b006412abddbbbsm9618307iog.24.2022.04.19.07.51.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 07:51:01 -0700 (PDT)
Message-ID: <45b90a0b-0b7f-1fd9-194c-533ade996f1d@gmail.com>
Date: Tue, 19 Apr 2022 16:50:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: align operating-points table
 name with dtschema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org
References: <20210820081616.83674-1-krzysztof.kozlowski@canonical.com>
 <165036314214.180327.9860190048104061653.b4-ty@linaro.org>
 <448093df-288f-3c49-270e-5d830a986b27@gmail.com>
 <83037bd9-d4f0-7116-0b7f-26f64170a5ad@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <83037bd9-d4f0-7116-0b7f-26f64170a5ad@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_075103_707067_FD95B9D0 
X-CRM114-Status: GOOD (  14.59  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 19/04/2022 16:34, Krzysztof Kozlowski wrote:
> On 19/04/2022 16:31, Matthias Brugger wrote:
>> On 19/04/2022 12:12, Krzysztof Kozlowski wrote:
>>> On Fri, 20 Aug 2021 10:16:15 +0200, Krzysztof Kozlowski wrote:
>>>> Align the name of operating-points node to dtschema to fix warnings like:
>>>>
>>>>     arch/arm64/boot/dts/mediatek/mt8173-elm.dt.yaml:
>>>>       opp_table0: $nodename:0: 'opp_table0' does not match '^opp-table(-[a-z0-9]+)?$'
>>>>
>>>>
>>>
>>> Applied, thanks!
>>
>> Could you please provide a stable branch for this patches? So that I can pull
>> that into my branch. This will help to reduce merge conflicts later on.
> 
> Then maybe better take them directly? These patches were waiting on
> lists for long time, I resent them and pinged. I took them only because
> there seems to be little interest but we want to fix all dtbs_check
> warnings.
> 

Yes definitely. I'm just overloaded and forgot about them. Although at least on 
that thread I don't see any ping. Anway thanks for the tag, I merged it into my 
branch now, so we are good.

Regards,
Matthias

> There are three for Mediatek:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/log/?h=for-v5.19/arm-dts64-cleanups
> 
> Best regards,
> Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
