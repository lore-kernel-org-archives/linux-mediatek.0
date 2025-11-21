Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D197ACFC296
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Nov 2025 16:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h1L8e0nn3UwXox5w5A3jFc2qYY11/+kLmICyTHJbyo4=; b=1WJHjIQc79qgkmnAOVVCDx3w8u
	HRYpIiAazOinbQIyr69+y6B9cujMt0P5rD7Nc2C4O7MtEg6V4vegP3Er/oLG2smqpRFKyR7obigeW
	QEAgULi8fzFS3npRq8QCnG4/bezSRU3kLjlEQAJWAZq+OS1UVPELRBrP7e4RhxsWkZ3AHCYGhMWVj
	Mr2qQejPdkzXTDbiWLKU4TsQJ+ZKZR21ya5cgPahjmkPQXWJwm1HGT4lG1OSP69ordiyy9gmMdYzM
	GEFonC0GGjdqOEw4cwDyNwUoedV9/moMf4a/w4FV3h+25jWlykZFojiFCww/JuFfpPEE6/XSH3j8b
	W4NfpqrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUHl-00000008kL4-0MhB;
	Fri, 21 Nov 2025 16:47:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMUHh-00000008kJI-0dKc
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Nov 2025 16:46:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 386144337C;
	Fri, 21 Nov 2025 16:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14376C116C6;
	Fri, 21 Nov 2025 16:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763743616;
	bh=qPrRrks3lkuVdZGFh9a/tHI2ithotZsYC8unMEeS+yE=;
	h=From:To:Cc:Subject:Date:From;
	b=dMyPNpM6MGeTG5ftxiY0uwzPEzBb4lRFchO+7Zubrys1wPadDYfCEWXRHJoRcLm3Y
	 GZrBs6+WnMWiNySYi4Y1NeZNyZLzuwQAaIE91ag2x7zTSHnYrOUtNSD+E9A79+xnD4
	 orPk5TcySltBF8irtXWg9trQlRtjeFjX+G3S6wPCXWrfvkhBbAJJLl8eOcs6aFpqwq
	 WHuNU5r13luDpaA++x6tLS7iKAgrZcJAZQr1agaPL50d9HNsTgU+EwUMtEFXSCweTa
	 qgP59rQuoiWNB1xwuQqKRWUFG0Ne1COpnPqo1JJJNbkh054Mb+8wgvdcBY3Edv/iWn
	 c4501c6oSvBjg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vMUHh-000000003ZN-1Arw;
	Fri, 21 Nov 2025 17:46:57 +0100
From: Johan Hovold <johan@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH 0/3] memory: mtk-smi: fix device leaks on probe
Date: Fri, 21 Nov 2025 17:46:21 +0100
Message-ID: <20251121164624.13685-1-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_084657_229203_3D3F1FB5 
X-CRM114-Status: UNSURE (   5.98  )
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

Make sure to drop the reference taken when looking up the SMI device
during probe on late probe failure (e.g. probe deferral) and on driver
unbind.

Included is also a related cleanup.

Johan


Johan Hovold (3):
  memory: mtk-smi: fix device leaks on common probe
  memory: mtk-smi: fix device leak on larb probe
  memory: mtk-smi: clean up device link creation

 drivers/memory/mtk-smi.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

-- 
2.51.2


