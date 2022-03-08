Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9311C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 05:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ij2F7bRncWpKweJTdXcTfNDGXPoRw1jRUD2UwFZDpDI=; b=xizaiLgtI5ViJe
	XlhvGXEnf0MG3vl/nFnIVz6u1bT1ATt0M94D3XHz+1DVPu871W21j7BUNd/E2s1CGRqTDxQeupWRn
	+XQ1DBwx/CYjY0+D+GN/IlNbhqOsv6zkFwRAwUVqMGcv1X2VZosp4IBniCmBcHE3isrVwTLUTuj/s
	KK0phKiqN660wzOR63FIdr0s9yfG4/FXvu1CCvLJIL6poaxlqHOKtr5mZ43U0xuKLbCtt5e1UkjVZ
	RvQHeO8Wu6xCtCOyTcxOi9eLxwdx5QV1pR5/i2Z7QWhcOQeT64y6UfhVTj1+BEqaNMePia9ApnLpM
	hdy8hGWIkBjuXrQIsdNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRSWg-002hFi-KI; Tue, 08 Mar 2022 05:36:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRSWT-002hE8-8H; Tue, 08 Mar 2022 05:36:39 +0000
X-UUID: 050489aba0ee43a3bc1e83fe2599843e-20220307
X-UUID: 050489aba0ee43a3bc1e83fe2599843e-20220307
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1863637855; Mon, 07 Mar 2022 22:36:28 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Mar 2022 21:36:26 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 8 Mar 2022 13:36:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Mar 2022 13:36:25 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <linmq006@gmail.com>
CC: <amitk@kernel.org>, <daniel.lezcano@linaro.org>, <henry.yen@mediatek.com>, 
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-pm@vger.kernel.org>,
 <matthias.bgg@gmail.com>, <rafael@kernel.org>, <rui.zhang@intel.com>
Subject: Re: [PATCH] thermal: mediatek: Fix some leaks in mtk_thermal_probe
Date: Tue, 8 Mar 2022 13:36:25 +0800
Message-ID: <20220308053625.21359-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220307113438.21338-1-linmq006@gmail.com>
References: <20220307113438.21338-1-linmq006@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_213637_318664_29C7A3F1 
X-CRM114-Status: UNSURE (   6.89  )
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

Hi Miaoqian,

> If an error occurs after a successful 'of_iomap()' call, it must be undone
> by a corresponding 'iounmap()' call
> 
> Fixes: 89945047b166 ("thermal: mediatek: Add tsensor support for V2 thermal system")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
>

Thanks for fixing this.

Reviewed-by: Miles Chen <miles.chen@mediatek.com>


Thanks,
Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
