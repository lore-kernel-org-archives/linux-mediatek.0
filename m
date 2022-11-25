Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A9FC4167B
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 08:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B6NP9iExsKhwAiLL3vq6RTTdR3dVNz/YYKUpFQJUzmA=; b=MOnLWQ8QEZJ/CcAu9ig/Yeukwi
	ewQPMjOt66v//7F7XykHip6ZMVnR8n+jHxYW29XQp7pnuGYZwzp2dCLOkW83pLff2OSvg0cEBxnVK
	HXcimwGAzyeVaAOZnDsQOFwlz0yTvh/IhGjT2ZaB8KmKa0ovYctqo/6qzOTVdM+9WHKUGq2wLhPOU
	NSnvN5HQ0REnIvJMYqIcPNTZObs0iHPY0cw9bHmNlunVFPqkltkmhgMhSP0TAaQI9JHGyB1toCZv/
	BWGTmfL8jqqgrk/JpzF+D+zb+MjOxM975cltP4TYnTKQE+yUgZzfUPdUTWbO1ZLX79K3J1DFRezMN
	GV+eJs7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyUYA-00EilB-15; Fri, 25 Nov 2022 08:59:10 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyUY7-00Eik9-9m
	for linux-mediatek@lists.infradead.org; Fri, 25 Nov 2022 08:59:08 +0000
Received: by mail-lj1-x234.google.com with SMTP id bn5so4458787ljb.2
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Nov 2022 00:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B6NP9iExsKhwAiLL3vq6RTTdR3dVNz/YYKUpFQJUzmA=;
        b=Hgk0oxKXN9Kp1SVIjeguHoN7XO7n/EC4fM773cZZZY8ilRuGvyEsgAcEGmeK3pU2Jy
         TGfiulCY8gCJ64ILXTYgmm8vpspUQkudvB8Y1ubKbXoh++qvOKPcixdDp6c78Pvru8Tw
         BOoODAJhX6OINqHo8FvGgeJKj6P4bcy2xiFboO1yKDvAR9vXbHMsdIXWibGLjQpiHE4N
         2uJIUH4sWNmz4CpiKt9QGtgYFVYkZA9FKFd4U8NV2q0vv+7p6XEUFA1nBS2IjR50j3kK
         k5wQ9Xn5hfOIkVWtPDSeqWIUOqj51F/sDsIFBtD92j/LMLglQwiSe3xlpRn/b+FDfjTm
         Ee/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B6NP9iExsKhwAiLL3vq6RTTdR3dVNz/YYKUpFQJUzmA=;
        b=TT9tg9/crigZEHmji1opgm/r0L6HPB3ci/QPqEBvDDEMo4E9ZOawUFtSuqbKwOXpWx
         VLMehbbFDvtQBZTOQ9i7GEmM2hvj76kkT4jES3pPoKRVDEMjfh7es1fNFKH7PbL4Utgm
         3+4v8CPgX3ROshPCAhKGQMQYGVo7G7No9xWJAvZh3ijHQpLO+gVd+/bXWkJhr2FUdhvY
         dehrRZP9BjQl87uHUOEWT/cLS34CFiCgl3tQlI/JnOtFhM315r3jiiPVUlnE3mmZ1ztZ
         tBypmM9FcXwfdeGPRNlbWp9KM9pRG6e8V2Y41KUfvmrSoy0FPDk1ry27V0JNDBCiYMGs
         xiYw==
X-Gm-Message-State: ANoB5pl3RBtTpIMUxr77NSNlpaMULAsLv4UrZATXhHb15RS6zLHEfMa7
	PTdwEamyRbL5M71zzJOBgELmfg==
X-Google-Smtp-Source: AA0mqf77+c+kCbL9XSzsq+fyhsTpSylGBtPLQbDyXpMNs/p9Qr5IKiNMoVLX/VFlRUo/cQiC7vycWw==
X-Received: by 2002:a2e:b10c:0:b0:26f:bd6e:7f7f with SMTP id p12-20020a2eb10c000000b0026fbd6e7f7fmr5808698ljl.87.1669366745565;
        Fri, 25 Nov 2022 00:59:05 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s9-20020a2eb8c9000000b002770566d642sm301463ljp.17.2022.11.25.00.59.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 00:59:05 -0800 (PST)
Message-ID: <735232e0-9e07-dc4e-4e6b-b7d198a2f27b@linaro.org>
Date: Fri, 25 Nov 2022 09:59:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/5] dt-bindings: usb: mtu3: add compatible for mt8186
Content-Language: en-US
To: =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?=
 <Allen-KH.Cheng@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <20221123135531.23221-1-allen-kh.cheng@mediatek.com>
 <20221123135531.23221-2-allen-kh.cheng@mediatek.com>
 <4ffbba83-d23c-59ef-0b01-eeb80ea70219@linaro.org>
 <fc0cb10747056f8f38a077b39df3a83e6b340c64.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fc0cb10747056f8f38a077b39df3a83e6b340c64.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_005907_365082_C754C489 
X-CRM114-Status: UNSURE (   8.86  )
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

On 25/11/2022 09:41, Allen-KH Cheng (程冠勳) wrote:
> Hi Krzysztof,
> 
> I have used get_maintainers.pl to get the email address and apologize
> for not seeing the difference.
> 
> Do you mean "+dt" in email address?

Yes. Don't write email addresses manually but use scripts/bash aliases
to get the output... or CTRL+C and CTRL+V.

Best regards,
Krzysztof


