Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD52C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 17:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SdL5GiV2DC1988dtiJs28WBMfB4brw237QyRO+0QVt4=; b=tvNsJS/wUoFkhU
	NdCL1f6m9CsvnbrGca/nz5aEJCSYW3DX8MTwrUtVp/8OPDIN6TNWvvE8zKaQLB59DcAVrWKyG0WQ9
	hNFkRNpuLZtQt41QGP4HNNZr0xtwfmreDC9TCVyGfvIbtOeHebPmU5hfjGtqKfgLr4oMYy5fQeO5i
	A5HrAe8vTcszaDGoGlGzC5thrONkQ61uIvMnlHRLGUFvsIuvwSkaiL8xt2wa5W8CwrfPYMFBbllqh
	WBmInkvSoTvyBO2pcJ1glj8bQGdGXGcJZzvJxM0mwT/YERKRmWbNU7vxqI3gIFL7sheT+vxc5+ID1
	L6JquY1n8PxFLSm2vdEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhxBm-001oaR-NG; Fri, 22 Apr 2022 17:35:26 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhxBL-001oRh-Px
 for linux-mediatek@lists.infradead.org; Fri, 22 Apr 2022 17:35:01 +0000
Received: by mail-ej1-x633.google.com with SMTP id l7so17789929ejn.2
 for <linux-mediatek@lists.infradead.org>; Fri, 22 Apr 2022 10:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=gcGu16UtHNcJMaljpwgCxg9/Y7hdibwAAQTqTsz4orY=;
 b=m59yJ0YM+fTtTMluLJHSPbZqTKw2yrlcB7rn0kAAsirMZ9Feosc0T2CvLTs7UhrlFW
 ah+n7r8omYlF1P502KsWEICfSiA+2+qdIdX0vcv/zfEavG+v/SjIpnhdAwoSp4jVwCCk
 DFa28zWCXST+X9xyeuqKsbcAo88ZFLsGfC+BJ4SUbpXRKdaQeiUcjDMn+ZtjwO9treEc
 mtGTXyDzS6+fkRCTsSj3pvi3aO7Rz3mZV1FJVcNSVJ7LaUUWXmeuFZUGhP/0+tpPV8AG
 VEwsfOPspe+Qd9eWy1YF4dmuKf+JCIiXrBM4817HsVs2bUR/YuO47NOFG55yXMDt0b5z
 he+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=gcGu16UtHNcJMaljpwgCxg9/Y7hdibwAAQTqTsz4orY=;
 b=zLsZ2BksfGYTuSLSrpVtpfoVfqksgSfE7Hx6ENVK56NM79B2hNmi8vKY7HdvDHbTCK
 dFqp+X6D6fZBG3sJRnfJnzotphNAuCcA+JpcTqTsD2hayz6pJ8tkef6kuS10han9yzhH
 OoXOhYnsRzxj7NZGj2pnPWspslKZMviazt7TImNCycORp0Kx+lQ94LbYM2W2BAwx7l9o
 D5hOFRhXvhO3REdtLtPowIhfm3Z1+WISHVRpRC/rQMkN8CYq+A/UZDx/xM7eNUSdQ3DD
 ZTans/9nbsPrSKxjJFvO3T2rLHyxzOxGJQ51mw3ziZM2rrjBEpCDlqc6SS3LKfr4ALrM
 MGTw==
X-Gm-Message-State: AOAM531L3g0QpZB2Ci6UaT7cnHseplUhMOnV2viNG9sTgLCP6vlMch3w
 ZGbpzrZ81yBepU0bdoAo/ZT3Mg==
X-Google-Smtp-Source: ABdhPJzFbgLTY01c3uCTHOltXeHcVv4qu5BdqenO4C1F1MyF3ijzLpR3KfjJwJ6gjX4Kgph3GoN0pg==
X-Received: by 2002:a17:906:c14a:b0:6e8:76d0:e0eb with SMTP id
 dp10-20020a170906c14a00b006e876d0e0ebmr5030477ejc.412.1650648894899; 
 Fri, 22 Apr 2022 10:34:54 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 jr16-20020a170906a99000b006e4c05e8919sm950871ejb.35.2022.04.22.10.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 10:34:54 -0700 (PDT)
Message-ID: <811bf944-a230-ab9b-583a-840e57af8a1e@linaro.org>
Date: Fri, 22 Apr 2022 19:34:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V4 01/14] dt-bindings: cpufreq: mediatek: Add MediaTek CCI
 property
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: jia-wei.chang@mediatek.com, roger.lu@mediatek.com, hsinyi@google.com,
 khilman@baylibre.com, angelogioacchino.delregno@collabora.com,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-2-rex-bc.chen@mediatek.com>
 <f2e5a34b-ed02-91a1-bc7b-fecaa95e227e@linaro.org>
In-Reply-To: <f2e5a34b-ed02-91a1-bc7b-fecaa95e227e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_103459_880671_5435E551 
X-CRM114-Status: GOOD (  17.46  )
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

On 22/04/2022 19:26, Krzysztof Kozlowski wrote:
> On 22/04/2022 09:52, Rex-BC Chen wrote:
>> MediaTek Cache Coherent Interconnect (CCI) uses software devfreq module
>> for scaling clock frequency and adjust voltage.
>> The phandle could be linked between CPU and MediaTek CCI for some
>> MediaTek SoCs, like MT8183 and MT8186.
>> Therefore, we add this property in cpufreq-mediatek.txt.
>>
>> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
>> ---
>>  .../devicetree/bindings/cpufreq/cpufreq-mediatek.txt         | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt
>> index b8233ec91d3d..3387e1e2a2df 100644
>> --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt
>> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-mediatek.txt
>> @@ -20,6 +20,11 @@ Optional properties:
>>  	       Vsram to fit SoC specific needs. When absent, the voltage scaling
>>  	       flow is handled by hardware, hence no software "voltage tracking" is
>>  	       needed.
>> +- mediatek,cci:
>> +	MediaTek Cache Coherent Interconnect (CCI) uses the software devfreq module to
>> +	scale the clock frequency and adjust the voltage.
> 
> Devfreq is a SW mechanism, it should not be part of bindings description.
> 
>> +	For details, please refer to
>> +	Documentation/devicetree/bindings/interconnect/mediatek,cci.yaml
> 
> Since the file does not exist, I have troubles reviewing it. First of
> all, you already have "mediatek,cci-control" property in DT, so why
> using different name?
> 
> Second, it looks like you want to put devfreq into bindings instead of
> using proper interconnect bindings.

Actually judging by the driver this looks like some
device-boot-time-ordering, so I wonder whether this is a proper way to
express it.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
