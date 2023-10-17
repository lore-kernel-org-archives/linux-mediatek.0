Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C674CDB483
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 15:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJFs9wuSdmufbOA/BHu5/2JUTkmnZqw7NJDQdmDIj3M=; b=j3DXoZxyS+EN95P9sd+k6GxoqV
	1aIA+KNsPHGoS5b/N5ZKUx+vgRrL6BqHNkS8TRGbCCRlnLzfohEw57BE8oJMkeTg8ZFXOqTOHm6pl
	g8YNF8GAi7DlPUXZ/Dek7SKs1pL4+KBUs7GyNMdJv9czwplA4SRZHoAEswcuKTLnF5P8QhO2a1zT7
	lKwfq3StHvTlY/0ChH6vgA6SJOIJHk9FUwyiWOgPiBgFaq+qfS9xCJ8iJ2arLG7R30mMrKPjiEo5g
	R2pmYV9CE2aNXRjoe2E+SPlPVFVuBWmRxynclFDpLAy2xzopnWhprLJRXFDBz6YTVzy0oWShyO3E+
	3bBwSFxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qslkt-00CiRn-06;
	Tue, 17 Oct 2023 15:13:11 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qslkp-00CiQB-33;
	Tue, 17 Oct 2023 15:13:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5F5A8CE18BD;
	Tue, 17 Oct 2023 15:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED79C433C8;
	Tue, 17 Oct 2023 15:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697555584;
	bh=JJc9uTY6VESHKtR5Rwh2zpqzChvYnI7TdKWdn6WPs14=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MXlNQibyA6fZX59FsDqAImWdfJ2ih+TXCnscodf3g8+R9omBLcX/s62+o+7WAuzU/
	 FICPLw0vFyVsL3tAaDzuf5HsyiBSc9j6Q5YgaDcyLt0VKOzF51lZpt5DnQOrIutWdA
	 eotRndq9Lp3W+l0OUaWmHbOzcqWuZYUfNBBsQ05hbxUsYEwnKAzvQP0/2NDTc+k695
	 xShDcSzo2Bp+t8bIfyYhUxBLd4lbsbIuT1RTmCcDkVO6A++OL4IPUZ6q97npihxVXq
	 4kDcI2SMPSH6qdwZkopC/EGxghJNwo8hoUZ5vG4JfANfyvey4SUcj/kHOSxIPOLSUj
	 Wt2lTDHetvlrA==
Date: Tue, 17 Oct 2023 08:13:03 -0700
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
Message-ID: <20231017081303.769e4fbe@kernel.org>
In-Reply-To: <2059ea42-f5cb-1366-804e-7036fb40cdaa@huawei.com>
References: <20231013064827.61135-1-linyunsheng@huawei.com>
	<20231016182725.6aa5544f@kernel.org>
	<2059ea42-f5cb-1366-804e-7036fb40cdaa@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_081308_175722_89B383D6 
X-CRM114-Status: GOOD (  11.99  )
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

On Tue, 17 Oct 2023 15:56:48 +0800 Yunsheng Lin wrote:
> > And I can't figure out now what the "cache" in the name is referring to.
> > Looks like these are just convenience wrappers which return VA instead
> > of struct page..  
> 
> Yes, it is corresponding to some API like napi_alloc_frag() returning va
> instead of 'struct page' mentioned in patch 5.
> 
> Anyway, naming is hard, any suggestion for a better naming is always
> welcomed:)

I'd just throw a _va (for virtual address) at the end. And not really
mention it in the documentation. Plus the kdoc of the function should
say that this is just a thin wrapper around other page pool APIs, and
it's safe to mix it with other page pool APIs?

