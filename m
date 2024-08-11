Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B238C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Aug 2024 16:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qnK6VtFzuANorty8Dr76XVpQogws1TUqQpMtxwW8neA=; b=l3qrMh1deR3fToSZ0aVs4h7T1a
	TzYKgsMf7Y3CwLiqeNQxKLlakhS+YCEy3U2ILlkI5XCYHaY9IKsIHq1SqP//2el19SMdWTGyIboL+
	AG3fLt4+Wbc/fvBwyTJDPsjYA6kMBPQJOa+FARQ6cPPtjjA9Yxd8AoZP9blbO8J1ImZjkedriaWnF
	Fgq3+GqjZEYuPdS1Pbcu/8LBp59Ij7KdLR6RF/gJsy92lo3IHLNjSWuhJb4iXfxts1TRrgAPkc/wZ
	CB9tPT8H+DijRQRzDbdhXboIsgl6o5WFEw6iHUQ6LU9zeTpN/ZRhHXI+cQk9X/CAUqGyd2FBJlcvO
	WJzAyp2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdBC1-0000000Fnc4-3LIb;
	Sun, 11 Aug 2024 16:13:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdBBQ-0000000FnTr-2WpR;
	Sun, 11 Aug 2024 16:12:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B1A560EFE;
	Sun, 11 Aug 2024 16:12:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0599AC32786;
	Sun, 11 Aug 2024 16:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723392758;
	bh=ndhQ1iirqwmolkgMOneB7kzVvy9UDilTHgGgK02kysE=;
	h=From:To:Cc:Subject:Date:From;
	b=UNPkEiIa9OApcgkcu/W3iG9xvPf51chsAg5Afa2qIJZ2REjAwBSFqbbUOFcucVl5A
	 llgpVY/kK9QR1+E0CHgp893OSrkRU6bEhEsoCFqfKWawFxaogyD1Rbx8U7q6xxAkZb
	 nKm46Mk37av4OyTbW6YnVcrWgplPmKzHkPLa6/rVMoIA9LkC1waaAvuSJkG0ec78Sw
	 SshCfBTe7l/AspQG8BVFHjOL80D4pztFbK3ZEuk6CrrHHPqOkK9KlVNRsk4cOxNDjZ
	 9HCVuvW17xyq68jn+4DRAEsa9EMI20mIT2f9K+M8XqwYqbfrZ+5dyge3u02FJDM5HZ
	 s/ZcJi5uhqkLg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org,
	sean.wang@kernel.org,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi83@gmail.com,
	krzk+dt@kernel.org,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com,
	angelogioacchino.delregno@collabora.com,
	benjamin.larsson@genexis.eu,
	conor+dt@kernel.org,
	ansuelsmth@gmail.com
Subject: [PATCH 0/2] Add pinctrl support to EN7581 SoC
Date: Sun, 11 Aug 2024 18:12:11 +0200
Message-ID: <cover.1723392444.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240811_091240_732040_CFF58458 
X-CRM114-Status: UNSURE (   9.11  )
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

Introduce pinctrl driver for EN7581 SoC. Current EN7581 pinctrl driver
supports the following functionalities:
- pin multiplexing
- pin pull-up, pull-down, open-drain, current strength,
  {input,output}_enable, output_{low,high}
- gpio controller
- irq controller

Lorenzo Bianconi (2):
  dt-bindings: pinctrl: airoha: Add EN7581 pinctrl controller
  pinctrl: airoha: Add support for EN7581 SoC

 .../pinctrl/airoha,en7581-pinctrl.yaml        |  467 +++
 MAINTAINERS                                   |    7 +
 drivers/pinctrl/mediatek/Kconfig              |   14 +-
 drivers/pinctrl/mediatek/Makefile             |    1 +
 drivers/pinctrl/mediatek/pinctrl-airoha.c     | 2983 +++++++++++++++++
 5 files changed, 3471 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
 create mode 100644 drivers/pinctrl/mediatek/pinctrl-airoha.c

-- 
2.46.0


