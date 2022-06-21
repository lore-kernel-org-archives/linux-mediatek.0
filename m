Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E117FC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jun 2022 14:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTf+1EpY6JStEJhVUzLt7wdTH2UAsJxs2Qprj1UXr8w=; b=bf7ywpacHwVmXMlQkBOqXpbF9Q
	u7UPAnhqp+5reCet1hDMLZ375Z3ZvliCEj5FIkuhoQTvYcFOzzlnDSNAElABsZigsqvVl786xowIc
	PXwb6pwFJkYedFCbT7War/ZPMyDd9Pmv4zYHzI5gvxS6Lh07BM5TKO78O4TwwXp8FPMFT24RwdABw
	Q875CTcfOcvxb6obeSY9VxLDkdx9yfzyBg9KAJIZDAs+/PaaA0kIwCLrOvEIx/W42MsxvGb7qMLSL
	KCwxNWXdBK969kdpF995yaIXq78GWSS0Ah+FN5vwRALEql1BC1+b43RRerz1haFQHnxzV2gcoHsr7
	nkxkUfjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3fJ0-0060VB-Fa; Tue, 21 Jun 2022 14:56:38 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3fIh-0060PG-5n
	for linux-mediatek@lists.infradead.org; Tue, 21 Jun 2022 14:56:20 +0000
Received: by mail-qk1-x729.google.com with SMTP id 15so10278793qki.6
        for <linux-mediatek@lists.infradead.org>; Tue, 21 Jun 2022 07:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=GTf+1EpY6JStEJhVUzLt7wdTH2UAsJxs2Qprj1UXr8w=;
        b=vzCf01wDrq7d7rl2ww+xXP/xbzvTXUf7qGcXWkAS20xRyPJo4WOKyH2icegwtTRSZu
         SBqVqHiy2HzcDo4FeW6zhO9sDootDofeU17TpiBvnZurxOBwgIVwNe2ms8dhl3AX4VFj
         rX89ugpOOGC+1M/wdoqN/lLR8U4xCAGTm/yc68HucT18R8vtCDVs2dMMdx9kWStmu3Ny
         8+03HOZNgV01X7mF0E3HAgd9fGWNB5+sswmMcUeThZ/Z6lod5AuH5rc52pOxhRKzTWBA
         jix9trd26PxfXVEBdHNDv6Ew0By+m42Z1HKms0IVIeTI6b0bkzUEPmSKkJ4Kx85VNS5e
         NGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=GTf+1EpY6JStEJhVUzLt7wdTH2UAsJxs2Qprj1UXr8w=;
        b=XjqaHA7k77qNz5wqOLDMhx4DlnfJNP3sOi7vxJwSKB9vw89/Dxqj2ht5JrsdpI61YJ
         Gj/CyKHXnszGgXoO01nqLfk/7oibbh9NV/fHSbk9Bo1t6unI/FwjEz0juzuGznlHFQ9D
         grTUcaRoDfwihEBGw9qEeN0A1kXapPc5sJB0RZb6Ua2H4QXmdBJUPdiKZeaFXfqthvjp
         BxwwIOhYttFhXmnqAh1By07IqEk7hwt0LQtovXfNEnxhbXQ1CpTfLOBmmB/tphdphr/P
         NvO7GsDQGO/JZ14aZPpMPiVhir2xmob2qpxD/HKjaxh41UmFNU+/nTBxIh7dHUSCoNRX
         jm3g==
X-Gm-Message-State: AJIora9XXi554cs/vSTA9YbsxrIaUnLyN4F8eiWlFXrH0c7sHZlo3g8p
	yhAcCPR3pfTRmfALJEgebTK7Kg==
X-Google-Smtp-Source: AGRyM1sCdWg/g7b5u7199UKjl1f4c99tdgJSVyehh3v1/71400rY80K2fHyGPWzZKjxGptVxhwdmUQ==
X-Received: by 2002:a37:4549:0:b0:69f:556c:4e38 with SMTP id s70-20020a374549000000b0069f556c4e38mr20038724qka.202.1655823376859;
        Tue, 21 Jun 2022 07:56:16 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id o12-20020a05620a2a0c00b006a726b03ad1sm15028164qkp.52.2022.06.21.07.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jun 2022 07:56:16 -0700 (PDT)
