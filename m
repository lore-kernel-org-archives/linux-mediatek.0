Return-Path: <SRS0=4wrq=4P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C0EBC11D3D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 15:14:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8C9E246A0
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 15:14:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b4QJ108h";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G2r3t7rr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8C9E246A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kyci9v3/EGasfTeEJyIBAZnpXeZSgXRuxuyC9Ll7Cs4=; b=b4QJ108hyb4n3r
	u+2EgM7e1ntPoCPMW8Cxv/cbI7u/z+0qF++F3TELx67ocwYYA4YgAjGIv9ILNhgEOJoYHinMH4xRo
	rOqi65JyNaU1Ez6XtK9wI5zAq+Scxahwf3lMUoYT+hDKNemry0I7DD4p0o5mRdfVoSSIc0nx2thOQ
	l1Vo2P8tvI3RCo0KehFXHKoBg4VHW6z5gktV5mvXnzQJArLzYt8+X/4dtN0iIjLFLfaCeLqdlrsYq
	L2nZU9YSNjssOd3axBTwhKvgL2xTvXlpXh0ZxccI86uXvCmnHNCDEik/qIw8h0iMeE+6cdTn3QdgD
	PTCGomQV5ynsjUHVzU6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7KrN-0008K5-Ti; Thu, 27 Feb 2020 15:13:57 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7KrB-0008Az-Ub
 for linux-mediatek@lists.infradead.org; Thu, 27 Feb 2020 15:13:47 +0000
Received: by mail-il1-x143.google.com with SMTP id p8so2696547iln.12
 for <linux-mediatek@lists.infradead.org>; Thu, 27 Feb 2020 07:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m+kylmRZdQ7kHJRK9lKNLqwlSVhHwyYol2gsDgRlfLA=;
 b=G2r3t7rraJO/jHNvyP5CFwnplNk9lJtpT9K3gnayhn4rcbOA3gSXoz8oCLeE81E/Wt
 no0Zh7DuWczVpOtO+5F+bZ/zXJJtqem4r07fo5SkxDWfHb9mDBp6nKik1l4JDM8KN/al
 qqemDCNP9bkaEgHme33rJac7E7n0rUJSoO+8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m+kylmRZdQ7kHJRK9lKNLqwlSVhHwyYol2gsDgRlfLA=;
 b=RWk/HYtXFUXeEQ469rVkTnsKQn2i38Af90L8oZwLj6auexchoNJIDZN6NXLkBylDpf
 dGwmPQbkzFxNqslWsLybAl7aM5c6eKGkSOQyB8E6R8jkh1N9xkAJuXnT7OfjuTVyt71U
 c2a9Sbv0wWzdnLon2HzPNOKwM4ZV3cHxBwCW26ZFmjXHa6UqWAVSSYRD6HFEG5oJB4dC
 rIZYOVsVFQuZhj63KPc0941QAFRv+FhK2dNMFChETBQ3Cs5x71kkZOLBHe41nCHvOjpx
 y4VIogxWGxfnMgp2XaH0Dl+ckXfBxRdN4NqK0UV/SjVIqx2bF9VgCEI3pfF4DbjEOInJ
 8fvw==
X-Gm-Message-State: APjAAAVwhR3ZVR7eLv/qiWXOo1Ol/6qiXlue76qIX0Oxav+x2UxhAKik
 O6q/OMWrXAu5f8sHwhN7DSg+XUFODLT+yZAGMrNR6Q==
X-Google-Smtp-Source: APXvYqx6ZTgm/JnuJem8YlsSHDER8b5Wil6I0Af4SkhwFk++vp7lU3TdAvSta4JoAfspzedl//Jug2AVYKDt3UXKMdc=
X-Received: by 2002:a92:d610:: with SMTP id w16mr5875950ilm.283.1582816420405; 
 Thu, 27 Feb 2020 07:13:40 -0800 (PST)
MIME-Version: 1.0
References: <20200225172437.106679-1-hsinyi@chromium.org>
 <6986e879-cf35-13a5-baae-9ab09ba1a0d7@xs4all.nl>
