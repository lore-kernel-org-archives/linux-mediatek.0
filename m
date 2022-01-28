Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99868C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Jan 2022 03:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6tfFih3QZTWN8oWL30rkO566JCICO7kjhEvOPZuA2aw=; b=wLicrj9Xcor73K
	13z6XgAKtzY27NsCspWwfUAhf3d7yPAJ4gyPV7LfHxCy5wCJVkKOstJylApHOKeuhjDnUH8uHGSw1
	MmeqVvYuZr7q+6IDesyhO+Qf7xYBXL/9Sw/M2OSPYRDwuMpr3UADgWdurDfEdwq7YXclKrHKnJaap
	B0tZ+n/To+ELJc3zNRGPvIviHr7tVZ9uYHksfQwnirK7PObR/z+/rX6x6EG3R3LIq5PypyP1LbctW
	ku4bBvxCw0Q0PsDUblDHNAe/BsaKhSD+rFDNHNCLnkSdckIJAVFQkWiRXGp9Tc/75RE9tc0yXpfSM
	IF9lb1pH3+gHBfXymqjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDHwU-000BoV-VK; Fri, 28 Jan 2022 03:28:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDHwC-000BhH-0M; Fri, 28 Jan 2022 03:28:37 +0000
X-UUID: 88948b21f6b94d56b54cc921bfe05e54-20220127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=wnTalyeihTFJ3XSK0orrBE5Ifdr6mX/xJKPyAdaVYrA=; 
 b=lh18XZgCUqXIVzIjdzgxcB14RikAEr7/3A+U4AVWv/YSOLV4LEtfq6Ai4pcUDUpInXhNky2Ka2AAuX9TmIOm2JMt/kQfVePBiH3YPYvbw7UjohdB3PGUNThpavbsRtrxIqwZrfOyCI68P+qa8ZYY33jJE+35sa9OAGhxmJ/JuRA=;
X-UUID: 88948b21f6b94d56b54cc921bfe05e54-20220127
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 374159150; Thu, 27 Jan 2022 20:28:33 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Jan 2022 19:28:31 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 28 Jan 2022 11:28:29 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 Jan 2022 11:28:28 +0800
Message-ID: <c7e8cccc04aeb5520e5b3f090c89d1356b763acd.camel@mediatek.com>
Subject: Re: [PATCH v1, 7/8] media: uapi: Init VP9 stateless decode params
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Andrzej Pietrasiewicz
 <andrzej.p@collabora.com>
CC: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Tiffany
 Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>,
 George Sun <george.sun@mediatek.com>, Xiaoyong Lu <xiaoyong.lu@mediatek.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 28 Jan 2022 11:28:28 +0800
In-Reply-To: <CAGXv+5ELuvvG6dwXH5DdHtjOm4j4AAVTk2UxGOitF5v5Vx265A@mail.gmail.com>
References: <20220127025544.10854-1-yunfei.dong@mediatek.com>
 <20220127025544.10854-8-yunfei.dong@mediatek.com>
 <CAGXv+5ELuvvG6dwXH5DdHtjOm4j4AAVTk2UxGOitF5v5Vx265A@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_192836_094241_87287062 
X-CRM114-Status: GOOD (  18.29  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Chen-Yu,

Thanks for your suggestion.
Send this patch again.
On Thu, 2022-01-27 at 17:23 +0800, Chen-Yu Tsai wrote:
> Hi,
> 
> On Thu, Jan 27, 2022 at 10:56 AM Yunfei Dong <
> yunfei.dong@mediatek.com> wrote:
> > 
> > Init some of VP9 frame decode params to default value.
> > 
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> 
> Maybe add
> 
> Fixes: b88dbe38dca8 ("media: uapi: Add VP9 stateless decoder
> controls")
> 
Best Regards,
Yunfei Dong
> > ---
> >  drivers/media/v4l2-core/v4l2-ctrls-core.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > index 54abe5245dcc..b25c77b8a445 100644
> > --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> > @@ -112,6 +112,7 @@ static void std_init_compound(const struct
> > v4l2_ctrl *ctrl, u32 idx,
> >         struct v4l2_ctrl_mpeg2_picture *p_mpeg2_picture;
> >         struct v4l2_ctrl_mpeg2_quantisation *p_mpeg2_quant;
> >         struct v4l2_ctrl_vp8_frame *p_vp8_frame;
> > +       struct v4l2_ctrl_vp9_frame *p_vp9_frame;
> >         struct v4l2_ctrl_fwht_params *p_fwht_params;
> >         void *p = ptr.p + idx * ctrl->elem_size;
> > 
> > @@ -152,6 +153,13 @@ static void std_init_compound(const struct
> > v4l2_ctrl *ctrl, u32 idx,
> >                 p_vp8_frame = p;
> >                 p_vp8_frame->num_dct_parts = 1;
> >                 break;
> > +       case V4L2_CTRL_TYPE_VP9_FRAME:
> > +               p_vp9_frame = p;
> > +               p_vp9_frame->profile = 0;
> > +               p_vp9_frame->bit_depth = 8;
> > +               p_vp9_frame->flags |=
> > V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING |
> > +                       V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING;
> > +               break;
> >         case V4L2_CTRL_TYPE_FWHT_PARAMS:
> >                 p_fwht_params = p;
> >                 p_fwht_params->version = V4L2_FWHT_VERSION;
> > --
> > 2.25.1
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
