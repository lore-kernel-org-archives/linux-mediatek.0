Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CC1C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Mar 2022 12:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JI+GcNslrEp7/C7SFdn5T8auk5+aJgbUyx4SxWMg3z4=; b=cIUX8iPOrbBnEV
	2fASbT8+yo2TdfYC8m9o6vKvuwix1orSBz//AzBjywjegTvwaRs+1ayrB627Y8741HdLg2bNOQRkv
	rfq/I3HyxEaKuPtrETsgrVbnjMAikX+q8tN8/Yc9bB5r3iIqswvqCJlH9QUaRNQdBlGN3Yb6Qp17y
	6LuEy6hgRq/zOd60NGlRlzkjQPHlPP+oM0cLEWQSN67JNPgDohcSbKBJqC4LukxrHMQeizjWDS3ng
	K9E68dGc3jYP76FNYaYUG3QWfOUjr0gJJe1odz9CrVShJj9isFGAFt9aBbcQemZ7/JIKIUBVU4vyw
	zc1xIwJHivFBlYMxHIqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYopy-008b6o-Fv; Mon, 28 Mar 2022 12:51:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYopj-008b4o-W5; Mon, 28 Mar 2022 12:50:59 +0000
X-UUID: c4b8a34c467040748878c7395a87fd6c-20220328
X-UUID: c4b8a34c467040748878c7395a87fd6c-20220328
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xiaobing.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1756619284; Mon, 28 Mar 2022 05:50:46 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Mar 2022 05:40:44 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 28 Mar 2022 20:40:30 +0800
Received: from mbjsdccf07.mediatek.inc (10.15.20.246) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 28 Mar 2022 20:40:29 +0800
From: Xiaobing shi <xiaobing.shi@mediatek.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 Xiaobing shi <xiaobing.shi@mediatek.com>
Subject: [PATCH] remoteproc: avoid array index out of bounds in debugfs file
Date: Mon, 28 Mar 2022 20:34:13 +0800
Message-ID: <20220328123413.18169-1-xiaobing.shi@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_055056_049004_FCEA9808 
X-CRM114-Status: GOOD (  10.78  )
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

There is a negative offset of an on-stack array that causes an out of
bounds issue when someone called with a zero 'count' argument to
syswrite().

	buf[count - 1]

We should add an extra check in rproc_coredump_write() to prevent the
access.

Signed-off-by: Xiaobing shi <xiaobing.shi@mediatek.com>
---
 drivers/remoteproc/remoteproc_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
index b5a1e3b697d9..581930483ef8 100644
--- a/drivers/remoteproc/remoteproc_debugfs.c
+++ b/drivers/remoteproc/remoteproc_debugfs.c
@@ -76,7 +76,7 @@ static ssize_t rproc_coredump_write(struct file *filp,
 	int ret, err = 0;
 	char buf[20];
 
-	if (count > sizeof(buf))
+	if (count < 1 || count > sizeof(buf))
 		return -EINVAL;
 
 	ret = copy_from_user(buf, user_buf, count);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
