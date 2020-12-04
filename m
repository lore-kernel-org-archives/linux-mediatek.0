Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBBCEC4361A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 08:20:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D0B622581
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 08:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D0B622581
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P9Ei3hYHeZ/QxzSK/rgzl+4b9wLGxqZO9EwY3KT+XpI=; b=iLwg+GOR3BV3hP5s0wiRkibmFt
	0GLVBwWbaKe2v/QgsXVwlVt32P1ikWwpWXMbdeAFSDGDaWqImky05S/bbwrVHOuY+3JE0mA1gINuL
	B5NeIOlnux3Y5q+6bK48oyqc5ECM1jV8D39VV2+0Q1Jy6CAPwKIZu+z0F0bu5vv1lGOApQf/OXGa6
	JWPjUlS2Mkht9lyfVFzEiTbebmgytflBCJtm0OMFqkC3C0gBn8UTyaZeo9jsF6uIPn2aZ6V5Ab6Jt
	DgQsaJybumwrWo/FRmGGn5wLr47izP7HSbH1+FW3wQ+DsRJaNlaO5xZzOrQ+hSCW8mLnOcpNT/5Lt
	5wc02EjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl6Kf-00065L-CH; Fri, 04 Dec 2020 08:20:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl6Ka-000648-8O; Fri, 04 Dec 2020 08:20:45 +0000
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Dongchun Zhu <dongchun.zhu@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH] [v2] media: i2c: fix an uninitialized error code
Date: Fri,  4 Dec 2020 09:20:14 +0100
Message-Id: <20201204082037.1658297-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_032044_463903_727A53FB 
X-CRM114-Status: GOOD (  13.74  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

Clang points out that the error handling in ov02a10_s_stream() is
broken, and just returns a random error code:

drivers/media/i2c/ov02a10.c:537:6: warning: variable 'ret' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
        if (ov02a10->streaming == on)
            ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/media/i2c/ov02a10.c:568:9: note: uninitialized use occurs here
        return ret;
               ^~~
drivers/media/i2c/ov02a10.c:537:2: note: remove the 'if' if its condition is always false
        if (ov02a10->streaming == on)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

If streaming is already on, leave it that way and return success.

Suggested-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
Fixes: 91807efbe8ec ("media: i2c: add OV02A10 image sensor driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2:
- return success instead of -EBUSY, according to feedback from Dongchun Zhu
- remove incorrect advice from warning message citation
---
 drivers/media/i2c/ov02a10.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov02a10.c b/drivers/media/i2c/ov02a10.c
index 391718136ade..8683ffd3287a 100644
--- a/drivers/media/i2c/ov02a10.c
+++ b/drivers/media/i2c/ov02a10.c
@@ -534,8 +534,10 @@ static int ov02a10_s_stream(struct v4l2_subdev *sd, int on)
 
 	mutex_lock(&ov02a10->mutex);
 
-	if (ov02a10->streaming == on)
+	if (ov02a10->streaming == on) {
+		ret = 0;
 		goto unlock_and_return;
+	}
 
 	if (on) {
 		ret = pm_runtime_get_sync(&client->dev);
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
