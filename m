Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D01EC83F37
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jul 2025 07:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBehm+l6yNaIM6GyguD8OP8uRws9CAXHEEmzeunVrvU=; b=MzVrCsA7roj3f+XjA63wU15VoX
	dT1AUHM0i3cMZ/f6JbHrsMwkHVWTed9QqJhWjpyw1KcmelRSEZwHCNyhTtuvF4p6f08hdIfh0FxRn
	hFSIlSkuY15MyfNIx+fSamodL+GAz+sBOasVtSL3M37B3flWf7YSuYNve6/ibU9eGEyoxEMsts2Yw
	l7bpP9mXHxt31icUvBf/jTPjeqXpQE33LEMIVwAo7d91xIVJAYlTx0B1iibkZi19vm61U9bjwfHZI
	eHNuUPegpxqeE+y7h8QD1V7JUXMeeszzMhaemaWTanbhqlKl0SAMJy7QQEjJdAr3UqNch72JpwogW
	Iltqij5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIwQ-00000009Q2h-1voM;
	Thu, 17 Jul 2025 07:22:06 +0000
Received: from exvmail4.skhynix.com ([166.125.252.92] helo=invmail4.hynix.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIcE-00000009MJf-0rcD;
	Thu, 17 Jul 2025 07:01:16 +0000
X-AuditID: a67dfc5b-669ff7000002311f-3b-68789fb3feb4
From: Byungchul Park <byungchul@sk.com>
To: willy@infradead.org,
	netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kernel_team@skhynix.com,
	almasrymina@google.com,
	ilias.apalodimas@linaro.org,
	harry.yoo@oracle.com,
	akpm@linux-foundation.org,
	andrew+netdev@lunn.ch,
	asml.silence@gmail.com,
	toke@redhat.com,
	david@redhat.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	linux-rdma@vger.kernel.org,
	bpf@vger.kernel.org,
	vishal.moola@gmail.com,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	jackmanb@google.com,
	wei.fang@nxp.com,
	shenwei.wang@nxp.com,
	xiaoning.wang@nxp.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	sgoutham@marvell.com,
	gakula@marvell.com,
	sbhatta@marvell.com,
	hkelam@marvell.com,
	bbhushan2@marvell.com,
	tariqt@nvidia.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	saeedm@nvidia.com,
	leon@kernel.org,
	mbloch@nvidia.com,
	danishanwar@ti.com,
	rogerq@kernel.org,
	nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	aleksander.lobakin@intel.com,
	horms@kernel.org,
	m-malladi@ti.com,
	krzysztof.kozlowski@linaro.org,
	matthias.schiffer@ew.tq-group.com,
	robh@kernel.org,
	imx@lists.linux.dev,
	intel-wired-lan@lists.osuosl.org,
	linux-arm-kernel@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v11 07/12] octeontx2-pf: access ->pp through netmem_desc instead of page
