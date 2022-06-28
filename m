Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEFF9C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 02:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R9+QuBM6XMcnQT2NgneX7dfK6eWaStEitw+jroDSiks=; b=ydu3PuLX6E8JPUnIIDvU6dLZCj
	hQyjHgg5vGcyEQksLIJmiMGiVH2U6uY0pEnNU0K443arfT5iONBHQcUHlCbcwGdWoimrhGxWMFYOg
	7BDdU8/BTrIZyQsiuo/sX190x97lvimImzk11M5TskKH4vD3lwaO4jQpT9Jnp1frjtlWTPIEjWqmE
	E/bufhihK5tuxgRXVuamQfDo1LpYfkMbBJfnd4Ct0TV/N+5VqU4WDRx1xrYN811fBSybqAqcQOrgY
	OlEbyHx8lzpUY30t42FcPXW7a3MlONxdcgrlHpTsrLtGIAUpWDSXaV7onNXYNu5QLWs+USWNFPwXD
	kSxNWufQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o60tf-003hPj-4k; Tue, 28 Jun 2022 02:24:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o60r4-003fn9-FP; Tue, 28 Jun 2022 02:21:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0532EB81C11;
	Tue, 28 Jun 2022 02:21:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 344D1C34115;
	Tue, 28 Jun 2022 02:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656382887;
	bh=eNniy0Kmh5T69pDeELmX4we8oQUPfZo885vIdUET7Gk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vaw+6C1sw/2irosJXCUUA2nTm6G6e9ohsOq3//ClaNk4gUqwRiK4OwtMdLdo6aevh
	 n1Qo72FaWM6NtB9cIpBbXi5KHzLhoOCHAdZgKH1YYPkqIgsuhLv3NUgtfOZmxutmQf
	 IhO2K8cI4jA9TQlNdw6o+8rAS3qfEyCC+ubcD+H8qIWwAkIVY7nIgwWNDR/lR9Gry7
	 tyg6gOp1nS5bRy3HDmN2iNrEoZtNhT9tPmg2UCN6F34B/64G4oZgNXR/MNYjcSWtEI
	 tCLBCoqN9W0MVHcn7SeBcBUmy5qUGUzbuDq9kUhyfPC5kCsk5HUYGk2y46NHaD1FOk
	 J3L/rYTJlfxgw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Bart Van Assche <bvanassche@acm.org>,
	Stanley Chu <stanley.chu@mediatek.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	jejb@linux.ibm.com,
	matthias.bgg@gmail.com,
	beanhuo@micron.com,
	avri.altman@wdc.com,
	daejun7.park@samsung.com,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 12/41] scsi: ufs: Simplify ufshcd_clear_cmd()
Date: Mon, 27 Jun 2022 22:20:31 -0400
Message-Id: <20220628022100.595243-12-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022100.595243-1-sashal@kernel.org>
References: <20220628022100.595243-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_192130_695782_E7C601F0 
X-CRM114-Status: GOOD (  12.97  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bart Van Assche <bvanassche@acm.org>

[ Upstream commit da8badd7d3583f447eac2ab65a332f2d773deca1 ]

Remove the local variable 'err'. This patch does not change any
functionality.

Link: https://lore.kernel.org/r/20220613214442.212466-2-bvanassche@acm.org
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/scsi/ufs/ufshcd.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/scsi/ufs/ufshcd.c b/drivers/scsi/ufs/ufshcd.c
index 5c9a31f18b7f..311170e63410 100644
--- a/drivers/scsi/ufs/ufshcd.c
+++ b/drivers/scsi/ufs/ufshcd.c
@@ -2798,7 +2798,6 @@ static int ufshcd_compose_dev_cmd(struct ufs_hba *hba,
 static int
 ufshcd_clear_cmd(struct ufs_hba *hba, int tag)
 {
-	int err = 0;
 	unsigned long flags;
 	u32 mask = 1 << tag;
 
@@ -2811,11 +2810,8 @@ ufshcd_clear_cmd(struct ufs_hba *hba, int tag)
 	 * wait for h/w to clear corresponding bit in door-bell.
 	 * max. wait is 1 sec.
 	 */
-	err = ufshcd_wait_for_register(hba,
-			REG_UTP_TRANSFER_REQ_DOOR_BELL,
-			mask, ~mask, 1000, 1000);
-
-	return err;
+	return ufshcd_wait_for_register(hba, REG_UTP_TRANSFER_REQ_DOOR_BELL,
+					mask, ~mask, 1000, 1000);
 }
 
 static int
-- 
2.35.1


