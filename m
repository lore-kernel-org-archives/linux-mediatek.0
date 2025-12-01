Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59916D116F3
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Dec 2025 16:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cspTNBzt+I5BtqKUZhFjJeUVwDFagEE/l2BBHLFNpxc=; b=Uz4+N2zRa2dQL9frwS9rdwjHm3
	1FI6rdGDB1DGLjwiBJj4X55yrQexaulHwEmfP2/jGN+6/+vC76RToJQjtF7UF3YQtvTQTdfm7t9Jr
	YOfYxwb00Hn/eFZbOraiU+SjMZ+iK0YcQ24Bz4XNl1IhSKQu4v9b/v5R3VQztAEdSsjaM5DCGjFtH
	hjNXZcszt4tqRQWgCVOUewLpZR/Ys7qiqHDKZQ0hFoTe5Smd1oPzQv0Nyj46VgUyDUE4nppbd77QV
	zB4RbzBVM/pb12goBB+szRChrhb06yJ2rqxBMt+hff6lFPmZLz6u4LVLkJQ/AlKDjxROeuFxFg0A+
	n/ItzWgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6do-00000004FT1-1n6M;
	Mon, 01 Dec 2025 16:20:44 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ6dm-00000004FSI-3G3I
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Dec 2025 16:20:43 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso5068914b3a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Dec 2025 08:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764606039; x=1765210839; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cspTNBzt+I5BtqKUZhFjJeUVwDFagEE/l2BBHLFNpxc=;
        b=npv0lIGg4qIUmkZR5NE+IKUVMnhqcgBAPpNnHb6PT0JlmtbUi6S1sXfxRfr3vuUDGM
         gBYvt4elKF44EETxTawVCdNfL0VZo0yY+L5K06FbqPSXxJcPTZyZ9AyEJJIcN/qh0tup
         b/mbC0Fj8Gb/6PctMtb/elV1Oy6nKBUrPEN8B/H5fkdG3WWM6YxNlSnzOi9A0rTUh4p0
         Gf4Cev5iDIvJj7GAN0VE7wH0wWxzIDX6hmv4drXYitWd+yGI5Tsg/jjzLys9A9Ohug2Z
         4KlJCOxZg5yUQEPnjG7l8OudsLNyzi3MZwnYTpE93rk1kYCMLukrTRVZdggQ1uDcyRPj
         Stag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764606039; x=1765210839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cspTNBzt+I5BtqKUZhFjJeUVwDFagEE/l2BBHLFNpxc=;
        b=k6K2N+IaijlbyV6r8OidyAsOI673jcPxdcNnSxgWmUg+BfWeUEubKNGnaRO2rQHKQi
         /G1vGkFhvjIFCY5OBWKoLQzsIQZokqEu7IJsrwUqnjDw8MWtRIa8vPeFrc34k2kXoOAS
         140WQ3+zyJanstj2VYe2yOMYn7uPkiv9l1mWmQc7Gb+HS/UUM2O1rqoAZplyvFah41q8
         fvwL1LY1BBMteV32a0B9XapRWcjfeHwBoftos0GU/qwTljJ0yk5AwreiaKWQr2mmk6ke
         DWTPigRkPgm7P5wgBavIZCdR4IedNYdGB1cYcfeJuZe6EBXc6FyZf9LiDdLrgfP+FppD
         1LUw==
X-Forwarded-Encrypted: i=1; AJvYcCXiMx4AlPBACN5qiL0dewBIQuY55r4C3ZeQgdwqldwwt7TGcVSqkweoylxyAUCwU7ZVzPtZYzvX3D9GRR+egw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyC2q6YTFo5ySXTbet/D1AF9IkeYI/Fc8BQ9m6+SoQM5qSZOrYT
	rQmNePPL5OldKHNkKHYkwCwLIdANYSnWrEK9IwfEZ9iQBwhH3++4KpD+WZBBsAqpE+w=
