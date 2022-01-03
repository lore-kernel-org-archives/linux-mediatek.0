Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C8EC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jan 2022 17:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FVI6f80hwQwdxOT3bsNGF5B67fgDB/HczuZPCDnLfGI=; b=q45rCQMH9y8mBV
	tKwBiG0zbHxUu/0U11AjR820bET5m4KCIY07bYyzI+aVmktSgCMqcxwDL1oBxU2nrX/kkG65pC5nD
	3e32GzLT8KLE3aufg3UfY8E8TqIKfEIJ7N8PLMv5q/nPpS5QPreCwf+sHDqAHkGN4LEW8OyhGgP/D
	jIPsC142RitVmt7na/uFr8Oz712QEAZ7azBgcYIflzgJFhLMASXMhNLyJz/hz7r0KpEPvj+oJeb03
	u/dKLwAK2PjIZ/9gfeQwgpXJTAa0KcJOPdO5nBBJyYaio5f6H6RkUYTncZPl6+rKOG+/T3uC113Yv
	7Juqp/ONnLhxjegM6mLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4RBQ-009h6j-SP; Mon, 03 Jan 2022 17:31:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4R9p-009gFy-1q; Mon, 03 Jan 2022 17:30:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 929EB6119F;
 Mon,  3 Jan 2022 17:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FBCC36AEE;
 Mon,  3 Jan 2022 17:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641231004;
 bh=uTWJxd6YdVohd2Y6L/UFfKfbHIuT4KvjE1DEYgZLAUM=;
 h=From:To:Cc:Subject:Date:From;
 b=MD8EJSZ9sArtCX1OOyf64vZigCW/HmqN+5fiTrXU2Li7txmccw82lSJcLdyY520Jj
 Unafmz6Xah5wGpIZM4AtIJ5UI4a5h/kNkYAzKn6BujgTonh6BAxmgQehYtSGzu5NSJ
 MdC6pG3mL9PaHz9AHHsFwzmu4ZRiQ27iHsNBeBMwg+kxqotoIK96n8ANdftzDV0/V8
 hWD28rvvJWfhQcPDEiUtL88YWqVmc9JTPkCkI3iseaOsxtTXRJqZZxNCCVjaC1k1EC
 bLStN4vdMpwgnxM++ljaPBZmunm39gDNXOIO/ao+vMpB9eFTwT7DhhRM9eYRAYSNYL
 oDoMiU68ZCyJQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, matthias.bgg@gmail.com,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 1/8] usb: mtu3: fix interval value for intr and
 isoc
Date: Mon,  3 Jan 2022 12:29:54 -0500
Message-Id: <20220103173001.1613277-1-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_093005_176785_5EF719D8 
X-CRM114-Status: GOOD (  12.24  )
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

[ Upstream commit e3d4621c22f90c33321ae6a6baab60cdb8e5a77c ]

Use the Interval value from isoc/intr endpoint descriptor, no need
minus one. The original code doesn't cause transfer error for
normal cases, but it may have side effect with respond time of ERDY
or tPingTimeout.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Link: https://lore.kernel.org/r/20211218095749.6250-1-chunfeng.yun@mediatek.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/mtu3/mtu3_gadget.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
index 0b3aa7c65857a..ae480ab1415b9 100644
--- a/drivers/usb/mtu3/mtu3_gadget.c
+++ b/drivers/usb/mtu3/mtu3_gadget.c
@@ -77,7 +77,7 @@ static int mtu3_ep_enable(struct mtu3_ep *mep)
 		if (usb_endpoint_xfer_int(desc) ||
 				usb_endpoint_xfer_isoc(desc)) {
 			interval = desc->bInterval;
-			interval = clamp_val(interval, 1, 16) - 1;
+			interval = clamp_val(interval, 1, 16);
 			if (usb_endpoint_xfer_isoc(desc) && comp_desc)
 				mult = comp_desc->bmAttributes;
 		}
@@ -89,7 +89,7 @@ static int mtu3_ep_enable(struct mtu3_ep *mep)
 		if (usb_endpoint_xfer_isoc(desc) ||
 				usb_endpoint_xfer_int(desc)) {
 			interval = desc->bInterval;
-			interval = clamp_val(interval, 1, 16) - 1;
+			interval = clamp_val(interval, 1, 16);
 			mult = usb_endpoint_maxp_mult(desc) - 1;
 		}
 		break;
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
