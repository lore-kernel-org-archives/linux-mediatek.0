Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D29606B4A3
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Nov 2026 11:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JvB3956Z;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cEJrb44x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NcP1PmV6mGhZtCh4rVFc9CwPV4PnTiLSoRbNIs253gA=; b=JvB3956ZFZ0C19/hM/JOl/g+De
	amP7obZWYqnMgFH4F1vpat91AzFoUKgAAc+hn732nhjrWhJvJ9ycMI9/uBONddppkyTc3iEVpw71B
	tQyNnoYtknqQmUi0Xe7UoGtU0O5UAnHjOC5qJJg+Ru5wh1eEJKoFy/r7HpBU1wCD5UuGkRbufbIhz
	ueIBXq9xn4QOfvKH73W1m4ET9xRvTGtYqdTiSxh6eZ5ufrChlUVoicOk4wkY6K5E4YgCYM5bH+ELH
	AQSCP6C5nmp9jOnLeYoZT9o2Mj1L/KyqR9pLAbHnFaFgFSsB43ZikZJ0zfRz+diARSFy2XL0WBsvO
	81nI8Itw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCMo-0000000Fw4v-3eGD;
	Sat, 14 Nov 2026 11:56:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSCMh-0000000Fvxd-2Wm1;
	Sat, 14 Nov 2026 11:56:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1059D40C18;
	Sat, 14 Nov 2026 11:56:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794657374;
	b=uQI/UmOnKx9tmR5iboF5dkOqDFal3OZ/7S2ysaLE1hi7bPYO2MjxGksAa3GeVvz2ZobA
	 NpJiQBW3H89KxQE1NifgnD1vqMqGzcjTI2uaj99JHPWj7yqA4Dw0X8Cf6vVMhvSH91H08
	 2P4gLlhkCJ48AgXKNFIU83LUdvV3LWhUyQa2Srskiim8FovueFLzXLjlF8eGsdOdreIDS
	 8mHsf/GC+TYWcf0HRcb8eByk5z9EYoaAwHlnicukU+l5D00Evif8wUpns8TuTu9o9bViq
	 fw7DCUojum4Nf5rGWV5Es346jit8952N7uIvpi5/TSd+6955bjIEl1A/816tu5wB0wg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794657374;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NcP1PmV6mGhZtCh4rVFc9CwPV4PnTiLSoRbNIs253gA=;
	b=SMJ5qZcfRGEU+uWoIzfLbhjUWB07Salo0EAsl+6dJwSBwR5frphDiU9TcBr2Kc0WQF22
	 O8JovqVNKD0Uqul/uvKXo52lQFoQJi9exjTXj3FCS6P9yP5yGZkqZWFEHFbqmgAEYZNyf
	 KAqUwRMWtmT7BPC2I74GkiXkDSm/bxKjrQNNbHk0j6rH/0XAqf3sFpDuxuy3Z+T+Td9ci
	 8UZBEGDX57FZKxov5VHjoQkSTbn5qz14aVvRpSlj/ZxEQsD/G6kJhwgRy4YgLYXE5DBSp
	 x6xFVsKH2nETZi94HoL2zx4ImCJMVgWrddEmk3vkP+uO14hRFqrmntmfuwbp0yKlA5g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 961E31F000C4;
	Sat, 14 Nov 2026 11:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794657374;
	bh=NcP1PmV6mGhZtCh4rVFc9CwPV4PnTiLSoRbNIs253gA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=cEJrb44xhT8RjjpqTLUhTVVNhMboeIj8bsO32EwCJFvlHFGDp4wjt4wfcpOmoweVK
	 VyZ7KO84apfOQRbl2p/TIZwsbExcKI92iP7ep0gTnFPjQdYkEjTL8xsSErXzNHlA0M
	 jQFk56/cz95TLphy8Q6fIfj+hEfNb5/hSr7c0tCs0kv3FDpgxAHfB4wfBANDAqbHXv
	 LJpDEv3W8NwQwdyCD2cUmW3bysiqmWxZFhOXmMZm9qPCEMBKYy7t2auI4p0UjZZAUk
	 cbOttQ8mJKLc9TQNnPzlixSsa9tRydRdiqRAAa64vw9nLvJB6wXTsb+KxLxb6x+rjJ
	 MWzJKQrtMFm5A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0A85049D63;
	Sat, 14 Nov 2026 11:56:13 +0000 (UTC)
