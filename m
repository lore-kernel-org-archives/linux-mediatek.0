Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11768C64ED8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 09:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=To6ovkWvUPMLveAkla67N038E57W+HtJ9fEs6w0SxJo=; b=bYVPL36q/yvSo2zL00jUvKs7Bv
	RauWwaVXKliEzfqT6PGlXlZ1WcoD2Fw7mJpMt7b7dFOSh1hoz0+zXK0gpElPydnxheTqOC8TOKXEm
	pJ+9kcddR7ogIZV0Hh1dERH1X31+RL21Olku1vNxvpDjWNwwahvLPfAdD8SwI1OWekp862TjeRIVG
	o5BSADVVsJ5eeexp+S3U936S0l1XLtRUjonBlQ4qVEbKVVP6Udss+dwJTeiNflff6idWIKiXZCeN6
	A3KSsgpvxew9iYmn+mTpRczsGU3PhFSwNHEbU7mXdbSgEGX5nS5RmT7nMU0gkr5C1ZiKcsPacq20T
	dp8tAApw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUqB-001ngt-Ix; Fri, 24 Feb 2023 09:58:11 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUpp-001nVu-9T
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 09:57:50 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id s1so4339913vsk.5
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 01:57:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=To6ovkWvUPMLveAkla67N038E57W+HtJ9fEs6w0SxJo=;
        b=SCZXVvyqkuR2VF2+kZIdjTTTHiFTGYGmp4ANFKViYdqRj5iVvG4/ZBVzH4sxmZMvnQ
         AGJ/gul372LQ1l/JDlyjIkCONrXUDAg4JUlRLoNJURUfV56u6Am3R3ofagziCYJHM+c5
         pQIKWE77vIGMyhTyXI9R02itEdeLBsak2mA44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=To6ovkWvUPMLveAkla67N038E57W+HtJ9fEs6w0SxJo=;
        b=WlT+7k52rjWVf5P964l8GgmmzCZj/FTrKHdGQ6ye2oBzfy6A7c/5e8+OjKPTHzFG3Z
         VFI5ampghiJ1/x6QJ5tPwyLbsd4dIO2sPOUPDRS0HJU27hCG2MydnFeE6mo7eY+MqmGu
         N/MJKi7WEe/ujcxyI1f0TZxmqU08NJvmcLFFv4MQl9CIqWYSsNqs1ZOsmDUvaENRROca
         mcTsTuPqNtBfXdK9NJDwH/yy+6e54lZbkX1EWBV2UVjtyoV6o4GL4Z5kyzhruG/4SEkO
         z7IjCRrhSiw0yKnoNhB3DUhGpc6J98U2VBs9u5eFyxXF1VCOJ0Our32bpWkQIZ1dQwJF
         DXZQ==
X-Gm-Message-State: AO0yUKVQGvZgfGmZ6lYmiIFfFUvbBkvS9kINNa8tePjHFgCfFN0U6LAD
	R+HZOSq/myHgR1LpADAFUM9nJNNfFVkQ1tqu2XCOHg==
X-Google-Smtp-Source: AK7set++hj8wJ55xIDhOBwZ0CgnOb6HCyOt28ij7RVUkakGaWXLPL0MmWhf+iYu9V4dbycYGUVr7Jzh3WvhhVcAhGVU=
X-Received: by 2002:ab0:5550:0:b0:68a:a9d:13f5 with SMTP id
 u16-20020ab05550000000b0068a0a9d13f5mr4692696uaa.1.1677232668304; Fri, 24 Feb
 2023 01:57:48 -0800 (PST)
MIME-Version: 1.0
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com> <20230223134345.82625-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223134345.82625-10-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 17:57:37 +0800
Message-ID: <CAGXv+5EtbMtDTwXvOqGBSNXPF4z88F-Hr0M5=PW+JeV4i_YYng@mail.gmail.com>
Subject: Re: [PATCH v2 09/16] arm64: dts: mediatek: mt8192-asurada: Add MFG0
 domain supply
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_015749_359547_8485BF53 
X-CRM114-Status: UNSURE (   7.22  )
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
> From: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
> The mfg0 power domain encompasses the whole GPU and its surrounding
> glue logic. This power domain has a separate power rail.
>
> Add its power supply for Asurada.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> [wenst@chromium.org: fix subject prefix and add commit message]
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> [Angelo: Reordered commits to address DVFS stability issues]
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

