Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E5AC3DA79
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jan 2024 00:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1r4GUf/BmEHlUJMXTx7bS03sJUx6gksHER0TJdo+FBU=; b=Sj4kpsKYNWq0joQ2flriZbBTFZ
	ZUXOOuMEla3AIRpkK2P4Go5VUaREDImPgGB8T/3ji6YfM9OE+wLjEPKldtxTmQF91X/wUxAY090MP
	ftd+gI/wJgT7GfSINXAlwCzllnmBEMWZGehBDlP3dyCRppTfvJE0QLZgzg7qj/vj9jUDe7zSv+0De
	t9TSTzK4ugnsf9MWT1Ep4bu9ZkoyuXfHtlQMjIu3u8Eipng8el1UeaKo4MzDm48flGyAdHnfPsDyN
	GGHRrjk0lNYaOwEmEEX83cTa6JtrpuQkXTSpoC8ZnMWAJJpX7CKisChzprWKrIgA6gbWzwr9MZnVQ
	nTs5IAVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPXEx-00AUkr-19;
	Tue, 16 Jan 2024 00:23:39 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPXEt-00AUix-2b;
	Tue, 16 Jan 2024 00:23:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 242E9CE18C6;
	Tue, 16 Jan 2024 00:23:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41CB2C43601;
	Tue, 16 Jan 2024 00:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705364613;
	bh=BOcYem1Z7/qXXdzAEn6zt6OieCnjfBG4m5itEtHWuHI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mQdyb0Ypns3bvnY8QtuJ9NecdKPYeEGSoAhGVwuveq4B5yIptbeWzow2/GX+HX9O5
	 QdirIzgO0pP78U7nQXewnjDXCS8gnxXl/9Ye4z+ziZNEf9MzsAqAaRXqYvU2IogKMw
	 0bNLbIZLaIbL30jHpyMsziFV011NvKebAqFUJDj0GDgssbWcox4K0vJ5H4X7Q5vlhw
	 Svh+vX5j4/wDosaVNVceITtcbZBuxIZef+VTsSXhiq72aSXFfp5FZTLxqZSNNYwClf
	 o2kfjgSOupa2bCKBYVK53LbBixfvOQGwY7xMagHERxn1A2YNqXOEt4oMIdAPi0xVr1
	 UiLgNaDbRVbjw==
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
Subject: [PATCH AUTOSEL 6.7 09/19] pstore/ram: Fix crash when setting number of cpus to an odd number
Date: Mon, 15 Jan 2024 19:22:45 -0500
Message-ID: <20240116002311.214705-9-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240116002311.214705-1-sashal@kernel.org>
References: <20240116002311.214705-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_162336_018156_E281E3C8 
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


