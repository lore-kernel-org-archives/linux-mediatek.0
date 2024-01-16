Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DC6C3DA79
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 00:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jpKjwI+K4WBa8l7dALrMVr0Y2oIH25StRIRqaoTr2Bg=; b=Ls1m5T+dLMH8s2dCzARR3JV7AJ
	uC9NI6ZnKmGlUvnPLJe89QXW3pEuc4Yr3ErS49QEGFmwK1qAw/ij9+Qug5Nz5Zl4vIKpMZRnz49Sl
	n/jIvreMDutk97Jb8mY7TyhteB7utM8KJKVPRIyB2oV/ZeMyGUHiqTvXtaAvAF1AnIhHrts1qNuwZ
	32iWQXSP9CMVuScmRnmM4p8MUyvJcLEM9NuxRKib6NWATpDJzRG+ZWHSfEBMmgQRh7PdmyqQdXZwx
	vOm0d88xrZauwXDgXDBBgbwpx9r8Cm9ngYm5VmLCrGkP7D0eX+y1wxlVdkHnsil5hg7Gp3w46Rcbx
	2WWO8j6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPXJp-00AWRC-0j;
	Tue, 16 Jan 2024 00:28:41 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPXJl-00AWOz-1U;
	Tue, 16 Jan 2024 00:28:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C36B1CE18D1;
	Tue, 16 Jan 2024 00:28:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D5E4C433C7;
	Tue, 16 Jan 2024 00:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705364915;
	bh=RnMQyGNEs1792mGPHUYonzM+o5Wm7UVGf9CdagZXuJI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rko9d37ojkXdqmlqjg0gOmgG/jVosyL6tL0956G1GfvJaYTbIzEec4ASYHUmd/VyX
	 SE4z3XspYFlgdYWPocn0U12u9v3kvnXsvlwd0B4I7GiDuB8oX+u5NH8khUQwBerXeY
	 vhQqsYuFyLGIrIAN/eztF371iNBBb8R7pgDWuQ4aYwfWgN25N7+Pp0iLjzwryCXn0r
	 62msjf8JQXpJ63UhkSnEDvPdDOnwA9wEwfKOvGfzCdpPz4KURS2FpmVyEDHFLloG7J
	 b/vdf2aeshcY2eAnaCjZWyVO0vaAK4LRT5i9JFNTy5bZeHibfl3XPLUkgrr8oeY7Hj
	 jn/xEcAO7Ud6A==
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
Subject: [PATCH AUTOSEL 4.19 07/12] pstore/ram: Fix crash when setting number of cpus to an odd number
Date: Mon, 15 Jan 2024 19:28:00 -0500
Message-ID: <20240116002817.216837-7-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116002817.216837-1-sashal@kernel.org>
References: <20240116002817.216837-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.19.305
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_162837_673518_DB3DF55A 
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
index 33294dee7d7f..0050aa56b0fa 100644
--- a/fs/pstore/ram.c
+++ b/fs/pstore/ram.c
@@ -590,6 +590,7 @@ static int ramoops_init_przs(const char *name,
 	}
 
 	zone_sz = mem_sz / *cnt;
+	zone_sz = ALIGN_DOWN(zone_sz, 2);
 	if (!zone_sz) {
 		dev_err(dev, "%s zone size == 0\n", name);
 		goto fail;
-- 
2.43.0


