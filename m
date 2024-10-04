Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 196B5CFA74C
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Oct 2024 09:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2dHuYhw3iP86OtXvHFtgEPtzJSdwQ6v6J5tO3itzz8=; b=p28XYm+DfcQ1hucIGuJ/rS3y8l
	eTnwD6nhy6hoWpRK1IzVMiSF7bzNHsJZL48cMtkWX9Sigzh0p5W0gLwx9sWxPOPAk0Vn6RZdbCl4x
	m7qRy5XYr9WIDFhLSfIHAGlRxHmHT0x+cb0lb8zChehMBaDglboY1jbFO20sC8y6bfHcp12BM7wPe
	x9TrbtF7iav3oxDcXKl5wV5xXkcyp8nQO29L+CnSvaotNA3bXB+sDUNrd+lU8Ryomb9oiy/kWdODk
	BQs399pVs6RDuSRlr1zMvcJ5FYfPY6uFYrrmCMtOmJ/51sqCQcw1JkjAxtOVUS7z4+2uWJP3RvP3y
	vZnhNX4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swesN-0000000BhDE-0XwZ;
	Fri, 04 Oct 2024 09:45:31 +0000
Received: from mgamail.intel.com ([192.198.163.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sweoV-0000000BfrQ-01jr;
	Fri, 04 Oct 2024 09:41:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728034891; x=1759570891;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R7CeySgpEEmyAbh0ZJribSgpdJ/nWxXYO1wHHruXfQQ=;
  b=gtNXkI5KdknIXHgTS9wMVU/wWOwDk2nPN8Zb93ZA2LdN7WQ6rAUPbeS/
   5LAfMlQbdz6k6mbJpgsvBizG8hY+xhLprmIVHhDXW553lTWxEKqobQOpC
   lGDOAWVMZ5kI6tVPrzcCHVJ5HTfNgJy5Ds2szHWhupwBIdILqKsMVT0kK
   pm9CFGjm4i/DlB52s0NJBAXLft80YxF+bH3ZO5Xk3mVkjf0sn8sI8cgQH
   weZMVXOfKAqNb9dtVF2CcZ/7KgljeymsP+XcEDUfOP4P05g91lQYnsLKr
   lqxlmhNxwtuvXNTpY8ZTEPhtbAe8HCxCJbPODJBOOLfHSEHsFI9qni001
   A==;
X-CSE-ConnectionGUID: 483S1wVzTdeOEcgf3uBcYw==
X-CSE-MsgGUID: DEtysswWSNubi1PJ7pgckQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37856279"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="37856279"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:30 -0700
X-CSE-ConnectionGUID: ISX+JtaVSxG1ccZF6U1u3Q==
X-CSE-MsgGUID: MpmVMbnURG20T9ZpfFhmTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="74331945"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:28 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6C84B121008;
	Fri,  4 Oct 2024 12:41:23 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sweoN-000Tb3-1N;
	Fri, 04 Oct 2024 12:41:23 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 24/51] mailbox: mtk-cmdq-mailbox: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:23 +0300
Message-Id: <20241004094123.113759-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_024131_183171_50913C96 
X-CRM114-Status: GOOD (  11.29  )
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

pm_runtime_put_autosuspend() will soon be changed to include a call to
pm_runtime_mark_last_busy(). This patch switches the current users to
__pm_runtime_put_autosuspend() which will continue to have the
functionality of old pm_runtime_put_autosuspend().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 4bff73532085..180906761eda 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -397,7 +397,7 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 
 	task = kzalloc(sizeof(*task), GFP_ATOMIC);
 	if (!task) {
-		pm_runtime_put_autosuspend(cmdq->mbox.dev);
+		__pm_runtime_put_autosuspend(cmdq->mbox.dev);
 		return -ENOMEM;
 	}
 
@@ -447,7 +447,7 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
 	list_move_tail(&task->list_entry, &thread->task_busy_list);
 
 	pm_runtime_mark_last_busy(cmdq->mbox.dev);
-	pm_runtime_put_autosuspend(cmdq->mbox.dev);
+	__pm_runtime_put_autosuspend(cmdq->mbox.dev);
 
 	return 0;
 }
@@ -495,7 +495,7 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
 	spin_unlock_irqrestore(&thread->chan->lock, flags);
 
 	pm_runtime_mark_last_busy(cmdq->mbox.dev);
-	pm_runtime_put_autosuspend(cmdq->mbox.dev);
+	__pm_runtime_put_autosuspend(cmdq->mbox.dev);
 }
 
 static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
@@ -535,7 +535,7 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 out:
 	spin_unlock_irqrestore(&thread->chan->lock, flags);
 	pm_runtime_mark_last_busy(cmdq->mbox.dev);
-	pm_runtime_put_autosuspend(cmdq->mbox.dev);
+	__pm_runtime_put_autosuspend(cmdq->mbox.dev);
 
 	return 0;
 
@@ -550,7 +550,7 @@ static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 		return -EFAULT;
 	}
 	pm_runtime_mark_last_busy(cmdq->mbox.dev);
-	pm_runtime_put_autosuspend(cmdq->mbox.dev);
+	__pm_runtime_put_autosuspend(cmdq->mbox.dev);
 	return 0;
 }
 
-- 
2.39.5


