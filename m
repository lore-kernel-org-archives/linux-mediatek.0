Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C03DC2D0CE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 08:13:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 713C62071E
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 08:13:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q1Ei7Kft";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Tiokwoks"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 713C62071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CBkV7J7ONSuXneg7uPSC72wxREP44tDV6y53qNj1+iw=; b=q1Ei7KftL82Fub
	b1b1XsasCtQuzXGZ1t0D7XCiM3+FWsobg7uqkc/5+L5qfCU5+gOGm5UqybctuJob9IoSppVNzGdgM
	2rrejZ/bpISHIPvO7rMArOCz1uSyMwiHI2H8+/0sTZv3SL0LMgR8OqZmj4GiScmTDOtoedy1+Hg6/
	aE+dmSveU2G/u1/Fdhwbi9w6m1ENUFsdYHxH18xQlZuVq8pbr3dy4bixru7lzleW333TZ8HIu9whx
	M5WrZTAH0+H1dWhSYlHXa6cedINBM9CdXxEfwrZaCraV/Ay/PojL/c4G7bJR4gmsS1zgk3SJ6giEB
	JOTyBm64nKI0BkdsrTwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilqAo-0001FD-0w; Mon, 30 Dec 2019 08:13:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilqAU-0000pS-6i; Mon, 30 Dec 2019 08:12:51 +0000
X-UUID: 5b7d5cc815d84d329fdfe1f6b59254c6-20191230
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=/YZexolleNxYdLH94VTF+1Nzdu/S0YyPkZtHTfyc+dQ=; 
 b=TiokwoksPadoLE5VKDI52uCdSK6yF7KBGiedCnGXvcBk6xdf+v//lFx/PQHHRzZ3rN7Zm+3iQZu0N3Kri88OlSoQujiFuPed0gDZr+51sZKC7xasJG/8gmDuD37QbYOIB1olO3VQOKocu5roSoViRVJWMeuePTEcYdedoM0gPlI=;
X-UUID: 5b7d5cc815d84d329fdfe1f6b59254c6-20191230
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 728192037; Mon, 30 Dec 2019 00:12:43 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Dec 2019 00:12:47 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 30 Dec 2019 16:11:44 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 30 Dec 2019 16:12:01 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>,
 <pedrom.sousa@synopsys.com>, <jejb@linux.ibm.com>, <matthias.bgg@gmail.com>,
 <bvanassche@acm.org>, <subhashj@codeaurora.org>
Subject: [PATCH v1 0/2] scsi: ufs: fix device power mode during PM flow
Date: Mon, 30 Dec 2019 16:12:24 +0800
Message-ID: <1577693546-7598-1-git-send-email-stanley.chu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 89A27EB953EE34CD40C8ACDDBFE67EEEE8EF9490F2E37448EE8116C824FD8D7E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_001250_308998_BE102A48 
X-CRM114-Status: UNSURE (   3.89  )
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
Cc: andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

This series fixes a device power mode issue in suspend and resume flow.

Stanley Chu (2):
  scsi: ufs: set device as default active power mode during
    initialization only
  scsi: ufs: remove link_startup_again flow in ufshcd_link_startup

 drivers/scsi/ufs/ufshcd.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
