Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5369BC25B0E
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 07:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRra99ybeDU1VvzdrVMw86yXkS8LgIZdc8GNqbtCaOw=; b=SjXf2jQTODoxKc9vmfMzKF08wx
	5SZEtDY1BHHS54t3n7SC1r0Unfqe2KHkh1i5RaIgQKYqfPrWXTiviS1LlziKffAJjsm17meeDeVB1
	EP7IUXKNneuMMOBK7QKycoNm3bnG0mGkOYhW7vYKvSBqJx73p0rOff0pnIch4LOlCW16vDSXbkNp9
	iu94LY4i3G9slNK02QNXErqTiwkzrwxuPs4M+1D91T9yILxi03q6ICbr4buLdTPQHmNow9S6Y9CPF
	yjT/guvUPtQ+sVis818DfYw7I59U6gXwFr7VFQexRj77zv2XJcjxuqMf1oeQDJcqqYCpQLbEulEvK
	UFhioLQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOwpB-003eRw-Rk; Fri, 19 Aug 2022 07:53:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOwoy-003eEb-FW; Fri, 19 Aug 2022 07:53:37 +0000
X-UUID: c1641343b57e4a1ead9139ff6040e307-20220819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=xRra99ybeDU1VvzdrVMw86yXkS8LgIZdc8GNqbtCaOw=;
	b=p7ToznoCPDfmE76ARNVQLvU6hK9DWBauDsmYSbnCvzFvOQrCMRx6j5P4XwCwYMFfQjrAWnR2zKmT5aRN4kdPZ28s9XmFd7frgxf/+Qe32+Hx4RpKKK4Ti8rkNflcyecRGHCzu7tr7ntpTQXBHIQxT8D2U0eeOxqMYDSK4q308qw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:9fbff799-d079-4dc6-b78d-df81e9f11fdb,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:7ac8219d-da39-4e3b-a854-56c7d2111b46,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c1641343b57e4a1ead9139ff6040e307-20220819
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 400858659; Fri, 19 Aug 2022 00:53:24 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 19 Aug 2022 15:42:29 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 19 Aug 2022 15:42:29 +0800
Message-ID: <c6e34df9896a1da0c3a72aff5b170a81a4252f1b.camel@mediatek.com>
Subject: Re: [PATCH v25 4/4] media: platform: mtk-mdp3: add MediaTek MDP3
 driver
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Moudy Ho <moudy.ho@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, "Rob Herring"
	<robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, Alexandre Courbot
	<acourbot@chromium.org>, <tfiga@chromium.org>, <drinkcat@chromium.org>,
	<pihsun@chromium.org>, <hsinyi@google.com>, Benjamin Gaignard
	<benjamin.gaignard@collabora.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<cellopoint.kai@gmail.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, daoyuan
 huang <daoyuan.huang@mediatek.com>
Date: Fri, 19 Aug 2022 15:42:29 +0800
In-Reply-To: <b0b4ff87-355e-1910-c6d2-a9690f3d7543@xs4all.nl>
References: <20220817095629.29911-1-moudy.ho@mediatek.com>
	 <20220817095629.29911-5-moudy.ho@mediatek.com>
	 <b0b4ff87-355e-1910-c6d2-a9690f3d7543@xs4all.nl>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_005336_576925_A4070A0F 
X-CRM114-Status: GOOD (  25.65  )
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

On Thu, 2022-08-18 at 13:02 +0200, Hans Verkuil wrote:
> Hi Moudy,
> 
> I noticed one more thing (and it is probably better to post a v26
> after all):
> 
> On 17/08/2022 11:56, Moudy Ho wrote:
> > This patch adds driver for MediaTek's Media Data Path ver.3 (MDP3).
> > It provides the following functions:
> >   color transform, format conversion, resize, crop, rotate, flip
> >   and additional image quality enhancement.
> > 
> > The MDP3 driver is mainly used for Google Chromebook products to
> > import the new architecture to set the HW settings as shown below:
> >   User -> V4L2 framework
> >     -> MDP3 driver -> SCP (setting calculations)
> >       -> MDP3 driver -> CMDQ (GCE driver) -> HW
> > 
> > Each modules' related operation control is sited in mtk-mdp3-comp.c
> > Each modules' register table is defined in file with "mdp_reg_"
> > prefix
> > GCE related API, operation control  sited in mtk-mdp3-cmdq.c
> > V4L2 m2m device functions are implemented in mtk-mdp3-m2m.c
> > Probe, power, suspend/resume, system level functions are defined in
> > mtk-mdp3-core.c
> > 
> > v4l2-compliance 1.22.1, 32 bits, 32-bit time_t
> 
> First of all, the v4l2-compliance output belongs to the cover letter,
> not
> to a commit log for a patch.
> 
> More importantly, I can tell that v4l2-compliance was a prepackaged
> version,
> but you need to compile it from the git repo yourself:
> 
> git clone git://linuxtv.org/v4l-utils.git
> cd v4l-utils
> ./bootstrap.sh
> ./configure
> make
> sudo make install
> 
> Running v4l2-compliance should start with this (or something close):
> 
> v4l2-compliance 1.23.0-4941, 64 bits, 64-bit time_t
> v4l2-compliance SHA: 71112d214762 2022-07-28 15:31:13
> 
> I need to see the SHA to confirm that you tested with a sufficiently
> new
> v4l2-compliance version. Prepackaged v4l2-compliance binaries tend to
> be too old, at least for the purpose of compliance checking a new
> driver.
> 
> Regards,
> 
> 	Hans
> 

Hello Hans,

Because there are some issues for Moudy's mail account, I help him
reply the mail:

Thanks for your review and comment, those two errors you mentioned have
been corrected accordingly.

I will test it with the latest version of v4l2-compliance, and it will
be released in v26 together with the testing report.

BRs,
Bo-Chen

> > Compliance test for mtk-mdp3 device /dev/video0:
> > Driver Info:
> > 	Driver name      : mtk-mdp3
> > 	Card type        : MediaTek MDP3
> > 	Bus info         : platform:14001000.mdp3-rdma0
> > 	Driver version   : 6.0.0
> > 	Capabilities     : 0x84204000
> > 		Video Memory-to-Memory Multiplanar
> > 		Streaming
> > 		Extended Pix Format
> > 		Device Capabilities
> > 	Device Caps      : 0x04204000
> > 		Video Memory-to-Memory Multiplanar
> > 		Streaming
> > 		Extended Pix Format
> 
> 


