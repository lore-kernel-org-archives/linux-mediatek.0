Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75C91C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 14:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmZJjcyK8nxBYdkGyjF9BBYtQhsKTKXX/XHgXHfVxFQ=; b=j4zL+wgjEjgLM6HpKNTfTcHOjM
	+FWFq+PVQEqWtkk8yLhDPEbln4TE/QlSuJITEjZGL3EkvSwMVd6OKLno8vc7AtaETBCkv5/hVSlvq
	pH/2++ssA3zrEr+gGLZTmOsNR0NLWl6TQ9Q+JVEEEidy5IEW0EfhM8n81i0+sGXhlEpTFbeCTSZsB
	P5kyH26FLQViweVhpmJXTMs/dISxIzrL7lYlJpVwvaOK1nqcb9u94DnG9yBeRXYHcLFI30YPb9VLe
	dOKXLlpfp+M0ZOrwbbENxDFCeB4yx4VP91xXk54kDDP/X9KsXEFe2xfbv3ra6vf/dHfApwLWoe1Ih
	u4IEwO7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os3XS-00FQXG-L6; Mon, 07 Nov 2022 14:55:50 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os3Je-00FJ7s-7X
	for linux-mediatek@lists.infradead.org; Mon, 07 Nov 2022 14:41:37 +0000
Received: by mail-lj1-x233.google.com with SMTP id a15so16567220ljb.7
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Nov 2022 06:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kmZJjcyK8nxBYdkGyjF9BBYtQhsKTKXX/XHgXHfVxFQ=;
        b=U1adVyNOAbOtB7LzITQqX+3NVUCD7hjijSzI/YHO7Rr5osXA9MHZaq6HCqJm+6HOsd
         fJ0ys8uvAM/DHnbHHSTIk7+IrHs0ykceAZnbCNalyMPTjX5V0QSFVrfDnqsHiyZXVh7v
         xS76OH44LE4SOvIqhvtz4JcIew6uCLD+fjCy8iCwwo3tsgl5PIuVNZofJHC1aYnEYJXE
         0XMka9P59kkmELC5diVPEBztOC7sT7XY8SbiwvhDewSyIpJ9Lj95VhVT+42KmMiEjuT6
         Wgj/v227ic5IahOtxJlSZVfx5uKNgE3Pdar4ogOMdGAQtsAHGlHZnhJZLBYIO31EZPz5
         3FpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmZJjcyK8nxBYdkGyjF9BBYtQhsKTKXX/XHgXHfVxFQ=;
        b=3EFtCKMGafO2o4fTgLLmG5JZKuAJZ6SM1bt6cHeYk83/LvSX3d/LOyj/Q9F9/YV6ak
         45ilNhNeL5FvpoJXfiI81ySzwUYCItCknCJhYG/DFRizoFolhbXQ99e02xe2O+8dGwVt
         KMEWZSAEVxvPOR8w3sGOn72VqNngFAYFmY5Ow+9YQ//cXI0t61R+y9fI39wZQcYtpXJo
         nZNYGk8chki9F+J0IYyD+DYs5xoEJl0nSeeEr7FIN20eCO+DfzTzpodrxV+A7jDuDtNu
         gdowjXaYJYRqWfmDsdOA5Rhg4gAZ9J7T2KyYuoHGVqYShfe/NriI12gbTwVwFeFHs8/M
         xJmA==
X-Gm-Message-State: ACrzQf3V4rb+BLvLtd9+oTO7kLrGb+rUo7canXsqy6c1BrkhABKWFi+i
	IZ+HTbvzksKjQa00jYqMgvjXsy9cY/lY5lpocRowhg==
X-Google-Smtp-Source: AMsMyM4ifBzOc5epJWnolpwJB7I8Uu7REkrSM32h9Wi0RNR6YarRrxj3LMKdHch3+Mq/MvaFZCjO8+SeHm/lb2cNC1M=
X-Received: by 2002:a2e:a58e:0:b0:277:774a:92f5 with SMTP id
 m14-20020a2ea58e000000b00277774a92f5mr9046538ljp.224.1667832090776; Mon, 07
 Nov 2022 06:41:30 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 7 Nov 2022 14:41:30 +0000
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20220919-v3-0-a803f2660127@baylibre.com> <20220919-v3-1-a803f2660127@baylibre.com>
 <96d0f2d2-24b9-0838-4538-7d70c01ddace@collabora.com>
In-Reply-To: <96d0f2d2-24b9-0838-4538-7d70c01ddace@collabora.com>
MIME-Version: 1.0
Date: Mon, 7 Nov 2022 14:41:29 +0000
Message-ID: <CABnWg9uwqyMpknrnR0nNuNLNtO81XQP=kJ8quLEaC2WzawFgzQ@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: phy: mediatek: hdmi-phy: Add mt8195 compatible
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Jitao shi <jitao.shi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Vinod Koul <vkoul@kernel.org>, CK Hu <ck.hu@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	stuart.lee@mediatek.com, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, mac.shen@mediatek.com, 
	linux-phy@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_064134_535511_E87901EE 
X-CRM114-Status: UNSURE (   8.80  )
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

On Mon, 07 Nov 2022 12:20, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>Il 04/11/22 15:09, Guillaume Ranquet ha scritto:
>> Add a compatible for the HDMI PHY on MT8195
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
>
>Ack and R-b tags go after your S-o-b.
>
>Apart from that:
>Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
>
>
>

Hi Angelo,

Thx for your review.
I'm not exactly sure what to do here as I'm using b4 trailers to
collect Acked-by and Reviewed-by

And there's an ongoing discussion about that topic on the tools
mailing list [1], it seems there's
no agreement on what to do with trailers ordering.
I'll keep using b4 trailers for now as for me this is the sane thing to do.
I'll update the ordering if I see concensus on that discussion.

Thx,
Guillaume.

---

[1] https://lore.kernel.org/tools/20221031165842.vxr4kp6h7qnkc53l@meerkat.local

