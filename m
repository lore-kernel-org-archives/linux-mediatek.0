Return-Path: <SRS0=HZpZ=FM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A14FEC4361B
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 13:57:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6429623A53
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 13:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6429623A53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PsqX2285jQn6bkgq6Jfc91Gc9RgUL6ColCUrcx4XX9A=; b=B164VFBoa2G9FjAfpNS3NKkFAz
	Xv9QQQ49rVLs8yf3SkW80u+XBlqEvifikjQmNP1tLAdbJGR9sL22E+7zmLKWb0DkVk0g1n9CLE/Dd
	BC4dXe/yLpAdzizjfomJD3rGRMjrdAlCXdvSFgDnJC4jPqfAN4cUDg/TgFCbbyKh7S+umk3ALhwPh
	qcT4r9QPw1HahUnLfgxSxpoJ0EcSnS1z34CazmuQJyAnc4a/ofxgLeC41rEONZBHhCAucTwEoNt7I
	risxyI8f+4r8ZXCrpw6C28zs/qG6DinogjJAV4JArrp7rntavutPP2qmKU5Fwf73VmuJfsbW4P8WG
	WVEWNI4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmdU8-0000k2-Ad; Tue, 08 Dec 2020 13:56:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmdU0-0000eY-O6; Tue, 08 Dec 2020 13:56:49 +0000
X-UUID: 072e6691631c4265a49f2cc9d0d5d4fe-20201208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=jQSStGswREif+8E1G8/UnyvIZM6ZohhicQjR2fgmiCk=; 
 b=ZFqIdX19EpJxhEc53xkXtrIJf1B5d7DlFVihZH5Z3FmKt7WpIN7T/Jd0RU9x6SqWFgQ5npaLCMDtvm4O1bTwWyQDoxN8/LGUoGjq+lnr01Kv6ZygXfG9HaCGDmi+S7Q32VTGyp1Lz7eHIVN9onPgRgd7R2jQEp3yNO0fxFiigEw=;
X-UUID: 072e6691631c4265a49f2cc9d0d5d4fe-20201208
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1335296173; Tue, 08 Dec 2020 05:56:46 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Dec 2020 05:56:44 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Dec 2020 21:56:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 8 Dec 2020 21:56:34 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
Subject: [PATCH v2 0/2] scsi: ufs: Re-enable WB after device reset
Date: Tue, 8 Dec 2020 21:56:33 +0800
Message-ID: <20201208135635.15326-1-stanley.chu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 29694EDB5F58899C9EB8D22B45F58AE6EF1CEAF90F164B2504683A26C00FED832000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_085649_015376_19A84956 
X-CRM114-Status: UNSURE (   6.69  )
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
Cc: bjorn.andersson@linaro.org, Stanley Chu <stanley.chu@mediatek.com>,
 alice.chao@mediatek.com, bvanassche@acm.org, andy.teng@mediatek.com,
 cc.chou@mediatek.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, nguyenb@codeaurora.org, jiajie.hao@mediatek.com,
 cang@codeaurora.org, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, matthias.bgg@gmail.com, beanhuo@micron.com,
 chaotian.jing@mediatek.com, linux-arm-kernel@lists.infradead.org,
 asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

This series fixes up an issue that WB is not re-enabled after device reset.

Stanley Chu (2):
  scsi: ufs: Re-enable WriteBooster after device reset
  scsi: ufs: Uninline ufshcd_vops_device_reset function

 drivers/scsi/ufs/ufshcd.c | 27 ++++++++++++++++++++++-----
 drivers/scsi/ufs/ufshcd.h | 14 +++++---------
 2 files changed, 27 insertions(+), 14 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
