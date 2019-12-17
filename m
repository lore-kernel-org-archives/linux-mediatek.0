Return-Path: <SRS0=Z+8g=2H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E8AAC43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2019 03:09:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD00F218AC
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2019 03:09:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YkdHCfzi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eUG177Dy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD00F218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HYTo00AkftzHM1SAvuI9BGlA0jK1sOINbafHq3eAlwc=; b=YkdHCfzizoEIVq
	3bDVW0lNpd12cknihQq8zUNH0cAC9Jz+C4g7vTSmPw8oFBA9sJXWHVkqhIH7Mh95mtMdDwk/Shyl7
	d3yEiaW8GanuXRKaL/AY0cwB04qibzUol+TXrI6Z3WC6A2rBKGWPnvZZvSkLM2ggmvfUjJChVjoJj
	9e378iu3jnkxsgLm4CTqU0nxW+TMiXpBs5HVp0fXq3BeBAdKnuwbZCb2IlyGohYRVjG1zFSYLyF/q
	iw7/Y1zyPACoKl0eTrR2QxrraJu/aWIkspYDqdu0xzAyv5UsoXofolxkp3uZlbtUjzrrmTndVy+NI
	GZDP6QGOW4Y2cBAiJIPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ih3EH-0001WZ-SQ; Tue, 17 Dec 2019 03:08:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ih3E4-0001L6-F4; Tue, 17 Dec 2019 03:08:45 +0000
X-UUID: b110d3baa8cd4311a78292a1bb0979c1-20191216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=qm8ZVdor7mNZWjwtUCeGe4UHjn0nNnmELYKhUtCwThA=; 
 b=eUG177DyNscYODcWuNP6GRwHGyPmQdjjHgvyyhy2icNka+v9EpqQwF0367IEI52t5nJG+5QEXoL/0oZUGCr4MlkqDFNFkUPoeX6F2nBvzbLnQU5KQTjjsbC1I9O1Ev4S5O9ZaE7f6vPHIpcit2UhmxooONxEBDclZ0UtzEjxK9s=;
X-UUID: b110d3baa8cd4311a78292a1bb0979c1-20191216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1626123685; Mon, 16 Dec 2019 19:08:42 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Dec 2019 19:05:50 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 17 Dec 2019 11:04:57 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (172.27.4.253) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Tue, 17 Dec 2019 11:04:15 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Uwe Kleine-Koenig
 <u.kleine-koenig@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-pwm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, CK Hu <ck.hu@mediatek.com>
Subject: [PATCH v3 0/2] clocks don't disable when pwm_mtk_disp suspend
Date: Tue, 17 Dec 2019 11:04:36 +0800
Message-ID: <20191217030438.26657-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: B45B89466AD61F6801130090D3FB783A9D5C598C4FD4786A4B8EABA82491DA7C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_190844_520336_3BD618D3 
X-CRM114-Status: UNSURE (   5.30  )
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changes since to v2:
 - Edit commit msg.

Changes since to v1:
 - Edit commit msg.
 - Remove the register trigger in probe.
 - Rebase to v5.5-rc1.

Changes in patches:
 - match pwm_mtk_disp clock when suspend/resume
 - trigger pwm_mtk_disp reg working after config

Jitao Shi (2):
  pwm: fix pwm clocks not poweroff when disable pwm
  pwm: keep the trigger register after pwm setting.

 drivers/pwm/pwm-mtk-disp.c | 63 ++++++++++++--------------------------
 1 file changed, 19 insertions(+), 44 deletions(-)

-- 
2.21.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
