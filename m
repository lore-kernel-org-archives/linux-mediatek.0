Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F36C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Jan 2022 23:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EX7qZB5ff4U3PyAsyDfLrkvorJJ0foR02kxRPVXGovE=; b=JGuNO0Pgf3V4hc
	mAlKAkmvZsyS8Z+70PuMp0+VkJHIR7X77d2rw/2tX0xs9gkcHs0vgmp5QMXO04Hs0gGo54YIw37DT
	Aq5L7GaJvlcI8rVtPHt+CRjJ2EvPjcIrS84Cq2ZLmdoiaZwYAo2ztN6za4SHxbJPnNumAdJYPMNM8
	WCdVkVRDaiijPtCvf7om6Bb/+W5aIyBsVfzPwAepDW8b3Pwku3Sjwc/YQg61sl3vgpelgmWNaL28K
	V7mRFyzXIMOBCI83TLEDI4u5P674OkKR4jD5B52R0JQxWDE9B4OphCaW7m7zG4uDF+CdANwxL6N0w
	ICLS7ofnanEQ7Vjp0Rmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4AZA-008EC9-QE; Sun, 02 Jan 2022 23:47:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4AYw-008EAs-TZ; Sun, 02 Jan 2022 23:46:57 +0000
X-UUID: 6114f70182ff445d8e3b8e9d5a0f3e26-20220102
X-UUID: 6114f70182ff445d8e3b8e9d5a0f3e26-20220102
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1682304121; Sun, 02 Jan 2022 16:46:49 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 2 Jan 2022 15:46:48 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 3 Jan 2022 07:46:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 3 Jan 2022 07:46:34 +0800
From: <miles.chen@mediatek.com>
To: <matthias.bgg@gmail.com>, Nathan Chancellor <nathan@kernel.org>, "Nick
 Desaulniers" <ndesaulniers@google.com>, Jie Qiu <jie.qiu@mediatek.com>,
 "Junzhi Zhao" <junzhi.zhao@mediatek.com>, Philipp Zabel
 <p.zabel@pengutronix.de>
CC: <airlied@linux.ie>, <chunkuang.hu@kernel.org>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <miles.chen@mediatek.com>, <llvm@lists.linux.dev>
Subject: Re: [PATCH v3] drm/mediatek: Fix unused-but-set variable warning
Date: Mon, 3 Jan 2022 07:46:32 +0800
Message-ID: <20220102234633.31709-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <fcaccc97-e920-08eb-ec3f-4c4b11ea8925@gmail.com>
References: <fcaccc97-e920-08eb-ec3f-4c4b11ea8925@gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220102_154654_979579_2D14DA90 
X-CRM114-Status: UNSURE (   9.97  )
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

> I'm still not happy with the commit subject, I think it is misleading. Clang 
> only helped to find the bug, but the we are fixing something else, that's not 
> just a clang warning. But I don't want to nit-pick too much so:
> 
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

thanks. I think you are right.
I will change the subject to "drm/mediatek: Fix mtk_cec_mask()", remove the 
clang part and submit patch v4.

e.g,
"""
drm/mediatek: Fix mtk_cec_mask()

In current implementation, mtk_cec_mask() writes val into target register
and ignores the mask. After talking to our hdmi experts, mtk_cec_mask()
should read a register, clean only mask bits, and update (val | mask) bits
to the register.

Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")
"""

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
