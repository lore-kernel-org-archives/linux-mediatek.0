Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21C3C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 12:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhB7soEBt+h/cvLlalh1ClLhp94ev9gYJbbHem2SukQ=; b=bjKYF+UBZzTYLUDUl9kd6Nuo8Z
	Whq+Zgp6zX/vUozktC7My8kR/uVTdD/NqVDIiQ31iiwhlgCDOlUpPGO1bd9NyrP/G4OCoElfJjvhM
	Eid+Wg6dBJIhxCqFXguj/3oCL/U1+oS7ja8xRHyOqBpn5uBOlzyR8QMsI2quj9MN7HEDw+H91jRq1
	ANdblDai0kR6gOO0dV01OyJO1GUWlu0Vn1U61rQ1iAjilFyOZaG/hfSTekkc4YMKrMo+kFYaIKHYV
	fwwO2EM8bxyo+tNxIZIWJLiznMX56ZyTLNXt7Hn8196kGm0g+9bTBXrEvbZHCdzX+igxAJoXDXtMb
	mVnTfI2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiEGT-004CcI-4n; Tue, 11 Oct 2022 12:21:41 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiEGQ-004CbL-Ce
	for linux-mediatek@lists.infradead.org; Tue, 11 Oct 2022 12:21:39 +0000
Received: by mail-qv1-xf33.google.com with SMTP id mg6so8794633qvb.10
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Oct 2022 05:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HhB7soEBt+h/cvLlalh1ClLhp94ev9gYJbbHem2SukQ=;
        b=C2CwpJA/eEe26hk/8diOHyBrEVBVKrsDfhsyJK3rS/ez2HMAp3eAvLFExUprwAXan9
         dzcEL61NHddvGvhPHdKEOz3Z9QZD+HjFL9Wu2hpls8DQWCeW94EvvTkAu0xbe3NCY1+T
         kHyqzsES+3bZGk9163FITn5RctJ9jNmXTrAAmlycv8ckLFwd5/OVmOqZacFiRxWVFIL8
         PYi6KcS6s4fdrHNR1YPpa/vdmxVqUeIbw1mr/OfZRkkZEpQQo7752oFQMBTAuUB/diKX
         IF8ixxfofW2/9PGL38RFXy3gsJqpry+5TOOFGVwHbyBjWccp37Btz2oAwXMVCYsh5J+U
         fprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HhB7soEBt+h/cvLlalh1ClLhp94ev9gYJbbHem2SukQ=;
        b=t3aaLzBTBuBOE1Cp7gwbBhAGK+3NmtI4E46ZctT84/3RvRjdMwsirvyXOI9aCe5ZJc
         AXozRVxptcr655sCuSUD1XoZUnuGq/bZsE/wHTgcov9G1btCYKmJTl2LqfIwjyjWyzPA
         ZB730bYvhP2ttQUeOU2q99OMoqa9XlZ9vvPMEr0dAvrsp9hX3WuXBouiptxu73sMoInJ
         zIl+iISTDLSuSgvpq7W3EmyaaT9ZFLBOTL3W66809wBuHifDn9G5vlVvIkbUeFyScicE
         N8WXCSY+YIQqxJ7NCeEBWqCKWQS73m+dhhqsRp3W2dF/xtpnI4edzzvkwaCjuLK5Nf/p
         yp5Q==
X-Gm-Message-State: ACrzQf3ySAhfO2hOW78u0v/q5GgH4SEHl52dyWsr1uXKu8Vtl0TTTDfg
	b8ggrtOu3/k8Uw7lyah8iq0D/A==
X-Google-Smtp-Source: AMsMyM409EGLX5zmw7JLTYTgRETqlbbuY5HfbQ/NOTncWVwATOPyEzJBY4SEGpl9Kf+tjK44H0r81w==
X-Received: by 2002:a05:6214:c22:b0:4b1:9949:b4ab with SMTP id a2-20020a0562140c2200b004b19949b4abmr18458183qvd.83.1665490897040;
        Tue, 11 Oct 2022 05:21:37 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id j19-20020a05620a289300b006bb87c4833asm13315797qkp.109.2022.10.11.05.21.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Oct 2022 05:21:36 -0700 (PDT)
Message-ID: <9d0ecaa0-5a36-b906-75f3-b71939655198@linaro.org>
Date: Tue, 11 Oct 2022 08:21:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v2 1/7] dt-bindings: arm: mediatek: mmsys: Add support for
 MT8195 VPPSYS
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221011070356.682-1-moudy.ho@mediatek.com>
 <20221011070356.682-2-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221011070356.682-2-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_052138_463057_102DF3CD 
X-CRM114-Status: UNSURE (   7.49  )
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

On 11/10/2022 03:03, Moudy Ho wrote:
> For MT8195, VPPSYS0 and VPPSYS1 are 2 display pipes with
> hardware differences in power domains, clocks and subsystem counts,
> which should be determined by compatible names.
> 

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


