Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF52CDB483
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 01:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5i2LsXUOUuNZ00paA52ew1UOEi/S4bwIfX1nvj6Vmc=; b=hs+fxN2Tajt4CndSm+R/Ykw+SY
	1tXjg+QH1ZjO2yXWDl500gmUnNvSyR6sxZAuYvMBGryYFeQHGUCW5SBq3bs/8wsL0kPF/RUxOlN6K
	SdMD86tSlGxS9D7P4sjRVMTc3hP4zd9McKE8+qdCXI/KDe21S6L/LFHl7rrPBy7Gg2lszgHrid9+I
	M4gGp+57zrsdBS+vFdkbLv67YZObCD8jfQm43H52ggu6Z/lyZlaPwUWazdAbHNE9pL1SK/Q1+cFnk
	3YiDbWYGGiuzzESHcjPHJAy/Lhc1ZIFBfmeHOI46A8TlGS17iF7is+gWlJI0XfH8nX8UmcA23wJ8D
	58eD+pQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtHdW-00G2lF-0D;
	Thu, 19 Oct 2023 01:15:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtHdP-00G2jP-0O;
	Thu, 19 Oct 2023 01:15:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1B73C61A0C;
	Thu, 19 Oct 2023 01:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABCBDC433C7;
	Thu, 19 Oct 2023 01:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697678133;
	bh=n5i2LsXUOUuNZ00paA52ew1UOEi/S4bwIfX1nvj6Vmc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=k/Xt3eNXYFGxkOVSmnbnQi4Jtpbk4EkBUe0GVQJqVEsab4D9tVK0ek8FobnyVAoDH
	 7d6VPvn5/yW9hKNbqnotpzVACiXv9P/HXoImN9HhWQcj1sZi+pOLWBMH+KzCXDF6Cq
	 u1D8gEdGtffO9SWTcJzZ8JVF4pgYMk6NoUxag1araMvbcuiCLhMPSTgAM//AfhXh36
	 zSsn5HFaC9Wj5QiK4mGl6iK2n1QW+yKraz5hlc9E+z48g2h1VbiLUjaU1yCSBnujKk
	 C/CRh0NcasZXGm3BHidevWGHhEFuQjIuiLG4BL6P8H0TDNdOkMMHGJ6Bj9kYtryX4n
	 Jd1hdwzhMyjnA==
Message-ID: <631c2191b10950d27515883adca6d64d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230912093407.21505-2-jiasheng@iscas.ac.cn>
References: <20230912093407.21505-1-jiasheng@iscas.ac.cn> <20230912093407.21505-2-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH 2/5] clk: mediatek: clk-mt6779: Add check for mtk_alloc_clk_data
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, amergnat@baylibre.com, angelogioacchino.delregno@collabora.com, cw00.choi@samsung.com, frank.li@vivo.com, kevin-cw.chen@mediatek.com, luca.ceresoli@bootlin.com, macpaul.lin@mediatek.com, mars.cheng@mediatek.com, matthias.bgg@gmail.com, msp@baylibre.com, mturquette@baylibre.com, owen.chen@mediatek.com, robh@kernel.org, ryder.lee@mediatek.com, u.kleine-koenig@pengutronix.de, wendell.lin@mediatek.com, wenst@chromium.org, wenzhen.yu@mediatek.com
Date: Wed, 18 Oct 2023 18:15:31 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_181535_207145_EA3B6E72 
X-CRM114-Status: UNSURE (   7.03  )
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

Quoting Jiasheng Jiang (2023-09-12 02:34:04)
> Add the check for the return value of mtk_alloc_clk_data() in order to
> avoid NULL pointer dereference.
>=20
> Fixes: 710774e04861 ("clk: mediatek: Add MT6779 clock support")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---

Applied to clk-next

