Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF1FC54756
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 May 2025 07:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHuXjtnGIwA8Zzr3bT7RPQh03xIe4TvMRJ0gk9Qtcas=; b=dV5Nik0K7G1noSEDH8NOb38Ahk
	+3h/vuCBLP0hQxIxFM0ME4GUYI96ZfSN6+rhqJuSC8GId6SGlbadGjWTXB87VK1vXl7lTunjW443w
	ZrZD2K2Sa1zMogCrdAPMOg24eAGvfOncuA7OSS78X9Gac523ZpHiTC/OdWERFtWl2EXGegzbioBtD
	WsQgoH+C7RfW13CkS/343wxyyHZCSESzDKHcgbk7Po45Sat4AfWiJB/EElqsMWZHofaD1Cy3GE7lZ
	5zzw9hKHkAebR6ieomSz2lJDzezfADVUR/IRFiF1U/4vlLwfrtdi16Ua+DWFxl3F7A3tu8xj7F+wm
	3S/1TJnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI0CQ-000000006di-3hIm;
	Thu, 22 May 2025 07:18:42 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI07S-000000005bc-2hp2;
	Thu, 22 May 2025 07:13:35 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id E68E84B84B;
	Thu, 22 May 2025 09:13:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1747898008;
	bh=lHuXjtnGIwA8Zzr3bT7RPQh03xIe4TvMRJ0gk9Qtcas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T6dWlTr2XT2GmGeCMyAcctcy1RpNQOI6pU+GjH0UCm9p0MJHc8NtF6tV1+D4/Q6Li
	 R9ClH9GUmx7loyp1mMfjWd45Rrroit0lBeMnsR2tp98VEZpFbm7BWuiMCp9CnOj6a6
	 RKAzvKkO0IFcoAB0kzGsyUhy4xyK4S+m2BGkuLSEgGNsauhZVyzBrjXz9/qv4S9CBd
	 j6m72ZsK8uvVz9nIxbxt/ZTTnVQ+I2Kt2pHHmc4wQv9kFrGiQ7Up8+oqsZY8XF+8ZO
	 Pl3TPP/1+QzvHlrxLyzFIXqqRDkLi5gI3jiZXeZyiloawz/nwhrJHThIZxEgKm5xOB
	 7uQj+O145Q5Vw==
Date: Thu, 22 May 2025 09:13:26 +0200
From: Joerg Roedel <joro@8bytes.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: yong.wu@mediatek.com, will@kernel.org, robin.murphy@arm.com,
	matthias.bgg@gmail.com, iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	robh@kernel.org
Subject: Re: [PATCH] iommu/mediatek: Fix compatible typo for
 mediatek,mt6893-iommu-mm
Message-ID: <aC7OlsGLaFvl6n95@8bytes.org>
References: <20250521151548.185910-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521151548.185910-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_001334_894032_D406EE82 
X-CRM114-Status: UNSURE (   3.90  )
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

Applied, thanks.

