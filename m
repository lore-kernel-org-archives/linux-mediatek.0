Return-Path: <SRS0=1cO+=GX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B458C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 15:02:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8BD723356
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jan 2021 15:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8BD723356
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q38ajuka9qehlT65VqTd36+BR2hxUGioiVY6yvpU3IY=; b=tC+YW81XRm56jHJr+dHy239F2Q
	16FmLAPRSwQzTib3qMFdUwGVuKdvgiuoe+275mbRkzY4KyRlBPbnfb/qFSqyKPCM15k+YvShyhQGf
	JNgrFDWq9goglaOkl5WuIaVEASfYT0zerSt7HqvXfTu3B3ZyFYH1Hb+rl8b0UvyNhs6DOq6eQ7E5i
	LEc2IIdb6iqeCydQEL+7/r04kyL1aKLDHS8z8UofdnySoHPUE2WfEpukyOxa8wO8otGfCmHWV9EMj
	v2E4w79zIE6lRy7TlNoLNKiZlhmHWWq/a8pENRSP3fh5tplEOgeBiqvrBATSdMUUdnR0xeeXZJ/jw
	hmw8fX3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2F00-0002Hz-Ps; Wed, 20 Jan 2021 15:02:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Ezr-0002Er-Vf; Wed, 20 Jan 2021 15:02:12 +0000
X-UUID: 31e2724dd5034da6be2c2511f5b2142f-20210120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=j4XhcCqYZ8I5QXpMom60si+5QKh3VmxLm0hcEKpcOhE=; 
 b=KlEcvDs0zWL3nToYXu+fmhlGVEzXfk1IVXnQUmPKEFLOsAzrk+cPFq1/hJjqvKlWPcrYGIBKdzAUSgz0ZVoTuqDdY3HDaMNe3huBYT27nsWgEhEE+mOYFar0+mpjbwkkJt6jhvXQd/BDEgXjwIBunxml69Gu4vCPKGLKJ+g0TEk=;
X-UUID: 31e2724dd5034da6be2c2511f5b2142f-20210120
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 793778967; Wed, 20 Jan 2021 07:02:08 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Jan 2021 07:02:07 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Jan 2021 23:01:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 20 Jan 2021 23:01:52 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v3 0/3] scsi: ufs: Cleanup and refactor clock scaling
Date: Wed, 20 Jan 2021 23:01:39 +0800
Message-ID: <20210120150142.5049-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4813510C0F2570B68E6DFB194355F03012662DC6A73A47E8BF304A594C14F6CA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_100212_165740_FAE1C11D 
X-CRM114-Status: UNSURE (   7.53  )
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
This series cleans up and refactors clk-scaling feature, and shall not change any functionality.

This series is based on Can's series "Three changes related with UFS clock scaling" in 5.12/scsi-queue branch in Martin's tree.

Changes since v2:
  - Remove patch 4
  - Rebase to Can's series: [v11] Three changes related with UFS clock scaling

Changes since v1:
  - Refactor ufshcd_clk_scaling_suspend() in patch [3/4]
  - Change function name from ufshcd_clk_scaling_pm() to ufshcd_clk_scaling_suspend() in patch [3/4]
  - Refine patch titles


Stanley Chu (3):
  scsi: ufs: Refactor cancelling clkscaling works
  scsi: ufs: Remove redundant null checking of devfreq instance
  scsi: ufs: Cleanup and refactor clk-scaling feature

 drivers/scsi/ufs/ufshcd.c | 87 ++++++++++++++++++---------------------
 1 file changed, 41 insertions(+), 46 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
