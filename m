Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50630606A333
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 10:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1BqIU1pl;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=EMGub12C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jVcJXSf2MKjI+XvP6Hn1S2+V8POAcXEPdAsir9JtGzU=; b=1BqIU1plwGekXB
	VL1PF8w0WUgqm8zJDFY4ydFKkUY5FBfxUHo4ljIQmulgHLB1wvWAuWd81oA5hRXfqS266zSZX1/yO
	0VUop55Aw1uaREqlkIPlMhf2cNjyVcw6Sj+PRslamRvNB3tWDrnn8rWPwXGCLYrK/pjGaKGJeVwW6
	8gzvULng0m64vig1TM9ebtaPpz32b6iixKctnV4jMVeXMvTmD7vqBXMbaQEeXpmYtZmfaIFs9dvrG
	XY0nLRqGQVh0Sntro3pRAKYHqFHSy0V3C0toVEUG0wHAzlcf7l7/rfkC1qeS+MLjMHzwGntbYCnyS
	i1ZaJPHx+PhptCwZd9Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGZg-00000005IMj-05hv;
	Tue, 17 Nov 2026 10:38:04 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGZN-00000005IAr-0zSH;
	Tue, 17 Nov 2026 10:37:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794911863;
	bh=c8zHU6Ay0PGaYY5srsxx8EIZFQ2I29/SDUzcQnfyFSs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EMGub12CyzQOg0T0adgQFcbziZbjSk2tjFMwN+5bT11Hta6j1/P45Tefpp1cgZDJg
	 Yt0NwYAYCreb5CozfAlbaJPhqRqu/CetATSvK+4yJjI/YVRF2qlAo7vmBI0FH+VDIr
	 LxVMN/Q2lOwRZtjeZ2zY8sgkrkjIz6IQNPZnvA8HnbMLFpOXAMjFKcf7Nqoeb1sEiG
	 ebGwkt4R16APDRXkr1F3JGLtFThBY90l9CpyWtTve8+UbvfehtR7o9bDp0OeLeTGlv
	 8jF2zn0EIOZy9Ng70jJpKXm1l3wtvxLULQcPbX/SZtK/0DGI38BuUZ3rzg4fA7GqPT
	 K93Ujy2/iJEoQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3F35317E0A27;
	Tue, 17 Nov 2026 11:37:42 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	zoan37 <agentzoan@gmail.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>,
	kernel@collabora.com,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	Miles Chen <miles.chen@mediatek.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
Subject: Re: (subset) [PATCH v2 00/35] clk: mediatek: Migrate to common probe/remove helpers and fix memory leaks
Date: Tue, 17 Nov 2026 11:37:30 +0100
Message-ID: <179491184093.148303.14975208520347147103.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013151734.3177690-1-akkun11.open@gmail.com>
References: <20261013151734.3177690-1-akkun11.open@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_023745_429639_82C84312 
X-CRM114-Status: GOOD (  10.55  )
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

On Wed, 14 Oct 2026 00:16:59 +0900, Akari Tsuyukusa wrote:
> This series migrates most MediaTek clock drivers to the common
> probe/remove helpers provided by the MTK clock framework.
> 
> Key changes:
> - Fix memory leaks on module removal caused by missing
>   platform_set_drvdata() calls (patches 1-6).
> - Add missing MODULE_DEVICE_TABLE() (patches 7, 8).
> - Add missing support for cpumux, PLL, FHCTL, and child-device
>   population to the common helpers (patches 12-15).
> - Convert all compatible clock drivers to use struct mtk_clk_desc
>   and mtk_clk_simple_probe/remove (patches 16-35).
> 
> [...]

Applied to v7.4-next/clk, thanks!

[01/35] clk: mediatek: mt2712: Fix memory leak on module removal
        commit: 3c764a2e704fad616a96bcba09290fcd4344caeb
[02/35] clk: mediatek: mt6795: Fix memory leak on module removal
        commit: c0c7b6a150f9127b010ab1064fc2bb4fde9a2538
[03/35] clk: mediatek: mt7622: Fix memory leak on module removal
        commit: 0c763c94049c6ccf22d1e19e13b9586e88babc63
[04/35] clk: mediatek: mt8135: Fix memory leak on module removal
        commit: df1bb20a19b660dddcf164adc69447bdbf423b9d
