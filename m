Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48107C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jul 2022 02:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6xeI5fNAsGuZCYRpmm86LumLOaMx8ngE0EkeExry2HY=; b=kGCC7ruKfjCsSfb1yL0Z6Wx2J8
	uZHHRxRGnmwJQV988nl+qPauq2H8wrr52gX1edgbhwEza6KQzkQQ56TQn50W0/XTu6KqJvxGG6oDy
	jnxqQmxBw1SZtclksf5+FrOm8NExtPQ2PqYB3PcvUQ/15C30fa5wmtI/8W2Fq30eehKd1kZyvJp0s
	AdD+0S6Uk0lKTGWoHeIvlZA+1PqjvEzJNXWXzYTs1FU/o6isQBM9xpEjl6mbb0teo7MA3gBT535MD
	04uJwU4wF21KQss9LuKQMY9G2XascQiG2leB/cgqtrEmv/JtklG+FHnXa2bpzi7cX0oEth97inCMa
	X0HMa9dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8BiO-003Unq-Td; Mon, 04 Jul 2022 02:21:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8BiL-003Uju-Id; Mon, 04 Jul 2022 02:21:30 +0000
X-UUID: 4f248f3201f04947b82d7141fd7c9921-20220703
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:8cf74526-6f4e-4fb6-a497-6893bf576f80,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:c5c46f86-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 4f248f3201f04947b82d7141fd7c9921-20220703
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 522663982; Sun, 03 Jul 2022 19:21:23 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 4 Jul 2022 09:40:48 +0800
Received: from mszsdtcf10.gcn.mediatek.inc (10.16.4.60) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 4 Jul 2022 09:40:48 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: Sami Tolvanen <samitolvanen@google.com>
CC: <xiaoming.yu@mediatek.com>, Kees Cook <keescook@chromium.org>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Peter Zijlstra
	<peterz@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, =?UTF-8?q?Andr=C3=A9=20Almeida?=
	<andrealmeid@igalia.com>, Luis Chamberlain <mcgrof@kernel.org>, Juergen Gross
	<jgross@suse.com>, Haibo Li <haibo.li@mediatek.com>, Tiezhu Yang
	<yangtiezhu@loongson.cn>, Aaron Tomlin <atomlin@redhat.com>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 0/2] cfi: free old cfi shadow asynchronously
Date: Mon, 4 Jul 2022 09:40:44 +0800
Message-ID: <20220704014046.34596-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220703_192129_664146_16E56B62 
X-CRM114-Status: UNSURE (   9.19  )
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

This patchset changes synchronize_rcu to call_rcu in update_shadow.

Patch 1 enables the CFI sanitization for cfi.c and 
bypass __cfi_slowpath_diag.
It is the prerequisite for using call_rcu in cfi.c.

Patch 2 changes synchronize_rcu to call_rcu and
free old cfi shadow in rcu cb

Changes in v2:
 - Remove _run_cfi_check,add __nocfi to __cfi_slowpath_diag directly
 - Rename _cfi_shadow_free_rcu to free_shadow

Haibo Li (2):
  cfi: enable sanitize for cfi.c
  cfi: free old cfi shadow asynchronously

 kernel/Makefile |  3 ---
 kernel/cfi.c    | 14 +++++++++++---
 2 files changed, 11 insertions(+), 6 deletions(-)

-- 
2.25.1


