Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7A1C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 02:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+UgRTRM5Rax9p8CDIxbJofNtc5w2M0KZZpKUZOWOgeA=; b=oBY5P6yldrmxPJ
	c2/zK0fuXfomYwNSJyv1tY2Fcv06w6BuWro7cmF4dJecRf5dLXgLwSEnscqiUxFrFf0yYIIEnk3TC
	tMtdcOiaYInrH+u7OyFQdyliPfxGJpD3DtOQ60hwoGNAHQ8HBKPLU1u2AM0bOfVOHzs1f4/zYdpPE
	fqOABvVVyLI6EyYRWpvI/tAt+Ef8EDt2XSOO65HLL4jizriCdW0PePU77zrk+EbqoXkT4JndwmnzR
	H9bBtA3IKSeOTUHlEJtncez4tgRwknLIaLleNvmSN311NIXfGM2tC45zqPiGYtxzAAnKhm80TUXAz
	RyOY5VM4Q0ty8jgafErQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niovc-007vqk-7H; Mon, 25 Apr 2022 02:58:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niovY-007vp3-Ig; Mon, 25 Apr 2022 02:58:18 +0000
X-UUID: 757194ebec8f46108debb805fd0ad5e6-20220424
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:4c931131-9b44-4459-a7cd-11bed5045641, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:c9e6cbf0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 757194ebec8f46108debb805fd0ad5e6-20220424
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <moudy.ho@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1039344627; Sun, 24 Apr 2022 19:58:11 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 24 Apr 2022 19:58:09 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 25 Apr 2022 10:58:07 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 25 Apr 2022 10:58:07 +0800
Message-ID: <f919f454b1b3362b984154231eed314b9bf8fb65.camel@mediatek.com>
Subject: Re: [PATCH v13 3/3] media: platform: mtk-mdp3: add Mediatek MDP3
 driver
From: moudy.ho <moudy.ho@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Landley <rob@landley.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Alexandre Courbot <acourbot@chromium.org>,
 <tfiga@chromium.org>, <drinkcat@chromium.org>, <pihsun@chromium.org>,
 <hsinyi@google.com>, Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, daoyuan
 huang <daoyuan.huang@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, 
 <allen-kh.cheng@mediatek.com>, <xiandong.wang@mediatek.com>,
 <randy.wu@mediatek.com>, <jason-jh.lin@mediatek.com>,
 <roy-cw.yeh@mediatek.com>, <river.cheng@mediatek.com>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 25 Apr 2022 10:58:07 +0800
In-Reply-To: <dda2de21-4d36-beb7-531c-9f5ea1534227@xs4all.nl>
References: <20220418022213.23826-1-moudy.ho@mediatek.com>
 <20220418022213.23826-4-moudy.ho@mediatek.com>
 <dda2de21-4d36-beb7-531c-9f5ea1534227@xs4all.nl>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_195816_676693_0941B332 
X-CRM114-Status: GOOD (  19.34  )
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

On Tue, 2022-04-19 at 08:34 +0200, Hans Verkuil wrote:
> Hi Moudy Ho,
> 
> On 18/04/2022 04:22, Moudy Ho wrote:
> > This patch adds driver for Mediatek's Media Data Path ver.3 (MDP3).
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
> > v4l2-compliance SHA: not available
> > , 32 bits, 32-bit time_t
> 
> This is an old v4l2-compliance (at least almost 2 years old based on
> this text).
> 
> Please compile v4l2-compliance from the v4l-utils git repo and make
> sure you
> see a proper SHA value here. I don't accept v4l2-compliance results
> without a
> valid SHA, since without that I can't tell which version you are
> testing with.
> 
> Regards,
> 
> 	Hans

Hi Hans,

Sorry for testing on the wrong version, the result of updating v4l-
utils is as follows:

v4l2-compliance 1.22.1, 32 bits, 32-bit time_t

Compliance test for mtk-mdp3 device /dev/video10:

