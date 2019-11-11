Return-Path: <SRS0=Eirx=ZD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B7CEC43331
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2019 01:38:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C76D206DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2019 01:38:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Fbi0PupP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="H2kOYdgm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C76D206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=15tKGV3/9HBtpf0chhTt90qC8ySEB6Oiv5t+JbDtfvQ=; b=Fbi0PupPWs/nan
	P1xEeNirg4NE0ZzTLZcKcA3P/RqsW67s6C8KI792tG/5dyR8tHdOFVNlK3vidNz3zyC3A4oTv04Ik
	fHFPckfaDIvK5DT+4O0SzoKY/MdhaXhYGrOn7FfiLEiShmOo0S++qFPiuECTxk9quQZnAQageOhWw
	0KE/m2rQN1ciYTCw0DeDMP6JE1b+LJ33X8Okro50+7diYu2ACUw18dffVVWTJqqVrNje3y2SaMacl
	DwyCbIo1+daeeX0qymBL7p/2ErISMxg0w133M43T4tCA95esjxYYBbuG79yonWz35kMJrS72qJUQF
	8VbOI2bNajrpIgcapu0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iTyew-0005ed-4J; Mon, 11 Nov 2019 01:38:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iTyet-0005eB-J3
 for linux-mediatek@lists.infradead.org; Mon, 11 Nov 2019 01:38:25 +0000
X-UUID: 1ebbcf91fce34e47b2e34fb50e3f484c-20191110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Z1wjq7BHhl5SV+QLzicEwl3bPZzqKzQNsT/nQQRovnA=; 
 b=H2kOYdgmddEgEmhVK8OJuYxmkhntvDqO33X07Yr090JIKxhVJLq5ydkP8QIAOQrgPY6BiGQ4rZEClKjqC3PUBKwzTpyFnCZaJh0aLAQ8hLelT7eprkSEQQV3A9xmAz5ZFoeagPLTVYgDpCtuDEawvYRok8/YXmJHpyANal3q4+E=;
X-UUID: 1ebbcf91fce34e47b2e34fb50e3f484c-20191110
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <eason.yen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 774135182; Sun, 10 Nov 2019 17:38:19 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 10 Nov 2019 17:38:15 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 11 Nov 2019 09:38:13 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 11 Nov 2019 09:38:13 +0800
Message-ID: <1573436294.12075.14.camel@mtkswgap22>
Subject: Re: [PATCH v1 1/1] soc: mediatek: add SMC fid table for SIP interface
From: Eason Yen <eason.yen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Mon, 11 Nov 2019 09:38:14 +0800
In-Reply-To: <44bddcd1-457d-bde6-791f-def248f787b3@gmail.com>
References: <1572247749-4276-1-git-send-email-eason.yen@mediatek.com>
 <1572247749-4276-2-git-send-email-eason.yen@mediatek.com>
 <44bddcd1-457d-bde6-791f-def248f787b3@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5EC5FA932747D3C8A9D88655AFE52152DB7FEFFFF18BD072339340E490D9EE922000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191110_173823_636061_B3D5E7C5 
X-CRM114-Status: GOOD (  14.50  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com,
 Eason.Yen@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear Matthias,

    This header files is used for mtk proprietary drivers.    
    MTK SIP call clients should define MTK_SIP_XXX with specific control
ID on this header file.
   
    mtk sip call example (sound card driver):
    arm_smccc_smc(MTK_SIP_AUDIO_CONTROL,  /* specific MTK_SIP_XXX id */
                  MTK_AUDIO_SMC_OP_DRAM_REQUEST,
                  0, 0, 0, 0, 0, 0, &res);

    Because sound card driver(mt6779) is still reviewing internally,
    I just upstream this header file first.

    I will remove change-id entry and upstream again soon.
    Thanks for your reviewing.


Regards,
Eason


On Sun, 2019-11-10 at 21:18 +0100, Matthias Brugger wrote:
> 
> On 28/10/2019 08:29, Eason Yen wrote:
> > 1. Add a header file to provide SIP interface to ATF
> > 2. Add AUDIO SMC fid
> > 
> > Change-Id: I218e9f571cea079268a5414725a81e9b35702e33
> 
> Please delete Change-Id entry.
> Apart from that, I don't really get the reason for this patch. Which driver is
> supposed to use this header file?
> 
> Please provide more background information.
> 
> Regards,
> Matthias
> 
> > Signed-off-by: Eason Yen <eason.yen@mediatek.com>
> > ---
> >  include/linux/soc/mediatek/mtk_sip_svc.h |   28 ++++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >  create mode 100644 include/linux/soc/mediatek/mtk_sip_svc.h
> > 
> > diff --git a/include/linux/soc/mediatek/mtk_sip_svc.h b/include/linux/soc/mediatek/mtk_sip_svc.h
> > new file mode 100644
> > index 0000000..00ee0f4
> > --- /dev/null
> > +++ b/include/linux/soc/mediatek/mtk_sip_svc.h
> > @@ -0,0 +1,28 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2019 MediaTek Inc.
> > + */
> > +
> > +#ifndef __MTK_SIP_SVC_H__
> > +#define __MTK_SIP_SVC_H__
> > +
> > +#include <linux/kernel.h>
> > +
> > +/* Error Code */
> > +#define SIP_SVC_E_SUCCESS               0
> > +#define SIP_SVC_E_NOT_SUPPORTED         -1
> > +#define SIP_SVC_E_INVALID_PARAMS        -2
> > +#define SIP_SVC_E_INVALID_Range         -3
> > +#define SIP_SVC_E_PERMISSION_DENY       -4
> > +
> > +#ifdef CONFIG_ARM64
> > +#define MTK_SIP_SMC_AARCH_BIT			0x40000000
> > +#else
> > +#define MTK_SIP_SMC_AARCH_BIT			0x00000000
> > +#endif
> > +
> > +/* AUDIO related SMC call */
> > +#define MTK_SIP_AUDIO_CONTROL \
> > +	(0x82000517 | MTK_SIP_SMC_AARCH_BIT)
> > +#endif
> > +/* __MTK_SIP_SVC_H__ */
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
