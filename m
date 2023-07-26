Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCB3C001DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jul 2023 15:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jKrTQhM5axG9ddKkoKFz/Ghx4nezQCh3rRkmM+39Klo=; b=374X7jEc7G9A6lGd0YRtN6jqIU
	DCwU1FEfw52Cd3WSip8Y1ObYIeZt2JwsrJd2wQ6uNo1L5o2koZs5c0/F7DDj7q0wAC0QswHCWiNYy
	f6JcFuoD44NLBmgI08es2NGPMHK3+XzCfduNU5WpETDi2hGKLjq3u0upvau1F6CylJ4hY82NA3U+J
	+ofGDvFbqFpG9TUIFH+mrzVlp4jxVzmr/vg/l2bc3FMVLry39tkTB49nsxO2Ayi0z3Nwe3IK8tw9P
	KEp+jResDzr+nFWkomcQV2VzjYXRYhAcKzuQDyxHD8kf5gUSViqBwVCzLZd7WUjRNxhgvF6pBDYRv
	0b2Iujrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOgjt-00AtXO-0H;
	Wed, 26 Jul 2023 15:47:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOgjp-00AtWM-1J;
	Wed, 26 Jul 2023 15:47:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D4C5F61B54;
	Wed, 26 Jul 2023 15:47:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1C6C433C8;
	Wed, 26 Jul 2023 15:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690386464;
	bh=ntzUm32RuTuI9DzAzwAs39wscUDZsYJF5RGGxmCI+/k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=RzpKJzruvMIC6e+h2wdEZ8qON1ieukXJk9w17kGJCOFFhOSuDkuhkgAjiLEpp9ifj
	 mrc1myf+Y48t+Jb4jFaAz85JzvoY2huic7EW0fpoQguPpDQPFtrTSV1ghUlipQMaQq
	 9RNJiikJiqwV0/LpAsTq0sQhSAAZlQseAlot147AlZ0Onm8a8NFL6ujdtNciaRzOBa
	 z3TtnqnGYqS+7OBw1t5LYs2F7ztrg3Fs1v1aujCnJwNfYUL8UG1sEEOx+vGHlbGl1d
	 xNFWTAZVcXM9GzsKbiYWh31EUWCa5tm1DlUx4shA55XFcYDXHbwZorPr1TRaJ9tFpb
	 Nc5fstcERHKZw==
Date: Wed, 26 Jul 2023 08:47:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>, Yunsheng Lin
 <linyunsheng@huawei.com>, <davem@davemloft.net>, <pabeni@redhat.com>,
 <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Eric Dumazet
 <edumazet@google.com>, Wei Fang <wei.fang@nxp.com>, Shenwei Wang
 <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team
 <linux-imx@nxp.com>, Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya
 <gakula@marvell.com>, "Subbaraya Sundeep" <sbhatta@marvell.com>, hariprasad
 <hkelam@marvell.com>, "Saeed Mahameed" <saeedm@nvidia.com>, Leon Romanovsky
 <leon@kernel.org>, "Alexei Starovoitov" <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, "Jesper Dangaard Brouer" <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>, Felix Fietkau <nbd@nbd.name>, Lorenzo
 Bianconi <lorenzo@kernel.org>, "Ryder Lee" <ryder.lee@mediatek.com>, Shayne
 Chen <shayne.chen@mediatek.com>, "Sean Wang" <sean.wang@mediatek.com>,
 Kalle Valo <kvalo@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <linux-rdma@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH net-next v2] page_pool: split types and declarations
 from page_pool.h
Message-ID: <20230726084742.7dc67c79@kernel.org>
In-Reply-To: <a5d91458-d494-6000-7607-0f17c4461b6e@intel.com>
References: <20230725131258.31306-1-linyunsheng@huawei.com>
	<ZL/fVF7WetuLgB0l@hera>
	<20230725141223.19c1c34c@kernel.org>
	<a5d91458-d494-6000-7607-0f17c4461b6e@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_084745_496396_C7ED5861 
X-CRM114-Status: GOOD (  14.40  )
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

On Wed, 26 Jul 2023 12:48:05 +0200 Alexander Lobakin wrote:
> > I prefer the more systematic approach of creating a separate types.h
> > file, so I don't have to keep chasing people or cleaning up the include
> > hell myself. I think it should be adopted more widely going forward,
> > it's not just about the page pool.  
> 
> I have this patch reworked to introduce
> include/net/page_pool/{types,helpers}.h in my tree, maybe someone could
> take a quick look[0] and say if this works while I'm preparing the next
> version for sending? Not the most MLish way, I know :s
> 
> [0]
> https://github.com/alobakin/linux/commit/19741ee072c32eb1d30033cd4fcb236d1c00bfbf

LGTM!

