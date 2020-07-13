Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B25CC433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:20:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAE7120674
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:20:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="w7BFb0jt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="mAHy2i16"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAE7120674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DAEikeXWkpdw6e85AlO354Xf3gYB+wicG24Yng0lx9o=; b=w7BFb0jtOe6Xl7JPf/kEN/SQo
	qSZYjcB2a2dqNhEv5CiLdH/FCjzSJhFOCbGgsjB/1HACb3kZRttcwmeovAZ4Iwondh4a+4ZiHEbS4
	NkRqbV3F2dOgFJWCZ7MhMXQuVCdwazZql2Lg4umS2cQ22scRvTeavUg8XfUaqbIUsV94g8NynQZOg
	WINellrt1zIsMJ5Fqc2QdTQ+RLBTDQ3r4ZSLQ8r7eFwbw6ij4WhiOYjidt2Tk9VWFmSgGrrSEJtKn
	Py/1/Ki7NmGwp87Drb6PJAdjbkUCKuFZE7ITrqY+beywL7u/k8hY6DQtBWkAOhQjSlSs0xoPjqxH0
	+yE6wlgdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jurpA-0002JE-DF; Mon, 13 Jul 2020 06:20:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jurp7-0002Hk-TJ
 for linux-mediatek@lists.infradead.org; Mon, 13 Jul 2020 06:20:22 +0000
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 16464207BC
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Jul 2020 06:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594621220;
 bh=WuqdpFUcq4uF0/RIHZ+88zR6TAiC4uqqH38bj35kais=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mAHy2i16DHnsjtZOV9CiFKZ8CB6E94YhMONfe1eYB8cgTEYhjamHkCxYaxqhpNEpV
 fGje76CwK0714jEll/wPYDMz/deqygPuGMeSMnIvkbfJ+0+VcMd+/8ldR5U4k4ERYt
 NjDeFeKkyR2QPSj9g5FGo+LVWq3C0yRijSnJSTTY=
Received: by mail-lj1-f176.google.com with SMTP id j11so15452787ljo.7
 for <linux-mediatek@lists.infradead.org>; Sun, 12 Jul 2020 23:20:19 -0700 (PDT)
X-Gm-Message-State: AOAM530bXh0b2vREtFAAiapwghv/Wcg09c8orXfoM+8REcwOtkNYb5fe
 HU3nWUfI+7q4q0oOhhrX1eZxHD1D/k27nWwOvRg=
X-Google-Smtp-Source: ABdhPJwb9dJ9VZo72PEXS5lIrY6ZN22jA33AQiuxNlQxQodB1qXlHopTmumJdSl0lOT2r+0ZQLDwGAu+Y+IPRKaEWJE=
X-Received: by 2002:a05:651c:200f:: with SMTP id
 s15mr36978008ljo.125.1594621218404; 
 Sun, 12 Jul 2020 23:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200713060842.471356-1-acourbot@chromium.org>
 <20200713060842.471356-3-acourbot@chromium.org>
In-Reply-To: <20200713060842.471356-3-acourbot@chromium.org>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 13 Jul 2020 14:20:06 +0800
X-Gmail-Original-Message-ID: <CAGb2v66rFAb6eczD=ct68b7Q60ZvFyMCRN6XdY-rUAbk6zVupw@mail.gmail.com>
Message-ID: <CAGb2v66rFAb6eczD=ct68b7Q60ZvFyMCRN6XdY-rUAbk6zVupw@mail.gmail.com>
Subject: Re: [PATCH v3 02/16] dt-bindings: media: mtk-vcodec: document SCP node
To: Alexandre Courbot <acourbot@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_022022_045938_15954FB9 
X-CRM114-Status: GOOD (  14.99  )
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

On Mon, Jul 13, 2020 at 2:09 PM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> The mediatek codecs can use either the VPU or the SCP as their interface
> to firmware. Reflect this in the DT bindings.
>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
> ---
>  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> index b6b5dde6abd8..7aef0a4fe207 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> @@ -19,7 +19,9 @@ Required properties:
>  - iommus : should point to the respective IOMMU block with master port as
>    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>    for details.
> -- mediatek,vpu : the node of video processor unit
> +One of the two following nodes:
> +- mediatek,vpu : the node of the video processor unit, if using VPU.
> +- mediatek,scp : the noode of the SCP unit, if using SCP.

                         ^ typo / extra o

ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
