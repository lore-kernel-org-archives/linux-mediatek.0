Return-Path: <SRS0=uiJf=BH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D46CC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 05:56:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 097D02065E
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 05:56:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sifgVmxf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 097D02065E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lygU3ck+uk5dGXiIZWm0FkW47nTBWPCzU6igXfX1Y7c=; b=sifgVmxfXerRJ240vToWxSB3Wh
	CdWFhFEPC4f4cv1PAGdFUi1p3FjtwCwKGqyMUt4tbcQ9cMKqYYzDhNC1D9cNN1RkqJG4jtC2+78Ho
	XBsMwrqTPfeQEXEvrFXBRPSNAS5piZpw97v7vVlNuzxImfWs1byO4hfdpOa+IrmB7fzIRCqlxeZa0
	Kduu+Vhdfx9nltYvubWbl/1DDnVqRz1KoG0NYY9O93RvYi2p3NNQyk9Ro+mHzWKu/uAs+9CDO6C59
	dKxYMLH3f3BWOP0582mPfVun3WNh97I7851VxUixY1OvbgcuXFwEZ6Q9kJEXUjijBuhAONm59NZvo
	qoceJk8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0Iae-00069g-QV; Tue, 28 Jul 2020 05:55:52 +0000
Received: from [2601:1c0:6280:3f0::19c2]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0Iab-00069P-OD; Tue, 28 Jul 2020 05:55:50 +0000
To: LKML <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH -mmotm] pinctrl: mediatek: fix build for tristate changes
Message-ID: <d15827a3-d0c8-e231-9f61-8507b3d7be3a@infradead.org>
Date: Mon, 27 Jul 2020 22:55:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Randy Dunlap <rdunlap@infradead.org>

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
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c |    1 +
 1 file changed, 1 insertion(+)

--- mmotm-2020-0727-1818.orig/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ mmotm-2020-0727-1818/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -264,6 +264,7 @@ bool mtk_is_virt_gpio(struct mtk_pinctrl
 
 	return virt_gpio;
 }
+EXPORT_SYMBOL_GPL(mtk_is_virt_gpio);
 
 static int mtk_xt_get_gpio_n(void *data, unsigned long eint_n,
 			     unsigned int *gpio_n,


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
