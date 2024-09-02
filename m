Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D89CA0ED3
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Sep 2024 03:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2nK5QbU5dkc5U5TwQYN/wO/nlEp/eum7zig0Mq8CzQA=; b=emvEZ+/rb7330RKsqalQgG8Uwx
	dqhKS2Q57l+E7rps/gLJmIE2jkxe/UfLlrt8dpOdlaG3MMUYfZ+I1yiwWQ5R1nejka4ClNy0p7dkP
	L8ghc4/BkCDLEYgI4JWOLQpYl6oVeNbv1vbsG4P9LOwxfAJHxmBmKD1b+l4g6l8LjWeet/HdOg3B8
	fRw0sWzvbFNX2dvBjOtUOMHN/K+gtzRJoihLQux0T3ibdF2K3qcPM7wNhKaOPqQOWYQq1ALsRoFc5
	gZz381RHumhugOzMxDhlg779gBmCPEdiIHHV5kIKvhhgjr21PrxElx+i58/pN4V9KpwkJmnPTXtpK
	57O0MvRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skxTE-0000000Cp9u-19Y1;
	Mon, 02 Sep 2024 03:11:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1skxTB-0000000Cp9J-1fbE;
	Mon, 02 Sep 2024 03:11:10 +0000
X-UUID: fbb9b7f668d811efba0aef63c0775dbf-20240901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=2nK5QbU5dkc5U5TwQYN/wO/nlEp/eum7zig0Mq8CzQA=;
	b=jDQkMdQcGG2LNgty19i+pWnsKbV1A91GCIS1UN5ZZgAX/rql+fuKVibbSDjkun4wt9xMwISmNe8niwEV2AErE1RzJTheMyQ1y1/0I1sdcLNNig5UbEu9BejYtyEvkbCHJnFJ3Hpllwn0bvqIOqxOLLdD/ZLHDpfGlBrK+mo1OSw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:16edcba2-bff4-4f15-8667-3eec8865dfd2,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6dc6a47,CLOUDID:a34588cf-7921-4900-88a1-3aef019a55ce,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: fbb9b7f668d811efba0aef63c0775dbf-20240901
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <yenchia.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1741830572; Sun, 01 Sep 2024 20:11:01 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 2 Sep 2024 11:10:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 2 Sep 2024 11:10:55 +0800
From: Yenchia Chen <yenchia.chen@mediatek.com>
To: <stable@vger.kernel.org>
CC: yenchia.chen <yenchia.chen@mediatek.com>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, Len Brown
	<len.brown@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, <linux-pm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH 5.15 0/1] pm, restore async device resume optimization
Date: Mon, 2 Sep 2024 11:10:44 +0800
Message-ID: <20240902031047.9865-1-yenchia.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.129900-8.000000
X-TMASE-MatchedRID: JLcFkSgMIWN2Rany8ZWn3tOEZs/2oH3cCt59Uh3p/NWCsBeCv8CM/WAd
	cSpevRjQiHW59WKjt/cKqKe3zUn9YqPoJzzb7KzWhK8o4aoss8pKPIx+MJF9o5soi2XrUn/J8m+
	hzBStanvCLNfu05PakAtuKBGekqUpOlxBO2IcOBbEyMTWd4/m6PO/B9+EIe5KemHOHsKuv6TiRL
	HA99IRmBkGY5qDZgwhHFrKplBIbYwx59TrzsqD5L8cT6DUrvrGOPVhQvN7rWbBkGBTIlURuXoXD
	z8+lMxFpW+aIDJ4DaRzkxJ+SIkUjmncuUSUEdOX
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.129900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 3C10582E582375B77A6D1BA0557EB6A54834D49EE7523CB6CA1E816963D448C32000:8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240901_201109_466275_114BD55B 
X-CRM114-Status: UNSURE (   8.49  )
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

From: "yenchia.chen" <yenchia.chen@mediatek.com>

We have met a deadlock issue on our device when resuming.
After applying this patch which is picked from mainline, issue solved.
We'd like to backport to 5.15.y and could you help to review? thanks.

[ Upstream commit 3e999770ac1c7c31a70685dd5b88e89473509e9c ]

Rafael J. Wysocki (1):
  PM: sleep: Restore asynchronous device resume optimization

 drivers/base/power/main.c | 117 +++++++++++++++++++++-----------------
 include/linux/pm.h        |   1 +
 2 files changed, 65 insertions(+), 53 deletions(-)

-- 
2.18.0


