Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32660C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Nov 2021 14:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q31yDtVhni/AjD+D9j4kzhLlSbVhLeGyVz6xK3TpkTM=; b=fZRSG9OzcL8F35
	A4pdzMO7nq1UBhjiO/x0Rtd6Fwf/pCjusahFDIWecPKsIiaPcZMimS3nQm4xELB8M6ArE6w5CgA9m
	qF+lOUQ67kA+aJ69nJ0AQDSLUzSLj9/59vnVMmYgfnOq3Lut+6/X2EJy2HPaDMRJ4RPn4BP8ZgkRw
	m1jM/6Jy/3EfJaOgtb80jIufhURH1LPUQixnzMCQ3147Ri211ztKB/CrLyc8nC58Bhn4WKP2PhT+a
	Yx/6pcQh3c5iEBGz4ev6+fp9zi2gKFDTR4RhdgajyEy/IEXNjRLrd2DzHQX517MqmXRQsRdyvYL0V
	uNFQo0PYa4APfBteO2Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrLYK-00G0Wr-4X; Sun, 28 Nov 2021 14:53:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrLY5-00G0T0-Bh; Sun, 28 Nov 2021 14:53:02 +0000
X-UUID: f7c2b1a61a7540a9a50c0d2159cb170e-20211128
X-UUID: f7c2b1a61a7540a9a50c0d2159cb170e-20211128
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 564354053; Sun, 28 Nov 2021 07:52:58 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 28 Nov 2021 06:52:56 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 28 Nov 2021 22:52:55 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 28 Nov 2021 22:52:55 +0800
Message-ID: <b6c55b2374e69aa198b2dd934b318767bd6e2b3e.camel@mediatek.com>
Subject: Re: Fix drm suspend and resume issue
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, "Jassi
 Brar" <jassisinghbrar@gmail.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <hsinyi@chromium.org>, <fshao@chromium.org>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>
Date: Sun, 28 Nov 2021 22:52:54 +0800
In-Reply-To: <YZXqrxinyBZkBgfq@google.com>
References: <20211117064158.27451-1-jason-jh.lin@mediatek.com>
 <YZXqrxinyBZkBgfq@google.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_065301_432100_D656BEE5 
X-CRM114-Status: UNSURE (   8.42  )
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

Hi Tzung-Bi,

Thanks, I'll fix it.

On Thu, 2021-11-18 at 13:54 +0800, Tzung-Bi Shih wrote:
> On Wed, Nov 17, 2021 at 02:41:55PM +0800, jason-jh.lin wrote:
> > Subject: [PATCH 0/3] Fix drm suspend and resume issue
> 
> You have 2 Subjects.  The first one takes precedence.
-- 
Regards,
Jason-JH Lin <jason-jh.lin@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
