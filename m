Return-Path: <SRS0=7p0Y=4B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED54C3B189
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2020 14:01:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 122472073C
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2020 14:01:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="keIzacnV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WoSPPLB6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 122472073C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xLaiHao0iOU1tRFLwjSJYu7yp9tkNo3Js3MW15O9ApE=; b=keIzacnVpzpW/b
	2jCBC37Fl9zkhLIw9lWimk9bn2Xrp4fAL2NYdq3wKI6MaQIXuTCq2sWBoZo4tnrBFEFPeVcRkO8GJ
	BU1RY7Gvo3C0dfJtMuCL5D68Ol5Wd0gjKQW+S4S3l+/eFcNvjxLVT/FiODR7Ejv1y3Yonl1sdKE2k
	lpWI0obisEFWll5L1X5HC6M3W070xxrI515K+adld9E4+7UK+/11bnnbuMumYQCMhH4LYVTXMvGXz
	L+uQW1+/4sMK89OPWfjfhkcazSFbj0bcfvg1La12AElrN8RMM3gjyItenCTFcq5ubjSBkmWZySFhk
	1aymEaWH1tiygjKTBq7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2F3P-0005Fz-EH; Thu, 13 Feb 2020 14:01:19 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2F38-0005DH-72; Thu, 13 Feb 2020 14:01:17 +0000
Received: by mail-qk1-x744.google.com with SMTP id o28so4363640qkj.9;
 Thu, 13 Feb 2020 06:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GwvJtBvLYgXHz2Xkjo28kGnQcGUFvmoCc8Tq+skqxFM=;
 b=WoSPPLB6quBGtBpRywwrlPUN/efg7Ughe/HaH3khTmKhm8TtRvn1omHwpi/Uje11Nc
 pJJ434RD5vc6K56AF1flgXq7rGgQL4eIbgy0vNQWX3Ilo6r1XlrPGVcQUkzDZJVdNAqL
 CQWRmZ6MDJKjdXiViv85LIZth9OYzoQf4NKp2R4S9uMoWLn4jAzJvRHErhw/tberXn1U
 afxPCPN8yIbn8R73x0dy1qStRMFKKk0TU7EJIVtQo9A5/go6CKtMqKAybDD7f1leMzbr
 RkHP02AhsZ8v09CuFrX1byfuhGihLXF2U77kvpA2MNTc/JMV0yrMCE7PJN/PnIDh9OCX
 EVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GwvJtBvLYgXHz2Xkjo28kGnQcGUFvmoCc8Tq+skqxFM=;
 b=bxFk9zk/3JG82pPXOHQmOFk3AK5GhLf4T6iVY/SJiPnWpwOHaX6ZJD0xEC4d7CDkzG
 K+6WokWaEHYJGY7UAanDVyY9O53zFT8twe2Z273h36w2PRDDU4vYbtSA8Sol7ox4f+m8
 yHn0APV09clGQgUJ2OfMkpf/W/Q/lzIqtyTrqoN11ZoUTgSL/9uyH8MTj1gbknloBvv7
 6H9+Yoon+gzMfnhEJ5n4nP+ajqPCp1bCeOTV2nu3V1+F/ctH8O0uamg75QQPlrpE82qv
 K5vToeUqBVhI+X7s1BuzY83gwHzOOyiv/mZ7NINjjnaNmNFO4ceaNwL8G8ZK0HjxmtVr
 s97g==
X-Gm-Message-State: APjAAAVgJ4CGlNYqbiIIqWlRxonaEHrxBR3oQHmoSOCdfN1cYv4pobxe
 DPdtFhQ66dpVH46+SHJXnd65kNupKsbwkqbAi6g=
X-Google-Smtp-Source: APXvYqyjD4OX/YI4q5ugfE3GeGjRdg6xfub/ylaaIdK2920TyQEJp7ys7DWIVv34YSpAoPAjOFPsF7u/zxzxnLNIOJE=
X-Received: by 2002:a37:a642:: with SMTP id p63mr16214664qke.85.1581602456914; 
 Thu, 13 Feb 2020 06:00:56 -0800 (PST)
MIME-Version: 1.0
References: <20200213012353.26815-1-bibby.hsieh@mediatek.com>
 <20200213012353.26815-2-bibby.hsieh@mediatek.com>
 <1581566763.12071.1.camel@mtksdaap41>
In-Reply-To: <1581566763.12071.1.camel@mtksdaap41>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 13 Feb 2020 15:00:45 +0100
Message-ID: <CAFqH_51r8CvBz3J-TffYaMsZQwX=hdDVjEz9+BmBeC=QurP7Ug@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/mediatek: add fb swap in async_update
To: CK Hu <ck.hu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_060103_516026_3D553C68 
X-CRM114-Status: GOOD (  14.49  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tomasz Figa <tfiga@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

Missatge de CK Hu <ck.hu@mediatek.com> del dia dj., 13 de febr. 2020 a les 5:06:
>
> Hi, Bibby:
>
> On Thu, 2020-02-13 at 09:23 +0800, Bibby Hsieh wrote:
> > Besides x, y position, width and height,
> > fb also need updating in async update.
> >
>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>
> > Fixes: 920fffcc8912 ("drm/mediatek: update cursors by using async atomic update")
> >
> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > ---

This patch actually fixes two issues as explained in [1], I send the
patch without seeing that another one was already sent. Both do the
same thing. So,

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

[1] https://lkml.org/lkml/2020/2/13/286

> >  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> > index d32b494ff1de..e084c36fdd8a 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> > @@ -122,6 +122,7 @@ static void mtk_plane_atomic_async_update(struct drm_plane *plane,
> >       plane->state->src_y = new_state->src_y;
> >       plane->state->src_h = new_state->src_h;
> >       plane->state->src_w = new_state->src_w;
> > +     swap(plane->state->fb, new_state->fb);
> >       state->pending.async_dirty = true;
> >
> >       mtk_drm_crtc_async_update(new_state->crtc, plane, new_state);
>
> --
> CK Hu <ck.hu@mediatek.com>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
