Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2510AC4707B
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 00:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYHdF7M2JA2Os3Ze2MXMcXt7UAIr3BwUBemc85eDGww=; b=VX13M5ygg/t7S44DlOFLtozTRR
	o2am24awwl/uIA7I5O/I6H4ysR8Oy/3FtbO5AV6P9sn9qCwfdK+xeKCdEHvP9C/82SR4HYLrmv062
	s7WTE+LLl/Tneayjo+GASu0sMG43g+3+kLHT/P/UaBeqj48qa20rWN1hnNlwCTwzhnx0ny1FMHWzK
	qujw2chMZ9icCjlWa71CxRHYqtSEJ4L5L+uvy8r5hNlMcw73iE6DDModmbpVNhhU6EO2mE1TirFNx
	YcctYvlxbzqtCIM4ra1F4QLtk84+cGwVC/3tTKWXhWI24bU4MvJRPKn2b6COjvgHAlYdMLk236LWI
	i7cMNzfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPXJ9-00AWBI-38;
	Tue, 16 Jan 2024 00:27:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPXJ5-00AW9A-2d;
	Tue, 16 Jan 2024 00:27:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4EF4760C00;
	Tue, 16 Jan 2024 00:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC4EC433C7;
	Tue, 16 Jan 2024 00:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705364875;
	bh=Y67cUuFJI5aY+io96TyP975DXQR8IpMMsE9LcifCNus=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NuYI1jUaXx0Zz3AhlTjym4PXstUaT1Sm4h+OWgC4RGTDqbclZ6FzPiFTmfI0E4UGt
	 KSY8ayWSzT1rcgPLCIz1BWPp65oJvQP6Lli0uKoJD3etu7OXxW50Ps5PSYZvoNjtcp
	 AN97N+gjylH5rbuAtk9vi4N/zBVc1/fa349+nshLVfnlCCrYfl72MUzUg1npk0v/5q
	 k6Afby8LWL3Pu/YOhRDaTERS22gbxvNIPxg0IbBYv5JJiW2YSEVBd2b4sMB/TCuGQ+
	 lRAzPY+IQFZfuP6Sv1DlL0g5hK9MwAH363A6XUXyekNPcaLUJOCX77DSdGC+/aeYSU
	 ej+sIkxArAH9w==
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
Subject: [PATCH AUTOSEL 5.4 07/12] pstore/ram: Fix crash when setting number of cpus to an odd number
Date: Mon, 15 Jan 2024 19:27:13 -0500
Message-ID: <20240116002731.216549-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116002731.216549-1-sashal@kernel.org>
References: <20240116002731.216549-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.4.267
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_162755_934959_77BA8885 
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
index 65cbc8a60ca3..9f83d8eba0e6 100644
--- a/fs/pstore/ram.c
+++ b/fs/pstore/ram.c
@@ -563,6 +563,7 @@ static int ramoops_init_przs(const char *name,
 	}
 
 	zone_sz = mem_sz / *cnt;
+	zone_sz = ALIGN_DOWN(zone_sz, 2);
 	if (!zone_sz) {
 		dev_err(dev, "%s zone size == 0\n", name);
 		goto fail;
-- 
2.43.0


