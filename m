Return-Path: <SRS0=kQJD=N7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6493DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Sep 2021 12:05:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 397E460041
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Sep 2021 12:05:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 397E460041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YfhWu/7dcQ6+dN38M/i2WojfXRhlUPIQBv0RIKPSHPs=; b=faIKnNOdBavqmC
	VcKjE2+iD/QAAnTuYnVv5qVbO/RRjBmWqwkcCkC0KYFk/vo73swBOh6vRrBtjGzGhGJxFDu8vU/Ua
	fm1hfOO9752JIgPXmznYYaGTmM3To83iGWJZDc0fqEhk8llitaNziq3FBSRlXvFC08N5fWCNGIyvT
	j4Nn9kSiS4Y9cHjhL4HplRWMnSaUC+L31Esrb+9O5yCkR9JWxNWGBHF7KxQKUu9FRQLY/3kmASSSR
	cb4TxJ22C+QfHaQmCIPf2ZjmxyjOE6BCa2eau8ftzsLo3Of1QNGEBzHn2LS+GJsMPDYBi+HncPXu1
	Ank+PCdAWl1aFEIqE76Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOInk-009G3R-85; Thu, 09 Sep 2021 12:05:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOIV7-0095lo-04; Thu, 09 Sep 2021 11:45:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B770D6140B;
 Thu,  9 Sep 2021 11:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631187952;
 bh=6WZrpTMDNvbUVof9OeKTjctXW5wSRixLJU4HNjVieB8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i5BPmJTLXXzsEx8vZY0lCr3ZS/Jy/i3FUz30zr0w8d+WwN7LYER87O4hIJEYew3o3
 Hgtc5mrxD/mBZ1zzuLm4koOqRo0fF0UCfUKDbr0aWU/gv5dTNdExoNL56tkU7G2KRa
 7cqmjUZ9oH5KDayQwZqTQ3L/kxUmeA3WAsA5AC73Yba/iSJAdKZ/+Fqb00putqFT41
 jVRGc1pYibGNkj+9va9RPO4IFPV674wYe687xocqQXkpQTUv0cF8tKGG/BlVgoWkGO
 W0Q0fVK3lsVQh9ezP6vPjS2O9NNjug5YMwHqaotLuaKUGIQnnKuoV2GQHvzq9c2xnu
 buL1J67jKR6+w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Pi Hsun <pihsun@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.14 220/252] usb: xhci-mtk: fix use-after-free of
 mtk->hcd
Date: Thu,  9 Sep 2021 07:40:34 -0400
Message-Id: <20210909114106.141462-220-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909114106.141462-1-sashal@kernel.org>
References: <20210909114106.141462-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_044553_155120_5AA8C414 
X-CRM114-Status: GOOD (  10.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Chunfeng Yun <chunfeng.yun@mediatek.com>

[ Upstream commit 7f85c16f40d8be5656fb3476909db5c3a5a9c6ea ]

 BUG: KASAN: use-after-free in usb_hcd_is_primary_hcd+0x38/0x60
 Call trace:
  dump_backtrace+0x0/0x3dc
  show_stack+0x20/0x2c
  dump_stack+0x15c/0x1d4
  print_address_description+0x7c/0x510
  kasan_report+0x164/0x1ac
  __asan_report_load8_noabort+0x44/0x50
  usb_hcd_is_primary_hcd+0x38/0x60
  xhci_mtk_runtime_suspend+0x68/0x148
  pm_generic_runtime_suspend+0x90/0xac
  __rpm_callback+0xb8/0x1f4
  rpm_callback+0x54/0x1d0
  rpm_suspend+0x4e0/0xc84
  __pm_runtime_suspend+0xc4/0x114
  xhci_mtk_probe+0xa58/0xd00

This may happen when probe fails, needn't suspend it synchronously,
fix it by using pm_runtime_put_noidle().

Reported-by: Pi Hsun <pihsun@google.com>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Link: https://lore.kernel.org/r/1629189389-18779-3-git-send-email-chunfeng.yun@mediatek.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/host/xhci-mtk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 2548976bcf05..cb27569186a0 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -569,7 +569,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 	xhci_mtk_ldos_disable(mtk);
 
 disable_pm:
-	pm_runtime_put_sync_autosuspend(dev);
+	pm_runtime_put_noidle(dev);
 	pm_runtime_disable(dev);
 	return ret;
 }
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
