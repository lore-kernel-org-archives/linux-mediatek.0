Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A86606A337
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 23:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D6ILGpEQ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NVhz2zRD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5VznbkEq2ZVQ6/pxF1/yzSES2MLjugIFOCNZBUp7Z24=; b=D6ILGpEQecrZnK4tekv4JUnsGU
	85ZRI2uNtTdicnBRZZsmflb4UKPq5JSlSOOD92pe5q9k3qmEYKs6PdEceZZPr+T4zAcDXy7HlkTxk
	rnjwweHZ821jnwpKjVi/JNIAKzpo6F03Ox8KJZfRBzLOEbm4p2cHpIblvaJFD25Kxp9uViQozkz0y
	s4cgFeynfdeQ85d/kNBi2lJ1SUQpA7M8rKvRHwNYMZ6u73c/71m2GU2oNhGr4w9d4jFhmY8IU9lnq
	vT6KxL2iNuyzy9jYZdo+sjD+jkucCtFj9whH539je3KsykEsoI02PYHalnS/oYj131I5ndHSPu5EZ
	y495hYMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMix-0000000BbeQ-3Bee;
	Wed, 25 Nov 2026 23:48:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWMiw-0000000Bbe8-1KsZ;
	Wed, 25 Nov 2026 23:48:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 79D8661164;
	Wed, 25 Nov 2026 23:48:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795650504;
	b=XCYUpo9xNkRZoTY6AwpkcUHM5Z9SqKsujYQHYhYXYvzJvf/bp7R5QdcWwCByAhWpakgM
	 ywO3vgyC+E2RcVqzzvEzApIPgdz2DdsKXo/HhOlvkWj8tzvIkBOgnVM4253HlwKmY6LI7
	 x9QI8REXMDd6E+EK+8GfnqgAVM8AEpkas4v5RByKll0i88xl/WlOahNi8wES0avgWc2fe
	 Smweay8JBlrlrQVSELHNspVfVBz+U19YNWhuWKuiZTHrI+BRqz+fKsX5S2r6NeyQrUreQ
	 UWRiueHj+jmp7qtV8m4H0qZAfwc/37hBSSD/chKPSVk/HQloMVxCI6YSK57sjbSNqng==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795650504;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=5VznbkEq2ZVQ6/pxF1/yzSES2MLjugIFOCNZBUp7Z24=;
	b=g5v1eWv1Suo/HjOSYlw2Q0OSPezzhUpyjiAR9OCLix7WayysEUYplUXu4ViVN14iK5ml
	 9rdS7VRraG+TZr/YM2lt+Y5N5Lv5Q0oq+Mp8okBnk1JC9jQKuy6n6e1iJFXDMZlo/nvKO
	 dwvFc/RULLeJkqEPLWIvrn9FI6fEvHF+0Hx4L9OH2HAk1jGEwr2q6khhLUOKw+31e+ixY
	 abjuasUOhhELw6Dfx14Vsq8sQbIKZGhTuYSCgVn7vqyBvdyMfh0OTrjklDPz4ZneVB1b+
	 Z7TpwWyygT48UB5niSBJJe9v1tokzMkA9HvIff1/J684yF1xZd3X7+aeQaiiSId+fFw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 100441F000C4;
	Wed, 25 Nov 2026 23:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795650504;
	bh=5VznbkEq2ZVQ6/pxF1/yzSES2MLjugIFOCNZBUp7Z24=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=NVhz2zRDY6+U8xQ5pSURQMn9fuZJtrP7970LTTzNwgrDh4IlIJP/oz4BWyHQn9RAe
	 4YZZ7rUANOAxSHMpCru5+ZbWDfWNu4jYLNM90hImx4THAr69PH1FDoUKxYwGGYMLKn
	 u+xFCwFLpnnl6tIli6gkgzjki85y1RUIu7p0b3o5h+KzKy17aW6r07kJSMAVMveoLs
	 GhhByqG8GTDbAWrplCD6Naqde1dEvDjWXo/FtZvABGGteh7ACeoSFGSOefjM5L+5P4
	 xiJV63SAoA6NCEIUyPgoQ5kAOq3Fy/0wfCXiRPa18TTOtglrksZgtn/p7yjYPX1Czt
	 Kyc7oa2cLeJig==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 61AA04D0BF;
	Wed, 25 Nov 2026 23:48:21 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: lee@kernel.org
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH] mfd: mt6358: fix MT6358_AUD_TOP and MT6358_MISC_TOP
 interrupt status bit shifts
Date: Wed, 25 Nov 2026 23:48:20 +0000
Message-Id: <20261125234820.94635-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795650500; l=1414;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=CJD3RtuSi+tWsdxFPCGavRJOeasqCKE/cFgR4AGmT1E=;
 b=jFumlAP5ZBfX9e8ufTxPUCAnsD5dqr3aDBM/ntE2X8rf8eBwGwpbG9ohmxiaM094HkUFERLBk
 sNCgBgUIjz4AeuhE33HEDaA310bImMeslbn6YyGC0w7ZklpNeHR8cvP
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

In enum mt6358_irq_top_status_shift, MT6358_AUD_TOP immediately follows
MT6358_HK_TOP (5), assigning it bit 6 and MT6358_MISC_TOP bit 7.

On MT6358 and MT6366 hardware, TOP_INT_STATUS0 leaves bit 6 reserved
(corresponding to XPP_TOP on MT6357); AUD_TOP is bit 7 and MISC_TOP is
bit 8, matching MT6359_AUD_TOP = 7 in include/linux/mfd/mt6359/core.h,
MT6357_AUD_TOP (7) in include/linux/mfd/mt6357/core.h, and MediaTek's
downstream MT6358/MT6366 MFD headers.

Because mt6358_irq_handler() tests BIT(irqd->pmic_ints[i].top_offset)
against TOP_INT_STATUS0, audio, ACCDET, and SPI_CMD_ALERT interrupts
are never dispatched on MT6358/MT6366.

Set MT6358_AUD_TOP = 7 so MT6358_AUD_TOP is 7 and MT6358_MISC_TOP is 8.

Found and drafted with an AI coding assistant while auditing MT6366.

Fixes: 2b91c28f2abd ("mfd: Add support for the MediaTek MT6358 PMIC")
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
 include/linux/mfd/mt6358/core.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mfd/mt6358/core.h b/include/linux/mfd/mt6358/core.h
index 68578e2..5c96607 100644
--- a/include/linux/mfd/mt6358/core.h
+++ b/include/linux/mfd/mt6358/core.h
@@ -32,7 +32,7 @@ enum mt6358_irq_top_status_shift {
 	MT6358_SCK_TOP,
 	MT6358_BM_TOP,
 	MT6358_HK_TOP,
-	MT6358_AUD_TOP,
+	MT6358_AUD_TOP = 7,
 	MT6358_MISC_TOP,
 };
 
-- 
2.54.0 (Apple Git-157)




