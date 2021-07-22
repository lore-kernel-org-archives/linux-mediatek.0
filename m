Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E545C63793
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 12:50:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 690D161378
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 12:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 690D161378
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rgfz5gu8h/WcT5TSwokQ7U9t8f8BUsfF4ENOicWt69Q=; b=yfU5C0V3fBccxE
	WZ7jiKtuyt3BKbmskKH363jvOTzQAb4lVEwJRczi/Wh/kmN+wzMKDeuTLjj6yila6oSfD6fth9Pcr
	OIs0YDh5w96RUj1kEfEERC3bu/w5puAwohEXs+WJfRWscxjMu++e2Y8RSohdJVT7FjS4gBVwUnCPR
	W9cwFgm2uz6+lY+AJFtXZ9GXGBhlS0S+1glOP2VX93StqH0dzXaUDsselFI4bCccqLOh/OxvLzdZD
	tGwGBUvcf/6D5BSkS/+VMjyXr4Py/hZ3pMjXRWcaXBGYE7ZZHErbltGwnnpSctZvIGEvTuLmxOXPM
	ajm6YaY/ed/iL64Mx4JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Y9P-001XfI-CJ; Thu, 22 Jul 2021 12:50:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6X7l-001OVi-8B; Thu, 22 Jul 2021 11:44:28 +0000
X-UUID: 3d1e6a55904c44bdb07317669a74bdcb-20210722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=sVejKnwGWH8m17twQO8kI259z77f4UObKDcLs86o0BA=; 
 b=EHRTMlUnReWQ0/AZzpR5ZH0pJZ1bqzhqLQfF3LKLSDMrVwwpItYrSXc/YAoei3uu2w1ly83E93EXNpAe15aDe9248ZDNGXQWUW+N5/kHpgYWhXUQmgLF5+XaDwBNHmI8ojfA1vrQ8DWTUqySAkr2Nqg633JwP6yIRYpqR73UJzI=;
