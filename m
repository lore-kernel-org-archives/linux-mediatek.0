Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F18C6FD19
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 15:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PkWxgKROHRYU8EW1HqSnnu3dg67i+pl/+5/7rSkjx8w=; b=gCeBC8X9sXoUhnzMAywCO9nfzR
	AMrQGXG4ABXJaq+kuVLeTx0nOhMjLcszVtA52uZT4Y3XbbSon8Ii2Y/vArmSGvIuD7BpYHeHa/UrL
	6iWotvEtxj+NZ+APB6UnAzo+duZIfBdurvuhUOOV9xzkauTSCwqCEWX7v1LjmuXdQ5DMlaVgoXHTj
	b0+TzDyxlLX2EXE0e3vgFo+rP5i7ay/MgvgSCVIWPbBgXycnYFap/nyJ02LTqMQaLfrdTlJkeIQlC
	wwHC/WT3VPThyPiyABg4v5+cy3wimHvNVT8C/qZET0ldh/L+r1mg8EtTEsHwaooEpn2bVwWhoFYiD
	PGkh2Eow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbNS8-002kWn-4H; Sun, 12 Mar 2023 15:17:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbNS4-002kVl-RI
	for linux-mediatek@lists.infradead.org; Sun, 12 Mar 2023 15:17:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 53A9C60F56
	for <linux-mediatek@lists.infradead.org>; Sun, 12 Mar 2023 15:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA049C433D2
	for <linux-mediatek@lists.infradead.org>; Sun, 12 Mar 2023 15:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678634254;
	bh=tru9IYsAeEZs7842zmcwYj45aS79A6X70s7CoPhRUS4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l3MqaJjWlPq6mnTP9FFQRgrKxLJSbnd3e/0j95wRnw1EcG2TDHvsvUWcbkYGcs6mZ
	 EuwlYj72RxWqCLDx4evZyvDsVjdQYC9/2pBJmdBw28UiAsLnfxWbyhT/O1tstMz4/l
	 5G410X0yOwk0P/BhZiRWW1sQNZBdRxzew2IkNJ1Hn1mFzs8JMRYuID9PyD09OQuq4D
	 zkHiN0DeXliRyUh6X79P9NcDgNegsFWFmy5Xg7tCMsC5gnJmC8hZoGEBCfqnFg2NE4
	 ndbLs98USqQz+2J6HODfORCi0fyE57/0T5GHNKN4Y5CmpB94oXl5DNrWjVNWCaWs5y
	 VqnyenHA8XPzA==
Received: by mail-lf1-f48.google.com with SMTP id bp27so2373994lfb.6
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Mar 2023 08:17:34 -0700 (PDT)
X-Gm-Message-State: AO0yUKVNqwq2pMhLivfgygr0l9/ebXRLYjl1ZU4WlZgIlnxBmCtc5y0y
	nNIthct5kq+inrlVOEOu9Xnibt1p+MFeMHzP7g==
X-Google-Smtp-Source: AK7set8/I9MPGwlCzSSF7k8LkXr9Fx2O+jLzHm+erabCx2bDfUoxf2kd9EGkdr3s+tml8ANOCBpwUGzBEAFf8iBYLHM=
X-Received: by 2002:ac2:509a:0:b0:4e8:44ee:e2d with SMTP id
 f26-20020ac2509a000000b004e844ee0e2dmr159592lfm.5.1678634252782; Sun, 12 Mar
 2023 08:17:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230309210416.1167020-1-greenjustin@chromium.org>
In-Reply-To: <20230309210416.1167020-1-greenjustin@chromium.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 12 Mar 2023 23:17:20 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-Bobq8nfbBjabbXjxK_xw6uPZa2nBLv_ePJuKfCwpQwA@mail.gmail.com>
Message-ID: <CAAOTY_-Bobq8nfbBjabbXjxK_xw6uPZa2nBLv_ePJuKfCwpQwA@mail.gmail.com>
Subject: Re: [PATCH v8 0/3] drm/mediatek: Add support for 10-bit overlays
To: Justin Green <greenjustin@chromium.org>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com, 
	justin.yeh@mediatek.com, wenst@chromium.org, chunkuang.hu@kernel.org, 
	p.zabel@pengutronix.de, matthias.bgg@gmail.com, daniel@ffwll.ch, 
	daniel@fooishbar.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_081736_986328_43D52199 
X-CRM114-Status: GOOD (  18.39  )
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

Hi, Justin:

Justin Green <greenjustin@chromium.org> =E6=96=BC 2023=E5=B9=B43=E6=9C=8810=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=885:05=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> This patch series adds support for 10-bit overlays to the Mediatek DRM dr=
iver.
> Specifically, we add support for AR30 and BA30 overlays on MT8195 devices=
 and
> lay the groundwork for supporting more 10-bit formats on more devices.

I've applied this series to mediatek-drm-next [1] with fix up for
checkpatch warning. Remember to fix checkpatch warning and error
before sending patches.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> 1. Refactor plane initialization logic to allow individual DDP components=
 to
> provide their supported pixel formats.
>
> 2. Add AR30 and BA30 support to overlay driver.
>
> 3. Enable AR30 and BA30 overlays on MT8195.
>
>
> Version history:
> v2:
>  * Rebase and resolve merge conflicts with the AFBC patch.
> v3:
>  * Moved 10-bit support detection to mtk_disk_ovl.c
> v4:
>  * Moved formats to mtk_disp_ovl.c and mtk_disp_rdma.c
> v5:
>  * Minor style adjustments per checkpatch.pl
> v6:
>  * Refactor patch into patch series.
>  * Add formats directly to private data.
> v7:
>  * Gate setting OVL_CLRFMT_EXT register on compatibility.
>  * Split patches for adding 10-bit support and enabling 10-bit support on
>    MT8195.
> v8:
>  * Updated descriptions for patches 2 and 3 in the series.
>
>
> Justin Green (3):
>   drm/mediatek: Refactor pixel format logic
>   drm/mediatek: Add support for AR30 and BA30 overlays
>   drm/mediatek: Enable AR30 and BA30 overlays on MT8195
>
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  4 +
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c     | 94 +++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c    | 38 +++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  4 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  4 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 20 +++++
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c    | 24 ++----
>  drivers/gpu/drm/mediatek/mtk_drm_plane.h    |  3 +-
>  8 files changed, 173 insertions(+), 18 deletions(-)
>
> --
> 2.39.1.456.gfc5497dd1b-goog
>

