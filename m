Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B212C71153
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Sep 2023 16:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDhYFJwsc72fnWtZtTj1LIiHVNNT1m2etRJ8fUWREuo=; b=jTDnrwz0wDoRWg3ZLobOvktPB5
	9zlsoeoeMtrJiwsu3a34YR9tGkbSb0+joWG6Ugzk+zQfKeYGw4QF6Yl5JMngyelMukIp9cG4RW/rn
	EF4S0v9gXhFbYIqagcbKA7Zp8Wvq6IJSZHsnNetLlZ7iPYjrsslOsIPCeeQYMo7SoNNpZLl3cZaIa
	z3+84EmoRnsHaG4qFLkdWRcMBW1cFN1VWskJsvpfDCKFJ1XV77tOnlaadGo8nWI1y9tUXqncWgG3b
	Uf3fD1Z1ndtBDguo4u1Zutua0K4ndv8Gj5xXRKMiOcLwMd+PBMHn37Uo8/diYVOd92ZyNGRN0qbU/
	HxfiVyBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCvR-004ULo-26;
	Mon, 04 Sep 2023 16:59:45 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCvO-004ULC-0t
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Sep 2023 16:59:43 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d7d15e6884dso1268244276.0
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Sep 2023 09:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693846778; x=1694451578; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bDhYFJwsc72fnWtZtTj1LIiHVNNT1m2etRJ8fUWREuo=;
        b=QwP5cRsFkyNzRMHv/NFw5Ar4HCL6pN2pTR7izTI9fj23JrDGQRjAO0zPur8E1IntSE
         /sTYF0K8EUFTzJHImAAyGVX4ewHkZ08H14s94/I3wu+9v+bXwGqJo7pTljcxA6RpvgSK
         XKELvUmmryX1OWL0BZt8y7x6nIciJxJqLtfO9t/QC751VYTc3ts19ny5p0ThO8gWobnL
         jOPO+G/zZyfQ7ZiWTaFkRCr3VVV/mQJTBNImerHyCzTW2sJ1tC6x46cDH48WXSn5M5NC
         t/pOkTZDOin6ZmXMabZSRCNzL3hKUZnwnyCKDQM+LjqD37D7LroBwAKoNklybjj3iu2Y
         3FYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693846778; x=1694451578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bDhYFJwsc72fnWtZtTj1LIiHVNNT1m2etRJ8fUWREuo=;
        b=IpdtuoLrRL2JKig8DzEYVFjJPcnRJf3sF9iWUmKcYlEohs42MPeIPcf0qtLawnytlC
         tWMUFsd4X5loW2DJ0+/TlmQ61fLemVwbj7oJlVg4kA1nfkDBtpIBN8dY7fEgwwxHwz4K
         I+Hf0lIlQc9/EZM/FGoOpDa/7vANFdLxPPeIZDDZx8Z3h+vc4/Mhdml049xTYUnw+6P/
         oErq7wBJ6OERtSCbgSHkdKb+AjtouvC6IJeSCeXHi+bpLa2gvpGoOsk+7KqwySqmmSP/
         WRRlkICssGdCYidxDiQtEHrb2kpMZz2tlZ4Ic3rMOuR7/PLi5cLW79Q/Q045cbnubUL2
         ngfQ==
X-Gm-Message-State: AOJu0Yzbp1chDo0QMB0vHgxwPEky2IfmtR+d+ql7YMjk5kWb/9Dr33/H
	/gY/XByZrbYvBvtVmmQ8FDuK8uyrT51ETVYRQA+yWA==
X-Google-Smtp-Source: AGHT+IF/k/r0ySRsvTXjtMGk3oMS3ChIKX3SqVSvJ4wdwZ6HlhuHg/ElJKXsqxnttmxy4KSgE1/uIN6gA6j94CZFBuw=
X-Received: by 2002:a25:a2d2:0:b0:cfe:8cbf:5d28 with SMTP id
 c18-20020a25a2d2000000b00cfe8cbf5d28mr10283989ybn.31.1693846777856; Mon, 04
 Sep 2023 09:59:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230904161516.66751-1-vignesh.raman@collabora.com> <20230904161516.66751-3-vignesh.raman@collabora.com>
In-Reply-To: <20230904161516.66751-3-vignesh.raman@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Sep 2023 19:59:26 +0300
Message-ID: <CAA8EJpq_cmFQ6TGy1xELh3ButWKLfSkQcp5ix049s_iqKw6DvQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] drm: ci: Force db410c to host mode
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, helen.koike@collabora.com, 
	guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	david.heidelberg@collabora.com, daniels@collabora.com, 
	gustavo.padovan@collabora.com, emma@anholt.net, robclark@freedesktop.org, 
	robdclark@google.com, anholt@google.com, robdclark@gmail.com, 
	airlied@gmail.com, daniel@ffwll.ch, jani.nikula@linux.intel.com, 
	mripard@kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, virtualization@lists.linux-foundation.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_095942_317105_DC1DF5BA 
X-CRM114-Status: GOOD (  19.93  )
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

On Mon, 4 Sept 2023 at 19:16, Vignesh Raman <vignesh.raman@collabora.com> wrote:
>
> Force db410c to host mode to fix network issue which results in failure
> to mount root fs via NFS.
> See https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/cb72a629b8c15c80a54dda510743cefd1c4b65b8
>
> Use fdtoverlay command to merge base device tree with an overlay
> which contains the fix for USB controllers to work in host mode.
>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>
> v2:
>   - Use fdtoverlay command to merge overlay dtbo with the base dtb instead of modifying the kernel sources
>
> ---
>  drivers/gpu/drm/ci/build.sh                         |  5 +++++
>  .../gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts  | 13 +++++++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
>
> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> index 7b014287a041..92ffd98cd09e 100644
> --- a/drivers/gpu/drm/ci/build.sh
> +++ b/drivers/gpu/drm/ci/build.sh
> @@ -92,6 +92,11 @@ done
>
>  if [[ -n ${DEVICE_TREES} ]]; then
>      make dtbs
> +    if [[ -e arch/arm64/boot/dts/qcom/apq8016-sbc.dtb ]]; then
> +        dtc -@ -I dts -O dtb -o drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dtbo drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
> +        fdtoverlay -i arch/arm64/boot/dts/qcom/apq8016-sbc.dtb -o arch/arm64/boot/dts/qcom/apq8016-sbc-overlay.dtb drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dtbo
> +        mv arch/arm64/boot/dts/qcom/apq8016-sbc-overlay.dtb arch/arm64/boot/dts/qcom/apq8016-sbc.dtb
> +    fi
>      cp ${DEVICE_TREES} /lava-files/.
>  fi
>
> diff --git a/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts b/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
> new file mode 100644
> index 000000000000..57b7604f1c23
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/dt-overlays/apq8016-sbc-overlay.dts
> @@ -0,0 +1,13 @@
> +/dts-v1/;
> +/plugin/;
> +
> +/ {
> +    fragment@0 {
> +        target-path = "/soc@0";
> +        __overlay__ {
> +            usb@78d9000 {
> +                dr_mode = "host";
> +            };
> +        };
> +    };
> +};
> --
> 2.40.1

Can we use normal dtso syntax here instead of defining fragments manually?

-- 
With best wishes
Dmitry

