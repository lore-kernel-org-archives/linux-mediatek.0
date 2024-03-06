Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F28BC5475B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Mar 2024 09:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ekRAdx9PacrM+v9N8B7aPw62g80zVfoirlx+37NhmtQ=; b=S1MTRP8YTKRiaBHHLJAMg+8E7x
	/hrzDXZNYu216jIDDA6+uspAZETqUst//2ijRYxlxAp8OuLwBLznLvVf0o+VZKXPguhvPrp3ZrmQX
	1xj0FHo9CcVlAObFntKi/VsfWvK0hIw78pNXSTgF0pSCGKKpk0wqqFfwaaGLjYqmeZ44hEF9spWMY
	4Jyf4Em1BQVIocqYr5NfunRAHpDK8cxWkpVxet8n9MzP4p+V8RkKt1rnM73rYSjeYCTwXk7570IIj
	uIzJPy1VNYR+4nWT7WigGndmpSg5dvEIlnmCf79DAkWRxBpaiZ0T2v9sXKupPoso2hq7FWn6ZXrnE
	1dmqfYFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhnlW-0000000HCjH-36x5;
	Wed, 06 Mar 2024 09:40:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhnlT-0000000HCeb-3EAc;
	Wed, 06 Mar 2024 09:40:44 +0000
X-UUID: 917e3c5edb9d11eea8a22560583bddef-20240306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ekRAdx9PacrM+v9N8B7aPw62g80zVfoirlx+37NhmtQ=;
	b=DNO8QwTPESmv3TC7DhSCetbJHh8NTV5szUqFOiz29AZ1rDP0131XamuPaU9zpHM+8zMp82ffHL2lvL3fCSGo9fcuSK3XhIF11aMiuq+uLww+ah7nBVCkdU0nowZgXR5C52PVvWEqWFImev05cJfZoNCcvr0ohPZLg8ECFbyw2so=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:6a4b5271-7a04-41c5-b1c7-9517c8ccb50f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6f543d0,CLOUDID:242f93ff-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 917e3c5edb9d11eea8a22560583bddef-20240306
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <chunhui.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 814359245; Wed, 06 Mar 2024 02:40:29 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 6 Mar 2024 17:40:25 +0800
Received: from mbjsdccf07.gcn.mediatek.inc (10.15.20.246) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 6 Mar 2024 17:40:24 +0800
From: Chunhui Li <chunhui.li@mediatek.com>
To: Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, John
 Ogness <john.ogness@linutronix.de>, Sergey Senozhatsky
	<senozhatsky@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>, Chunhui Li
	<chunhui.li@mediatek.com>
Subject: [PATCH] printk: fix _entry_ptr build warning
Date: Wed, 6 Mar 2024 17:26:47 +0800
Message-ID: <20240306092647.16010-1-chunhui.li@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.708200-8.000000
X-TMASE-MatchedRID: Z2f9DQPf1tkE7MuQrZP2o5dc7I2df+ms75oFMklhrnhGL0g1nVmkYVO4
	BD7nLMxnlTJXKqh1ne2/LclmUK1hkobzTO6asfbjyDp+jSvEtWv0O7M3lSnTW5soi2XrUn/Jn6K
	dMrRsL14qtq5d3cxkNRqXnrxrKCOXFcwn/U1iS4dD30h1PAU6P6/GTBhLbUgDqhGWfuPUaq93ob
	md2bsjHipWuuOW0EtOvAgHKzqJDgOL28eWhdXbLK92atjiJrAoF0aD5ljt43pMcHZD6gqu7wxMj
	fifIXfowkvVoA11Twp+3BndfXUhXQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.708200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 1CE3B773FBAD0C22075C8D3E0E295523F7348289C887245A523E5D76D60A61202000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_014043_819053_8D2F093F 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

We build with Werror and suffer build error when
enable CONFIG_PRINTK_INDEX, such as
gfp.h:223:2: error: unused variable '_entry_ptr'
ratelimit.h:31:3: error: unused variable '_entry_ptr'
kallsyms.h:172:2: error: unused variable '_entry_ptr'
[-Werror,-Wunused-variable]

Fix the warning by appending __attribute__((unused)).

Signed-off-by: Chunhui Li <chunhui.li@mediatek.com>
---
 include/linux/printk.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/printk.h b/include/linux/printk.h
index 8ef499ab3c1e..749c1c4257f1 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -392,7 +392,7 @@ struct pi_entry {
 				.level = __builtin_constant_p(_level) ? (_level) : NULL, \
 				.subsys_fmt_prefix = _subsys_fmt_prefix,\
 			};						\
-			static const struct pi_entry *_entry_ptr	\
+			static const struct pi_entry *_entry_ptr __attribute__((unused)) \
 			__used __section(".printk_index") = &_entry;	\
 		}							\
 	} while (0)
-- 
2.18.0


