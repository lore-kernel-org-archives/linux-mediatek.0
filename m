Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 119CEC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 12:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RNM4SlIpZK/Pvp+Nv1sq/TOqry7Wt2JczmvZLzER8lQ=; b=uzslMJvmlBOEfrarlP3DEu2d3k
	9fj1UzhnUvcujRIUnMoZNhQ+YSnyr5xhwSGDRfCGHFWJjDf1JCvI8vMokS6hniiP0/B2JcDuoDDwG
	+BmHyFOhibCPsQTPAhC2rAbuNN9gsQ94oXPtEmKeydD00WC8AAq4CqvcooaMIAISxosMJS0JGjcGG
	z2/8g7HIwHmh43xNHq3NDeK9h6Qq3OBKQBuxNHNR+M4tdP5oTq6AN/MgIsL6n3D4vcpICasZHMP/P
	KyjpuJLddfpHjIAdl7HHj8oQlyqyem4eyBYiKlHTwhDyqHI/1AuoBjXbPeZLOGvYK6F2y/KJDyRkA
	7UKcaq4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNdM-005BcR-Ib; Tue, 08 Nov 2022 12:23:16 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osNd2-005BSx-F0
	for linux-mediatek@lists.infradead.org; Tue, 08 Nov 2022 12:22:57 +0000
Received: by mail-ej1-x62f.google.com with SMTP id f27so38158466eje.1
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Nov 2022 04:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RNM4SlIpZK/Pvp+Nv1sq/TOqry7Wt2JczmvZLzER8lQ=;
        b=pmXu4BS5etWADJtDE2P7kY49YRZFXqqdzWrt9of2mDSdjOSG/RmeYs97cGlrY79FVH
         a58theOcmE/N/jiQP7QKeBXgc6W5rZ6WB/WDto0WYEOfqox3i1x/fqYRrdC7MnRkDJeh
         78rPUEhwgD1B2TA07imvz4c6favbeAAE04VpfRIzzKbqnGB/IViZCTrTqkiLEJfkve7T
         UDqZXLz7KOEMiVVy/9XniDn4rtzP99uzSz0+B+rwXTMiN3IAEW13Xs1az9JJ6KwLcTbG
         FXVsSTmOtwDsL2p/xsDPoUuiHN9EfTizM9KB+/vDpkSz2fkxuIaXtKBDCbqUop2dbsiw
         NxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RNM4SlIpZK/Pvp+Nv1sq/TOqry7Wt2JczmvZLzER8lQ=;
        b=IxAe0acIn6UR69RsgGkecX6KhMMEWTpA/QrfjtsFZNnSDfm2VtMWepOX8kMeeKgDrs
         BOjFoXCpzWlq8m3Ba3w91+zh1enHFR8axkHc84n0ajZBOAqLT4wLS6Wi5jMxBXZOpD3O
         zbyOY3eyaL6JtVkiB/qFZ/i5CnRhwY6yL7AGRbRjFGEBzcaawN4O4iC5eKMUfLFzhrwJ
         TDCaa3VxAP9dNcf9bw+clqu0LgPqjfZ4BzVTtDXR3oo6ebjXxoHmenfzLuf7K8K29yE5
         oEHQY31pSzZ2uM3t+58KR8eGeWvJdk36mhI+jXy3MaJV7jPxSRoQS7/kMF1Io2OSUG8T
         0azQ==
X-Gm-Message-State: ACrzQf3wEnLySgofr5CIMhom6yU6wplh+uo9gZ67Ah80trt3bWSwW0MV
	by1JUu8lO4rjIr+kdM2RWqgKse078c8E/pJN3hnZ3w==
X-Google-Smtp-Source: AMsMyM5DWRrNDglgUtSRjboVATNg6viDXKYxNq5T/teuA30XG8xW8WBMihboBMWWlbMxHmCHS7MFaCZeJDEqcy+LEds=
X-Received: by 2002:a17:907:c1e:b0:7ae:31a0:571e with SMTP id
 ga30-20020a1709070c1e00b007ae31a0571emr20898444ejc.690.1667910173413; Tue, 08
 Nov 2022 04:22:53 -0800 (PST)
MIME-Version: 1.0
References: <20221028153505.23741-1-y.oudjana@protonmail.com> <20221028153505.23741-6-y.oudjana@protonmail.com>
In-Reply-To: <20221028153505.23741-6-y.oudjana@protonmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 13:22:42 +0100
Message-ID: <CACRpkdaVxm3gwrwWg6Ni5W1Xx-k8cy9mE97n2bGvZDxum7DSKQ@mail.gmail.com>
Subject: Re: [PATCH v4 05/13] dt-bindings: pinctrl: mediatek,pinctrl-mt6795:
 Fix interrupt count
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, 
	Andy Teng <andy.teng@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_042256_544111_CDF37D28 
X-CRM114-Status: UNSURE (   9.13  )
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

On Fri, Oct 28, 2022 at 5:35 PM Yassine Oudjana
<yassine.oudjana@gmail.com> wrote:

> From: Yassine Oudjana <y.oudjana@protonmail.com>
>
> The document currently states a maximum of 1 interrupt, but the DT
> has 2 specified causing a dtbs_check error. Replace the maximum limit
> with a minimum and add per-interrupt descriptions to pass the check.
>
> Fixes: 81557a71564a ("dt-bindings: pinctrl: Add MediaTek MT6795 pinctrl bindings")
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Patch applied.

Yours,
Linus Walleij

