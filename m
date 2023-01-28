Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64293C38142
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Jan 2023 10:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YaOTMZCAzgKrIAUlQhEpyZEYtdqL85tdGpXqE3dUxAY=; b=1FbITiBHtJTBq0Md6NcE7D4RH1
	PRYNlec+VvVYfHwrq6AjPT+MJ9NP51mRl6wDLkO6pKxQuPCAMgI7oU3bZAX0ouIcREMVSLvSLXUuv
	g955jESbryeXtdqmIekWzMsJpODUFVX77KbtEW5AJiq28MRSHkwYRe8EKxB5PdDrSHK991HQHjsfX
	cWPa76G06id2NB80FGEzHAPmDbtHnn1EsDIGmtz/U7aXg6Pm8plx2MaFQXMOL/QZMCQAUUp9TN6kB
	Xb/4jMCTYg/9nwcshcYoiK6njTIa0tUemKA7AYKrXxW5HAULgw82Wc3+W0XwIaKT5zN65H5Jgd/Xd
	lpzPLECw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLimy-0002si-Vp; Sat, 28 Jan 2023 10:50:28 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLimv-0002qo-Id
	for linux-mediatek@lists.infradead.org; Sat, 28 Jan 2023 10:50:26 +0000
Received: by mail-wm1-x336.google.com with SMTP id k16so5083419wms.2
        for <linux-mediatek@lists.infradead.org>; Sat, 28 Jan 2023 02:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YaOTMZCAzgKrIAUlQhEpyZEYtdqL85tdGpXqE3dUxAY=;
        b=qOvpqV9opnMpa4pSBiep3eGvxDk1njLZRogz0l6TdkuXNfno63B1MfvYT7nIoSxmMN
         eS7BrQty2F9ViffyCwMiW6/749Q72JJ4ZZIMvYorbUakKI5AOzL3VhhLtRL0OB3pzubP
         5BnqKME5cqWxv3/0fKx61Lqr4hDqVLkZ/4iF4o+2DnNBIXN6heP5XzmgZkYu9cKMRuTk
         HUIezcG762YEnzTUvBUqSeu96gVtIOGFCmxpaxgE82y/78BnArdoZH23XtNre7qEvDtS
         YT1CEjkko9mZQatYkPUeUMkhijRKasPtB4K49ojbW7Ns4GtbaRmPFY7fl7pnPEFupm1k
         fAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YaOTMZCAzgKrIAUlQhEpyZEYtdqL85tdGpXqE3dUxAY=;
        b=K+YfVabLBVigF3EJio2mrlB/qJbpeZOZDiJBL1PIt+m2BScgMuYQHRzbRpJ3WsSZ5G
         MKncaIqt+xkxV4RdboTeQljuSs4EYvg2fj4NfyWNzJ9yfRqhK8cK2p3/zIxwqfa2TeYc
         ITv58Hylng8r5hwp1nLrkBmfq1E/JI+S4d7htt9ZNa4ZE/jEzz23g0fkn3iQUXmOXX+V
         1Ap4OD4172o2m/kHfLazmA6HIj5XMhraZaFpsh1G1+IGAwJ33UseAvlJS/wFKdLgbFHk
         OVxeok4zHF2v+D42MDH6KvHJFPI/DOx7G3dZlh/vIWYdieN9K7BzQaFZgWv3YKsAuA2/
         h+Ag==
X-Gm-Message-State: AFqh2krkuaoFXK21tWZzBjgX8kYrN77Mfqo80BzhkArqsLB60mOAyaPQ
	F0rtOW80Ov7qX19TrXoO3RLk/g==
X-Google-Smtp-Source: AMrXdXtQdBiLWEzmCwbTdL75wdJctW/pF0mG4rl7sNjikcyTEOXbOzQ9/BGPt7iBfP/i9tFYKnBUHQ==
X-Received: by 2002:a05:600c:3596:b0:3da:1357:4ca2 with SMTP id p22-20020a05600c359600b003da13574ca2mr44919912wmq.11.1674903023483;
        Sat, 28 Jan 2023 02:50:23 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id az26-20020a05600c601a00b003d99469ece1sm10620035wmb.24.2023.01.28.02.50.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 Jan 2023 02:50:23 -0800 (PST)
Message-ID: <b0b49007-7882-bb44-df26-8d2132b34bc0@linaro.org>
Date: Sat, 28 Jan 2023 11:50:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v12 2/6] dt-bindings: thermal: mediatek: Add LVTS thermal
 controllers dt-binding definition
Content-Language: en-US
To: Daniel Lezcano <daniel.lezcano@linaro.org>, bchihi@baylibre.com,
 angelogioacchino.delregno@collabora.com, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com,
 rex-bc.chen@mediatek.com
References: <20230124131717.128660-3-bchihi@baylibre.com>
 <20230126161048.94089-1-bchihi@baylibre.com>
 <2ce57abd-203f-04b9-f0de-8e524d6afaae@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <2ce57abd-203f-04b9-f0de-8e524d6afaae@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_025025_646431_1B5BC241 
X-CRM114-Status: UNSURE (   9.28  )
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

On 27/01/2023 23:10, Daniel Lezcano wrote:
> 
> Hi Rob,
> 
> I think Balsam took into account your comments. Is it fine for you ?
> 

The patchset was not sent to us at all, so it is the second version we
see. Therefore it's not v12 for us. It's v2 and it still needs fixes.

I replied with minor comments (which could be fixed during applying) and
the license concern (which you rather cannot change while applying).

Best regards,
Krzysztof


