Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A267BC433E5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:28:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F21820674
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:28:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="buYdiMAJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Yhmw7gs5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F21820674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RVuw31rWKJ9cg3mi96RBFi435AvZ2SAQi3WSblf4gMQ=; b=buYdiMAJyzNDfkWN0wE0D0at2
	L+Yr3IlvRIgOJMkcU3Bg7xZifm4NEKXVRi/3/xjaZ40qwMlZ/C9na1zx7HlnqZcotJNZXRJRd+ojQ
	Ltka6tAExQ6jKjS1iOAPIGssovXwCB1xOW9bRsUkxSPooAfBbIWh/V9/xnRdYwDJnDIyOAHqmPfWI
	jP3mCx/CN5KZbzukweq+421Q/9WGamjwbPlYjpNwqyHJEUB+GuMHMmPKVp7v5Kgev4AN6YxLs+mcm
	TDI2ztU7g4jc8q/74VE81B2/6O0fpwRx13+urRFDzBbApkOLGEYpmjhzq5iWhxvq9TuwK/0kHDPBd
	/tcdYJTfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jurxE-00040n-SH; Mon, 13 Jul 2020 06:28:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jurxA-0003zO-Rv; Mon, 13 Jul 2020 06:28:41 +0000
X-UUID: a6790a6ac5e24d31bf7b4edf3470c2db-20200712
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=QfeRWHQq4XdcyfDNLBwwIxyfLvbwyPNcaQ8tJPeM160=; 
 b=Yhmw7gs5g6WFb7V1GqVTZNN5tw+eFAAP3jdcRjPDw+V+V4s3Nxt10ORg650WVMrjFUC4j3a+NN+7nr9K2ThSQsT4LmxzUfTgpFfr7IlPBgH7GDgkRKRezDaBikDpbfLS9Wi4sKUT90cjvfupdk/n8SBSHWbY66ya7VvnHsf0Ci0=;
X-UUID: a6790a6ac5e24d31bf7b4edf3470c2db-20200712
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1781947637; Sun, 12 Jul 2020 22:28:32 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Jul 2020 23:28:30 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 13 Jul 2020 14:28:26 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Jul 2020 14:28:26 +0800
Message-ID: <1594621661.16172.21.camel@mhfsdcap03>
Subject: Re: [SPAM]Re: [PATCH 01/21] dt-binding: memory: mediatek: Add a
 common larb-port header file
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Mon, 13 Jul 2020 14:27:41 +0800
In-Reply-To: <9e21288c-07da-88b0-2dbb-bd9a2a4d529b@gmail.com>
References: <20200711064846.16007-1-yong.wu@mediatek.com>
 <20200711064846.16007-2-yong.wu@mediatek.com>
 <9e21288c-07da-88b0-2dbb-bd9a2a4d529b@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: CA0024F3D95459D89A6864F1E7953035DAC9D46C9A57907AE612B8F9051897052000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_022841_123523_F71B1FD5 
X-CRM114-Status: GOOD (  18.72  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
 srv_heupstream@mediatek.com, Tomasz Figa <tfiga@google.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 chao.hao@mediatek.com, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com, Robin
 Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 2020-07-12 at 20:06 +0200, Matthias Brugger wrote:
> 
> On 11/07/2020 08:48, Yong Wu wrote:
> > Put all the macros about smi larb/port togethers, this is a preparing
> > patch for extending LARB_NR and adding new dom-id support.
> > 
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>

[...]

> > diff --git a/include/dt-bindings/memory/mtk-smi-larb-port.h b/include/dt-bindings/memory/mtk-smi-larb-port.h
> > new file mode 100644
> > index 000000000000..2ec7fe5ce4e9
> > --- /dev/null
> > +++ b/include/dt-bindings/memory/mtk-smi-larb-port.h
> > @@ -0,0 +1,15 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2020 MediaTek Inc.
> > + * Author: Yong Wu <yong.wu@mediatek.com>
> > + */
> > +#ifndef __DTS_MTK_IOMMU_PORT_H_
> > +#define __DTS_MTK_IOMMU_PORT_H_
> > +
> > +#define MTK_LARB_NR_MAX			16
> 
> include/soc/mediatek/smi.h has the very same define.
> Should smi.h include this file?

If smi.h include this file, it also is ok. then these two
files(mtk_iommu.h and mtk_smi.c) don't need include this.

the MTK_LARB_NR_MAX only is used in mtk_iommu.h and mtk_smi.c directly,
thus I use that two files include this file currently. locally I think
it may be helpful for readable.

is this ok?

> 
> Regards,
> Matthias
> 
> > +
> > +#define MTK_M4U_ID(larb, port)		(((larb) << 5) | (port))
> > +#define MTK_M4U_TO_LARB(id)		(((id) >> 5) & 0xf)
> > +#define MTK_M4U_TO_PORT(id)		((id) & 0x1f)
> > +
> > +#endif
> > 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
