Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877BB606A31E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 00:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZnRZJCmU;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hVulpL0t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=C7fC3wgsum3SPXPZYAvK25HkQx81CPAOUehXA+0wjt0=; b=ZnRZJCmUJxpacmLugBgzo/Frnr
	sZrT1jTF1G8IHfu/HxvVzlj0gcYZoBOeGVBAsB3tcrReyhRTfYseLAibo/A/+FMYpHwVs6HRlfakA
	HyeNGQizRWrnWRZcKVgzl2sZdp543XCcWR2hgmw2uDiGBkFOcg7kuRybJdGArRkPU6So9vGLHLjX1
	wB4bgOz8FLwZ+4niwO7AwxeaXdvc2vWg6EzumMKJlYVgd5vAy2cVXTEoopiULVe31tu4LtBrqFW+B
	2mO6J+A8xVAVbWcaJzvH0nifU83HAKtq8/2nYf8ILAA+1JClhbX4GJzSHFSUjNMoJVBSVyUs3ngDE
	LWyUR4nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNl5-0000000Bj7g-0oyW;
	Thu, 26 Nov 2026 00:54:43 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNkA-0000000BiOY-0OzE
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 00:53:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5DB0446522;
	Thu, 26 Nov 2026 00:53:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795654425;
	b=xqOPALzez/kgA7WE7kUsvRcziWj7i6KL/LwywPbFSugjJqKdwsIeJWDi80yTBUtvk7go
	 2w5A2VRyFIjgLhjUM5AXbxcxbQ1xf57ned80oCp4btOQZjCoWAsu12XuIFBQ5k8MUxU0p
	 6/kpPYqgCciyeQO25DtOduEn2f5lwqaBRnYKYvYxvz6NJq8dVN5qhMz/6b8tHHVEpeUYh
	 9ZN/xt9gwS4WiDp/LuJqVo5ECuSE8YZhZrJvUrfy744WvMV1oHAZ0DBemvu/hYDWBU8d5
	 JE5+/HI+VA153s5de4cZ4dlMdoL0gohi+Y3yu1wpRMhtmzFmJ1gMjV9jW18RPKmp+8w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795654425;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=C7fC3wgsum3SPXPZYAvK25HkQx81CPAOUehXA+0wjt0=;
	b=bB81w99L8xb7QQViu7tMdU8OApmep5OSpqbia/+pD9ysp3hVaU/3MGPBZ10hK9NwIpou
	 3RGWd6nSrZV1np1sG9gBQBr9Boe12LswShFGXfPQhPpI3LHvLYEHz3Li82xZZu3PXKSKF
	 kdtwJ/SxpHg+LmbgjmFZh+DC8NCGGZlnA52SxrnkNsEWDWl5uWFhnZ4cuYmK8lpUwrWtT
	 bb4SCjtZZ8JWNI+NVX3SDN0T9mHk9KA4BLjGPeKYzd7smL+et7nv9VRWxCU3eCiKEMLNk
	 7Zc8OIUhd0sCBc/qO3Og4qt6B+Q3zbXhGK8SVBjJbZUk2NIFTHPnWiriBzpEH6v2ADg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 651B41F000C4;
	Thu, 26 Nov 2026 00:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795654425;
	bh=C7fC3wgsum3SPXPZYAvK25HkQx81CPAOUehXA+0wjt0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=hVulpL0tjmoagAex2Z8QVjTDAZTMiJ7mT2llQFP/yIQtwXPSML9z2n10Dxxs1Buj1
	 WMkoi41xrwyjBww1KvrHPNQxPl/ZuEjsUb5As1CT3aN+eoixkgykYDWz7YXj8nqVN3
	 3/C/nyivp4zODRyukHL+1v+qQyhx6S5iUtVeoR2YgWBQ3MQpdNuIHY7ky2JqAC9FHX
	 qH7t5WrRnUZYlavKZTbIhjxrxTxIPw7d5UsuI/dIez1n2l9G0SMN/5j3/ejZC7NwFp
	 h2NyFVR+gJgXt3MJ+/t34WgaAxnQbW4K0H2sCJQYPx6o0qnpwTAPVymlOHDz8Wbc0S
	 Drie9mEAgXgTA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C84B04D15F;
	Thu, 26 Nov 2026 00:53:30 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: peter.wang@mediatek.com, stanley.chu@mediatek.com, 
 martin.petersen@oracle.com, James.Bottomley@HansenPartnership.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 louisalexis.eyraud@collabora.com, linux-scsi@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] scsi: ufs: mediatek: round scalable clock bounds to
 clk_round_rate()
