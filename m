Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB2D606A8AE
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 10:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Qeo/C4jb;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=BI/rwMNA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OCzz8H3TxGw+/7vThngYzbxdUKCNb5ZLl0FSNCHEuDM=; b=Qeo/C4jbmfOYpP
	NMkFa+IZFp2QaspVE8vj5AGI5mZv1Cu59MGV7ftTaDQacvVnWWKXhG3f1CfrBERW//nhCve2Uv9tb
	6wG4nyw7q71t/M/lNJKlqaypGlboC82JQ2LH1odXVyfCyTzmO4Tv6n6aVKPAyY1ytBjJomo4u5W1g
	UK29pYN7pRRLgG3bRb5d21mmEyu+wfV2mfEqePtZbFjwZO8F1n7jCfHUrmFVejxQW3xdmf1yTGz+c
	9BvNzr7bY55DARAvo/NWXQY5GXi9ki5DGyEvbcuGTIpg3qQI0j1Z49d2F25ksS+OdqHUEWiv3bVkK
	8NEW2HvSp1jVt/xhfvIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGZO-00000005IBy-0h3c;
	Tue, 17 Nov 2026 10:37:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGZL-00000005IAT-0wOc;
	Tue, 17 Nov 2026 10:37:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794911861;
	bh=oLqHnWeNPaNdJvvx6L2o2mFp/Q4oW4bnbdNmRLKxZDI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BI/rwMNAkcMEaokg5Oiw8hB7K9Wjfa9zEQ0Yu/i7ruK9nuDO5Cna9wNSTCEpy6eT0
	 cwBldOlab7IGa3B9krgUJ1ugvTykE4asthlyc4+kk7A88T0BPCU4HdlE6fJtGBhXWW
	 8u+IglTLU1ges3fmtfS9al5H4ZPcD/EKbxPWuZSbWWxqbHOm/N0EbKM+u8SZI+34fw
	 CFbuoS7CRWMPg3eBfmMmoZcdRGyh92k6CFER1kk9z9zRdQ+DIUYLUq6Hev0lr4b0Up
	 V0UpjC3UixsWoRhD80a3rHQDm7EoraFgOgmXU8XiJlcHRF3t31J6YGMTLcCuUlsMQG
	 BAkkCRUe2oRJw==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5F2A917E0390;
	Tue, 17 Nov 2026 11:37:40 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	zoan37 <agentzoan@gmail.com>
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
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: mediatek: mt8189: Don't let the GPU reference mux retune MAINPLL
Date: Tue, 17 Nov 2026 11:37:28 +0100
Message-ID: <179491184090.148303.17314033722735832543.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011195612.1663714-1-agentzoan@gmail.com>
References: <20261011195612.1663714-1-agentzoan@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_023743_441104_56FE7E89 
X-CRM114-Status: UNSURE (   7.87  )
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

On Sun, 11 Oct 2026 15:56:12 -0400, zoan37 wrote:
> mfg_sel_mfgpll selects the GPU clock from mfg_ref_sel or mfgpll and has
> CLK_SET_RATE_PARENT, so a GPU rate request (Panfrost devfreq) goes
> through __clk_mux_determine_rate(), which evaluates both parents.
> mfg_ref_sel is a MUX_GATE_CLR_SET_UPD() and so also has
> CLK_SET_RATE_PARENT, as does its mainpll_d6 parent: through it, any GPU
> OPP can be met exactly by retuning MAINPLL to six times the requested
> rate. mfg_ref_sel is parent 0, so it wins over mfgpll whenever both match.
> 
> [...]

Applied to v7.4-next/clk, thanks!

[1/1] clk: mediatek: mt8189: Don't let the GPU reference mux retune MAINPLL
      commit: 838ddf25b4f1350a115d8921b47e9bbaa773a26c

Cheers,
Angelo


