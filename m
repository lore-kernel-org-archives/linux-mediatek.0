Return-Path: <SRS0=Ncyn=2O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A068C2D0CF
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Dec 2019 13:02:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF31B206B7
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Dec 2019 13:02:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eLyD/hY6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Fjggs7Ll"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF31B206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/C8aj/diDy5BfTJxf0cMsIe9WmrREHPKNC7eaOCk3jw=; b=eLyD/hY6VKnWOu
	7VPPan7Twd87sJyq9piV9r4gaIwU4nXsvYnH22Yr9JQ7LzALrUxZITHq6stvfAIPREZcX2SZOX/ro
	Ox1Ce748J7QJAWNtEdOCP4v2IaRZcQ+YuXj7Uy4WrYcIqiRqTQrlQgl504NZYXZEP6yJyP5zVfNZF
	1qVkvxL1PsnhIuKJIJinD8vwlsbwdvtY4pcI+X5llTUkKhhbtv1d1YVBHFnpb4cRBuNYpzO1FDGdQ
	+WvhAVC2ahprcYpc3lQjpTG2Inhy2b3XqfejLy10LeWX44SDxmPMrgSB2Vn6wpmgo+DVZQ2E0xQls
	PQNp3R/0Z6dfXN5Fo4Ug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijjpO-00040i-PF; Tue, 24 Dec 2019 13:02:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijjoZ-0003B4-BI; Tue, 24 Dec 2019 13:01:32 +0000
X-UUID: c7987407bef04f60bcfb109ca7a02210-20191224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=zp98NbaQU/mj61NoYID7Wx6HbOD8Ri6lmcuOBmd0rwY=; 
 b=Fjggs7LllB5jHOUxWkdQPowuU6ddvffbPb+0SS0hJgeKoBPLhBNgmfKXa2xgve7HKnEtv/BDm/ZQc5o1iXYrUwCiOtzpk3maXGyZ20yhZ5+dVNRfzfmCX64H5ABW3+2z/it2qihaeCbrPj7ltf3zkUCzt/Ynv73f+0IymQQ/NFU=;
X-UUID: c7987407bef04f60bcfb109ca7a02210-20191224
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 705527776; Tue, 24 Dec 2019 05:01:23 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 24 Dec 2019 05:01:46 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 24 Dec 2019 21:00:34 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 24 Dec 2019 21:00:11 +0800
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
 <avri.altman@wdc.com>, <alim.akhtar@samsung.com>,
 <pedrom.sousa@synopsys.com>, <jejb@linux.ibm.com>, <matthias.bgg@gmail.com>
Subject: [PATCH v1 2/2] scsi: ufs: use ufshcd_vops_dbg_register_dump for
 vendor specific dumps
Date: Tue, 24 Dec 2019 21:01:06 +0800
Message-ID: <1577192466-20762-3-git-send-email-stanley.chu@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1577192466-20762-1-git-send-email-stanley.chu@mediatek.com>
References: <1577192466-20762-1-git-send-email-stanley.chu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191224_050131_389324_870B5408 
X-CRM114-Status: UNSURE (   9.24  )
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

We already have ufshcd_vops_dbg_register_dump() thus all
"hba->vops->dbg_register_dump" references can be replaced by it.

Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/scsi/ufs/ufshcd.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index b6b9665..1ac9272 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -428,8 +428,7 @@ static void ufshcd_print_host_regs(struct ufs_hba *hba)
 
 	ufshcd_print_clk_freqs(hba);
 
-	if (hba->vops && hba->vops->dbg_register_dump)
-		hba->vops->dbg_register_dump(hba);
+	ufshcd_vops_dbg_register_dump(hba);
 }
 
 static
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
