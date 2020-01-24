Return-Path: <SRS0=meO2=3N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69F63C35242
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jan 2020 06:50:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F9152072C
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jan 2020 06:50:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XnxwSDIQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="D10F9DWF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F9152072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BHH3nEhtZP09Cu94gGOVvOj+H248BB/tJQBDheY812o=; b=XnxwSDIQglkK4f
	3BM7BzMM+LJ32q7EuNP90zik7vySCHRj2IqGyHt+kTsMU+RirHa231nRuol4XSnNwrRwgAMTT0rbk
	PVwFJNrZfvrYavIWpDYrUM+QdANwJib9FJsuIfZJn+d61RIBXxsQojdP62zW3Moe5yhA5JzgcDdU4
	oGiOEhDb5n7sl5sILRat5M+hvKRzXfklRKCOf85QyAfZ7q2hU/Acfyph9VmUDAQ6m5m5O0LV8A1Z1
	N1KV/coewttKxhZDTGCqrKBRhiPZP5OphRNeHR3RxJ8RJX94T+LaDdlcMLHQYxe9j0zNghoSNobCX
	Oa6LjZ1LqFygrTkXArtg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iusnH-0002TY-38; Fri, 24 Jan 2020 06:50:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iusmi-0001yq-Mu; Fri, 24 Jan 2020 06:49:42 +0000
X-UUID: 81694a39251f433d9320fb200f5d53df-20200123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=9ZQEtQSDH2l7X4gZYfdkXUBut/YYbTfvmWSTS2DhTxg=; 
 b=D10F9DWFCdvj4U79P4WJKEhizwxu5CWKXi9GlCvouB108AP/tFyU+Z3j+umHGI1/9OAR/tzCQMk8ZFQNZ9X23jxCb0Ll0IVMfL9+bXrYIaKpsNdNx9HE1MlxgH+Nt62/C+rduZTOJpNZEb/7yH0YiYRHobB/n39qJO13Uj3hzT8=;
X-UUID: 81694a39251f433d9320fb200f5d53df-20200123
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1067299609; Thu, 23 Jan 2020 22:49:31 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 23 Jan 2020 22:50:41 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 24 Jan 2020 14:48:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Fri, 24 Jan 2020 14:48:57 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v1 0/5] MediaTek UFS vendor implemenation part III and
 Auto-Hibern8 fix
Date: Fri, 24 Jan 2020 14:49:21 +0800
Message-ID: <20200124064926.29472-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200123_224940_760017_4AB82C6F 
X-CRM114-Status: UNSURE (   6.30  )
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

This series provides MediaTek vendor implementations and some general fixes.

- General fixes
	- Fix Auto-Hibern8 error detection

- MediaTek vendor implementations
	- Ensure UniPro is powered on before every link startup
	- Support linkoff state during suspend
	- Gate reference clock for Auto-Hibern8 case

Stanley Chu (5):
  scsi: ufs-mediatek: ensure UniPro is not powered down before linkup
  scsi: ufs-mediatek: support linkoff state during suspend
  scsi: ufs: add ufshcd_is_auto_hibern8_enabled facility
  scsi: ufs: fix auto-hibern8 error detection
  scsi: ufs-mediatek: gate ref-clk during Auto-Hibern8

 drivers/scsi/ufs/ufs-mediatek.c | 65 +++++++++++++++++++++------------
 drivers/scsi/ufs/ufs-mediatek.h | 12 ++++++
 drivers/scsi/ufs/ufshcd.c       |  3 +-
 drivers/scsi/ufs/ufshcd.h       |  6 +++
 4 files changed, 62 insertions(+), 24 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
