Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353EA606A32A
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 12:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q0XOWesF;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=aUFYu/aA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=E4Rle7Q6Lm9Iu8CfkhrIoWVqCRbwUE2Go1RbpzqI5ys=; b=Q0XOWesF1HyzAM
	sUK7Dv34X55ke82jnPEndRE+wFVCA1beyJE++RJWJeHOAzB5Bh4XXyHo6n9j+WuaJsRojmWdU2Mg9
	oErtLu+kEGecLG0h9JA1oKo8SUzC/MEaQ0IJXfi6yV3SonRk6heBLQQKKzt45S7CBFp4/QJZpB12H
	WCrarN02Eh3ePDOnrkieWetLF9VKJPOlFTZgdDkX4yWvx3dP+vQ3xqZTPMspjAQMrMHgQkD0H7D8c
	2yJcuSWLwFnmqU1ptsy8jngvs00wP62JWykPmiY4vlXISzohoS/7NiNU7SfY+HHKp2tOPAQCxqqLK
	zL1tOmGgxAnb3cOsQkAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTI1P-00000005am4-3lJ1;
	Tue, 17 Nov 2026 12:10:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTI1N-00000005alM-49mJ;
	Tue, 17 Nov 2026 12:10:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794917444;
	bh=UtLyPrLif+1FkNX3cyYh/hMM2psbP79LBeslRtUW5GY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aUFYu/aAghtrwARrPCsrnEPNZlBSa5Rd3KjQJoYBN0mSZ4alYMcf6oScMh8GiXNZV
	 tahMRkAmCaks3ZnG0ROcbGwi8gE8tiNkcNSZruLc4/de24W1QXVFov5pDyN6jLr7AX
	 L8Bu9E3cVpc2WTxQntlckk2jsnRRjPKQASnomqNaaoaDXG8i25NI1bWtv3jFC2kAWD
	 SwCBecBy8U7iSwviPKF7UieqIxrrQYOYww6EjYN2s2f55wi0hjRaLnqSOd/NJYjRtG
	 HFMm+j54W/tYcGbbCPX+SVba7YeXv9bqdHwP2hbN/npYLcW+xJk2gKgCB88OqHij9n
	 x6b39ubn1GdpQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E2D2817E04B4;
	Tue, 17 Nov 2026 13:10:43 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org, 
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261117120934.728612-1-l.scorcia@gmail.com>
References: <20261117120934.728612-1-l.scorcia@gmail.com>
Subject: Re: [PATCH v2] soc: mediatek: mt8167-mmsys: fix errors in
 multiple-output display paths
Message-Id: <179491744386.180525.1057948334056427930.b4-ty@b4>
Date: Tue, 17 Nov 2026 13:10:43 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_041046_189190_034DD66D 
X-CRM114-Status: UNSURE (   9.27  )
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

On Tue, 17 Nov 2026 13:09:12 +0100, Luca Leonardo Scorcia wrote:
> Some display blocks can be used to define multiple-output pipelines.
> The current code uses mtk_mmsys_update_bits to clear the mask bits and
> set the desired output block bit when initializing or disconnecting a
> pipeline. This breaks multiple output pipelines (only the last one set
> produces output).
> 
> Fix this by using the block bit alone as mask for multiple output route
> components.
> 
> [...]

Applied to v7.4-next/soc, thanks!

[1/1] soc: mediatek: mt8167-mmsys: fix errors in multiple-output display paths
      commit: ffcbc063e8df3cdb50576a4bc20b3d9669e2c43a

Cheers,
Angelo



