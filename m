Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33721C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 11:33:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA129204EA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 11:33:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c8M9mhwu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="N+Gw5DKy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA129204EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lReX9vMFLJZAzRWfXKDElw2ocbBC9xuiZyKeQds6278=; b=c8M9mhwufSKOU+fGjMLbNXCHRp
	e6Bhhanlc+b9FXuy2aWPI3TxaBrfiTBKnnE2tyuWlSn8+APPiAr3jqZnhbpRg7gc0MdOCLmx3c34M
	ITrT7f+fjauZXGqajewwJ3TFrBUKJlqGAA87wulSPR3UIutkAKkUUioQe0IjJj6iGo1qS6YFITTm5
	mTxXoH3jszPzOAU+nYS+kKlM/EXrAXwG1oM26bnhrH8FDjLFSL/RG43PG6z53AzQqdwt1DCR2n2ro
	skqLXD7UpBFq9p2oJ5MYJ8pk1XWZ/QPhAapjrjquWQFItwhh+8mVx/qt/ajLYnVe8I+yprXgIJ8oB
	EWG7G4AA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8iov-0004za-Bi; Thu, 20 Aug 2020 11:33:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8ioM-0004eZ-Va; Thu, 20 Aug 2020 11:32:52 +0000
X-UUID: b47a84182a0a46638d252f5f21749113-20200820
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=S1Y+0IiFS8nO4Trq+5CEEIC6sfUAEGt90ibukYT0b9E=; 
 b=N+Gw5DKyYyYi/rHM7z1mPZ+FAXdAECxotRwjN7xoieUe+dvu68WydOsSrL6BnExbIg8rWNqBQkMhLlKOSvGDCg+J9M/8ETRrTjL5irTmZ25gGbkhWcNjYKRQ+jcwhJxST2GrfNseL38/DT7D3m5O70YZbDglQsEt9I0aYXOIkgg=;
X-UUID: b47a84182a0a46638d252f5f21749113-20200820
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1044966861; Thu, 20 Aug 2020 03:32:40 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 04:22:37 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 19:22:27 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 20 Aug 2020 19:22:27 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2] pinctrl: mediatek: check mtk_is_virt_gpio input parameter
Date: Thu, 20 Aug 2020 19:22:25 +0800
Message-ID: <1597922546-29633-1-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: F88F058F9D588338A2C62533E12951333599251915843B08FD4ABEB0C93057CF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_073251_253594_F4762B87 
X-CRM114-Status: GOOD (  12.43  )
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
Cc: CC Hwang <cc.hwang@mediatek.com>, sin_jieyang <sin_jieyang@mediatek.com>,
 Hanks Chen <hanks.chen@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

check mtk_is_virt_gpio input parameter,
virtual gpio need to support eint mode.

add error handler for the ko case
to fix this boot fail:
pc : mtk_is_virt_gpio+0x20/0x38 [pinctrl_mtk_common_v2]
lr : mtk_gpio_get_direction+0x44/0xb0 [pinctrl_paris]

Fixes: edd546465002 ("pinctrl: mediatek: avoid virtual gpio trying to set reg")
Singed-off-by: Jie Yang <sin_jieyang@mediatek.com>
Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>

---
Changes since v1:
- update Singed-off-by
- align with pinctrl/mediatek/pinctrl-mtk-mt*.h 

---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index c53e2c391e32..a485d79f51a1 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -259,6 +259,10 @@ bool mtk_is_virt_gpio(struct mtk_pinctrl *hw, unsigned int gpio_n)
 
 	desc = (const struct mtk_pin_desc *)&hw->soc->pins[gpio_n];
 
+	/* if the GPIO is not supported for eint mode */
+	if (desc->eint.eint_m == NO_EINT_SUPPORT)
+		return virt_gpio;
+
 	if (desc->funcs && !desc->funcs[desc->eint.eint_m].name)
 		virt_gpio = true;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
