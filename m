Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80046C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Dec 2021 03:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nAUGLBnGBQpO+Wa1vHsMJbbnnrqfqEOsWwsSHRwvcZc=; b=NEWL2lhn6p2iW5
	zB0j/OlDcuPDVbHdEDLwXH5+ZtXlcTggNUYPVAOVG1WEyuYc5zcYbbRPd4ciGoqlKdDdsL9jGueoQ
	Mr8rrWofmW1m/+lE4S+1wPAzzvuuqS1dVlSMVmWN+oi+4ngQX2vamxPf0KwHTDg4hJdPepAcbBGFh
	gIzesAJLW0OCzxb/pXuJ+NgAm7ZWlB+sX22Zri1j8WmoDSaEGtW8aQvMHFR4ckyahl3GRFtc/P9Qs
	cITW48YdAfVr3DNnZSR+3831YZBkb5AcBW8pMPvTG/ZwtTMm4oAzUHoaBaK0ILBgBs2qblj0FOIEU
	7Ok+7+6M4UNU1ZC4OHZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2PGV-002B7z-QI; Wed, 29 Dec 2021 03:04:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2PGI-002B6o-QF; Wed, 29 Dec 2021 03:04:24 +0000
X-UUID: 769d81eb2db34f00b3adfd45cc8e4556-20211228
X-UUID: 769d81eb2db34f00b3adfd45cc8e4556-20211228
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 432802661; Tue, 28 Dec 2021 20:04:15 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Dec 2021 19:04:14 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 29 Dec 2021 11:04:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 29 Dec 2021 11:04:06 +0800
From: <miles.chen@mediatek.com>
To: <matthias.bgg@gmail.com>
CC: <airlied@linux.ie>, <chunkuang.hu@kernel.org>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <miles.chen@mediatek.com>, <p.zabel@pengutronix.de>
Subject: Re: [PATCH] drm/mediatek: Fix unused-but-set variable warning
Date: Wed, 29 Dec 2021 11:04:03 +0800
Message-ID: <20211229030405.4338-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <fcaccc97-e920-08eb-ec3f-4c4b11ea8925@gmail.com>
References: <fcaccc97-e920-08eb-ec3f-4c4b11ea8925@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_190422_901863_F9C65448 
X-CRM114-Status: UNSURE (   9.83  )
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

Hi,

On 28/12/2021 10:25, Miles Chen wrote:
> Fix unused-but-set variable warning:
>> drivers/gpu/drm/mediatek/mtk_cec.c:85:6: warning: variable 'tmp' set but not used [-Wunused-but-set-variable]
>> 
>
>Actually we ignore the value passed to mtk_cec_mask. In case of
>mtk_cec_mask(cec, CEC_CKGEN, 0 | CEC_32K_PDN, PDN | CEC_32K_PDN);
>
>
>We are not setting CEC_32K_PDN. I wonder which side effect will it have to set 
>that bit.

I am confused about "not setting CEC_32K_PDN" part,
in case mtk_cec_mask(cec, CEC_CKGEN, 0 | CEC_32K_PDN, PDN | CEC_32K_PDN);
CEC_32K_PDN (BIT(19)) is set.

for exmaple:
CEC_32K_PDN is BIT(19)
PDN is BIT(16)
say tmp = 0xffffffff;

mask = PDN | CEC_32K_PDN;
val = 0 | CEC_32K_PDN;

tmp = fff6ffff, mask = 90000
val = 80000, tmp = fffeffff

u32 tmp = readl(cec->regs + offset) & ~mask; // tmp = fff6ffff
tmp |= val & mask; // tmp = fffeffff
writel(val, cec->regs + offset); // val = 80000, tmp = fffeffff

in both val and tmp case, CEC_32K_PDN is set.

>Anyway, if it's the right thing to do, we should add:
>
>Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")

I will add the Fixes tag, thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
