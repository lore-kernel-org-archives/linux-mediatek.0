Return-Path: <SRS0=cOAS=65=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31050C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 10:05:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F28EC2074D
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 10:05:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nrlx4Oxk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Fe4lJFqC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F28EC2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+gfV6xMC8e4P8pXJrdbPldR2KRTws/x1MysuQ6e82Ns=; b=Nrlx4Oxk5vJQKm
	yzWfrMaYqCB7Fh3W6sQE9baitPetDXW21Lf3jnzfWxn5ud2Kuvjl/gj/bBscf5ZJKH7NBv0yFiFgR
	RH2auj7+YYsG7vhMvJ43+qBm1Ak0XqWUhbXkA9kSwRUXFJwZ0+X3riHm+XrT1LB2hVk78gc9kF7Tr
	B6gMJEUU/f9h+VBjtr2EqptRDgxRbMTnnSJjNhrbahoTwC63ZiXsEY/ldJjTJkFkMxd/g1ZPzC9rM
	XdMDeFU+y3RFdt4OvJZu6FASxvdcWQlxiD6AksmJw8MC6rDOVPT/pv6HosEj42LDCIprcRLHlXXPK
	1+jB6KMhd73KcWMQpJ3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZXDt-0003cS-Mf; Fri, 15 May 2020 10:05:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZXDo-0003bR-27
 for linux-mediatek@lists.infradead.org; Fri, 15 May 2020 10:05:43 +0000
X-UUID: 5d8833c200f24c4f93169830d4fbdddf-20200515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=RQIWCw9E0EL8sgOkrQ+WbYahSgYK4T6So5anNQWya9U=; 
 b=Fe4lJFqClzO20Ko9TjlAERETtS112zMCSZdhfrMU2xDSalmj6/yg4dpn80UlfdfrVAdJwmh2ciNLXqnhYyIbZFiVuHwH5PuR6CZBmE10Gq6l2fYjgk16aL3QEDKc9qcZTfhAsC9riEuDViyLL+WcwUq4fmVPj6oY4kvNQJu2JjE=;
X-UUID: 5d8833c200f24c4f93169830d4fbdddf-20200515
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 938285106; Fri, 15 May 2020 02:06:01 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 May 2020 03:05:30 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 May 2020 18:05:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 15 May 2020 18:05:26 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
 <dm-devel@redhat.com>
Subject: [PATCH] dm: replace strncpy() with strscpy()
Date: Fri, 15 May 2020 18:05:28 +0800
Message-ID: <20200515100528.14341-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 704E7B1D95B5A2015993205326258A150957E452D2B16B36C86F62849D97192C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_030540_105945_02E38BE6 
X-CRM114-Status: UNSURE (   7.68  )
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
Cc: Miles Chen <miles.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Replace strncpy() with strscpy() to guarantee a NULL-terminated
string.

Detected by Coverity.

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/md/dm-ioctl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
index ac83f5002ce5..4dc3658e3351 100644
--- a/drivers/md/dm-ioctl.c
+++ b/drivers/md/dm-ioctl.c
@@ -1167,7 +1167,7 @@ static void retrieve_status(struct dm_table *table,
 		spec->status = 0;
 		spec->sector_start = ti->begin;
 		spec->length = ti->len;
-		strncpy(spec->target_type, ti->type->name,
+		strscpy(spec->target_type, ti->type->name,
 			sizeof(spec->target_type));
 
 		outptr += sizeof(struct dm_target_spec);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
