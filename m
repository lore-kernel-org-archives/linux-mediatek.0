Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262CFC36002
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Apr 2025 14:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OPytIAR32acMc1Jy5NAX4zaoua0Um2xWn2RghqT1VbM=; b=k9cTaE/5eDhktZlsjyWSniL736
	Am8HSCQJAz0LpaZyxIfO0Xh/w4qcFRSljryCZ0uXTViKDoVrNqoMbdhWxUE0bTI0d1t171/kCeAeD
	jQI3VUZ8PRGSOlkS4xuiBhYEJMJ03t9rE6e2sr6D3sa37Pz7hzso1I3ZECJ9LJiIBcc8gEVWQIxK/
	5wjgMeSEIu9TKIHIguYm0wyUe0xu2Ib5GA6+yUgwOn+RjqCzdV25zvQz5L2lNW/zg7SDKGcr5Gqju
	8aRFmBnOiEod13h/WXbxxWS5q36WiAPqqEoIQLrsEOIYKVHIn/0F2UGE04dH0WZTAoEgofs07+zlG
	VTBs9mDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2W7T-00000007Olb-0kfi;
	Wed, 09 Apr 2025 14:09:35 +0000
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2VFt-00000007Fdm-2pjU
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Apr 2025 13:14:15 +0000
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-6ff4faf858cso51356377b3.2
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Apr 2025 06:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744204453; x=1744809253; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OPytIAR32acMc1Jy5NAX4zaoua0Um2xWn2RghqT1VbM=;
        b=qiSeIpOuQ8XfeYMLzFx+p8seSNm5Wblzcvu4OdB4vqyilwqY3UeyrmBQ91ygFXVGMK
         3Kv0CCmlstIA5tZinyh5BxId7fqACj9DH+Obmeo6GangGWhFmqUiWiy9SaRr4tLUkM3X
         sPG4/XFllTv6BnewBKibExbRMmYVrSyrsclHubNlx6U2YSO0Drv0WKrJn3oJXE5EhOcX
         Gtr9n47/YL+XEwUaix2vp0CwQ4PXKlTf2OrQSTG04LUnZ1I6crmu3jcYSzKB7itul9Nt
         yL6eZeTaf1+ghyG/+yuvbOoRK0Wd1Pup5An6LEj3ktXKGDZoECbxjpoBiS3/TF/94FG0
         PsTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744204453; x=1744809253;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OPytIAR32acMc1Jy5NAX4zaoua0Um2xWn2RghqT1VbM=;
        b=QIh3yX2XnHtAuntONaLUFu3bc2wKYnDvIzrv/x83sabX3dQvP3txLt0piin/RKT5sB
         IBXElqqYn45gfC34PZwEFIStNztWAbAzXaUf2qL9exRT7VAh9t0Hkh5dz5o1Ijvuh3VU
         MoFVTEpPKnQUS2U022Hf5kEZkzM/NQyvDpXBqXnHclc8JhrRVOUitEJk5AR90NgwBhI8
         ecLcU7GqYbMLV2A75bI3BsTG+KWfv2DumuWz+jxUxYXSIzZL2q9SV1L+VSwyQ/rjSw3o
         jT5tm/EyH4ziHT0ofBHpPcj9AazJ3RkdZkyKWxu5mVcXtYUFA3j+q/o7bjurt9kyAl/1
         CCYw==
X-Forwarded-Encrypted: i=1; AJvYcCW49RftXlWdAv7sJvSKbLek2HDFvVD3TGtnpI9z0jkZ3S/qwTa2nKRh6tQuAxIvj/yTJJTUypOQZTAMkL/3gw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7jrSphOBVWGhzBOtUzBoiiMvHIrEPP+U03E9mGJI6bdhgihra
	B6kSLXmkvgbueTOynE10AJxzTVYX6VpW9k/azM3JASeY0EGhuDIbdRa2cQGZ2tDZoKSRhJux2WH
	Fn2wBnMsgJ66IPqaBtd78RKejdR2ChMe1i2Nv0g==
X-Gm-Gg: ASbGnctY3LHXSa7UgtHZ1ZWi8nZrrPJAq/mwVR6SIk3viQw5FvEApbmtzSPFyc3Q7/2
	zJzlOVQ3D5F7lkUk0C/P2Cw4ZfaCsnQNypV2m9vRpXHLDiBM6D5bGsX63IbcdzLH5aYpFuUG5Cp
	IlDBulMJ/9XUqtn4AQ6/Tc9k8=
X-Google-Smtp-Source: AGHT+IHEapgN4KpAu2PH+cMh+2Gzlwfzy4KLVKnXkondFCagfktuVPm3ZUGmWpdWktkF6zuY6BhY5v5enEDZADi0x7Q=
X-Received: by 2002:a05:690c:4a04:b0:703:b606:738f with SMTP id
 00721157ae682-70538813013mr54886587b3.9.1744204452852; Wed, 09 Apr 2025
 06:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250325110701.52623-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250325110701.52623-1-angelogioacchino.delregno@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Apr 2025 15:13:37 +0200
X-Gm-Features: ATxdqUHSGpiXGAwgK7msekj1T4YSrnCc2mkntlahkz6x0Wt2J4BgD7Yq4ISR4rI
Message-ID: <CAPDyKFrR7S23hCbEpwSj93f3ZczkbQAMgpJo1NNsK4bpMr-qnw@mail.gmail.com>
Subject: Re: [PATCH 0/4] mmc: mtk-sd: Cleanups for register R/W
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chaotian.jing@mediatek.com, matthias.bgg@gmail.com, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com, axe.yang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_061413_714117_A4E72718 
X-CRM114-Status: GOOD (  13.26  )
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

On Tue, 25 Mar 2025 at 12:07, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> This series adds missing register field definitions for the MSDC patch
> bit registers and aggregates various register writes into just one,
> greatly lowering the amount of register reads and writes especially
> during the controller initialization phase, other than the tuning
> phases and set_ios for mclk setting.
>
> While this will have a performance gain, that is completely ignorable,
> hence this series' only focus is a cleanup and an improvement in the
> readability of the register settings (as those now have actual names,
> some documenting, and no magic numbers around).
>
> This series brings no functional differences.
>
> AngeloGioacchino Del Regno (4):
>   mmc: mtk-sd: Clarify patch bit register initialization and layout
>   mmc: mtk-sd: Aggregate writes for MSDC_PATCH_BIT1/2 setup
>   mmc: mtk-sd: Do single write in function msdc_new_tx_setting
>   mmc: mtk-sd: Aggregate R/W for top_base iospace case where possible
>
>  drivers/mmc/host/mtk-sd.c | 207 ++++++++++++++++++++++++--------------
>  1 file changed, 132 insertions(+), 75 deletions(-)
>

Applied for next, thanks!

Kind regards
Uffe

