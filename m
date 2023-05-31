Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21069C77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 May 2023 07:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BGm8dSFUe8oYl2TNz6+RJ2OzDhK9zNEqrtF6bUETRPg=; b=EKZjcsEaCLumaOTrAEgaia/NKa
	6dx5ufD0oQUIpPH63LXlTsW+SHAsI0mWjgWIxy/IrpIzkR1Fbdw2cOicAe1fhvXDv06/+IvlM2KEq
	rAny/vqRaK/LLXzB/yxxEke0engxZD5nU54q2d2muT5GPRbIqdxQRHPhMwgfTEaKnAooIhl14XAdD
	e82nAKkB1UChq21xx/AJ/NVch6fKbOqfLGSKKBCkIiNUKDOZiOATSJZX1+/dDSe8nrzxNhjGp4d47
	SyEluGlXMjrluxfeQyDhR1UnscpHvx5gJhiOsriBEq5eAMee9P2Iikf1ekBLGoV+AP661oe2528Jj
	BSVfO3MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4GCc-00GQWf-1i;
	Wed, 31 May 2023 07:25:02 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4GCa-00GQV4-0S;
	Wed, 31 May 2023 07:25:01 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f61530506aso57157195e9.1;
        Wed, 31 May 2023 00:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685517896; x=1688109896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BGm8dSFUe8oYl2TNz6+RJ2OzDhK9zNEqrtF6bUETRPg=;
        b=pbS5jnd0KtWx1kVXDxSAjb45cGnnDxpRKZ+eRHPO5z2Gf1O8pmA0hnJnj0896zCXDa
         9mzThdBCbFgu19k81bCjxUqei1uwzml3BqcXaKgngGOeiN7dxwiNujCVZ00DoPPyBPwM
         W158p4ui/sGpYve7pXvZMMUwiq4pX3rlCbIsgvDOjHNMJWje/pS9jvZxEMSRTlTh2MKq
         UrGa7S9T1Ea6mrVYf4+5cfpZ8xvl6eGRuK/RngjKsyFTLQ6K9XmndxbG0yLc0X8o1DUz
         Rpz6CTQXVjqzAD7FKh9YofXrqtusQg5HtSrP1ZjS7nEC0XUlNesylMeuBoWFum0wiBo+
         xkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685517896; x=1688109896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BGm8dSFUe8oYl2TNz6+RJ2OzDhK9zNEqrtF6bUETRPg=;
        b=Vzc5m3ykp1eGe2/UsOrm5l4iz8s9DTSrv77ohO/7JZQKouXayYOjKc74fxiBV6eJLl
         4xF3IvhpXOahgqNje+ERQD8w2p1vDnqHddCLRO0632alsONCPFhTgu3DnUqz1SN59PaS
         w9sMQvv/Cpw1HvaJ4fBBLsYX3zA7FGAwRxw6bUbpXn4z6lq4tk2aFi2BWeQYvSXuxqfB
         H8oKZNG9/6wE5lXiG9+szX5O7CBmIXeCVKsM6hO8DGkD4RcGKbcaXaWGsRZPhBFYlOLb
         rRyhGizr9mLTnEq1xYlL1CIgSY2VUjMBF/JZn5/UQ3jKOYgSJCdvhqKD4Ggq85KYl5UE
         gD2A==
X-Gm-Message-State: AC+VfDwf30FYNSVG9rSRvczd8tMdt669fcA1yIYvEaUZZWcXNfPPrJ1Y
	hTsTfs2VR4Rp5GRjtFnnyq4=
X-Google-Smtp-Source: ACHHUZ6FAhHU+Za7H9g0Boog+saCu9YGFod3wjMwsWnawn+ag9re32rbUxQSPPglCDOpfLNweXodOg==
X-Received: by 2002:a7b:c8ce:0:b0:3f4:2267:10c0 with SMTP id f14-20020a7bc8ce000000b003f4226710c0mr3464732wml.28.1685517895689;
        Wed, 31 May 2023 00:24:55 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id q13-20020a7bce8d000000b003f43f82001asm23321548wmj.31.2023.05.31.00.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 00:24:54 -0700 (PDT)
Message-ID: <bc8f0ee3-1131-3f63-a982-913f8165aa7b@gmail.com>
Date: Wed, 31 May 2023 09:24:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3] arm64: dts: mediatek: Add cpufreq nodes for MT8192
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230317061944.15434-1-allen-kh.cheng@mediatek.com>
 <20230317195453.lpymxjk7oqvbxkq5@notapiano>
 <CAGXv+5GyLeVBAk_DXJoTxoG400mnq4y6pa1JXRD7Svc4rtMQBg@mail.gmail.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAGXv+5GyLeVBAk_DXJoTxoG400mnq4y6pa1JXRD7Svc4rtMQBg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_002500_180922_994AE757 
X-CRM114-Status: GOOD (  12.96  )
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



On 30/05/2023 09:29, Chen-Yu Tsai wrote:
> On Sat, Mar 18, 2023 at 3:55 AM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
>>
>> On Fri, Mar 17, 2023 at 02:19:44PM +0800, Allen-KH Cheng wrote:
>>> Add the cpufreq nodes for MT8192 SoC.
>>>
>>> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
>>
>> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>
>> Tested on Asurada Spherion Chromebook as well. In particular, verified that
>> applying this commit makes suspend/resume work. Before, it would hang during
>> resume:
>>
>>          Enabling non-boot CPUs ...
>>          Detected VIPT I-cache on CPU1
>>          GICv3: CPU1: found redistributor 100 region 0:0x000000000c060000
>>          CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
>>
>> But with this commit applied the machine is able to proceed bringing up the
>> secondary processors and complete resume.
> 
> Ping on this patch.
> 
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Applied now, thanks for the ping.

Regards,
Matthias

