Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A60C4707B
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 00:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9o4fJOuImUkYjqx5qB+NgTdRzXMR3WNhm1CDpm9iDdQ=; b=jjiNcnYcpdUvwCMQDij9u2Aqny
	BpRVtmDGPji+I8GwpaA5P/4uqfbJWmSq+WEIs6TILaceEqBEhHVnyXJ0cY0UdwyY6tF4hSObx+0eR
	ShPFW15izhdaRvSG6dnGzdRzHAqnxtzUUg6R8w/hwHU93Y9fcgXy/hU7jFZf6d33kVCgFoHi0ZZrn
	I/eOojQKU+A4b0feqlaSAnkGOVbhfqSUJGbyaDp1gTECM+MyHHmjDb6TZqcH7G6nETkIYXbh+59nh
	VnTVwQDExluMTg9TJ0YU6YgP3KeLWiwpTecvthlsWUszmvF1Abu/1yCgQ1N+zByZ270b9bTOa0raj
	qMIZmpxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPXHK-00AVUr-2c;
	Tue, 16 Jan 2024 00:26:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPXHH-00AVTK-0C;
	Tue, 16 Jan 2024 00:26:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7931F60FA5;
	Tue, 16 Jan 2024 00:25:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD1EC43399;
	Tue, 16 Jan 2024 00:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705364732;
	bh=NxpqsO3yj33VWaO2m8CzkxJFAAtKW59jzjIbaK632fk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=otqw73qmwZjq0ZdIym7HSK3y2LTeiUpBikBfH4wVeTdjzQAyIlz/FtCSau7Qe6FwF
	 a3aWkS0RTMp0gQSlaJmGhFcuLA5JhIumcNxo1OQheiGCP7HN/vBPG3zGxNazDpfLTD
	 vdmH61Zu+J/QU8QAFHkdKdSXvYMAip1m4DgB1vGxjbVqsDGV4kcP7gxv9N+LpxIDkx
	 YG1EyP/PqQuVNgbFD+EzGBDRWXJzgmahjxR1qwWqbnnkl2kv76jnESWocC7FUHeu+Z
	 LVj0v9WF4m3OOLSbtIo7QSfOd9Hh35YNDu4asIDzfR58M16AMT6Fb/Gem/9ZN5wC0C
	 8hewXmiSNHVtA==
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
Subject: [PATCH AUTOSEL 6.1 07/14] pstore/ram: Fix crash when setting number of cpus to an odd number
Date: Mon, 15 Jan 2024 19:24:49 -0500
Message-ID: <20240116002512.215607-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116002512.215607-1-sashal@kernel.org>
References: <20240116002512.215607-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.73
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_162603_139819_525DE881 
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
index f3fa3625d772..e15b4631364a 100644
--- a/fs/pstore/ram.c
+++ b/fs/pstore/ram.c
@@ -519,6 +519,7 @@ static int ramoops_init_przs(const char *name,
 	}
 
 	zone_sz = mem_sz / *cnt;
+	zone_sz = ALIGN_DOWN(zone_sz, 2);
 	if (!zone_sz) {
 		dev_err(dev, "%s zone size == 0\n", name);
 		goto fail;
-- 
2.43.0


