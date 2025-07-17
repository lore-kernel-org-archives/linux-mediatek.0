Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77654C83F34
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jul 2025 07:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZAYt3p2mhaflBBar9NtS/KWmCevqxu4ijXBt8SATlQ=; b=SFzwaJor/rjFwP2lG/LZ53lFMN
	OS5zmcJoGuCGdfcb7el69UqGzZwJ3qjoVxNBhXa4hjEkB1EaCs6TRH2PgFPAeH21/QC4MMxvkfG2t
	86ZEElMGRuwhYt8HoF/V7Min2WLmwl0DwjIxHRcotmdVAZzA/w2Oa7TRGb0+BCEvxdYvm16bmCC5D
	qhkj2LeoFx+n/p7vEYmSJMB2a3ca6Ab8Dm14q7+OPXy1+yODC7ptK/jr0B12z52Cq/LKfRlVyDIC9
	VIFuodJy59Y6NODA+aGs6wKAtfd7DMGQ1kFpP6zZu3+pfhqfcPfc8HmeVp2OuWnkvuTQ+ZqHnSJ12
	pppoHwIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIu0-00000009PbD-1jWZ;
	Thu, 17 Jul 2025 07:19:36 +0000
Received: from exvmail4.hynix.com ([166.125.252.92] helo=invmail4.hynix.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIc8-00000009MJc-3kWx;
	Thu, 17 Jul 2025 07:01:13 +0000
X-AuditID: a67dfc5b-669ff7000002311f-dc-68789fb3dfbc
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
Subject: [PATCH net-next v11 02/12] netmem: use netmem_desc instead of page to access ->pp in __netmem_get_pp()
Date: Thu, 17 Jul 2025 16:00:42 +0900
Message-Id: <20250717070052.6358-3-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250717070052.6358-1-byungchul@sk.com>
References: <20250717070052.6358-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTZxTH99znvrVyl5v6skuNGmvIkkbZ3CA5IdMpJuZ+0Zj4ZdMP0ow7
	WweFtVJAY2SKMzYKBEVAKxYFhdbYph1SobitVEAdrlYkRV7Fl+iEKaINpWgtqN9+yfnl/z8n
	OSxW9FFKVqffLRn0miwVLSfl4wm1q9xnC7Rf9/uXg8VxiYY7k7UU2KcK4OKIh4JgowCtgSkC
	LLYrCF5H+hlwHRnAMOnvpOF8bRhDxHmMBMu/xSS8cUxjeNwxykCX7y0JdtcmGL7whATv4WYM
	7W+SYLS0i4ZjxVEM1UOHaIjdj1LQFvmfgQOeBgLanjcxELhSQsGJ6XoMzUUj8a6HvRTcbbHQ
	cPfgHQRDl2IUPPHFC8caBhgosZ9C4PuzkYYDxd/CWNNrBl5W+DEMl6yDd1Um6LAugvCtMQT9
	9fcIiHk9DNweukyB39FMQM+DCIbw0TM0mMdLEdyrbiHgnzNOCupu9RDxPbZCb2yGgONBKw0P
	i4cRBNtHSTj9WwkCx7UQBRPe+MnRKQu9Ll1sH3uBRc9gHRL/aOwjxKdl7wgxdO0mIV49NciI
	Vlee6G5Qi+e9zwjRHApi0WU7QouuV+WMONDrpcWuqigpuuv2i0/d1WjLkm3y7zKlLJ1JMny1
	NkOuPdlopXMr+YKh3pu4CNk4M5KxAp8ixNpr6E98vfk6Mcs0/6UQCkXwLC/gVwuTo52kGclZ
	zHcnCG3uqjlpPp8jXLS8nWOSTxLaus3MLHPxoJ6RYeZD6DLB7vxrLkjGpwrRE+VzZYpZ51zR
	R8chE+zjaR84Ufi7IUSWIc6KPrMhhU5vytboslKStYV6XUHyTznZLhR/uAv7ZrZ70KvAVh/i
	WaRK4DKc+VoFpTEZC7N9SGCxagF3PGjSKrhMTeEeyZCzw5CXJRl9aDFLqr7gvgnnZyr4nZrd
	0i+SlCsZPk0JVqYsQkpD5Y3BZJl64r8f7y+s+DwtMWV71LgzCT8en8c8bxVkqXreGevLD1es
	iMnYRy+oRc4HM0q16VxlzZKNpd+nKwPkljJ9/dr0vM3ZG9QhYgNwHfam8ozc9S2TK/dGE9cv
	XbNr+obNkHY4LaXm19+vhgKpjmW1dd1HofUHrnPiZ7+KNGo1q9XYYNS8B5/yaN1sAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTZxTHfe5z32hsci1kXF0ysibGSNQpzuT4EuPilj0j2TTxg8mSRW7k
	Zm2AlrVawUytUGJsJjJ1Cq7EIi9SaqRrhXZadCkoDHyj1KYb0GJRZBnDTZBQEVnLsm+/k/PP
	738+HB6rvMwKXqs7IBt0UqGaVdCKL7aWr/VcKtGsbx/jwdZ6lYX+qToGnLMlcGXEx0DQIcLN
	R7MU2FraEUwnBjlwnxzCMNXVzUJ93QyGhOsUDbaHFhpetb7G8OxunIOewDwNTvfnEGsao8F/
	wouh89VKiJ/uYeGUZQ5DTbSChYXf5xjoSExyUOZrpqCz9tfk+GcbB4/aKxk497oRg9c8kiwc
	DTMwcMPGwkB5P4Lo1QUGxgLJ1onmIQ4qnRcRBG47WCizbISJtmkO/v6hC0Oscge8rTbBXfs7
	MNM3gWCw8TEFC34fBw+i1xjoavVSEHqSwDDzXS0L1r9OI3hcc4OCe7UuBhr6QlTyjj0QXnhD
	wdmgnYVRSwxBsDNOw4/HKxG03oow8I/fQu/YSTonXmDiG25A5LrjN4qMV72lSORWL0V+vjjM
	Ebv7IPE0Z5N6/x8UsUaCmLhbTrLE/fIMR4bCfpb0VM/RxNNwjIx7atDu975UbMuXC7Um2fDB
	9jyF5rzDzhZfEEqi4V5sRi1KK0rjReFD8Y73DpViVlglRiIJnOIMYYM4Fe+mrUjBY+H+UrHD
	U70YShf04hXb/CLTwkqx476VS7EyKQqNxLj/pFmi0/XLoihN2CTOnTvDpliVylw2c1VIYUdL
	WlCGVmcqkrSFm9YZCzSlOm3Juv36IjdKvlPTkTff+9D0wKcBJPBIvVSZ5zqkUTGSyVhaFEAi
	j9UZyrNBk0alzJdKD8sG/T7DwULZGEDv8rQ6U5m7V85TCV9LB+QCWS6WDf9vKT5thRllnVde
	yJZmtyWq5tOfklBuljNa6xyb3ntif8fyskHnJ3Tfzm9yHkZy9N/+VLFv1eavTLyitM0d7Tm6
	7EXuZ0+7G6eOj8fMmf2YPaI4VDd5qVyb9tHq3WsTk6HVhzdf179ML85ck1M/vKXg46K2m73b
	n+frpF3x8QeuUceSsopYePh9NW3USBuyscEo/Qsv5N79SgMAAA==
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_000109_067667_A0958814 
X-CRM114-Status: GOOD (  13.55  )
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

To eliminate the use of the page pool fields in struct page, the page
pool code should use netmem descriptor and APIs instead.

However, __netmem_get_pp() still accesses ->pp via struct page.  So
change it to use struct netmem_desc instead, since ->pp no longer will
be available in struct page.

While at it, add a helper, __netmem_to_nmdesc(), that can be used to
unsafely get pointer to netmem_desc backing the netmem_ref, only when
the netmem_ref is always backed by system memory.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 include/net/netmem.h | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/include/net/netmem.h b/include/net/netmem.h
index 535cf17b9134..097bc74d9555 100644
--- a/include/net/netmem.h
+++ b/include/net/netmem.h
@@ -247,6 +247,24 @@ static inline unsigned long netmem_pfn_trace(netmem_ref netmem)
 	return page_to_pfn(netmem_to_page(netmem));
 }
 
