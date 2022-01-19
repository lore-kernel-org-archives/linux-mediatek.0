Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F197C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 01:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1aeqQvB24Cuq07hWnzp6+czRBdP8VfzWlJYXS4tDBQ=; b=EgdxNoxeWi8Txx
	AH8WIAC8jkqLd594/5BT5m+psnPyXOmvmTR7sLgnOaeeoS4Y2qesAYRxd8nk/pmgR1xVJF57xVzqo
	V5f/BcX2K3hRopl8Dfln9GKink0mkT2nQzyKSwmmvwbiKE/Wq+xc71BLlLltgL+tyWzeNO1LAwXcb
	OnGE32u0z+/vNKpXZ1hN/mgOP4bLZ5nyO2qRk5TDzmSR+G3WllotEZ3CZB3BfSPw9TR2ro4xvn+YA
	++4WfwTOeQqGLNwAbxOwpttkX4GdrM/c86oa0agu0MkXBZJdV2W11ZI0PsdonxEUfvWppJGoNWUfP
	wuGdhmBs9ZbI6bXIbarA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA086-003Slp-PH; Wed, 19 Jan 2022 01:51:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA07e-003ScC-Px; Wed, 19 Jan 2022 01:50:52 +0000
X-UUID: db96b2605b384344ba5702f47220acdc-20220118
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=uAWQsJYR2k5m0M9faOdaZCROGq9ENtpiUXyrfdLroNo=; 
 b=OA8R9+EHBTERPGhjlt9XS5oXR0jhOVgzL7QwzzBYioBxZvWYrZFGJ8Rz0f86cYXwEY6LrG3cV7dXhJVKG+FVd7Cf1NsZS5mshLZ5HkDoGJD9JxoesQF/XE5nfNUak5Qjs1Us+av2X1yjTWXaD6rhq5VQmTtPVbEYkQrGZdddVcw=;
X-UUID: db96b2605b384344ba5702f47220acdc-20220118
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <guodong.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1407297755; Tue, 18 Jan 2022 18:50:45 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 18 Jan 2022 17:42:49 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 09:42:47 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 Jan 2022 09:42:47 +0800
Message-ID: <eca4a0c18fe75536c8276410628b9459c040dce2.camel@mediatek.com>
Subject: Re: [PATCH 2/7] pinctrl: mediatek: paris: Fix
 PIN_CONFIG_BIAS_DISABLE readback
From: Guodong Liu <guodong.liu@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Sean Wang <sean.wang@kernel.org>,
 "Linus Walleij" <linus.walleij@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, Hui Liu <hui.liu@mediatek.com>, Light
 Hsieh <light.hsieh@mediatek.com>
Date: Wed, 19 Jan 2022 09:42:46 +0800
In-Reply-To: <20220111112244.1483783-3-wenst@chromium.org>
References: <20220111112244.1483783-1-wenst@chromium.org>
 <20220111112244.1483783-3-wenst@chromium.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_175050_868222_7C381B99 
X-CRM114-Status: GOOD (  15.91  )
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

-----Original Message-----
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <
linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, 
linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
Zhiyong Tao <zhiyong.tao@mediatek.com>, Guodong Liu <
guodong.liu@mediatek.com>
Subject: [PATCH 2/7] pinctrl: mediatek: paris: Fix
PIN_CONFIG_BIAS_DISABLE readback
Date: Tue, 11 Jan 2022 19:22:39 +0800

When reading back pin bias settings, if the pin is not in a
bias-disabled state, the function should return -EINVAL.

Fix this in the mediatek-paris pinctrl library so that the read back
state is not littered with bogus a "input bias disabled" combined with
"pull up" or "pull down" states.

Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that
implements the vendor dt-bindings")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c
b/drivers/pinctrl/mediatek/pinctrl-paris.c
index f9f9110f2107..1ca598ea7ba7 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -97,8 +97,8 @@ static int mtk_pinconf_get(struct pinctrl_dev
*pctldev,
 			if (err)
 				goto out;
 			if (param == PIN_CONFIG_BIAS_DISABLE) {
-				if (ret == MTK_PUPD_SET_R1R0_00)
-					ret = MTK_DISABLE;
+				if (ret != MTK_PUPD_SET_R1R0_00)
+					err = -EINVAL;
Hi Chen-Yu

When tht API "hw->soc->bias_get_combo(hw, desc, &pullup, &ret)" is
called,
The ret vaule of may be MTK_DISABLE OR MTK_PUPD_SET_R1R0_00 or  (pullen
== 0),  All those cases are expected to be as "bias-disable".
We advices to keep original code,

+				if (ret == MTK_PUPD_SET_R1R0_00)
+	
				ret = MTK_DISABLE;
+				if (ret != MTK_DISABLE)
+					err = -EINVAL;

Thanks
 			} else if (param == PIN_CONFIG_BIAS_PULL_UP) {
 				/* When desire to get pull-up value,
return
 				 *  error if current setting is pull-
down
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
