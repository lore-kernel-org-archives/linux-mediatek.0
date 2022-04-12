Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E574C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 12:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JmpUBVRqb0sf74b3e/r6bjNCtZUvHI3YU5Z21p+y85A=; b=l9iJxWJFd9rjcH
	zLQZtv7xbXVODG8yBIphl3gfeWioFhbTixlSXz8X5/1uBVfcYV8Y/k7Qs60QKcn5l2bhuZXYY59dJ
	lV6fQL89GtSlrsKjGJxaJtt/jFKESi8SQkIZdiw5KVbajqTIu89WCiriFNa/rprHucykqVLX4CB5L
	9Y1WFz+lgrS49y+YvAKGGab9YhFy/NKA4fK6cfmr/UBWZs86PdNlBtsvYmPuJx6PKQ1nLTfiMMKid
	G1HGveG4gRf/hPHiKoi30+t1wDbWs7EDHw7kFIJml0OLX79d8+FrscpYkBXyUA1jeRP+A77C6AGZ9
	qeWVc51iCzN5a3uadJvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neFuZ-00EGsH-HP; Tue, 12 Apr 2022 12:46:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neFmY-00ECzB-6R; Tue, 12 Apr 2022 12:38:07 +0000
X-UUID: 9febd611ab044f5c87e12ed47f273af2-20220412
X-UUID: 9febd611ab044f5c87e12ed47f273af2-20220412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 788744699; Tue, 12 Apr 2022 05:38:04 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 05:28:03 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 12 Apr 2022 20:27:55 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Apr 2022 20:27:55 +0800
Message-ID: <29a0d0e1f9ad2f14be56410e5a9e123d6a35dfe3.camel@mediatek.com>
Subject: Re: [PATCH] spi: spi-mtk-nor: initialize spi controller after resume
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Mark Brown
 <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Ikjoon
 Jang" <ikjn@chromium.org>
CC: <linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 12 Apr 2022 20:27:55 +0800
In-Reply-To: <20220412115743.22641-1-allen-kh.cheng@mediatek.com>
References: <20220412115743.22641-1-allen-kh.cheng@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_053806_281264_508A399A 
X-CRM114-Status: GOOD (  10.00  )
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

On Tue, 2022-04-12 at 19:57 +0800, Allen-KH Cheng wrote:
> After system resumes, the registers of nor controller are
> initialized with default values. The nor controller will
> not function properly.
> 
> To handle both issues above, we add mtk_nor_init() in
> mtk_nor_resume after pm_runtime_force_resume().
> 
> Fixes: 3bfd9103c7af ("spi: spi-mtk-nor: Add power management
> support")
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---

Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
