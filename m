Return-Path: <SRS0=eFaK=B7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E87A6C433E3
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:35:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9484204EC
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:35:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="idY2muxk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lXZJddLs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9484204EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DcW9JxK5oemEEIP+osLMnFXKl1bedMC8nSOoa/vj5Cg=; b=idY2muxkbgB8KaQqC5k/d7wrm
	4derJvzNbiyFUR20USkNrwSDmauZ8QyiQahcwFuiM4aeLyu+PGTxoYPXlUmhu/WD9HHbzyiSBPej2
	2HHljrd6uQ5ZrIoqj2pSQ/wuQ2MWGPj6eapsIDH8SOcvtg2gnf3UfwEreg4t2lDcmwlTVekkIgTZm
	y2b4/WK+NfY4sqwkLm1VorqCWUUvhBH7n/jztcAA5jUOS12GIISD7sUJm2JRyvQXxTISV1puidZ/L
	PzonagZo9S0hps4NiPmo8xAAYNehqOT8tuGufdqMFhesLLmKz7Tz4Fmn0WLYF8BK4Uke4+ZN8YFEt
	FhoM18n2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k94OX-0001n2-6x; Fri, 21 Aug 2020 10:35:37 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k94OV-0001mT-NH
 for linux-mediatek@lists.infradead.org; Fri, 21 Aug 2020 10:35:36 +0000
Received: by mail-ot1-x344.google.com with SMTP id t7so1228139otp.0
 for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2020 03:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EfdWudG0h0q5CaIQdMWXtuPOgO5LF8y0CpSBc1t8Vmo=;
 b=lXZJddLsySTWLGE+UKv+3I86NhQqIIkV25M4nrFxsyNqk9bRGqRcr/4gkY5vkypS3r
 wOPaCUxWj0gLJv835VT/xORv9cX8tCUo6OPSPVTSyJeHT2tLG5KU8SaeHkzuAU8g9g3P
 sB8dCJJ+xxPfWuX2xnQJgFAjw346ICZ01pnVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EfdWudG0h0q5CaIQdMWXtuPOgO5LF8y0CpSBc1t8Vmo=;
 b=EjoNTrLsnuoBw9Ib1EsDC8xvyDg68ubHYLRvzhkSQrVtxbWxMGFO9RXGHX0E606Rh3
 I+rP2PPvY0ViairzyZ98iSN1zqjlpfz57RSG7t8diMax7yYukuvfuoh1669IY0EKBWD6
 c9G+Cv7vRhpCcUQpPojo5NJL3F/T8gh7BoQRYsboe/MOnH2iC7qxlr+xhM5KB9e36fXM
 iFqADUId8Yxw6oDI9upjmMnh6y4fc0UzCs5rMDFchNerb77qfTTVk9mQ77/OVRnacUHb
 fCJduiUSs6GsNEDB5bvVBndCA5tj9Xt1ncmBIzuJh50lYQUG6Hk4Oc2F3dIshVUMEKC6
 TDxA==
X-Gm-Message-State: AOAM533pVRyA3ALnK8ISolQR7w0ygzU/SbGvrN7j2I1vYvIGJNuOj2xP
 70kWD2SVZz7E9ejB5PZPM5AzH/xzM5yXZiee
X-Google-Smtp-Source: ABdhPJwFNAY6+eEdH4aAvqmmOUKq9dFa9DHyZ6Dpenjo+Ov73UZTvFntasOoGX00G3Q4/RaiTW60NQ==
X-Received: by 2002:a9d:ed0:: with SMTP id 74mr1347750otj.269.1598006133069;
 Fri, 21 Aug 2020 03:35:33 -0700 (PDT)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com.
 [209.85.167.181])
 by smtp.gmail.com with ESMTPSA id y66sm292656otb.37.2020.08.21.03.35.31
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2020 03:35:32 -0700 (PDT)
Received: by mail-oi1-f181.google.com with SMTP id k4so1143290oik.2
 for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2020 03:35:31 -0700 (PDT)
X-Received: by 2002:a05:6808:196:: with SMTP id
 w22mr1229658oic.55.1598006131352; 
 Fri, 21 Aug 2020 03:35:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200713060842.471356-1-acourbot@chromium.org>
 <20200713060842.471356-3-acourbot@chromium.org>
 <CAGb2v66rFAb6eczD=ct68b7Q60ZvFyMCRN6XdY-rUAbk6zVupw@mail.gmail.com>
In-Reply-To: <CAGb2v66rFAb6eczD=ct68b7Q60ZvFyMCRN6XdY-rUAbk6zVupw@mail.gmail.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Fri, 21 Aug 2020 19:35:20 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXZ4WoRcdpO42RAbBJZGdWteE76=jMM2HjTfMukUYf4Qg@mail.gmail.com>
Message-ID: <CAPBb6MXZ4WoRcdpO42RAbBJZGdWteE76=jMM2HjTfMukUYf4Qg@mail.gmail.com>
Subject: Re: [PATCH v3 02/16] dt-bindings: media: mtk-vcodec: document SCP node
To: Chen-Yu Tsai <wens@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_063535_775837_52269334 
X-CRM114-Status: GOOD (  17.40  )
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
 devicetree <devicetree@vger.kernel.org>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jul 13, 2020 at 3:20 PM Chen-Yu Tsai <wens@kernel.org> wrote:
>
> On Mon, Jul 13, 2020 at 2:09 PM Alexandre Courbot <acourbot@chromium.org> wrote:
> >
> > The mediatek codecs can use either the VPU or the SCP as their interface
> > to firmware. Reflect this in the DT bindings.
> >
> > Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> > Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> > ---
> >  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > index b6b5dde6abd8..7aef0a4fe207 100644
> > --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> > @@ -19,7 +19,9 @@ Required properties:
> >  - iommus : should point to the respective IOMMU block with master port as
> >    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> >    for details.
> > -- mediatek,vpu : the node of video processor unit
> > +One of the two following nodes:
> > +- mediatek,vpu : the node of the video processor unit, if using VPU.
> > +- mediatek,scp : the noode of the SCP unit, if using SCP.
>
>                          ^ typo / extra o

Fixed, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
