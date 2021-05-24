Return-Path: <SRS0=GIYZ=KT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EDA8C04FF3
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 May 2021 17:36:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E40EF606A5
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 May 2021 17:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E40EF606A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y2xyDtGV6XOldSlDogQT+M3fq4Jblqji5LdxZ70pdWY=; b=g+X+aaFhPOJ32M
	Tu/wIFceNPldNxXMXDbcLWYeaUfPR0YGSmUlTI9tpf8X1ZI5pESB/tU4PxybUWdvwmN+qn4DOpncd
	6+K3vWQ0gI/haPDTUbC5Q4VoNcYaCLlKilO5hMAd0T3+LMk8/KKxIPRt4EVkLoRFRL/+fsrVcf5xc
	K7h+fHolAZiW1JdyCpxOfMQNsKZDcHvJKJZPISKfdtL65qA5OVEUxX+vnlziqhwSC8FrZx36Jb1uW
	gFfkAMdwbO4Zixp5HjYVVYU9qkRlPBZN+h1uvAeehMrhjbljBihwn0QRzLOw5q3flp6oyyCpPbTWT
	7jSRTrutTTRt2xc5wJpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llEVB-001Ip0-F0; Mon, 24 May 2021 17:36:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ll0VC-000ed9-33; Mon, 24 May 2021 02:39:40 +0000
X-UUID: c1ebe0f253794f428d50e5d423a3ddaf-20210523
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=VHbcpkFfbs5kF0/zn1F4IWFknNucu5ih4bu3s4aofUc=; 
 b=Y3SU1WgOBcxi0zUU4e9qyUuylv/JHD0xv451KI2ND7/YYKc+/CKQRGHETWmUwvYfX0lAIed+qX+DieGMbnQq6W6ckGUkMPPoYUyJaGRPIEN3lSNFmLe0TANL6t90sJzOhRmeGsO+qV+IwAFJD6cVNDOPMmT42KtXZC2FFlnti0o=;
X-UUID: c1ebe0f253794f428d50e5d423a3ddaf-20210523
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <irui.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1133508461; Sun, 23 May 2021 19:39:25 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 23 May 2021 19:39:24 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 24 May 2021 10:39:19 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 24 May 2021 10:39:18 +0800
Message-ID: <1621823958.25430.4.camel@mhfsdcap03>
Subject: Re: [PATCH v4,6/6] media: mtk-vcodec: Support MT8192 H264 4K encoding
From: Irui Wang <irui.wang@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
CC: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>,
 "Andrew-CT Chen" <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Maoguang Meng <maoguang.meng@mediatek.com>, "Longfei
 Wang" <longfei.wang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, "Yunfei
 Dong" <yunfei.dong@mediatek.com>, Fritz Koenig <frkoenig@chromium.org>,
 Tzung-Bi Shih <tzungbi@chromium.org>, <linux-media@vger.kernel.org>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 24 May 2021 10:39:18 +0800
In-Reply-To: <CA+Px+wU+6AtcFLxAHrEXOK=E+LhwM2iX0R0JOgBvv-xzGO=Bcw@mail.gmail.com>
References: <20210521070139.20644-1-irui.wang@mediatek.com>
 <20210521070139.20644-7-irui.wang@mediatek.com>
 <CA+Px+wU+6AtcFLxAHrEXOK=E+LhwM2iX0R0JOgBvv-xzGO=Bcw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 49EE3BB53A0A8C67CE60DFA93A027160F4556136395BD1B7E64842F9AF2E067B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210523_193938_205459_26C07A39 
X-CRM114-Status: GOOD (  13.07  )
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

On Fri, 2021-05-21 at 16:06 +0800, Tzung-Bi Shih wrote:
> On Fri, May 21, 2021 at 3:02 PM Irui Wang <irui.wang@mediatek.com> wrote:
> >         fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
> > -       fsize->stepwise = mtk_venc_framesizes;
> > +       fsize->stepwise =
> > +               (ctx->dev->enc_capability & MTK_VENC_4K_CAPABILITY_ENABLE) ?
> > +               mtk_venc_4k_framesizes : mtk_venc_hd_framesizes;
> 
> Use a normal if .. else .. is more readable.
if (ctx->dev->enc_capability & MTK_VENC_4K_CAPABILITY_ENABLE)
	fsize->stepwise = mtk_venc_4k_framesizes;
else
	fsize->stepwise = mtk_venc_hd_framesizes;

> 
> > @@ -1210,6 +1231,9 @@ int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
> >  {
> >         const struct v4l2_ctrl_ops *ops = &mtk_vcodec_enc_ctrl_ops;
> >         struct v4l2_ctrl_handler *handler = &ctx->ctrl_hdl;
> > +       const u8 h264_max_level =
> > +               (ctx->dev->enc_capability & MTK_VENC_4K_CAPABILITY_ENABLE) ?
> > +               V4L2_MPEG_VIDEO_H264_LEVEL_5_1 : V4L2_MPEG_VIDEO_H264_LEVEL_4_2;
> Again, I would like it to be a normal if .. else ..
u8 h264_max_level;
if (ctx->dev->enc_capability & MTK_VENC_4K_CAPABILITY_ENABLE)
	h264_max_level = V4L2_MPEG_VIDEO_H264_LEVEL_5_1;
else
	h264_max_level = V4L2_MPEG_VIDEO_H264_LEVEL_4_2;

Patch V5 will be sent with these if there is no more comments.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
