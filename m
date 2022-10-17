Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C1BC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 21:08:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PEd3VMfM3ZdUTCnWiOBM/cEisVoIk6qegWHGtLrK200=; b=X+GstmT3nApmVamKnKHdmfe2++
	CsuU0UFAE7UgFy+6hRFbedlrKwHwiOrVBnkI5OHBDldFY8GDSZnnBQLZEqEgxos+USfxx3jLXA5+x
	F4mwgkjeLGonRvK5tYvg1Vbg2aLzwZxIFyiYt5BXbE9Aalmc6Tshwo1TemdT9Zip+TtfIbMamQlqi
	nESI7Gb69Oyk6KY+nUiGt5BZsd0gPNyC9e8c4Catmx6+UW0sUfprW/lBWHDRzXLncMls/X13U/7GV
	xtQaLy07BdsCIMiTX3IyHpMpQX55HZ3+H98ZDcPt0mbo9PJHf1JrwW3W4GVMHN861vqeap93PXLjP
	LmeUYeuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okXLA-00Ewmt-6g; Mon, 17 Oct 2022 21:08:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okXL7-00EwmQ-SD
	for linux-mediatek@lists.infradead.org; Mon, 17 Oct 2022 21:08:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2247861269;
	Mon, 17 Oct 2022 21:08:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75355C4347C;
	Mon, 17 Oct 2022 21:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1666040880;
	bh=PEd3VMfM3ZdUTCnWiOBM/cEisVoIk6qegWHGtLrK200=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=DfqKUKtezIK5olz07bjE9D6ObY92gS+vXbPKLTpYKkOLOf7Rmq3/55B7EJj+QJXk7
	 0YaXf9v+gF9gaD9kp1scQYynsCXFHChs2uUE8Ds2atiiRiRZV8uEM0bIHQYCDAOUBN
	 7ahWhiHCHznExv0d0G8UzVIy7PcK0WueMXeQXpGIwXd5wxS7IP1/mB+UhFZgfIOPsG
	 kfoLr0GJ5WquSzI16sZ/IBw8U9oS8BM3XHkcnppY9dIF7Yedxsa1Evh/kYE3Ab2t4x
	 cOa7/gqOGXSDuzWSzKTF7NYhwG1eKeEBPqAQyIfCCZSjCJTNhWXqBmhGW1TwwIWj7o
	 xGGUgQA48QTKA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221009025056.35311-1-yangyingliang@huawei.com>
References: <20221009025056.35311-1-yangyingliang@huawei.com>
Subject: Re: [PATCH] clk: mediatek: clk-mt8195-topckgen: Fix error return code in clk_mt8195_topck_probe()
From: Stephen Boyd <sboyd@kernel.org>
Cc: angelogioacchino.delregno@collabora.com, wenst@chromium.org, mturquette@baylibre.com, yangyingliang@huawei.com
To: Yang Yingliang <yangyingliang@huawei.com>, linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Mon, 17 Oct 2022 14:07:57 -0700
User-Agent: alot/0.10
Message-Id: <20221017210800.75355C4347C@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_140801_970073_ECE8DCF9 
X-CRM114-Status: UNSURE (   6.50  )
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

Quoting Yang Yingliang (2022-10-08 19:50:56)
> If devm_clk_hw_register_mux() fails in clk_mt8195_topck_probe(), it shoul=
d return
> error code.
>=20
> Fixes: deeb2af77cf6 ("clk: mediatek: clk-mt8195-topckgen: Register mfg_ck=
_fast_ref as generic mux")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---

Applied to clk-fixes

