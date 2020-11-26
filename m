Return-Path: <SRS0=o4uA=FA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B97C63777
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 05:39:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16E4B206F4
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 05:39:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bsJIZUg6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ULpKm0jB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16E4B206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0HPKuClLGdRuLwfOGZUwVktPHsoAXO8hOMekkylQ5FM=; b=bsJIZUg6nhZ6Zk1RVmIWCbY0LR
	QMbHx+aWwNtGNUkRmfq14+iXCBW8LQdT1Qa9LZD7wMeBO9hXc5UmIRTVwnXhsZKhc/SyYib2hCtVb
	DUb8Z7fwORdBtMZXbV2qK7rNiXc3Kv0vLtUKN2RaRfJGV9W3nHSfvsMm33cxhwvAQhW/kQk9zWOCt
	5XUCvVMG2jU+XG2PqYfpp8FszmROG7pgm5VHaon1KzffHtxowJb3fvSuwr9SwQEZkkPOUZRwY6546
	WAWgoRQUT/z42mTdasTVUDcLVVfYtFfftUoca+C27SVjSWaX4cxKORo+urynH88SiGZF6rZ47VZ4j
	BOpY8a+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ki9zq-0005a2-4r; Thu, 26 Nov 2020 05:39:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ki9zd-0005X8-Jq; Thu, 26 Nov 2020 05:38:59 +0000
X-UUID: 06d7e3e521154f4494213e3d1bcd6096-20201125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=AuJ2MEk12Y9Ud7yDiesHF5uN4sKUFPT86iwlJ+WJbYw=; 
 b=ULpKm0jBJP+9e9G4OWA5BwKQe7dKA8Ow1yHYHRvGXWfBOWiNgz8kG8SZxLGCkH5ikBq2uO0uUV6JJ5xIyfI/Fw1ppJ+cb05cQs0hSimAhNIUFnlehw2eBttC9Aw1ulGRDFhHtF3sCvxQLNpeQ/rt90K++NhCm2TvQEk0e0vnAos=;
X-UUID: 06d7e3e521154f4494213e3d1bcd6096-20201125
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2065590992; Wed, 25 Nov 2020 21:38:16 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Nov 2020 21:38:42 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 Nov 2020 13:38:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 26 Nov 2020 13:38:40 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 0/3] Refine error history and introduce notify_event vop
Date: Thu, 26 Nov 2020 13:38:36 +0800
Message-ID: <20201126053839.25889-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_003858_453332_09961525 
X-CRM114-Status: UNSURE (   7.82  )
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
Cc: Stanley Chu <stanley.chu@mediatek.com>, alice.chao@mediatek.com,
 bvanassche@acm.org, huadian.liu@mediatek.com, andy.teng@mediatek.com,
 cc.chou@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, jiajie.hao@mediatek.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,
This series refines error history functions and introduce a new notify_event vop to allow vendor to get notified of important events.

Stanley Chu (3):
  scsi: ufs: Add error history for abort event in UFS Device W-LUN
  scsi: ufs: Refine error history functions
  scsi: ufs: Introduce notify_event variant function

 drivers/scsi/ufs/ufshcd.c | 122 ++++++++++++++++++++++----------------
 drivers/scsi/ufs/ufshcd.h |  82 ++++++++++++-------------
 2 files changed, 112 insertions(+), 92 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
