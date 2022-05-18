Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9FFC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 12:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADyPxJeVbtTRC9SGQjoPvthQCpjVEoJSiMuV1wy2MYA=; b=nip59kmm5cStV2
	z5P12TjsMFoQFW48u7v7NQjFZUc7MD2XjO2GdUm2bEbGUEejvAbKcKEMn9OZbWY1cK2NjiebfYyZU
	NJZBh6nMHvOpd7v+WzuS5CmR/lA+Nw1rHEt5TiB+M7AdtsXQcZOfoGavn2HChXggKoboKgvdAGYtD
	8mLhVk/pjLJOG7vxqwfW8S8a4U/7FwGyHo9QsiG10kwOwCNUIdGf19VYUs+dYUW3i4uCjRyhwoFFa
	Mt2Lv4Dreh/q+sveK8igAfjN99/01h62sIs0YaQNzrJXrGNw1nIvc7dzQcDr/IDemiZf8vDmAM6sA
	vEY4i7D3dkvV2BnWUjOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrISU-001kl3-II; Wed, 18 May 2022 12:07:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrISI-001kf1-Ci; Wed, 18 May 2022 12:07:08 +0000
X-UUID: 9fd1b9474648439eb0ac2312398add34-20220518
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qjFhNdYXSX2a0bMwJHpyfZio+1rXDavLHe9Tb09h/n0=; 
 b=TACOe1pq5j1+rgzxZOaJ/ld/4jRPWPR3WxzVTY7Vv7HGCELFhQI1ndV9m1UpEvFA2aPDqSLxfHcPQYgB678QK/gKDugGpeuy8hW5aZy7+pSwqpwEO1rfrZanYgAJYCCu7tqV9KHj7tftJUlJZQ8tNB1n9EAPnoy5K+Sb29IQ6vc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:2a70a6bd-34d2-4211-9ea0-01c4aaa9f830, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:10c7b679-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 9fd1b9474648439eb0ac2312398add34-20220518
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2098979314; Wed, 18 May 2022 05:06:53 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 May 2022 05:06:51 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 May 2022 20:06:49 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 May 2022 20:06:48 +0800
Message-ID: <d101876a72e6248c77ee5de0d1dc52687e225629.camel@mediatek.com>
Subject: Re: [PATCH v6, 6/7] media: mediatek: vcodec: prevent kernel crash
 when scp ipi timeout
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Fritz
 Koenig" <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>, "Steve
 Cho" <stevecho@chromium.org>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 18 May 2022 20:06:48 +0800
In-Reply-To: <31992c67-400e-8e14-38c2-4655995886f5@xs4all.nl>
References: <20220513092526.9670-1-yunfei.dong@mediatek.com>
 <20220513092526.9670-7-yunfei.dong@mediatek.com>
 <ea9a04fb-368d-daca-96ae-9366253a5e91@xs4all.nl>
 <f26d5225fc8c499226c297ed86feb5ee20e8f3d3.camel@mediatek.com>
 <31992c67-400e-8e14-38c2-4655995886f5@xs4all.nl>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_050706_477723_E39573C3 
X-CRM114-Status: GOOD (  34.52  )
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

Dear Hans,

Thanks for your suggestion.

On Wed, 2022-05-18 at 13:34 +0200, Hans Verkuil wrote:
> 
> On 5/18/22 13:29, yunfei.dong@mediatek.com wrote:
> > Dear Hans,
> > 
> > Thanks for your review.
> > On Wed, 2022-05-18 at 11:37 +0200, Hans Verkuil wrote:
> > > Hi Yunfei,
> > > 
> > > On 5/13/22 11:25, Yunfei Dong wrote:
> > > > When SCP timeout during playing video, kernel crashes with
> > > > following
> > > > message. It's caused by accessing NULL pointer in
> > > > vpu_dec_ipi_handler.
> > > > This patch doesn't solve the root cause of NULL pointer, but
> > > > merely
> > > > prevent kernel crashed when encounter the NULL pointer.
> > > 
> > > Is the root cause being addressed as well? Where is the root
> > > cause?
> > > Is it
> > > in this driver or in the scp (i.e. the remoteproc) driver?
> > > 
> > > I need a bit more information to decide whether this series is
> > > ready
> > > to
> > > be merged for 5.20 or not.
> > > 
> > > Regards,
> > > 
> > > 	Hans
> > > 
> > 
> > Vpu will be NUll when scp(micro processor) is hang or crash. Need
> > to
> > keep kernel works well , so add this patch.
> 
> OK, I think this should be stated in the commit log, and also in the
> code
> (see below).
> 
> > 
> > Best Regards,
> > Yunfei Dong
> 
> <snip>
> 
> > > > diff --git
> > > > a/drivers/media/platform/mediatek/vcodec/vdec_vpu_if.c
> > > > b/drivers/media/platform/mediatek/vcodec/vdec_vpu_if.c
> > > > index 35f4d5583084..1041dd663e76 100644
> > > > --- a/drivers/media/platform/mediatek/vcodec/vdec_vpu_if.c
> > > > +++ b/drivers/media/platform/mediatek/vcodec/vdec_vpu_if.c
> > > > @@ -91,6 +91,11 @@ static void vpu_dec_ipi_handler(void *data,
> > > > unsigned int len, void *priv)
> > > >  	struct vdec_vpu_inst *vpu = (struct vdec_vpu_inst *)
> > > >  					(unsigned long)msg-
> > > > > ap_inst_addr;
> > > > 
> > > >  
> > > > +	if (!vpu) {
> > > > +		mtk_v4l2_err("ap_inst_addr is NULL");
> 
> E.g., either add a comment here or perhaps change the error message
> to:
> 
> "ap_inst_addr is NULL, did the SCP hang?"
> 
> Or something along those lines.
> 
I will change the message in next patch like below.

mtk_v4l2_err("ap_inst_addr is NULL, did the SCP hang or crash?");

> Shouldn't there be a \n at the end of this message as well? Or does
> mtk_v4l2_err add that?
> 
mtk_v4l2_err add '\n' in the end.
> Regards,
> 
> 	Hans
> 
Best Regards,
Yunfei Dong
> > > > +		return;
> > > > +	}
> > > > +
> > > >  	mtk_vcodec_debug(vpu, "+ id=%X", msg->msg_id);
> > > >  
> > > >  	vpu->failure = msg->status;
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
