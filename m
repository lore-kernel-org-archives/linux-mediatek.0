Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE0FEB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 14:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GbEdKOfppLFqOiQbkW2R1KhTapJ4FFcPNoaoNaBCLKY=; b=I+MTPAAwhLa0rXgJo9neH12tCH
	EfBU564WRI/Gjqw8icApsc4NxysxDLQ4q8D5J/UQFYyB6n21jDLhVxCfiULkPWOolTMBKRegDJMKd
	hw6qO6CbSvY90GQMQGRd8kdAJe1AHOxsigUfyArcga67028Aoajr49pb8+Vg2HNrEd67KON3uXV6s
	EmSSQFkkyKes4gtc6iA6yTGXUDKTJ95Ccl6Yd70K3JFW9J21vWgCnUhRfY/CPMT2TQOC7d1r/olXd
	FH42dJIi9RGsQDJw4ekj/xxs7LpgVsDrSj+GrXnp3b5w/MHjVbyUdZew8o3/o2Rt68pYFydMEIqaY
	mSxdmhVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMrYM-00EMRR-2T;
	Fri, 21 Jul 2023 14:56:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMrYJ-00EMQQ-0s;
	Fri, 21 Jul 2023 14:56:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2E0F161B4D;
	Fri, 21 Jul 2023 14:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E9D1C433C7;
	Fri, 21 Jul 2023 14:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689951377;
	bh=GbEdKOfppLFqOiQbkW2R1KhTapJ4FFcPNoaoNaBCLKY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NXlKWpLuPeKFqxlrQAj4ALgNKRqep1DB4i8zp75V7Cvk8c/efHwVnko4stlpjU4/i
	 90qJ6XaOrO/Q0iWCqzCKbSXeO6sa2SO8PtbYKhoqUEWtwhsbZNFjOGVPxUj9cQ1ONL
	 ea6ISpEAjOP6gaPvwe/PUjlGBh22NxI2o7vYtxmgTFkSWT1OlhLe0BLR1a4Np62JRc
	 WqwybNdxjwXcxp6R6p8oFhYpuRHyGsHIIyyOGgCnFxqCBiA6Kd8/VJqDZDqoNRCI9g
	 K+ABmjUwR9H1QO1ejIRI9WI99NrytMs340M2ScQtOwONLs/z+3O+SClu0JjxYM/nic
	 /bxbxhWrBks3A==
Date: Fri, 21 Jul 2023 07:56:15 -0700
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
Message-ID: <20230721075615.118acad4@kernel.org>
In-Reply-To: <f5d40062-bb0d-055b-8c02-912cfd020aca@huawei.com>
References: <20230719121339.63331-1-linyunsheng@huawei.com>
	<0838ed9e-8b5c-cc93-0175-9d6cbf695dda@intel.com>
	<7e9c1276-9996-d9dd-c061-b1e66361c48b@huawei.com>
	<20230720092247.279d65f3@kernel.org>
	<f5d40062-bb0d-055b-8c02-912cfd020aca@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_075619_374326_5798AC36 
X-CRM114-Status: UNSURE (   9.79  )
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

On Fri, 21 Jul 2023 19:12:25 +0800 Yunsheng Lin wrote:
> Just to be clear, include/net/page_pool.h is still there, we are not
> putting page_pool.h in include/net/page_pool/ and renaming it to
> something else, right? As there is no that kind of uniformity in
> include/net/* as far as I can see.

Like many things the uniformity is a plan which mostly exists in my head
at this stage :) But it is somewhat inspired by include/linux/sched.*

> More specificly, yon means the below, right?
> include/net/page_pool.h
> include/net/page_pool/types.h

Yes.

