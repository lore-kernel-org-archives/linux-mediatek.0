Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0544DC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 18:38:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFFE560EBD
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 18:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFFE560EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8Z0n1scLbiiZERmQDYqImHTtcj39FFRYbqH7WXCLYPE=; b=0Mu4Ov2atvRdVP
	oP8CruAkBBotSFr5AOjCvn/ztecdWzcqCnF2etBScZ7CHkCFs8bwXA/4xVQ651832PtC5gFCVRhkf
	UR53nub487nvG65hVMGTxSA27vLe8xOkelYgGgSEJB7FZtYMXxxj8ZIGamtiWE7ClwkX5BaDsjI/d
	csJaktWLG+Nnwv0MGw58MVLBUvEi4cIfHV9bv4C9Tvwq7RLA6NDau5jt12O9nUXyUgLgi2EeW5gqZ
	+QO8M08KH800knj4NE2RGRJT/0kcxwQWWHvW3TSI8yFD1Q8Oei0KjJin+9l8ZC7Zci6Kw1SSGWEEH
	ckNW6mMRLRNK3W6h40uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9XOU-009xqA-7R; Fri, 30 Jul 2021 18:38:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9XOP-009xpV-AU
 for linux-mediatek@lists.infradead.org; Fri, 30 Jul 2021 18:38:00 +0000
X-UUID: 5e7f7a2b2eed49848473be4062c394ae-20210730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Nqs7lp9iIVOQx+eU0aAefbRNueBF4jW+qd4aSkncEVQ=; 
 b=Rt7ILN7zgjjJe2U1/UFLN82C6EP4G1mwMzPbaSHVHukntx90V+TCj352Lo8sL48lUNDmVcjbWX0RT5263/8fHCVBpQPyQecIpPMAbYDDto+euA9A5mQad9+KJczoIK06P1REroWsDMWRYX3v0JF4fAuBOIHEf38lTIO2p+h0lRk=;
X-UUID: 5e7f7a2b2eed49848473be4062c394ae-20210730
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rocco.yue@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1268948800; Fri, 30 Jul 2021 11:37:54 -0700
Received: from MTKMBS32N2.mediatek.inc (172.27.4.72) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Jul 2021 11:37:52 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS32N2.mediatek.inc (172.27.4.72) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 31 Jul 2021 02:37:43 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 31 Jul 2021 02:37:42 +0800
From: Rocco Yue <rocco.yue@mediatek.com>
To: <rocco.yue@gmail.com>, <linux-mediatek@lists.infradead.org>
CC: Rocco Yue <rocco.yue@mediatek.com>
Subject: test email
Date: Sat, 31 Jul 2021 02:21:17 +0800
Message-ID: <20210730182117.21941-1-rocco.yue@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 96C56E705CF50FE5D625806874D3948528AA7B9150D168D498046B3794ECBE932000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_113757_721147_FFB04C40 
X-CRM114-Status: UNSURE (   3.24  )
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

it is only a test email, please ignore.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
