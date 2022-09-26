Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9BEC07E9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 09:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=goc6PkT5m1P9sof9+UJf/eV/J47j0G84vgW/lekQxV8=; b=bnvhLZnqfK8H9CXMmSms7IZgjS
	FCmUrQaabiQC7wdQUa1v3lT93e0ghSBZzRtdqw68deBXnD1hDyv+J1bgzCJh3ZBCxhvBPHORXswrj
	cDoW/ZY7TcsVIGO5QvEp4GmstDziu3ZFHY1qI+aw+ou0FEnNMuoupFLZNuLp83s2TtRJER2zOdI18
	lhqJH7qMRdZXega+qFChXKprXcM37rJGe9ulI5GmE1FFk6U0k2wDCGnnmkwHJc+hOJYbezfMTOfjk
	PSrmV+JJ1vWzFzGx/aCNVdV1wjpOH4ivbjZcOXoMcKpE9j+q/at8aJ6ESjUgfo8FFsGx+CrVvBtUT
	SbWNHCtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ockKi-003ayV-BT; Mon, 26 Sep 2022 09:23:24 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ockKc-003auI-J9
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 09:23:21 +0000
Received: by mail-lj1-x22e.google.com with SMTP id j24so6714880lja.4
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Sep 2022 02:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=goc6PkT5m1P9sof9+UJf/eV/J47j0G84vgW/lekQxV8=;
        b=GIC2DbN3y87NHYbRBWxz9PgdwQ6FEZkjUI12TMcgFoqNw0Ha2n1EpIyNUGv7y2vGUA
         qrkRBp7t4ZaeBJm8yVs+4q2t2xI/IXzCG4IWGsLXAl/862w0Hn2L2oHIRaOmsur7NsU8
         RScuWt7PM8ant0LNXv4DjG8D7INyhVqLzTcyow5FbksX1oOuGQYjeVHyYFzDxpl1CRa7
         WPK3nT7A4jl2vSmYgHwCoXgUmQXUjSoLD0GMbaWusCyhhyWR2zkVejzgkZ8ec3G/SL9c
         QAiKVfNZ2amFSUqADSlrgNyU8xG41rtNnNVSunT9nXqXvGtIKKMoHldljhjviEgO1XLD
         N4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=goc6PkT5m1P9sof9+UJf/eV/J47j0G84vgW/lekQxV8=;
        b=M+AgCbvr/4ZXjeaX3dXO1CpPwVRorTmj1gKY/CcuFd1RHI3PxCOS9DVElkT76CIxN5
         LVB7EC8IGgZ9+NOBs2AKGvXTcQdNdgxg9irCzgM2qQSrdGrqYxoPgcbqWsx6st3UBj4E
         8/MMgPnoDCBuNyqw6WV01rSz/lTWEFpHOnfN00cGt/WGB0Pq0/7fXb9VnMNXpT65nb66
         c8DS9jmvkKopMr1It+mD+szC3SFFBStCRlylUp2zD/XIN1y19KTCU5NutxqY7Vl/TW+e
         QT41Q1PPmpHgosXEKEMY4LmYN+qySws9bzxT0wjrQ6JYdPXuPPtCSOvkZNp6mQSIzHDv
         7Gqg==
X-Gm-Message-State: ACrzQf2H9cZFCb1xo0TVy8FUSrb5HApivZOpRSqir2+9b4ujqLC0uYNL
	P14MVGSFPSg3JheTRygsmeZziw==
X-Google-Smtp-Source: AMsMyM7G0RdidG+n9hog4aSXdwdlwpRd2hv5uqsZGByfjwBD4Msi4qq0KH2y8EthPGxEXM2x7H0xhw==
X-Received: by 2002:a05:651c:221a:b0:26c:6fe2:c146 with SMTP id y26-20020a05651c221a00b0026c6fe2c146mr7198207ljq.284.1664184195964;
        Mon, 26 Sep 2022 02:23:15 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q14-20020a056512210e00b004972b0bb426sm2481294lfr.257.2022.09.26.02.23.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 02:23:15 -0700 (PDT)
Message-ID: <c5ee2888-dabf-e3a6-acca-517ede984002@linaro.org>
Date: Mon, 26 Sep 2022 11:23:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2] dt-bindings: phy: Add compatible for Mediatek MT8188
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunfeng.yun@mediatek.com, kishon@ti.com,
 vkoul@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1664183509-29473-1-git-send-email-xinlei.lee@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1664183509-29473-1-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_022318_663474_6947FBFD 
X-CRM114-Status: UNSURE (   8.46  )
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

On 26/09/2022 11:11, xinlei.lee@mediatek.com wrote:
> From: xinlei lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of dsi-phy for MediaTek MT8188 SoC.
> 
> Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


