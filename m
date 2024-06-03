Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E17C7C25B78
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 23:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38Xpy1RQYAEE/bLMyyOQflCsEozhARLqUIkUOJC0DDE=; b=qTedkEsLLfOx9R1kDwxUOMmBvj
	YZB776tFff5A9z8GzpIww7ilwvQIj6oaAQKTVqg3TgeQSd3ACcYzUO+LvNQc5YqkD7K45NBTvpnlu
	dsrGGudTADQAJ1UfD3hX+DralausCX9ZZSj7TnKOrBgOOsxv6RJRN8gNTFonUvxqFVucUYg9Sq3tv
	bnHxn+toQrngOYfL25C6X9UFJgpjfgCHSnvbOOCzHAIj3HsS3+Q9AaBDxjyiL7J8DFJppaJLA/G1Z
	wUG2Tib+OAjrOqJznGh05YjSdVjQyRiCJq4bCTCRXBZqvHBkSKIgMXqiSZ4mfbRB7hIn/e93ER2CC
	2FhQrdhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEH2p-00000000cIR-3D7x;
	Mon, 03 Jun 2024 23:24:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEH2n-00000000cHt-04oJ;
	Mon, 03 Jun 2024 23:24:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3B1F4611CA;
	Mon,  3 Jun 2024 23:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4195C4AF0A;
	Mon,  3 Jun 2024 23:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717457087;
	bh=38Xpy1RQYAEE/bLMyyOQflCsEozhARLqUIkUOJC0DDE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XM7juh575+BwlBcZ8fp0bRiLLzJusRPi2ixOuV8ODfzek8cJ6RKz+wuTOZmOmjtsY
	 ayk82edDK3SMswNr1QDSCDH8UgiADMfwfA/I9mS373pboLmUh750GXVyNWPHC262Sq
	 J7oUmQ6s3jgUETrSbg3UE9MmsEDyiflWnj2RWfKtt4fuOsjriSoVUDJc1V6XRIhDV7
	 iYfOQkiTvUykOoVlAAsNe0j50b4O1HQ/jPI+k2VRR+KXmrZWRTWoHRpE6MZ8era807
	 WXyeNS9vtdFM0BMWG9x8rLTISFtfbgGaLDC0urP2hMcE6siaoevG5wyLUDWZO+2ZVP
	 iGAElybhs37Ag==
Message-ID: <d0c692c2b78e2e562dfe5df6388aaf8e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240528121320.160685-1-angelogioacchino.delregno@collabora.com>
References: <20240528121320.160685-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] clk: mediatek: Add a module description where missing
From: Stephen Boyd <sboyd@kernel.org>
Cc: quic_jjohnson@quicinc.com, mturquette@baylibre.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Mon, 03 Jun 2024 16:24:45 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_162449_143465_6B851B5F 
X-CRM114-Status: UNSURE (   5.85  )
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

Quoting AngeloGioacchino Del Regno (2024-05-28 05:13:13)
> Add a MODULE_DESCRIPTION() on all drivers that miss it to avoid
> modpost warnings.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to clk-next

