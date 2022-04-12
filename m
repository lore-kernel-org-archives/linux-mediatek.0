Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E85C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 09:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NVWgcRQIrnHXM/3WVxwwT3IBXB0kq3GVBEFV6Jp7Yic=; b=0l3xaPFxKrRSIX
	KMjvy1OZCwUE2147XcbSqj2C0PlgClAn0bLULbQhLsuIflJ97vOFVa86QNOQPQ/6gpiCohGxYv2u8
	FkFkhpxpsRC33rOFO3NgCpVxtpIu3n51+6xYBPQVSr5AH847Hea1f28DX+TZQHnZNDKDkZfjbODbm
	HjNTQWvPw4hFcYuxYDAl6OX/C6JaH8M60BS+CGsYOPqsOK+jsOuqe3wt0l3l7FrOWXWexEbE0sK0c
	H9ib7RtAYOsfLs3/7GrdLcs1FpIqocYkqN/yyFYAAk8gQnk7GhIc9Fa4vd44TI5dC1QvW+/5erSk4
	MxLpzPJ5Gpq5iBMw6dNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neCeJ-00Cr8F-Am; Tue, 12 Apr 2022 09:17:23 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neCe7-00Cr2v-4K
 for linux-mediatek@lists.infradead.org; Tue, 12 Apr 2022 09:17:12 +0000
Received: by mail-ej1-x62c.google.com with SMTP id bg10so36074373ejb.4
 for <linux-mediatek@lists.infradead.org>; Tue, 12 Apr 2022 02:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=GhRsvMkqvOOZJ6oaXqUbn0li7sCX29u9xzmiTytidkU=;
 b=sqyfOTz7XJvOCL5M1maTVrFwiuyplXumGmdQcsG5q+E/kmxF+RY74KM3gGHaX+dXWQ
 IgXgoAqq0nbUBzxBaYqJ67ua3WQHE78OOnsNkkCtlSNdr2ok9W9pGfd9kDc35HNM+3PL
 ZofHRa+AVA+/tnD93nN7h0e/SWxCH7W7FSaTcqKY4G/thTKVIH6rz6mJ9gSjrWwN23Ll
 /8eb8Pdf0eLYNq9Fhw3W/hTCzIBEcC2GS6CZAVtizlWq2uCZGh5dZNOBE3LWDFn5k+8h
 ecMFhQ69Ri9j6CQ0dMcw8OVKH7KNjYhNqTY3Qma38vQytSAJ6ULJvn/K4ng8P7ZEm9DS
 VauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GhRsvMkqvOOZJ6oaXqUbn0li7sCX29u9xzmiTytidkU=;
 b=RNT0SomCQa5hpXFttk9VVDH1lnl8OoEm0+y7XVEkNNOpyZbdj434JzVnbzZJmRgI5n
 g9FALa/xDSyluRq63A+CqkysUzyjmxqPA53YDl77tsCLMjciqrqRrDQTcVXqQhphp9Ul
 OhXjltXYBGtnyCfUxakD+DBISmkj8QCPt8diS6qmDDKN+XJ4GbioEZB38uv8qN5uEPEe
 D9KN/HfYAo7oJJ7z/ygBzn5eIwzG7XsZ17m3DLSazuTP4c8Ww7l0uIwQ3AwMdnFCcSZV
 VA7Efsc0Jby9zl3sUgWhkaE9SX92y9c/OHCt027tN+KrZzBjTrMaCCQ67li3FkjhEjZW
 FUaA==
X-Gm-Message-State: AOAM533nCEec+j7MU4aLyNEHnf0gmOgeZz3LxRuikIy93SO5R5zo2Y3u
 Pt5lGKExQRBpgQuz+GoKiPCP+A==
X-Google-Smtp-Source: ABdhPJytgzbzMy/xrcB0VUNhJafmlE2cIehjiSoAP81ZGOZ6ie8XloS5sE9HdQwarBVxSude5T6RtQ==
X-Received: by 2002:a17:906:3082:b0:6e0:111f:8986 with SMTP id
 2-20020a170906308200b006e0111f8986mr32504576ejv.677.1649755027477; 
 Tue, 12 Apr 2022 02:17:07 -0700 (PDT)
Received: from [192.168.0.194] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 g2-20020a50bf42000000b0041cc5233252sm13533827edk.57.2022.04.12.02.17.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 02:17:07 -0700 (PDT)
Message-ID: <39152c86-ca11-2792-6b25-ae55ffb47b09@linaro.org>
Date: Tue, 12 Apr 2022 11:17:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: devfreq: mediatek: Add mtk cci
 devfreq dt-bindings
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, cw00.choi@samsung.com,
 krzk+dt@kernel.org, robh+dt@kernel.org, kyungmin.park@samsung.com
Cc: khilman@kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 jia-wei.chang@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220408052150.22536-1-johnson.wang@mediatek.com>
 <20220408052150.22536-2-johnson.wang@mediatek.com>
 <855d7daa-45d1-d6d8-32bd-51778cf58392@linaro.org>
 <fe7d2b878c18a42ff36ebd9911ecb562fe29c953.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <fe7d2b878c18a42ff36ebd9911ecb562fe29c953.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_021711_207142_DD8871FA 
X-CRM114-Status: GOOD (  12.25  )
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

On 11/04/2022 14:10, Johnson Wang wrote:
>> Also please put it in the "interconnect" directory.
>>
> 
> I don't really know about "interconnect".
> However, it looks like a Linux framework about data transfer and "NoC".
> 
> While this cci driver is more like a power managment which is
> responsible for adjusting voltages and frequencies.
> In my opinion, "devfreq" should be more suitable.
> 
> Please correct me if my understanding is wrong.

devfreq is a Linux mechanism, not a real device/hardware. We try to put
the bindings in directories/subsystems matching the hardware, therefore
devfreq is not appropriate.

Whether interconnect - or other subsystem - is appropriate, I am not
sure. To me this looks exactly like bus bandwidth management and you
even use "interconnect" in several places. So interconnect matches.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
