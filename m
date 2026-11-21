Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C697606A6BC
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Nov 2026 03:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uug5YcUC;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jHvicj5p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dFoQ7O2IGK1nSFEodFxJ6wg6pducvyR4YJQYYfyNJSQ=; b=uug5YcUCSLCHN0
	1g2HN7ATnoO7H0A1s4rgOS9gc70OkMSA7RHFqMi75D42a9/S4fHrfKvCFrcWRFEy03P391ChnoaLh
	tHuya+gKXeHv3mL/C0snv9DXgckqJ0BQ4I8lT1wSr6xxC/xxSjPwGUzwWBwiHPgWRU9ko8NQBL7SY
	K50uyi13mhnCa5UrsoObj0cQvgafRQVkovKwBXzU0+QXBl0K1+jx8ONUlUbMafEoWxcEO3B8FJD04
	F/K+9NmmK5mt5wUYOYueYwAjsjHgGd3712FgtLdQUqqeIktkR2on6vNppIy2Yqes1j+zLO+lsAgIF
	51TCuUUMezDUQIrc7D5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUbiu-0000000Gixt-015G;
	Sat, 21 Nov 2026 03:25:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUbir-0000000GixQ-06UW
	for linux-mediatek@lists.infradead.org;
	Sat, 21 Nov 2026 03:25:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3397D61227;
	Sat, 21 Nov 2026 03:25:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 903611F000CA;
	Sat, 21 Nov 2026 03:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795231503;
	bh=dFoQ7O2IGK1nSFEodFxJ6wg6pducvyR4YJQYYfyNJSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jHvicj5pwn9sYzEq1EiiCrmFI0Hs6b30eRNfU74OyjDjM5Crvj03ZpxKJRnP8nJFK
	 1j7SCBSWNseSzmrN6O5KJ78OL0kVXhs2IhiZj2Yr5fma9zoR36msDxSBFmj+RnsbGF
	 w6RUmVRU6Tq+rl24BS9RmbaJ2zu1hdmYyRRAz32CPsgBaoL3bv0fvW5ZGdrHeexNL/
	 EflvAcfZ6dva0yvTtXNIhYmnMJCQL3iZl5RZK51OmzOIXMkirufoDlcfNN5L/0bo4H
	 L0p0lKRJjTqFduq/9eDcsG7caqmt4lgEpwhiaABYJDdyWOIBFZ9lCyjGII9v6ntLQ0
	 hL/0u58IAORPg==
From: "Martin K. Petersen (Oracle)" <mkp@kernel.org>
To: peter.wang@mediatek.com,
	chaotian.jing@mediatek.com,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: "Martin K . Petersen" <mkp@kernel.org>,
	chu.stanley@gmail.com,
	alim.akhtar@samsung.com,
	bvanassche@acm.org,
	stanley.chu@mediatek.com,
	sashiko-bot@kernel.org,
	linux-scsi@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] scsi: ufs-mediatek: fix va09 regulator lifecycle
Date: Fri, 20 Nov 2026 22:24:50 -0500
Message-ID: <179523145639.420187.12014570853735820164.b4-ty@b4>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119071611.117-1-laixiangwu@cmss.chinamobile.com>
References: <20261119071611.117-1-laixiangwu@cmss.chinamobile.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 19 Nov 2026 15:16:08 +0800, Xiangwu Lai wrote:

> Two fixes for the va09 regulator handling of the Mediatek UFS variant
> driver.
> 
> Patch 1 converts the va09 acquisition to devm_regulator_get() and adds
> an .exit callback that powers the M-PHY off, so the enable count is
> balanced when devm releases the regulator.
> 
> [...]

Applied to 7.4/scsi-fixes, thanks!

[1/2] scsi: ufs-mediatek: use devm_regulator_get() for the va09 regulator
      https://git.kernel.org/mkp/scsi/c/def1745a6a8b
[2/2] scsi: ufs-mediatek: restore the M-PHY power state when va09 disable fails
      https://git.kernel.org/mkp/scsi/c/71b5da0b45fb

-- 
Martin K. Petersen

