Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC40C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 02:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ryuLZTFwEMCSsL8fT4IXyXCQ/mOuRvsgOeoxITLV39o=; b=xUY+BFdgr7NRnI
	soc9YFqaSOlv+gqvKPEFu8Fb8RTaV9H+NrKST7t9x2yci6KR5JWeQm+r7871LoUaLzVWpc2u/JYTx
	0R2F07SLvH71TRjt7RfJutEzuxMbxuF2P3pf5r1XNqLiPuisQk55aUSumkFDOElXbDhi0b1/S45GH
	iQfEoZKyld4FAno4TvjmqAbc2oK2yZZEUoaAG0gZ3XGfIbX/zv+oGB1+DlD91b2ADCZilqo/WX1Ma
	EN4j39066cJH4LGw9TXWZQEsqoiK9X5BklW1u3ey3zkIZf6i+w1a1cPnQCo60xB7/bDnnIGKtimdU
	Ceo6sz6Cu6X73Lq75uTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRPCF-002POu-4G; Tue, 08 Mar 2022 02:03:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRPC0-002PKR-Jl; Tue, 08 Mar 2022 02:03:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9DA12614D8;
 Tue,  8 Mar 2022 02:03:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA9CBC340E9;
 Tue,  8 Mar 2022 02:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646704995;
 bh=+5Cyq8EnO4Z7dInU7QtRiRgZkFYM1vfMImCrh3hisB0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ifIYXJSuREhd5QQVQga5BeJFLiCsR1g1uDKO0QrsvhcDiPk+KayzNVPr3R5uFxXtU
 0R6eiP6w+170ffXBRqJGHRvNYLoJzSG4/kYczFZ3cpe9K1Wz4yzz67smC/s7/7PJ1L
 Jdb9s7Al3sCILD4PNdpilQ46XSiBxZ9kMd1gRhnNmdeU6IBDiWraCMDiNWjFCHkJrV
 5I1IQ53j4itSWaaYX9T+ZfFY4xwY9ucEY5fRcFkw9F6ZHPS84yRaM+rFL/nN2Bm8Rp
 dYbSBVspq1f8xJ5h4ZkV9ElhpanKR2BFOllKBWJhmFmG49fTj0jBzfSr4LcA1ll8RD
 wp+cvIJn0ZKXg==
Date: Tue, 8 Mar 2022 10:03:10 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Shunli Wang <shunli.wang@mediatek.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: mediatek: Fix error handling in
 mt8183_da7219_max98357_dev_probe
Message-ID: <Yia5XgkGyLbIRc1f@google.com>
References: <20220307131924.9905-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220307131924.9905-1-linmq006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_180316_740497_CFC79D37 
X-CRM114-Status: GOOD (  13.78  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Mar 07, 2022 at 01:19:21PM +0000, Miaoqian Lin wrote:
> The device_node pointer is returned by of_parse_phandle()  with refcount
> incremented. We should use of_node_put() on it when done.
> 
> This function only calls of_node_put() in the regular path.
> And it will cause refcount leak in error paths.
> Fix this by calling of_node_put() in error handling too.
> 
> Fixes: ebbddc75bbe8 ("ASoC: Mediatek: MT8183: Add machine driver with DA7219")

I am not sure if the Fixes tag makes sense.  ebbddc75bbe8 is the first commit
for the file; however, we have some more commits in between tip and
ebbddc75bbe8.

> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

With the minor comment,
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
