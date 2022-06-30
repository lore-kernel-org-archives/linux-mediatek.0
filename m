Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A041C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 18:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3PuKRPSh/SF/mxBY/1za++HjaAyQMFu7x1JJ22qYOXM=; b=uExKJrrOUF73vCoy42Ua48oENJ
	7htt46AcVxEXO7FuYF9jPQHCRcEbjnxo6tV3LdjlAOkkvwuuxdckJRqafc/9z5SkmtXG+vLJMfmup
	4zW4yukFwXAIKb622UMkq3K4qHFRoULfHFZ2ESjVsg/qjXhNNVZtR5neDltapTkV66JNXlBy2GUyG
	w+GFzG7kAblZT5AqfQgquAXSyy5JU9cqnrNwctmLTECCJpPYB3abYray5PtfQRw++tds6llmBvQMu
	E2lL8wc1YBtLW00cRKuuCWpt7hH54D9F2SUtFdXf/zLYPEMaQWpWeNvVoaFQIJIQlFP5xs1Yt8z1h
	Bne+Jzig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6ysQ-0012pI-BF; Thu, 30 Jun 2022 18:26:54 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6ysF-0012mv-IP
	for linux-mediatek@lists.infradead.org; Thu, 30 Jun 2022 18:26:44 +0000
Received: by mail-ed1-x532.google.com with SMTP id e2so8627edv.3
        for <linux-mediatek@lists.infradead.org>; Thu, 30 Jun 2022 11:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=3PuKRPSh/SF/mxBY/1za++HjaAyQMFu7x1JJ22qYOXM=;
        b=zZ/EeN3zeXi31IHT5fF4r2wtXa+gLWo3QARAfliuQE71n85cUS0mgowsaA2Lx9y2dK
         TgBc4uy7pjBVI5uhshS19E1fb4q7L9ekQ+H21QOe48C5owjGSHhN4VwxCd/Ke5ONnWlv
         cb1FeTYiL/QyieURcBAuVP/w4hXbtgy0DFqNyMFS+FOXZW/wpLXBSjlMzVV0Yfzrnpnx
         DgjRrZ+i5VQYuHztLw94rBdVaeUNSMqfw2PaEecSFrkamhdxzetr9gFBOMC4veCWUAGQ
         SnzBN9CFBxu9XNAkYnDIqVzrWgy2pIL5FaM0S3zr7UdVdmpPccJnvaNxxRGIXOvH/+dg
         iYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3PuKRPSh/SF/mxBY/1za++HjaAyQMFu7x1JJ22qYOXM=;
        b=SLs9dXSJ7z2kWb8MU7g8q5Eiy6t/wGvAkKunLzlrc4ZBEKS2EXzk5ErCAirAjUU2An
         hFmTaQ3va5iLIyX8UN997Vo8V4MCRm55CauSYWPjyjf99i3tk7FqhdbaGDhP3zvLcyeZ
         xeQmOGx4wHqy6QVzKzKUNlEX9x7tDNFgxNPERelanSX5VNd7ev/qoidEHYfshDS53iCq
         dn3pRYCeucXlYEApu2rCvokpasGj91DVUTDgPZFXUNBdgIUCrHmTQ+t3yAwt5EpPmgcG
         w5B2I4TwBk6xd2BJZePaJ2qxC/ibZBIYPZLL4e/52fxxhwX//VWVe4sPBcYO6VcWV+7E
         +Wmw==
X-Gm-Message-State: AJIora/nKLIsEby5sFJ6q+YRbhSKTFFCBqppOiHWYBPcet22sH0habgS
	M6CSAm9ZfLbOdkHiqC0BJpELLg==
X-Google-Smtp-Source: AGRyM1vxpcdirC6ssqEpjBo44u4Nv5ptVnTjPfoVH9pTB1R4a19Izads/YPO52H2pW4Q+/RBj4t5Og==
X-Received: by 2002:a05:6402:3514:b0:435:f24a:fbad with SMTP id b20-20020a056402351400b00435f24afbadmr12919908edd.311.1656613601340;
        Thu, 30 Jun 2022 11:26:41 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d10-20020a17090648ca00b0070b8a467c82sm9378218ejt.22.2022.06.30.11.26.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jun 2022 11:26:40 -0700 (PDT)
Message-ID: <86504cd3-71ae-32df-0772-e246ff5bd6fa@linaro.org>
Date: Thu, 30 Jun 2022 20:26:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 01/11] dt-bindings: arm: mediatek: Add MT8195 Cherry
 Tomato Chromebooks
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 hsinyi@chromium.org, nfraprado@collabora.com, allen-kh.cheng@mediatek.com,
 gtk3@inbox.ru, luca@z3ntu.xyz, sam.shih@mediatek.com,
 sean.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
 <20220630153316.308767-2-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220630153316.308767-2-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_112643_634193_1A5EBDAA 
X-CRM114-Status: UNSURE (   6.46  )
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

On 30/06/2022 17:33, AngeloGioacchino Del Regno wrote:
> Document board compatibles for the MT8195 Cherry platform's
> Tomato Chromebooks, at the time of writing composed of four
> revisions (r0, r1, r2, r3-r4).
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

