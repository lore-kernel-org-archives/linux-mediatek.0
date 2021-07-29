Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D89C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 08:08:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E96A61077
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 08:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6E96A61077
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jEKfmA7QgXFEPDQSHz/u+JWoIDTiXzJ5pT675m5ZpwU=; b=ZQ1b4+BR4rm0g5
	rXkLoyjcx82Ixe4WRowO9qmt20LfKjniqZMTiooezC8P5hBLSvHAyUQy/4mlztY0TOaA9teOhexLB
	/2mYQT9ECfyTXOBxBuofLVrIWbD4xrhy0UzrmEtL4OyI+Eb7+14bcM4PSeODKej86GXVC/7502ddz
	MCOZG0UULvxxOHhxqsCMR6LQDz+xb+lUGonnOf6LztY3FQae2nkRP8dn40SAmLVC+LpvBIToURYhb
	RH+O7FAuYDgkE8m0QqmY5wYWWkWg43cu5ZWuytCkqA6g0JpNwawt8U/Jaz0zmmOJ8B7Y7vgrDImwc
	BvLWk2e345BOv/iT6roQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m915d-003UDd-DM; Thu, 29 Jul 2021 08:08:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m915a-003UCR-JW; Thu, 29 Jul 2021 08:08:24 +0000
X-UUID: dd77d0271a414bc1a299f4ad7a9a88be-20210729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=x6T6tNQhW8ihcYtd04KwcK0iAOYJrhw5oQt/VNq3HIs=; 
 b=eS9kwSs2dn+skxHA0RGaXpRrVY0Q6YdGUAnhbt2FNiCbKmJ7p6FAxFTsUuF17YJmY7/b9ASfZor8jwr9ZfPbqFIKiAZ5dGBaTpjlZ99KhjUYRxs0o5Zup/EuTm5fzGuoonYGMIxWZ90QPCRZIGploTunX1tfsNyURCvjqxPSM5Q=;
X-UUID: dd77d0271a414bc1a299f4ad7a9a88be-20210729
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 462441639; Thu, 29 Jul 2021 01:08:17 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 01:08:15 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 16:08:07 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 29 Jul 2021 16:08:06 +0800
Message-ID: <1627546086.17009.7.camel@mhfsdcap03>
Subject: Re: [PATCH v3, 00/15] Using component framework to support multi
 hardware decode
From: yunfei dong <yunfei.dong@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Date: Thu, 29 Jul 2021 16:08:06 +0800
In-Reply-To: <2b562943-534a-b53d-696d-9f2a4836f76e@collabora.com>
References: <20210727101051.24418-1-yunfei.dong@mediatek.com>
 <2b562943-534a-b53d-696d-9f2a4836f76e@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_010822_678208_A2CAFFDF 
X-CRM114-Status: GOOD (  37.22  )
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

On Tue, 2021-07-27 at 12:55 +0200, Dafna Hirschfeld wrote:
> Thank you for the patchset.
> 
> Could you provide information on how you
> tested the code.
> Did you test it on chromeos userspace?
> Did you use the test-tast framework?
> What tests did you run?
> 
> Dafna
> 
Hi Dafna,

I just merge the code to kernel 4.19 and build pass.
When the system boot up, I will play some vdec h264/vp8/vp9 bitstreams.
The code should be ok when all bitstreams can play well.

For MT8173 is statefull decode, I won't change the arch and component is
used for stateless decode(mt8192), mt8183 not use component arch also.
Only if decode driver can play well, the change should be ok for mt8173.

I needn't to do tast test for mt8173 for the arch not be changed.