Driver Info:
	Driver name      : mtk-mdp3
	Card type        : 14001000.mdp3-rdma0
	Bus info         : platform:mtk-mdp3
	Driver version   : 5.10.103
	Capabilities     : 0x84204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format
		Device Capabilities
	Device Caps      : 0x04204000
		Video Memory-to-Memory Multiplanar
		Streaming
		Extended Pix Format

Required ioctls:
	test VIDIOC_QUERYCAP: OK
	test invalid ioctls: OK

Allow for multiple opens:
	test second /dev/video10 open: OK
	test VIDIOC_QUERYCAP: OK
	test VIDIOC_G/S_PRIORITY: OK
	test for unlimited opens: OK

Debug ioctls:
	test VIDIOC_DBG_G/S_REGISTER: OK (Not Supported)
	test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
	test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
	test VIDIOC_ENUMAUDIO: OK (Not Supported)
	test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDIO: OK (Not Supported)
	Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
	test VIDIOC_G/S_MODULATOR: OK (Not Supported)
	test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
	test VIDIOC_ENUMAUDOUT: OK (Not Supported)
	test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
	test VIDIOC_G/S_AUDOUT: OK (Not Supported)
	Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
	test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
	test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
	test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
	test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
	test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
	test VIDIOC_QUERYCTRL: OK
	test VIDIOC_G/S_CTRL: OK
	test VIDIOC_G/S/TRY_EXT_CTRLS: OK
	test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
	test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
	Standard Controls: 4 Private Controls: 0

Format ioctls:
	test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK
	test VIDIOC_G/S_PARM: OK (Not Supported)
	test VIDIOC_G_FBUF: OK (Not Supported)
	test VIDIOC_G_FMT: OK
	test VIDIOC_TRY_FMT: OK
	test VIDIOC_S_FMT: OK
	test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
	test Cropping: OK
	test Composing: OK
	test Scaling: OK

Codec ioctls:
	test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
	test VIDIOC_G_ENC_INDEX: OK (Not Supported)
	test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
	test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK
	test VIDIOC_EXPBUF: OK
	test Requests: OK (Not Supported)
	test TIME32/64: OK

Test input 0:

