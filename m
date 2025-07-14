Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943F5C83F22
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jul 2025 12:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xylSJYwQA6chy3jYH9i1Li/iApDeEnvB9Diun4X2Pqw=; b=tODtKTz3ycQotaYS+U8ciblMFc
	CKlfOYG9DJdI49I3oP1jnOV1HXLB+6FuSyqaKD/JOfQzparmopRMN29OoVGmTTso7t/T0n1wqcefJ
	v+ifmfZ8sb/laz+MJJcnZ9Zrj579EF6QoIVoHyMu02wnTQoE2vCDU785K2GwFus3VBZQpAFn9+fSE
	ktVY7tltXCbH2tR/IkT8MbW/QH29V17yDLFGRDsBGCPOM4uSLB3YOoujefmgNoVQtfAbbFMRAoo4P
	I7KRk9JhT+vLVqXsoeRcr4ztjHvBIA4++xFgUSDnvmYVllFDQXB8yX6nciR+5IhcNylP8W1cl+SMb
	Aitl5YvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIHf-00000002AEV-1ZHT;
	Mon, 14 Jul 2025 12:27:51 +0000
Received: from exvmail4.hynix.com ([166.125.252.92] helo=invmail4.hynix.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHrs-000000025oJ-2SCl;
	Mon, 14 Jul 2025 12:01:14 +0000
X-AuditID: a67dfc5b-681ff7000002311f-1f-6874f179d144
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
Subject: [PATCH net-next v10 03/12] mlx4: access ->pp_ref_count through netmem_desc instead of page
Date: Mon, 14 Jul 2025 21:00:38 +0900
Message-Id: <20250714120047.35901-4-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250714120047.35901-1-byungchul@sk.com>
References: <20250714120047.35901-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAz2Se0yTZxTGfb/3u7WhyZfK9FMzZ5oRicu8ojmJxjj1jzcao5sxcWoCnXyz
	ndwsF8HEiK5ssQoS0QSwZJWC4xaLRWinLZeWCYLKRaxVgQJGUaxOBRsqKBbM/O+Xc57zPOck
	h8fKh8x8XpuQIukS1HEqVk7LX4YVf5/xJkWz/FT7WjBaqljoGr3IQOV4Ovw9YGegu1yE653j
	FBgr6hCMBR9xYD3Zi2G0uYUF88UAhmB1Ng3GDj0N7yzvMTy5McRBq+sDDZXWbeC79JQGx582
	DO53ETB0ppWFbP0EhoL+LBamHk4w4Ay+4uCEvYwC54taDjrrchg4974Ugy1zIJT12MPA3WtG
	Fu7+3oWgv2qKgaeuUKC/rJeDnMpCBK6GchZO6FeBv3aMg9fnmzH4cjbAx/w0uGGaA4F2P4JH
	pfcomHLYObjTf5mBZouNgp7BIIbA6SIWDC/PILhXcI2CW0XVDJS091ChPXaCZ2qSgrxuEwuP
	9T4E3e4hGi4cz0Fgqfcy8MYROnli3Mhu2Ejc/v8wsfeVIHK1/AFFnuV+pIi3vo0i/xT2ccRk
	TSU1ZUuI2fGcIgZvNybWipMssb49y5Fej4MlrfkTNKkpOUae1RSgHV/vka+LleK0aZJu2foY
	ueZOo51JypKl/xs040zUwBmQjBeFKPH6YNUXLu7Xo2lmhcWi1xvE0xwurBBHh1poA5LzWLgd
	Jjpr8qnpxmxhv9jTlz0jooUI0XfOPMMKYbVYnPWE+mz6jVhZ3ThTlwlrxL+KBmcClCFNvaEE
	T5uKgkUm3m/4A30emCc2lXnpXKQwoVkVSKlNSItXa+OilmoyErTpS/cnxltR6OMuHZ3ca0dv
	O3e6kMAjVZgCRlI0SkadlpwR70Iij1XhipE+nUapiFVnHJF0idG61Dgp2YUW8LRqrmJl4HCs
	UjigTpEOSlKSpPu/S/Gy+Zlo5ZHaFyIsryOFi4o3d7RFHLN2LTvdeOi+w+f27fp248jmfTGB
	H+a1/mob2GLO2v5z/Gv0Y0z7cEekrSo2FZqGdcNs2J7cyYU/DUd68gZNuzuFJv+FZufWfYEr
	X0UeGtM6+MSbv4x/R60r9Z797epBp+dDi9A2qyAyaZM7L4rtqo5W0cka9YolWJes/gQWUuHg
	bQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0xTZxjG953v3NrYeCxVj5ro7CQmzsuMc3kXjTGZ0S9LNpcs2UX/0CJH
	21gqaQsBk0UmJUodFW8ZMAhXHVCzg+XS6solBRF0cwgIndJWIRAv3bxwSStoLRj/+73v8+R9
	nj9eHqvdzFLeYLJKZpPOqGWVtPLrLdnrMl9Y9Z/YShOhWL7Mwp3xcgackQz4/YGHgd4aEf7s
	iVBQXNuEYCJ6nwNX7hCG8Y4bLFSWT2GI1uXRUPyPjYZJ+RWG0c5hDrp8r2lwur6C0KUxGrwn
	3BjaJxNh+HQXC3m2aQyFwRwWYvemGWiO/s/BcU81Be0l3fHxaSMHPU0OBs6/uojBnfUgHjgy
	wEDftWIW+rLvIAhejjEw5ounhquHOHA4ixD4WmtYOG7bBOHGCQ6eX+jAEHJshzcF6dBZtgim
	boUR3L94l4KY18PB7eAfDHTIbgr6H0YxTP1SwoL9v9MI7hZeo+CvkjoGqm71U/Ee38JAbIaC
	c71lLIzYQgh624dp+O1nBwK5xc/AC6+N3v4FaQ8/w8QTqEKkoeZfijzKf0MRf8tNilwtCnCk
	zJVG6qvXkErvY4rY/b2YuGpzWeJ6eZYjQwNelnQVTNOkvuoYeVRfiL5Zvke5NVkyGtIl84Zt
	+5X6220eJjVHkXE9WomzUCtnRwpeFD4VK4I2NMussFr0+6N4ljXCRnF8+AZtR0oeC3/PE5vr
	C6hZIUE4IPYH8uZMtJAohs5XzrFK2CxW5IxS746uEJ11bXN7hfCZWFrycC5AHfe02KtwPlKW
	oQ9qkcZgSk/RGYyb11sO6zNNhoz1B46kuFD8nS79NHPGgyb6dvmQwCPtPBU8serVjC7dkpni
	QyKPtRrVk4BZr1Yl6zKPSuYj+8xpRsniQ8t4WrtY9eX30n61cEhnlQ5LUqpkfq9SvGJpFgou
	+DipITLatorU7lE4x/0bBu1rm/dliwnf1d08eCV/pmh+dlNqw05Ld4Xjh55fn3ZuNctydRgj
	98qdx04madaW2hJyPzeGMH+0370kNtK4I8na2rVw4b1SOWnk8d5O+6nA5GD+4u5k3Y/yRxHL
	wQ875ivHll83yZElz5ndoZcaLW3R6zauwWaL7i1WlvDdSgMAAA==
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_050112_763914_A24D12B4 
X-CRM114-Status: GOOD (  10.14  )
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

Make mlx4 access ->pp_ref_count through netmem_desc instead of page.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 drivers/net/ethernet/mellanox/mlx4/en_rx.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx4/en_rx.c b/drivers/net/ethernet/mellanox/mlx4/en_rx.c
index b33285d755b9..92a16ddb7d86 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_rx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_rx.c
@@ -460,9 +460,11 @@ static int mlx4_en_complete_rx_desc(struct mlx4_en_priv *priv,
 
 		truesize += frag_info->frag_stride;
 		if (frag_info->frag_stride == PAGE_SIZE / 2) {
+			struct netmem_desc *desc = pp_page_to_nmdesc(page);
+
 			frags->page_offset ^= PAGE_SIZE / 2;
 			release = page_count(page) != 1 ||
-				  atomic_long_read(&page->pp_ref_count) != 1 ||
+				  atomic_long_read(&desc->pp_ref_count) != 1 ||
 				  page_is_pfmemalloc(page) ||
 				  page_to_nid(page) != numa_mem_id();
 		} else if (!priv->rx_headroom) {
-- 
2.17.1