[05/35] clk: mediatek: mt8173: Fix memory leak on module removal
        commit: a76c9a023f985113e1439abe94b436d781097a06
[06/35] clk: mediatek: mt8192: Fix memory leak on module removal
        commit: e2d93b034b987071026b7fd6380e3c191263fb16
[07/35] clk: mediatek: mt6735: Add missing MODULE_DEVICE_TABLE()
        commit: cae5d87256ca44f79a81bb2adf5bedd5e7e0aaf5
[08/35] clk: mediatek: mt7988-apmixed: Add missing MODULE_DEVICE_TABLE()
        commit: 6b87bb39856083653b363126d0cb0f552a883a82
[09/35] clk: mediatek: Fix index in composite clock unwind path
        commit: e322430014a86ebd0d810ea366ddf8cb6d65fa83
[10/35] clk: mediatek: Fix memory leak in mtk_clk_register_gate()
        commit: cbc999dfd9192d5ac99d142d2e6c201ec6502971
[11/35] clk: mediatek: return 0 instead of r in __mtk_clk_simple_probe()
        commit: c68286724520481fb79a75ee5e54121d868f3fd7
[12/35] clk: mediatek: Add cpumux support to common probe/remove helpers
        commit: 4407def71fe314c81079f031c45ebb0ed7e768c1
[13/35] clk: mediatek: Add PLL support to common probe/remove helpers
        commit: 5ca9a52841c0a0cc534ddc6189f27f287076c1b0
[14/35] clk: mediatek: Add child-device population to probe/remove helpers
        commit: ad798877ae16c911d45ed7dc0b7584d5f9d5b2e8
[16/35] clk: mediatek: mt2701: Switch to common probe/remove helpers
        commit: 2bce22ab89e4b73db014138d6ed1bced8c337d46
[17/35] clk: mediatek: mt2712-apmixedsys: Switch to common probe/remove helpers
        commit: a01da26450fc04f3dc6c54c3290745a20adb4b72
[18/35] clk: mediatek: mt6735-apmixedsys: Switch to common probe/remove helpers
        commit: ec06ab79970223c88ade1f75a7e65d2b01f3ab8b
[19/35] clk: mediatek: mt6779: Switch to common probe/remove helpers
        commit: ad1a05ea482df00a12139d49e7af679036959032
[20/35] clk: mediatek: mt6795: Switch to common probe/remove helpers
        commit: 6ee8ec8711a10d7a4a0aa8b673911d9b0e68f2f9
[21/35] clk: mediatek: mt6797: Switch to common probe/remove helpers
        commit: 51f3e418b11779808d8047304fe5256af221a882
[22/35] clk: mediatek: mt7622: Switch to common probe/remove helpers
        commit: 1d2329640c0aea1941851dda592c80d8b6418147
[23/35] clk: mediatek: mt7981-apmixed: Switch to common probe/remove helpers
        commit: cd6f50ee8a20a30c48d583863cf5af8850ddd6fa
[24/35] clk: mediatek: mt7986-apmixed: Switch to common probe/remove helpers
        commit: 5d58e30e027b634e75163cf76cad3f0789aee349
[25/35] clk: mediatek: mt7988-apmixed: Switch to common probe/remove helpers
        commit: 16cf129487241358c5e35a90d3536b857cf40ffd
[26/35] clk: mediatek: mt8135-apmixedsys: Switch to common probe/remove helpers
        commit: 56bc91b655e632b9c38e258ab1b892deeb416685
[27/35] clk: mediatek: mt8167-apmixedsys: Switch to common probe/remove helpers
        commit: d43b35038f424bc6c8cd31f735553dafc4899594
[28/35] clk: mediatek: mt8173-infracfg: Switch to common probe/remove helpers
        commit: 69560f7442c644d52a40c1cd468fc0bb6693af91
[29/35] clk: mediatek: mt8183: Switch to common probe/remove helpers
        commit: 684dd2aed24635d6af7ef261233221525d0479c8
[31/35] clk: mediatek: mt8188-apmixedsys: Switch to common probe/remove helpers
        commit: 25581c463c2bd26c31b13ac27645d65b7a0e5bc9
[35/35] clk: mediatek: mt8516-apmixedsys: Switch to common probe/remove helpers
        commit: 4d756f808ba52310a9c36982096a21800f848a47

Cheers,
Angelo


