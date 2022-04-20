Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2EEEC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Apr 2022 12:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CGVcAjTj/wQxOjWprcbyDK5E90syxAERs5wo18ZrTjY=; b=PPkSw5y12+u9HoVIq9k4B5jR3i
	xN5stTo504P/yH/mAUYuKn3giRfg4u4zLhdiO/t9CCk3x9uyxps65uzZhv4fuGijlpSNKslS9aiOF
	G+72pzdJbs/IO1OwJqHMqC7cGZZmz7VAufjjOhrj2NNzCbIpp53MgOFI/7XN3aFFTNMvpYy86oX4U
	u3INhb0PBk8AysvM57u8EivS5b5x1GJpvmvUEKEV0D5DGRVMFtnOkn3WiIOhBfJebtZRw8DdFp0v1
	NVviM2N2iJCa+qm7lAVhQ3zYzOKld/OjkUoUUVd9x04CtGta29v0p62hyDepA/pQmfSEQtYMbipcF
	6k2+S2FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh9Yu-00907N-JP; Wed, 20 Apr 2022 12:36:00 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh9Yo-00904m-TL; Wed, 20 Apr 2022 12:35:56 +0000
Received: by mail-il1-x12e.google.com with SMTP id r17so865003iln.9;
 Wed, 20 Apr 2022 05:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=BiLwiwddtSMnlQ0M8iHv3+ugnw2GAfojyhyoRie29Vk=;
 b=e0EtYUunQZ84wIdzf8zq9LY2W4oa9WeNkY3QlCIPHvOdI9e1Fvvx6d4qj9MXxi4wjR
 krYzb67qgZBV7++16zQnXvLEKOTtCAxEaaDfFh1G/FyibNSfky00SQK6ugA08KTlQ1Sl
 B+C3D3cXbP16iHNDNCzhcWgCICEZvPPZurQMgF0k5YTxbGxj72Y7B2SWf1XEWwFHb/v2
 bvo5RW+3cZx3JTX4KSV+ibiWiNFVA06CD0Lmh3b5kFyrJXz85udbpJ35zjdxwSspcSeB
 rf5Dm6bYxTrk1b/Yvv32dRRxvB/O2nAzZdADDbSVrRJ1RpIKNBQtkrJdh/PIaQ5wxf4I
 RDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BiLwiwddtSMnlQ0M8iHv3+ugnw2GAfojyhyoRie29Vk=;
 b=PM5eSztnkVBgd3QObcJpLPGorgsUhwKST8co/VoYrDggV+FBUJ7595ERw0T1cu/zZZ
 Snhp3EimAoKGS4V0vYSY4uPfpDNlZcb7+nCkeH9rLn8Xf4oiki5Ijh6DZ/sYeZqBT+h6
 w/0TFNJPsLmyzrAeFxpQNA1LqirH4uWVVgzTucgKMShTGQZjTjsLmD6tdva/N6VGVywE
 1V2fxZ8qWqLRvRbBbVIWt0i3wmjj4PPt9c2lmq7LR52lY/FG0L94nR0AOzCBJFzD55eZ
 n89qeKdc/7U/bBgI0EcFN/ar8VRTbAQjhfwh9lgrJloRtLKVO2S/1l/raphbq5ntnv/p
 K7HA==
X-Gm-Message-State: AOAM533FjiC1L7Tqn+d/S5M80Zfw+c617/GMRJjFVrayg/yK2a4PIg15
 OjgU2E++j0dOc1Xz362H2LtumrxdRkJ80A==
X-Google-Smtp-Source: ABdhPJzKIwd8l2yZZ031MUP9S0Jjf7C8b5CPjV3TsOHP+MKPFXEdaMvbfQGutKPOvnvuukrfm4Meeg==
X-Received: by 2002:a92:c26e:0:b0:2c9:e7f7:5eb0 with SMTP id
 h14-20020a92c26e000000b002c9e7f75eb0mr8926130ild.143.1650458153081; 
 Wed, 20 Apr 2022 05:35:53 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 b19-20020a5d8553000000b00649f02b1b0csm11330099ios.39.2022.04.20.05.35.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 05:35:52 -0700 (PDT)
Message-ID: <38f29c29-e3c2-240a-23a0-509c4febf1ca@gmail.com>
Date: Wed, 20 Apr 2022 14:35:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] arm64: dts: mt8183-kukui: align SPI NOR node name with
 dtschema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org
References: <20220407142143.293740-1-krzysztof.kozlowski@linaro.org>
 <165044570803.75184.17759035800452933385.b4-ty@linaro.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <165044570803.75184.17759035800452933385.b4-ty@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_053555_037939_F0F5A6E0 
X-CRM114-Status: GOOD (  12.10  )
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



On 20/04/2022 11:10, Krzysztof Kozlowski wrote:
> On Thu, 7 Apr 2022 16:21:43 +0200, Krzysztof Kozlowski wrote:
>> The node names should be generic and SPI NOR dtschema expects "flash".
>>
>>
> 
> Looks like no one wants to take this, so let me take care of it.
> 

First thing would have been a ping on the patch, don't you think? Anyway as I 
said the last time, if you take DTS patches for mediatek, I'd need a stable 
branch I can merge so that we don't have any merge conflicts in the end.

Regards,
Matthias

> Applied, thanks!
> 
> [1/1] arm64: dts: mt8183-kukui: align SPI NOR node name with dtschema
>        commit: 4e3ffebd69e0aada1ce6bf4bf832e14a3c4f50db
> 
> Best regards,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
