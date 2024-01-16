Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E0AC3DA79
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 00:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1r4GUf/BmEHlUJMXTx7bS03sJUx6gksHER0TJdo+FBU=; b=mkbRctHB6YUmx56L41GMpSCVhD
	2n3hl3VuCutfpYhmyBHFzsBd9LqpqWsR4x0cZ+IfXxIjztgZ3riB5J5OHF7c4ezzwKv+a9xWFMB05
	NLrABnjb/rSdwRacqJNq5JjgdaA+LaG36DezQiNAphSfT5mDMlnkqq53168G5TcMCiwZ7gv642nvB
	cUqnhiUAZ/X2soqN95E/SxNKD+zKNBHhx8tx5ipeOk5Mq4+3oZsvx6nhEx1G2/NiYurl7n9VJ87lV
	lZmr6kb/jHPR4h6zzkuS7dq1V91ac5G7IdYiK8wmIbzRdQcqRrP5/iVKx9Y/HXuA1f1+vVqPnmMSL
	BROLYehQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPXFy-00AV4S-2B;
	Tue, 16 Jan 2024 00:24:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPXFu-00AV2j-2Y;
	Tue, 16 Jan 2024 00:24:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C777BB80D4A;
	Tue, 16 Jan 2024 00:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5916DC433C7;
	Tue, 16 Jan 2024 00:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705364675;
	bh=BOcYem1Z7/qXXdzAEn6zt6OieCnjfBG4m5itEtHWuHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LS8GDq+L4ZcGJ/imqbl0BQA76vWi0Zae0cjT0NvJeNSqs2Hmwlwn038JaBWw2C6P5
	 YD6Rn993ZIhlfhrTRhky3JKh8eLCIr2C422lmkak6CVasA0TqvfE7CLk7ATZ2Qmf5k
	 F/ozgbdrrIHXG2hSxGixSrFtCJBmt/CM6vcruKX2O08R16B26NZOnAOos9IszlGFMZ
	 iMH9twOEuGNQrQe6ug55PFgoOJN3+v/RXHHbak0w2wHT8YZsdZWEnpub/d5WluhyfS
	 LS4C48fNfZoAcIf/dGm+nlcNE2J9xpmuQcx/WeFpqqUu2SIqLmL8AZf/Bkv2q7Fouj
	 X/NgvyfyWnngA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Weichen Chen <weichen.chen@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Kees Cook <keescook@chromium.org>,
	Sasha Levin <sashal@kernel.org>,
	angelogioacchino.delregno@collabora.com,
	linux-hardening@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 09/19] pstore/ram: Fix crash when setting number of cpus to an odd number
Date: Mon, 15 Jan 2024 19:23:44 -0500
Message-ID: <20240116002413.215163-9-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116002413.215163-1-sashal@kernel.org>
References: <20240116002413.215163-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.12
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_162439_856836_121E2765 
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

From: Weichen Chen <weichen.chen@mediatek.com>

[ Upstream commit d49270a04623ce3c0afddbf3e984cb245aa48e9c ]

When the number of cpu cores is adjusted to 7 or other odd numbers,
the zone size will become an odd number.
The address of the zone will become:
    addr of zone0 = BASE
    addr of zone1 = BASE + zone_size
    addr of zone2 = BASE + zone_size*2
    ...
The address of zone1/3/5/7 will be mapped to non-alignment va.
Eventually crashes will occur when accessing these va.

So, use ALIGN_DOWN() to make sure the zone size is even
to avoid this bug.

Signed-off-by: Weichen Chen <weichen.chen@mediatek.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Tested-by: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Link: https://lore.kernel.org/r/20230224023632.6840-1-weichen.chen@mediatek.com
Signed-off-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/pstore/ram.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
index d36702c7ab3c..88b34fdbf759 100644
--- a/fs/pstore/ram.c
+++ b/fs/pstore/ram.c
@@ -529,6 +529,7 @@ static int ramoops_init_przs(const char *name,
 	}
 
 	zone_sz = mem_sz / *cnt;
+	zone_sz = ALIGN_DOWN(zone_sz, 2);
 	if (!zone_sz) {
 		dev_err(dev, "%s zone size == 0\n", name);
 		goto fail;
-- 
2.43.0


