Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A57C32774
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 11:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/Y+SW+sDFQrxU5iGkzgHTDP+ZT5UJ6i53/083eyQJg=; b=CO3uKoxYfvjnibgNF3R3kTTPC9
	lhRJt2Nxmbk4jPboSTc287wwcZHTKcJDiRsQOfdRSusZIORgM+Zxw7e/wMaeXDnV+sG3v5XH1gWI6
	LKVZ4vGnMTqS3jVOIhr1edUQ5cpbbk1UjWHG5NhVtYbYL7kSVXtcUuNO1mBetLySoVqT25ClJZuZL
	+1vPzXSrjp0p7KNPH8htqb19Sx8pROyv3MnJxirT0BukVF+hR7ma/NDRXEF52rUJpuHGuZBHj5C1V
	FFIXQ3ITBnQgdAy5/taZfEFShyzZfqF1l/lNwst31q2ivHIumF9v+5NOFXoMJI6AaZXMEuXymeWZ4
	JxxF2eRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQRuw-005IBj-Ib; Tue, 23 Aug 2022 11:17:58 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQRus-005I8Z-7y
	for linux-mediatek@lists.infradead.org; Tue, 23 Aug 2022 11:17:57 +0000
Received: by mail-lf1-x135.google.com with SMTP id l1so18676185lfk.8
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Aug 2022 04:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=p/Y+SW+sDFQrxU5iGkzgHTDP+ZT5UJ6i53/083eyQJg=;
        b=MrDQbeNHyc+pRDxnzFQ91jU42y8YNo4YNnlkpgLoQaXpcv1pX5XNX4Ql8pN9555LXy
         Ko2Ml8/H09TKZPX7AuENC8+/Vgftma2mrEv/Jn/vII69uueY29XIsrqc65IcC2uA3pMA
         6OXK4J602Y6PV57CqlfT0ZjquvSfL/HvjizICTyTDgFOA5zBQkChkyn4CyTPCIKt6ZdZ
         JeNr1LUxwfKESCglpaPg3wPK3/DnoX5wOgqOuxc94JLgBpy2VGmfMk5gLb1hoddHCgFi
         JRnhj09DhvvzKsOSTnbjMXApY1lujQJxBRTQM3Vk2XbYEZwiv3w/0C56k+esW1JNjvy1
         s4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=p/Y+SW+sDFQrxU5iGkzgHTDP+ZT5UJ6i53/083eyQJg=;
        b=kJnvP9QgOnecwAwxqvTCQXoakcAo/lR4sr5+6xx7RPFG0bzWLB9svgE03kAcl05gPd
         3FnESEiqKawM9y5kg21ybUhuQ3Ao2RgcHN8KVUJaG1A2AUYT4wGeVYRfteyQwlwCJW69
         ZGyqmqJcKPZRdaS/c9TbE7NwwX/qPrX2OUA66CixC0V6nOVo0pLHJcdaRIxsfiIjdtCV
         MNQY2+uJfrg9badjwVIJOMNA4JcjhdMJJppi6anAGwDqhmpzTqjM422VRVy5tmeXoLS4
         0nxo69fSCLrCiTKEnJTEYGGBXKBErsy07/mRlsWWiYXEuqP/tXKWPVKzg95hS121fvcK
         jjCw==
X-Gm-Message-State: ACgBeo3VgWU24v3c48nRWaV0K3jwufsWj6dQKkvlh0JmO74WcK2rzSfg
	4ZoRUHVpq3a4qb+RTDOEKZffOA==
X-Google-Smtp-Source: AA6agR7tqyK85+2o04GF7PJMNhOl687ZeYth/rV5QHCEWVFSRi8/kChXM1q2ei8VMMBa3JjYccngJw==
X-Received: by 2002:a05:6512:1315:b0:492:cbc8:e10d with SMTP id x21-20020a056512131500b00492cbc8e10dmr6406997lfu.41.1661253470590;
        Tue, 23 Aug 2022 04:17:50 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id z20-20020a056512371400b0048b27af9505sm1508855lfr.213.2022.08.23.04.17.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 04:17:49 -0700 (PDT)
Message-ID: <6ffc497c-5717-cdce-d338-65a8f00624d1@linaro.org>
Date: Tue, 23 Aug 2022 14:17:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 1/2] dt-bindings: soc: mediatek: add mt8188 svs
 dt-bindings
Content-Language: en-US
To: "jia-wei.chang" <jia-wei.chang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Roger Lu <roger.lu@mediatek.com>,
 Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@google.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220823091346.519-1-jia-wei.chang@mediatek.com>
 <20220823091346.519-2-jia-wei.chang@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220823091346.519-2-jia-wei.chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_041755_995221_8EDAC781 
X-CRM114-Status: UNSURE (   7.19  )
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

On 23/08/2022 12:13, jia-wei.chang wrote:
> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> Add mt8188 svs compatible in dt-bindings.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

