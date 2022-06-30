Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B021C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 10:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WyXee+VqlyPEtj+BLzx3+IrLoghIShb8caEBD0fsjSE=; b=cwfxI/lXdOLBwH+qltl5eGLZh+
	fqV5pYnWw0fia+gRu7xCFB2l+IOFyy9aVdw+mG7IFnSBIrfvHgURCJ7HlHISkvZ3MPYZZzYARxv2K
	AQn1hPjOj7E9vhDtR0sujiOoaFygqraG2mYTevSCznP1nJOIOsSnerLiSMTLNNOFl+0krbp4laej+
	xeyjw6lNu7VP32lRCn0zPh4YoxANp1I3U6mEDdNZJhEogY/HmGTcalBLHt8fr52AcUhu/geI+lvDy
	EymsHkwy/mfbItbir41XspWyEIYq6NkjEusC9H6vr0NleNUKqcyriRZypNVPtHcwrer10oiChfhRm
	7GulSBXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6rlD-00Gfne-SB; Thu, 30 Jun 2022 10:50:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6rht-00GeJX-Ch; Thu, 30 Jun 2022 10:47:34 +0000
X-UUID: ca4bc10a5e7142a4a9b3e5d9ca8c9e34-20220630
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:6563c418-2ea2-4ee8-8bd8-bb7424475960,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:87442a2,CLOUDID:9fa241d6-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: ca4bc10a5e7142a4a9b3e5d9ca8c9e34-20220630
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1316471158; Thu, 30 Jun 2022 03:47:29 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 30 Jun 2022 17:46:50 +0800
Received: from mszsdtcf10.gcn.mediatek.inc (10.16.4.60) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 30 Jun 2022 17:46:49 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: Sami Tolvanen <samitolvanen@google.com>
CC: <xiaoming.yu@mediatek.com>, Kees Cook <keescook@chromium.org>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Peter Zijlstra
	<peterz@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, "Christophe
 Leroy" <christophe.leroy@csgroup.eu>, =?UTF-8?q?Andr=C3=A9=20Almeida?=
	<andrealmeid@igalia.com>, Luis Chamberlain <mcgrof@kernel.org>, Juergen Gross
	<jgross@suse.com>, Haibo Li <haibo.li@mediatek.com>, Tiezhu Yang
	<yangtiezhu@loongson.cn>, Aaron Tomlin <atomlin@redhat.com>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>, <linux-kernel@vger.kernel.org>,
	<llvm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH 0/2] ANDROID: cfi:free old cfi shadow asynchronously
Date: Thu, 30 Jun 2022 17:46:44 +0800
Message-ID: <20220630094646.91837-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_034733_449570_4605E77D 
X-CRM114-Status: UNSURE (   7.94  )
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

Currenly, it uses synchronize_rcu() to wait old rcu reader to go away
in update_shadow.In embedded platform like ARM CA7X,
load_module blocks 40~50ms in update_shadow.
When there are more than one hundred kernel modules,
it blocks several seconds.

To accelerate load_module,change synchronize_rcu to call_rcu.

*** BLURB HERE ***

Haibo Li (2):
  ANDROID: cfi: enable sanitize for cfi.c
  ANDROID: cfi: free old cfi shadow asynchronously

 kernel/Makefile |  3 ---
 kernel/cfi.c    | 20 +++++++++++++++++---
 2 files changed, 17 insertions(+), 6 deletions(-)

-- 
2.25.1