X-Gm-Gg: ASbGnctYdbV4qUnyLxiI3gY33kjWlZvwQWhXzCt09dCRNht14jIIKU7Mcgkv1AjpNdB
	gUg502xJkqDTPq+5qzpogzZpGHomweCoKfQloZDSZUoF0zgrXUAgPz1cCWgYjows/nY1H8rgRLG
	6vT+fTpo4QwxLFiYLgRHhS0zbXmO5jAWaY6Nd9nmp91pv8+VCZXpGtnlxNz/NQT8qirDhBeNuy7
	vxpO8bTEBSmME0Bd/x+6rlY8XIMHMe13Uvni9jyhiboibguNvtwY9UPAAmz6XaPL7G8AOlBt0LR
	gs6+6YbakG/G4rFCmlwNYjf2kVURf/e/WRrDVlqZTV2pEESqLgAGnMewIsQGBW0YtsWciktIkdp
	iZVF6RLypwMQeoDUaeBDhqIU1XMRKNmxnZTmo/z8QOWCUA6oOthq4+EGnRuouSUKcpq9IV08cYC
	GtDpuxFMhgvQDLPg==
X-Google-Smtp-Source: AGHT+IEC7gGRxUyVtd+YE469cDLd2n7LeD/hmDQKTfHSUTd0/7SmlOv1H6YZTofFyUN0T2uY8DHV7Q==
X-Received: by 2002:a05:6a20:2448:b0:345:e30f:d6da with SMTP id adf61e73a8af0-36150f059e2mr47497364637.37.1764606039144;
        Mon, 01 Dec 2025 08:20:39 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:7234:1ea8:3e35:6ee3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15e9c3e41sm14161217b3a.33.2025.12.01.08.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 08:20:38 -0800 (PST)
Date: Mon, 1 Dec 2025 09:20:35 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 0/4] ASoC / rpmsg / remoteproc / soc: qcom: Constify
 buffer passed to send functions
Message-ID: <aS3AU0gEEOvWs4Uw@p14s>
References: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_082042_813990_B70CB5E1 
X-CRM114-Status: GOOD (  16.62  )
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

On Sun, Nov 30, 2025 at 01:36:07PM +0100, Krzysztof Kozlowski wrote:
> Dependencies / merging
> ======================
> Entire patchset is one logical chain, all further patches depend on
> previous ones, thus everything should be taken via same tree or shared
> between trees with tags.  Probably everything should go via ASoC with
> necessary acks.
> 
> Also, first patch or two patches could be taken now for this merge
> window...
> 
> Description
> ===========
> The remoteproc and rpmsg send-like functions should not modify data
> being sent, so buffer should be marked as pointer to const.  This is not
> only self-documenting code but actually increases the actual safety and
> clearly documents who is the owner of passed buffer.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (4):
>       remoteproc: mtp_scp_ipi: Constify buffer passed to scp_ipi_send()
>       remoteproc: mtp_scp: Constify buffer passed to scp_send_ipi()
>       rpmsg: Constify buffer passed to send API
>       ASoC: qcom:: Constify GPR packet being send over GPR interface
> 
>  drivers/remoteproc/mtk_scp.c       |  2 +-
>  drivers/remoteproc/mtk_scp_ipi.c   |  2 +-
>  drivers/rpmsg/mtk_rpmsg.c          |  4 ++--
>  drivers/rpmsg/qcom_glink_native.c  | 13 ++++++++-----
>  drivers/rpmsg/qcom_smd.c           | 10 ++++++----
>  drivers/rpmsg/rpmsg_core.c         |  8 ++++----
>  drivers/rpmsg/rpmsg_internal.h     |  8 ++++----
>  drivers/rpmsg/virtio_rpmsg_bus.c   | 24 +++++++++++++-----------
>  drivers/soc/qcom/apr.c             |  8 ++++----
>  include/linux/remoteproc/mtk_scp.h |  2 +-
>  include/linux/rpmsg.h              | 17 +++++++++--------
>  include/linux/rpmsg/mtk_rpmsg.h    |  2 +-
>  include/linux/soc/qcom/apr.h       |  4 ++--

Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>

I'll let Bjorn decide if he wants to include this in his upcoming pull request.

Thanks,
Mathieu

>  sound/soc/qcom/qdsp6/audioreach.c  |  6 +++---
>  sound/soc/qcom/qdsp6/audioreach.h  |  4 ++--
>  sound/soc/qcom/qdsp6/q6apm.c       |  3 ++-
>  sound/soc/qcom/qdsp6/q6apm.h       |  2 +-
>  17 files changed, 64 insertions(+), 55 deletions(-)
> ---
> base-commit: 7a9e871ce4c7c8a7d75eaef8407083a0525de2dd
> change-id: 20251130-rpmsg-send-const-ae216a1fbd8f
> 
> Best regards,
> -- 
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 

