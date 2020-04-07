Return-Path: <SRS0=UhTi=5X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2439C2BB54
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2020 10:34:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8E7F20644
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2020 10:34:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eqcqusVe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VPZpQME+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8E7F20644
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4VbZdwoAtgif2IBBr+6wodK69OU5+VD+nqLH4+gtl9I=; b=eqcqusVeTqqHRl
	QS4PI62rIjeAT1KCpFmoQP3aD2I5q9Td4MlQUs5jM7edQrdCByZizR29XX4GS1PdmWfLsMhNH/suq
	ISoAy1t5ttEbEaYnawXmkBtwaLgfPB+qE+pforJgXH0sanfvk1CKfNjLDufVxXcGIRNL9gK1tr+s+
	OHLQyyKr6N43nmbzy9cwxK+lTjJM5GycK+SQc+/mReAO0F7sL02Lev8CVrV1gdyWCYZtC8wHFf2WV
	Fqj+XIkMPzdoyfyvq0bXI9r32rB5CymrsAeubxscy0P7wBg9UjKyDGJC4KvsOsOdHc2aCNgMlmHSr
	1qfBjmUty/cszQFM5tPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLlYi-0003XI-Ao; Tue, 07 Apr 2020 10:34:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLlYg-0003Wy-KZ
 for linux-mediatek@lists.infradead.org; Tue, 07 Apr 2020 10:34:19 +0000
X-UUID: f1d35f1aa1664620b99235568bfad211-20200407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=U7bhIT1JvAQHWLnbsB2M7H1M+ae2V6iijCaIfBoNAEI=; 
 b=VPZpQME+GTmR+o8NmnOaoeoannp+cAsN1CWIFe43j0oBMGM8H17PaMutDRSstli8iDH8WyjzI2hy+GjwXvV0DB3QPJcOTO5NtYHgmvqmYR1IrNkGKeEufxzWRNKOrIst1SWNU6b1MC40onhnMNiLfzPIacsnAkiS/P4o7lHSSbI=;
X-UUID: f1d35f1aa1664620b99235568bfad211-20200407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <light.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 115155091; Tue, 07 Apr 2020 02:34:20 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Apr 2020 03:34:08 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Apr 2020 18:33:55 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 7 Apr 2020 18:33:54 +0800
From: <light.hsieh@mediatek.com>
To: <linus.walleij@linaro.org>
Subject: [PATCH v1 1/1] pinctrl: mediatek: remove shadow variable declaration
Date: Tue, 7 Apr 2020 18:33:52 +0800
Message-ID: <1586255632-27528-1-git-send-email-light.hsieh@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: CF188DB9EF1EEE1AE35E194814B165E19A38ABD073617FEDCC722BBA2F3A0F3A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200407_033418_677483_DEA96A30 
X-CRM114-Status: UNSURE (   6.90  )
X-CRM114-Notice: Please train this message.
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
Cc: sean.wang@kernel.org, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, Light Hsieh <light.hsieh@mediatek.com>,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Light Hsieh <light.hsieh@mediatek.com>

Remove shadow declaration of variable 'pullup' in mtk_pinconf_get()

Signed-off-by: Light Hsieh <light.hsieh@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 83bf29c..8f75115 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -164,8 +164,6 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 	case MTK_PIN_CONFIG_PU_ADV:
 	case MTK_PIN_CONFIG_PD_ADV:
 		if (hw->soc->adv_pull_get) {
-			bool pullup;
-
 			pullup = param == MTK_PIN_CONFIG_PU_ADV;
 			err = hw->soc->adv_pull_get(hw, desc, pullup, &ret);
 		} else
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
