Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FE5C61DA3
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 03:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wvNe81rytZk90715HG2PCFmsyrxc7m5FnCYoyAF2fY=; b=vYVkUxy3OswPIBAqz7HuKoAYE6
	1bWB4kdYRRh1kN3XEdBucmLqg3AXm36QV3stkuMZMYgFqfNAB01bGmKaLTC+GGCNV5Z2T7azZPNGo
	A4f9uIVoLTzJ6fhW4eCTcaytTDjHBjz4Xc5I6qZWetNf4UUPsqTOJYSzG5OSJxvnvNH5iOY1VZ0u5
	+X+c+CUbSdt5mxkmBycJ+S9dXS8rourO2uwYrtrtTYfkVi6kxV4eDM/dnty8t1pckGwnGpwjP5NMy
	pMh8hpxSIrywPOomQ7cyKNTa+/rTFKm1JgdWX0FNXh7IjTIxkhv42p+EgpIW2uZjL8JFN6e432Yrv
	bolVhMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJXa-006SoG-3E; Tue, 21 Feb 2023 03:42:06 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUJXX-006SnF-I4
	for linux-mediatek@lists.infradead.org; Tue, 21 Feb 2023 03:42:04 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id f23so2603586vsa.13
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 19:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1676950922;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2wvNe81rytZk90715HG2PCFmsyrxc7m5FnCYoyAF2fY=;
        b=gSgc21gqnxo+9Vtja7nTND1/RIBvEEnMHnGSZgMoyHlmJBIoboHUVtAcSe6xCZwf2Q
         snyU3Wyrrr8mxSbEhmlhvXNkQMzTR26RdOV8pZ58igo6ABEvNDcRU7RsEwUgICrxM8lT
         fWm++o8S2Ar+lAbv8CKcLdK9FvBzghYCXeU6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1676950922;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2wvNe81rytZk90715HG2PCFmsyrxc7m5FnCYoyAF2fY=;
        b=dczSZv8fmiPrti+9rh7WNTyAxMTHrVhJuBVADn9VZNKuvlb10xqSUjjcj0gUdSJPLn
         o9g7V9JJ/qRPF162/8wAssg0wFZpkGMtXQaywrbzMAIxMPzrU6ayKANyVCaxNPSZ/ggS
         dX6GbHTDMDMTnwv+pdVuXtOZfIjuGG/t2mrk30MexkYG8Tzg+H858JvRjJkS3VyUJ14n
         NdKF5SZF+HaAgc78hv48f4v80oLcGAUkhAC7BVKbKvpq1qhHz48DqgzjwALBmRPTnP2y
         NpusCYDVqPPKPur8SIgIuFQRes14xo3dbB/j5GY56eivYhQK1iExPIpma8/KI78lPco5
         q+LA==
X-Gm-Message-State: AO0yUKVik95W2s76qJb8rAiC+HuQwAckP42SScdrfwPbrYEygh5gpqtN
	Rz5tg1zfKvLbqprlieybkQNAtttmJjHzmaNpu3U0ZQ==
X-Google-Smtp-Source: AK7set9PgnBSccgq3Ct1gGwwBge0XfivA3QB+E6pPiBYxo7qYILxFZVZjtWeBwAiOZDIwlHlnxLPhZ0nRJ2hPyMS95U=
X-Received: by 2002:a67:f6c1:0:b0:411:a14d:6bac with SMTP id
 v1-20020a67f6c1000000b00411a14d6bacmr829198vso.44.1676950922742; Mon, 20 Feb
 2023 19:42:02 -0800 (PST)
MIME-Version: 1.0
References: <20230220150111.77897-1-angelogioacchino.delregno@collabora.com> <20230220150111.77897-25-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220150111.77897-25-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 21 Feb 2023 11:41:51 +0800
Message-ID: <CAGXv+5H7osyeENN1un9+isBxwM=bzniSg2teBf7Gubm37_NzmQ@mail.gmail.com>
Subject: Re: [PATCH v3 24/55] clk: mediatek: mt7622: Move apmixedsys clock
 driver to its own file
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_194203_640637_43048CF7 
X-CRM114-Status: UNSURE (   8.91  )
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

On Mon, Feb 20, 2023 at 11:01 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for migrating mt7622 clocks to the common simple
> probe mechanism, move apmixedsys clocks to a different file.
> While at it, use the builtin_platform_driver() macro for it.
>
> During the conversion, error handling was added to the apmixedsys
> probe function.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

