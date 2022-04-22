Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA10C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 15:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EOJnpk2ZTSe4XlvkHF7bhm+wI7twzAc1m5OKtMN3VFY=; b=uHp6AOehkvc/aB
	DBFPXUBry83jf4cFjq9I/S6mN1yqribBPQnPHMovQJse5iJNOB73KLOYRNzE8syKiCn4dODXPz62/
	+fB31ewGyQYwLN7vauHF+fk0lt9IGzSQ4RfMvWRMdOmyw4eKtwOeqa6jCbPVc8czzV92lgyinmTph
	42a6cQ63WetgpKLS74spfC/IU/f/W+NcHBZ9SLTM/u4NEA6Q5WQt7z30RBPhZBeV9TFB50oSHlspv
	5WUn/XVfR50NSBkfv0L7OZ5FVQw2v6c/YG8rU9aDniICzKsC15Hf6Gi64FkC7RzXW5NFooKbCfAsO
	r0DQFTeRMvfFw5MdeDZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhv7z-0015su-56; Fri, 22 Apr 2022 15:23:23 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhv1K-0013Fi-TE
 for linux-mediatek@lists.infradead.org; Fri, 22 Apr 2022 15:16:32 +0000
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-e2fa360f6dso8938110fac.2
 for <linux-mediatek@lists.infradead.org>; Fri, 22 Apr 2022 08:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=46ALeKzd0IFj5VWKeGIv6vysrvZd6kvXkqYlg2eppOM=;
 b=v1V4Xy7vq+gsCarfOHOKIFnScMvDmomLpQW8suZaTLw8At1krVCkIbp27NHUiXM9W/
 Kx/Mwsl4YN4YouTnBD3irXnQ79KXev/TWkt66kfLkBxGziZ/sjHz9GQHukE+IhwMB20d
 YzR+CkTS1p/Gzmszy6iC4isYLZNfpZd1dPTuHwsgqDf9l3eVIKB2Mq4gCoyZ2T1PTomV
 zpLH65G5wcDD4+/Prdg/+7cOSHoYO2dG5E+i6Qbs0TJLNZiEJl+6mODeEIdXKdQXw4j8
 JNzi/Sb5KB7cKPQn0oP3LCUz1aiDYjasuisPCwNCJczoAoNBtBcLDl1ie0u2Jys3nZJ0
 XZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=46ALeKzd0IFj5VWKeGIv6vysrvZd6kvXkqYlg2eppOM=;
 b=rj5T5Xj8wDxJmm3l7X/lLWHvn+zB3EVfZAjmHKHUgFp8dVOB87eCA0SYSZ4Z+Lgb6N
 RCAtE6l2m+khOm7UGFX3kxDIlCTJdSXNeJ6j74Z9GlkzfgMgWhg6nxfeYxSlAqvRCFFZ
 3jJ9qHJc4WVuYoIFRuKX6Os1YJcPTNQPN6SJstLPN1X1JMaxwe+GnyvbuSIOvAHHPImx
 FspbKzUHAd1FU/RLzxWR/Vs306v13/FRNnUdACdlHoXFu03VhJTsDW32dTC+QV0bML8+
 lOGLGP6yj3V80Af0a5tdKdVZnEsiI8LGLCuGrfZVNtpKVh4XlIR3KqE7fwNfPFmPPVqR
 aOfA==
X-Gm-Message-State: AOAM533NBZFie7UI3MZTLPZ2ZTAasOGcwIelBHy/JbK4Usa0nk6zF317
 CD5q0EUOJ2lmG+qrRXKsJFVJEA==
X-Google-Smtp-Source: ABdhPJyljeQgjHrCPpzEbOJ5Ve6w2vzSSfOb46fgEWxtHLHwjUqmFOaGwW/u2GKHjNuvtVV+snqvYA==
X-Received: by 2002:a05:6870:d0d3:b0:e2:d945:985 with SMTP id
 k19-20020a056870d0d300b000e2d9450985mr6008888oaa.185.1650640588164; 
 Fri, 22 Apr 2022 08:16:28 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
 by smtp.gmail.com with ESMTPSA id
 v36-20020a056830092400b006045a6c8047sm827759ott.12.2022.04.22.08.16.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 08:16:27 -0700 (PDT)
Date: Fri, 22 Apr 2022 10:16:24 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: "N?colas F. R. A. Prado" <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, linux-usb@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v1 0/3] Fixes for Mediatek dt-bindings
Message-ID: <YmLGyIOStJJAGSJG@builder.lan>
References: <20220225225854.81038-1-nfraprado@collabora.com>
 <20220404152256.mkksr4oqjt65ytlf@notapiano>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220404152256.mkksr4oqjt65ytlf@notapiano>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_081631_029360_57931899 
X-CRM114-Status: GOOD (  19.70  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon 04 Apr 10:22 CDT 2022, N?colas F. R. A. Prado wrote:

> Hi Matthias,
> =

> Maybe you could pick this series through your tree? It addresses some dtc
> warnings that are introduced with the new nodes in mt8192.dtsi that you j=
ust
> picked up on your v5.18-next/dts64 branch.
> =


I don't see a reply from Matthias, so I've picked up this (the
remoteproc) fix in our tree.

Thanks,
Bjorn

> Thanks,
> N=EDcolas
> =

> On Fri, Feb 25, 2022 at 05:58:51PM -0500, N=EDcolas F. R. A. Prado wrote:
> > =

> > This series has some fixes for Mediatek dt-bindings. It solves some
> > warnings printed by dtbs_check, both for already merged Devicetrees, as
> > well as some that would be introduced by the changes to mt8192.dtsi in
> > [1].
> > =

> > [1] https://lore.kernel.org/all/20220218091633.9368-1-allen-kh.cheng@me=
diatek.com/
> > =

> > =

> > N=EDcolas F. R. A. Prado (3):
> >   dt-bindings: remoteproc: mediatek: Add interrupts property to mtk,scp
> >   dt-bindings: usb: mtk-xhci: Allow wakeup interrupt-names to be
> >     optional
> >   media: dt-bindings: mtk-vcodec-encoder: Add power-domains property
> > =

> >  .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml     | 3 +++
> >  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml      | 3 +++
> >  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml   | 1 +
> >  3 files changed, 7 insertions(+)
> > =

> > -- =

> > 2.35.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
