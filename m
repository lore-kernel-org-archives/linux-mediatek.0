Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52099C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 08:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e+ERE0KIoScFnNn+zM8jJN/meHoLJnU/KJ0nScp1cAM=; b=o53t7VcK6hnx0moMrZgIwUtjWr
	6xpolHNay5oWDJLqAdoPkpHdPRCF5yca1SWVOFbf7HZaWuH0CxXG0r45vgv82mMd8Vz/2JSxVsbM/
	M2Hqg+KaPNTnytRJc8RNvfyVzHyZLGcZ/ztwPbZxjMZcpYiRmi3nXjQ35q88NP2Mn188kUiWOiloV
	7Zm+yS//NYF9inusVlNMu+vydkRu6hb9JgtvpD3C+EUNwFlBZA9hZKQttgnjDjCg66mFvwoZl90Jq
	ECw0j7HUus64Sl7k9tZx86eUUpsSf5LHzK4KS2VNlrtq8qzd+ZQ/3oQXIdmrW+RJsXyOEGyUBPqyD
	EaCEYlGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCGTl-005YMo-U1; Fri, 15 Jul 2022 08:15:17 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCGTj-005YKy-6D
	for linux-mediatek@lists.infradead.org; Fri, 15 Jul 2022 08:15:16 +0000
Received: by mail-lj1-x22e.google.com with SMTP id w17so4903499ljh.6
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Jul 2022 01:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=e+ERE0KIoScFnNn+zM8jJN/meHoLJnU/KJ0nScp1cAM=;
        b=ej3ctc4UQJ654wtTtLiTxBvgpCnZNLjLyuOrdNOd4+CszA6zehRmllfuaZyRbmchIW
         fBkyZGtvSC/ZH5Cqqs/qqQpp5QGpdeDQkpQ3unibnm79+FkU37BUoMSM6Ow9yQOMOSa3
         xX9sIIHxstIPDfNtEeikuNKW5bG/+RBrTvUU5nCWNiqxnbZQSm8p0/mFvaYqqug9jkMg
         gVul9xFyT+rmkbxV7/ysJLSv25941FpziMavn0n4MR+pUtrdUHj3UnzY9u+7RshYbrxe
         9IPYQ3QcGDIcPrhE8EkFnx0ht343qSG0X68toTsNL/ymMAY7OaTaenZ51p7VM0UWbSsw
         hRPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=e+ERE0KIoScFnNn+zM8jJN/meHoLJnU/KJ0nScp1cAM=;
        b=FGYQUhzoJp80t6vreyQYwGAYLN4xvt0CF6DHEVDxc2ZC5X/3yl5R/G2NiuCusR+9q6
         uFk4if7S/pK/ZNoEfwZLWpAMP9BeGoseurTWNeSkqyfwyQdqIRWCAWP3ZI0giNkyhwX3
         JWy6XSthMYz+sIYF6o5dFV/Vk8ZD8xzIf71eyOU2UnsPu3aRNEaCRcnEObn7ONLD1u2h
         VesfVhyE5oVn8qXdTfCa8pSFIQsGwca3CD87uyJWg3PiAbpNF/+OsOXroSf4uNzd0qrS
         p4g6RcrUrCOdacwU2v7+MyIgAIYycWbCoKvIeK4UnpfhJiAGScWOND8YNr6gfHBfoWd3
         qkFA==
X-Gm-Message-State: AJIora85X7Qy3l+gyWY+JTFjMd0hp4dO5Z++zQvJt7LHeNjp/48Guk6k
	y6Cm+UQmVkgdBn0GQAII4EZzTA==
X-Google-Smtp-Source: AGRyM1sMtUQaH6P6ehwbJuYCX/2dAmVEbQZVwJArYB54qbYI9BEIAead4/d8WxFm00HQoj3oVBoAyQ==
X-Received: by 2002:a2e:8719:0:b0:25d:7650:6c06 with SMTP id m25-20020a2e8719000000b0025d76506c06mr6336445lji.330.1657872913617;
        Fri, 15 Jul 2022 01:15:13 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id p22-20020a2eba16000000b0025d87966100sm632898lja.140.2022.07.15.01.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 01:15:13 -0700 (PDT)
Message-ID: <631560b2-58f7-064a-020b-d8029f04e451@linaro.org>
Date: Fri, 15 Jul 2022 10:15:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 05/19] dt-bindings: power: mediatek: Refine multiple
 level power domain nodes
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220714122837.20094-1-tinghan.shen@mediatek.com>
 <20220714122837.20094-6-tinghan.shen@mediatek.com>
 <c2e9f890-98c2-8f09-952d-495f2b57a254@linaro.org>
In-Reply-To: <c2e9f890-98c2-8f09-952d-495f2b57a254@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_011515_277271_7F269F3F 
X-CRM114-Status: UNSURE (   8.56  )
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

On 15/07/2022 10:07, Krzysztof Kozlowski wrote:
> On 14/07/2022 14:28, Tinghan Shen wrote:
>> Extract duplicated properties and support more levels of power
>> domain nodes.

Can you guys stop cc-ing all the non-working @mediatek.com emails? Every
time I got a bunch of bounced:

550 Relaying mail to weiyi.lu@mediatek.com is not allowed

and other like that.

Really, it's being since some time and it became extra annoying.

Best regards,
Krzysztof

