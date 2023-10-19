Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671FFCDB47E
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 01:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUZhWZ79erjaSfTdxeE1JrWVoFRWDI4ePY0o4tnzh4k=; b=1sKt/X/13ZurJMKTIYaZgVKFbl
	wWkB7V+1v4gy7zpQ3vf7eKgIX7YjiL+ZTKj7CZBjODo+JosJI9npeLBF0X2IHO6dtLwmUqpgVpCtm
	kZIhGXluLZJEwC8LejhHuiOn/u6Yot7DaiBVp2dGy9m13cVDvOAubRpmN4yexKyWDpAu881kNQxs1
	MNuQX+jzKFsUknqQpCVv7BT+uGgSzItEnqgd9fsn0hr5BREjN0rozKk9zRH08tUKh/MkM8ocxgSSQ
	JlpCqIGBXPH7Zr0cjPq0NzWRYzVgz0BKUziE6YQ4rWvLkCGhQrzXkw4zfmX7JagL4dViU7YgDSdcz
	mzZ0dNKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtHdt-00G2rw-1P;
	Thu, 19 Oct 2023 01:16:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtHdp-00G2q5-07;
	Thu, 19 Oct 2023 01:16:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8F20B61A27;
	Thu, 19 Oct 2023 01:15:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A740C433C9;
	Thu, 19 Oct 2023 01:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697678158;
	bh=vUZhWZ79erjaSfTdxeE1JrWVoFRWDI4ePY0o4tnzh4k=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=L/G2JhJiPncfUI1xC2WHpYTY0V/5L5EB1arbw5x9xUF3Ba+mMrrFgXkbRyfkZemwQ
	 zNenLyhDdqc2Khc2oiMpEm7A/B5tB5Q5JXgM+pOAClOIiXJb++rCTrQj4tQe1K+7x1
	 Fa6yqsLlagskWj1JPKPwqk57W/o6oDlOQfoGUopfETFzgLXkeJLnNqHWdJDam/dDhf
	 CMZsIDSObLj1iFFz82jn46SUwnkxpaFYk6IwR6MJ9rKuoLbcEPhTk2r0i6OUXviTRb
	 qLdnbsAWjaesorOB4bq1tAtAacRbzGq2FJO/y7+e1NTr2yDqI6DmrRMBbQM+qcFvIF
	 ikS4aVZFwhLtA==
Message-ID: <73db73cf73cb14cf9d526a9fec7d1344.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230912093407.21505-4-jiasheng@iscas.ac.cn>
References: <20230912093407.21505-1-jiasheng@iscas.ac.cn> <20230912093407.21505-4-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH 4/5] clk: mediatek: clk-mt7629-eth: Add check for mtk_alloc_clk_data
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, amergnat@baylibre.com, angelogioacchino.delregno@collabora.com, cw00.choi@samsung.com, frank.li@vivo.com, kevin-cw.chen@mediatek.com, luca.ceresoli@bootlin.com, macpaul.lin@mediatek.com, mars.cheng@mediatek.com, matthias.bgg@gmail.com, msp@baylibre.com, mturquette@baylibre.com, owen.chen@mediatek.com, robh@kernel.org, ryder.lee@mediatek.com, u.kleine-koenig@pengutronix.de, wendell.lin@mediatek.com, wenst@chromium.org, wenzhen.yu@mediatek.com
Date: Wed, 18 Oct 2023 18:15:56 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_181601_255125_5F823A2D 
X-CRM114-Status: UNSURE (   7.53  )
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

Quoting Jiasheng Jiang (2023-09-12 02:34:06)
> Add the check for the return value of mtk_alloc_clk_data() in order to
> avoid NULL pointer dereference.
>=20
> Fixes: 3b5e748615e7 ("clk: mediatek: add clock support for MT7629 SoC")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---

Applied to clk-next

