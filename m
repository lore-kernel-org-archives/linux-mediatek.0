Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BE0FA3742
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 13:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DXI7ttHruh1sJniS6TpJJRJcjXoXJ/dSqy2SyC1F0VA=; b=YXCEMFCMwBuyfXVJSpfIG2GKlr
	mxmsO64GC1nsg3w1PQ4FZbT8d3+zKjM4tTrNbZOwL6m4+Lbn5Y0XaN4/2PtGqhAz8atmD15qZpS9d
	w4ihteQC3iGCjTQIbpadWODwsJZCgLHKscWmeFb9N7ovCfiAZ9H+e6IX3sCvz2cNV74tIlnXcb9J5
	aoQ7dVcA+rBkqe6EWKpslm/EV3igwdaMW1Mie7MmC7XHe1Vp3n1fm+Iy+Pte6Jq8f0j5nHO3jy4NG
	aRvoDc+a98pjdQmsNqiXONKN63GjNlb2zqoWCPraU9zpeJdK1wwwffDcJJTOqJHg2u8bzvHDrauky
	QxuupVEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo3Bj-00DeqI-V7; Thu, 27 Oct 2022 13:44:51 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo36f-00DbYO-TQ
	for linux-mediatek@lists.infradead.org; Thu, 27 Oct 2022 13:39:40 +0000
Received: by mail-qt1-x829.google.com with SMTP id a24so1078566qto.10
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Oct 2022 06:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DXI7ttHruh1sJniS6TpJJRJcjXoXJ/dSqy2SyC1F0VA=;
        b=kFiekM9BXanfNbGJ5MdCQMWLy47GZ83U2h7aw1Tkexy8Og4ISelKH6cwszpIaHA0Sn
         UXWTWABH5vUlkqWPV+WnKg9dzn4l7TXcALRIK7R8yCOMuFBVv0bGAKUeI7CcZEJdBRgy
         xb1YUGNzU1emvfumth2zWqCLpKT/CaY6ND5L0c38JMmy8alEEXliM2K70ggS868CB2iS
         zwPkkYPwAjSk9qUYiLG4nNRfpJRkhft4FTF0ql+xTLwAS/wdIYxaUhXx03+IptlDjC2P
         dRHoHCjmnjMseI0U9DEqBxqrhy8KlexvY8sxOHcxKh7lZJTXwuaUSJPGy9QbdUcYk6Mi
         +7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DXI7ttHruh1sJniS6TpJJRJcjXoXJ/dSqy2SyC1F0VA=;
        b=GRK5lVv+b7FsPF2vtAlC86vbhoAsqpI7NKfd7awZdgn1KNKvnZWA11GhIP4NTmXgik
         SH8zmRgPM05gq2Gq1HSiUF5BRxa52xvrPyVu3dCHJJUYjky1AtbsEQXJxxvOB96n9Rju
         KqGzpxh8UVMUUAfKJOPLBrPUupinKSyAzIRXOlWFYgazj+Y1u70UZBj0/kAPLwq5wUlA
         gtJpHTxL2pE2zbgjj/f/7DgOJREGtM5q0oY/uG828lAHCMu0dF4zkeAyFEiMoIrsSGpa
         xjjHf/EV6i9yYBsjj+Rs4W5zN8vmNKdvEoXNnRTCoxatf2GIRMUdgu5+fuTMqNyT5Qg5
         w+oA==
X-Gm-Message-State: ACrzQf1gO088QhgXmwReU2zc1JLyrmZfzuU6dehzrQXmpbIKr9L9R3qJ
	EAxOVvWOcYNhMqSUuzFddZ2BlQ==
X-Google-Smtp-Source: AMsMyM51EC06AFkH8LuvtXEBIHaCz7EHTGzSieB15/F7HnjFlhWODFvVB5sLxkSNNGmH6+hxPN3k2w==
X-Received: by 2002:a05:622a:1903:b0:39c:e308:ee1a with SMTP id w3-20020a05622a190300b0039ce308ee1amr42153049qtc.469.1666877975306;
        Thu, 27 Oct 2022 06:39:35 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id k25-20020ac84759000000b0039bfe8acff6sm887391qtp.58.2022.10.27.06.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 06:39:34 -0700 (PDT)
Message-ID: <0cfb3da3-99ff-31b7-d3e3-cf425296af67@linaro.org>
Date: Thu, 27 Oct 2022 09:39:33 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 5/6] dt-bindings: arm: mediatek: Add compatible for
 MT6795 Sony Xperia M5
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 hsinyi@chromium.org, nfraprado@collabora.com, allen-kh.cheng@mediatek.com,
 sam.shih@mediatek.com, andrew@lunn.ch, sean.wang@mediatek.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20221027095504.37432-1-angelogioacchino.delregno@collabora.com>
 <20221027095504.37432-6-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221027095504.37432-6-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_063937_967779_3D2FF593 
X-CRM114-Status: UNSURE (   7.09  )
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

On 27/10/2022 05:55, AngeloGioacchino Del Regno wrote:
> Add a compatible for the Sony Xperia M5 smartphone.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


