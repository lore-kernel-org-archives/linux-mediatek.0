Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B209C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jun 2022 05:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iTyxMGysFvLVjw1ty4gwMbVdKBXhcL1xQssE1M7jQRs=; b=d2UOif6bS33NQClgzyx+BRFryw
	z8tlTXquG0692Nupz4hw4XhuENK4Coot+X///4yusIfCR/w2m3EUUBMo3FyHrACx922wMOtiXANlu
	T9pHQdwxItFcDlj32NGqolU/xIJERfGNSica5INcwgRiTUcsT0VXIHsr0H+SMP4SxE1cOHOl0J9AE
	C8n5QoYtYQg0D5ZNVuuVaOgwiRxphFpFVbA4aAe1zjwje9hTavYeMBwjF6tCYxsgAlneHVvv+v+wF
	1RmGukhhIe8AgUTFCzeGDjIUHWdawDULVhQ2gTKTuZeJbV0H75EcrD0WYB/XmWSHMJ6uJ1NlMqfEO
	ZB6ll26w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o39ux-00GGzi-Db; Mon, 20 Jun 2022 05:25:43 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o39uv-00GGxJ-6h
	for linux-mediatek@lists.infradead.org; Mon, 20 Jun 2022 05:25:42 +0000
Received: by mail-ed1-x52a.google.com with SMTP id e2so2543447edv.3
        for <linux-mediatek@lists.infradead.org>; Sun, 19 Jun 2022 22:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iTyxMGysFvLVjw1ty4gwMbVdKBXhcL1xQssE1M7jQRs=;
        b=hr/i+COcpVsTSVEVRXmn8BToF7wohakO0101jRn9kRrjM38xXFv36ueZmUYFeF7tMs
         MhQf0KBvD+ufRlJDSD8p+HhwOg1IatNHX5ROaL5G3WIA4Bc/XVrN1sotSR3iUwscYf9w
         zs6/fyN9LhYXinNOiVjFzKY1HepGVgu2Gb5jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iTyxMGysFvLVjw1ty4gwMbVdKBXhcL1xQssE1M7jQRs=;
        b=6QAxsjsu33vuQQr5MqYDp/C47PUj6VTLxQKv2vQcydw6Ak/O0othWxYOWBt1U4dWkH
         OKYJcQM9bek+Kt3gnE8pITBFAIhGRptk037yE/ztZTDXP/XEXfYo4Vt7KwYgjdJaGxC4
         9+BNN8so1MfL1DGzH8tn5j2T7QJ2TEyHe0ZBfACc/k9pIjIx+/U6Jqr6Slx0A5agaMPk
         zay+rM97Cg4G1bkN/ZNaIpy58P2dyuB5gd7PJg+x7ev+73li6s8T/r8Ait3KgVb+tQTW
         Hya0ISdLEsxLceSpGCEr970rhzkXraJcZZM03qzz35aP5u9NVzE1GkaObZv38oPCp91A
         Ohzw==
X-Gm-Message-State: AJIora/Wq9Ff7JDUo92j4cysKiF/Ua4cKbYMenbHCHOyTcrXgAchbf49
	nrWH3emAI/9Y8vtuJzv8T7uAKbwkIhcsQu6XrnpouQ==
X-Google-Smtp-Source: AGRyM1ve6GEVbjnEdneKcnH6buKWIMD7xtxtHnE/K2tR9nDrr6cM5g2g7pzOhyL1GqvCL7sj+U4/HpOoO6q4bsSD2TU=
X-Received: by 2002:a05:6402:4303:b0:435:833a:16ed with SMTP id
 m3-20020a056402430300b00435833a16edmr2517462edc.248.1655702733588; Sun, 19
 Jun 2022 22:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220618072929.28783-1-yunfei.dong@mediatek.com> <CAGXv+5EFkZ6-bvu68dV4hr795+N3tAwbXYg5WCJp+Zd+pf1Aqw@mail.gmail.com>
In-Reply-To: <CAGXv+5EFkZ6-bvu68dV4hr795+N3tAwbXYg5WCJp+Zd+pf1Aqw@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 20 Jun 2022 13:25:22 +0800
Message-ID: <CAGXv+5E2wULkB7_u_H7jFAi6Jk2AvUcfOJdzOp_5m2b4n3shww@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Initialize decoder parameters
 after getting dec_capability
To: Yunfei Dong <yunfei.dong@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Tomasz Figa <tfiga@google.com>, George Sun <george.sun@mediatek.com>, 
	Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
	Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
	dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>, 
	Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_222541_290715_D1FF0CB7 
X-CRM114-Status: GOOD (  13.00  )
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

On Mon, Jun 20, 2022 at 12:54 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Sat, Jun 18, 2022 at 3:29 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> >
> > Need to get dec_capability from scp first, then initialize decoder
> > supported format and other parameters according to dec_capability value.
> >
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Tested on MT8183 on mainline 20220617-next with the vcodec-dec DT node
> copied from the ChromeOS v5.10 kernel.
>
> This fixes an issue where the first attempt to enumerate formats on the
> device right after boot returns an empty list.

BTW, this should have a Fixes tag.

Either

Fixes: 7a7ae26fd458 ("media: mediatek: vcodec: support stateless VP8 decoding")

which looks like the first instance of when firmware capability really is
considered, or

Fixes: fd00d90330d1 ("media: mtk-vcodec: vdec: move stateful ops into
their own file")

which matches when ctx->dev->vdec_pdata->init_vdec_params(ctx) was first added.


ChenYu

