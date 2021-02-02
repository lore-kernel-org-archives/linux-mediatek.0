Return-Path: <SRS0=G+wW=HE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E99FC433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 02:04:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E16264EE3
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Feb 2021 02:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E16264EE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=H+APB/pJOnr4fzmRgMiBbD05FrCZf23+ETZBdrJUjR0=; b=b8sY0ZGnPDbwYGJ3GJdyXkB/p
	A3bpqrg2QBnv2rBSSDswEyzC+FWsy/03dyLxIUxLwZfMAGBKPaed3A3Kn8NjKhsJTj/RX9A8wQDt5
	uXuR2crwfbU2NBi8d9a+yHFGR40d/BWD/OqI1PxyF34SRrUdkZg2znwE94LIUATeV03yT+rjzbHkX
	V14WZ5pd7dl+mo7iqqeNJG5DWbK5jSoTVbESBLY4pwCjJOl+M1HFoAemjfi5vdPmG/2LJLLZbydM8
	eXD/O5iLXkIGdCldwsQTGpnBuHXVCYl8o2o5f+dnjO4iSlyHzPdycRnBpmhcm+fDcKj9JRLhQlR4E
	58xrvreDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6l3T-0003ln-Pp; Tue, 02 Feb 2021 02:04:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6l3P-0003kj-1r; Tue, 02 Feb 2021 02:04:34 +0000
X-UUID: c012ee979c964e92af17e0954ddfed3e-20210201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ON8bHtwiT/h540EaCUWfU1QVeXktvhFd1tW5kcxrM6c=; 
 b=EOtrlmUNixp6Y0KWMUbajrsMU+IDe8lsvmqliSqhcS98eT0+viLA8hZ1bFL1xSVCIG/qmZnxqMmC0a259eMquMNonRo3huAjhxl2W9j0WdgXa/xyqq9fakTYzWQAyHwVvMyMg+trq3/9KjVn1DFgrTRKEHeV5sqV0Lkp6/6/DI8=;
X-UUID: c012ee979c964e92af17e0954ddfed3e-20210201
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 144588906; Mon, 01 Feb 2021 18:04:28 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Feb 2021 18:04:20 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 2 Feb 2021 10:03:46 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Feb 2021 10:03:45 +0800
Message-ID: <1612231425.2524.12.camel@mhfsdcap03>
Subject: Re: [PATCH v6 00/33] MT8192 IOMMU support
From: Yong Wu <yong.wu@mediatek.com>
To: Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>, "Krzysztof
 Kozlowski" <krzk@kernel.org>
Date: Tue, 2 Feb 2021 10:03:45 +0800
In-Reply-To: <20210201145422.GA15263@willie-the-truck>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
 <20210201145422.GA15263@willie-the-truck>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A18C1C8918DEE0A0D7B50AFE8695F7167F4D310B1A3B5790C079BBD49E7336992000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_210431_355341_D6319707 
X-CRM114-Status: GOOD (  18.53  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org, Nicolas
 Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz
 Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Krzysztof
 Kozlowski <krzk@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 anan.sun@mediatek.com, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2021-02-01 at 14:54 +0000, Will Deacon wrote:
> On Mon, Jan 11, 2021 at 07:18:41PM +0800, Yong Wu wrote:
> > This patch mainly adds support for mt8192 Multimedia IOMMU and SMI.
> > 
> > mt8192 also is MTK IOMMU gen2 which uses ARM Short-Descriptor translation
> > table format. The M4U-SMI HW diagram is as below:
> > 
> >                           EMI
> >                            |
> >                           M4U
> >                            |
> >                       ------------
> >                        SMI Common
> >                       ------------
> >                            |
> >   +-------+------+------+----------------------+-------+
> >   |       |      |      |       ......         |       |
> >   |       |      |      |                      |       |
> > larb0   larb1  larb2  larb4     ......      larb19   larb20
> > disp0   disp1   mdp    vdec                   IPE      IPE
> > 
> > All the connections are HW fixed, SW can NOT adjust it.
> > 
> > Comparing with the preview SoC, this patchset mainly adds two new functions:
> > a) add iova 34 bits support.
> > b) add multi domains support since several HW has the special iova
> > region requirement.
> > 
> > change note:
> > v6:a) base on v5.11-rc1. and tlb v4:
> >       https://lore.kernel.org/linux-mediatek/20210107122909.16317-1-yong.wu@mediatek.com/T/#t 
> 
> I've queued this up apart from patches 6 and 7.

Thanks very much for the applying. I'd like to show there is a little
conflict with a smi change[1] in /include/soc/mediatek/smi.h.

This is the detailed conflict:

--- a/include/soc/mediatek/smi.h
+++ b/include/soc/mediatek/smi.h
@@ -9,7 +9,7 @@
 #include <linux/bitops.h>
 #include <linux/device.h>
 
-#ifdef CONFIG_MTK_SMI
+#if IS_ENABLED(CONFIG_MTK_SMI)   <---The smi patch change here.
 
 #define MTK_LARB_NR_MAX   16  <---This iommu patchset delete this line.


This code is simple. Please feel free to tell me how to do this if this
is not convenient to merge.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git/commit/?h=for-next&id=50fc8d9232cdc64b9e9d1b9488452f153de52b69

> 
> Thanks,
> 
> Will

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