+/**
+ * __netmem_to_nmdesc - unsafely get pointer to the &netmem_desc backing
+ * @netmem
+ * @netmem: netmem reference to convert
+ *
+ * Unsafe version that can be used only when @netmem is always backed by
+ * system memory, performs faster and generates smaller object code (no
+ * check for the LSB, no WARN). When @netmem points to IOV, provokes
+ * undefined behaviour.
+ *
+ * Return: pointer to the &netmem_desc (garbage if @netmem is not backed
+ * by system memory).
+ */
+static inline struct netmem_desc *__netmem_to_nmdesc(netmem_ref netmem)
+{
+	return (__force struct netmem_desc *)netmem;
+}
+
 /* __netmem_clear_lsb - convert netmem_ref to struct net_iov * for access to
  * common fields.
  * @netmem: netmem reference to extract as net_iov.
@@ -280,7 +298,7 @@ static inline struct net_iov *__netmem_clear_lsb(netmem_ref netmem)
  */
 static inline struct page_pool *__netmem_get_pp(netmem_ref netmem)
 {
-	return __netmem_to_page(netmem)->pp;
+	return __netmem_to_nmdesc(netmem)->pp;
 }
 
 static inline struct page_pool *netmem_get_pp(netmem_ref netmem)
-- 
2.17.1


