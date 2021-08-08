Return-Path: <SRS0=9HTA=M7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A0FC4338F
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 13:25:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34F0960EE7
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Aug 2021 13:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 34F0960EE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uclqDGx/428dwg6aINVBxfr3Nx4ZAwHOAMIbvWOxLOk=; b=YC6ushcY5BYvQI
	BliGJLWcXmCG/qkcRh6SEW2Uypq4xFGFftb9D6aQfuD2REMj8z4FdadfmXwh3gZJRpK/8vy6LYuhg
	sW12YR/TNpQNokjRg5PL+fahVTDqi99TJ5//4Y1HcLO/9k2c8bHb4Ih/FtOyieVGGuGIU1g+SJ13L
	F7QnmyuY0SY7GTAnXYQncqMXPtUQT59Ko+Wi2bV/eXPG1dtxber6B6rlqeYPAIAcDKcuOxHU7sCdf
	pEcTfW2wCYlVYuLOsxFBJEf23fwqtKOYt31+wnC4Rg7uXghEFknS5LZQxDc4tITnknehoAwh8Cjbt
	jfk6YuQN+EpiGA49+mFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCinJ-00FssU-Ko; Sun, 08 Aug 2021 13:24:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCinE-00Fsqg-M3; Sun, 08 Aug 2021 13:24:47 +0000
X-UUID: c2269d08da0c46a5af7325967e07b9fd-20210808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=DH+JvxcpFmH/JD3x/VcfBcOYr5jsLwTN47dk/7b+Smg=; 
 b=N4Upw8vBZ1qlD1PTiV5CBmyKQ/NVhn+x00L3zlYJjQKY/XrtqDikz48WeRT2VQwL34Is3xxlSmaH+3+N4nulvYt4dVj9xSDuckJm7nvCXxkV8gKGFgI4VPyD/IuUrCTZUo1LnQk9dgeVrVO6bHBF+0ZrzGfGzRoUtkSQQfep3r0=;
X-UUID: c2269d08da0c46a5af7325967e07b9fd-20210808
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 775847400; Sun, 08 Aug 2021 06:24:42 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 8 Aug 2021 06:24:41 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sun, 8 Aug 2021 21:24:36 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sun, 8 Aug 2021 21:24:35 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Lee Jones
 <lee.jones@linaro.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <yingjoe.chen@mediatek.com>,
 <eddie.huang@mediatek.com>, <ck.hu@mediatek.com>, <stonea168@163.com>,
 <huijuan.xie@mediatek.com>, <shuijing.li@mediatek.com>, Jitao Shi
 <jitao.shi@mediatek.com>
Subject: [PATCH v7 0/5] fix the clks on/off mismatch issue and switch
 pwm-mtk-disp to atomic APIs
Date: Sun, 8 Aug 2021 21:24:28 +0800
Message-ID: <20210808132433.66037-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: C68C7A9E77DD9526444DEE733F4D592E879711FEE47D07414BBC1577EDA3ECF02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210808_062444_777025_C60B3747 
X-CRM114-Status: UNSURE (   7.75  )
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

Changes since v6:
 - fix commit msg of "pwm: mtk_disp: fix force reg to working reg".
   Expain the reg access only when mm and main clock on.

Changes since v5:
 - fix overflow.
 - Seperate the reg shadow as a single patch.

Changes since v4:
 - Squash the commit "move the commit to clock enabled" to "adjust the clocks to avoid them mismatch".
 - Drop the useless comment about MT2701.
 - Reenable the clks "mm" and "main" in .enable().
 - Fix typo.
 - Seperate get_state() operation as single patch.

Changes since v3:
 - Seperate the clock sequence as single patch.
 - Fixup the reg commit when clocks sequence changed.
 - Merge the apply and get_state as single patch.

Changes since v2:
 - Change commit messages to remove the clock operations for atomic APIs.
 - Rebase to v5.13 rc1.

Changes since v1:
 - Seperate clock operation as single patch.
 - Seperate apply() as single patch.
 - Seperate get_state() operation as single patch.

Jitao Shi (5):
  pwm: mtk-disp: adjust the clocks to avoid them mismatch
  pwm: mtk_disp: fix force reg to working reg.
  pwm: mtk_disp: implement atomic API .apply()
  pwm: mtk_disp: fix overflow in period and duty calcalation
  pwm: mtk_disp: implement atomic API .get_state()

 drivers/pwm/pwm-mtk-disp.c | 172 ++++++++++++++++++++-----------------
 1 file changed, 92 insertions(+), 80 deletions(-)

-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
