Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FE7C87FC6
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jul 2025 02:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZAYt3p2mhaflBBar9NtS/KWmCevqxu4ijXBt8SATlQ=; b=nXw04Bt95I4/XUFLEJjcsxT6jX
	o+MsftCdzEbrNIAXjK4l8pxgdaZJ5x1abI6Sve42cjSyhxII7qrtQFqO7+f8+Dj2YnXjJ1Hutes9Q
	OAAWjwlpsu7lsmYi+ZuRb5bT/KXaQBTq2jR9GSmE6Q8btfMwOt8Jkltaouv8mH0BEErehG6SGQiqY
	Zggw44rI4ov11cOLIrWfafcAM0sgPku4t7idgsgcGZt3XcAwwiB947MbOowMEYRPNFzyvfyRecJLt
	38aJGGX3JOdGcJgVsU1kVGlZqxvOfioQbtaBULz+Mh1F23/opTL+eWI7HQEkP+Gq5mb5yv06YyCWx
	ws2roqEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udg7E-0000000FxoR-33Mv;
	Mon, 21 Jul 2025 02:18:56 +0000
Received: from exvmail4.skhynix.com ([166.125.252.92] helo=invmail4.hynix.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udg76-0000000Fxgk-2Yrt;
	Mon, 21 Jul 2025 02:18:53 +0000
X-AuditID: a67dfc5b-669ff7000002311f-46-687da3860969
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
Subject: [PATCH net-next v12 02/12] netmem: use netmem_desc instead of page to access ->pp in __netmem_get_pp()
Date: Mon, 21 Jul 2025 11:18:25 +0900
Message-Id: <20250721021835.63939-3-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250721021835.63939-1-byungchul@sk.com>
References: <20250721021835.63939-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzVSbUyTZxT1eZ/3qx1N3nTGvbLpsiboYhSHot4sczEmy54sMcP4w0QStypv
	bGf5sEAFlY0xtgUiyGSr4IppU0BKnSXtlMoK2wqhTFQQsFaFVktQNus+KBIKKGsx/ju5555z
	7s29PFbeZZJ5bU6BpM9R61SsnJY/SbJs+MZaonnHYX0DTI4LLNyMWhiwzxbB+ftuBoZsIvwy
	OEuBqfUygunYPQ6cFaMYoj0+FqyWGQyxtioaTAPlNDx1zGGY6A1z0Od9RoPduQtCzQ9p8Hzb
	jqH7aQqET/WxUFU+j6E++DULi3fnGeiM/c1BmbuFgs7HlzgYvFzNwPdzTRjaS+/Hs8b9DAx3
	mFgY/uomguCFRQYeeuOBkZZRDqrtZxF4f7WxUFa+GSKXpjn494ceDKHqHfC8zgC95hUw0x9B
	cK/pFgWLHjcHN4IXGehxtFMw8iCGYeZkAwuVT04huFXfQcG1hjYGGvtHqPgce8C/uEBB7ZCZ
	hfHyEIKh7jANP35ZjcDRFWDgP0985flZE7tjJ+mO/IOJe6wRkZ9tdygyWfOcIoGuqxS5cnaM
	I2ZnIXG1rCNWz58UqQwMYeJsrWCJc+o0R0b9Hpb01c3TxNX4BZl01aOMVfvk72VJOq1B0m98
	/1O5xmgzs3lnhKKg/youRa2KSiTjRSFdjJ5rYl5iz6iPTWBWWCsGAjGcwMuFNDEa9tGVSM5j
	4XqS2OmqoxLEq0KuWDMZWhLTQooYHahdEiiELeL1jsf0C9M3RXvbb0t1mbBVDMfPn8DKeE/k
	LzeTMBUFh0xsLxvBLwQrxd9bAnQNUpjRslak1OYYstVaXXqqpjhHW5R6MDfbieIf11yykOlG
	U4N7vEjgkSpJkUeXaJSM2pBfnO1FIo9VyxXEd0yjVGSpi49J+txP9IU6Kd+LXudp1WuKTTNH
	s5TCIXWBdFiS8iT9S5biZcmlyDoXmrg45RHTdu8yZg7c/ph8N/LKo+Af6SWf20qNssPXMj4w
	1h4osOwens6oOnJgbHvaR1UNBt2ymgr/Gvqz07XGSOq7IXne5N610snV0TMfulwHhcLkt1Zu
	/ylcvHFh/zb+mW99//S4MmPV1q7et0+snthvT95iXWFJ8WZOUcd3mptVdL5GnbYO6/PV/wMS
	kSiSbQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0yTZxTGfb87jc2+dYifumhSJWZuIIw5T6ZZyEy2NyTOZZvBbVlGA9/W
	hnJJCwxM2BC6i0SBgTpwYEq4CJRQ0k7asYJaCEUQwXJZGeWykhGm9YIFQoXZtSz+9zvnOec8
	JzmHI2UWeienSs8SNekKtZyRUJL3jxRFfV+Xr4y50kVBtbGVgbu+WhoMa7lwdc5Kg7NZgN9H
	1giobulAsOyfYsF01k2Cr9fBQF3tKgn+9vPBzmEdBSvGpyT83edhod/+LwUG03GYbVygwPaD
	hYSelUjwlPYzcF63TkLVzHcMBP5cp6HL/5CFQmsTAT01t4Lh/WssjHSU0HDhaQMJloK5oOH8
	BA2jndUMjBbdRTDTGqBhwR509Ta5WSgxXEZgv97MQKEuDrzXlll4fLGXhNmSeHhWmQN9+ghY
	HfQimGoYJyBgs7JwZ6aNhl6jhYCxv/wkrJ6rYaD4QSmC8apOAm7XtNNQPzhGBPf4CCYCGwRU
	OPUMzOtmETh7PBT8cqYEgbHbRcOSTUfFH8M93kcktk7XI/xr8ySBF8ueEdjVPUDg3y5Ps1hv
	ysbmpgO4zvYPgYtdThKbWs4y2PSknMXuCRuD+yvXKWyu/xYvmqvQB7s/lRxNEdWqHFFz8O0k
	ifJSs57J/JnPnZkYIAtQi7QYhXEC/4ZgczuYEDP8fsHl8pMhDudjBZ/HQRUjCUfyQ1uFLnMl
	ERJe4jOEssVZOsQUHyn4his2G6T8IWGo8z71/9A9gqH9xmY+jH9T8ARPHmJZsMZ7z0qXIYke
	bWlB4ar0nDSFSn0oWpuqzEtX5UYnZ6SZUPCdGvM3frKi5dH37IjnkHyrNJPKV8poRY42L82O
	BI6Uh0ux47RSJk1R5J0WNRlfaLLVotaOdnGUfLs0IVFMkvFfKbLEVFHMFDXPVYIL21mAjLIO
	V8ypPUf3GdzZurSXo07k/7jAabWvfTLvrJ3ue0d9j26LKxoYGP58sPw6xMY3FSSnYEfSh0uf
	lb6QvJT86o4T1ZPbPSMPzIUn30qc/3hKenj4lejGSMsf766Ej3xz80ur8XW3Qj930DeGzwTW
	ypZfjLAfc2zb6Hdov04YtezeWyuntEpF7AFSo1X8BzrKSBBKAwAA
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_191848_780983_2F1B7929 
X-CRM114-Status: GOOD (  14.18  )
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


