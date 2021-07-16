Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B3CC07E95
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 08:09:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 924B560E0B
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 08:09:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 924B560E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XnBFh1GCNFu+0GLN16cw0bFKjVvm/Kr3fbZ8OG9jURI=; b=Uj3RMz5+Sy6jli
	VhqimQ8VXkhk+Q5cqfGQTwE1u5enEHSFroGn1XnbbMV024dduPzHP2ph7WUA7SJodWnUilDbRXPa8
	giQIV3UW0dllJLUHsbMzcDSJYsBSlQ0OPfr6fWeBrOgp/Nyqu9gmg+fK5Qii301qq98zYTUrFLZwI
	d9qv2LaCFJzDTQhCVDR+hWoJrW0XgASbPw9oPHGZLiZ42D7AV33bZyzXaD7DsYapW7/+U4G955bmQ
	RoA7wQuChbTojYlMtUnuVMODmSm7MJwulLLCzqdbqoT210UF2dle/h/ScoaVaY0hY0/p9EVacv//u
	F9yOar6CgOADpHEPfH8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4IuA-003dzX-Q4; Fri, 16 Jul 2021 08:09:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4Iu8-003dy3-FD; Fri, 16 Jul 2021 08:09:05 +0000
X-UUID: aefcc9d5873849ecb2dfef2f71293350-20210716
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=STvsfys3SyxzFEcacxP9XPyeItc0HjtDbcv1EhxrN3I=; 
 b=HkvcACzi41sJNRXPlmwTBh0w5cp8pJ/NbZGU2cBiGcMKRoAWu/kYt2UkH9wUa6hXUnZBRfJLbaJinbkiSTH45OcNPwy7pUpkmB4+ZQjZ96mzFG+NJhG8BaJ6hxgBhlxx8d555f+e7EqOoRLG2WNWlngWD0jDmozMM31ZcQMbr1Y=;
X-UUID: aefcc9d5873849ecb2dfef2f71293350-20210716
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1024879271; Fri, 16 Jul 2021 01:09:00 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 01:08:58 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 16:08:56 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Jul 2021 16:08:57 +0800
Message-ID: <c2ec591b256f934547994ba76cdccb8ef47fb705.camel@mediatek.com>
Subject: Re: [PATCH v2 6/9] soc: mediatek: add mtk-mutex support for mt8195
 vdosys0
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, <chunkuang.hu@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Fri, 16 Jul 2021 16:08:56 +0800
In-Reply-To: <aa0a598d-574f-427a-b9b9-a24364202779@gmail.com>
References: <20210710113819.5170-1-jason-jh.lin@mediatek.com>
 <20210710113819.5170-7-jason-jh.lin@mediatek.com>
 <aa0a598d-574f-427a-b9b9-a24364202779@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_010904_566630_62997E4E 
X-CRM114-Status: GOOD (  17.49  )
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

