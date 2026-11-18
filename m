Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AA2606A339
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2026 13:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HUC29Klx;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gxJjnJ8Z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=l5tAGq8LD7eVBOOXSoD/xxeDVRpU4Z2nV27f2hUsMlc=; b=HUC29Klxg1QV8C
	A+KOMPr5APJ/O60lpFGzDypicG/DihvcITKYQBLukATXaGdSlhsxT51SnaYCNSFFUv1Nmejdav8WA
	tp6FFJT+zNLv5OZR8+pRCKUkP9DTjSX1EBY3PgyPqT6U5aq4FGFPFbIq6li/iXr0mNT0lsU52mT44
	Xrepe0hAm4stLgELBMR8xAbdZ/z0bhFZI487rttC9H6sYOFx9p+b2p9zrZ5MZTNvlnz+Vhr5d2G0A
	IOumcyFkMU53YE92LEoR5o4w9zmHm4+kFm28E6vtzdhEUTg9Rj12Yb9VQNVTwuswtHsQ639JR3I0V
	eq4jPm5WpNyDaGcd104g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfmN-00000008wzn-1drM;
	Wed, 18 Nov 2026 13:32:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfmL-00000008wzZ-3O9E;
	Wed, 18 Nov 2026 13:32:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8E92245598;
	Wed, 18 Nov 2026 13:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 093C01F000CA;
	Wed, 18 Nov 2026 13:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795008769;
	bh=l5tAGq8LD7eVBOOXSoD/xxeDVRpU4Z2nV27f2hUsMlc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=gxJjnJ8ZwmO8//pFZEj0DSAK7Z2FQ57UCSovJ4wRE3I5pzbIKemAt9EPPQIA4Aktk
	 cWLH02uD3iX108C2NMelvIsEipdkqLYm7BIHColMQMQGXzZ5wOOBPBmNmT1ZYxBGwy
	 KTaN7/4qzSHKmUt6fhUQPoRzVjsgzbMKZ5Do97tzjvPjM6ecdtZoqcXEERoNWO6X1O
	 z4+4wEUNHG5uFgyTrA6Ez11e5FoTdRjiob+e6FNusCiJzUmMcz5PwcuJNAORORGcjm
	 XPCueNvH7/JiDk6lPL0QgjWqXILcuxrpHhWQ5ORzQwCT0niVKaq3IQ6ndzPmTXiAYf
	 RCDs23TNdbLjA==
From: Lee Jones <lee@kernel.org>
To: linux-mediatek@lists.infradead.org, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261105104837.1105227-1-l.scorcia@gmail.com>
References: <20261105104837.1105227-1-l.scorcia@gmail.com>
Subject: Re: (subset) [PATCH] mfd: mt6397: Use MFD_CELL_* to describe
 sub-devices
Message-Id: <179500876778.21786.2112559503072927273.b4-ty@b4>
Date: Wed, 18 Nov 2026 13:32:47 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 05 Nov 2026 11:31:05 +0100, Luca Leonardo Scorcia wrote:
> Use the MFD_CELL_* macros to describe sub-devices. No functional changes.

Applied, thanks!

[1/1] mfd: mt6397: Use MFD_CELL_* to describe sub-devices
      commit: bf7869959b3439b60741a4cd3e6fec59123b3c0d

--
Lee Jones [李琼斯]