Thanks,
Yunfei Dong
> 
> On 27.07.21 12:10, Yunfei Dong wrote:
> > This series adds support for multi hardware decode into mtk-vcodec, by first
> > adding component framework to manage each hardware information: interrupt,
> > clock, register bases and power. Secondly add core thread to deal with core
> > hardware message, at the same time, add msg queue for different hardware
> > share messages. Lastly, the architecture of different specs are not the same,
> > using specs type to separate them.
> > 
> > This series has been tested with both MT8183 and MT8173. Decoding was working
> > for both chips.
> > 
> > Patches 1,2 rewrite get register bases and power on/off interface.
> > 
> > Patch 3-5 add component framework to support multi hardware.
> > 
> > Patches 6-14 add interfaces to support core hardware.
> > ----
> > This patch dependents on "media: mtk-vcodec: support for MT8183 decoder"[1].
> > 
> > Multi hardware decode is based on stateless decoder, MT8183 is the first time
> > to add stateless decoder. Otherwise it will cause conflict. Please also accept
> > this patch together with [1].
> > 
> > [1]https://lore.kernel.org/patchwork/project/lkml/list/?series=507084
> > ----
> > Changes compared with v2:
> > - Fix return value for patch 1/15
> > - Add this new patch to align vdec and venc wake up ctx interface for patch 2/15
> > - Fix comments for patch 4/15
> > - Change txt files to yaml for patch 5/15
> > - Generalize wake up ctx interface for stateless and stateful decode for patch 7/15
> > - Add document for structs and functions for patch 8/15
> > - Add condition to check the return value of kthread_run for patch 11/15
> > - Fix yaml check fail for patch 13/15
> > 
> > Changes compared with v1:
> > - Fix many comments for patch 3/14
> > - Remove unnecessary code for patch 4/14
> > - Using enum mtk_vdec_hw_count instead of magic numbers for patch 6/14
> > - Reconstructed get/put lat buffer for lat and core hardware for patch 7/14
> > - Using yaml format to instead of txt file for patch 12/14
> > 
> > Yunfei Dong (15):
> >    media: mtk-vcodec: Get numbers of register bases from DT
> >    media: mtk-vcodec: Align vcodec wake up interrupt interface
> >    media: mtk-vcodec: Refactor vcodec pm interface
> >    media: mtk-vcodec: Use component framework to manage each hardware
> >      information
> >    dt-bindings: media: mtk-vcodec: Separate video encoder and decoder
> >      dt-bindings
> >    media: mtk-vcodec: Use pure single core for MT8183
> >    media: mtk-vcodec: Add irq interface for multi hardware
> >    media: mtk-vcodec: Add msg queue feature for lat and core architecture
> >    media: mtk-vcodec: Generalize power and clock on/off interfaces
> >    media: mtk-vcodec: Add new interface to lock different hardware
> >    media: mtk-vcodec: Add core thread
> >    media: mtk-vcodec: Support 34bits dma address for vdec
> >    dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for mt8192
> >    media: mtk-vcodec: Add core dec and dec end ipi msg
> >    media: mtk-vcodec: Use codec type to separate different hardware
> > 
> >   .../media/mediatek,vcodec-comp-decoder.yaml   | 154 +++++++++
> >   .../media/mediatek,vcodec-decoder.yaml        | 138 ++++++++
> >   .../media/mediatek,vcodec-encoder.yaml        | 128 ++++++++
> >   .../bindings/media/mediatek-vcodec.txt        | 130 --------
> >   drivers/media/platform/mtk-vcodec/Makefile    |   2 +
> >   .../platform/mtk-vcodec/mtk_vcodec_dec.c      |   4 +-
> >   .../platform/mtk-vcodec/mtk_vcodec_dec.h      |   1 +
> >   .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 296 +++++++++++++++---
> >   .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   | 184 +++++++++++
> >   .../platform/mtk-vcodec/mtk_vcodec_dec_hw.h   |  48 +++
> >   .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |  98 ++++--
> >   .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  13 +-
> >   .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |   1 +
> >   .../mtk-vcodec/mtk_vcodec_dec_stateless.c     |   1 +
> >   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  76 ++++-
> >   .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |  12 +-
> >   .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |   1 -
> >   .../platform/mtk-vcodec/mtk_vcodec_intr.c     |  27 +-
> >   .../platform/mtk-vcodec/mtk_vcodec_intr.h     |   4 +-
> >   .../platform/mtk-vcodec/mtk_vcodec_util.c     |  87 ++++-
> >   .../platform/mtk-vcodec/mtk_vcodec_util.h     |   8 +-
> >   .../platform/mtk-vcodec/vdec/vdec_h264_if.c   |   2 +-
> >   .../mtk-vcodec/vdec/vdec_h264_req_if.c        |   2 +-
> >   .../platform/mtk-vcodec/vdec/vdec_vp8_if.c    |   2 +-
> >   .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    |   2 +-
> >   .../media/platform/mtk-vcodec/vdec_drv_if.c   |  21 +-
> >   .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  16 +-
> >   .../platform/mtk-vcodec/vdec_msg_queue.c      | 290 +++++++++++++++++
> >   .../platform/mtk-vcodec/vdec_msg_queue.h      | 157 ++++++++++
> >   .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  46 ++-
> >   .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  22 ++
> >   .../platform/mtk-vcodec/venc/venc_h264_if.c   |   2 +-
> >   .../platform/mtk-vcodec/venc/venc_vp8_if.c    |   2 +-
> >   33 files changed, 1697 insertions(+), 280 deletions(-)
> >   create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-comp-decoder.yaml
> >   create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-decoder.yaml
> >   create mode 100644 Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
> >   delete mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> >   create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
> >   create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
> >   create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> >   create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
