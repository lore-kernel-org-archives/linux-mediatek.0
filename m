Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54243C77B60
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 11:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdOj0OMeU7Kbl8/Cm9oHj9tDRqlIG6IbeRXc2cStlMw=; b=0JnZpe+fObQKA02ocLE75pKkmM
	hLji56k7UgUakUBL5TA4GDA6IRn/1k5C+l6YmXA/QJrABdE12y4BOwJBcsrm0AbYs0uUbQAq0lVhI
	sVZ7olxQrekpf2nDKRTKfYBbvFEaCFF1Muj7b3JyGsrhXQFPj3ahBlgq+6kHCitwFIjvCCEfywbm5
	ZM7/zko2LcxwqOdM3MWjVjZRePtJd4XoRC0u3azzPqevRty8XmVrkVejZ+1h5JDKz4ltCFHJzguet
	O2V06J1+WxbkPmSn1nBTcMd/D4yfLDQCcZqMiahc3/RQaouSW96mQ+kRlM7CMh7KpER4z5uXMFvIb
	hLtONTtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk1Zb-004JFq-1Z;
	Wed, 05 Apr 2023 11:45:07 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk1ZZ-004JE8-2H
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Apr 2023 11:45:06 +0000
Received: by mail-ed1-x535.google.com with SMTP id b20so140330425edd.1
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Apr 2023 04:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680695102;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HdOj0OMeU7Kbl8/Cm9oHj9tDRqlIG6IbeRXc2cStlMw=;
        b=NKmDsnNLZ3F0old3NSU1c7NOt0hVPF2Toy47D2sRrnopr1pKfLLPb2ypDdJq0GJ1Uf
         +wsAVy5NM8X52W2XPFzfZ7Mc9rq/Yu5El40Qyb7zix+r6/h+eFsUEXxT6YpfUjaWsG5s
         qbtQljxsxQiF++LKdxKl7Pk+k6eIyirMeQCPqExOMOXA9yMVdIl+JctOH7vl/fDpp7uj
         zCkTVrotcsdMN18M50p1Kl0Rqc015RQAfUgPf5uHOTIwZ8AZ6YqK8O2Z3JJPP2cdLrkw
         feuBEeM+KR5u8z8FN/+iJ1jUZquOE3frD42EPmgTLFtml7aVpcHrEp/2V+xWH8AlQjzn
         gp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680695102;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HdOj0OMeU7Kbl8/Cm9oHj9tDRqlIG6IbeRXc2cStlMw=;
        b=yo9lqkXAqQsuceWPYT0t05ruzGCO8qNoJlZFFOjyrjU5OwtpVvWfvmqMZVCmKQx4OD
         3SoMdvdlRbBDuCZ+qsTA9SyCNH7qvXOBB2gRFNjUZyQW1DjtR4u/1+txK601K6gw3EDP
         lBzXcSlPbTDESbr/fJWuhpLtepEneG8ECzIsTldmGuIG4ITd8FxZLQ7yCDahuiSf52Lj
         oySzNXsm4SFqtqOCP228GHrYwVJHm+I+Lz7PyZPDBJQMkKXlN27IOUv1QiI3KkJ++H2b
         Lx4NkmD9L7xZ1TsHGHs26J2j0pE7z4OCijMzLbfM959Fle5aHcgMC0Z+/J/yj39rMAtS
         zlJw==
X-Gm-Message-State: AAQBX9fsnZTppWMlF3MYY6KbXWKcweCztouDpY2LxsQ9HqqZkaerJ00s
	YvjDZ//h8y9ZChAxjHIdlGyiYw==
X-Google-Smtp-Source: AKy350bRu+tmVuaScuqf8Ece0qNIue1RIxkN5PZaZQ2LzbqpKMd50l/+nnydW76AKtuw9oEKpqZB4A==
X-Received: by 2002:a17:906:85ca:b0:933:dfca:1716 with SMTP id i10-20020a17090685ca00b00933dfca1716mr2736541ejy.26.1680695102703;
        Wed, 05 Apr 2023 04:45:02 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:3f:6b2:54cd:498e? ([2a02:810d:15c0:828:3f:6b2:54cd:498e])
        by smtp.gmail.com with ESMTPSA id um4-20020a170906cf8400b00928e0ea53e5sm7239617ejb.84.2023.04.05.04.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 04:45:02 -0700 (PDT)
Message-ID: <8fc3dd22-79df-32cb-c219-896eda8fa986@linaro.org>
Date: Wed, 5 Apr 2023 13:45:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 10/10] memory: mtk-smi: mt8365: Add SMI Support
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
 <20230207-iommu-support-v2-10-60d5fa00e4e5@baylibre.com>
 <9847bc48-c96c-3599-e876-bcf9ebf1522e@linaro.org>
 <CAFGrd9pBdaHLGUZHkaz2_XKafyX=dxu9UckQxrphg52EG=A1SQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAFGrd9pBdaHLGUZHkaz2_XKafyX=dxu9UckQxrphg52EG=A1SQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_044505_751586_9DEA8DBA 
X-CRM114-Status: UNSURE (   8.55  )
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

On 05/04/2023 11:53, Alexandre Mergnat wrote:
> Ok, I will move the driver patch before the DTS patches in the next version.
> 

Or do not send it together at all, which might solve your dependency
problem. According to your cover letter I cannot take the memory
controller bits, so I am waiting for dependencies to hit the mainline.
Alternatively I will need pull request with stable tag.

Best regards,
Krzysztof


