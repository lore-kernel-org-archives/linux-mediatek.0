Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3244C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 01:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0x1cZgzqjdij14mr+ygC71rFmGyaZ2+gYwxdazIcqA4=; b=jWe3H/6j5yzgcj
	Ri3Zl0j+l/Y1Grbj4Sk7mrl3GSthPCWUombZzD8eCz7fSKfbbi3dllIgT+Mvuxlgkl+kObPzZGCqw
	tIh3bjlMNoCR5jAmoUxkHoUqpiHR8Cb1X6itsGf1PorJGShWCptNxWTA+BKflp5+1b7QTTxygfXCg
	igp2CLzh706AyOAo/VSMw6aeIypFIHrEEnhidrt8GS4V70Gogowknai3Z8c0QNoIdaK82NVyXa3oD
	wG+iHROxd39xDJhKPWNSYq0hwbpKO3tE6VHOPA7J3I7v+9KUGjaAOvpHJ1XGXmmY/lOVTSLW2Iyp8
	ePKtMAAFDD6fgfYrt/pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUImq-00B6mr-HA; Wed, 16 Mar 2022 01:49:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUImm-00B6ld-GF; Wed, 16 Mar 2022 01:49:15 +0000
X-UUID: 75b6981b5b7b4e2cb9e0e9076f1ac1f9-20220315
X-UUID: 75b6981b5b7b4e2cb9e0e9076f1ac1f9-20220315
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 850376551; Tue, 15 Mar 2022 18:49:02 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Mar 2022 18:48:55 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Mar 2022 09:48:53 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Mar 2022 09:48:53 +0800
Message-ID: <9b9d1cb4c606a051ffc2e926d40a7af33004aaf6.camel@mediatek.com>
Subject: Re: [PATCH v3] remoteproc: mediatek: fix side effect of mt8195 sram
 power on
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-remoteproc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 16 Mar 2022 09:48:53 +0800
In-Reply-To: <36e7847e-56ed-8768-388e-c6a00a2cb0ec@collabora.com>
References: <20220314111806.28168-1-tinghan.shen@mediatek.com>
 <36e7847e-56ed-8768-388e-c6a00a2cb0ec@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_184912_567697_3187B799 
X-CRM114-Status: GOOD (  27.04  )
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

Hi Angelo,

On Mon, 2022-03-14 at 12:31 +0100, AngeloGioacchino Del Regno wrote:
> Il 14/03/22 12:18, Tinghan Shen ha scritto:
> > The definition of L1TCM_SRAM_PDN bits on mt8195 is different to mt8192.
> > 
> > L1TCM_SRAM_PDN bits[3:0] control the power of mt8195 L1TCM SRAM.
> > 
> > L1TCM_SRAM_PDN bits[7:4] control the access path to EMI for SCP.
> > These bits have to be powered on to allow EMI access for SCP.
> > 
> > Bits[7:4] also affect audio DSP because audio DSP and SCP are
> > placed on the same hardware bus. If SCP cannot access EMI, audio DSP is
> > blocked too.
> > 
> > L1TCM_SRAM_PDN bits[31:8] are not used.
> > 
> > This fix removes modification of bits[7:4] when power on/off mt8195 SCP
> > L1TCM. It's because the modification introduces a short period of time
> > blocking audio DSP to access EMI. This was not a problem until we have
> > to load both SCP module and audio DSP module. audio DSP needs to access
> > EMI because it has source/data on DRAM. Audio DSP will have unexpected
> > behavior when it accesses EMI and the SCP driver blocks the EMI path at
> > the same time.
> > 
> > Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> 
> 
> Hello Tinghan,
> 
> I'm sorry, but in the last review I forgot to mention that you should
> really add a Fixes tag to this commit, since this is.. a fix.
> 
> This is the tag that you should use:
> 
> Fixes: 79111df414fc ("remoteproc: mediatek: Support mt8195 scp")
> 
> After adding that,
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 

I'll add it at next version.
thank you very much!

Best regards,
TingHan

> > ---
> > v3: fix build error
> > v2: apply comments about macro definition and function calls
> > ---
> >   drivers/remoteproc/mtk_common.h |  2 +
> >   drivers/remoteproc/mtk_scp.c    | 67 +++++++++++++++++++++++++--------
> >   2 files changed, 53 insertions(+), 16 deletions(-)
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
