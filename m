Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692D0C4167B
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Nov 2023 07:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EIqL2tD5DZPZv4cReb9xm7HmNydPz9ibyBpjJNHePvQ=; b=W1W4EvYceEAdkrnYtbNmM/CEJS
	wACShdMiW65lMpqYqKiufQqVkXM/jVJmbx+NH6zarJESpKxyVwXroj9pcnKCgfIZz+sICXbVLLW/X
	uKoREirmCThCY7pIN7+K9QDNZOwMYwZOsAYGvpTvXMcR9I263h1VEqqT/Vy3dwNjACiExRukHvqOx
	w/Rpshonr3lmdEQ/I5TPTCssFdIq5XWjx1i1/dhv98Nu3vUPIAMwumXRpMU/dsvweECF9crP3tkTD
	kWNRQM3qJwAygnKV1BXMsp+ALfA3AIyhyMUopA0k00bC/vRl0gPfKMGPPH1qxUZBaBRSrY/zNv34I
	HitPVD6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7sx9-004Sst-14;
	Tue, 28 Nov 2023 07:56:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7sx6-004Src-27;
	Tue, 28 Nov 2023 07:56:18 +0000
X-UUID: 97b86fc28dc311ee9b7791016c24628a-20231128
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=EIqL2tD5DZPZv4cReb9xm7HmNydPz9ibyBpjJNHePvQ=;
	b=isnw1ekp5u0CfZw4wekAgZfg5/+Tcbno+jOSORjqH6t/7Sv8iE8ciyHQEWM08Q4p0RJpZy/5FSuyJByQOdubPFR2vH1ZbzRPGcnQyA5lF49+3mcwewgPGnIhQ5zKcTwE45Ar4MZTCZB1/XHjhFcNZngWBv+fbnfbWzlsmHYjN6A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.34,REQID:893e10b2-abb4-48e3-9917-589ed2841e27,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:abefa75,CLOUDID:3f1e2873-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 97b86fc28dc311ee9b7791016c24628a-20231128
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 981155918; Tue, 28 Nov 2023 00:56:09 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 28 Nov 2023 15:55:34 +0800
Received: from mszsdtlt102.gcn.mediatek.inc (10.16.4.142) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 28 Nov 2023 15:55:34 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
	<glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov
	<dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, "Andrew
 Morton" <akpm@linux-foundation.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <kasan-dev@googlegroups.com>,
	<linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <xiaoming.yu@mediatek.com>, Haibo Li
	<haibo.li@mediatek.com>, kernel test robot <lkp@intel.com>
Subject: [PATCH] fix comparison of unsigned expression < 0
Date: Tue, 28 Nov 2023 15:55:32 +0800
Message-ID: <20231128075532.110251-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.749500-8.000000
X-TMASE-MatchedRID: iv01+ZwXeFIryFHbNnBLG0Zakoam9+aebT2gc93yznn9Ez/5IpHqp8lm
	7UT8OKjb009cKtuMq44lKzzhiO1jPncna+FgAjo0nVTWWiNp+v/jxSCk4x2AYd9RlPzeVuQQObA
	90TJq6C8/ApdYBbUVKYAy6p60ZV621gi3JUE8ePKSkBrqwsq4PfoLR4+zsDTttrrTuahHzlFU1G
	84il7EfntKKivhCrlfE0eoKE0hYr807dg5hv5gH9S5x4PKrQ/8rxK9BaJJfxtRJt1IVZ02lKixa
	UIRQLoOAGAn9m+WxPvyNp7g4PXe0BXsxz6ujBxUq1f8XSkHBUmNJXmEMVvLtpRMZUCEHkRt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.749500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 181391F854EACAAB2F00F5A6344B770795AAFA39D774CB1EEFDEC7134135C8032000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_235616_702260_699C6A39 
X-CRM114-Status: UNSURE (   9.67  )
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

Kernel test robot reported:

'''
mm/kasan/report.c:637 kasan_non_canonical_hook() warn:
unsigned 'addr' is never less than zero.
'''
The KASAN_SHADOW_OFFSET is 0 on loongarch64.

To fix it,check the KASAN_SHADOW_OFFSET before do comparison.

Signed-off-by: Haibo Li <haibo.li@mediatek.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/
  202311270743.3oTCwYPd-lkp@intel.com/
---
 mm/kasan/report.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index e77facb62900..dafec2df0268 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -634,10 +634,10 @@ void kasan_non_canonical_hook(unsigned long addr)
 {
 	unsigned long orig_addr;
 	const char *bug_type;
-
+#if KASAN_SHADOW_OFFSET > 0
 	if (addr < KASAN_SHADOW_OFFSET)
 		return;
-
+#endif
 	orig_addr = (addr - KASAN_SHADOW_OFFSET) << KASAN_SHADOW_SCALE_SHIFT;
 	/*
 	 * For faults near the shadow address for NULL, we can be fairly certain
-- 
2.18.0


