Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A2BCDB474
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 15:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jydyuy004LPgHmB7+VJ1y2MhWW/y9QDQ+EHk2o4C1E8=; b=maLu+lY8JXQRdtHGKRydlL1p9g
	DTl4beSFBvjWwhljAKEy2nFs6GjPP9/J0IGoH9UW5PvZTCS6+2qANoLqFFHf+x7Tq30JFqTfgjLJW
	BaO7/frVkXS+XwZOGHDGvEzvL3fnJ3EoRFRZq/dkvQeN3+7n0l4sBhX58dbA5VqqhagV9CjQVkYsT
	gyo0A4MxQE2OSQe6BJeF0wlM5yjzf5QaSMXwqXleZUkNKYYk4u3v5EiL/o6xFvB7rrg+pkwvYB6wq
	k1vjhJWVdYPQ21tFGJ2gOL8dmV28rFtNRzCvN01pqlSLA1ljaUzlWiv4lVtmp3EwZx3Xb24a6d3fp
	LqGGRbUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qslm5-00CieF-0Z;
	Tue, 17 Oct 2023 15:14:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslm2-00Cidd-0M;
	Tue, 17 Oct 2023 15:14:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7050761384;
	Tue, 17 Oct 2023 15:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998C4C433C7;
	Tue, 17 Oct 2023 15:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697555661;
	bh=07bS9mjKy4+gkFRB2bhOqp3nya+agZd4rUe4PVcLCoc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MGH3tU2bF16vI+HxyH3Oww2Ok3BYK7j15PslIN9/EcokOgotGNQTFS4GUB8AAMUjB
	 m0nx9yTVZ7u0dbbYeACVxvOSXgpbCUicqUJXKX+AK+5xhUKELY+PuZPcN1kAHn+AuN
	 g6JfFTl98ZXfTaVOUzuTubsSyZFVGS0syv+aPdRu+P3U/PYAozYoNLWs01qOQhUozE
	 uX76FszfwhtrOhvv5LQtVbxM0jmYbX6MGUdgtolPCHZSh98mIcQSupl1swWH/rHIKe
	 bFXg5nqobDByGUpTwC5Sx6wrIBrdsB0PsBY0Vcpnn+yJWvumOEgYM8wOTTpu8Btz3t
	 25pL5AU2xxJJQ==
Date: Tue, 17 Oct 2023 08:14:19 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: <davem@davemloft.net>, <pabeni@redhat.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <bpf@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Alexander Duyck
 <alexander.duyck@gmail.com>
Subject: Re: [PATCH net-next v11 0/6] introduce page_pool_alloc() related
 API
Message-ID: <20231017081419.5e9d7247@kernel.org>
In-Reply-To: <20231017081303.769e4fbe@kernel.org>
References: <20231013064827.61135-1-linyunsheng@huawei.com>
	<20231016182725.6aa5544f@kernel.org>
	<2059ea42-f5cb-1366-804e-7036fb40cdaa@huawei.com>
	<20231017081303.769e4fbe@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_081422_193444_44E4642C 
X-CRM114-Status: UNSURE (   4.83  )
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

On Tue, 17 Oct 2023 08:13:03 -0700 Jakub Kicinski wrote:
> I'd just throw a _va (for virtual address) at the end

To be clear I mean:
  page_pool_alloc_va()
  page_pool_dev_alloc_va()
  page_pool_free_va()

