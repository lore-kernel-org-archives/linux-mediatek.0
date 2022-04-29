Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996CDC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 21:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yzO7ZvvfXz8c5oCFNg2c8uBOYvGdtaJZnkJ7YXxcFaw=; b=lKjbunmzV4pDb5
	NRV3hoZQTuObCFnZhgq+Mc3GKFwZKebbwEgmfFIZeNFSMOcuY0lAiUP/MFLQhHjbWxFF76/gNzsV0
	y6i6LHyWXBp2HWzdB/q7S8NsvC+aH0071oixUiQdqA3usRzTO6ihn6dxywW7fitFxJaW/6NNXs5ea
	qNmHqqg17A7X3CHwBwJADvrdiv/SU3CIh4/MDHv7qHXeXIMf01VpjhTv0MeYCOBSvEF+MLBxM5cMQ
	KPPkaVv2emfF7I/sq805ysINQrzeyCT/RCsnv6bzd2woA2u4JnTKn7NLWJgkAhcTH9JUOmm45y7fS
	cYcPi0zgS6QqK1p6ph9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkXkE-00CgRn-9b; Fri, 29 Apr 2022 21:01:42 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkXhB-00Cexc-Un
 for linux-mediatek@lists.infradead.org; Fri, 29 Apr 2022 20:58:35 +0000
Received: by mail-ed1-x535.google.com with SMTP id y21so10385173edo.2
 for <linux-mediatek@lists.infradead.org>; Fri, 29 Apr 2022 13:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=WdMZLLyeFXH4DfRi+UZF/9Px71nbw4EKe4mxmAdQ3XE=;
 b=aiwWjzigxT1KNBITjxe/E7mSEtUUrDcle5KjVvOFmddNHyAD4aMRzA7TfmPHRzetfv
 BmYusvLYKzkBonGFUmPto6rulyiCkLIeiF+7inhSj6sEIaIVP66AbxBS+mX7qEEfwd6Q
 cuDpkJ4LfEiCqVPnSkd4DXo/pygJ3+SQF89PF9wyr36F4Qj9EXiQUs8oQ/YstGQgvQFq
 HKZM+i/EmcELGgB+h+S5QIsEMxLA3rKpi/XIY5TZblTbEDEE2Owa/hembdAvo8j9EAc1
 60pl4mV8l6d4DRbpkekjaalv3keKuDKXiO8HrnH6dssi67YoG46CqB/OOYVMtXEq3Ubg
 dYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WdMZLLyeFXH4DfRi+UZF/9Px71nbw4EKe4mxmAdQ3XE=;
 b=uoEQCGZsCCHwukva79W1MQvoYVwVZNTLDhUlL2m42fBV5bm1BK1r2ON0wBNmIFIVDx
 tVpQL8UtvumrgUeHEHmRj+BJ+1Ovz2xr5on5B/jvlonbvc2+DLTKEOxpVo81LxdKYo0A
 +6wpfqqEeFgvGygQpnkdS3L6WkzsLgI+zvT+qKTuzDoCX1e5rR/SX9r8itOQEf1GSEVG
 ZkiFlzrlAslSwqSrziSRD0rxKFFYy0YlkY3PLcrPHE9qGEJsT+CcKVFxZuAFo0aCZAMT
 P/814keeb/iGbkWn0z+/YHsoJAMuLXdUiCPghKTuVYc3IQ+uQ+3Lqqwhd6aQvuciPWIW
 VaTg==
X-Gm-Message-State: AOAM5338HDOkBK6+jhEBV5Nu4qsmipxUE0tcdaBWJB/a7IV8vsDWomK7
 mlFCxMEJcKplS8FfSIxC5HI4ew==
X-Google-Smtp-Source: ABdhPJyL87eFc+6S28m7X+Br7uTwfCfUX3HCGnFdomWPJcEwY16SQ7u+cZALCnMnkw77uXqxOmKAQw==
X-Received: by 2002:aa7:c318:0:b0:426:4aae:de6d with SMTP id
 l24-20020aa7c318000000b004264aaede6dmr1169671edq.208.1651265910467; 
 Fri, 29 Apr 2022 13:58:30 -0700 (PDT)
Received: from [192.168.0.176] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 en22-20020a17090728d600b006f3ef214ddesm978670ejc.68.2022.04.29.13.58.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 13:58:30 -0700 (PDT)
Message-ID: <63ed8d74-4e84-4486-25ca-58885d343215@linaro.org>
Date: Fri, 29 Apr 2022 22:58:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] dt-bindings: arm: mediatek: mmsys: refine power and gce
 properties
Content-Language: en-US
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220428012715.2619-1-jason-jh.lin@mediatek.com>
 <b7bb228f-751c-e7ad-a695-3dc40d889a72@linaro.org>
 <60338c26047f47c77fdc7d4eff6a7dee43853e1b.camel@mediatek.com>
 <9779588a-5bda-ea82-64a0-c13d48d89eff@linaro.org>
 <0a43e9787c8e4886b361268a58e755afbf81be1d.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <0a43e9787c8e4886b361268a58e755afbf81be1d.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_135834_038006_1B7349F5 
X-CRM114-Status: GOOD (  12.95  )
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

On 29/04/2022 09:54, Jason-JH Lin wrote:
> Hi Krzysztof,
> 
> Thanks for the reviews.
> 
> On Fri, 2022-04-29 at 07:55 +0200, Krzysztof Kozlowski wrote:
>> On 29/04/2022 06:10, Jason-JH Lin wrote:
>>> Yes, we cannot have infinite number for this, but we can use not
>>> only
>>> one mbox channel for one mmsys.
>>>
>>> Its maximum number is equal to GCE HW thread number.
>>> The maximum number in mt8195 is 24 and mt8173 is 16.
>>>
>>> But we currently using 1.
>>> So I'm not sure if I need to set the maxItems for this?
>>
>> Yes. 24 for mt8195 and 16 for mt8173.
>>
> OK, I'll add maxItems: 24.

and 16 for mt8173....

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
