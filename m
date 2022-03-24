Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8637CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 10:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YFe5VkjekQoGwJL7g8RuP/ZJNN/21essR47D5fCVVyU=; b=H32e8//onfVfnH
	7YnDq8Gn61vwaQ4KovnFVdRiuW7AqFQYZcaCkLPD8whkC15QCwy6tjHaIfC9MpZ9uu4ZSh3LOMjVx
	hQtfIvM+3NJdBggFTG533uzew982AEeob6e71O/sWEUgbzysVVdIdfxByWZ2aKdO5q3m+IdMdgSDd
	AeXPcithzNDnbSiyzdgPiYOVU2C4UgNiZ6f/01H2SbS2xT7Guw0inbnlFllVm6CMxaZOoQmLfD+2t
	vwdxXIKF3QWTD+kywT0W9xyrG9ByL+Bh7g+taiCpf4T/arkbYuIkIdIJwlxVcXlSdg43mxLQLjIO5
	Z415BwPwpInDc01Zvvhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXKor-00GEaB-2S; Thu, 24 Mar 2022 10:35:53 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXKof-00GETX-8k; Thu, 24 Mar 2022 10:35:42 +0000
Received: by mail-wr1-f48.google.com with SMTP id j18so5969685wrd.6;
 Thu, 24 Mar 2022 03:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Hl2300Q3yIYem3DeC+yC//jG0rxJse6f6bzV8oQgUaM=;
 b=EnsxKOTuwNjfkAkg8lg5mgWVckvmiDLy8XvHEjcY3wjmrT4OZxkewLaTm91fhGCHDW
 6Fr5ZsuqTY7AAL3si1ffJukOjy262J5DyhfTWwtnUMOjJwaCawXiOBnXiZcq9u9vI10m
 5VWo2puYL84rp43R6r1UyvQdGBOahuVNXIlUluvwkT1XXrgu3U/lL6VglRzq/yV7DqIo
 9CsYGiGnmp7hoFU/tIFV3p6r+TZC5WdJyGeYzFq6L2V+XVuJS3xMeoGU4VJbA6/5vnBs
 ZmiDmpWMZFXAmoBpWRh40gZGb9AK0fTGvE8Rdm9iV7iRdCWY8EfmeS/0SQOWZlzNrcdc
 EuzQ==
X-Gm-Message-State: AOAM530xVNHcbNDe0PJ30FdW6I10t6YJDw3XCZJG+zF1hV5fyP7N3xjE
 2I8Her2AjAXVC473ZI7bF5c=
X-Google-Smtp-Source: ABdhPJwANYW3gavd2FfSPJq7cxASPsyPRneOA9YZPkOtAZJvpNCCGUbBtreV69ExMOluQQWYohSkSg==
X-Received: by 2002:adf:fc47:0:b0:203:dda1:4311 with SMTP id
 e7-20020adffc47000000b00203dda14311mr3975119wrs.301.1648118139226; 
 Thu, 24 Mar 2022 03:35:39 -0700 (PDT)
Received: from [192.168.0.156] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.googlemail.com with ESMTPSA id
 z18-20020a5d6412000000b0020400dde72esm2233790wru.37.2022.03.24.03.35.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Mar 2022 03:35:38 -0700 (PDT)
Message-ID: <18c791ce-059a-87a5-eaf4-057f8e232fe7@kernel.org>
Date: Thu, 24 Mar 2022 11:35:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/4] dt-bindings: cpufreq: mediatek: add mt8186 cpufreq
 dt-bindings
Content-Language: en-US
To: Jia-Wei Chang <jia-wei.chang@mediatek.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, fan.chen@mediatek.com,
 louis.yu@mediatek.com, roger.lu@mediatek.com, Allen-yy.Lin@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@google.com,
 Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
References: <20220307122151.11666-1-jia-wei.chang@mediatek.com>
 <20220307122151.11666-3-jia-wei.chang@mediatek.com>
 <d5c5e3f7-7f50-6c57-f82a-41d5494ea514@canonical.com>
 <c150e9ed7faa4c06f55f7d7623655b65c8575121.camel@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <c150e9ed7faa4c06f55f7d7623655b65c8575121.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220324_033541_341617_FB7340BA 
X-CRM114-Status: GOOD (  13.39  )
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

On 24/03/2022 10:42, Jia-Wei Chang wrote:
> On Mon, 2022-03-07 at 19:59 +0100, Krzysztof Kozlowski wrote:
>> On 07/03/2022 13:21, Tim Chang wrote:
>>> 1. add cci property.
>>> 2. add example of MT8186.
>>
>> One logical change at a time. Are these related? Why entirely new
>> example just for "cci" node? Maybe this should be part of existing
>> example?
> 
> Yes, the cci property is required in some SoC, e.g. mt8183 and mt8186,
> because cpu and cci share the same power supplies.

I asked why this cannot be part of existing example.

> I will update the commit message and add an example of mt8186 to
> present usage of cci.

You added the example here, didn't you?

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
