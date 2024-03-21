Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651C6C54E68
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Mar 2024 08:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JYCsbY7FC+d5V6cXvRg80M4kCteyMUCiyQkRFEwj2Fw=; b=rqO8nVoLlJon6n0gcclVcrw0PY
	NuWQoEMqQFktD1nBA0PgYJhfhQAABWWDaHhbGcskvg2nc3unFtcllwIMGUFuCjWuYhtWMbfe8EpeZ
	as62gUKtCm8pJ94hxRFaKMmrfMK0jD1MxzysMu9Gi0rmqkj1RNU+VC94YDuBtsdzbVOIJELYIIniq
	G88FEq6YOZkwf56MMu3pTjzJlnC0Nrj5Kb2JWlwog+qmrRBHQHwygcfLYuKzFPJvedvVPrBXGxz4p
	Q/QZ2Hmf376Ne9ZnIlpsCOC0/bZcW0C9XZh5DhmPeT52fTXCOxZUy+Vm2SYcbWUnwWii5wvPFIcGY
	0hVNsN5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnE4M-00000002N4c-3zJC;
	Thu, 21 Mar 2024 08:46:38 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnE4H-00000002N1U-2T9H;
	Thu, 21 Mar 2024 08:46:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711010791;
	bh=uni785XgmjmNkc/C23w1CJqH5avsHkxBrwb1KdEt5Ug=;
	h=From:To:Cc:Subject:Date:From;
	b=0v4EnGUW/G+xUFSL0VQe7KjxUcQxDvhnhP2i1M53K5NMejlWaqYDaj0KD9UUGxVGT
	 ziwUND22GEr/gDVsiWUdSav1ftJcpM4XPcR10afH1XoZ96rk8O7UgDFVnSbN2sKiBv
	 j1k/3tCWk8iRSxZc8ndGZon8VY4fxhlaw63kpqC5RLYrplPQ/7fdSdb5XdJ1uYCH9O
	 MyazSPQ4kiZoKl/oWabiVkskyPBPmTx/uwpEZPnCaQ1B2XwYJn5GkJGsXWhW1Udto1
	 Vm8H8RJyHFyLs3qSYcZXc8w8oHOE4atiu/r7hkI6Pzw4AHbI1UzNCG87NbjO1G5h1R
	 +h0pQClHi7LqA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 97B4E3780BFE;
	Thu, 21 Mar 2024 08:46:30 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mathieu.poirier@linaro.org
Cc: andersson@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	tzungbi@kernel.org,
	tinghan.shen@mediatek.com,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com
Subject: [PATCH 0/2] MediaTek SCP: Urgent fixes for all MTK SoCs
Date: Thu, 21 Mar 2024 09:46:12 +0100
Message-ID: <20240321084614.45253-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_014633_825606_7E12353A 
X-CRM114-Status: UNSURE (   8.78  )
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

This series brings some missing validation for the IPI buffer size
that is read from the firmware retrieved from userspace: if the FW
declares IPI buffer offset starting at an out of range address, the
driver doesn't do any validation and naively goes on with IO R/W
operation.

That poses various risks which I believe I really don't need to
describe, leaving it to the reader's imagination :-)

Please note that the first fix is URGENT.

P.S.: Of course, this was tested OK on multiple MTK platforms.

AngeloGioacchino Del Regno (2):
  remoteproc: mediatek: Make sure IPI buffer fits in L2TCM
  remoteproc: mediatek: Don't parse extraneous subnodes for multi-core

 drivers/remoteproc/mtk_scp.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

-- 
2.44.0


