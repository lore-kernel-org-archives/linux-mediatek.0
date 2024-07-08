Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D27C3271E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jul 2024 19:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZ0UcWrET9TN2UFV+2vHkASsXRUgEGjwDnmMrlrBnSQ=; b=c/MNH7ZyltWsTB63R84cIOUNvp
	x3zPFyY7qDERkeUlWffrXrj8QXHWXRxXDiqhZq39miYeTv6RZQ+6lSkj/qD4wxs0hcGQHit9usAwG
	8jHn35MS7RPoboZ/9wGNb/JitGl1nyoM1mawuv3gHivleKIA44/bOx/ocpkUIyDymPxQQfMw/wmun
	RK1nEleTvdFY7P/6zRJtSC2lt29Gi0q/3AfTmHTFVm9FJPwSMkyfoy2xYBrz4en4e8B7L/SQfDJzA
	/gybVS1XODlkMRrW+JSdApJjATdW8sP+tYHbTJvhe8pYqSbGYgo+Jy+mvpDH4J+hcA5SjfVSNaIOR
	D6DZQuMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQtge-00000004mlK-1o6n;
	Mon, 08 Jul 2024 19:06:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQtgO-00000004mhS-04Jq;
	Mon, 08 Jul 2024 19:05:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 78DF560E2C;
	Mon,  8 Jul 2024 19:05:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 105A7C116B1;
	Mon,  8 Jul 2024 19:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720465549;
	bh=mZ0UcWrET9TN2UFV+2vHkASsXRUgEGjwDnmMrlrBnSQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=U0V6jff8dEHzKrQ+nlQSGnWEnWk3mQuDwXWt8hIBbx22u3fuQvKIp7dThZkLEVsLq
	 ErjHD1yF+JtPoc+o6UQHRu6v+nZWHhg+JhvEGpuKeCVs0pXjE8onTsglqSHFbSEKRR
	 9BhtrAr9dbd0oH9Lxz9KU8t9XsZjB1eK1LvtzGY7FnUmZ9GrO38pKhhSArcgdk06TX
	 baIQLTT/mwcufERMOCNpC4J/vtuvUhrcN+GVI/jMvFGT9qWyDt8YWHz7datmuhb56U
	 BcI+WVADgq7ZegBhMXWZZbsWu7GJNutTspywHWx4RT42b4d3jndOVK8GerI7XI2ENi
	 y1nE64c3RRjQw==
Message-ID: <9b455698a33ec5d01c12424ea67c8e88.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240612201211.91683-1-alpernebiyasak@gmail.com>
References: <20240612201211.91683-1-alpernebiyasak@gmail.com>
Subject: Re: [PATCH RESEND v2 1/2] clk: mediatek: mt8173-infracfg: Handle unallocated infracfg when module
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org
Date: Mon, 08 Jul 2024 12:05:46 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_120552_143515_4E20CE07 
X-CRM114-Status: GOOD (  12.26  )
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

Quoting Alper Nebi Yasak (2024-06-12 13:11:00)
> The MT8173 infracfg clock driver does initialization in two steps, via a
> CLK_OF_DECLARE_DRIVER declaration. However its early init function
> doesn't get to run when it's built as a module, presumably since it's
> not loaded by the time it would have been called by of_clk_init(). This
> causes its second-step probe() to return -ENOMEM when trying to register
> clocks, as the necessary clock_data struct isn't initialized by the
> first step.
>=20
> MT2701 and MT6797 clock drivers also use this mechanism, but they try to
> allocate the necessary clock_data structure if missing in the second
> step. Mimic that for the MT8173 infracfg clock as well to make it work
> as a module.
>=20
> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
> ---

Applied to clk-next