In-Reply-To: <6986e879-cf35-13a5-baae-9ab09ba1a0d7@xs4all.nl>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 27 Feb 2020 23:13:14 +0800
Message-ID: <CAJMQK-hFQ8ZMAH=C9suud81gwXQaG_=4mx69qeQP=eCFgAXhTQ@mail.gmail.com>
Subject: Re: [PATCH v3] media: mtk-vpu: avoid unaligned access to DTCM buffer.
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_071346_017406_A150D287 
X-CRM114-Status: GOOD (  20.33  )
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
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 lkml <linux-kernel@vger.kernel.org>, Houlong Wei <houlong.wei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 27, 2020 at 5:50 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 2/25/20 6:24 PM, Hsin-Yi Wang wrote:
> > struct vpu_run *run in vpu_init_ipi_handler() is an ioremapped DTCM (Data
> > Tightly Coupled Memory) buffer shared with AP.  It's not able to do
> > unaligned access. Otherwise kernel would crash due to unable to handle
> > kernel paging request.
> >
> > struct vpu_run {
> >       u32 signaled;
> >       char fw_ver[VPU_FW_VER_LEN];
> >       unsigned int    dec_capability;
> >       unsigned int    enc_capability;
> >       wait_queue_head_t wq;
> > };
> >
> > fw_ver starts at 4 byte boundary. If system enables
> > CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS, strscpy() will do
> > read_word_at_a_time(), which tries to read 8-byte: *(unsigned long *)addr
> >
> > Copy the string by memcpy_fromio() for this buffer to avoid unaligned
> > access.
> >
> > Fixes: 85709cbf1524 ("media: replace strncpy() by strscpy()")
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> > Change in v3:
> > - fix sparse warnings.
> > Change in v2:
> > - fix sparse warnings.
> > ---
> >  drivers/media/platform/mtk-vpu/mtk_vpu.c | 14 ++++++++------
> >  1 file changed, 8 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> > index a768707abb94..e3fd2d1814f3 100644
> > --- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
> > +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> > @@ -603,12 +603,14 @@ EXPORT_SYMBOL_GPL(vpu_load_firmware);
> >  static void vpu_init_ipi_handler(void *data, unsigned int len, void *priv)
> >  {
> >       struct mtk_vpu *vpu = (struct mtk_vpu *)priv;
> > -     struct vpu_run *run = (struct vpu_run *)data;
> > -
> > -     vpu->run.signaled = run->signaled;
> > -     strscpy(vpu->run.fw_ver, run->fw_ver, sizeof(vpu->run.fw_ver));
> > -     vpu->run.dec_capability = run->dec_capability;
> > -     vpu->run.enc_capability = run->enc_capability;
> > +     struct vpu_run __iomem *run = (struct vpu_run __iomem __force *)data;
>
> The use of __force is generally a bad sign. Shouldn't the 'void *data' be a
> 'void __iomem *data'? And vpu->recv_buf should be 'struct share_obj __iomem *recv_buf;'.
> Probably send_buf as well.
>
> In other words, the __iomem attribute should be wired up correctly throughout the
> driver code, and not forcibly applied in one place. That is asking for trouble in
> the future. Also, sparse only works well in detecting problems if such attributes
> are applied at the right level.
>
> Regards,
>
>         Hans
>
Thanks for your comments. I should check the whole code more
thoroughly. I do see that vpu->recv_buf is forced cast from void
__iomem *tcm:
vpu->recv_buf = (__force struct share_obj *)(vpu->reg.tcm +VPU_DTCM_OFFSET);
I'll use struct share_obj __iomem *recv_buf; as you suggested. Thanks

Since all handlers (vpu_init_ipi_handler, vpu_enc_ipi_handler,
vpu_dec_ipi_handler, and mtk_mdp_vpu_ipi_handler) only do read access
to this buffer, I think we can also change 'void *data' as 'const void
*data', and pass another buffer copied from vpu->recv_buf->share_buf
to handler. In this way we don't have to change to use iomem APIs in
those handlers.

 static void vpu_ipi_handler(struct mtk_vpu *vpu)
 {
-       struct share_obj *rcv_obj = vpu->recv_buf;
+       struct share_obj __iomem *rcv_obj = vpu->recv_buf;
        struct vpu_ipi_desc *ipi_desc = vpu->ipi_desc;
-
-       if (rcv_obj->id < IPI_MAX && ipi_desc[rcv_obj->id].handler) {
-               ipi_desc[rcv_obj->id].handler(rcv_obj->share_buf,...
...
+       unsigned char data[SHARE_BUF_SIZE];
+       s32 id = readl(&rcv_obj->id);
+
+       memcpy_fromio(data, rcv_obj->share_buf, sizeof(data));
+       if (id < IPI_MAX && ipi_desc[id].handler) {
+               ipi_desc[id].handler(data, readl(&rcv_obj->len), ...
...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
