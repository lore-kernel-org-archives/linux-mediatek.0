Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3154DCDB465
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 01:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3YDzvNxn+MoyQTnYAhAbfA6DPGHOeFv5XtyflR0kScs=; b=jtVJaD1vjc32/SWLASQy9NY6b6
	I+0bGyBh7eNqxeNsP1JaZq1lrMMWSCfFRgu1FCFlB+1xhIuKbYnRjd0QKPO4NVluY0JWiCt5xaAW2
	md7KtkHKwV0VVGSybYULIX4s7J9DY+cBLnQ5SFghUbVxB//UuR6yqaY7oPKkFSP6eorUS+Gq8PdKz
	q81dSq25AaWyUCqZ+I8/KcM47uW5m5b4qmtwV5sq4z/1XH/6IfbwDpSrLdy9zs/QTHJEDvhWQsvLi
	ZDp5aPtX+VSeEfvTpvnA3CQOp1v0fwphxd2k2yfQbD2WTbMKgXUFLNmQrmG7rmJxLzzH9HEAD4nms
	3VFWtdKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsYrs-00AzID-2s;
	Tue, 17 Oct 2023 01:27:32 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsYrp-00AzH2-0k;
	Tue, 17 Oct 2023 01:27:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D55EAB81B86;
	Tue, 17 Oct 2023 01:27:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9245CC433C7;
	Tue, 17 Oct 2023 01:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697506047;
	bh=s+jRDW+2r/hfeMcX43wig5Zoi67P+MBXYRuEZHkr50I=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HogMLJfecZN17MTZr096mjcZ2IDGruz/FY7v83Gb7/ZDvPTIL+WdGM2mSjH7TIQeV
	 lkrcwJlrreWA553L9DrttaF+M7rIPrW9D9ajMAl90ghSw45tWbn0TqygnVdba71bsJ
	 BvKjL+VYXfZH4UypliqZOJuU3w2NObAhUxlv8cKc2lrEzWW7ASoP3AVNUGpU8o8sPF
	 UnRi6125QGaEN9A5JIvhzI7DWQnCDQH6LUuKqXlkSo5Jy3x640fO1wpZfyv1n/b4q+
	 D0RssdFIOutKYuMPzDFSpjElHznI23230BDvGHOLDdKzk7TVCqfAwWBq2gAt0PN03C
	 fcg5fAqQT0iKw==
Date: Mon, 16 Oct 2023 18:27:25 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: <davem@davemloft.net>, <pabeni@redhat.com>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <bpf@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH net-next v11 0/6] introduce page_pool_alloc() related
 API
Message-ID: <20231016182725.6aa5544f@kernel.org>
In-Reply-To: <20231013064827.61135-1-linyunsheng@huawei.com>
References: <20231013064827.61135-1-linyunsheng@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_182729_426617_A33BD844 
X-CRM114-Status: GOOD (  10.86  )
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

On Fri, 13 Oct 2023 14:48:20 +0800 Yunsheng Lin wrote:
> v5 RFC: Add a new page_pool_cache_alloc() API, and other minor
>         change as discussed in v4. As there seems to be three
>         comsumers that might be made use of the new API, so
>         repost it as RFC and CC the relevant authors to see
>         if the new API fits their need.

I have looked thru the v4 discussion (admittedly it was pretty huge).
I can't find where the "cache" API was suggested.
And I can't figure out now what the "cache" in the name is referring to.
Looks like these are just convenience wrappers which return VA instead
of struct page..

