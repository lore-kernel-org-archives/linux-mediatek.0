Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0216FC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 03:36:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABF0764E27
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 03:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABF0764E27
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yhUnANwplyYDUf5Kr+SYxT+CgT/ku/pkK+akvoe42Bo=; b=ErE8yMe7KaWEI22zQN7fRxpXV+
	NxLRPrMxg5qujq5FJEccSYTf2a3GHO7S4cedEpqBofTgcVqMfyrVr3IxctjKrZwHZ0v0ri9/v7cuP
	3Qnlyt5V49Kiuz1lLW9tYDJGJRswhPS/47ptJZC3hwtst5NaOpl+YZdQqYd3kAJIejGuEhfyOI/lS
	E2GbVJJKmRLIwmECjHaAynsF8DhggisPjilBRPTN6M5CuFVjq11u9jS1jQwP3+RT2eqys+1XWl/EN
	+Qye65AIdUHF7lKI4Eq/BgEzwaJlKT6OqNe5d0fVzHvblouDQ1Ef+XgvVr5h6kSF0/mw6yATKh9cx
	LP9Oss5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6Q0n-0002jw-Lu; Mon, 01 Feb 2021 03:36:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6Q0j-0002hR-Kv; Mon, 01 Feb 2021 03:36:23 +0000
X-UUID: ed4a7657d02d4ff3a34dffd937d3c83a-20210131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=X9UJf+Dfvvey3eOlYKu/5iaho5HJZbcdIR3EG1y2gAM=; 
 b=b2wkwloe7K7YdrqgvCSes+mw5t1vQ+ZQsigdHfB0JFHljKp3UGDBtNHubOPRRdXg/p8barA0SO1ss9Ry+tPQnF3tTQ4JzS3eozTXr1Pch3tB+IWRiipolBF4LntWBUcMs0fshllFkWIOS0obB081xe9/k6sWJ5Wdw3kbQyhf2nI=;
X-UUID: ed4a7657d02d4ff3a34dffd937d3c83a-20210131
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2138651639; Sun, 31 Jan 2021 19:36:16 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 31 Jan 2021 19:36:09 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 1 Feb 2021 11:36:06 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Mon, 1 Feb 2021 11:36:05 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] Fix EoTp flag
Date: Mon, 1 Feb 2021 11:36:01 +0800
Message-ID: <20210201033603.12616-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9A769A91630558C31E795C4AC43FDD8B316D8CB066EF2D651DAB3736ADEA3FFD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_223621_816391_ACD3D4BF 
X-CRM114-Status: UNSURE (   9.39  )
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
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 bibby.hsieh@mediatek.com, ck.hu@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changes since v1:
 - Seperate the line time as single patch.

Jitao Shi (2):
  drm/mediatek: dsi: Fix EoTp flag
  drm/mediatek: dsi: fine tune the line time cause by EOTp

 drivers/gpu/drm/mediatek/mtk_dsi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
2.12.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
