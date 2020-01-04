Return-Path: <SRS0=JELp=2Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F98DC2D0C2
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jan 2020 14:36:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42E8B20656
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jan 2020 14:36:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mKVafq6f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UUkxHU4L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42E8B20656
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o3kEixmhvbLtKXLvzWits4StesxGnWpALJnvVwmlsU0=; b=mKVafq6f6iFI1c
	C7B8vM49UeJvimx6KV9++wWpPA7SmxUI6RqMCXWJoW0861+pi9lB8YsF54VnkuuN2sAD73FxEsFt/
	3poJupRgNafpqdxV93miUb1ZuSvVGGIi7Nd8RakvPJX4QtrP9pwDQd0wit2seeln5f8KiMYkd6opf
	Wz+FLsWc4EDw2PnQwt1PLMUnpYLVEHFd3WV51k5ZjyUBo/XtqQ8FfYfqYV6m2HFkKunV25mwkr4YZ
	gOQaP7ZXjSV6uveq0OatVJVKNzZJA4seTj0WyotM4gfBA0cKC5oENsapyDb3oiThiHPenl2aUnFEh
	ec/9qmUHMRzVIr4MPiGA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1inkXe-0003vr-6T; Sat, 04 Jan 2020 14:36:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1inkXV-0003oT-Qn; Sat, 04 Jan 2020 14:36:31 +0000
X-UUID: af37b75a49ba40679d9d5df93446cf8f-20200104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=SW1ng1B4N9Uj3rz0yt1c6Qc8LA9cWa+omxEpLReC8d8=; 
 b=UUkxHU4LWdgCqGe0/xCUtGeCmxTGwiBsBIyDEFdDgjpNWNM7evvIY02oDFMSP9zbTWLzQtZFsKoYdx9T17YaC+ABtOM1iK1j7f1kgwQwwaj+V1S32H2O1yErzD0pN6RWnt4YGPyui/9rd71Ub5AkUUU+HAKJPB3/4pWf9vHkj+w=;
X-UUID: af37b75a49ba40679d9d5df93446cf8f-20200104
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 426289139; Sat, 04 Jan 2020 06:36:26 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 4 Jan 2020 06:26:26 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 4 Jan 2020 22:25:16 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Sat, 4 Jan 2020 22:26:39 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 0/3] scsi: ufs: fix error history and complete device reset
 history
Date: Sat, 4 Jan 2020 22:26:05 +0800
Message-ID: <1578147968-30938-1-git-send-email-stanley.chu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: B3B9B6EB5DB4CEFAF1AC2165BB001FC8EDE9F53FF6594DACC0221E1470DD5E432000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200104_063629_878783_8436E1FD 
X-CRM114-Status: UNSURE (   5.31  )
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
Cc: Stanley Chu <stanley.chu@mediatek.com>, bvanassche@acm.org,
 andy.teng@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 matthias.bgg@gmail.com, beanhuo@micron.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

This series targets on UFS error history fixes and feature add-on,

1. Fix empty check logic while outputing error history.
2. Add device reset history events for vendor's implementations.
3. Remove dummy word in output format.

Stanley Chu (3):
  scsi: ufs: fix empty check of error history
  scsi: ufs: add device reset history for vendor implementations
  scsi: ufs: remove "errors" word in ufshcd_print_err_hist()

 drivers/scsi/ufs/ufshcd.c | 9 +++++----
 drivers/scsi/ufs/ufshcd.h | 6 +++++-
 2 files changed, 10 insertions(+), 5 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
