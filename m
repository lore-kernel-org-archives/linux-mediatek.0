Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227A460A3804
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2026 08:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u9JlcTR6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=bq4bq0oT90GXoLgNGE/Tu4QxnayujsmVrhNZxOI8hIY=; b=u9JlcTR6IJEipMePbF1f4/3N7T
	2e6PA5QzRmgtjCDrIew8sO4fZZsRq/nPPn6LkMi8/cLQq2/Rn+sAqqWB09kXDJYSDsMGnXa2rlkHq
	E2aQTZsgy42X7Gbe/mIcBqkdPd5a0Wcg/CgcECzt0iAVZjyGbV0xiKl/sNuzrguWT9owTe7oyPxpz
	LzOQS04lCF0S/WoSWYQZJW5wHYyy7NPzcEOhEtC6NBzHM3ki+Z4sYiZP7w2azhPcIMv4N4wLStjXi
	WZMd43SV8r1R9vaY0+R5SFBXRm/PU4eEiSXgk1HTnpQYbiv3XLkvBizJi990sU3//SBPVfB9KVlxb
	LZl56joA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR48g-0000000667q-3V8p;
	Wed, 11 Nov 2026 08:57:06 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xR48c-0000000665z-2qFu;
	Wed, 11 Nov 2026 08:57:04 +0000
Received: from [2a04:4540:1401:33fc:b262:f9a8:847e:6650] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xR48Q-001TSi-38;
	Wed, 11 Nov 2026 09:56:51 +0100
From: John Crispin <john@phrozen.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH 0/2] clk: en7523: two fixes for the EN7581 clock and reset driver
Date: Wed, 11 Nov 2026 09:56:48 +0100
Message-Id: <20261111085650.632025-1-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_005702_713426_07257B69 
X-CRM114-Status: UNSURE (   7.53  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Patch 1 stops en7581_pci_disable() from sleeping in a .disable callback,
which the clock core calls with the enable spinlock held.

Patch 2 adds a reset operation, so device_reset() works for consumers
such as i2c-mt7621.

The series applies to next-20261105 and has no dependencies.

John Crispin (2):
  clk: en7523: do not sleep in the EN7581 PCIe clock disable
  clk: en7523: add a reset operation

 drivers/clk/clk-en7523.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)


base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.34.1