From: Larisa Grigore via B4 Relay <devnull+larisa.grigore.oss.nxp.com@kernel.org>
Date: Sat, 14 Nov 2026 12:55:33 +0100
Subject: [PATCH v11 01/14] ufs: core: Return a negative errno from WLUN
 suspend/resume
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261114-b4-ufs-s32n7-v11-1-dc36e11919d5@oss.nxp.com>
References: <20261114-b4-ufs-s32n7-v11-0-dc36e11919d5@oss.nxp.com>
In-Reply-To: <20261114-b4-ufs-s32n7-v11-0-dc36e11919d5@oss.nxp.com>
To: "Martin K. Petersen" <mkp@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: devicetree@vger.kernel.org, Ajay Neeli <ajay.neeli@amd.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, linux-arm-msm@vger.kernel.org, 
 Peter Wang <peter.wang@mediatek.com>, linux-kernel@vger.kernel.org, 
 NXP S32 Linux Team <s32@nxp.com>, Asutosh Das <quic_asutoshd@quicinc.com>, 
 linux-arm-kernel@lists.infradead.org, Stanley Jhu <stanleyjhu@google.com>, 
 Frank Li <Frank.Li@nxp.com>, imx@lists.linux.dev, 
 linux-scsi@vger.kernel.org, Bean Huo <beanhuo@micron.com>, 
 linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Pedro Sousa <pedrom.sousa@synopsys.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, eballetb@redhat.com, 
 Peter Griffin <peter.griffin@linaro.org>, echanude@redhat.com, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>, 
 Manivannan Sadhasivam <mani@kernel.org>, linux-rockchip@lists.infradead.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, clizzi@redhat.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Can Guo <can.guo@oss.qualcomm.com>, 
 Orson Zhai <orsonzhai@gmail.com>, aruizrui@redhat.com, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794657368; l=1602;
 i=larisa.grigore@oss.nxp.com; s=20261114; h=from:subject:message-id;
 bh=gmKvJS5ja+qFfQcSHziMGUUrnqG+N63YieA9XdI0orI=;
 b=HCs4+jy1XrgoQCh8b366WKkPe8gX3AlsAHzvlETcaOCoT8Jl17FwbFk48k/kzEr87OXgv1Tgt
 9waeTQiK9kYDGfVKiKX7aDbfrHx3yHQrBatck2GBZU8MmBy9JHfKFbM
X-Developer-Key: i=larisa.grigore@oss.nxp.com; a=ed25519;
 pk=Jpt52sb6ETKTtvWjUzhz5Sv5FjB9AEg9QKCcbpWFx3w=
X-Endpoint-Received: by B4 Relay for larisa.grigore@oss.nxp.com/20261114
 with auth_id=1522
X-Original-From: Larisa Grigore <larisa.grigore@oss.nxp.com>
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
Reply-To: larisa.grigore@oss.nxp.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Larisa Grigore <larisa.grigore@oss.nxp.com>

__ufshcd_wl_suspend() and __ufshcd_wl_resume() may return a positive result
code, e.g. from ufshcd_link_startup() when DME link startup fails while
restoring the link.

The runtime PM core treats any non-zero value as a failure of the WLUN,
but rpm_get_suppliers() only checks for a negative value. The LUs
consuming the WLUN are thus reported as resumed and receive I/O while
the WLUN is still suspended.

Convert positive values to -EIO, as ufshcd_init() already does.
Do the same in __ufshcd_wl_suspend() for consistency, so that callers
always get a negative errno.

Fixes: b294ff3e3449 ("scsi: ufs: core: Enable power management for wlun")
Signed-off-by: Larisa Grigore <larisa.grigore@oss.nxp.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/ufs/core/ufshcd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 3c28bc67c65f..a6817e4bd1f8 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -10553,7 +10553,7 @@ static int __ufshcd_wl_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 		ufshcd_release(hba);
 	}
 	hba->pm_op_in_progress = false;
-	return ret;
+	return ret > 0 ? -EIO : ret;
 }
 
 #ifdef CONFIG_PM
@@ -10654,7 +10654,7 @@ static int __ufshcd_wl_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
 	hba->clk_gating.is_suspended = false;
 	ufshcd_release(hba);
 	hba->pm_op_in_progress = false;
-	return ret;
+	return ret > 0 ? -EIO : ret;
 }
 
 static int ufshcd_wl_runtime_suspend(struct device *dev)

-- 
2.43.0



