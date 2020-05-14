Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B1E5C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 15:04:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24369205CB
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 15:04:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Dm8pFomJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="q926edJ2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24369205CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+pQEc2QQEW8lXDbBJDbhl9i+LnwRQhiSzlAStBF6k9k=; b=Dm8pFomJkuBpuf
	eCxY1Hb4fY4xEJ2r1bHTGN89B7qCTGvZocrdevdM/CReOqg0OCG2ULYBHVx81+L3LgIPHl2gCEwtj
	EbloVoXdGxQv1WViNXPpZWWDDwUymmL+mSfNl0Z7H+SdgNRowt+p0XeQsuGx7/l73xDpBV1IIx2aO
	tbx9BHUY+KAjJ2F9GrZldGFrP91iVBFWkF7UAIyWwV4Eg/t2Kj8wuaAG50ibaF297uE/zLnpLRZNT
	Sx8kPX9zWKgm/9n3G/LPU4EoX7gXs7RCjthayo82GeiWxRxogI45ha8MngzAEnB8V1bThkxLcKac9
	/0t6NKxQEBaHR7ImpMXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZFP1-0000ST-1a; Thu, 14 May 2020 15:04:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZFMe-0007D4-SQ; Thu, 14 May 2020 15:01:43 +0000
X-UUID: 3fa5a61dc5c6414188ce228bf50b5266-20200514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=oQJZc3MeYI2g59uaOgNPF1yMp/cTZbERUuTkSYQyTrQ=; 
 b=q926edJ2JqFC1RyS5iDL2Vl2ac5uA/AtJqQ8RYzBUSNILRtJLmlhnhqlSKalpgvx+yfsyghsj8QZ1eWStdlbqUlkWmAnkiAabUi6vi21GbJLH+DIukVVFcfrx09oNc+pNyFCERKzdEqGSzvil19CJvnEhwX/ASmtkOyvN71UWHE=;
X-UUID: 3fa5a61dc5c6414188ce228bf50b5266-20200514
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1489654614; Thu, 14 May 2020 07:01:33 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 May 2020 08:01:30 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 May 2020 23:01:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 14 May 2020 23:01:20 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>,
 <asutoshd@codeaurora.org>
Subject: [PATCH v2 0/4] scsi: ufs: Fix WriteBooster and cleanup UFS driver
Date: Thu, 14 May 2020 23:01:18 +0800
Message-ID: <20200514150122.32110-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7A70CB63B83E9314C8CEA15F10C51D8DEFD06F744864204F25234DFCB60B92172000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_080136_917641_979FDF07 
X-CRM114-Status: UNSURE (   6.85  )
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
Cc: bvanassche@acm.org, andy.teng@mediatek.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, Stanley Chu <stanley.chu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

This patch set fixes some WriteBooster issues and do small cleanup in UFS driver

v1 -> v2
  - Remove dummy new line in patch [4] (Asutosh)
  - Add more limitation to allow WriteBooster flush during Hibern8 in runtime-suspend. Now the device power mode is kept as Active power mode only if link is put in Hibern8 or Auto-Hibern8 is enabled during runtime-suspend (Asutosh)

Stanley Chu (4):
  scsi: ufs: Remove unnecessary memset for dev_info
  scsi: ufs: Allow WriteBooster on UFS 2.2 devices
  scsi: ufs: Fix index of attributes query for WriteBooster feature
  scsi: ufs: Fix WriteBooster flush during runtime suspend

 drivers/scsi/ufs/ufs-sysfs.c | 13 ++++++--
 drivers/scsi/ufs/ufs.h       |  1 -
 drivers/scsi/ufs/ufshcd.c    | 62 +++++++++++++++++++-----------------
 drivers/scsi/ufs/ufshcd.h    |  2 +-
 4 files changed, 45 insertions(+), 33 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
