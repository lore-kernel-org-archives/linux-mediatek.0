Return-Path: <SRS0=LjRj=47=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F5DCC10DCE
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Mar 2020 03:17:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F5BC2067C
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Mar 2020 03:17:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t1/iemqv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NAxn80v6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F5BC2067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iGEHygmiP9/RLBsVp0/Er37FHcqICQMa5Yq/5Viu9fU=; b=t1/iemqvy8sqwo
	zWN9j0IidnisQQkpboQ6nFxuTuufVdDGz1KmkVJuDrR2CagaDz99ZBQEUOZPlCpeYH3KEsyLaOzzn
	CF5MvM5WGvL4eSyDlqbfU/2CIrqf4IhIa/xEshc72DiN67ItcawGchd9GXnQJ95cjutes7gePJ3r3
	w6sAugexw00auo8KEp/H2E3R2FmnpqkUVi+NkZE7ufLRnwrNQqytAOxB3TrqDjRuhNTf+HBK9j1m3
	KULKV5U+mtT7G63khf5h+j1zxOaEgb3VB6m/5QD1TZ6QaBYc5byM+WngMGrcea38Et51uwGMfZTdL
	9GQbJUcZdG3tdyYnHYhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCxIq-0004WE-CT; Sat, 14 Mar 2020 03:17:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCxHn-0003Qx-Qj; Sat, 14 Mar 2020 03:16:29 +0000
X-UUID: 626e0e8715134193b429d73bff648e1b-20200313
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Cp6nxJDmK0by+hyxNgFAHL/aGR7OEaDHIQICFVZiGaQ=; 
 b=NAxn80v6BI852R+Ii3cMKJ4RmIW4wwZ7+AUJp1okdJU2yE0ObCm/sAOpLsOSDTn7QedDBuYmtJ6JEkKfR48I7dLIDbp0wANVIiVqTpGidlqhBxILbRnHpiS8de/jCm9cyyz9dAbeDdsk/1zCEG1mnnhpBml8xHJGpFecpZaZSRs=;
X-UUID: 626e0e8715134193b429d73bff648e1b-20200313
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1198304115; Fri, 13 Mar 2020 19:16:18 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Mar 2020 20:16:29 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sat, 14 Mar 2020 11:15:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Sat, 14 Mar 2020 11:15:58 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 0/2] scsi: ufs: add error recovery for suspend and resume
 in ufs-mediatek
Date: Sat, 14 Mar 2020 11:15:58 +0800
Message-ID: <20200314031600.10616-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5C892599D836B07E4273D5D50073766BC77ACDA29FAE6827C18AF61F3F5B7CE52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200313_201627_884268_7A2D5B0E 
X-CRM114-Status: UNSURE (   5.87  )
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

This patchset adds error recovery flow for suspend and resume in ufs-mediatek driver.

Stanley Chu (2):
  scsi: ufs: export ufshcd_link_recovery for vendor's error recovery
  scsi: ufs-mediatek: add error recovery for suspend and resume

 drivers/scsi/ufs/ufs-mediatek.c | 12 ++++++++++--
 drivers/scsi/ufs/ufshcd.c       |  3 ++-
 drivers/scsi/ufs/ufshcd.h       |  1 +
 3 files changed, 13 insertions(+), 3 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
