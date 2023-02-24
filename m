Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1775BC64ED8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 10:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+autSyfRoDxt30ewxX1YvLKRlg9HdF20RRUwqxpiDQ=; b=IjhzYY8B8H2WCq8lTTpuZcZWHx
	Qd1xkG0PG1bDhtErAD3agSzEXv1PEue3zCBiELot5tWuCtSo/AwHQaO2KcQm7xYNM/Yy1XpCBzoJs
	WHLlqXaDembqNQ+hH46/+3RKb6YKGpYSyl0Qlxth+0jaBVIfCW4Hw3cBtYs3RniyV9xcVRRZacAPE
	Phq0sk/FLRu7SHHWsO2nxCstYg9fnZkOsHsO5kUhgkUEc6YOw2YMPJZhC0pg1e5zuuMxUTWxgXmU2
	gKJe+21+g9OlvBzCgJiHOd+NkA294/hHDzB8wxMWUNPHR7k6P9/jH7kw7J/+ckjZRlTuOAeUvMXR9
	fAd9Uk3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUtv-001q0Q-6X; Fri, 24 Feb 2023 10:02:03 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUtr-001pyZ-QC
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 10:02:01 +0000
Received: by mail-vs1-xe33.google.com with SMTP id d7so15011555vsj.2
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 02:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q+autSyfRoDxt30ewxX1YvLKRlg9HdF20RRUwqxpiDQ=;
        b=aFhZU0XUblsofa3a8f2lktGrYKDwUsgUlyVAbG3FaKpNahjKNbSBMVD+Ctdwwgav4S
         rf8w7N5X1uZw4A14zW3pxmd1/zEsxl7usMc1Ezrozmyc4E/7KdDDUZQCJCIyd2szMQFX
         JwAUTkLI4VsAnLKgDPxBZgG3E7MSQ16CbvR9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q+autSyfRoDxt30ewxX1YvLKRlg9HdF20RRUwqxpiDQ=;
        b=DQ90F9+eEJu0Q57zkV1x3+ahOeR6WITtnO9PHfDo7fs3ZghDehG5kZA9DCkQz4BXLt
         +8uP1qa0lHToE7h5DMU/XmYcyZ166/g2p9l21M0fnlIZhOFPuUT/ziCwx4yGR2suxeGp
         xLPEwYAU/8cjcTou7bUt6CiSp7AP00ztX2tLiNb/wBG0SN1Uv6aOJTgWEtCmx55ifrIw
         AFNQ7CnvFJFZjMFcaknfypaf6rSd543bJO4KmdK1ZMN5GaQd4n9Fsc5Q9NnCc9ocmNNd
         oNjKDpmjpwavGhednJVCpkkNQ4Jrk0X5ls28CUVtVyDk6Se7xelZFc8YsDnAbWf/glfN
         c9Ww==
X-Gm-Message-State: AO0yUKUOmfJ9vgMCRT8VBJRCSeJ9ra7tBTs/ihHIq/NcJloplU1Xctwz
	G8YQRTudaXlfRW+XvplW86pHNTTio5Fz6e0t7/R1qw==
X-Google-Smtp-Source: AK7set+Bn1cvtHKXjMtQ0kPBgrKR6znXw+v4bxXjopgE6kLhrCUZeA+NfnCjErHBa621QVIU5P4rewQP7hcs7CGz+eY=
X-Received: by 2002:ab0:1014:0:b0:68b:90f4:1d8c with SMTP id
 f20-20020ab01014000000b0068b90f41d8cmr4232921uab.1.1677232918971; Fri, 24 Feb
 2023 02:01:58 -0800 (PST)
MIME-Version: 1.0
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com> <20230223134345.82625-15-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223134345.82625-15-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 18:01:47 +0800
Message-ID: <CAGXv+5HhtA4J43AVkcb_GS2Qvi7p_N+HkCBnscbsH0ei5u2vxw@mail.gmail.com>
Subject: Re: [PATCH v2 14/16] arm64: dts: mt8195: Add panfrost node for
 Mali-G57 Valhall Natt GPU
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_020159_874517_82FBF15C 
X-CRM114-Status: UNSURE (   9.74  )
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

On Thu, Feb 23, 2023 at 9:44 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add GPU support through panfrost for the Mali-G57 GPU on MT8195
> with its OPP table but keep it in disabled state.
>
> This is expected to be enabled only on boards which make use of
> the GPU.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

