Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 755ACC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 04:26:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41D0E207BB
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 04:26:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AxBKTeW6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QdycRie8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41D0E207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6mj/UCtqZUqatlYGNtpsGYo3KE4S52M46R6BBDSLrGc=; b=AxBKTeW6r/zOawotfo5KzceG5
	f1Kj9fAw2Dv4X85TFLaGxXwSgW/r8QekiKbT1nFLetlU7cZq469U3e65Di1ygttwLpOYU/ircP+95
	v5Vu3ZEUd7U/NZGAynrk+S+ZPQO/gbv1K7uU0qLKQFJMVmzMS9pR/vduyZGpyAu/4PpIun9MF6ibs
	w/CNxFvOPmGfZyRLd8zrVDqQRahZO5HRKe1dzGv5qszcg2AtfzxGmqDTihSuQamH8zPbbFOFw2LuN
	1+j+yAbQ/5n/nB5ydPkWot7aSj8qd9MUirsRv6pOe24AdNXVBKIEyd7jzxHykcRfBv6bxaYxV3zUQ
	Zufd0yoeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy6Ka-0001Q0-SC; Wed, 22 Jul 2020 04:26:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy6KX-0001P3-Nk; Wed, 22 Jul 2020 04:26:10 +0000
X-UUID: 9d7979c1835d4a0cb97fbbd5abaa23f6-20200721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=GWVeRuD9gmf3IP/ZtIdGMOtS8Q7B5XBZWmUJ38WKNSo=; 
 b=QdycRie8uOFBxVVTNFzc3xxme+2QFN/eSv60cy7c+ilznZ453tMfy+EDT73Syb5YsHFIaB/hcE2wy99dHsKl3W9z8BDXI8d+WULis4IHHwwkgDmGKpPMYTN+KMeXGhG5iPingvi1u95ntDpIUuS3ZUfJYwQpSYetL1RG29G0j7w=;
X-UUID: 9d7979c1835d4a0cb97fbbd5abaa23f6-20200721
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 223920380; Tue, 21 Jul 2020 20:26:08 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 21:26:02 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 12:26:01 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jul 2020 12:26:01 +0800
Message-ID: <1595391961.8456.1.camel@mtksdaap41>
Subject: Re: [PATCH 3/3] soc: mediatek: pwrap: add pwrap driver for
 MT6873/8192 SoCs
From: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 22 Jul 2020 12:26:01 +0800
In-Reply-To: <e80b2e38-1324-a038-5647-6f595381ba47@gmail.com>
References: <1594720432-19586-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1594720432-19586-4-git-send-email-hsin-hsiung.wang@mediatek.com>
 <e80b2e38-1324-a038-5647-6f595381ba47@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_002609_927575_3CBC4623 
X-CRM114-Status: GOOD (  17.42  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Argus Lin <argus.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Wed, 2020-07-22 at 00:51 +0200, Matthias Brugger wrote:
> 
> On 14/07/2020 11:53, Hsin-Hsiung Wang wrote:
> > MT6873/8192 are highly integrated SoCs and use PMIC_MT6359 for
> > power management. This patch adds pwrap master driver to
> > access PMIC_MT6359.
> > 
> > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > ---
> >   drivers/soc/mediatek/mtk-pmic-wrap.c | 98 ++++++++++++++++++++++++++++++++----
> >   1 file changed, 87 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> > index c897205..6e7f796f 100644
> > --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> > +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> > @@ -24,11 +24,13 @@
> >   #define PWRAP_MT8135_BRIDGE_WDT_SRC_EN		0x54
> >   
> >   /* macro for wrapper status */
> > +#define PWRAP_GET_SWINF_2_FSM(x)	(((x) >> 1) & 0x00000007)
> >   #define PWRAP_GET_WACS_RDATA(x)		(((x) >> 0) & 0x0000ffff)
> >   #define PWRAP_GET_WACS_FSM(x)		(((x) >> 16) & 0x00000007)
> >   #define PWRAP_GET_WACS_REQ(x)		(((x) >> 19) & 0x00000001)
> >   #define PWRAP_STATE_SYNC_IDLE0		BIT(20)
> >   #define PWRAP_STATE_INIT_DONE0		BIT(21)
> > +#define PWRAP_STATE_INIT_DONE1		BIT(15)
> >   
> >   /* macro for WACS FSM */
> >   #define PWRAP_WACS_FSM_IDLE		0x00
> > @@ -74,6 +76,7 @@
> >   #define PWRAP_CAP_DCM		BIT(2)
> >   #define PWRAP_CAP_INT1_EN	BIT(3)
> >   #define PWRAP_CAP_WDT_SRC1	BIT(4)
> > +#define PWRAP_CAP_ARB		BIT(5)
> 
> This commit should be two patches (at least). One adding PWRAP_CAP_ARB and then 
> another one adding MT6873 support.
> 
> Regards,
> Matthias
> 

Thanks for the comment. I will update it in next patch.

> >   
> >   /* defines for slave device wrapper registers */
> >   enum dew_regs {

[Delete]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
