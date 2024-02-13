Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E4CC4829D
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 00:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hZ6EZgeNd+PAswDHK801i46+W/qcsp4t5pU5FJyB024=; b=lSit7VciZQW4glp5vAn8fRW4tj
	pUUrixmJKvqqd0mwodETMD/YPHYLuNplIIwaKhQ7wH70qd+7AQNqskycJRHNcuNftFNUYpP5D/A06
	81UGl2OuX0fYCy0W6eP/CSM75fb2h2phNbMrYJSwKe/YVOekrt8Bj+7IfnYfCY5q8x3WIm9dY5utd
	hcLO0b503vUd4J7vhDHFCeDI5n35jX3AHfDe4P1HG0KlftNgVNDwYmNGSQPoQ57Zx6jay/PpDgOUQ
	zbh8D19UcorWkAjj+t7Ume14/uBWoQI4FcH5WfgxA0xzysApSC9XKZqDhI7GP4ATWSbdDw8FoBx4q
	jSrPYMwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZgWT-00000007MoJ-3S9o;
	Tue, 13 Feb 2024 00:19:41 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZgWQ-00000007MmH-2EVs;
	Tue, 13 Feb 2024 00:19:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A7B16CE188D;
	Tue, 13 Feb 2024 00:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 872EAC433C7;
	Tue, 13 Feb 2024 00:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707783575;
	bh=tzPIC+m1fFB0Tzle2Z1fphOM1nuEa7uXJ0cjSIb3zHQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dg5s29QJaPpbhjSH621EMX94eHNe+cIAVSZ+ujGvGgzknNOthAn/xSqojNu0MvDoC
	 MM1xwGnvWj7I334gy092WhG7eT07UOzxWToOt7y1EfQuQ0CM0NoQoNXKTdU2495MhT
	 MoOfkRxFj/FAMdIQw5YJFU/TW4lJzUsw5Xh5RTWaJUQFB30dQFojJdCNdM9I6OD0sE
	 icPe2OIEkv8+SCRvVEFx4PpBuVVGdKpMM31dtU746zlSdFObvtQ49KvZVf0+h4WvpX
	 F1qp3dNLLBMV/qU3e9yVUOIpFDLXvvi+k9L+7VcN3NLpaUcz/cN6JC25e50kZNMAKW
	 QFY6t83mmN0dA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Alice Chao <alice.chao@mediatek.com>,
	Stanley Jhu <chu.stanley@gmail.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	jejb@linux.ibm.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	stanley.chu@mediatek.com,
	avri.altman@wdc.com,
	quic_cang@quicinc.com,
	peter.wang@mediatek.com,
	quic_nguyenb@quicinc.com,
	beanhuo@micron.com,
	manivannan.sadhasivam@linaro.org,
	quic_ziqichen@quicinc.com,
	athierry@redhat.com,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.7 37/58] scsi: ufs: core: Fix shift issue in ufshcd_clear_cmd()
Date: Mon, 12 Feb 2024 19:17:43 -0500
Message-ID: <20240213001837.668862-37-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213001837.668862-1-sashal@kernel.org>
References: <20240213001837.668862-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7.4
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_161938_952903_0AB4E42C 
X-CRM114-Status: GOOD (  10.49  )
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

From: Alice Chao <alice.chao@mediatek.com>

[ Upstream commit b513d30d59bb383a6a5d6b533afcab2cee99a8f8 ]

When task_tag >= 32 (in MCQ mode) and sizeof(unsigned int) == 4, 1U <<
task_tag will out of bounds for a u32 mask. Fix this up to prevent
SHIFT_ISSUE (bitwise shifts that are out of bounds for their data type).

[name:debug_monitors&]Unexpected kernel BRK exception at EL1
[name:traps&]Internal error: BRK handler: 00000000f2005514 [#1] PREEMPT SMP
[name:mediatek_cpufreq_hw&]cpufreq stop DVFS log done
[name:mrdump&]Kernel Offset: 0x1ba5800000 from 0xffffffc008000000
[name:mrdump&]PHYS_OFFSET: 0x80000000
[name:mrdump&]pstate: 22400005 (nzCv daif +PAN -UAO)
[name:mrdump&]pc : [0xffffffdbaf52bb2c] ufshcd_clear_cmd+0x280/0x288
[name:mrdump&]lr : [0xffffffdbaf52a774] ufshcd_wait_for_dev_cmd+0x3e4/0x82c
[name:mrdump&]sp : ffffffc0081471b0
<snip>
Workqueue: ufs_eh_wq_0 ufshcd_err_handler
Call trace:
 dump_backtrace+0xf8/0x144
 show_stack+0x18/0x24
 dump_stack_lvl+0x78/0x9c
 dump_stack+0x18/0x44
 mrdump_common_die+0x254/0x480 [mrdump]
 ipanic_die+0x20/0x30 [mrdump]
 notify_die+0x15c/0x204
 die+0x10c/0x5f8
 arm64_notify_die+0x74/0x13c
 do_debug_exception+0x164/0x26c
 el1_dbg+0x64/0x80
 el1h_64_sync_handler+0x3c/0x90
 el1h_64_sync+0x68/0x6c
 ufshcd_clear_cmd+0x280/0x288
 ufshcd_wait_for_dev_cmd+0x3e4/0x82c
 ufshcd_exec_dev_cmd+0x5bc/0x9ac
 ufshcd_verify_dev_init+0x84/0x1c8
 ufshcd_probe_hba+0x724/0x1ce0
 ufshcd_host_reset_and_restore+0x260/0x574
 ufshcd_reset_and_restore+0x138/0xbd0
 ufshcd_err_handler+0x1218/0x2f28
 process_one_work+0x5fc/0x1140
 worker_thread+0x7d8/0xe20
 kthread+0x25c/0x468
 ret_from_fork+0x10/0x20

Signed-off-by: Alice Chao <alice.chao@mediatek.com>
Link: https://lore.kernel.org/r/20240205104905.24929-1-alice.chao@mediatek.com
Reviewed-by: Stanley Jhu <chu.stanley@gmail.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/ufs/core/ufshcd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 1f8d86b9c4fa..6f7cfecacd27 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -3045,7 +3045,7 @@ bool ufshcd_cmd_inflight(struct scsi_cmnd *cmd)
  */
 static int ufshcd_clear_cmd(struct ufs_hba *hba, u32 task_tag)
 {
-	u32 mask = 1U << task_tag;
+	u32 mask;
 	unsigned long flags;
 	int err;
 
@@ -3063,6 +3063,8 @@ static int ufshcd_clear_cmd(struct ufs_hba *hba, u32 task_tag)
 		return 0;
 	}
 
+	mask = 1U << task_tag;
+
 	/* clear outstanding transaction before retry */
 	spin_lock_irqsave(hba->host->host_lock, flags);
 	ufshcd_utrl_clear(hba, mask);
-- 
2.43.0


