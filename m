Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC29C2BBD0
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 06:45:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23C5D2065E
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 06:45:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B4RPZGjo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IVsOyrvR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 23C5D2065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ut/+lCgw0m3NHs14j5SimPL7wcrtSZauX4dyZ+L0qtQ=; b=B4RPZGjoZ+ciVHvWJTOM//lTq+
	TrQKjYXThOfAitHC+Hj4OKicGkG3B8Kavw8vWUKKOjMm6akTLKItgmNPEtFpdbFh/xcgHUQCsflJw
	xesC2XKC5BQ84I6N9WiTe9HCrhtawR+SE8pNayX26Sm9cHiU+sFwbOXn+F7ZTJ92jDLqWPMLv6qMB
	yWbG0bGKhxYDrVvuww+kfFwd4yavTSfTM5uWA1QWStK5kNbSDvobbDQCy+cL78gOfSquLX1HQ1R7E
	sbt9ciBGCnXjI90wPpMnjM/khsCj6xfMLgbrcgeuBf9v2a1arsjKV/s+w/XBg2w00GdZ2XG/Ie8W1
	9VZPH5cg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFXNd-0004Ql-SO; Tue, 08 Sep 2020 06:45:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFXNb-0004PA-MU; Tue, 08 Sep 2020 06:45:24 +0000
X-UUID: 618004427fcc4ea0984e417c95e977e4-20200907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=gpE1ctEiw5a0F49dlYTrRDICddTGz2kby8/WkqyE3fU=; 
 b=IVsOyrvR1xoP9HQU2vpQd0/hs1fQmA+JYN94Ekmwakrvat1li8+OfIBmghT466vCjLy/Gxr6ycrg0gKa1bQO2443/gdjrCOzXVZ1NCbuhwBaxtugrRhboTc71njJlVkttkCX59Hf4dqCbEwUoSnlDRM9Mpc/mETKi0JqXmnlBYs=;
X-UUID: 618004427fcc4ea0984e417c95e977e4-20200907
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 147755546; Mon, 07 Sep 2020 22:45:19 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Sep 2020 23:45:17 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Sep 2020 14:45:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Sep 2020 14:45:09 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH 0/4] scsi: ufs-mediatek: Fixes for kernel v5.10
Date: Tue, 8 Sep 2020 14:45:03 +0800
Message-ID: <20200908064507.30774-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_024523_883676_03F0D58D 
X-CRM114-Status: UNSURE (   9.49  )
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
Cc: bvanassche@acm.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, matthias.bgg@gmail.com,
 Stanley Chu <stanley.chu@mediatek.com>, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Martin, Avri,

This series fix some defects and introduce host reset mechanism in MediaTek UFS platforms.
Please consider this patch series for kernel v5.10.

Thanks,

Stanley Chu

Stanley Chu (4):
  scsi: ufs-mediatek: Eliminate error message for unbound mphy
  scsi: ufs-mediatek: Fix HOST_PA_TACTIVATE quirk
  scsi: ufs-mediatek: Fix flag of unipro low-power mode
  scsi: ufs-mediatek: Add host reset mechanism

 drivers/scsi/ufs/ufs-mediatek.c | 79 ++++++++++++++++++++++++++-------
 drivers/scsi/ufs/ufs-mediatek.h |  3 ++
 2 files changed, 67 insertions(+), 15 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
