Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296F8C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 10:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pB620nkIl179NsMuvxPDMIYaekGIQ90Ax9kMWEkWZ4g=; b=Vg/ZDYTfX0NiQo
	XRGi7Hjt46MqHG3hVsX32fchw8SWIzPOevURhfGl9+sNxhSPV0p4yV9vFl7XGGZ3+XbucP/PuzIUS
	63ZwhsUPNNHGKd1kU5UVU2IH0tmrteyCqWnek+ssi4ACqrGcMuMtt969raraVlFNSTi+z7qX2J18B
	vLXUcmole1vO5YkFQxx/gwOYk7hW9U3FPCLpab+NC4yZFasF7T8B9qnkGp5dcsjar/QcJiWVkM0Kk
	5E3iEsgxWfP7Bhqegi5fD9KvFleAmwDz7caXQcAPmxri/EemVqmSlfPBVJbrbCSKatu7zGbKbcyR5
	NYG3sUlJ0riMLRL++GPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhqO2-00HZgo-DO; Fri, 22 Apr 2022 10:19:38 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhqNz-00HZes-2a
 for linux-mediatek@lists.infradead.org; Fri, 22 Apr 2022 10:19:36 +0000
Received: by mail-ej1-x62e.google.com with SMTP id bv19so15446145ejb.6
 for <linux-mediatek@lists.infradead.org>; Fri, 22 Apr 2022 03:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=kXcFFH5z+Qq976hXZFox/KSTDlgF6EIFrsS1pxqoR3E=;
 b=fzSho7fftnlfP6pm6gBKxMNmgczxN0xGRrvch89F48Ef5lSwiPZkoBlYcBQGYsd6yN
 uf5ZwrEPayELqr67sKmxMd7e7k7Bupu+uJyMB2V+NhxmNLVZfKrf+C/GSWj37YqMstOG
 SHzsIt6qgBXwEgHCPqKGaQhkxggpwOcCB5MGhXtbesTdsOiqtwVGZWPX+Wy4eVPHjyVD
 QPiiEucI5EKUignwPzeb3rFfeOZwgzijIq0c4CNo1THhrtLRczYOYswSCq/Z8Pz/Rq5K
 +PdEUm4lJr/AwVJ8kFIzogLe6pJOiuMJ/KAmCrnR6X/qrwqk7r3y6nLqxWbeoA501TJt
 +krQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kXcFFH5z+Qq976hXZFox/KSTDlgF6EIFrsS1pxqoR3E=;
 b=4skxL1iffDob+Lb4g8kGJEAQ1+pU9mIx9Gnoyy0aMdWBas7nKlGF/V7GvZk7dKw6eI
 ukogYDvg94cQcXyfX0F5Ra1FrzgY8Spx2ZVZM5UNJM5NOVD7UmmUy5nHv9eLVtUazPGX
 lPOaIAHju5NL1Z4ywL8D5QKJqIZvh4cYW6EDKTT2KaBE8PaP/3d8Q+cM/K3ScOtZnDSB
 EXel0Merwo7Xi5oUOGSNS8kysXFbPObXTxUaSI8/kZPxYtvQjHUl0nJQ6T7SU+TTMURy
 igxMB7qUk9IiQ3EvhAaUOQzwWeo5rE0YHZYkUs3emRuAyQTja31qHPaDabaR+9ODmvne
 VXdg==
X-Gm-Message-State: AOAM5334hpA9E8HELter5+N/Xt2yRMxseLWfhr2D8Nfs6fVam1zzhzbt
 +qvcXSD5372XB9oVwyKuOLeObA==
X-Google-Smtp-Source: ABdhPJzpcfN9v+Xc/2V8AerRTWsfjkHFGJs3Y9L5m0NP00FcGjDpxBiE0tR98fplIEFcypQ2+HP4Fw==
X-Received: by 2002:a17:906:28cd:b0:6e8:98a4:4ccd with SMTP id
 p13-20020a17090628cd00b006e898a44ccdmr3461568ejd.390.1650622773400; 
 Fri, 22 Apr 2022 03:19:33 -0700 (PDT)
Received: from [192.168.0.232] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 ka6-20020a170907990600b006ce54c95e3csm603058ejc.161.2022.04.22.03.19.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 03:19:32 -0700 (PDT)
Message-ID: <29fc53bd-1016-fe6b-0c82-6f2fbd8171ee@linaro.org>
Date: Fri, 22 Apr 2022 12:19:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] arm64: dts: mt8183-kukui: align SPI NOR node name with
 dtschema
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org
References: <20220407142143.293740-1-krzysztof.kozlowski@linaro.org>
 <165044570803.75184.17759035800452933385.b4-ty@linaro.org>
 <38f29c29-e3c2-240a-23a0-509c4febf1ca@gmail.com>
 <f7c5c3f9-0083-c0b0-dc49-e66139268312@linaro.org>
 <234d411c-1386-d661-71e3-f1f30f5cbf36@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <234d411c-1386-d661-71e3-f1f30f5cbf36@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_031935_190922_FE0B3BA2 
X-CRM114-Status: UNSURE (   8.78  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 22/04/2022 11:13, Matthias Brugger wrote:
> 
> I pushed it to v5.18-next/dts64 [1]
> 
> Let me know if there are other patches that you want me to take.

Thanks! I dropped it from my tree.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
