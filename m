Return-Path: <SRS0=iI7F=FL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E056CC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 08:52:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 669DD230FA
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 08:52:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 669DD230FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6bWpnRxiIqlDYaLLu2I/HM3W/IbOdFxzkBRe0ItU2I0=; b=E+eDUvVDaH1iMdniwurpjKCh4l
	z9c5vWW7nAMr0FnXuqDg34JxzdYuTX9hUtDEGpIugKy2Z3xZgnGlyVgBfcHyc3lJVM1vbOwZ+9Qlx
	s/y8fiqwcD9UW0VSmK4sJaXCimwa9wzhygCRyWzTHyMCstMyhY+lal4mFTJNZGSa8UKNlegxh30k9
	MxhQMrI6ln81qNSLfxgzoI13CFeA7mOGSzVfNK6vqP9kx3bUBcJTHCAk1i91JRPiluA+eBJ4e9kRY
	Yy0LqHlmFYc5u0Stl393da8RWKhT7YaTIVHoEffRUtIu0/B+1KL/eAf94kax99ag17yRxUN6GCqJc
	Gmtxfhmg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmCFL-0004qF-39; Mon, 07 Dec 2020 08:51:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmCFE-0004oQ-WC; Mon, 07 Dec 2020 08:51:46 +0000
X-UUID: 7ef1e1b2671a4dafba6b103fee71b0b7-20201207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=HkZGB8Q5d5I09+6MC7buRvKYyK1ZjfHaeTn8/3zNUYg=; 
 b=A+V3IzycH4YEKnkDFA5FE5b3l9dC0NZ0UUnEKdlzbGGoFESY+klAyjXDNTkb3WRXQlleN5GGYpUOmHckytdSu27aGK+neoh7OJ8MvlEVpcXh0l8kS3LTHwe06MmHaegoglMOVy25KNXFVFcUnFqL1TmXE/S6wzJXKFy0c+Iq2Go=;
X-UUID: 7ef1e1b2671a4dafba6b103fee71b0b7-20201207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1290582403; Mon, 07 Dec 2020 00:43:20 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Dec 2020 00:43:18 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Dec 2020 16:43:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Dec 2020 16:43:08 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Zqiang <qiang.zhang@windriver.com>, Andrey Ryabinin
 <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, "Dmitry
 Vyukov" <dvyukov@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 0/1] Fix object remain in offline per-cpu quarantine
Date: Mon, 7 Dec 2020 16:42:57 +0800
Message-ID: <1607330578-417-1-git-send-email-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: F870CAB994CC304B1F71C8C2A04196A3049B21FA10F0E5842595FF682C5B255B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_035145_249147_4106CB8B 
X-CRM114-Status: GOOD (  10.03  )
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
Cc: wsd_upstream@mediatek.com, Kuan-Ying
 Lee <Kuan-Ying.Lee@mediatek.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch fixes object remain in the offline per-cpu quarantine as
describe below.

Free objects will get into per-cpu quarantine if enable generic KASAN.
If a cpu is offline and users use kmem_cache_destroy, kernel will detect
objects still remain in the offline per-cpu quarantine and report error.

Register a cpu hotplug function to remove all objects in the offline
per-cpu quarantine when cpu is going offline. Set a per-cpu variable
to indicate this cpu is offline.

Changes since v4:
 - Rebase to linux-next
 - Remove the qlist_free for double free issue
 - Thanks Qiang, Qian

Changes since v3:
 - Add a barrier to ensure the ordering
 - Rename the init function

Changes since v2:
 - Thanks for Dmitry suggestion
 - Remove unnecessary code
 - Put offline variable into cpu_quarantine
 - Use single qlist_free_all call instead of iteration over all slabs
 - Add bug reporter in commit message

Kuan-Ying Lee (1):
  kasan: fix object remain in offline per-cpu quarantine

 mm/kasan/quarantine.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
