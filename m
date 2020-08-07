Return-Path: <SRS0=9FsO=BR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82258C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 13:19:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 540F32086A
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 13:19:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dAuHGgDR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3+w16/v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 540F32086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fzn0+Hxz9Vz7MmkhEfqsMft60My9vB+cgYKDhLnavMM=; b=dAuHGgDR2hJsERpToMK1bEKu3Y
	x3iPYKrDxymAtSCsH7o4nF+6l9KAvdR7eZ1obkvLWIIeZnfY7ar4pLKCVSVQ2BtfOZYXU26ltBBYp
	c5cE1RffuW74n+sJ9bRj622ym84dMdacT9xvgUb/l3J//WKMvA/LY/H6ZqaLpmm53oX2n5wPk+91G
	WNG+fmuo4mXUXGh84yvilH44cN/pEEfZACO97krUlLOFV9x851kV6GXkkend2fALqLqABWq/DW6lD
	uLOxfIO/3QfLkVMr33Tl8x4t5P2OX3yIqaLIr9AX0iiK3ZNcXK37b+nj5p9rqgfMgFE0uDUu3be/U
	DhJh5L1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k42HH-00084z-TH; Fri, 07 Aug 2020 13:19:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k42HE-00083z-1X; Fri, 07 Aug 2020 13:19:16 +0000
Received: from ziggy.com (81.172.57.81.dyn.user.ono.com [81.172.57.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E29522086A;
 Fri,  7 Aug 2020 13:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596806354;
 bh=90W/RlmEX3PAdf4oEsZD+boIBLyjUS1TrXoIlmoXv6M=;
 h=From:To:Cc:Subject:Date:From;
 b=K3+w16/vPkbiOROuEmRUBKt2EyFZDHkhwM5D5RPR/xWJI8gBlWeT59Be2kccdeeRA
 sQapHJNEC+JUFGTMpNd6O9xDexL3aIIAvw7Ip+Un4iDC7tbW0jmLN+maSqoWj7tUOr
 RRdZl8udmoxeaVGeBQbK1KrJszBNor5PMilIcjUU=
From: matthias.bgg@kernel.org
To: qii.wang@mediatek.com, matthias.bgg@gmail.com, wsa@the-dreams.de,
 yingjoe.chen@mediatek.com
Subject: [v2] i2c: mediatek: Fix i2c_spec_values description
Date: Fri,  7 Aug 2020 15:19:04 +0200
Message-Id: <20200807131904.6515-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200807_091916_185034_E7E63F02 
X-CRM114-Status: GOOD (  11.45  )
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
Cc: Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <mbrugger@suse.com>

The struct i2c_spec_values have it's members documented but is
missing the starting '@', which leads to warings like:

drivers/i2c/busses/i2c-mt65xx.c:267: warning: Function parameter or member 'min_low_ns' not described in 'i2c_spec_values'

We also delete min_high_ns member as it is not used in the code.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---

Changes since v1:
delete mint_high_ns member

 drivers/i2c/busses/i2c-mt65xx.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
index e889f74703e4..efc14041d45b 100644
--- a/drivers/i2c/busses/i2c-mt65xx.c
+++ b/drivers/i2c/busses/i2c-mt65xx.c
@@ -253,14 +253,13 @@ struct mtk_i2c {
 
 /**
  * struct i2c_spec_values:
- * min_low_ns: min LOW period of the SCL clock
- * min_su_sta_ns: min set-up time for a repeated START condition
- * max_hd_dat_ns: max data hold time
- * min_su_dat_ns: min data set-up time
+ * @min_low_ns: min LOW period of the SCL clock
+ * @min_su_sta_ns: min set-up time for a repeated START condition
+ * @max_hd_dat_ns: max data hold time
+ * @min_su_dat_ns: min data set-up time
  */
 struct i2c_spec_values {
 	unsigned int min_low_ns;
-	unsigned int min_high_ns;
 	unsigned int min_su_sta_ns;
 	unsigned int max_hd_dat_ns;
 	unsigned int min_su_dat_ns;
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
