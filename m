Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DA5C433EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Nov 2021 14:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rsmdcmRw5NONBwuO/GoxJoZBcvyrtg5zvMaMP72tUCA=; b=cXgnTfQSsyGpLY
	BQ8cfJCJMMsv5wqm4aLFWIs+jO83KtVtb7fdqgxkRMswGajGv+du2UyiU69nkXI8QAoPn9yhaCjuJ
	zm6YFXu9nJ+UfMNACP2i0sLMULkOGlsr22HKPWOTTprF7P8xNnJXY4bY31E4TBpq8VFo2t6weJzjY
	Xna7WUnj/TNjmjZQ4y1aqexnE6Cejwhh6GkGywEd3RthIgLELeF7ZsanHJwqxDbv2c3Cw+BUsdCLK
	mKR+S5fCKHK+/6o9iXxXIIo/sFD6m/JvrVjv99604wUCBq4Tl6eetq0y+GyILTD9XLmO8pt19nH8i
	T8QTIyh9FMiH5bbDsyNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrLVr-00Fzs4-QM; Sun, 28 Nov 2021 14:50:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrLVd-00Fzpi-90; Sun, 28 Nov 2021 14:50:31 +0000
X-UUID: d81b4d5992974e199ad687eaed6109fb-20211128
X-UUID: d81b4d5992974e199ad687eaed6109fb-20211128
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1516114428; Sun, 28 Nov 2021 07:50:25 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 28 Nov 2021 06:50:23 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 28 Nov 2021 22:50:22 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 28 Nov 2021 22:50:22 +0800
Message-ID: <1807a4c28ee57aa9c61ccecbc87dae749ae14808.camel@mediatek.com>
Subject: Re: [PATCH 1/3] mialbox: move cmdq suspend,resume and remove after
 cmdq_mbox_flush
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, "Jassi
 Brar" <jassisinghbrar@gmail.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <hsinyi@chromium.org>, <fshao@chromium.org>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Sun, 28 Nov 2021 22:50:22 +0800
In-Reply-To: <YZXqxaVANvrv53t3@google.com>
References: <20211117064158.27451-1-jason-jh.lin@mediatek.com>
 <20211117064158.27451-2-jason-jh.lin@mediatek.com>
 <YZXqxaVANvrv53t3@google.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_065029_348764_37D1578F 
X-CRM114-Status: GOOD (  10.28  )
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

Hi Tzung-Bi,

Thanks for the reviews.

On Thu, 2021-11-18 at 13:55 +0800, Tzung-Bi Shih wrote:
> On Wed, Nov 17, 2021 at 02:41:56PM +0800, jason-jh.lin wrote:
> 
> Typo in the commit title "mialbox: move cmdq suspend,resume and
> remove after cmdq_mbox_flush".
> 
> s/mialbox/mailbox/
-- 
I'll fix this typo at the next version.

Regards,
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