On Wed, 2021-07-14 at 18:04 +0200, Matthias Brugger wrote:
> 
> On 10/07/2021 13:38, jason-jh.lin wrote:
> > Add mtk-mutex support for mt8195 vdosys0.
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mtk-mutex.c | 107
> > +++++++++++++++++++++++++++++--
> >  1 file changed, 102 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mutex.c
> > b/drivers/soc/mediatek/mtk-mutex.c
> > index 2e4bcc300576..d74eb3f97f1d 100644
> > --- a/drivers/soc/mediatek/mtk-mutex.c
> > +++ b/drivers/soc/mediatek/mtk-mutex.c
> > @@ -17,6 +17,9 @@
> >  #define MT8183_MUTEX0_MOD0			0x30
> >  #define MT8183_MUTEX0_SOF0			0x2c
> >  
> > +#define MT8195_DISP_MUTEX0_MOD0			0x30
> > +#define MT8195_DISP_MUTEX0_SOF			0x2c
> > +
> >  #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 *
> > (n))
> >  #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
> >  #define DISP_REG_MUTEX_RST(n)			(0x28 + 0x20 *
> > (n))
> > @@ -67,6 +70,36 @@
> >  #define MT8173_MUTEX_MOD_DISP_PWM1		24
> >  #define MT8173_MUTEX_MOD_DISP_OD		25
> >  
> > +#define MT8195_MUTEX_MOD_DISP_OVL0		0
> > +#define MT8195_MUTEX_MOD_DISP_WDMA0		1
> > +#define MT8195_MUTEX_MOD_DISP_RDMA0		2
> > +#define MT8195_MUTEX_MOD_DISP_COLOR0		3
> > +#define MT8195_MUTEX_MOD_DISP_CCORR0		4
> > +#define MT8195_MUTEX_MOD_DISP_AAL0		5
> > +#define MT8195_MUTEX_MOD_DISP_GAMMA0		6
> > +#define MT8195_MUTEX_MOD_DISP_DITHER0		7
> > +#define MT8195_MUTEX_MOD_DISP_DSI0		8
> > +#define MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE0	9
> > +#define MT8195_MUTEX_MOD_DISP_OVL1		10
> > +#define MT8195_MUTEX_MOD_DISP_WDMA1		11
> > +#define MT8195_MUTEX_MOD_DISP_RDMA1		12
> > +#define MT8195_MUTEX_MOD_DISP_COLOR1		13
> > +#define MT8195_MUTEX_MOD_DISP_CCORR1		14
> > +#define MT8195_MUTEX_MOD_DISP_AAL1		15
> > +#define MT8195_MUTEX_MOD_DISP_GAMMA1		16
> > +#define MT8195_MUTEX_MOD_DISP_DITHER1		17
> > +#define MT8195_MUTEX_MOD_DISP_DSI1		18
> > +#define MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE1	19
> > +#define MT8195_MUTEX_MOD_DISP_VPP_MERGE		20
> > +#define MT8195_MUTEX_MOD_DISP_DP_INTF0		21
> > +#define MT8195_MUTEX_MOD_DISP_VPP1_DL_RELAY0	22
> > +#define MT8195_MUTEX_MOD_DISP_VPP1_DL_RELAY1	23
> > +#define MT8195_MUTEX_MOD_DISP_VDO1_DL_RELAY2	24
> > +#define MT8195_MUTEX_MOD_DISP_VDO0_DL_RELAY3	25
> > +#define MT8195_MUTEX_MOD_DISP_VDO0_DL_RELAY4	26
> > +#define MT8195_MUTEX_MOD_DISP_PWM0		27
> > +#define MT8195_MUTEX_MOD_DISP_PWM1		28
> > +
> >  #define MT2712_MUTEX_MOD_DISP_PWM2		10
> >  #define MT2712_MUTEX_MOD_DISP_OVL0		11
> >  #define MT2712_MUTEX_MOD_DISP_OVL1		12
> > @@ -101,11 +134,36 @@
> >  #define MT2712_MUTEX_SOF_DSI3			6
> >  #define MT8167_MUTEX_SOF_DPI0			2
> >  #define MT8167_MUTEX_SOF_DPI1			3
> > +
> >  #define MT8183_MUTEX_SOF_DSI0			1
> >  #define MT8183_MUTEX_SOF_DPI0			2
> >  
> > -#define MT8183_MUTEX_EOF_DSI0			(MT8183_MUTEX_S
> > OF_DSI0 << 6)
> > -#define MT8183_MUTEX_EOF_DPI0			(MT8183_MUTEX_S
> > OF_DPI0 << 6)
> > +#define MT8183_MUTEX_EOF_CONVERT(sof)	((sof) << 6)
> > +#define MT8183_MUTEX_EOF_DSI0 \
> > +	MT8183_MUTEX_EOF_CONVERT(MT8183_MUTEX_SOF_DSI0)
> > +#define MT8183_MUTEX_EOF_DPI0 \
> > +	MT8183_MUTEX_EOF_CONVERT(MT8183_MUTEX_SOF_DPI0)
> 
> Not needed here, please drop.
> 
> > +
> > +#define MT8195_MUTEX_SOF_DSI0			1
> > +#define MT8195_MUTEX_SOF_DSI1			2
> > +#define MT8195_MUTEX_SOF_DP_INTF0		3
> > +#define MT8195_MUTEX_SOF_DP_INTF1		4
> > +#define MT8195_MUTEX_SOF_DPI0			6 /* for
> > HDMI_TX */
> > +#define MT8195_MUTEX_SOF_DPI1			5 /* for
> > digital video out */
> > +
> > +#define MT8195_MUTEX_EOF_CONVERT(sof)	((sof) << 7)
> 
> Same here.
> 
> Regards,
> Matthias

Hi Matthias,

Ok, I will drop this at the next version.

Regards,
Jason-JH.Lin
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
