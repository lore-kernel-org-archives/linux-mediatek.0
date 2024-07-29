Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E330C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 23:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRWYUsOVWmCW1ARRgFXXssRkqPSAfDAPe8/80wD4ars=; b=i4mD8nkoWixNiqcYpvvIk/DdlQ
	5VJtBnWAJ11Az57Jqkus4UtGodJGezy2JB7PIWUVzTRMM+mN7mwfDhNbok7LAMs4mpOr0bTEyzj+b
	2vPFV5iHJIn4EDxXOpoIriy2Euki6vneBjhFlzVt6yOv8y7fS1q9Ftn3F7WVIfaTYePSvDj7A9ORZ
	pyzlLZaWPPUmimrktvTEYXsSLgT/dFZe8wffs/3fh8vJjecM02l9GJ1Abp6VYOK/HRs+u+srkXe9e
	JU/rWJEz353nfW9zujkp1PIG1qhO3dCL56tFutEqx8Ewa+IFTIM30svOym2nF32JtKR1Fd4BqD0+D
	2hsYTioQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYZXF-0000000Cz4C-434P;
	Mon, 29 Jul 2024 23:12:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYZWn-0000000Cz0U-3DaA;
	Mon, 29 Jul 2024 23:11:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4371ACE0E38;
	Mon, 29 Jul 2024 23:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6D5C32786;
	Mon, 29 Jul 2024 23:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722294697;
	bh=zRWYUsOVWmCW1ARRgFXXssRkqPSAfDAPe8/80wD4ars=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=FZsjA2Z9icRNAfDBcYD+obscw/zmL9iQkCsVmgzoFdUzkNzMhqpiA594H2Kr/zcpe
	 jSkJMnG6O17tWP8VmOhpIYjKBxeZ731Wvu9KAWl6yjI84gYTF/A6cFc5N9bSVx1iyG
	 EJAyohZSWzi227B8Dc2USOkWzqfMZ458az4ThNe0f2BYcj1Uk118NEmHW2l6hXvlua
	 3BWicbIwwzKOtA8q32lJGrp9EgAxnzRroSK0BFooJ5f1lhOcXjD3x7CiZ2OxNAyE3T
	 sOGR/rfzVBleTDRE4dvrdagVZS43Kn6GBkiXhJOLigGe+V7vlUV/vHr8n0e3K1gGHY
	 ZApXXKdQlH9mg==
Message-ID: <076d5370a9b163f46170a6f581088246.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240718082528.220750-1-angelogioacchino.delregno@collabora.com>
References: <20240718082528.220750-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] clk: mediatek: reset: Remove unused mtk_register_reset_controller()
From: Stephen Boyd <sboyd@kernel.org>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, mturquette@baylibre.com, p.zabel@pengutronix.de, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Mon, 29 Jul 2024 16:11:35 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_161142_002142_578F81C1 
X-CRM114-Status: UNSURE (   6.65  )
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

Quoting AngeloGioacchino Del Regno (2024-07-18 01:25:28)
> Now that all clock controllers have been migrated to the new
> mtk_register_reset_controller_with_dev() function, the one taking
> struct device node is now unused: remove it.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to clk-next

