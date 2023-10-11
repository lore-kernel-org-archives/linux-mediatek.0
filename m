Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFCCCD6E7D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Oct 2023 15:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+fO2oxox+s9VG93T6N6KKEhAnA26+hFbrsiQ4d6nNQ=; b=jRmnuxad1jnVqqg9tAH5mt5N3Z
	6QsCvs6WvuAW020EMIQUvSmHnnjB34lR5tZJrZKHEsR/U2otRwm+WwHGgzo+Iwvid7WaHUOtAcOmS
	8r0hNgkFB8YqAHQinUBcWjo3/r5GLQOVl72NbiMKTV57K+gLKZ2dmIvDYcPkwaphD7cCQTGfNB3No
	9nb7WUlh914WMCh4Ng4EqJbJcKIdAQSvWTiFW7MTK1y4y7MXi4Kc6OJING4r4EOhGdCVvY/UDO7bR
	sCS5jwSiptuu3zLbI0tPzJLBP90ty3CYvGE1A6d7sw+ntD6AKMPAqXRDj1PiigkWofHA73nHdNWww
	WUJBBkQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqbG5-00GC0D-2N;
	Wed, 11 Oct 2023 15:36:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqbG2-00GByy-1v;
	Wed, 11 Oct 2023 15:36:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 86E19612B4;
	Wed, 11 Oct 2023 15:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8486DC433C7;
	Wed, 11 Oct 2023 15:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697038579;
	bh=lTq1DkG7l+QHbQBfr/sAWfclw9fYk69n6jbHGMTIKvo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Bcp/JOIA9l1V1uVU1FUbmq0Pqf6ndX+uIezQSz1L/ygwBQ1JSnAur/Abq56GCrHgR
	 wm6Yku1xyZegc67Mp5b1n8rlqPDRplqtPaHXyGo5hj0mGDVr0mpv0VEU7tjiVOyDpy
	 4iG2/mZTyp9YRmpCiFzGLklBIEqA5locMQH4RRgiBZwLnKLk0qa8LgZyqa2mpNpFSf
	 xTz2/scGbNti2vmRU2Iju+xBGxQTklEfCaV/yAXr/b522Fn8AkRrbxUflhsRy1Syfc
	 QOxJtrpbObzH7w37wQNqdz1ct4rbsZ+uxorFZGqMQs9f764duHDqMTwFhSXr4qcs+Q
	 E9jhx8hXs9Qtw==
Date: Wed, 11 Oct 2023 08:36:17 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: <davem@davemloft.net>, <pabeni@redhat.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <bpf@vger.kernel.org>
Subject: Re: [PATCH net-next v10 0/6] introduce page_pool_alloc() related
 API
Message-ID: <20231011083617.61bba987@kernel.org>
In-Reply-To: <20230922091138.18014-1-linyunsheng@huawei.com>
References: <20230922091138.18014-1-linyunsheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_083622_702349_EEE85CB3 
X-CRM114-Status: GOOD (  11.97  )
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

On Fri, 22 Sep 2023 17:11:32 +0800 Yunsheng Lin wrote:
> In [1] & [2] & [3], there are usecases for veth and virtio_net
> to use frag support in page pool to reduce memory usage, and it
> may request different frag size depending on the head/tail
> room space for xdp_frame/shinfo and mtu/packet size. When the
> requested frag size is large enough that a single page can not
> be split into more than one frag, using frag support only have
> performance penalty because of the extra frag count handling
> for frag support.
> 
> So this patchset provides a page pool API for the driver to
> allocate memory with least memory utilization and performance
> penalty when it doesn't know the size of memory it need
> beforehand.

Could you rebase & repost? Patches no longer apply :(


