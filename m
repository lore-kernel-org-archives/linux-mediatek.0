Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32F0C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 13:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jkXKQHYivotpl+MXTBq6gdEOdrXAJpV81rlnASa5jts=; b=dF69uDHSBM4MDr
	pZBnxu+1qu9UI9e749VU84XbocKQs9ypeh1KtvjMvOiDn9KZUE9XZ98bcubz5cyTnHQnYQu9gDxLf
	lcmXpHGYSnZhiYzY1P3VjXn8Onaf1LsVwSaxCr3Af/X1gbVMApmdRv5cZitBLxTbbjke4eJ0e3SHY
	YTkS08yrXxnt3uur6NyQj15hLCUykrv9rIz9OD6/OvaKJTnl/hcsJU7LL7aJ6fJvKOpcnAFH4QEQx
	9FePK7TlZ1Slwg+pBMqzgmXlTxn4N9c9LRhX88ApVEVs9Bn7hH+xmKyLIOm5X1X4dsLT2HNGTnZ+0
	FukWplz66KhGinfWn0gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRaHd-004cTO-Lg; Tue, 08 Mar 2022 13:53:49 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRaHQ-004cOM-Sg; Tue, 08 Mar 2022 13:53:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E894DB818CA;
 Tue,  8 Mar 2022 13:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931D0C340F8;
 Tue,  8 Mar 2022 13:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646747613;
 bh=kKuMXY/kWFSEwzOQtBmx7VatX+a2ZHwU2N6wSzEqcP8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Oa5hkzpmXwNAti5EpS06CldZNsUwpV8quKSv/Xq4a/0cBSgHioYKjsh2dqRvjpywB
 yxperyflVotiv7FEAewxEIEIMSEmKLl9oYdwZwNPCgUncPJVUHNl1FO0u4vLlg7pPo
 wJGIPRvZcNFHyef6P4tOq0cLs0mqSLp+93CoJKLAWdt5ajCqwTVgkQpzeQqNX7EHUe
 QIP9E8ncohi/UAVgTMXuDvr21shroLq+XfAguy7TURInnnntNPOAh3SOhnQ6aJ237e
 MYn4G1gWUTTtkR9AUS9l+rwaiVZVSi+BL1GiFRcNdQ55GtDFkEW6bx5Rjz7AgObkEv
 eKzEOqhWJsgdg==
Received: by mail-ej1-f53.google.com with SMTP id kt27so39522025ejb.0;
 Tue, 08 Mar 2022 05:53:33 -0800 (PST)
X-Gm-Message-State: AOAM531xuR7l3VPqSxI8B/j0HNUbtiA5VtPvTzZXy3hNlH23ri1GC2p6
 X8fV3p2MXPVrV3i+3Vj6Y/etDAKyx8rg/lu/Mw==
X-Google-Smtp-Source: ABdhPJzboOw2MvvOqexJGjBvi3QJGsITzv7M/nIKxqkOwm4WPxLh9N4kBnOgz8nMdZEHDlkXjaC9jzahExCVprRjbfM=
X-Received: by 2002:a17:906:9913:b0:6d6:dc48:5d49 with SMTP id
 zl19-20020a170906991300b006d6dc485d49mr13522321ejb.325.1646747611776; Tue, 08
 Mar 2022 05:53:31 -0800 (PST)
MIME-Version: 1.0
References: <20220308094911.2680291-1-robert.foss@linaro.org>
 <20220308094911.2680291-2-robert.foss@linaro.org>
In-Reply-To: <20220308094911.2680291-2-robert.foss@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 8 Mar 2022 07:53:20 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLL9j77ym0ZTsBwsW==9E8x2jf7A-R-VaSE_yYR5Y=QJg@mail.gmail.com>
Message-ID: <CAL_JsqLL9j77ym0ZTsBwsW==9E8x2jf7A-R-VaSE_yYR5Y=QJg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: drm/bridge: anx7625: Revert DPI
 support
To: Robert Foss <robert.foss@linaro.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Xin Ji <xji@analogixsemi.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chen-Yu Tsai <wenst@chromium.org>, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_055337_115982_D198140E 
X-CRM114-Status: GOOD (  17.28  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 8, 2022 at 3:49 AM Robert Foss <robert.foss@linaro.org> wrote:
>
> Revert DPI support from binding.
>
> DPI support relies on the bus-type enum which does not yet support
> Mipi DPI, since no v4l2_fwnode_bus_type has been defined for this
> bus type.
>
> When DPI for anx7625 was initially added, it assumed that
> V4L2_FWNODE_BUS_TYPE_PARALLEL was the correct bus type for
> representing DPI, which it is not.
>
> In order to prevent adding this mis-usage to the ABI, let's revert
> the support.
>
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>
> Changes since v1:
> - Rob: Instead of reverting the entire commit introducing this,
>        do a partial revert of only the relevant parts.
>
>  .../display/bridge/analogix,anx7625.yaml      | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
