Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B506C3DA79
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 00:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkUCeoMb3oISw3CDI26FuV6EZE/61K+hVfWdtzNZcs4=; b=PlmWzZlUR5fyRlq5WzmcJOfjI8
	+UA4HPn41CJ86WMUG63Tx6FYjzHMnycA1PSYPNEbTKYE8EyHyk691r0FYTxo8jhWzmA4A3LFTJWXt
	Qstdfqa7ZzddE/DWAig18/sBkcVYV+W9CHz6zl611O9WR7wGejMZp8xeAjLQYyhDtvCNEukVkLYOs
	tb/drtKUuopstpzsfvLMDxRgTDOfSC5CWAtxlnlC+VMaDA2mDGAKAhkoTUsykxk5uqYRO65fvjMLE
	4Nm14SAdoTY+IHnqpT5A2kpAtG0HB6Cesy7A8QIiKX7JjXC/S6fY672iNPxhprhQUmodSHydJgP98
	cy661Zbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPXIs-00AW4D-1u;
	Tue, 16 Jan 2024 00:27:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPXIo-00AW2G-2d;
	Tue, 16 Jan 2024 00:27:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 46AC860BA3;
	Tue, 16 Jan 2024 00:27:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0414C433A6;
	Tue, 16 Jan 2024 00:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705364828;
	bh=PddBw6uDzqipD7P9eSsG2zgouGOp/A1QGYqGB+hWYys=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tNydv1QCOaiW2k5jGEUdEODQucaEZ3TsDUxTxvHuQFj8F3TOzbwIO3/vFjRkLeSW9
	 LoEQVR9K7vckp4e0ilET1e0NWaTNpVQwcsMPJJzFFS1eLfyL/hHmbxqrJDqmZDxa7F
	 KW8IBGVhYnFgeRMe4EosouY3RjjN8N8iuAy4Rt8jWsOGzomou7dedEtg/f24gbs9+6
	 l5b1C4Wwh2pfx8ATAsGOuFPueHvUBq5tWgI4S8k+1DJpSYtvY98yrgkoI7JEXLsMl5
	 16dbAUpGnUbeuBoEqY8kwktsCTJS9Fl0dbvHm4gkZ5zeRTOV5fzaBSjYOjkV2Ds8Wu
	 5oaFt86M0piFw==
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
Subject: [PATCH AUTOSEL 5.10 07/12] pstore/ram: Fix crash when setting number of cpus to an odd number
Date: Mon, 15 Jan 2024 19:26:32 -0500
Message-ID: <20240116002649.216260-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116002649.216260-1-sashal@kernel.org>
References: <20240116002649.216260-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.208
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_162738_897772_74B46C0D 
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
index 98e579ce0d63..44fc3b396288 100644
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


