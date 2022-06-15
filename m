Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7ACEC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jun 2022 22:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kcScYJXACf2T9Sa4dGBrpIUizywJV+NB+pNeD+jGRj0=; b=ERhJZdZXEdj71I/o9tfKOMcZud
	GkgwJUSzI/i9nD2PfcSxiMpa++xdFhM5wy7n9bkORxBNx61fkUaiqCr8kJbPgEDwjNWVF7kRSFFp2
	+9o5ksssl3yWVzknaIJDpvNKnzDi170LP4cwpnirNcKaHcYwdFEaat9sLIQ40mqO0pmqGm5aaX4C7
	j6rHfud/XKhn20N10vn1MrSXteAnIgxmT8z0t0PaS8qvtRw2gemdvEMOi606cKQRPprbgul6G6/Tj
	zz4lVQBnQ6B6sfbfObR5SxUY41aUKUL+Va4u833pgw9rsUXLnYqJkAQO88qWS9TpSF92ugYAWUFCS
	SswCIVKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1b5i-00GZoX-QV; Wed, 15 Jun 2022 22:02:22 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1b5g-00GZnB-51
	for linux-mediatek@lists.infradead.org; Wed, 15 Jun 2022 22:02:21 +0000
Received: by mail-pg1-x536.google.com with SMTP id w29so82136pgl.8
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jun 2022 15:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=kcScYJXACf2T9Sa4dGBrpIUizywJV+NB+pNeD+jGRj0=;
        b=vZg0V5XGviYMk89uA9Wp1MtlDzkq1rdkPCbOnn1cHvci3xZ0es4PnSo0dWmB+M1xFz
         AJ1mlX9EhMwHmEvQkbmTRdhdPofzKyV4kCsB8Vp9xmz0tp6EKzMze8LKFwNXVWS98J9R
         88hOcBSRLHEQY4JNTD9ugK9VeZfTCiLLBIzx2jnOn4aNioJOhEqLs405WbeKDN44TsJ0
         8tsh6G61OeovlN3mYKiOpiCEOTCHwSADGEyWuPTRZ3wIY+OI6Pj/4A7B+ZLX0pSwO4D+
         e4fY6e0DzRVikaE0hjnTbh7jgt7cjUBxZtnrOvXH4EkTrIKfKOW9IkvroRX6YuG367eI
         Xdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=kcScYJXACf2T9Sa4dGBrpIUizywJV+NB+pNeD+jGRj0=;
        b=PlWgJi/iX+csMIWCDCDxPbY9S3exbS0DHBtZPR2GtIKVJ64n+CTm8CokDwLV67Fkzj
         qQnFMPRs9TK8fx+MCRaO9Ebf/sMseBYo4L9gwLKVd+mOAbq93cC53A5mOJqN/D0/KmiP
         /I/rB1/y4iNmJCPOfdsjxP9IeYdjVXKlB5DRh5zcEXVZUbeDOgpM1kJpWgZJ1G0SP7SD
         QDrge7K6iuW/U/P1DlUIdOGJK2A9Xk/qDs9DLw/8ULIVwlaIuQBLLtQKQOcQITOOuOQW
         KmrA0oSRjFyYUjbs6o5/9xAHsf3wa36t3r/OoUJJpClyH1jeK38XuKt6nOf25YPtLVah
         JNcg==
X-Gm-Message-State: AJIora/fNYnuZQHjyUPct4sS9CVKZyAYGwzsi+FbegujQRl/LXP/52mZ
	31IFimwiBMQfLzasuCpgQPPvYQ==
X-Google-Smtp-Source: AGRyM1vAu+j0mmpvKehwZsnqXWna7Wp2yP3aY01hL+X0jvE+4s7/feJd4/rbNQjAAV4okSJFwzqbpw==
X-Received: by 2002:a65:6a05:0:b0:3db:27cb:9123 with SMTP id m5-20020a656a05000000b003db27cb9123mr1603825pgu.497.1655330538113;
        Wed, 15 Jun 2022 15:02:18 -0700 (PDT)
Received: from google.com ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p11-20020a170903248b00b00161ac982b52sm121873plw.95.2022.06.15.15.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 15:02:17 -0700 (PDT)
Date: Wed, 15 Jun 2022 23:02:15 +0100
From: Lee Jones <lee.jones@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, zhiyong.tao@mediatek.com,
	henryc.chen@mediatek.com, johnson.wang@mediatek.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: mfd: Add compatible for MT6331 PMIC
Message-ID: <YqpW56+bntMonulO@google.com>
References: <20220520124039.228314-1-angelogioacchino.delregno@collabora.com>
 <20220520124039.228314-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220520124039.228314-5-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_150220_262042_5A8286BA 
X-CRM114-Status: UNSURE (   8.59  )
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

On Fri, 20 May 2022, AngeloGioacchino Del Regno wrote:

> Add a compatible for the MT6331 PMIC MFD device.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

