Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FEDC678D4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Mar 2023 09:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TNvXBJNqCTvELcy4YMMxwKgPnzjCMx8BCNeCIplpo2I=; b=3j5ulyEO72FEOF0sJSm7wQ1gyM
	FY1XjOs1rooSMgDr8f8qWgxaZnZtfDv3IMZpwhRwTYjlI6RDaGwzTJpIhw8N5S5EpuMQU3AC661RM
	xbBREaCsx0gCa/yoc7NgssAHHpvnoRnJRtt7Od5ih/PtCanzMFhy4WzDalijVEbmyFuEIbLIOIpDK
	h/5H4Z8/tWZRtcFkunxhKZJzDMIGXE6J67qSdvc3T8cbwBoj4mwaxiQr52pU/whadQdTQopHHe5N+
	foGSkyFSvY7q/qsOSv+vJPLz0p0RTBfO3drY6wQJpcylk8KMl6xHTJtiGxZJaP1KMQGO7KfNInCSE
	B70useiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfhD-001Ywq-Hq; Thu, 02 Mar 2023 09:57:55 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXfh3-001YrP-38
	for linux-mediatek@lists.infradead.org; Thu, 02 Mar 2023 09:57:46 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id f23so21805956vsa.13
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Mar 2023 01:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TNvXBJNqCTvELcy4YMMxwKgPnzjCMx8BCNeCIplpo2I=;
        b=E/ly+MLKc12YJLj8/whHeGltaMLioTu4A9rrMOSx2yfju2dXB4gVtWy6hnlYvigYvk
         J9Ih9OWxFAxd+I76s6PbiZZb/yRdGxrRNWeVRvOJ44GkYiOB+is0KzQTwxHQFxwDEVgV
         XSBJWV8CTppA8bxGMmTLgmOo61irg96ItDfwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNvXBJNqCTvELcy4YMMxwKgPnzjCMx8BCNeCIplpo2I=;
        b=enGOeKObEJxjFvIybGyBgDobZ7Kkb4rQFfGC5YmtxmjMZtRQ+SSH20e2HAUscxAb+G
         xIwYNI3ZYjxEzg8CDC+ngD7h59AbhFy+vgV9EjC56i5f9cC0wnt7YNBp8Cd4UvDM+tCm
         lvMUQF6CReqY5u/mrnjknHFM2CkytMtRQg50FDIZQXfgdKdGnPqhi519+fBPVmZdHjc/
         lKCRGj9hS2iKDWcjbqmynhjWxq5rC+1oCldJzGP7CJBfh9wf5RQDHwtQ47F3jqIUxXEW
         cm23W8Yqnl3WJfYJNmAcvOsm3em+4w0hS4UAGmL9E/FERSOoW+0clfF3CxSajVctynVc
         Sqwg==
X-Gm-Message-State: AO0yUKVUnJHjjuFTfhebQEV0C1UxO1tpUWATpYzHim2OANThl3uSEJya
	xmPKvR3OxlZl3IDeMrPZ1TdTX7KDQQgV6cDGlZQlZg==
X-Google-Smtp-Source: AK7set8bzekPc2ZdrNfn/PLNuJzt+V+Gr/Fkoao4RegP4L/RomYjhOWNObP7CaLKGTA2+SK/R+9P1cd4Sm5pxuCGZ+A=
X-Received: by 2002:a05:6102:419f:b0:412:d91:5ef5 with SMTP id
 cd31-20020a056102419f00b004120d915ef5mr1373330vsb.0.1677751062099; Thu, 02
 Mar 2023 01:57:42 -0800 (PST)
MIME-Version: 1.0
References: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com> <20230301095523.428461-12-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230301095523.428461-12-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 2 Mar 2023 17:57:31 +0800
Message-ID: <CAGXv+5E1A9ZvUX0fW2v-SQJAGi9QB6vH2cpkYPjvSHUxOt5-Kw@mail.gmail.com>
Subject: Re: [PATCH v4 11/19] arm64: dts: mediatek: mt8192-asurada: Fix
 voltage constraint for Vgpu
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_015745_150325_3B087420 
X-CRM114-Status: UNSURE (   8.50  )
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

On Wed, Mar 1, 2023 at 5:55=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The MT8192 SoC specifies a maximum voltage for the GPU's digital supply
> of 0.88V and the GPU OPPs are declaring a maximum voltage of 0.80V.
>
> In order to keep the GPU voltage in the safe range, change the maximum
> voltage for mt6315@7's vbuck1 to 0.80V as sending, for any mistake,
> 1.193V would be catastrophic.
>
> Fixes: 3183cb62b033 ("arm64: dts: mediatek: asurada: Add SPMI regulators"=
)
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-yu Tsai <wenst@chromium.org>

