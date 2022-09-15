Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3ADEC6FA89
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 15:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=peWX2leln2ZSvGXaMu2OH9aKkEDXDvB9GSTH9krlino=; b=OWYsjK03U+YVtVfU1j1Jn/4l1o
	Yfbj2LQLUDSVvNM+66+dAv4YG6MhsOBk2bNODWkQYqI7Y+JCoS2jC3I1O2nVhQXtgvb/FvQdcK7zE
	yTYMw6OWndluvx2qt+J1FPQ6GTq0DisUoDITpX5Yn4BKl7SQRgyVSbdIonI7lViN2FnWQBpzc1u01
	/TucNKsbfrZli5gr/s/3Q2fiAVR8il0HT85I4gFwcNNuupKjM4hEzcjnSRRwu1FNlblOzRPdr7uem
	KFOwqt+uZ8KSJzRbMOrkXj1z7SkhT+lNdhw+ay2/sHDiOt3BxVErKd2P0ZfjMK5Z6dJjtzE8+/uTz
	r+f170mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYqpQ-00COMo-B8; Thu, 15 Sep 2022 15:31:00 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYqpN-00COKq-BK
	for linux-mediatek@lists.infradead.org; Thu, 15 Sep 2022 15:30:58 +0000
Received: by mail-wr1-x431.google.com with SMTP id bq9so31461761wrb.4
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Sep 2022 08:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=peWX2leln2ZSvGXaMu2OH9aKkEDXDvB9GSTH9krlino=;
        b=uaKZlfhNWAwsybApB1eOAM7LNBWicBlt3I++btMi2TJURkhNvIay6Jusv7tU7E1qUK
         YKtrqSh48n0LlexHOX0Oyjzb8Fe463TwR4Snje0AV5ZCxyiGYySPP3Og7qaUSCfHPKqx
         FgeUb9ckbGLjeYNUyn81dVTwps/ZC71LeHVCOw5MjYFr/Jk/ZstWzXPv00BuUC+kcRPF
         Y7/R5AmF+6BkDWci7VS4UHSnu3FaEUFifk83mZWcsM/xzzsPtQSvdI9C64IONvbEfECE
         WVHUjLCgeogixFOhCFchYarZWt35VpNQyrADs9uKGv4xpbc6iFjdwqE+mW2E45nzNgan
         akzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=peWX2leln2ZSvGXaMu2OH9aKkEDXDvB9GSTH9krlino=;
        b=CEE4CCUC3xb8/btoMifeY9k9g9OknTWT90JJ8MNJ1d9sg96zVZxqRrxkLd1Xgcg0la
         SGt0lk4+384+476aJVI3WrkptTIDZYj+yPj61XdZr6EumyjwPMahRX4pp/irMM0uZTQG
         OKy6Pdbz9kKc266WRArGRGrpp9bQKjPXFwxhUOMEQo85ncE93Ix0EFzQh1hJywQXmrcs
         1GK/rp17zp2vE3yc4+mLgB6ILPqohI77wNSdvBSlJQGldqy5zexfDh7h1x5RsFj+qVaR
         IEhXUdwmp0pP9ySm+vPWBWPxz0TmkntnyU1F7wkMK559VFt9VUxOpJUfO7etFBE4I2MV
         jLtw==
X-Gm-Message-State: ACrzQf2nuggYwwfihvxEO8QQ4AOdrEdIQX9MHKlQuL6X9P/g+JjN3Zth
	kvz+wV1UFQWudkaejVAJRGzGBw==
X-Google-Smtp-Source: AMsMyM4JdjbuB3k8yaPzdP6kkU/k6S5PWAUIpyf2xFZ17JyUWm9Y+cRZWv3T9S8Zi8zpNvkSu4R4LQ==
X-Received: by 2002:a5d:48c2:0:b0:228:6226:381a with SMTP id p2-20020a5d48c2000000b002286226381amr152194wrs.366.1663255853678;
        Thu, 15 Sep 2022 08:30:53 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.72])
        by smtp.gmail.com with ESMTPSA id a5-20020adffb85000000b0022a2f4fa042sm2809237wrr.103.2022.09.15.08.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 08:30:52 -0700 (PDT)
Message-ID: <04187280-3c35-c9ac-fc70-b5066108ac0c@linaro.org>
Date: Thu, 15 Sep 2022 16:30:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] dt-bindings: mailbox: Convert mtk-gce to DT schema
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: jassisinghbrar@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, houlong.wei@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220915101716.70225-1-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220915101716.70225-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_083057_443455_05FE5EFD 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 15/09/2022 11:17, AngeloGioacchino Del Regno wrote:
> Convert the mtk-gce mailbox binding to DT schema format.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mailbox/mediatek,gce-mailbox.yaml         | 104 ++++++++++++++++++
>  .../devicetree/bindings/mailbox/mtk-gce.txt   |  82 --------------
>  2 files changed, 104 insertions(+), 82 deletions(-)

How is this related to:
https://lore.kernel.org/all/66591c84-ee8d-7152-f0c5-5e4a07f632fb@linaro.org/
?

Changelog? Previous review tag?


Best regards,
Krzysztof

