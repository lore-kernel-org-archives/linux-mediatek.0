Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAA9DC7EE22
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 21:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wnXuR0Uc2BahIDEvzqhRJQCaY9gzOEcQOGZoDtF2ww=; b=GqgWt7L7QXonsKZUqW3k0JzwKi
	9K4n8mp7xE+AMZfn5sAWGf+THLg/xDYiSQGeWJO8GzYnpPsMIIu4go0v5/KwpuDgA1ZaLlyF72ZW9
	Sf3MZqXLR+qxPdvvnPv6vPWPRz/3WPjR7c97xgTvxnaM9MuAbdodkTVLbiGrOTuSPhnQD3CUrQMNf
	lp1OH+5KEvzsILhTiXG4Ed2+noWL7214EPKCdesB9LJy0pR+1sIjh454R22xvvcaQ/DsuhS3oYqIN
	ps+1AA1IM5VWNGmqOc8qsgr5t1Th5lEAjfKxWI5n/SO5wsnqSYMzidjR9aUxrUYt111eeZMt1cAjS
	JgKo41kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwrCS-0072Xl-0v;
	Wed, 10 May 2023 21:18:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwrCP-0072Wu-1h;
	Wed, 10 May 2023 21:18:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D8FCA6140D;
	Wed, 10 May 2023 21:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B841C4339B;
	Wed, 10 May 2023 21:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683753492;
	bh=6wnXuR0Uc2BahIDEvzqhRJQCaY9gzOEcQOGZoDtF2ww=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=OzMXZsLU2BSip09Tnai3Lsa4m/Vf/2TWC4pDIQm6uci92fKbsp7dPM+IRDO4emqKO
	 xjAm2DdtUv/nSl/q+cXWS26Syv5ZD5415u1rjvX88fVDVtWtmRPIc5Dt2Hi6lG7PC0
	 7m16qX2e9QMLNVsRJRjdtqy/xpqmifr+TU1B7AgLXgYXz1RmBhB8Klx8YoS/hwWJBv
	 Ln1knJdZ4hpPgujCm62SO/DsOkzpMn8ODkauHm95KlobPb3ifdyDiPg00lHIYgqMmP
	 J21xGvcW1vr24/0lcfKX8ZdBBw+iOB4jKTlz8MmaOPyQps8e4467/vq+ab/0k0BvLd
	 FQfo0AWIdllsA==
Message-ID: <b35458250af972d95c708792633c9a58.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230509021214.17105-1-gehao@kylinos.cn>
References: <20230509021214.17105-1-gehao@kylinos.cn>
Subject: Re: [PATCH] mediatek/clk-mt8173-apmixedsys: use devm_of_iomap to avoid resource leak in clk_mt8173_apmixed_probe
From: Stephen Boyd <sboyd@kernel.org>
Cc: gehao618@163.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Hao Ge <gehao@kylinos.cn>
To: Hao Ge <gehao@kylinos.cn>, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, mturquette@baylibre.com, wenst@chromium.org
Date: Wed, 10 May 2023 14:18:08 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_141813_609103_62A9A2E6 
X-CRM114-Status: UNSURE (   9.00  )
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

Quoting Hao Ge (2023-05-08 19:12:14)
> Use devm_platform_ioremap_resource to take the place of of_iomap for
> avoid that we don't called iounmap when return some error or remove
> device.
>=20
> Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and=
 allow module build")
> Signed-off-by: Hao Ge <gehao@kylinos.cn>
> ---

Is this v3?

