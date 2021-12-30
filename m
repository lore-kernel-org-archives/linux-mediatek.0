Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE86C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Dec 2021 06:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PwHBRG7tXVUQt2YOXZO39vFFhwfxiuLMA7cLZpdPiIg=; b=b6Oog6lBxOeIts
	AHykXioP7bTeudPCCKqp86sVuB5n9BT++t7FLs49RbvMfu0K3+mRK2OWmc7v7UV0by2ADbIzNanhW
	qOMsFQXq4qG0tjGJpGiDR+S5gO45JCEG3j3FKfBSvzwgz4t+fKHtZMSVvU9yPkb4XXfe9jBHf1E6i
	8BpbMOH7SbBPgdjbVgGeCvjawoV/lGzXZSVqxuDD4Ye/pCqk6uXDxQre/djN4ay2pGZKgeMJ1zyje
	0NhOtTnrvFUfs9htfvVh4YCmRD5rStTdtWQx7FSHkjtrRxEm9JElkhNYq6xQLuKCkNsJDozuITGCe
	OK6n+UH/QIgtyb4/XRMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2pMf-003ieA-3C; Thu, 30 Dec 2021 06:56:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2pMQ-003icy-A5; Thu, 30 Dec 2021 06:56:29 +0000
X-UUID: 2d32e02c30af454fafeee93fc37eafa1-20211229
X-UUID: 2d32e02c30af454fafeee93fc37eafa1-20211229
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1752187694; Wed, 29 Dec 2021 23:56:21 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Dec 2021 22:56:20 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 30 Dec 2021 14:56:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 30 Dec 2021 14:56:18 +0800
From: <miles.chen@mediatek.com>
To: <matthias.bgg@gmail.com>
CC: <airlied@linux.ie>, <chunkuang.hu@kernel.org>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <miles.chen@mediatek.com>, <p.zabel@pengutronix.de>
Subject: Re: [PATCH] drm/mediatek: Fix unused-but-set variable warning
Date: Thu, 30 Dec 2021 14:56:16 +0800
Message-ID: <20211230065616.32308-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <fcaccc97-e920-08eb-ec3f-4c4b11ea8925@gmail.com>
References: <fcaccc97-e920-08eb-ec3f-4c4b11ea8925@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_225626_376282_FD3822A9 
X-CRM114-Status: GOOD (  12.01  )
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

>You are right, in both cases the bit is set, but the funciton does not do what 
>it is supposed to do.
>Will just clear all bits of the mask.
>
>Without your patch, we will just write the val to the register and don't care 
>what the register value was before that.
>
>We should somehow mention that in the commit message, as it's not only about a 
>not used variable, it actually has an influence on the value we write(-back) to 
>the register.

thanks for the comment. I understand that it's not only about a not used
variable. I talked to our hdmi experts and they think mtk_cec_mask() should
write tmp instead of write val to the register.

I will mention this in the commit message and submit next patch.

Happy new year!

Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
