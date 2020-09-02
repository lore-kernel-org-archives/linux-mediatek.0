Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C02C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 06:52:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32BD22067C
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 06:52:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JVDmxV1L";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fEcZ1Nch"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32BD22067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/FkmRs1DLbDJ25oOOnDhmsqtcFTd6xBlJ1ZRm9Vnhqs=; b=JVDmxV1LIH7PhJgZ+16bwuNfc
	BfG/4QGUOeSIKA9LzdyxpSvaT0LCI8WVH7HSmWS3CP8pIz0La5tAzvaQLv3mUTcKmN7UzglRx3rO0
	uD38v/mkCyJZ+73i2awIxhn6g7AFmYSMm3wo7f+FxHPEn4Db136H0dg3HEZmdNZUqJ3ZxNTn7befS
	VbS7K1o5OJL+evinBXzEks3CvlFaGQKH3uur4ADMZaWsFm8M9yzttOJklOZOCwkPz5DvFalBRlHex
	9d+ASw4jInDdGypoOBI0EXKo1lvjV1J0JCvvudED44A4Dr/UBIqRMeIfN0kE36gSHPVO8UiT7QX2k
	xEL84qNnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDMcz-00042e-3R; Wed, 02 Sep 2020 06:52:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDMcw-00041c-IX; Wed, 02 Sep 2020 06:52:15 +0000
X-UUID: c9a542826eef4d25a51476a8910ff2cf-20200901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=lDVSYqSdhWvazAaxAPYnlR1bfGV0xbA4TBV5NTbHi/w=; 
 b=fEcZ1Nchul9aWpUBHS2Te9gDzlkfCxMbHyWMjJrY6K54ETWYGkMa2xSoBKLus2di7OHp1wUj8GBRdZNZkZCQ43T9pqu2avdBES3ARtBZb1DF2Y1usazBc562VjGUKnFQuOkOyFVbncBfPzM8n/BjhnZKkSJbWsMTaBPogF3sMQ0=;
X-UUID: c9a542826eef4d25a51476a8910ff2cf-20200901
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 947362206; Tue, 01 Sep 2020 22:52:08 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Sep 2020 23:52:06 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Sep 2020 14:52:04 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 2 Sep 2020 14:52:04 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <mark-pk.tsai@mediatek.com>, <robh@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: interrupt-controller: Add MStar
 interrupt controller
Date: Wed, 2 Sep 2020 14:52:04 +0800
Message-ID: <20200902065205.1971-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200902063344.1852-3-mark-pk.tsai@mediatek.com>
References: <20200902063344.1852-3-mark-pk.tsai@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_025214_736495_26C2D7B9 
X-CRM114-Status: UNSURE (   8.85  )
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
Cc: devicetree@vger.kernel.org, alix.wu@mediatek.com, jason@lakedaemon.net,
 maz@kernel.org, yj.chiang@mediatek.com, daniel@0x0f.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Hi,

I've updated the yaml and post it in the patch series v3[1].
But I still keep the vendor specific property mstar,irqs-map-range as I
mentioned in the last reply.
Please review it.

[1] https://lore.kernel.org/lkml/20200902063344.1852-3-mark-pk.tsai@mediatek.com/
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
