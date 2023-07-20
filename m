Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D40EB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 16:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZqI/bvdOumCn9h+GVL6Dr37IlEqq0p3CMXblUBfkR2o=; b=vD6NMF8uaNhlTyCsSo4cmSYx+L
	Eegu0m2cxLdPGwoz5dxTF0WCrysmWuTQWSBkGJwpSL/w3n/pfEA50Ze106i0ZAiif+XWsJ0Ku+Iv6
	UnRifkiJtab8b3YDyZiI/P8hMCnAURqEnP/PxjaWyB0NX0uEklxjJ637wbfh468AWT6umHP4jDll3
	yabu843OB1vH2EUKBqzBadJib1SsZlo4uY5QNFOogbK6eKcdD9bvX1fDbCUW2mnWPoyGIGNYBK5Hj
	23Aj4x7dviB7LQnlTkZpnp2JJrSXDuUxvCRZLRvPfFXrylF68PmulKSrI8apOO4WW2D9Cz/ZYcFFu
	5EsZDm/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMWQX-00BewO-1X;
	Thu, 20 Jul 2023 16:22:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMWQU-00BevT-21;
	Thu, 20 Jul 2023 16:22:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D38A161B6C;
	Thu, 20 Jul 2023 16:22:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E0FC433C8;
	Thu, 20 Jul 2023 16:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689870169;
	bh=Ga7vIpJBGNUMApUSoun4tXfXEl7VbVUv4I6DCjjfbAM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rDHLNXGwIvMHpNywshRgUPi+IXDPlOs5NO3euDhmRsGbXh0CscyAmfQpeQo/knivh
	 HR3UFzU5wkh0Mn273qVxXTfkibGeI10vuHAggrxFD7TPMkpXk1g3pxtEevHmB4lkaM
	 EttnT6/+FzHGmzbku9kikGP0MlFqFfXuG8vM2FXH3upqc1SoxuGxWjpJ/JbG0Ub2pO
	 4KW93kC4qEHEKKMVIFqEr9A/jChPzqTzc1PD/PTqgoF6rvuBd61iPbZBwqedCv+LIN
	 XDKa6i1hfxCGL4PaLA58iGFombeHuRO0dgM92lvfvmAVeBFO2yLlASlPYCivOgC8Pm
	 gpmfJGqETEZ7Q==
Date: Thu, 20 Jul 2023 09:22:47 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: Alexander Lobakin <aleksander.lobakin@intel.com>, <davem@davemloft.net>,
 <pabeni@redhat.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>, Wei
 Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang
 <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Sunil Goutham
 <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>, Subbaraya
 Sundeep <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>, Saeed
 Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend
 <john.fastabend@gmail.com>, Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Kalle Valo
 <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Ilias
 Apalodimas <ilias.apalodimas@linaro.org>, <linux-rdma@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH net-next] page_pool: split types and declarations from
 page_pool.h
Message-ID: <20230720092247.279d65f3@kernel.org>
In-Reply-To: <7e9c1276-9996-d9dd-c061-b1e66361c48b@huawei.com>
References: <20230719121339.63331-1-linyunsheng@huawei.com>
	<0838ed9e-8b5c-cc93-0175-9d6cbf695dda@intel.com>
	<7e9c1276-9996-d9dd-c061-b1e66361c48b@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_092250_712625_1638559F 
X-CRM114-Status: GOOD (  14.71  )
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

On Thu, 20 Jul 2023 19:07:31 +0800 Yunsheng Lin wrote:
> > BTW, what do you think: is it better to have those two includes in the
> > root include/net/ folder or do something like
> > 
> > include/net/page_pool/
> >   * types.h
> >   * <some meaningful name>.h (let's say driver.h)
> > 
> > like it's done e.g. for GPIO (see include/linux/gpio/)?  
> 
> It make more sense to add a new dir for page pool if there are
> more new headers added. As we are still keeping the page_pool.h
> mirroring include/linux/gpio.h, adding a new dir for only one
> header file only add another level of dir without abvious benefit.
> We can add a new dir for it if we turn out to be needing more header
> file for page pool in the future, does it make sense?

It doesn't matter all that much so I think to have some uniformity 
in networking please go with Olek's suggestion which is also my
preference.

