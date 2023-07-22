Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B042EB64DD
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Jul 2023 01:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k2yjAaHd+lN2pNsfwyB4nQVqAghs22ZbZpcMRJ2F72E=; b=gl64JtMszVN5YFhr/F4uCJ0bpr
	I+emy+aj/j1v4r2KF1DobPSTznNLyypg9zx9/ac3sMvwrhxsWVcbO8hyFlBc5tMG5qCSilgfgPIGh
	OZHxlvXjoF2UInsM5u+LgcFgjsFaBxkAfP2JNvYyQyydE9wfiyKczNte+V5PSS9lLbzLzQ0yKPpvK
	q3XWpaz6V3JKHuALR6VCclJklPoQVHOmwWTW2VFc3LuuNiHMb7MkJO3OEMRI4gyTYVD2cfmHKl3Oi
	hjenUc54o/4Od1ejO93sux0C6v/pSvOLzglLPUpu3OBQpwctgJZ2R6losPcDAzWl2OUTfhBE8mWZw
	o6bBTOXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qN1RN-00FXS5-1F;
	Sat, 22 Jul 2023 01:29:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qN1RK-00FXQz-1K;
	Sat, 22 Jul 2023 01:29:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B24CE61DB9;
	Sat, 22 Jul 2023 01:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D365C433C9;
	Sat, 22 Jul 2023 01:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689989385;
	bh=R5mM7X0dWWGe8uUNwpNWWJBPRCjYazXGxXdFnAodWvw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HmuHP5XXPJ9OGtuSX0ZEUaobPZhKyyzy3vPE6pZquoHGaxKkuOBYJK6imJ3otDRay
	 GckHYEcvBviIAOUIw3ZdJtbN6F1o2H+lCIY7cYQ6rlgStZ1JAPRyy4yzkpDWSw2rA5
	 iCEa/d1g0S86jnzKTU5948tooRNODGKE9yL97nmTfJCwL7CruJltGOB+Tq5ejSar8W
	 G/DioqTgh+MEEAuF5EW/SrMesfAMaXhXwJFBpucPUUaC+OiyWaJm3lsjKMghTj/1pv
	 ayRVX+l0X3k8Z/M+GfF9SEGp4PJL82byym5BcnsB8T6OOY3SH7KRPb+uo1nAaBHe1s
	 2T3QLRT6rdakg==
Date: Fri, 21 Jul 2023 18:29:42 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Yunsheng Lin <linyunsheng@huawei.com>, <davem@davemloft.net>,
 <pabeni@redhat.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>, Wei
 Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang
 <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Sunil Goutham
 <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>, "Subbaraya
 Sundeep" <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>, "Saeed
 Mahameed" <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend
 <john.fastabend@gmail.com>, Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Kalle Valo
 <kvalo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
 <linux-rdma@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH net-next] page_pool: split types and declarations from
 page_pool.h
Message-ID: <20230721182942.0ca57663@kernel.org>
In-Reply-To: <ccb728be-832c-be93-2023-6a5c78c53e6a@intel.com>
References: <20230719121339.63331-1-linyunsheng@huawei.com>
	<0838ed9e-8b5c-cc93-0175-9d6cbf695dda@intel.com>
	<7e9c1276-9996-d9dd-c061-b1e66361c48b@huawei.com>
	<20230720092247.279d65f3@kernel.org>
	<f5d40062-bb0d-055b-8c02-912cfd020aca@huawei.com>
	<20230721075615.118acad4@kernel.org>
	<ccb728be-832c-be93-2023-6a5c78c53e6a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_182946_494005_8C4D880C 
X-CRM114-Status: UNSURE (   9.16  )
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

On Fri, 21 Jul 2023 17:51:17 +0200 Alexander Lobakin wrote:
> >> More specificly, yon means the below, right?
> >> include/net/page_pool.h
> >> include/net/page_pool/types.h  
> > 
> > Yes.  
> 
> What I meant is
> 
> include/net/page_pool/types.h
> include/net/page_pool/driver.h
> 
> I'm not insisting, just to be clear :)

I thought we already talked about naming headers after the user :S
Unless you're _defining_ a driver in driver.h that's not a good name.
types.h, helpers.h, functions.h, dma.h are good names.

