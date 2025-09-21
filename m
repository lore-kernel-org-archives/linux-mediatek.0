Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0B3CAC59A
	for <linux-mediatek@archiver.kernel.org>; Sun, 21 Sep 2025 16:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7JjWeGGQ0v2Ko7Mo+dsmnbg30iUAUCIfFBaMDWT9tI=; b=dBw+CNYF/C1jOekGy1KgX8MlGs
	QFQBlKhLuZLoNQn4TL7Oe1G0yHXi2ip8UGTtiAA4K7bspXzOaNyuTZLxIbSgpjuOJZ+6hgrN7kLAk
	S3z3vP6Q8hVRsaLlyiiA9UgdTPkgOSE6QbRsU3EsIUVjJbgsZ+rS+132BHXD64+CR1CTJ815Zm79j
	IrEHhS440H1WQDV9JkP/Io9JnOcijUy4NmcJxgvse8YBmHWSrF5Ut48ygsgFF6GHT4flqlAhhaKIs
	JmkdLb7A+QChRROX2Oc5nkg7OxoIAMYEWPDvK8qEtPuk0emhdGTM5bpVgqaTAk2EQtv9K61BZMGHU
	9785xoxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0MzA-00000007n79-0jjI;
	Sun, 21 Sep 2025 16:32:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Mz7-00000007n6V-3oFe;
	Sun, 21 Sep 2025 16:32:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80A1B4068B;
	Sun, 21 Sep 2025 16:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6B3C4CEE7;
	Sun, 21 Sep 2025 16:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758472341;
	bh=o7JjWeGGQ0v2Ko7Mo+dsmnbg30iUAUCIfFBaMDWT9tI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Fw7LW1pxhtXvGuUHilZObl9bVqfPchGMZ5D9O+9gd3EGObtzu6tbPo6AS4/v5jkcm
	 78W9R64ypCztgI+hyLs3RflqmOwAvrZIm3RLFTVpqO/EmPlU/tUxswP7zTYxNpSrvP
	 olBxJh96aFPPA79Ls+9D9Koj4T2fz8jRr6d7HiCPnJBtXX2sJ62B6D6ve/DDGQQGc/
	 43P/cPWmVq0NotjAovVZ9AkqeDSSkKwSQzgum2JVHO2C1yElIMdUMyya7TEjQrPDtV
	 CNXelg8ahOBWZa1ASarh2P9hOr7EhH7PmuKs1Z48JaLe839tzoY7IQvgp/cGvCtRNs
	 J8+rkL6HDTV5Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250724083907.61313-1-angelogioacchino.delregno@collabora.com>
References: <20250724083907.61313-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/3] dt-bindings: clock: mt7622: Add AFE_MRGIF clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, mturquette@baylibre.com, geert+renesas@glider.be, u.kleine-koenig@baylibre.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, kernel@collabora.com
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, robh@kernel.org
Date: Sun, 21 Sep 2025 09:32:19 -0700
Message-ID: <175847233984.4354.5445163873849956727@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_093221_967567_17615FAF 
X-CRM114-Status: UNSURE (   7.29  )
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

Quoting AngeloGioacchino Del Regno (2025-07-24 01:39:05)
> Add the missing AFE Merge Interface clock to MT7622 to make use of
> it in the audio subsystem.
>=20
> While at it, also remove the useless CLK_AUDIO_NR_CLK definition.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---

Applied to clk-next