X-UUID: 3d1e6a55904c44bdb07317669a74bdcb-20210722
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 553344500; Thu, 22 Jul 2021 04:44:13 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 04:44:11 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 19:44:10 +0800
Received: from [10.17.3.153] (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Jul 2021 19:44:09 +0800
Message-ID: <1626954248.32022.5.camel@mhfsdcap03>
Subject: Re: [PATCH v2, 00/14] Using component framework to support multi
 hardware decode
From: mtk12024 <yunfei.dong@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
CC: Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>, Hsin-Yi Wang <hsinyi@chromium.org>, "Fritz
 Koenig" <frkoenig@chromium.org>, Irui Wang <irui.wang@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Collabora Kernel ML
 <kernel@collabora.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Thu, 22 Jul 2021 19:44:08 +0800
In-Reply-To: <bac9fe10-50e1-a91f-8f71-b6295227d01b@collabora.com>
References: <20210717081233.7809-1-yunfei.dong@mediatek.com>
 <bac9fe10-50e1-a91f-8f71-b6295227d01b@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_044425_144768_C99EB604 
X-CRM114-Status: GOOD (  35.00  )
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

On Mon, 2021-07-19 at 09:00 +0200, Dafna Hirschfeld wrote:
> 
> On 17.07.21 10:12, Yunfei Dong wrote:
> > This series adds support for multi hardware decode into mtk-vcodec, by first
> > adding component framework to manage each hardware information: interrupt,
> > clock, register bases and power. Secondly add core thread to deal with core
> > hardware message, at the same time, add msg queue for different hardware
> > share messages. Lastly, the architecture of different specs are not the same,
> > using specs type to separate them.
> > 
> > This series has been tested with both MT8183 and MT8173. Decoding was working
> > for both chips.
> 
> Hi, I am currently working on stabilizing the codec drivers on mt8173 chromeos
>   device (elm). It would be very helpful if you provide information on how you
> tested the code.
> Did you test it on chromeos userspace?
> Did you use the test-tast framework?
> What tests did you run?
> 
> Thanks,
> Dafna
> 
Hi Dafna,

Adding component framework is just used for mt8192 and mt8195.
MT8173 and MT8183 still use the the older architecture. In another way,
mt8192 and mt8195 is stateless decode, mt8173 is stateful decode, it is
different. I just porting these patches to mt8173 branch, and just need
to do several simple test.

Thanks,
Yunfei Dong
> > 
> > Patches 1,2 rewrite get register bases and power on/off interface.
> > 
> > Patch 3-5 add component framework to support multi hardware.
> > 
> > Patches 6-14 add interfaces to support core hardware.
> > ----
> > This patch dependents on "media: mtk-vcodec: support for MT8183 decoder"[1].
> > 
> > Multi hardware decode is based on stateless decoder, MT8183 is the first
> > time to add stateless decoder. Otherwise it will cause conflict.
> > Please also accept this patch together with [1].
> > 
> > [1]https://lore.kernel.org/patchwork/project/lkml/list/?series=507084
> > ----
> > 
> > Changes compared with v1:
> > - Fix many comments for patch 3/14
> > - Remove unnecessary code for patch 4/14
> > - Using enum mtk_vdec_hw_count instead of magic numbers for patch 6/14
> > - Reconstructed get/put lat buffer for lat and core hardware for patch 7/14
> > - Using yaml format to instead of txt file for patch 12/14
> > 
> > Yunfei Dong (14):
> >    media: mtk-vcodec: Get numbers of register bases from DT
> >    media: mtk-vcodec: Refactor vcodec pm interface
> >    media: mtk-vcodec: Use component framework to manage each hardware
> >      information
> >    dt-bindings: media: mtk-vcodec: Separate video encoder and decoder
> >      dt-bindings
> >    media: mtk-vcodec: Use pure single core for MT8183
> >    media: mtk-vcodec: Add irq interface for core hardware
> >    media: mtk-vcodec: Add msg queue feature for lat and core architecture
> >    media: mtk-vcodec: Generalize power and clock on/off interfaces
> >    media: mtk-vcodec: Add new interface to lock different hardware
> >    media: mtk-vcodec: Add core thread
> >    media: mtk-vcodec: Support 34bits dma address for vdec
> >    dt-bindings: media: mtk-vcodec: Adds decoder dt-bindings for mt8192
> >    media: mtk-vcodec: Add core dec and dec end ipi msg
> >    media: mtk-vcodec: Use codec type to separate different hardware
> > 
> >   .../media/mediatek-vcodec-comp-decoder.yaml   | 150 +++++++++
> >   ...vcodec.txt => mediatek-vcodec-decoder.txt} |  62 +---
> >   .../media/mediatek-vcodec-encoder.txt         |  73 +++++
> >   drivers/media/platform/mtk-vcodec/Makefile    |   2 +
> >   .../platform/mtk-vcodec/mtk_vcodec_dec.c      |   4 +-
> >   .../platform/mtk-vcodec/mtk_vcodec_dec.h      |   1 +
> >   .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  | 297 +++++++++++++++---
> >   .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   | 194 ++++++++++++
> >   .../platform/mtk-vcodec/mtk_vcodec_dec_hw.h   |  50 +++
> >   .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |  98 ++++--
> >   .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  13 +-
> >   .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |   1 +
> >   .../mtk-vcodec/mtk_vcodec_dec_stateless.c     |   1 +
> >   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  72 ++++-
> >   .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |   1 -
> >   .../platform/mtk-vcodec/mtk_vcodec_intr.c     |  32 +-
> >   .../platform/mtk-vcodec/mtk_vcodec_intr.h     |   4 +-
> >   .../platform/mtk-vcodec/mtk_vcodec_util.c     |  87 ++++-
> >   .../platform/mtk-vcodec/mtk_vcodec_util.h     |   8 +-
> >   .../media/platform/mtk-vcodec/vdec_drv_if.c   |  21 +-
> >   .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  16 +-
> >   .../platform/mtk-vcodec/vdec_msg_queue.c      | 286 +++++++++++++++++
> >   .../platform/mtk-vcodec/vdec_msg_queue.h      | 143 +++++++++
> >   .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  46 ++-
> >   .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  22 ++
> >   25 files changed, 1516 insertions(+), 168 deletions(-)
> >   create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-comp-decoder.yaml
> >   rename Documentation/devicetree/bindings/media/{mediatek-vcodec.txt => mediatek-vcodec-decoder.txt} (56%)
> >   create mode 100644 Documentation/devicetree/bindings/media/mediatek-vcodec-encoder.txt
> >   create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
> >   create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
> >   create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
> >   create mode 100644 drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
