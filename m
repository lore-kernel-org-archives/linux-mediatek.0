Return-Path: <SRS0=iI7F=FL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D4CC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 06:00:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 257CE229C7
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 06:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 257CE229C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CnylUMKDoUvIZxVjaXFCaZabPxQCxDSY3b+UiKHP50U=; b=cv9PqeiObFvDIdgbJ2M0xKGtIJ
	8MoEe6Z7MWbbFtE4AU6erVXaSAKdpfUd9mtakuAPvtISAHbmfHn7SkQqbXw1MP2635AgsfECoUgy/
	2opzZbKHie30I8dCdySVZihpkKHEYyNSVn7B8Qx8aZVhNIG8EVc9OszRLtPHM6cfoQFxA0bVxfqge
	CW66XBNZAgljJkcNJdY67/TFGYfMmrTJR3b2Z33Zf+taT1Yn26YD93Q9PHq1m83XqDceReSN97oct
	2GNevhvIGW5DhHTOtQIM4pwYSCujB6TGzKkYxCKgdI5iosBv431rhnZPSrT1165ovvjfNxkuNFDIP
	VAyac6mw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1km9ZF-0006G5-TX; Mon, 07 Dec 2020 06:00:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1km9Z6-0006DU-QW; Mon, 07 Dec 2020 06:00:05 +0000
X-UUID: 41bb0b2a9d784f209f144ddc303ae8c1-20201206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=CzgFToszP5B81pqKGBdRZvDnePZ8uzELpV9FpqQPi7o=; 
 b=PHGa36Bp8+6dj12wKrxrVCI/hoIib9may1mwODzPZtZSrrVXBmgHi8NnR+GNxZ0FdCtyfG6wh8Gl+GiHumkkyrKETrF3YMLq0OhxvDhFlfuqFdZWdzA+TBVBURoxKr8GUqCuYWg41W7+K1dBI/mdPwREdRlBBvd0VoL9gQht3Vc=;
X-UUID: 41bb0b2a9d784f209f144ddc303ae8c1-20201206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 612787308; Sun, 06 Dec 2020 22:00:01 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Dec 2020 21:49:58 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Dec 2020 13:49:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Dec 2020 13:49:55 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 0/2] scsi: ufs: Allow regulators being always on
Date: Mon, 7 Dec 2020 13:49:53 +0800
Message-ID: <20201207054955.24366-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: BA26D26A3568A136A61EEE6BEC99CB306A98D38F846264546949EC904CA081052000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_010005_089824_0090F3DA 
X-CRM114-Status: UNSURE (   7.30  )
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
 bvanassche@acm.org, andy.teng@mediatek.com, cc.chou@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, jiajie.hao@mediatek.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,
This series allow vendors to keep the regulator always-on, and provide an implementation on MediaTek UFS platforms.

Stanley Chu (2):
  scsi: ufs: Allow regulators being always-on
  scsi: ufs-mediatek: Keep VCC always-on for specific devices

 drivers/scsi/ufs/ufs-mediatek.c | 21 +++++++++++++++++++++
 drivers/scsi/ufs/ufs-mediatek.h |  1 +
 drivers/scsi/ufs/ufs.h          |  1 +
 drivers/scsi/ufs/ufshcd.c       |  2 +-
 4 files changed, 24 insertions(+), 1 deletion(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
