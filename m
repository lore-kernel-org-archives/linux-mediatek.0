Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B31FC38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 19:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYs6O8sCAd1Yea/9WK36sBxcxzTYhp16dbjeEkQIpvU=; b=i3U3Fj/4VACiy/mmcxouyETE3J
	CiB02T5caslgLoIqhoh+n1vHhTLLoCQmt5BSLd9DnH0sCBGu505dCK4NvjxMrXR9f036okP0mJTEZ
	R+RXZ+k0k0WCXPGtyl2/QUxXee107w4PghHKW3thQZ+nVe0gsigHKlZ3s6pOFDU9pW44w1uYEr0q6
	likK035//jWe7MNdMJRVg6HD2+rcukgUWxMFCf+7bmycoL+aZ+8ibvzvDzYDCy5cVmzcpWI2sIQ8Z
	6cMk1Fd+9maLHKnduLtyvIwJl2yWoBsD9kJwHuUyNspnx2W0G/F6OLSCHaA4dtQczM9KY3WzgkRe1
	UET8B2ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooVVC-00244G-AM; Fri, 28 Oct 2022 19:58:50 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooVV0-00240l-UN
	for linux-mediatek@lists.infradead.org; Fri, 28 Oct 2022 19:58:40 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id i12so4785659qvs.2
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Oct 2022 12:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aYs6O8sCAd1Yea/9WK36sBxcxzTYhp16dbjeEkQIpvU=;
        b=GMwYTCyNhhvxL7M/8H28CG0ZJZqJATITghpAohr48TgXSrx3Cu1I7QCnzflAzm6xMO
         FZH8VttvKhVCKQSnR9yKqX2drTx3SWnxC74QoeqtF8GS8MKmBB9eosThRRDNFM3uHVo/
         b/QFfRWO43LecZMRbb76uakkaqUIzlaWRDz6q9UmY7Rd9yG5PtMJKdBJqUX31m0rY6OY
         1HyDjAKhzCOjv45RROuNzYFACs4dNxVyGdqjZWnNrmiBu7opy4x67c1tVcg4lI44nM3E
         q+9BUiY5/7PIGSeomrwHNJaF13Cq7uD/sgxXQPmx9B2hSM2X1UzsM+DTjEx+12hrUHYT
         g2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aYs6O8sCAd1Yea/9WK36sBxcxzTYhp16dbjeEkQIpvU=;
        b=tWLWCTs52phzfX0ph6sQ50SWbFjGWZfef/I6z6Q9d4mpH7x9ptvDMawG+hhu/M89aP
         rgHxeRUwpadK6Q7pcl0v16JCJ/p3A52rgHVIOLZuPfD/NbMgqoO2n1zGl0f6gZJNjeeK
         +oXM2uagUNTf18NX35gfg5kuK5+VHVLpVop5rJp+7eAb1HN04V5unUvEk0p/+hGXqAoj
         y+9gH9x+L8L31Zj/gkgDv52uAiP6iedAThtK6eEhebquN6l7XveuRIvF2v1wAoMDLK8b
         d4oG38WSSzBBCiK42DDJpyL1Q7QlU3XjeSjJzYuPtHXzDrkVG0pXZ0xA10yzLZIEkLV3
         Teew==
X-Gm-Message-State: ACrzQf2o8ydEGbdZxpva1VQ8ASgI1qSX97LpuHoW7UtHcCAF5ih9XLw/
	Dktr6N2le/RXLaN2uVpNIavRWw==
X-Google-Smtp-Source: AMsMyM7kbGKg2LoTa5P3PUDyV55VGglhVevH4tQbikcvGoq7PA2E2HJpNHqhq5Jo/rwv6oEktoHLVA==
X-Received: by 2002:a05:6214:2301:b0:498:9f6f:28d with SMTP id gc1-20020a056214230100b004989f6f028dmr985433qvb.5.1666987115862;
        Fri, 28 Oct 2022 12:58:35 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id s13-20020a05620a0bcd00b006cf38fd659asm3594556qki.103.2022.10.28.12.58.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 12:58:35 -0700 (PDT)
Message-ID: <f5bf36e2-5be2-cec9-510d-bc99bb9b6bda@linaro.org>
Date: Fri, 28 Oct 2022 15:58:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v4 08/13] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Improve pinctrl subnode and property descriptions
Content-Language: en-US
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221028153505.23741-1-y.oudjana@protonmail.com>
 <20221028153505.23741-9-y.oudjana@protonmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221028153505.23741-9-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_125838_983148_35156165 
X-CRM114-Status: UNSURE (   8.94  )
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

On 28/10/2022 11:35, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Change "subnodes" to "subnode" in subnode description for better grammatical
> accuracy, capitalize pinmux description, wrap all descriptions at 80 characters,
> and remove literal style indicators from descriptions that don't need their new
> lines preserved.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---

I propose to squash it with the one changing description here.

Best regards,
Krzysztof


