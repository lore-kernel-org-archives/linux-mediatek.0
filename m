Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EEFE77188
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2025 10:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AD/DE8NIn/ayeZ5Uk7GGnjbmNCvr6K8FNetSTwQWuWo=; b=W6KlI43EmjIP4kMgVCeuRQMpa/
	3ZxS1Dp+to3Qv4YF6g6oqvhKYbbBQqbwmVC60toDaP8CHPygVpYTEbCntgGbLk+hP6zU/TUhvov+G
	s0zuGFf5BZ6KnrzmpKM+1qF+QWsPYDUTKBV8ujBgu2NWN7Fi1dssQAFJfmPm3xB2TQJn+gNBTDdfT
	Y5qh7rZjl8Fhj1zDuZhxcHJTJxtkX67Wvq/270d3L7wkIDg7fBSmk61koC+GzCDg2SpTkW7fJ6Kob
	zNUoKKgZnQf4valvIwOstdZpYlpTRmesKcAPffeoh3/gxy3JnnaAL80D3+5DkPfpI5cnxtgLXkELV
	8vebyLQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVT5u-00000007wJ5-0IzG;
	Wed, 08 Jan 2025 10:15:22 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSzO-00000007uky-2NuB;
	Wed, 08 Jan 2025 10:08:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736330916;
	bh=qUE6a1s/T1/9RfaxklpsWiTkF/AvmrQ9PTOphkSNPPU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CoTVEh57RI8ExPBsxJKK8lVChF5lUPOTTzpcJAswONzCbwnzr2ZeKWhBK0CFoRKFa
	 LvHvTyreUWL3FtVKvIDZQd2hz71n0FZ5EFhlq80n7KSsscobl3LGGNgqIIRRCXHgMU
	 eZ7VJOaW2N//pk1k8R8oL/18anIoi8+vejCT/rcPc3Z9byI9Kom2JzZGJvhGgpeVB4
	 LTkLrocupac3DrCs+fqfAIRPbRn4CPpwVmjbC4Q47ji6j/QjYZ4gEZN3JcgOyqLj4m
	 WchdHHgw7/c7XW8QaFVJJcJZjsGHsR6rOiZ/9CVWtGCYBBuf+9bHRRFgKWCFzYWmHW
	 l5gzrY4Nm9ovQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8618117E1553;
	Wed,  8 Jan 2025 11:08:36 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,2/3] MediaTek driver updates for v6.14
Date: Wed,  8 Jan 2025 11:08:23 +0100
Message-ID: <20250108100826.32458-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250108100826.32458-1-angelogioacchino.delregno@collabora.com>
References: <20250108100826.32458-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_020838_779288_35153715 
X-CRM114-Status: UNSURE (   6.53  )
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-soc-for-v6.14

for you to fetch changes up to c9c0036c1990da8d2dd33563e327e05a775fcf10:

  soc: mediatek: mtk-devapc: Fix leaking IO map on driver remove (2025-01-07 13:13:57 +0100)

----------------------------------------------------------------
MediaTek soc driver updates for v6.14

This adds fixes avoiding iomap leaks on error paths in
the MediaTek devapc driver.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      soc: mediatek: mtk-devapc: Fix leaking IO map on error paths
      soc: mediatek: mtk-devapc: Fix leaking IO map on driver remove

 drivers/soc/mediatek/mtk-devapc.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

