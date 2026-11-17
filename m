Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C590606A32F
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 10:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wxGyVbHJ;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=aG0yeLuY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/oGiJHm/jh1FUNLOdXcbYyLNEuc+U0PJnk+ui2av96o=; b=wxGyVbHJFs+4qf
	A7fI6zrp7C4RYUPTta6p0C4cN5pLzq0UU8rnB/WkohQZRP8PRHUPA4+nmGnxw4Nv2Wgb8wanemdpD
	x93xQVC3g7ui2c7+H6KKTd1yN7pA4GvrduX8Wuj1zIY7sPiBO1+4xHP6LqzTm0wA5nWV53X9oK1DZ
	6siRm3rFn6963HGnQfgGdpyNCe8Nc/koU2gcG2UnA8nTeLYrAR1PjKEcoqLgRiLGz8Zra/sjoxJiZ
	aB4DSp6QVXyoQ+GqDi7Ml7FoJpbNL+5uWcN9b71QRRzIkAX8YJwJdydIjci311HmlsUZVx8XpaLg1
	bK0BntTsiMOS4rTyAMGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGZh-00000005IQt-1uS0;
	Tue, 17 Nov 2026 10:38:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGZQ-00000005IDO-30xL;
	Tue, 17 Nov 2026 10:37:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794911866;
	bh=VOW3N+kuAOhlQXMVPIKqUw8yVwXy/w9NQurJNFZ3824=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aG0yeLuY8OMnE6Cf2ENdM+pBOa2xVk8BB7i+rUJa3ZPKf6EEagNeE/cLqZj+KDzMl
	 B+2rit060SVf8Fl0Lb7R3KzJZMEeBDhWXqwjsDKf1vgbevsUfdCsjxjckuPrj+389h
	 AuxR/9X3ZVWCtd8ir9+Z9q8SeT50dODfe0CmmBa6EzqtzEWvE2W3VAtT/KPvGFYTBI
	 SvjHgwie7k2wL5k7v6U71LmuXpSrB3it2GQWuYBuClo3+gMgn+P3uiGLHX/4YBbl32
	 2V7DEgaj4Cj1+Wbf6qoVb09V098q9GC9hNq4FepGPCD/qZffIu1aBs70eMa1+hS7qy
	 unczhdnjFCVIQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2C3F817E0390;
	Tue, 17 Nov 2026 11:37:46 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	zoan37 <agentzoan@gmail.com>,
	linux-clk@vger.kernel.org,
	Shiji Yang <yangshiji66@outlook.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>,
	kernel@collabora.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Jianhui Zhao <zhaojh329@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH] clk: mediatek: mt7981: fix "emmc_400m_sel" clock mux sources
Date: Tue, 17 Nov 2026 11:37:34 +0100
Message-ID: <179491184091.148303.8587843697634686350.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <OSCPR01MB1501934D1DC407B535D78F02EBC992@OSCPR01MB15019.jpnprd01.prod.outlook.com>
References: <OSCPR01MB1501934D1DC407B535D78F02EBC992@OSCPR01MB15019.jpnprd01.prod.outlook.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_023748_997118_8D7D2787 
X-CRM114-Status: UNSURE (   6.38  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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

On Sun, 18 Oct 2026 13:50:16 +0800, Shiji Yang wrote:
> According to the document "MT7981B Platform: Registers Part 1", the
> 4th clock source of "emmc_400m_sel" group is "cb_net2_d4".

Applied to v7.4-next/clk, thanks!

[1/1] clk: mediatek: mt7981: fix "emmc_400m_sel" clock mux sources
      commit: af557feaed1f9344666296284cda362d4ed53a9c

Cheers,
Angelo


