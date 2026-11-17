Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9F6606A887
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 10:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Bs5HtfqI;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=FBXGh9Xr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pF2uX8usi/urRyXLEA8qruLqKt0rT757jeRqUbBO8Wo=; b=Bs5HtfqIbVDDSK
	Wjz54sYky+O25Fu5BFIgBcnnUrPjkQ6Wk5KHO7IccVhZHsoaxJ4m8X2iijsj3W3w5xPTYJuwYH0QC
	C1VaazS2b31X+16/X+NCxBX3yPrVKEGZHd20wRF139elz3/ocOZcDUJzqWBgtK22j4LnGaLmVo/f6
	rehb2ezMa5iQVzW2L7leQcQwFjExJez4EMMPMvDodKQqTx0ebIlVA/PP/Ld032uhcRbjO1E2VjvlA
	bN8UmmMW79+By3s7EI01TUYAhaElqZZUCVN7wUP5Ra7Irz7mC/874XDhmmGiWMsreeibObKr53AW5
	9yf8auij1cc7jplzCEoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGZg-00000005IOa-3Mh9;
	Tue, 17 Nov 2026 10:38:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGZP-00000005IBd-1vI0;
	Tue, 17 Nov 2026 10:37:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794911865;
	bh=tzmU+oKL8ufSRRiPnLgwPQcHnJoIFDbyMhFuK367CL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FBXGh9XrZVP9Cs2qXMT19upl0khfXGHZuJ+p1wigI2HcJXTvxl/k4G0YSLXV19XXy
	 QIaLFV31wdlSJIsUsfiN3Bv7BCFm2yhvmLVn9XiRVdTtJ21AkhtgqzqkZb2o4lEace
	 xIqCQq9/pabvbww5uB2tB/qYeYN6lfs0qFl7p9rqYYtt2ReuZ4e8mStNS+/kuypB+j
	 lNfPhTo/ZlHdaBW/kOuTYqvuanTUMklYYQFTi6djmVOVSCtWynfLXG+cjew5kuK4+a
	 j2LNQZiuuPUemcPNXbG2Csd8rv1+0gxncSIFDoM3oIQcJounZzb7A4R8JDDNBVNLxq
	 BUQQnZaac0z6Q==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 88E3917E0D3B;
	Tue, 17 Nov 2026 11:37:44 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	zoan37 <agentzoan@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Ryan Brue <ryanbrue.dev@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>,
	kernel@collabora.com,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 0/2] clk: mediatek: Fix FHCTL DDS mask widths for mt8173, mt6795
Date: Tue, 17 Nov 2026 11:37:32 +0100
Message-ID: <179491184086.148303.17587897994322834590.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113-mt8173-fix-dds-mask-width-v1-0-c8d1e3288df9@gmail.com>
References: <20261113-mt8173-fix-dds-mask-width-v1-0-c8d1e3288df9@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_023747_677147_B03B2996 
X-CRM114-Status: UNSURE (   9.16  )
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
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 13 Nov 2026 14:34:54 -0600, Ryan Brue wrote:
> Discovered this while working on bringup for the Amazon Fire HD 10 (2017).
> 
> In f222a1baec5f ("clk: mediatek: mt6795: Add support for frequency hopping
> through FHCTL"), and 45a5cbe05d1f ("clk: mediatek: mt8173: Add support
> for frequency hopping through FHCTL"), the DDS masks were set to the same
> GENMASK(21, 0) as mt8186, mt8192, and mt8195, despite not having the same
> pcwbits (21 as opposed to 22). These two patches correct that.
> 
> [...]

Applied to v7.4-next/clk, thanks!

[1/2] clk: mediatek: mt8173: fix the FHCTL DDS mask width
      commit: 351444cd006ef61fd925f757e86dfa27a83cc4f1
[2/2] clk: mediatek: mt6795: fix the FHCTL DDS mask width
      commit: 336f7db3af40ccde96849f73cce2952b017b256c

Cheers,
Angelo


