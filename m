Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68FD4CD1297
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 03:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QzOkavWBdzojcTXfBnZjWgEzp813BhmfxvjhEGotijg=; b=uhZXRbgT0H8TAd8eGZsQoEwR0u
	tf4qduh8FTMwnoeMrqToH8afIEVn8Xe4CUpeeEzHkNQgAnz+Bk5JU6B3hQ8YpCxG0jvrWutJ8k126
	NXmULQACU5J7mMlHUdj1MEcRxbR1Ph6imNRcTMpX3y1w+DgYZXuX7uqrUvcWTmW8M6MJvhY99cu3B
	cOq2LGPnaXQ4bRAmUBS23umZk0SgWImSM8nvTNInEVuNcL3upCbAuXaP8YXvGuXLzVNkMNgxDms+1
	7BghNNPxKGT8yR9Az5YRpkNiIEjz5P/0ioLFAQcwJUu/EYryAIf1vTf5qdOcAYVDuTc47L+z0Pctc
	JlbF9pxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rulTP-0000000ADuV-06Tx;
	Thu, 11 Apr 2024 03:51:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rulTM-0000000ADtm-0uG7;
	Thu, 11 Apr 2024 03:51:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ACD8161F3B;
	Thu, 11 Apr 2024 03:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 467C3C433C7;
	Thu, 11 Apr 2024 03:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712807495;
	bh=QzOkavWBdzojcTXfBnZjWgEzp813BhmfxvjhEGotijg=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=pi2yBecI8C4BqcYbx1BNEu5dvdBLrZH6KG97GjlRif1s6wcGuUt3d7tV4ad5lZh+E
	 LaQTShoA2o7O25i4goWwKgZGDTnO+Ood0N8tAYiXF++z3EWTOS6wTyCU4SELlrFP+n
	 MPM1fi5fDQ/aWYVQp/HEFZ5gCZEkN1N/3JbhfOZbyrJnavVfO17QtWmXDExgWC390v
	 hq2cfIRzJ4sPYPD3d2eSv0qG/XW8ZDHHd68rnxSYuzrG9qrpT5yYawU7GxgYpUXjd7
	 6cyEO9HDaWQVzrpd7WwZObiIN8DzsxhHJTqNHyoQMLjq0zGqwt/ZKLBPJ/RHNrFjmZ
	 TXAf9mvwF9iJg==
Message-ID: <72a9ba5cf9384acc89c59123d3c1ea18.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <279294c6bfb8af858c2d522dbe3b76b2.sboyd@kernel.org>
References: <1da2506a51f970706bf4ec9509dd04e0471065e5.1710367453.git.daniel@makrotopia.org> <279294c6bfb8af858c2d522dbe3b76b2.sboyd@kernel.org>
Subject: Re: [PATCH] clk: mediatek: mt7988-infracfg: fix clocks for 2nd PCIe port
From: Stephen Boyd <sboyd@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Golle <daniel@makrotopia.org>, Frank Wunderlich <frank-w@public-files.de>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Sam Shih <sam.shih@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Wed, 10 Apr 2024 20:51:33 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_205136_334585_8DF5A398 
X-CRM114-Status: GOOD (  11.85  )
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

Quoting Stephen Boyd (2024-04-10 20:47:55)
> Quoting Daniel Golle (2024-03-13 15:05:37)
> > Due to what seems to be an undocumented oddity in MediaTek's MT7988
> > SoC design the CLK_INFRA_PCIE_PERI_26M_CK_P2 clock requires
> > CLK_INFRA_PCIE_PERI_26M_CK_P3 to be enabled.
> >=20
> > This currently leads to PCIe port 2 not working in Linux.
> >=20
> > Reflect the apparent relationship in the clk driver to make sure PCIe
> > port 2 of the MT7988 SoC works.
> >=20
> > Fixes: 4b4719437d85f ("clk: mediatek: add drivers for MT7988 SoC")
> > Suggested-by: Sam Shih <sam.shih@mediatek.com>
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
>=20
> Applied to clk-next
>=20

Actually I'll send this in fixes because it sounds bad.

