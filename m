Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B022C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 11:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DNfZf1ALusxNZItYPzLBSfgjkhIQRGT+paZKIzAlEKg=; b=qd7j2jD3hXwzKBTqzJiJ93362a
	aDDf12WYkdq553eubOQ+Dkwdvh6EuKRGpzXXX5crRI5T5ooCUWLRQChcgZiv4iGAaiX0R7OiwTHxb
	pO1Vew+LqdNP+lpHZyLN/su6a0AfMAmvxxnTBsXE3DkkYrO1p4UTZQyo4hcKQH5tQVvnN3Xzq3nsg
	DlJ4BKdk6gHksqcmi2caoBE/Se3gMOWkM2lTd9jtUYDqQ5rgWBK9ojy7qvWGfdCqs5nI5aVmrvP/v
	Mur6c6pOnxX/wOj6MzUB70Tb5hrzeQl8YxXYPiC6lBv9dEEb5TBugUNpNmeHl0v67nHmTPa2Su5BC
	rKw50vJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5nDA-000eqO-Iw; Mon, 27 Jun 2022 11:47:24 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5nCw-000ei2-PS
	for linux-mediatek@lists.infradead.org; Mon, 27 Jun 2022 11:47:12 +0000
Received: by mail-wr1-x430.google.com with SMTP id o4so8715050wrh.3
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jun 2022 04:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=DNfZf1ALusxNZItYPzLBSfgjkhIQRGT+paZKIzAlEKg=;
        b=sV0flEb6e8vzBIQcGxl/RLcS74O4Nx86dAcc93mn8FPtVTw4L5J2j0DXwIo4b1jLiO
         TXHVeiIcfQZLyRgCwf+yZPOodVlfqP7U2xrt+TCXRZ+nxCfubcoofsr285ENaoFYiLrN
         yo6kSYEVQvXzaisFGfYxVAMk6fdCXNeTqKrUclCUe1cKod1balAyTsQTFW1Sruvgjn3U
         IFQxkz9S5+LvuuIYFxHS7wfyALzJolDZGfzDPYieb8saBvE7lAZGOy/5K1saLTZBAzr5
         E/GzyemEfHqv9Eq0lkfWGAuM5iwXChMCfoShbooumaD06p/179duedibRQra51wMX1bb
         SvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=DNfZf1ALusxNZItYPzLBSfgjkhIQRGT+paZKIzAlEKg=;
        b=XCF5YWeGGxmIE3qefJ73rOxB0TSVsvo4MwgxDuUSd58qkQd650WzbavEPUNBt6DjSh
         VoUSZIL+vY66Lvmt9pg3HHU01ydXMEBQQm12M/vqyTPPh6rPJLffJqP0Nsz+OEGNJHAH
         AANpFzNh1Px0l+I/Mu9FFDkacY9a0+jp1ykTlWZA4gVHzTWd6d18Zn8htIOk06N71H7J
         +/KjGi6JrTTo2wBTR+o81Gnp/K4arShmSBP2ycySA8snOL86yo2R7z8Z1akDJ/Kpobn1
         G4VxwqbJ4BshsQlAW2D/8vkaHSK8C68DcSWilFOOBV7JeBbZ1eVREu320Ve9LxdD2fL+
         la9Q==
X-Gm-Message-State: AJIora9ixGvlNoqlf/OLceh5oUvBmbCYXL5BCDA/Whw0fcMfQScwlYgD
	65oFUVQ2LlGy2YbZxxtHD652Dw==
X-Google-Smtp-Source: AGRyM1v/Irv5206u/VfQLtfpPzA9fr8PJqMfZhF2phPpC4wOEt4/o9BLlBG0Ze4sOEA0d8pg3/fEhg==
X-Received: by 2002:a5d:64a3:0:b0:21b:b86f:e9cc with SMTP id m3-20020a5d64a3000000b0021bb86fe9ccmr11701408wrp.156.1656330428099;
        Mon, 27 Jun 2022 04:47:08 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id t10-20020adfe10a000000b00210320d9fbfsm12218547wrz.18.2022.06.27.04.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 04:47:07 -0700 (PDT)
Date: Mon, 27 Jun 2022 12:47:05 +0100
From: Lee Jones <lee.jones@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, johnson.wang@mediatek.com,
	hsin-hsiung.wang@mediatek.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] mfd: mt6397: Add basic support for MT6331+MT6332
 PMIC
Message-ID: <YrmYuRy2ZgIw21JX@google.com>
References: <20220617110728.90132-1-angelogioacchino.delregno@collabora.com>
 <20220617110728.90132-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220617110728.90132-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_044710_863763_59C95D29 
X-CRM114-Status: GOOD (  13.12  )
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

On Fri, 17 Jun 2022, AngeloGioacchino Del Regno wrote:

> Add support for the MT6331 PMIC with MT6332 Companion PMIC, found
> in MT6795 Helio X10 smartphone platforms.
> 
> This combo has support for multiple devices but, for a start,
> only the following have been implemented:
> - Regulators (two instances, one in MT6331, one in MT6332)
> - RTC (MT6331)
> - Keys (MT6331)
> - Interrupts (MT6331 also dispatches MT6332's interrupts)
> 
> There's more to be implemented, especially for MT6332, which
> will come at a later stage.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/mfd/mt6397-core.c            |  47 ++
>  drivers/mfd/mt6397-irq.c             |   9 +-
>  include/linux/mfd/mt6331/core.h      |  40 ++
>  include/linux/mfd/mt6331/registers.h | 584 ++++++++++++++++++++++++
>  include/linux/mfd/mt6332/core.h      |  65 +++
>  include/linux/mfd/mt6332/registers.h | 642 +++++++++++++++++++++++++++
>  include/linux/mfd/mt6397/core.h      |   2 +
>  7 files changed, 1388 insertions(+), 1 deletion(-)
>  create mode 100644 include/linux/mfd/mt6331/core.h
>  create mode 100644 include/linux/mfd/mt6331/registers.h
>  create mode 100644 include/linux/mfd/mt6332/core.h
>  create mode 100644 include/linux/mfd/mt6332/registers.h

Does not apply.  Please rebase.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog

