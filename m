Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F339E606A334
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 10:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xhQfiAhO;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=c8Tj4FLN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hoWf3LruwvxscR/X3fkl3XvLYalXXkWV48a76CyMCi4=; b=xhQfiAhOhoLIKO
	xIuy5ADvh6nXSPL1tY3yupR45AjCfJEsDuOQcRoMSbCp1fJnHtkJN/Y63JfZ7bCYxnXbeQZAK8s0Z
	7lXEDp7Y8od2QX+4dSisxRDjyxwZqMo71E9c9pvnys9v3aeb5dZAeY+Cys+wATomWGCp408jsTIR9
	KFBr8gxmnCgCyIHFkTVt1OQT9dy78q7pZLZvVZ37MdKqnhBEt5k14HjxazvkM9k4LPvr6Ct2LiR7C
	4rxUEpscTnGV93DxShPVDCcNH9BzklOpchnekxfnVYDrV5KivtWpN91z8JGWPUeNTMNPEwnpPiZHf
	UqVuTpcJAm1USCG7xQmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGZY-00000005IIZ-2xeD;
	Tue, 17 Nov 2026 10:37:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTGZM-00000005IAZ-09GQ;
	Tue, 17 Nov 2026 10:37:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794911862;
	bh=wEBiVaD6NsiPNk+K0zY+bNHgPd2fjrZ3R/9puTARgmQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c8Tj4FLNlUnIrv9fqoaXqE/BZBck8Dbtrdf5PzvtJwo2R56GdU5WAPkpiuMknu0If
	 kPjuRX7Mmxt9XG/4Mqr3tN+37orXSVUCUpE2kgwOr/ZY6n8/kl2vFYWVSjOfHqXNmA
	 MjEtF2m9mfBOyrii4nj6EV+a9QctWlmSERrXhoKA3+KRx36f7HVSndX+IB4TsGTM62
	 XwVW+/GIs0liH7ATNba7qUJp5TSedIRu5kVMWvINsPjZcnOY5EFtFZ21pZ5leIEmOy
	 J10NkT00A6+IXR2ZgEt0d9dlz7Az/6T2mVYQbWU5r/nIg+rFgNewNhurFLXpzTU5Ug
	 L/Q1YUTO79V6A==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 34A6917E07F6;
	Tue, 17 Nov 2026 11:37:41 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	zoan37 <agentzoan@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Irving-CH Lin <irving-ch.lin@mediatek.com>,
	kernel@collabora.com,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Laura Nao <laura.nao@collabora.com>,
	Sjoerd Simons <sjoerd@collabora.com>
Subject: Re: [PATCH 0/6] clk: mediatek: Fix descriptor clock ID allocation
Date: Tue, 17 Nov 2026 11:37:29 +0100
Message-ID: <179491184088.148303.2061993914612529497.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921102522.1640072-1-akkun11.open@gmail.com>
References: <20260921102522.1640072-1-akkun11.open@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_023744_227921_342F93B3 
X-CRM114-Status: UNSURE (   9.02  )
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

On Mon, 21 Sep 2026 19:25:16 +0900, Akari Tsuyukusa wrote:
> Several MediaTek clock providers have clock IDs that do not match the
> size of the clock array allocated by the common descriptor-based probe.
> 
> Add dummy entries for missing IDs so that the allocated onecell data
> covers the complete clock ID space used by each provider.
> 
> Akari Tsuyukusa (6):
>   clk: mediatek: Fix MT6779 clock onecell IDs
>   clk: mediatek: Fix MT6797 clock onecell IDs
>   clk: mediatek: Reserve missing MT8167 clock ID
>   clk: mediatek: Reserve missing MT8173 topckgen IDs
>   clk: mediatek: Reserve missing MT8196 MDP clock IDs
>   clk: mediatek: Reserve missing MT8516 top clock IDs
> 
> [...]

Applied to v7.4-next/clk, thanks!

[1/6] clk: mediatek: Fix MT6779 clock onecell IDs
      commit: 8dcfe9e6b3cc7e0a2ae54ee89b27fc75048875d9
[2/6] clk: mediatek: Fix MT6797 clock onecell IDs
      commit: dbed26f4c489548a1aed48db66ec9d7b98f4189e
[3/6] clk: mediatek: Reserve missing MT8167 clock ID
      commit: 3ccbdb37d10af155da69a7bf26dd68e62abd45cd
[4/6] clk: mediatek: Reserve missing MT8173 topckgen IDs
      commit: afd8231b5a43486458b5b17608e7f9986bfde675
[5/6] clk: mediatek: Reserve missing MT8196 MDP clock IDs
      commit: 8779893558124fd4e4a189c2bcb1ad4ae7014e9e
[6/6] clk: mediatek: Reserve missing MT8516 top clock IDs
      commit: 24bf5189aadf39d713b33e58b61f39854a99b1d9

Cheers,
Angelo


