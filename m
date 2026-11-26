Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF402606A31E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 00:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bsakQWnm;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FD1oC7Of
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=p+xXsZjiaXoOEz9qBEyk4TJitPlTvM0wfvW8yye6/+I=; b=bsakQWnm9Jzpx2PAVP0FtsD+CW
	A/mhHabL7ZdomrdTPZZmgIm2+X/b+82kUCHE/kfj2hIB3nTSC59iBbJFP8xgGX4cjnw1iuErFcJJu
	obTsq9X2IztTi1gukFy5w2f0tmR8p34euJn1mzgF/3MAKQHO3yOQZ85EW3bVYvgZB9MvQdj0Ghw3y
	Wfwx1y8J2Lkymv4cDNlsQ0MoOfiwUrGO7YG2NJzAhIYCVcHH9sSAXrtL909pSmElk3LNA/rtAcgA1
	yI50bk/o3VcQfRPZyB5DtH6HViNOX0XG12VK531H7Zgog/Sg/1l/9HgsWIc3PSBBkdYv4zcP580SX
	2nFX6Brg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNko-0000000Biu3-1xm2;
	Thu, 26 Nov 2026 00:54:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWNk9-0000000BiON-1p8k
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 00:53:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DE67862165;
	Thu, 26 Nov 2026 00:53:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795654424;
	b=y9EsrpbSud89XRA6b7RcJ1kyCCm+/rTEHCNBP2sUAyIxsim/1bh/REL5xbi0qbpUTVAV
	 x6NzXtBaWQK+dMPjFb5iNCgLVrWt/RrL3oIYw/pyfDM2jrMxcWdJ4arTZJZ1PE8PgQS87
	 ZKJWU8U+yxx1k5vqlULMqP5TeqVbF+vuaOs748fIQl2XnzxGPPkRpw15Zn9SJXPQ1F74S
	 cPmlK6leCCBt/h27qxi8vuT/k64seLAgFhrgaIz8yPjG19AdgLlMCHASR7v1HUyKBh9fa
	 sqJ6KlAef2vooOsCtus/6DKuJp1HcTg5F4CpfmCPstrTsG3tDdGpCvvzDao7+QyYFsw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795654424;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=p+xXsZjiaXoOEz9qBEyk4TJitPlTvM0wfvW8yye6/+I=;
	b=xKTD+ZhOOoYyMWr/cfFf3Hy4OQ/DaV1MRqld44w9x3PjgECL57VVACfbnEDhahr4TpVg
	 id5ovcvyZ/zKpJQnFQJNVNEvtEet2jzis8Bn/rjE+SW+vKHtr/SrrGHI0SPGiNeaELY22
	 A36/hNDJyF1PE/qDlgigQuyocgFGJUsXzVPSmBtvMf4A9M/KbxkFkre6vv6lTcdE7h+Cg
	 Ha3iFftJbmBDbrFLhiZEkopDojbxxGVOhG5qVWtmuh19HkzHzukgtPPFA9OtB1uYpiEVD
	 R0rLEy6NXg0VG+gXXcQF4dV9Iic364Yyurrle9GY9NiTpPSpangESF2JQUVtmGaJHPw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 224601F01805;
	Thu, 26 Nov 2026 00:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795654424;
	bh=p+xXsZjiaXoOEz9qBEyk4TJitPlTvM0wfvW8yye6/+I=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=FD1oC7OfpCfDcw0EAeDV+2RBkt1epTjJODIk5zoicbEezGTQLraO5DyoQRoV6z8Fm
	 B25xaAY1G3GU8UID2vxiPxEYEWVb0J1GiIAX2ERcTuORFi7nBRzQ8TnkJCVLrJfChs
	 1wVAg/LsYmWbNEU8DTeFJ4e2fWa3osb06vwKyhaMEucJc6QFMvYWmX00uLF3Jj9K7m
	 4Zi++hvdkb76obHvPMV3Me5q66pS3VHzqqwmfY8DpWtHlIhIMV+RKg3wiQrn1HLrvE
	 tkLTIENqXiKK2yYVBi3WO++dYM8V3QAaNs8IC3vuJzhYdg7l+uZAG8OY2xnfzthPRd
	 kDIRUW04lL6ww==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6429F4D153;
	Thu, 26 Nov 2026 00:53:30 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: peter.wang@mediatek.com, stanley.chu@mediatek.com, 
 martin.petersen@oracle.com, James.Bottomley@HansenPartnership.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 louisalexis.eyraud@collabora.com, linux-scsi@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] scsi: ufs: mediatek: pre-UniPro-1.8 adapt and clock
 scaling fixes
Date: Thu, 26 Nov 2026 00:53:29 +0000
Message-Id: <20261126005329.72010-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795654409; l=1254;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=iEJQHKPytlPgQrAMYjID34D1fho6DWUFdxsNjm1zibI=;
 b=SnyT9H1v+r+1O+qvMYQeOuPjOSqeOFEVKHzccLAm8A6DFpfvEFDNxZfCPcyiOEJMTSot9SSVh
 Nd0WFobSctWD8RzzdBXfKhq36bBM5MVBqDIPTsVEO+bOa9odDuszUog
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series fixes three bugs in the MediaTek UFS host driver observed on
MT6789 (UFS 2.2, pre-UniPro-1.8, HS-G3 rate B, no ufs_fde clock):

1. Skip ufshcd_dme_configure_adapt() when host->hw_ver.major < 3 so
   pre-UniPro-1.8 hosts do not fail DME-SET on PA_TXHSADAPTTYPE (0x15d4)
   and discard negotiated power-mode parameters on every gear change.
2. Allow _ufs_mtk_clk_scale() to switch ufs_sel when the optional
   ufs_fde clock is absent, matching ufs_mtk_is_clk_scale_ready().
3. Round clki->max_freq and clki->min_freq with clk_round_rate() during
   ufs_mtk_init_clocks() (keeping clki->curr_freq synchronized and
   preserving min < max <= U32_MAX) so PLL-derived clocks whose rounded
   rate differs from the nominal DT frequency can scale back up in
   ufshcd_devfreq_target().

Found on hardware and drafted with an AI coding assistant.

Ilia Snezhkov (3):
  scsi: ufs: mediatek: skip PA_TXHSADAPTTYPE on pre-UniPro-1.8 hosts
  scsi: ufs: mediatek: allow clock scaling when ufs_fde is absent
  scsi: ufs: mediatek: round scalable clock bounds to clk_round_rate()

 drivers/ufs/host/ufs-mediatek.c | 58 +++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 13 deletions(-)

-- 
2.54.0 (Apple Git-157)




