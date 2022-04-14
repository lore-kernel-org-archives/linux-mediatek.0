Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B278CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Apr 2022 08:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rcXFbb5jG3oaVMUW+HX/GM4rQ5A4RIff4M5jHzYv+gw=; b=2n1S0ZmnODWfrP
	MCu8VoAVokX4T6Y9cI7a/qlIbQyrBKu+SGNXV6CbPYxk5ubOEMuSbQoKzS9hPREGgIu5lHnnAE/Ty
	CE6kWt8Avbplr4j7GCs+5gnNewb2iqtuzS/mjiV1w84t/g9cuBO1IyLjAgNW/Wnh8Z5r8hbXju+Ov
	Hl9Pfq0EokYrdE/Fm9mJR5KEVvxxDtyZjk6wAnoz354Z1LTYT5NMYyYV+t4P/BE4D7PwgDa0uBjkX
	aygqcI7UUzyr0tFwVu3bMcWAhsK0jCnQBl5z117Y+CfLJSARnR6SMHmw9vkRyPK+ZUd3/8Y59SVZ2
	W0xbJchAmPSNj6oLJKzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neuac-004Ttu-3T; Thu, 14 Apr 2022 08:12:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neuaZ-004Tsc-CS; Thu, 14 Apr 2022 08:12:28 +0000
X-UUID: 1b498b5d4c7f4b5fa1bc7c3f0715b8b2-20220414
X-UUID: 1b498b5d4c7f4b5fa1bc7c3f0715b8b2-20220414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1510360326; Thu, 14 Apr 2022 01:12:17 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 01:11:33 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 16:11:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 14 Apr 2022 16:11:32 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: Miles Chen <miles.chen@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH -next] sound/oss/dmasound: fix 'dmasound_setup' defined but
 not used
Date: Thu, 14 Apr 2022 16:11:18 +0800
Message-ID: <20220414081119.30851-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_011227_458603_9D34CB69 
X-CRM114-Status: UNSURE (   9.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

We observed: 'dmasound_setup' defined but not used error with
COMPILER=gcc ARCH=m68k DEFCONFIG=allmodconfig build.

__setup() does not work if MODULE is defined.
Fix it by warpping dmasound_setup with #ifndef MODULES.

Error(s):
sound/oss/dmasound/dmasound_core.c:1431:12: error: 'dmasound_setup' defined but not used [-Werror=unused-function]

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 sound/oss/dmasound/dmasound_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/oss/dmasound/dmasound_core.c b/sound/oss/dmasound/dmasound_core.c
index 9c48f3a9e3d1..a1b3e71beadf 100644
--- a/sound/oss/dmasound/dmasound_core.c
+++ b/sound/oss/dmasound/dmasound_core.c
@@ -1428,6 +1428,7 @@ void dmasound_deinit(void)
 		unregister_sound_dsp(sq_unit);
 }
 
+#ifndef MODULE
 static int dmasound_setup(char *str)
 {
 	int ints[6], size;
@@ -1470,6 +1471,7 @@ static int dmasound_setup(char *str)
 }
 
 __setup("dmasound=", dmasound_setup);
+#endif
 
     /*
      *  Conversion tables
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
