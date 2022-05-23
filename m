Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17C6C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 11:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=as3SxQe4ThI2eGIzo0jXdB483wR3pXKvIhsJUUexgYk=; b=3DDcI0RKan6wAD
	3yrT6C1GtUgieuv0w0H7C/HL0A7B4CaeAdBKakkMc24ecIzKnooVGkUThDfOKes8qERt4g3I8vRkP
	5druvQ7r3tfBf0391SAYyBSNi4upsEOlXfE+wHgLZ/jyVQQAmwH1DiGrrO5ey7Z/Cq5XhXTangP5Q
	IxpLZa4NOpBW4QK71iKhPwpLl5MqjrTpwElxozQddN0CIpw9BsZv70bATyTHHddpfVvHBu3QPy9M6
	kzaAebDjvoj2vgi/QmE7nZ4MSdbcwlBDxUHTTkIyN+gzBdhVW1Sucxr3ld32DD57mkQKHLvYyP/Kc
	RVtiNZ98YPIBxjAlmRgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt64K-003coA-Af; Mon, 23 May 2022 11:17:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt5Cn-003CPv-B9; Mon, 23 May 2022 10:22:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=7gm0bALxYQt5DI/dpgAeuZUEfODhvgWMbBqOl52pjnw=; b=CIwPMzDL+fytJDzxIDhkNPbk8V
 Se6reR/R37FE9jD7ym1gJ0hd5bTBMUrhVLbKG5+RI8cGlfHy1VzDTsBr7fOWTnCZ24TW24tLzD7mj
 O559cv1f4RjQ6De2p3ER7TY7LCe4G7EP1zP+2c8xsO5l88QL/KhmHVk8qu48MuuJmLSFYmZSXrJhf
 g8EveDtYvFRJWsMbdKcYqD5d8AfHI0NEbN7AAREW7IrtX2OTeP/1fDV+yhmWRl64h+emtvM9oI/bR
 GPE9b4dFrxUH410tRTTThxjTB0I/eDEJynokJk1VNy+5rqXCGp7XPbchQFUr/WNzZLCFBKep9lYgv
 dfdNQ/yA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt5Cc-0011HM-Ek; Mon, 23 May 2022 10:22:23 +0000
X-UUID: 4be6900e60974dfab1c7623a5dbae6d2-20220523
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:448a48c4-eb1b-4ecf-82ec-8d7711bfeb98, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:baaa39e3-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:0,File:ni
 l,QS:0,BEC:nil
X-UUID: 4be6900e60974dfab1c7623a5dbae6d2-20220523
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 585723272; Mon, 23 May 2022 03:21:56 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 03:15:18 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 May 2022 18:15:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 23 May 2022 18:15:16 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <hch@lst.de>
CC: <bjorn.andersson@linaro.org>, <iommu@lists.linux-foundation.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-remoteproc@vger.kernel.org>,
 <m.szyprowski@samsung.com>, <mark-pk.tsai@mediatek.com>,
 <mathieu.poirier@linaro.org>, <matthias.bgg@gmail.com>,
 <robin.murphy@arm.com>, <yj.chiang@mediatek.com>
Subject: Re: [PATCH 0/2] dma-mapping,
 remoteproc: Fix dma_mem leak after rproc_shutdown
Date: Mon, 23 May 2022 18:15:16 +0800
Message-ID: <20220523101516.29934-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220423174650.GA29219@lst.de>
References: <20220423174650.GA29219@lst.de>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_112218_958098_E1E532E8 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
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

> Sigh.  In theory drivers should never declare coherent memory like
> this, and there has been some work to fix remoteproc in that regard.
>
> But I guess until that is merged we'll need somthing like this fix.

Hi,

Thanks for your comment.
As I didn't see other fix of this issue, should we use this patch
before the remoteproc work you mentioned is merged?


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
