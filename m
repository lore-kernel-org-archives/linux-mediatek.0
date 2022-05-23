Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F364DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 11:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=etQPBssP17IzTl45tRcq3JszywWTuQZvo8GDlyN71Kg=; b=PUWp7pjWt8BiSQ
	MN7Bs74eIOvpDLI+02se1L5vhajXnuyBYiimmhYtMoxXGmQW5uoVxe2xFw8eKWfLOacdZ58nQ8hqU
	kBixarsuieyPGnWOZOuG8nPNWgDgFtkqcETB8vrEDJOJYljCifhmedBEIUUPwa929bSsn4RK2VIIK
	PyoP2E67qdVXIZwAwQC8Id3matf+2F8wZBwwiCRk+0Y66/XHJDz3UkFnMn0lquhjhIEJSEN6/Ayc6
	wmCJBdf8I7wJzybd/yUvTAabqLB2P/ETHb4UPOr4U8zgkqNE9YzIk3Kt8MebqYC7WQtj6aPA6tQk1
	j0yyo5h5rBX8ZygrHv4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt6av-003rfD-LE; Mon, 23 May 2022 11:51:29 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt5yI-003Zft-3k; Mon, 23 May 2022 11:11:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E65DF1F4306C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653304291;
 bh=T/12/ST+THUvfsBk94S7wmBu9DrZ1MADcsRqx52qnt0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Eue38aHpm4LkUCy9sf7ibt5DbkFjIy6LVmsGQod4zt1XcfyzZQgUSG5IQ1rIxSZN9
 h4Y1HMHwKikZN6dYFhZqQyshSol3KfKoRzJTu2SOu9U2TWvru95A+D1G1+RsW+o3sb
 pHLpAlJJe7fs1vjQBalkndiaKhWzj13oKh/abD/+cqP6i9X5LTbjQ1+I7/ZdI/KmNN
 oOB0W+u3ztXF/EIQ3MF7uJS5es5/2hZqsVNXEoYdX254XraDic2KvXnVDo3naS8c+5
 b1GdtwtZ0wEb+03IynCRHqiBUeG1TPNcCuuzs2iE9fhcpzzc1rDB05nCZSjnSz4LxI
 KH5ZX5cfF+N+A==
Message-ID: <2af6726c-5ff0-07c9-05de-1a67a7358ba2@collabora.com>
Date: Mon, 23 May 2022 13:11:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [v3 PATCH] soc: mediatek: Add support always on flag
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Min Guo <min.guo@mediatek.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>, Eddie Hung
 <eddie.hung@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Kevin Hilman <khilman@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
References: <20220520030340.25444-1-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220520030340.25444-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_041134_440177_605C1D14 
X-CRM114-Status: GOOD (  12.77  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 20/05/22 05:03, Chunfeng Yun ha scritto:
> There is a t-phy shared by PCIe and USB3 on mt8195, if the t-phy is
> used by PCIe, when power off its mtcmos, need software reset it
> (workaround way, usually hardware do it, but has an issue on mt8195),
> but it has side effect to USB2 phy(works with USB3 phy to support
> USB3.2 Gen1), so add support GENPD_FLAG_ALWAYS_ON flag, and make its
> power always on;
> Another reason is that USB3.2 Gen1/2 need keep power always on when
> support runtime-pm due to hardware limitation until now;
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

All these quirks are making this situation very unfortunate. I don't
really like setting GENPD_FLAG_ALWAYS_ON, but I recognize that there's
nothing else to do to fix that.

After all, this power domain is going to stay up for >=95% of the time
anyway even if we handle this in the various drivers instead of setting
it as always on and.. in the end, it's not worth the effort if we're
saving power in the order of a few microamps per hour.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
