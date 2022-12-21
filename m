Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DADC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Dec 2022 08:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HGF2fhKsWDQ7WBFdpIdxBNae7b7JtegXaa6d/s2yVE=; b=erZwFP6mddh4xm+r+UjEH5S0ij
	eHpaJ90WqsMAg7tc6mObG0TAM2ev3nPMIcfFPQY0tr+pp2og9E2z49aAGLjtwKhaXbtoYGuaKO8Pa
	5qXBcxVbg/zUxSJomXOAbuKEXpT1eN78tNTHGkuS/ovwGgnVNXJZqsj/xkyz2lJKB6RmBDeUgKdZn
	tvfcYet2tqC1d0ZR5l2glforuG+tdzf2wGx774XCUXapMwkBHAnJEUhU4EXnkL4iW7ttEsF2p/zj6
	siKBHZUEm7uC91AgapJWiDidtRt3Yl/pbBVhRa4+RzeevhpBCu288rlynUKnAiYsaQxWndRlLnaFw
	syOgTzNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7uKC-00C4XL-JV; Wed, 21 Dec 2022 08:19:40 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7uJN-00C3ux-MA
	for linux-mediatek@lists.infradead.org; Wed, 21 Dec 2022 08:18:51 +0000
Received: by mail-lf1-x12f.google.com with SMTP id bf43so22354802lfb.6
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Dec 2022 00:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/HGF2fhKsWDQ7WBFdpIdxBNae7b7JtegXaa6d/s2yVE=;
        b=M+Rp7XMdR3phHvKr1+wBuW6TN2gVtY2vZvzAnvqfd8wDdvSbTKoRBjU26o6FUNbz2C
         I1lKWV1zWn7O5JoKqIiFLqEWVQzEeb4lV8kIXHvKu565IeZkxKJHpZxPrFoU/aqw8tdW
         VVwuiqIL4f6zuUQjNnaxhD4KcfFTTc22trow7bz62w7gcyj7wkWCXb4UrykSVjQlr6/h
         s0opHG9KD1G2g+t7Ldd/DRpVVIEsChEeHM7S/xk2FRSmtBX9McbronWg8+Xw99YuIWX9
         3aXfw1pseRu6e8kYwMzXS7sCr51ok8OlVPLZLtx0kE6nfiX0RvtsxeK+sbUi8+oo5z1A
         QjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/HGF2fhKsWDQ7WBFdpIdxBNae7b7JtegXaa6d/s2yVE=;
        b=gq29egAffDb2DsRf2zCGd9Wl5xJmZ9+6NUgYGlfZ4GTM/Ms3Vt8NlcLjIpeYFtqAqC
         2anBTo3YtOeDuz9vKQNjyyAahfyg/GDEwBIALGw+4i4yoSm6WeRDYmvp7+2B/Sy2MC0U
         hS3DN9GUeO4ms/YAAmpJk5sLSQY6Pia/TSd9cABW+m0In9Qu7sl/iAzAt7vgnFhkfifS
         qFI/630iq0HnCLN9rupYuFoK2OJBBLvKnD/a4Ly7EkxId9ubuqDIGM4Ke7ymrJtKmRBw
         QoSiXShaQmckTFzCZDk7PK+zGsyXhe2sMy43feBPp4PM0zXcW+GBxAm6BRpq1soSWpdg
         /YlQ==
X-Gm-Message-State: AFqh2kofoXPFcSstQI1emi6uLOjgoax+V3r5C+mlM8bwu7Q8xoAHmqOw
	t/dPZpb5RwnI2uG2fXpG5vxI0A==
X-Google-Smtp-Source: AMrXdXumkHpg5R8oY2pi3IoHZOyLAx2N7jkHqChZPKbE1dwJOyeB0Mhj8tdy//9McTUZadobH7VeUw==
X-Received: by 2002:a05:6512:2822:b0:4a4:68b9:60ae with SMTP id cf34-20020a056512282200b004a468b960aemr396528lfb.57.1671610727261;
        Wed, 21 Dec 2022 00:18:47 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id g6-20020a056512118600b00494a603953dsm1767280lfr.89.2022.12.21.00.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Dec 2022 00:18:46 -0800 (PST)
Message-ID: <6576a435-dcc1-af80-bbe9-dd98bb0d53e8@linaro.org>
Date: Wed, 21 Dec 2022 09:18:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 5/6] dt-bindings: arm: mediatek: Add missing
 power-domains property
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Ikjoon Jang <ikjn@chromium.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>
References: <20221221034407.19605-1-allen-kh.cheng@mediatek.com>
 <20221221034407.19605-6-allen-kh.cheng@mediatek.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221221034407.19605-6-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_001849_932857_838AC016 
X-CRM114-Status: UNSURE (   7.53  )
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

On 21/12/2022 04:44, Allen-KH Cheng wrote:
> The "mediatek,mt8192-scp_adsp" binding requires a power domain to be
> specified.

That's not true. Before this patch, how does the binding require a power
domain? Please show me the part of binding which requires it.

Best regards,
Krzysztof


