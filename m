Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AE79C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 06:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BsAWljIBWOBhw8U91Rn+ZkSsmr9M70AvDBrW2YDyzYk=; b=myvjNzUQlxM0MM
	A0MVcfW93n9k6gi2jr6D/Hefbnx4EVXdzNrqfBXVvvIkUmrJg4cetjhQ0NsdedfCZnpnWkvL1Z5lQ
	leCG+Sgn1Txiyr+iDeM9UxROwecbGpRVQOs9EXitdAkOah+0xThmt2PBAYyvZc7fX5oCCT7Z86yQu
	v8Byc9zPSZwURDqiifldFhcJsHAA1Ezghhc/ZTQK5w9kwNwrpweNcGw2HFYytb7m+ffcWRd6NcnOS
	NjOco8iUM1CT68S4OqcdCovGd6y+PiPjJIK5hDTmmsSH/lWw89s9++wYsYZc0dt9J7PNd/3ssFWQW
	RxjoHeXeuj9KtAOR5qzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncLXO-009f2x-FE; Thu, 07 Apr 2022 06:22:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncLXL-009f1B-Tz; Thu, 07 Apr 2022 06:22:33 +0000
X-UUID: 27dbcb46a2cd425387f1569023ccb91f-20220406
X-UUID: 27dbcb46a2cd425387f1569023ccb91f-20220406
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 555697663; Wed, 06 Apr 2022 23:22:26 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 23:22:24 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 14:22:22 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 Apr 2022 14:22:22 +0800
Message-ID: <c9a54f1c9350d63489a0f85443f5623fe5d7fe1d.camel@mediatek.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: mediatek: Correct disp_aal
 binding for MT8183
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 <chunkuang.hu@kernel.org>, <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <yongqiang.niu@mediatek.com>, <jason-jh.lin@mediatek.com>,
 <nancy.lin@mediatek.com>, <allen-kh.cheng@mediatek.com>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 7 Apr 2022 14:22:22 +0800
In-Reply-To: <397e30c2-18c3-93d6-16f5-b113be77f51a@linaro.org>
References: <20220406094654.29722-1-rex-bc.chen@mediatek.com>
 <20220406094654.29722-2-rex-bc.chen@mediatek.com>
 <397e30c2-18c3-93d6-16f5-b113be77f51a@linaro.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_232232_048567_EB97B692 
X-CRM114-Status: GOOD (  15.94  )
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

On Wed, 2022-04-06 at 16:44 +0200, Krzysztof Kozlowski wrote:
> On 06/04/2022 11:46, Rex-BC Chen wrote:
> > The driver data of MT8183 and MT8173 are different.
> > The value of has_gamma for MT8173 is true while the value of MT8183
> > is
> > false. Therefore, the compatible of disp_aal for MT8183 is not
> > suitable
> > for the compatible for MT8173.
> 
> Just because one feature is not supported, it does not mean they are
> incompatible, which you claim in the patch below. Are you sure they
> are
> really incompatible and MT8173 fallback cannot be used?
> 
> 
> Best regards,
> Krzysztof

Hello Krzysztof,

Thanks for your review.

The difference of disp_aal for each MediaTek SoCs is "has_gamma".
And we only control this variable for different MediaTek SoCs.

The value of has_gamma for MT8173 is true.
The value of has_gamma for MT8183 is false. (Moreover, the driver data
is null for MT8183)

From this situation, I think it's not compatible between MT8173 and
MT8183.

reference: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/mediatek/mtk_disp_aal.c?h=v5.18-rc1#n153

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