Date: Thu, 17 Jul 2025 16:00:47 +0900
Message-Id: <20250717070052.6358-8-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250717070052.6358-1-byungchul@sk.com>
References: <20250717070052.6358-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0yTdxTG/b93Gpq8qYa9012SLkSCkU1Bcz7gpsYP/y9GEz8saKJWeWMb
	uaXVWpYsVIQ4GgWjJYKrscrFconFcnvFFrEQILoNqICd1qJlQ8UKSrWhFu1azL49Oec5v+ec
	5HCkwkuv5jQFx0RtgSpPycgo2evka+s7rhjUP/zWTYLF3srAWOgqDS2LBrj+VKLB0yTA7dFF
	AizNXQjeRR6z4KjwkRAaGGKg7mqYhEjbWQosI2UUvLd/IOHfwQALw+6PFLQ4dsJU4wwFztNx
	dv/7VAhUDTNwtixKQq2/nIHYoygNrsgcC6WSjQDXq04WRrsqaTB/aCCh2/g0njU9ScODHgsD
	D06NIfC3xmiYcccDgzYfC5UtlxC47zQxUFqWCcHOdyy8qR4gYapyK3yq0cOgNQXC94MIHjdM
	EBBzSiz85b9Bw4C9m4DxZxESwmcuM2B6XYVgoraHgD8ut9FQf3+ciO+xByZjSwRc8FgZmC6b
	QuDpD1Dw+8lKBPZeLw1vnfGTo4sWZut23B+cJ7H0pB7hjqa/Cfzi3CcCe3vvEfjWpScstjqO
	43ZbOq5zviSwyeshsaO5gsGOhfMs9k06GTxcE6Vwe30JftFei3Z/vVeWnSvmafSi9vsfD8rU
	HVIrVRRiDYHyXUbkZ0woiRP4LKGzQiJMiFvWb0c0iTLDrxW83giZ0Kv4DUIoMESZkIwj+T+T
	BVd7DZForORVwtLk2LKJ4lMF88xDNqHlcU6Vf4L4zP9WaGnrW/Yk8ZuEqPn8cq4i7hm/ZmQT
	UIG3Jwl9FR7288CXwl2blzqH5Fa0ohkpNAX6fJUmLytDXVygMWQcLsx3oPi/Nf66tE9CC6N7
	3IjnkDJZfrDthFpBq/S64nw3EjhSuUp+waNXK+S5quJfRG3hAe3xPFHnRms4SvmFfGP4RK6C
	P6I6Jh4VxSJR+3+X4JJWG1HmmZyG+bQSo8KcHerNPJSdVpIzP4L3ZVcf/qa/cG67K/hsv3Ml
	1dU6G9nUuA2FU9fbivuyTktDndU3f66e3blZV5oz25NhsNJrd8To51Ku71HKktX603S6dd2O
	SNHFzflbphzyscG5i9G0e/8sHDHXuXwW5XeWlNuDu4a+mi4nlZROrdqQTmp1qv8ATxGIJWsD
	AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0yTZxTHfd47DY1vOiKveEuaNETY2JwjOcvMQmKMj8Zb9MMW90EqvLGd
	XEwLXdnm7LBeqFpUMIJCLCsgN2nXcqla0bQEuuEFysUOobgaCJuwzXEJFRQLid9+J/9fzv98
	OBwpa6bjOHVWjqjJUmbIGQkl2fPFyY+cN/SqT9yzG6HM1sBAz1QFDfVzerj53EWDv1aAu91z
	BJTVtSCYDj9jwVEwRMJUeycD1opZEsL2CxSUPTFSMGN7TcJoR4gFn+cNBfWO3TBSPUaB+0wr
	Cd4ZBYQKfQxcMM6TUBo8xcDi4DwN98L/sJDvqiHAW/5bZHzZzEJ3i5mG4tdVJLQankcKXwzQ
	0HunjIHekz0Igg2LNIx5Iq0TNUMsmOuvIfDcr2Ug37gZJpqnWfjvSjsJI+YUeFuigw7LKpjt
	mkDwrKqfgEW3i4XHwUYa2m2tBPT9GSZh9nw5A6bJQgT9pXcIeFhup6Gyq4+I3HEABhYXCCjy
	Wxh4YRxB4PeGKLj+sxmBrS1Awyu3kUrZir0T/5LYNVyJcFPtHwQev/iWwIG23wl8+9owiy2O
	XOysScBW918ENgX8JHbUFTDY8f9lFg8NuBnsK5mnsLPyBB53lqJ96w9KtqSLGWqdqPn4y1SJ
	qsnVQB2bYvWhU3sNKMiYEMcJ/GfCqydqE4riGD5eCATC5BLH8JuEqVAnZUISjuQfRQv3nCXE
	UvABrxQWBnqWJYpXCMVjT9kllkb2FAb7lx2B3yDU2x8sO1F8sjBffJlZYlnE6fvFwF5EEgta
	UYdi1Fm6TKU6IzlJe1SVl6XWJ6VlZzpQ5Jmqjy9ccqHp3u0exHNIHi1NtX+nktFKnTYv04ME
	jpTHSIv8OpVMmq7M+17UZB/S5GaIWg9aw1HyWOnOr8RUGX9EmSMeFcVjouZ9SnBRcQZ0zh4f
	S53u/rs8oa3DffbzXYb8gh/c13el/fStNjpzYeenllh+eE6+/tcHyYct+0PRivgZ4kfzOr/1
	ttUwSO2YTHTUkV0vKy1rDiYNznQPp4ziZpn1isL34X3feJHzbs+tq41xiZMrvzmuO6Lzb8he
	vc2mL9i86uuN3s61jxRzoyVqOaVVKTclkBqt8h3bHVNiSAMAAA==
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_000114_374226_03646F35 
X-CRM114-Status: UNSURE (   9.93  )
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

To eliminate the use of struct page in page pool, the page pool users
should use netmem descriptor and APIs instead.

Make octeontx2-pf access ->pp through netmem_desc instead of page.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c
index 99ace381cc78..625bb5a05344 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_txrx.c
@@ -1571,7 +1571,7 @@ static bool otx2_xdp_rcv_pkt_handler(struct otx2_nic *pfvf,
 		cq->pool_ptrs++;
 		if (xsk_buff) {
 			xsk_buff_free(xsk_buff);
-		} else if (page->pp) {
+		} else if (pp_page_to_nmdesc(page)->pp) {
 			page_pool_recycle_direct(pool->page_pool, page);
 		} else {
 			otx2_dma_unmap_page(pfvf, iova, pfvf->rbsize,
-- 
2.17.1


