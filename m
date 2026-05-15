Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36819CD4F25
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2026 15:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yZEM/z3Ytg1ApbnIMKeC+6PyJ3FnTIOMTbeYSCB5PQ8=; b=Mdr35f4zPbAU1CU2HwqV9Massf
	kuZxpoJMOPnh7KTH3MAWbOwVap/n/EOsylv+XvB3UUwGbxe7SOJj9HvBhuzNZaHqVEm17+oj4YUts
	Yi1dUe5JBnhQJmuX4f6IdNmAqy1q7BovJjCz9WdhxHZqpG3x7cWgSVUD/yWweelc5hSUHsAjp0ynp
	5qLDA09B/r81g671X/Rw1B9EyYVK7ms/5DFOYpnGRPMdvNOxXBzj7G9NQkvCurbDNpm64HtDQPlsp
	m0VCW67hH/Mt5bcsI5r2YkGRmEToPHSZwW1cZ+BVWa9IGAEpb1qOFBZJHDKVjNVgi8/ub4ymONA+S
	yOQ1w8nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNub3-00000008lmZ-495Z;
	Fri, 15 May 2026 15:37:05 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNuaw-00000008lhd-2uxo
	for linux-mediatek@lists.infradead.org;
	Fri, 15 May 2026 15:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=yZ
	EM/z3Ytg1ApbnIMKeC+6PyJ3FnTIOMTbeYSCB5PQ8=; b=cU5rJ3oPOgHfFuqlgX
	40zx1/2+mkM6jI8DwNUPNtit/9LDtzbGN5MBdiKovRnBvnV4hk6yU2T2ibi1rFTX
	mHTVRyAxFD1189z5trF+8aLY04TNOmHUQDSj+cTfL/UelGm468K4t803PEg7i6nN
	JBLWMp53LDkoUIk/shqRhY/xY=
Received: from zhb.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wD3z9KEPQdqL74mBg--.53735S2;
	Fri, 15 May 2026 23:36:37 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	mani@kernel.org
Cc: ryder.lee@mediatek.com,
	linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH] MAINTAINERS: Remove invalid email for Jianjun Wang
Date: Fri, 15 May 2026 23:36:35 +0800
Message-Id: <20260515153635.136054-1-18255117159@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3z9KEPQdqL74mBg--.53735S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF1fCFyfJrW3ZrykZr13Arb_yoW8Xw17p3
	93Krn5ArWDJr47JF48Wa13t3WfX3yvgFyUKwsFg340qr15Zrn0qa40934Ut3ykCry8C34Y
	yryIgr1kuFyUAFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0p_xR6UUUUUU=
X-Originating-IP: [240e:b8f:91b3:d000:79ec:4c96:c180:869b]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbCxAXMcGoHPYW3OQAA3m
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_083659_193790_5CB41049 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
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

Email to Jianjun Wang <jianjun.wang@mediatek.com> bounces with error:
"550 Relaying mail to jianjun.wang@mediatek.com is not allowed".
Remove the address to avoid sending future kernel maintenance queries
to an unreachable destination.

The MediaTek PCIe driver remains supported by Ryder Lee.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
Hi Bjorn and Mani,

Recently, when replying to emails in the Linux community, I kept
encountering that Jianjun Wang's emails were being returned. The
detailed information is as follows:

"""
Dear user 18255117159@163.com:
Sorry to inform you that your email (send to jianjun.wang@mediatek.com) has been returned. The details are as follows: 

 ------- Original Mail Information -------
Time:2026-05-15 23:04:39
Subject:Re: [PATCH v2 6/8] PCI: aardvark: Add 100 ms delay after link training
To:jianjun.wang@mediatek.com
Relpy Code:
SMTP error, RCPT TO: Host mediatek.com(1.203.163.78) RCPT TO said 550 Relaying mail to jianjun.wang@mediatek.com is not allowed 
"""
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6aa3fe2ee1bb..b2609dc33c62 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20745,7 +20745,6 @@ F:	drivers/pci/controller/dwc/pcie-intel-gw.c
 
 PCIE DRIVER FOR MEDIATEK
 M:	Ryder Lee <ryder.lee@mediatek.com>
-M:	Jianjun Wang <jianjun.wang@mediatek.com>
 L:	linux-pci@vger.kernel.org
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
-- 
2.34.1