Date: Thu, 26 Nov 2026 00:53:32 +0000
Message-Id: <20261126005329.72010-4-iasnezhkov@gmail.com>
In-Reply-To: <20261126005329.72010-1-iasnezhkov@gmail.com>
References: <20261126005329.72010-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795654409; l=2887;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=mD8c7Hrg16FM5GVQm6mflwliUTbJKeKdxA7+pMxBwPY=;
 b=icOI0pOOqC02NuGMr9RZfkRCctWnCrr3ty5yflwBN3AYW/idYojMNH1DD9jivfRBx8aAHsB5b
 H99BG076G07ClhinycvRB7CVNxN3BZd/utNVmZvoVj+X10rvIiRZB2Z
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: iasnezhkov@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ilia Snezhkov <iasnezhkov@gmail.com>

ufshcd_devfreq_target() determines scale_up via an exact equality check
against clki->max_freq after rounding the target frequency. When a DT
freq-table-hz lists a nominal value that a PLL-derived clock cannot hit
exactly (for example, msdcpll_d2 on MT6789 delivers 191999939 Hz for a
192000000 Hz DT maximum), clk_round_rate() produces a rate that never
equals clki->max_freq, so devfreq scales down once and can never scale
back up.

Round clki->max_freq and clki->min_freq with clk_round_rate() in
ufs_mtk_init_clocks() for ufs_sel (and ufs_fde when present) before
ufshcd_devfreq_init() builds the OPP table from those bounds, keeping
clki->curr_freq synchronized with the rounded bound and skipping the
adjustment if rounding fails, overflows u32, or collapses min >= max.

Found on hardware and drafted with an AI coding assistant.

Fixes: b7dbc686f60b ("scsi: ufs: ufs-mediatek: Support clk-scaling to optimize power consumption")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
 drivers/ufs/host/ufs-mediatek.c | 35 +++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 09b7993..b4fa2b9 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -967,6 +967,37 @@ static u32 ufs_mtk_get_ufs_hci_version(struct ufs_hba *hba)
 	return hba->ufs_version;
 }
 
+static void ufs_mtk_round_clk_freq(struct ufs_hba *hba,
+				   struct ufs_clk_info *clki)
+{
+	long max_rounded, min_rounded;
+
+	if (!clki->clk || !clki->max_freq || !clki->min_freq)
+		return;
+
+	max_rounded = clk_round_rate(clki->clk, clki->max_freq);
+	min_rounded = clk_round_rate(clki->clk, clki->min_freq);
+	if (max_rounded <= 0 || min_rounded <= 0 ||
+	    min_rounded >= max_rounded || max_rounded > U32_MAX)
+		return;
+
+	if (max_rounded != clki->max_freq) {
+		dev_dbg(hba->dev, "%s: max_freq %u rounds to %ld\n",
+			clki->name, clki->max_freq, max_rounded);
+		if (clki->curr_freq == clki->max_freq)
+			clki->curr_freq = max_rounded;
+		clki->max_freq = max_rounded;
+	}
+
+	if (min_rounded != clki->min_freq) {
+		dev_dbg(hba->dev, "%s: min_freq %u rounds to %ld\n",
+			clki->name, clki->min_freq, min_rounded);
+		if (clki->curr_freq == clki->min_freq)
+			clki->curr_freq = min_rounded;
+		clki->min_freq = min_rounded;
+	}
+}
+
 /**
  * ufs_mtk_init_clocks - Init mtk driver private clocks
  *
@@ -1022,6 +1053,10 @@ static void ufs_mtk_init_clocks(struct ufs_hba *hba)
 		return;
 	}
 
+	ufs_mtk_round_clk_freq(hba, host->mclk.ufs_sel_clki);
+	if (host->mclk.ufs_fde_clki)
+		ufs_mtk_round_clk_freq(hba, host->mclk.ufs_fde_clki);
+
 	/*
 	 * Default get vcore if dts have these settings.
 	 * No matter clock scaling support or not. (may disable by customer)
-- 
2.54.0 (Apple Git-157)