Message-ID: <32c3750a59eb6a4f8371a9b3349d4c285c809922.camel@ndufresne.ca>
Subject: Re: [PATCH v4, 0/3] add h264 decoder driver for mt8186
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Tomasz
 Figa <tfiga@google.com>
Cc: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>,  Hsin-Yi Wang <hsinyi@chromium.org>, Fritz
 Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,  dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Tue, 21 Jun 2022 10:56:14 -0400
In-Reply-To: <2ebaa25205d651b2f6a62e3a02c0ccab5199a165.camel@mediatek.com>
References: <20220512034620.30500-1-yunfei.dong@mediatek.com>
	 <edbb4605c9e30329d2f5a4ff738571acb6b91f1f.camel@ndufresne.ca>
	 <2ebaa25205d651b2f6a62e3a02c0ccab5199a165.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.2 (3.44.2-1.fc36) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_075619_252081_A33E35AA 
X-CRM114-Status: GOOD (  28.17  )
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

Le mercredi 15 juin 2022 =C3=A0 19:37 +0800, yunfei.dong@mediatek.com a =C3=
=A9crit=C2=A0:
> Hi Nicolas,
>=20
> Thanks for your comments.
> On Mon, 2022-06-13 at 16:10 -0400, Nicolas Dufresne wrote:
> > >=20
>=20
> > Le jeudi 12 mai 2022 =C3=A0 11:46 +0800, Yunfei Dong a =C3=A9crit :
> > > Firstly, add mt8186 compatible and private data, then add document
> > > for
> > > compatible "mediatek,mt8186-vcodec-dec". For mt8186 is single core
> > > architecture, need to add new interface for h264 hardware decoder.
> >=20
> > Would be nice to take the habit of sharing fluster score for this new
> > HW, I
> > would expect no less then what the numbers you'd get from running
> > over MT8195 or
> > 92, remains nice to demonstrate that this was tested and document any
> > oops along
> > the way.
> For we don't setup mt8186 fluster test environment. So not to run
> fluster in mt8186. According to our plan, we will do fluster test for
> every project begin from mt8188.
>=20
> When I'm free, we continue to setup the fluster test environment for
> mt8186.

I may be able to help here then if needed. Just let me know. Meanwhile, it =
seems
a bit early to consider merging these patches as they seems to lack the lev=
el of
testing we'd normally expect for non-staging driver changes.

regards,
Nicolas

>=20
> Thanks,
> Yunfei Dong
> > > Patche 1 add mt8186 compatible and private data.
> > > Patche 2 add mt8186 compatible document.
> > > Patche 3 add h264 single core driver.
> > > ---
> > > This patch depends on "support for MT8192 decoder"[1]
> > >=20
> > > [1] =20
> > > https://patchwork.kernel.org/project/linux-mediatek/cover/20220512021=
950.29087-1-yunfei.dong@mediatek.com/
> > > ---
> > > changed with v3:
> > > - fix __iomem not reasonable, align share memory to dram.
> > > changed with v2:
> > > - fix sparse and smatch check fail for patch 3
> > > changed with v1:
> > > - rebase driver to the latest media_stage.
> > > ---
> > > Yunfei Dong (3):
> > >   dt-bindings: media: mediatek: vcodec: Adds decoder dt-bindings
> > > for
> > >     mt8186
> > >   media: mediatek: vcodec: Support MT8186
> > >   media: mediatek: vcodec: add h264 decoder driver for mt8186
> > >=20
> > >  .../media/mediatek,vcodec-subdev-decoder.yaml |   4 +-
> > >  .../platform/mediatek/vcodec/mtk_vcodec_dec.h |   1 +
> > >  .../mediatek/vcodec/mtk_vcodec_dec_drv.c      |   4 +
> > >  .../vcodec/mtk_vcodec_dec_stateless.c         |  19 ++
> > >  .../vcodec/vdec/vdec_h264_req_multi_if.c      | 177
> > > +++++++++++++++++-
> > >  5 files changed, 203 insertions(+), 2 deletions(-)
> > >=20
> >=20
> >=20
>=20


