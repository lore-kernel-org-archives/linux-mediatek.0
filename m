Return-Path: <SRS0=EsFa=HB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76BCAC433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jan 2021 14:13:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35F7664E09
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jan 2021 14:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35F7664E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HDvFpl1XI8zXAu1GhMOAxapSC95gcmlto5A0Yl/7IbA=; b=VT56jjUd0C2x8BY0rJOIp27pDR
	F9NfFUJUrfwEBVnaCdqfI12YEPzZ7iLyNNrAQXKU/RooTGn38rACpmLRAGuEbXoQY6hc32YcOeHwN
	EUTUwPlXyhz2Dj8kQoeEVNskflbkaC6LMS2qR1JQstr3cUrOl8FithA8JcvPaaxGqF/bXIwHlydkE
	QU0bgXZu/NQgNyRolmraoe/65tsrCL+Fn9XEvd6nVEX6mCMCsa+ggAtIN4j63LZhXZ4ulVYaieW8A
	qI5r37tXjoqZyXVSyNNz1cW7IGVTpSBWCjSLtlVv3YMX6IjjcXmExtpy4K6ZlQGp8JFTAFo+azD1W
	Z1Ccr8Kg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5qzW-0002fc-Cm; Sat, 30 Jan 2021 14:12:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5qzS-0002eT-JE; Sat, 30 Jan 2021 14:12:44 +0000
X-UUID: b8ee4a5d7ec34c3186defe0cbea5af48-20210130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=0EHa8G4GCy+novOwU6OJI2yK0pPjlAP1l0rYdaET5P8=; 
 b=nDuaPGHO4GWeEuj2PdzZBdm7FNHBK3giCGoW3DGn6O5Kq0HicZ71sUMKw/P8BTPjotsM5ZAUAzHi/7VtQLqOggidoC3RdGMHDB0MlR6qojXeHbCgI8hVZ1tAL4221JTls8GMkv76HzdskX3YxQk1hobuwbCBGaWrzx1irXDHNQU=;
X-UUID: b8ee4a5d7ec34c3186defe0cbea5af48-20210130
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 634109457; Sat, 30 Jan 2021 06:12:34 -0800
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 30 Jan 2021 06:12:32 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 30 Jan 2021 22:12:29 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS32.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Sat, 30 Jan 2021 22:12:29 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH v2 0/3] Convert the mtk_disp driver to aotmic API
Date: Sat, 30 Jan 2021 22:12:23 +0800
Message-ID: <20210130141226.25357-1-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.12.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: ACFC5FED0B4CBE8DE67FFFBAE3EE08092F9D118AD2DF692C187DF2B2441CBB4A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210130_091243_480356_BA4607CE 
X-CRM114-Status: UNSURE (   7.17  )
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
Cc: linux-pwm@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel@vger.kernel.org, cawa.cheng@mediatek.com,
 linux-mediatek@lists.infradead.org, bibby.hsieh@mediatek.com,
 ck.hu@mediatek.com, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changes since v1:
 - Seperate clock operation as single patch.
 - Seperate apply() as single patch.
 - Seperate get_state() operation as single patch.

Jitao Shi (3):
  pwm: mtk_disp: clear the clock operations
  pwm: mtk_disp: convert the driver to atomic API
  pwm: mtk_disp: implement .get_state()

 drivers/pwm/pwm-mtk-disp.c | 179 ++++++++++++++++++++++++++-------------------
 1 file changed, 104 insertions(+), 75 deletions(-)

-- 
2.12.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
