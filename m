Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6CAC77B75
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 May 2023 14:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PzkXx36wvK+y7wC2rjBGawUXoDa4/nKvYAkC6j+dWm0=; b=XW46eKhhvISPQA/TlOoZgMuzqU
	D1kohRiESQlacWYuzYZMbgMyMYNu2USNTj4IX/7HTD88Hl/oXPhChEPPdPcV00ltdekr+Vj6c2gn6
	uSNRPgdQmmeaUA+n8TsNLQkUW5csJReTgIHyCJnREQmov99ZhZDW2if5eLMzgiYo4zySJqjzNDP+6
	uQ3YUCorCnGRNbTgOx/YMrK1spj67sBysRUBifN9OgbGqPnHrRwQlVYFsWr9NUs8DvAQLIKB3JjTh
	jZ5FEpb3mAGBlE7RU5L2QnhIGvQBkPbYy4EXGkoiBz1sEfAyrhIBnjex5r3qqtVF0syiSpUuZmp13
	cgcewSig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyvE4-0060h8-1p;
	Tue, 16 May 2023 14:00:28 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyu7w-005mV9-10;
	Tue, 16 May 2023 12:50:06 +0000
Received: from dggpemm500005.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4QLGHG3w9TzsRs9;
	Tue, 16 May 2023 20:47:54 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 dggpemm500005.china.huawei.com (7.185.36.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 16 May 2023 20:49:53 +0800
From: Yunsheng Lin <linyunsheng@huawei.com>
To: <davem@davemloft.net>, <kuba@kernel.org>, <pabeni@redhat.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Yunsheng Lin
	<linyunsheng@huawei.com>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <bpf@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [RFC 0/3] support non-frag page for page_pool_alloc_frag()
Date: Tue, 16 May 2023 20:47:58 +0800
Message-ID: <20230516124801.2465-1-linyunsheng@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500005.china.huawei.com (7.185.36.74)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_055004_579995_FF5B1B10 
X-CRM114-Status: UNSURE (   8.30  )
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

In [1], there is a use case to use frag support in page
pool to reduce memory usage, and it may request different
frag size depending on the head/tail room space for
xdp_frame/shinfo and mtu/packet size. When the requested
frag size is large enough that a single page can not be
split into more than one frag, using frag support only
have performance penalty because of the extra frag count
handling for frag support.

So this patchset provides a way for user to fail back to
non-frag page depending on the user's request.

1. https://patchwork.kernel.org/project/netdevbpf/patch/d3ae6bd3537fbce379382ac6a42f67e22f27ece2.1683896626.git.lorenzo@kernel.org/

Yunsheng Lin (3):
  page_pool: unify frag page and non-frag page handling
  page_pool: support non-frag page for page_pool_alloc_frag()
  page_pool: introduce 'struct page_pool_frag'

 .../net/ethernet/hisilicon/hns3/hns3_enet.c   | 16 +++---
 drivers/net/wireless/mediatek/mt76/mt76.h     |  9 ++--
 include/net/page_pool.h                       | 51 ++++++++++++++-----
 net/core/page_pool.c                          | 45 +++++++++++-----
 4 files changed, 86 insertions(+), 35 deletions(-)

-- 
2.33.0


