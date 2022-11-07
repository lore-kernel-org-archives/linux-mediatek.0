Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48490C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 20:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgPXmc42gSS+9RDbk9bPwPQ6xa5IFwcVI8Es/AMs5QQ=; b=Wj5fjsROkxAPt7SPxZ0BkDtv6H
	8aGSsL3ML5xkw+cKZ0lD7rA9RtkLJDSyjCYdx2pUpf5sGZ90fABknQ+CP+PdMx9ZDK4R+JHMjLSWK
	fquhlz0aoTI57st88beHLJ/zx4TL8wAlYHH/uvw38Y523f83CqTwm+gWk5A1UXK7OMvNjBJVYXFCZ
	AqVtfG/X5yI3UoAALBIzHgrSlaAMyecW15TRmz8NDI44ML04dk/7DT2e7zb9uo1gRF4x9vfgtT/ey
	Z7qcRB8S1oBkGrsP9egEIfbWHd+tkuylCmYn3bzwsFLWV1DJ1tGdUnxTZryJi7YNrEyB67Zo80bbq
	o9jRj6IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os8VS-000GjI-TR; Mon, 07 Nov 2022 20:14:06 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os8VQ-000Ghz-Jw
	for linux-mediatek@lists.infradead.org; Mon, 07 Nov 2022 20:14:05 +0000
Received: by mail-pj1-x102e.google.com with SMTP id z5-20020a17090a8b8500b00210a3a2364fso51551pjn.0
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Nov 2022 12:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IgPXmc42gSS+9RDbk9bPwPQ6xa5IFwcVI8Es/AMs5QQ=;
        b=Lv0jaAlJO3Pfx2NP9fOi99sjktk/EKRfwOlofukUKOgpp9M2209JDrInYlC/Hb96kX
         WiFgfbpqnRnlKBoFNwrkXH8hdPPEdvc+JMppDiaruAqyLaQClFKAVZtFDzGkHwW7T2RL
         WmqOYCgFSpdcFq5UUU2a314WlDmSL5htwNEqvYznRbM62EhrkUo4OQ60Zi7OKV7aVCqN
         nrAAeEPNouP9/5fi3qrJL26TZ2acC+1IMFkeaV1a3w4/bMys9H4EYRl0pvQ5A5ZL4kee
         +s0yRYYrISNeQuVGL6Zs/zy2ps2eAYlnxiOGNZxpi60pbVpK5w27mE62FYhwoABPH+2A
         C+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IgPXmc42gSS+9RDbk9bPwPQ6xa5IFwcVI8Es/AMs5QQ=;
        b=PqGOaQ3kser7oY4XpHyq2rkWWHz8b5BWB+NV+QEmaoD2fu2/FhX7JzU8lVAvh5EHaS
         WPk/Q6kwtnKvCOoWCkPajHGj2ohG70tdxZ0J0YQ4NPNnJ61/RHV9cGQu1DTQv1aVk+W1
         XwHtRwYRPIQrKNeVKBTlr1MGSjgC10RdL+n3H9B6uBZ+obFC8qKkqc7W5KdfpSQHs1FF
         /sPkY01jbo22+NgT31j+Y47PJ3PVZ8D/TasaU+cmG+lNi6YTTB9e5KUPKkfUL0dRvHXF
         6x/vL4SjfddhGfiIme1VDatA6vIBpYtX0moqFAs5PJAsz30/WLuLb/jG+kRm/g3SC1Uy
         mAOg==
X-Gm-Message-State: ACrzQf2/EPYm9g0S5Zk4TcX0jD3sXxLIE4j2UNDqcHeREF/GWOL4fYLk
	J7S9vPDNTsEoTf1390B35Pd4TfBtZRBrsjFFSYR7/A==
X-Google-Smtp-Source: AMsMyM4Uqs3O9TcimuuptYpAiUUKJmyf19xvGSioeogsaTGjXrG+KhSscjv5iIa2S1MqvOlKLMq04hYJyEoDAQTxJ/A=
X-Received: by 2002:a17:90b:4d07:b0:1ef:521c:f051 with SMTP id
 mw7-20020a17090b4d0700b001ef521cf051mr71864059pjb.164.1667852042927; Mon, 07
 Nov 2022 12:14:02 -0800 (PST)
MIME-Version: 1.0
References: <20221106033924.9854-1-mengqi.zhang@mediatek.com>
In-Reply-To: <20221106033924.9854-1-mengqi.zhang@mediatek.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Nov 2022 21:13:25 +0100
Message-ID: <CAPDyKFp4wEaiGvyXQJPehbDkkZReUXk5fsXwJGLpVX9w2ZOZjQ@mail.gmail.com>
Subject: Re: [RESEND v2 0/2] Mediatek eMMC Inline Crypto Engine support
To: Mengqi Zhang <mengqi.zhang@mediatek.com>
Cc: chaotian.jing@mediatek.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, 
	wenbin.mei@mediatek.com, angelogioacchino.delregno@collabora.com, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_121404_674461_FDB92E60 
X-CRM114-Status: UNSURE (   8.97  )
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

On Sun, 6 Nov 2022 at 04:39, Mengqi Zhang <mengqi.zhang@mediatek.com> wrote:
>
> Change in v2
> - change patch 1 commit title
> - change patch 2 commit title, and correct commit message
> - add crypto clock description base on new code base
>
> Mediatek eMMC hardware IP has Inline Crypto Engine (ICE), we support inline encryption now.
>
> This patchset supports Mediatek eMMC inline encryption which meets the upcoming version of the eMMC specification such as v5.1 or v5.2.
>
> Patch 1, add crypto clock control flow in mtk-sd driver, patch 2, document the device tree description about crypto clock.
>
> Mengqi Zhang (2):
>   mmc: mtk-sd: add Inline Crypto Engine clock control
>   dt-bindings: mmc: mtk-sd: add Inline Crypto Engine clock
>
>  .../devicetree/bindings/mmc/mtk-sd.yaml       | 22 +++++++++++++++++++
>  drivers/mmc/host/mtk-sd.c                     | 12 ++++++++++
>  2 files changed, 34 insertions(+)
>

Applied for next, thanks!

Kind regards
Uffe

