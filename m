Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7BFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jan 2022 01:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MUZzHHCct0R7xeuqlI6oM19KgrOy8hAwV2o+Gm4svUk=; b=UeUYLqbdCk4DlC
	JbLTGSqX+cmI8QAk2ShQ6rJCQGXmmCW7yAZHAo5Bva/GxU9E4hmprupZ741hD8q6Ki5mZk8XZCsWk
	TyVRRbUaW3SvgaJJMFZhBsaPBhvQv2o9nxaGteiVlT6W36om+2E87ObxabHg3OZLQDnmiGOymYLVZ
	MMdcXdn5p2l+B1wDw5TBNNfvnQgO68I2VeoSn30Ovlf80EaIUNnNr2RrTQTKQSY0oPhZT9MGRZeU7
	U73yOtCJR9GAJH+cuBe1Ln1EVP4T61ti7mSrKFhLej9bxXxQDVOaBlqxzQ9OQcmZDArgN6xoMs4oH
	lL51q4RMbsNR8KfOKI3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9dT2-00Gmei-6A; Tue, 18 Jan 2022 01:39:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9dSz-00Gme1-3K; Tue, 18 Jan 2022 01:39:22 +0000
X-UUID: 6e53ba81588b4d49b83edd0e214bac7e-20220117
X-UUID: 6e53ba81588b4d49b83edd0e214bac7e-20220117
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1893621226; Mon, 17 Jan 2022 18:39:18 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 17 Jan 2022 17:39:17 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 18 Jan 2022 09:39:15 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 18 Jan 2022 09:39:15 +0800
Message-ID: <5edbd10d7944c496471bb2a6235e42f7c02d2452.camel@mediatek.com>
Subject: Re: [PATCH v4 0/2] Add SCP support for mt8186
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, Tinghan Shen <tinghan.shen@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-remoteproc@vger.kernel.org>
Date: Tue, 18 Jan 2022 09:39:15 +0800
In-Reply-To: <20220117172637.GB1119324@p14s>
References: <20220105094125.6917-1-allen-kh.cheng@mediatek.com>
 <20220117172637.GB1119324@p14s>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_173921_202828_231A273E 
X-CRM114-Status: GOOD (  17.84  )
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

On Mon, 2022-01-17 at 10:26 -0700, Mathieu Poirier wrote:
> On Wed, Jan 05, 2022 at 05:41:23PM +0800, allen-kh.cheng wrote:
> > From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> > 
> > changes since v3:
> >  - use rproc-next
> > 
> > changes since v2:
> >  - remove redundant SoB
> > 
> > changes since v1:
> >  - use mt8192_power_on_sram() helper
> >  - add MT8186_SCP_L1_SRAM_PD_P1 in mtk_common.h
> >  - add MT8186_SCP_L1_SRAM_PD_P2 in mtk_common.h
> > 
> > Based on rproc-next
> > 
> > Allen-KH Cheng (2):
> >   dt-bindings: remoteproc: mediatek: Add binding for mt8186 scp
> >   remoteproc: mediatek: Support mt8186 scp
> > 
> >  .../bindings/remoteproc/mtk,scp.yaml          |  1 +
> >  drivers/remoteproc/mtk_common.h               |  3 ++
> >  drivers/remoteproc/mtk_scp.c                  | 35
> > +++++++++++++++++++
> >  3 files changed, 39 insertions(+)
> 
> Both patches in this set are giving me a checkpatch warning that is
> impossible
> to miss.  I deleting this patchset from my queue.   

Hi Mathieu,

I find the problem is 'Reviewed-by:' is the preferred signature.

I will correct this in next version.

Thanks.

> 
> > 
> > -- 
> > 2.18.0
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
