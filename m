Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 119DEC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 03:30:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4CBA206EB
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 03:30:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZCD9MUxu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YoLCiZxh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4CBA206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nEFX5Ib9bWxH7RUXtvzOVdx56AVkrSlXsG8FMveDq+0=; b=ZCD9MUxuyVV/f13rWkgiTZN0Z
	Nh43HvIsq3IeNwrvSFqbmWB0SdJcmauPw38bzKqGHUhK1XjUbYQFU+PLX7uVaDs1G3fpz04uVPdc3
	gy6UOH4Rz9veryvhE/Cq0OtkfpqC+K/zzrv+Hk0MrtTmHuahYY8KpvnaDiNVK0wNCXcGWClP8rAJI
	tkANXqZrfcuR6BNZsP51aTe1kfqG3MkKBoITWQzSbtkiSWSaL2cQYIQcdJ1SdtrU4uZgLW5dD3gVK
	8Cl/2K6zmUtmJoZft1Bj7FBqe+NcPIGWe4Mp0kpRtGwtsY7XoEuFDnvHLplilf0bmRlKRKl0/AEpV
	Jez6uREPw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqTSR-0006F9-UR; Wed, 01 Jul 2020 03:30:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqTSO-0006Ec-O7
 for linux-mediatek@lists.infradead.org; Wed, 01 Jul 2020 03:30:45 +0000
X-UUID: 235ff04e407842fbb2c4d7fac15d800d-20200630
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hMaB+50yOQw2HFn/LcuwEydwHyNKHncHsixDvcNbkVA=; 
 b=YoLCiZxhQOYET+bqLy0fgGdz6hdx4/7WcJs+ulz07qLdqZuslI3mWJZS1CRY57+OJxEdM06pYUNtPyD+HphdHfpXAxPjQ34IooDBaD6N4r1Je7/iUczb2bQgG9Gx9sbY0kZUQx2XIsx/zWLyuUwr3gTxnmULtG8NXGcK7jiX4L0=;
X-UUID: 235ff04e407842fbb2c4d7fac15d800d-20200630
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <tiffany.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1795921414; Tue, 30 Jun 2020 19:30:20 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Jun 2020 20:30:38 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jul 2020 11:30:30 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Jul 2020 11:30:30 +0800
Message-ID: <1593574231.1533.0.camel@mtksdaap41>
Subject: Re: [PATCH v2 10/18] Revert "media: mtk-vcodec: Remove extra area
 allocation in an input buffer on encoding"
From: Tiffany Lin <tiffany.lin@mediatek.com>
To: Alexandre Courbot <acourbot@chromium.org>
Date: Wed, 1 Jul 2020 11:30:31 +0800
In-Reply-To: <20200626080442.292309-11-acourbot@chromium.org>
References: <20200626080442.292309-1-acourbot@chromium.org>
 <20200626080442.292309-11-acourbot@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_233044_955317_E530CEFF 
X-CRM114-Status: GOOD (  15.10  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Pi-Hsun
 Shih <pihsun@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-06-26 at 17:04 +0900, Alexandre Courbot wrote:
> This reverts commit 81735ecb62f882853a37a8c157407ec4aed44fd0.
> 
> The hardware needs data to follow the previous alignment, so this extra
> space was not superfluous after all. Besides, this also made
> v4l2-compliance's G_FMT and S_FMT tests regress.
> 
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>

> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> index 05743a745a11..f2ba19c32400 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
> @@ -299,12 +299,14 @@ static int vidioc_try_fmt(struct v4l2_format *f,
>  
>  		pix_fmt_mp->num_planes = fmt->num_planes;
>  		pix_fmt_mp->plane_fmt[0].sizeimage =
> -			pix_fmt_mp->width * pix_fmt_mp->height;
> +				pix_fmt_mp->width * pix_fmt_mp->height +
> +				((ALIGN(pix_fmt_mp->width, 16) * 2) * 16);
>  		pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width;
>  
>  		if (pix_fmt_mp->num_planes == 2) {
>  			pix_fmt_mp->plane_fmt[1].sizeimage =
> -				(pix_fmt_mp->width * pix_fmt_mp->height) / 2;
> +				(pix_fmt_mp->width * pix_fmt_mp->height) / 2 +
> +				(ALIGN(pix_fmt_mp->width, 16) * 16);
>  			pix_fmt_mp->plane_fmt[2].sizeimage = 0;
>  			pix_fmt_mp->plane_fmt[1].bytesperline =
>  							pix_fmt_mp->width;
> @@ -312,7 +314,8 @@ static int vidioc_try_fmt(struct v4l2_format *f,
>  		} else if (pix_fmt_mp->num_planes == 3) {
>  			pix_fmt_mp->plane_fmt[1].sizeimage =
>  			pix_fmt_mp->plane_fmt[2].sizeimage =
> -				(pix_fmt_mp->width * pix_fmt_mp->height) / 4;
> +				(pix_fmt_mp->width * pix_fmt_mp->height) / 4 +
> +				((ALIGN(pix_fmt_mp->width, 16) / 2) * 16);
>  			pix_fmt_mp->plane_fmt[1].bytesperline =
>  				pix_fmt_mp->plane_fmt[2].bytesperline =
>  				pix_fmt_mp->width / 2;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