Streaming ioctls:
	test read/write: OK (Not Supported)
	test blocking wait: OK

	Video Output Multiplanar: Frame #002
	Video Output Multiplanar: Frame #003
	Video Output Multiplanar: Frame #004
	Video Output Multiplanar: Frame #005
	Video Output Multiplanar: Frame #006
	Video Output Multiplanar: Frame #007
	Video Output Multiplanar: Frame #008
	Video Output Multiplanar: Frame #009
	Video Output Multiplanar: Frame #010
	Video Output Multiplanar: Frame #011
	Video Output Multiplanar: Frame #012
	Video Output Multiplanar: Frame #013
	Video Output Multiplanar: Frame #014
	Video Output Multiplanar: Frame #015
	Video Output Multiplanar: Frame #016
	Video Output Multiplanar: Frame #017
	Video Output Multiplanar: Frame #018
	Video Output Multiplanar: Frame #019
	Video Output Multiplanar: Frame #020
	Video Output Multiplanar: Frame #021
	Video Output Multiplanar: Frame #022
	Video Output Multiplanar: Frame #023
	Video Output Multiplanar: Frame #024
	Video Output Multiplanar: Frame #025
	Video Output Multiplanar: Frame #026
	Video Output Multiplanar: Frame #027
	Video Output Multiplanar: Frame #028
	Video Output Multiplanar: Frame #029
	Video Output Multiplanar: Frame #030
	Video Output Multiplanar: Frame #031
	Video Output Multiplanar: Frame #032
	Video Output Multiplanar: Frame #033
	Video Output Multiplanar: Frame #034
	Video Output Multiplanar: Frame #035
	Video Output Multiplanar: Frame #036
	Video Output Multiplanar: Frame #037
	Video Output Multiplanar: Frame #038
	Video Output Multiplanar: Frame #039
	Video Output Multiplanar: Frame #040
	Video Output Multiplanar: Frame #041
	Video Output Multiplanar: Frame #042
	Video Output Multiplanar: Frame #043
	Video Output Multiplanar: Frame #044
	Video Output Multiplanar: Frame #045
	Video Output Multiplanar: Frame #046
	Video Output Multiplanar: Frame #047
	Video Output Multiplanar: Frame #048
	Video Output Multiplanar: Frame #049
	Video Output Multiplanar: Frame #050
	Video Output Multiplanar: Frame #051
	Video Output Multiplanar: Frame #052
	Video Output Multiplanar: Frame #053
	Video Output Multiplanar: Frame #054
	Video Output Multiplanar: Frame #055
	Video Output Multiplanar: Frame #056
	Video Output Multiplanar: Frame #057
	Video Output Multiplanar: Frame #058
	Video Output Multiplanar: Frame #059
	                                                  
	Video Capture Multiplanar: Captured 58 buffers
	test MMAP (no poll): OK

	Video Output Multiplanar: Frame #002 (select)
	Video Output Multiplanar: Frame #003 (select)
	Video Output Multiplanar: Frame #004 (select)
	Video Output Multiplanar: Frame #005 (select)
	Video Output Multiplanar: Frame #006 (select)
	Video Output Multiplanar: Frame #007 (select)
	Video Output Multiplanar: Frame #008 (select)
	Video Output Multiplanar: Frame #009 (select)
	Video Output Multiplanar: Frame #010 (select)
	Video Output Multiplanar: Frame #011 (select)
	Video Output Multiplanar: Frame #012 (select)
	Video Output Multiplanar: Frame #013 (select)
	Video Output Multiplanar: Frame #014 (select)
	Video Output Multiplanar: Frame #015 (select)
	Video Output Multiplanar: Frame #016 (select)
	Video Output Multiplanar: Frame #017 (select)
	Video Output Multiplanar: Frame #018 (select)
	Video Output Multiplanar: Frame #019 (select)
	Video Output Multiplanar: Frame #020 (select)
	Video Output Multiplanar: Frame #021 (select)
	Video Output Multiplanar: Frame #022 (select)
	Video Output Multiplanar: Frame #023 (select)
	Video Output Multiplanar: Frame #024 (select)
	Video Output Multiplanar: Frame #025 (select)
	Video Output Multiplanar: Frame #026 (select)
	Video Output Multiplanar: Frame #027 (select)
	Video Output Multiplanar: Frame #028 (select)
	Video Output Multiplanar: Frame #029 (select)
	Video Output Multiplanar: Frame #030 (select)
	Video Output Multiplanar: Frame #031 (select)
	Video Output Multiplanar: Frame #032 (select)
	Video Output Multiplanar: Frame #033 (select)
	Video Output Multiplanar: Frame #034 (select)
	Video Output Multiplanar: Frame #035 (select)
	Video Output Multiplanar: Frame #036 (select)
	Video Output Multiplanar: Frame #037 (select)
	Video Output Multiplanar: Frame #038 (select)
	Video Output Multiplanar: Frame #039 (select)
	Video Output Multiplanar: Frame #040 (select)
	Video Output Multiplanar: Frame #041 (select)
	Video Output Multiplanar: Frame #042 (select)
	Video Output Multiplanar: Frame #043 (select)
	Video Output Multiplanar: Frame #044 (select)
	Video Output Multiplanar: Frame #045 (select)
	Video Output Multiplanar: Frame #046 (select)
	Video Output Multiplanar: Frame #047 (select)
	Video Output Multiplanar: Frame #048 (select)
	Video Output Multiplanar: Frame #049 (select)
	Video Output Multiplanar: Frame #050 (select)
	Video Output Multiplanar: Frame #051 (select)
	Video Output Multiplanar: Frame #052 (select)
	Video Output Multiplanar: Frame #053 (select)
	Video Output Multiplanar: Frame #054 (select)
	Video Output Multiplanar: Frame #055 (select)
	Video Output Multiplanar: Frame #056 (select)
	Video Output Multiplanar: Frame #057 (select)
	Video Output Multiplanar: Frame #058 (select)
	Video Output Multiplanar: Frame #059 (select)
	                                                  
	Video Capture Multiplanar: Captured 58 buffers
	test MMAP (select): OK

	Video Output Multiplanar: Frame #002 (epoll)
	Video Output Multiplanar: Frame #003 (epoll)
	Video Output Multiplanar: Frame #004 (epoll)
	Video Output Multiplanar: Frame #005 (epoll)
	Video Output Multiplanar: Frame #006 (epoll)
	Video Output Multiplanar: Frame #007 (epoll)
	Video Output Multiplanar: Frame #008 (epoll)
	Video Output Multiplanar: Frame #009 (epoll)
	Video Output Multiplanar: Frame #010 (epoll)
	Video Output Multiplanar: Frame #011 (epoll)
	Video Output Multiplanar: Frame #012 (epoll)
	Video Output Multiplanar: Frame #013 (epoll)
	Video Output Multiplanar: Frame #014 (epoll)
	Video Output Multiplanar: Frame #015 (epoll)
	Video Output Multiplanar: Frame #016 (epoll)
	Video Output Multiplanar: Frame #017 (epoll)
	Video Output Multiplanar: Frame #018 (epoll)
	Video Output Multiplanar: Frame #019 (epoll)
	Video Output Multiplanar: Frame #020 (epoll)
	Video Output Multiplanar: Frame #021 (epoll)
	Video Output Multiplanar: Frame #022 (epoll)
	Video Output Multiplanar: Frame #023 (epoll)
	Video Output Multiplanar: Frame #024 (epoll)
	Video Output Multiplanar: Frame #025 (epoll)
	Video Output Multiplanar: Frame #026 (epoll)
	Video Output Multiplanar: Frame #027 (epoll)
	Video Output Multiplanar: Frame #028 (epoll)
	Video Output Multiplanar: Frame #029 (epoll)
	Video Output Multiplanar: Frame #030 (epoll)
	Video Output Multiplanar: Frame #031 (epoll)
	Video Output Multiplanar: Frame #032 (epoll)
	Video Output Multiplanar: Frame #033 (epoll)
	Video Output Multiplanar: Frame #034 (epoll)
	Video Output Multiplanar: Frame #035 (epoll)
	Video Output Multiplanar: Frame #036 (epoll)
	Video Output Multiplanar: Frame #037 (epoll)
	Video Output Multiplanar: Frame #038 (epoll)
	Video Output Multiplanar: Frame #039 (epoll)
	Video Output Multiplanar: Frame #040 (epoll)
	Video Output Multiplanar: Frame #041 (epoll)
	Video Output Multiplanar: Frame #042 (epoll)
	Video Output Multiplanar: Frame #043 (epoll)
	Video Output Multiplanar: Frame #044 (epoll)
	Video Output Multiplanar: Frame #045 (epoll)
	Video Output Multiplanar: Frame #046 (epoll)
	Video Output Multiplanar: Frame #047 (epoll)
	Video Output Multiplanar: Frame #048 (epoll)
	Video Output Multiplanar: Frame #049 (epoll)
	Video Output Multiplanar: Frame #050 (epoll)
	Video Output Multiplanar: Frame #051 (epoll)
	Video Output Multiplanar: Frame #052 (epoll)
	Video Output Multiplanar: Frame #053 (epoll)
	Video Output Multiplanar: Frame #054 (epoll)
	Video Output Multiplanar: Frame #055 (epoll)
	Video Output Multiplanar: Frame #056 (epoll)
	Video Output Multiplanar: Frame #057 (epoll)
	Video Output Multiplanar: Frame #058 (epoll)
	Video Output Multiplanar: Frame #059 (epoll)
	                                                  
	Video Capture Multiplanar: Captured 58 buffers
	test MMAP (epoll): OK
	test USERPTR (no poll): OK (Not Supported)
	test USERPTR (select): OK (Not Supported)
	test DMABUF: Cannot test, specify --expbuf-device

Total for mtk-mdp3 device /dev/video10: 53, Succeeded: 53, Failed: 0,
Warnings: 0

If there is any lack of information, please let me know.

Thanks,
Moudy


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
