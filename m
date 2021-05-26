Return-Path: <SRS0=P9v4=KV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81838C4707F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 02:53:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47DB261436
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 02:53:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47DB261436
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l8CulrU5Q52GCeWHH9uCmlWwPFkbq1t6wZugcj7CfHg=; b=eNzxFs9nfMBd7z
	0dtldbujjzxWRy4McJtRINvzRzTKc9xY9DlKkWdnOa1v9jbjex8v6Uny9p7uTNoe/7DpM1gPe/zmv
	uP+H5/FASEzkIHHdsos8gfqtR32SgIDulqR9srr+zStanmBL06UEmPerSjzY7HLvPwp5cdbLjjTRC
	A+JTHNoKNvZMcwyqKB41wXEM6yYSsr9aT8aALTL+lAtAbOQaDll7XRc7dE2s4MacmTfkcNKH5YCrg
	atI+BE1y65TVMA5VlbavrTjZTdyciFat1IeQYxzTvx2WR9CRv9wX4YwQUWQKqXYzWTaTTP5gWE+kv
	qv10UCM4EmyYWIvJvkkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lljfU-00AHqg-Oj; Wed, 26 May 2021 02:53:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lljfR-00AHoI-4M; Wed, 26 May 2021 02:53:10 +0000
X-UUID: 2b4574a5ba5145cf983aecbfa9e2cbcb-20210525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=IvFU8sypoO0O+6V1djFvlbjXmsP30PJ1htIWDI3JDUM=; 
 b=chK1UaGfG72a789g1KHfC7FOaVZq8FW4lr/ZtIbArV3gH69/XxiHCe5mmkF1r1VE4Ou6BfwfeRJ1NzL8JktFUhDMf2Pr4zcgF66q9ntYCRGqjIMfAP4pBTCACSQpkfQh8LLj1aaSSHzejfrKX0O+mhwHxzz6nx7Op6ZW1mo+LGU=;
X-UUID: 2b4574a5ba5145cf983aecbfa9e2cbcb-20210525
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1547658571; Tue, 25 May 2021 19:53:05 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 19:48:56 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 May 2021 10:48:48 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 26 May 2021 10:48:47 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <srv_heupstream@mediatek.com>, <yingjoe.chen@mediatek.com>,
 <eddie.huang@mediatek.com>, <cawa.cheng@mediatek.com>,
 <bibby.hsieh@mediatek.com>, <ck.hu@mediatek.com>, <stonea168@163.com>,
 <huijuan.xie@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>
Subject: [PATCH v3 0/3] Convert the mtk_disp driver to aotmic API
Date: Wed, 26 May 2021 10:48:43 +0800
Message-ID: <20210526024846.120838-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: AF1C3E7F7F6D04596C943736E5FC00377541B87B3AB3C359648FC3C94E07AAF62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_195309_198936_03C59299 
X-CRM114-Status: UNSURE (   7.19  )
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

Change since v2:
 - Change commit messages to remove the clock operations for atomic APIs.
 - Rebase to v5.13 rc1

Changes since v1:
 - Seperate clock operation as single patch.
 - Seperate apply() as single patch.
 - Seperate get_state() operation as single patch.

Jitao Shi (3):
  pwm: mtk_disp: remove the clock operations for atomic APIs.
  pwm: mtk_disp: implement atomic API .apply()
  pwm: mtk_disp: implement atomic API .get_state()

 drivers/pwm/pwm-mtk-disp.c | 177 +++++++++++++++++++++----------------
 1 file changed, 102 insertions(+), 75 deletions(-)

-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
