Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B30C46CD2
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jan 2024 18:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EDvSS5EfgS89Da1ympYSZCydd5M5t9rbOx6l5RGUOgg=; b=EAzM8FATKYCKV/uI7ZVeHfesC+
	32ySAr3HvPXCubtxMfG/4Lr2L65fiQcAvGPiuaolxmGMV7b4XeA714n58TS4xnYAmX0Ekv1IDQJuZ
	ejdGnMbnOLLdipsgGAtOv83SJnDu1mQe5T9OMoQ7xQpmBYdZKTaFKuRGPhLzo/h+4JJkwfD3Xhr8e
	Fzh9PvIXyMcsJ237Y1GrF/Q2CB4hv8q/yX1vX+z1VrJ5se+o96NgdWTxkTeZLapLs932JrAnTmmfk
	Y6eFAhc3t2aavLN1SgAAtlg8PLCuLW9+rOSX77j1dmr7ornnjMqf9aqD0XZN+YBqLCg7ZGeN90iwU
	s7mlAZYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTnhJ-000000080xe-1uel;
	Sat, 27 Jan 2024 18:46:33 +0000
Received: from mgamail.intel.com ([134.134.136.31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTnhG-000000080wi-2zSh;
	Sat, 27 Jan 2024 18:46:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706381190; x=1737917190;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EYPyaz87RkOJljahQF8funE2XdsGXXg6gukJ+v+90GA=;
  b=Wb9Ewt5uzMlHwOUQEMD4+2k7ervB3L2rZNZ1hFes6snsoLS13GCbi701
   CbZjjKQO6r9kfprjBtKJnyOTR6tfc/C4jvo9Wb9++wyFGQTgRGX7r4tq6
   ECNmy4IuQeH4h9v4r3iRo0MD5wYMPdn3mW6PcmdSMQFWqrdjnpXnNv07J
   x7fwe/C8lEslklDFgv3Bg7Yku0rz9OmAD4zFVrj3fVvUNAnYBYLb9zf4U
   DmS1Mu19jwK1XxE4mMD+iVL9/hjv56Fjtsg1MfLp4ikJVb24OZoTioI+T
   SVdHoqvyyOZeLJaxeMTREHiwgiayAvrkXqZo3c7R8daJr9L5M7gSzvIrG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="466977476"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="466977476"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 10:46:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="910649621"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="910649621"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 10:46:16 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 4755F11FB1F;
	Sat, 27 Jan 2024 20:40:25 +0200 (EET)
Date: Sat, 27 Jan 2024 18:40:25 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Bin Liu <bin.liu@mediatek.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 03/17] media: media-entity.h: Fix kerneldoc
Message-ID: <ZbVOGaw-8qU2QNle@kekkonen.localdomain>
References: <20240126-gix-mtk-warnings-v1-0-eed7865fce18@chromium.org>
 <20240126-gix-mtk-warnings-v1-3-eed7865fce18@chromium.org>
 <e6b72dff-911e-4923-9996-b3b7db36fb8e@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6b72dff-911e-4923-9996-b3b7db36fb8e@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_104630_823413_97269A15 
X-CRM114-Status: GOOD (  26.33  )
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

Hi Randy,

On Fri, Jan 26, 2024 at 05:51:06PM -0800, Randy Dunlap wrote:
> 
> 
> On 1/26/24 15:16, Ricardo Ribalda wrote:
> > The fields seems to be documented twice.
> > 
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  include/media/media-entity.h | 4 ----
> >  1 file changed, 4 deletions(-)
> > 
> > diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> > index 2b6cd343ee9e..c79176ed6299 100644
> > --- a/include/media/media-entity.h
> > +++ b/include/media/media-entity.h
> > @@ -337,10 +337,6 @@ enum media_entity_type {
> >   * @info.dev:	Contains device major and minor info.
> >   * @info.dev.major: device node major, if the device is a devnode.
> >   * @info.dev.minor: device node minor, if the device is a devnode.
> > - * @major:	Devnode major number (zero if not applicable). Kept just
> > - *		for backward compatibility.
> > - * @minor:	Devnode minor number (zero if not applicable). Kept just
> > - *		for backward compatibility.
> >   *
> >   * .. note::
> >   *
> > 
> 
> I'd say that this is correct based on
> https://patchwork.kernel.org/project/linux-media/patch/20231223050707.14091-1-rdunlap@infradead.org/
> 
> 
> Hans, can you please explain this message from you, on 2024-Jan-22, that
> I cannot find in the media patchwork:

It's in linuxtv.org Patchwork here
<URL:https://patchwork.linuxtv.org/project/linux-media/patch/20231223050707.14091-1-rdunlap@infradead.org/>
and also in the media stage tree (as indicated by the state) but not yet in
master AFAIU.

> 
> 
> Subject: [git:media_stage/master] media: media-entity.h: fix Excess kernel-doc description warnings
> 
> 
> 
> This is an automatic generated email to let you know that the following patch were queued:
> 
> Subject: media: media-entity.h: fix Excess kernel-doc description warnings
> Author:  Randy Dunlap <rdunlap@infradead.org>
> Date:    Fri Dec 22 21:07:07 2023 -0800
> 
> Remove the @major: and @minor: lines to prevent the kernel-doc warnings:
> 
> include/media/media-entity.h:376: warning: Excess struct member 'major' description in 'media_entity'
> include/media/media-entity.h:376: warning: Excess struct member 'minor' description in 'media_entity'
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
>  include/media/media-entity.h | 4 ----
>  1 file changed, 4 deletions(-)
> 
> ---
> 
> diff --git a/include/media/media-entity.h b/include/media/media-entity.h
> index 2b6cd343ee9e..c79176ed6299 100644
> --- a/include/media/media-entity.h
> +++ b/include/media/media-entity.h
> @@ -337,10 +337,6 @@ enum media_entity_type {
>   * @info.dev:	Contains device major and minor info.
>   * @info.dev.major: device node major, if the device is a devnode.
>   * @info.dev.minor: device node minor, if the device is a devnode.
> - * @major:	Devnode major number (zero if not applicable). Kept just
> - *		for backward compatibility.
> - * @minor:	Devnode minor number (zero if not applicable). Kept just
> - *		for backward compatibility.
>   *
>   * .. note::
>   *
> 
> 
> 
> Thanks.

-- 
Regards,

Sakari Ailus

