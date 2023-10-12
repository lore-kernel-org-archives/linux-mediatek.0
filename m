Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60D09CDB46E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 11:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nL5FesKNt2OkgNdubcQb9KM+DYdqwfbqF2RvM1NEKZg=; b=D2N2k+FyfDR4Gx8B56HV6vXNSs
	+d8lwywrQNcHZcv320NC4KY2iLmrbxKIPcqL0SNP9G9VIYiOk5ww1xZam0QLM9FI0jBXyp5z6NO80
	KWBpa8MO2dDPaBlwbAY9QeOyGzA+Cffj0yNejts0dhDIKjhtWLjQpTVCSRaOsRtA8e6Ie7YsOW/HO
	wvnHLrPXhJULjkG2oklSgXwvOa0WjVmXJKvAqXxUfpYdysKimFx44/NdQwpD4w+02uIUd2JbGbyEP
	faTk18mbi6HCIdzCKaz1pK8X1QEb77fQPSoskV2xdUZO59c3dlD+xNPNVZQGu6CcZpMZs8XzYs1ig
	sWlg6OwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqtxY-000mpy-0E;
	Thu, 12 Oct 2023 11:34:32 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqtxS-000mm2-37;
	Thu, 12 Oct 2023 11:34:28 +0000
Received: from dggpemm500005.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4S5nV950g7zvPtX;
	Thu, 12 Oct 2023 19:29:37 +0800 (CST)
Received: from [10.69.30.204] (10.69.30.204) by dggpemm500005.china.huawei.com
 (7.185.36.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 12 Oct
 2023 19:34:15 +0800
Subject: Re: [PATCH net-next v10 0/6] introduce page_pool_alloc() related API
To: Jakub Kicinski <kuba@kernel.org>
CC: <davem@davemloft.net>, <pabeni@redhat.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper
 Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<bpf@vger.kernel.org>
References: <20230922091138.18014-1-linyunsheng@huawei.com>
 <20231011083617.61bba987@kernel.org>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <b0796879-b8db-a82b-7c08-99a4469b0a1e@huawei.com>
Date: Thu, 12 Oct 2023 19:34:15 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20231011083617.61bba987@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.69.30.204]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500005.china.huawei.com (7.185.36.74)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_043427_247935_4860120E 
X-CRM114-Status: UNSURE (   6.94  )
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

On 2023/10/11 23:36, Jakub Kicinski wrote:
> 
> Could you rebase & repost? Patches no longer apply :(

Sure.
As another fix which is conflit with this patchset is just merged in
the net branch, will wait for that to land in the net-next branch
before rebasing & reposting, thanks.

https://lore.kernel.org/all/20231010034842.3807816-1-rkannoth@marvell.com/#r

