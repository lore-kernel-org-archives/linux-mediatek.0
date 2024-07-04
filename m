Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EA5C30653
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 22:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X6KYbESHheMMfD0jbpNjdbQnrJ/e/OL+9SKysK5b9Kw=; b=fPKXJInv9fKt4WPjKPti0ScM+Q
	GKuXs65BOL7+NnNT8xpXn9g8cPtzl65TEgtn6ydRJry3xidPWnT3JLyZD2FWk937uR+cGKzM2kRBk
	+ANftWVlPMKKzAI7FQbS1aYkHzMRRfaNz9+WN5YPeMWNeL+PGewlGHJ36gykHoEGYg2u0HGmyNLF2
	YzDWKuqu85AOe0rG88uFpzA4c80wi39E4G9fw4rBRsJ0J7HpxMtqbb4qlhsy0asXaNCPYcmJeaSng
	00kU7vpntjaaVyBPlwva7B9RxoAe4gfVdiSwwquEtuKExWmUOJcZKy2wPG6friIe8y+85oZnT+PHw
	Dq7W5Lzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPUll-0000000EU4Y-3B4c;
	Thu, 04 Jul 2024 22:17:37 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPUlX-0000000EU2T-0qVp;
	Thu, 04 Jul 2024 22:17:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CCBBECE2FEA;
	Thu,  4 Jul 2024 22:17:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 227B5C3277B;
	Thu,  4 Jul 2024 22:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720131436;
	bh=zI+4NZtH+9RkdSC42kl7ihqfT0SZlGVGeTV3TktbRz8=;
	h=From:To:Cc:Subject:Date:From;
	b=OmbTpfzzDgGJM0VkLaNmGt8M60/BmqkDGHwuOPm4mt/hFPnHCm2Od6M4scdLSgVlc
	 jW5u+6ItYCywu36omkfAFnXim0fuJTfYWR2qKABKyxQM53GxLPY+6alHy+RrmTvV9o
	 RciaUY5kU0MenhLc597U2jTNtC54TbShfwCWdJBRoNG3a7FmGdnd9x/N0/110t1/N+
	 cCBrGzbaXbzeIMGTmHlWJ+aL5Ip7oyzmBuzBpe+OGjWkL0vOuNC/C4Vcs02eCXKvei
	 L5jlHPQyOHK1kHUyagX95QJDbSy+OmQX8aFSXm5rmcpTlR5HMjAoWJMh87ikG25FSL
	 f/StTKSFcr06g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-i2c@vger.kernel.org
Cc: sr@denx.de,
	andi.shyti@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com,
	upstream@airoha.com,
	benjamin.larsson@genexis.eu
Subject: [PATCH 0/2] Introduce Airoha EN7581 i2c support
Date: Fri,  5 Jul 2024 00:16:13 +0200
Message-ID: <cover.1720130844.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_151723_437358_07D2EC91 
X-CRM114-Status: UNSURE (   6.30  )
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

Introduce i2c support to Airoha EN7581 SoC

Lorenzo Bianconi (2):
  i2c: mt7621: Add Airoha EN7581 i2c support
  i2c: mt7621: make device_reset optional

 drivers/i2c/busses/Kconfig      | 2 +-
 drivers/i2c/busses/i2c-mt7621.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.45.2


