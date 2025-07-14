Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1AEDC83F2C
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jul 2025 12:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qld9P5uMxoJlY3RdRhcPJx1llFYd6ALjjuMqphGGMew=; b=zjMARB9QXmZJDGy6FFVCrt8DgZ
	1TAZtiURKdovhy3rIQHQV1x8aSP1/CSHwIP3DdEVRtxsyLCZ9sdm+nA5k2c1iTq3iGBq2ZFWuadne
	vHwZRluAupbdP/y0MiaMhfr5IGo/YQMEB+8g3wgTj9ZzMmGUYNXoRew7RNX+YuogVx2qdPI/Wf1cj
	TakNcXdrHmrAewGMuyJBD47yQySrcGIq7/2bDgrJiw3lycmuyYguuZAm8EK1kIRbFGF+0k3plGhqj
	Ui1Z+A4geXoWJaeP+oGBf1sCjOuTwtORbtayjVbz9Gs0TLQA7Lw4jMYeTosN8i5Zd5GJ3Oas2Xt4x
	AkZVqwQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIHh-00000002AIW-2WD5;
	Mon, 14 Jul 2025 12:27:53 +0000
Received: from exvmail4.skhynix.com ([166.125.252.92] helo=invmail4.hynix.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHrx-000000025oG-2C9Y;
	Mon, 14 Jul 2025 12:01:18 +0000
X-AuditID: a67dfc5b-681ff7000002311f-c5-6874f17a137d
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
Subject: [PATCH net-next v10 12/12] libeth: xdp: access ->pp through netmem_desc instead of page
Date: Mon, 14 Jul 2025 21:00:47 +0900
Message-Id: <20250714120047.35901-13-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250714120047.35901-1-byungchul@sk.com>
References: <20250714120047.35901-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe2xTZRjG/c53bq2rOakLHEeMSZVIFp1uIrwxaoh/fQlRMfznJa5hJ7Rx
	F9J2Y8VQBs4QKqzIJemgzVq7jW6dtmlh62q3YbeMCU53Yzmzu5ZAEIduDOpK52o74n+/vE+e
	53nf5OWxWmYKeH2lSTJUass1rJJW3s/77tUvl026150LT4PD38HC6IqbAd9qLVyaDzMw1ibC
	jyOrFDjaOxE8TMU5CJ6YxrAycI0FjzuJIRU4RYPjt3oaHvkfY7g9mOBgKPYvDb7g+zDXeoeG
	6PEuDP2PtkLCNsTCqfo0hsbZr1nI/J5moCf1FwfHwl4Kev68wsFIZwMD5x63YOiqm8923Zpk
	YDziYGH8q1EEsx0ZBu7EsoWL3mkOGnwXEMT62lg4Vv8GLF55yMHS+QEMcw27YN1eA4OuTZC8
	sYgg3nKTgkw0zMGvsz8wMODvomBiIYUhedLJgvW+DcHNxggFvzgDDDTfmKCye+yFycwaBWfH
	XCzcqp9DMNafoOHi0QYE/l6ZgeVo9uT0qoPd9R7pX/wbk/BMMyKX26Yocvf0OkXk3usU6b4w
	wxFXsJqEvIXEE/2DIlZ5DJNg+wmWBB+c4cj0ZJQlQ/Y0TULNR8jdUCPa8/zHyrfLpHJ9jWR4
	7d1Spe5qQjgwzNZ2D59h6tAgY0U8LwrbxW/dVVak2MDAkI/LMSu8LMpyCuc4XygWVxLXaCtS
	8lgYzhN7QnYqJzwrlIq3nZENpoWt4np8ecOsEnaINvcE9ST0BdEXuLoRpMjOm5wLKMdq4U2x
	19qMc6Gi4FOIE5k1/MTwnPiTV6ZPI5ULPdWO1PrKmgqtvnx7kc5cqa8t2ldVEUTZf2s9vPZJ
	GD0Y2RtDAo80eSq4Z9KpGW2N0VwRQyKPNfmqezMGnVpVpjUfkgxVnxuqyyVjDG3hac1mVUny
	YJla2K81SV9I0gHJ8L9K8YqCOrS7r9hOlO8sHT771p44tdLHF+10060H5aaXzo1MXTd7jTta
	CjXThyIznf/073yRjS41hbZUX5z/+fsFj23bBx9+9tH8M47L3enNm5JHVUfi5uOlNsNAqT+j
	tJhHSyxF+efN7KcFa56OVqdLEzDulk9a6hTrpsj4fss3U5ZXPPYSDW3UaYsLscGo/Q8+Q2Wh
	awMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUxTZxTGfe97v2iouamoN34mTdSIChLFnEUjZjN61eggJhqN0Va5sY1t
	NS0SIFsGUrfQSEHFCNo6iKhAjZAitGJFUhDZED/4so5CoUbDpJtiAa0oWDD+9zvnyXme54/D
	YlktNY9V61JEvU6pkdMSUrJrffaqjOEU1eqyhqVgqbxJw7NgCQW2j2lwo99JQXs5D3effiTA
	UlGLYCTUw4A9x4sh2PSQhqslYxhCVbkkWJ4YSRit/IThVbOfgRb3FxJs9p3gu/6aBNcfDgyN
	o0vAn9dCQ65xHENR32kaJv8Zp+Be6H8GTjnLCGi0/hUeh2oYeFprpqDg0zUMjsz+cODLbgo6
	6iw0dGQ/Q9B3c5KC1+5waqDMy4DZdgmB+345DaeMayBQM8LAuwtNGHzmTTBRmArNxXNgrDWA
	oOdaFwGTLicDj/tuUdBU6SCgcyCEYeyMlQbTf3kIuorqCHhkraKgtLWTCPfYDd2Tnwk4315M
	w0ujD0F7o5+Ey1lmBJX1HgqGXUZy009CY+AtFpy9pUi4Xf6CEAbzJwjBU/83Idy51MsIxfaT
	QnVZtHDV9S8hmDztWLBX5NCC/f05RvB2u2ihpXCcFKpLfxMGq4tQ4qL9kg3JokadKupjNyok
	qgY/d6KNTrvTdo7KRM2UCUWwPLeWr2qxMVNMc8t4jyeEpziKi+OD/oekCUlYzLVF8veqC4kp
	YRan4F9Z66aZ5JbwEz3D08dSbh2fV9JJfDNdzNuqGqaNIsL7P60DaIplXDxfbyrF+UhSjGZU
	oCi1LlWrVGviYwzHVOk6dVrMkeNaOwp/0/VfP591opGOrW7EsUgeKYU3KSoZpUw1pGvdiGex
	PEr6plevkkmTlekZov74If1JjWhwo/ksKZ8r3b5XVMi4o8oU8ZgonhD131WCjZiXiWocWa2x
	K4YsiR9ykxIy1htmbslIO/T7tuWKNUcMi8+uZOP6Y7I/aAcKzkc/j8/fU+graN3oXWVPn/3j
	DsZ8d+VQ3YM+PmvGwltdmtD8XRdzkgLJhzu0jgNa38EfBueMJu2L9CRg1dI4RcIvur0LgiOx
	0otbrwQ3W342Ghf0eKUbkvvlpEGljIvGeoPyK23aEZJJAwAA
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_050117_690277_ADE42864 
X-CRM114-Status: UNSURE (   9.52  )
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

Make xdp access ->pp through netmem_desc instead of page.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/net/libeth/xdp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/net/libeth/xdp.h b/include/net/libeth/xdp.h
index 6ce6aec6884c..f4880b50e804 100644
--- a/include/net/libeth/xdp.h
+++ b/include/net/libeth/xdp.h
@@ -1292,7 +1292,7 @@ static inline void libeth_xdp_prepare_buff(struct libeth_xdp_buff *xdp,
 	xdp_init_buff(&xdp->base, fqe->truesize, xdp->base.rxq);
 #endif
 	xdp_prepare_buff(&xdp->base, page_address(page) + fqe->offset,
-			 page->pp->p.offset, len, true);
+			 pp_page_to_nmdesc(page)->pp->p.offset, len, true);
 }
 
 /**
-- 
2.17.1


