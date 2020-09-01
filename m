Return-Path: <SRS0=VWIa=CK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A8EC433E6
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 15:39:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCD142158C
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2020 15:39:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ResHjj3e";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xWM+bxp3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCD142158C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CTAwSO3RouoDnLsAqLJvH3w6KXfQ4O/mFl3W0P8oeEw=; b=ResHjj3ep3GVbywc2h5gDPLbf
	EpeTjCZyv0lhA9B0QsBLtlBscTPJsh9FnWXWeNbXrFMue9UtcMKmBJzgRmFAm3Z5SSfIVsSFFMzmV
	1xZvLGEgj/69CqzuFvrBCXh6mSHWkdjQ6IPgERdx5hug7GPXHQuXANTVJ1FQrVyXpmE1pMohJqhSe
	7cFsMFRHRtqeKTCcB1yXtyk9O10nV4/40QLLpY5I1/mECbRcSfiK2otpstmL8GoEk+UxAUpMVkGPy
	QlH5v7xwni4KGv51sSMpNZln/at548DPxuxq1al4ZUskKXA/jigSmWWod9sCPShW0HZAVP0Zg/QJw
	w6yBg4wYw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD8NE-0007gC-9X; Tue, 01 Sep 2020 15:39:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD8NA-0007dY-1K
 for linux-mediatek@lists.infradead.org; Tue, 01 Sep 2020 15:39:02 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 99D0120866;
 Tue,  1 Sep 2020 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598974739;
 bh=VKgDTcJEVJkXNweGm1k2v0p1QcJy2uODm4rk7Clru80=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xWM+bxp3rinqYchMiOOw74VGSdkCnB+jvyD+ORpRCsVEoPmjiWch7HFZHb3SsVxfJ
 PO8b6xmoTZZYjRXiY2kqeAHJ1Kd1yFnMX0LkC66AUY68q6VM4QOXjA0DJ4H87AIDSo
 DhKkr2h6VuZoZ0wnWv/91gRnKiw//8SjqACG0tbM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5.8 075/255] pinctrl: mediatek: fix build for tristate changes
Date: Tue,  1 Sep 2020 17:08:51 +0200
Message-Id: <20200901151004.326270183@linuxfoundation.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200901151000.800754757@linuxfoundation.org>
References: <20200901151000.800754757@linuxfoundation.org>
User-Agent: quilt/0.66
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_113900_233308_5A511491 
X-CRM114-Status: GOOD (  13.02  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Sasha Levin <sashal@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, Randy Dunlap <rdunlap@infradead.org>,
 stable@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Randy Dunlap <rdunlap@infradead.org>

[ Upstream commit 047cd9a6bd8a2a73e8d92eb97a1b50c7bcd59279 ]

Export mtk_is_virt_gpio() for the case when
CONFIG_PINCTRL_MTK=y
CONFIG_PINCTRL_MTK_V2=y
CONFIG_PINCTRL_MTK_MOORE=y
CONFIG_PINCTRL_MTK_PARIS=m

to fix this build error:

ERROR: modpost: "mtk_is_virt_gpio" [drivers/pinctrl/mediatek/pinctrl-paris.ko] undefined!

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Sean Wang <sean.wang@kernel.org>
Cc: linux-mediatek@lists.infradead.org
Link: https://lore.kernel.org/r/d15827a3-d0c8-e231-9f61-8507b3d7be3a@infradead.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index c53e2c391e32b..2f3dfb56c3fa4 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -264,6 +264,7 @@ bool mtk_is_virt_gpio(struct mtk_pinctrl *hw, unsigned int gpio_n)
 
 	return virt_gpio;
 }
+EXPORT_SYMBOL_GPL(mtk_is_virt_gpio);
 
 static int mtk_xt_get_gpio_n(void *data, unsigned long eint_n,
 			     unsigned int *gpio_n,
-- 
2.25.1




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
