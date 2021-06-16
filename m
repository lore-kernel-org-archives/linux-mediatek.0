Return-Path: <SRS0=hSNv=LK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D6F2C48BE6
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 08:52:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B5F660FD9
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 08:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B5F660FD9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V/m6WJQOn0r1KyIbAIz7t219ghxjfa2UhxknAzLwCRU=; b=Yub9GzBgYf0jdX
	VBd8ARbDJg2STmorJQcEWgsKkPRAvHXTjxcaWgugGdhACggHxrCu8Fpkx6rJr9AbkLTyafA+Qgd9D
	Xu+F5Ng4S+Ldw3uZf1DDsj9G/2qXUk32wh84el/1OU3nippo9L57xqN2SuifKZTmyMi3RmxnTZw6v
	1RtQ3pjDOCkX3SS35RxHoW+hzbWPHG5MatjteCNfH9P9GFXhsJyHAj90fPRc8kS8U0dRD5EoLUhx3
	ZvQtKmYTYBxiOveCxtdARAnQpEW/QSAQvmycftwNmQkmyR6PzRFetJBxuQZFvQhl8HdAroL6beueW
	M44RIVVk/zH1T8G/ghgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltRHz-005SIQ-Fj; Wed, 16 Jun 2021 08:52:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltRHv-005SF8-Kw; Wed, 16 Jun 2021 08:52:45 +0000
X-UUID: feb62daad9494c88b817717d87bc688a-20210616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=89AJn0IAlV0QFt1muodvQr1LlsipCvmqgM8FfeSKFo4=; 
 b=G5RX5ILgFIU4tnHEZv/NRdf1Vav//6PuDN2p/buTuMvNp1Jvc+eGv9R1LF5bvq/KecmFfh2sV0d7ec7qAZ68m8SQ3YamiYD6R2mSbG+WziTlCKmCjyJ/WnX51io/83Y+0sCjqKT6uOX5LNvM1xq7GKOAyo2UvTOw69MvyE2nkw8=;
X-UUID: feb62daad9494c88b817717d87bc688a-20210616
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 855543238; Wed, 16 Jun 2021 01:52:37 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 01:52:35 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 16 Jun 2021 16:52:28 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 16 Jun 2021 16:52:27 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Lee Jones
 <lee.jones@linaro.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <yingjoe.chen@mediatek.com>,
 <eddie.huang@mediatek.com>, <cawa.cheng@mediatek.com>,
 <bibby.hsieh@mediatek.com>, <ck.hu@mediatek.com>, <stonea168@163.com>,
 <huijuan.xie@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v5 0/3] fix the clks on/off mismatch issue and switch
 pwm-mtk-disp to atomic APIs
Date: Wed, 16 Jun 2021 16:52:21 +0800
Message-ID: <20210616085224.157318-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7ACAEB33A9F51A9BFEB13C9C1D213D03A7BF4FA0D1029D0D63114E51221AA3112000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_015244_073724_0B991EFA 
X-CRM114-Status: UNSURE (   8.14  )
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

Change since v4:
 - Squash the commit "move the commit to clock enabled" to "adjust the clocks to avoid them mismatch".
 - Drop the useless comment about MT2701.
 - Reenable the clks "mm" and "main" in .enable().
 - Fix typo.
 - Seperate get_state() operation as single patch.

Change since v3:
 - Seperate the clock sequence as single patch.
 - Fixup the reg commit when clocks sequence changed.
 - Merge the apply and get_state as single patch.

Change since v2:
 - Change commit messages to remove the clock operations for atomic APIs.
 - Rebase to v5.13 rc1.

Changes since v1:
 - Seperate clock operation as single patch.
 - Seperate apply() as single patch.
 - Seperate get_state() operation as single patch.

Jitao Shi (3):
  pwm: mtk-disp: adjust the clocks to avoid them mismatch
  pwm: mtk_disp: implement atomic API .apply()
  pwm: mtk_disp: implement atomic API .get_state()

 drivers/pwm/pwm-mtk-disp.c | 168 +++++++++++++++++++------------------
 1 file changed, 85 insertions(+), 83 deletions(-)

-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
