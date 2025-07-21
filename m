Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5315EC87FC6
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jul 2025 02:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+KnSRLfVkjmxYbH52i+J01joSaYYFgSe5pJMfMoL74=; b=hWB2LpuiULaW9O5JWLNWLDerE4
	utjC1F24c7dLHHr/zhyU0Hyx0J8zvhfLbsuX0cY7D18f0aMRd5rvJW5A8KkaoxHsLrnA76FCLoOXq
	crZuQEzSrS+mDRMKH000DfemPCu8r58Gk0ViI/wqeMH9Y6v79JXMcVw5DPOoktg3AlyYX2E/pmc45
	Bs9g5eir3LcfvFn6pt/0R4WvlIl85qZAdxg5GaZLjEmaasNLDtqDr6r/GyPHkpb2rzZS2UN4n26uv
	3VQK1xwqYSHF0tuj8WQNdI7rL4eBfpYKvojLsGdUUnFRnUM0PAQ6xVOOQ3kKNIMCkq8KgZqN9QMAS
	w8IdTsFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udg7G-0000000FxrN-2psg;
	Mon, 21 Jul 2025 02:18:58 +0000
Received: from exvmail4.hynix.com ([166.125.252.92] helo=invmail4.hynix.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udg76-0000000Fxgm-2cGh;
	Mon, 21 Jul 2025 02:18:53 +0000
X-AuditID: a67dfc5b-669ff7000002311f-6b-687da386ed5a
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
Subject: [PATCH net-next v12 04/12] netdevsim: access ->pp through netmem_desc instead of page
Date: Mon, 21 Jul 2025 11:18:27 +0900
Message-Id: <20250721021835.63939-5-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250721021835.63939-1-byungchul@sk.com>
References: <20250721021835.63939-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0yTZxTGeb97K41fCuinbllSY5aZiYK6nMTLjLrkXQwLinMX3LSBT9vY
	AimKoCF2yKYSBdxwgtQI4SJQhKYM6bQFKQQIeClVSRlIpSrx0u4CWigorED875dzznOec3IO
	R8r76aWcOumwqEtSahSMlJL6QktX/VKWqVpzLf8TMNTXMtA7VkqDcSIdrj620OCsFuCmY4IA
	Q811BK8DAyyYzwySMNbeyUBZqZ+EgOkcBYZ72RS8qZ8k4VmHh4Uu+zsKjOYYcFeOUGA91URC
	25sV4MnrYuBc9hQJRUM/MzDz1xQNtsDfLGRZqgiwvWpkwXE9l4aCyQoSmvSPg15P+mi4f8PA
	wP2TvQiGamdoGLEHDb1VgyzkGi8hsLdUM5CVvRa8ja9Z+PdCOwnu3C0wXZgGHSWLwN/jRTBQ
	8ZCAGauFhbtDdTS01zcR8GA4QIL/7GUGcnx5CB4W3SDg9mUTDeU9D4jgHHHQN/OWgN+cJQw8
	yXYjcLZ5KCj+KRdBfbOLhv+swZWnJgzMlq24zfsPiS2PyhH+o7qfwM/zpwnsau4m8J+XHrG4
	xHwEN1StxGXWFwTOcTlJbK45w2Dz6K8sHuyzMrircIrCDeUn8POGIhT74ffSjYmiRp0m6lZv
	3i9VNVWUopQySfr5i35ajxxsDpJwAr9OcE/2Ee95eNhFzTLDfyy4XAFylsP5KGHM0xmMSzmS
	vxMq2BoK5wRh/I9Cc0HrHFP8CuGdyzMnkPHrhW7DTWq+6UeC0XRrLi7hPxM8wfPPsjxY431p
	oedrrkqErvKYeV4itFa5qHwkK0EhNUiuTkrTKtWadZGqjCR1emRCstaMgg9Xmfk23oJGHXF2
	xHNIESpLoTJVclqZlpqhtSOBIxXhMtx5TCWXJSozjom65H26Ixox1Y6WcZRisSzafzRRzh9U
	HhYPiWKKqHufJTjJUj068HRHwudnA5UxYV+et61WhezmlJN64+m949vqdu+I+LalNtnp+6GQ
	nD5+NNq0YCs9MvDdqK+nNfabDxzEyXZtuKX4yvi+l5rtO/V77kkXZtji3avYL0Yiugv6r+Xv
	3R+2KWzDrhOfPsvbZryw2USLsXpbyNfLl5l+P937Vdb4niW+EK2CSlUpo1aSulTl//TCgJ5s
	AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSaUyTaRDHfd6zbWx8rURfNfFoom5IRI1HhmiMiR981Hhk1yMeWanyxjaU
	QlpowISIUi8UFNEsaFlbCy4Fs8WitkpBLcRWUYSCpCpXixCPenJoRcSC8dtv5j8z/0lmRKTM
	QU8TqTQpglajUMsZCSXZuDxr/lFLhnJhMH8iGG1XGWjqM9NQ/jUN/uty0uCz8lDV+JUAY9lN
	BP3hFyzYT7SR0FfnYcBiHiQhXJFDgfGJgYIB2zcSeu4HWfC6hykot2+Aziu9FLiOOUioHZgD
	wdNeBnIMQyQUdhxhYOT5EA3V4fcsHHaWElBb9CASvr3BQuPNXBrOfSshwZHZFTHsbqWh+baR
	geasJgQdV0do6HVHXEOlbSzkll9A4L5jZeCwYTGEbvSz8PF8HQmduavgR4Ee7psmw2B9CMGL
	kqcEjLicLDR0/E9Dnc1BQEsgTMLgqSIGst+dRvC08DYBj4oqaCiubyEie/wFrSPfCcj3mRjo
	NnQi8NUGKbh4KBeBrcZPwyeXgVq1GteGPpDY2V6M8HXrMwK/OvODwP6ahwS+daGdxSZ7Kq4s
	jcYW12sCZ/t9JLaXnWCw/fNZFre1uhjsLRiicGXxQfyqshBtnrFTsiJeUKv0gnbByjiJ0lFi
	RskWcVreP4N0Jmpks5FYxHNL+EDAT40yw83j/f4wOcpR3CK+L+iJ5CUikns8nq+uLCBGhUnc
	33zNuXtjTHFz+GF/cKxByi3lHxqrqF9DZ/LlFXfH8mJuGR+MnHyUZZGa0BsnfQZJTGhcGYpS
	afSJCpV6aYwuQZmuUaXF7EtKtKPIO13J+J7nRP3Na9yIEyH5eGkylaGU0Qq9Lj3RjXgRKY+S
	Ys8BpUwar0g/IGiT9mhT1YLOjaaLKPkU6brtQpyM269IERIEIVnQ/lYJkXhaJlJ8zo/xfbGt
	T+852rvDvjo1ljkuVpru3I3aHF2ys4l2V3VXtz+4nKa2dIn/ne15ND827uWfNvuWqZ7QXNq6
	ldYzge3eTSfXJqjNJ4OJE1p2xZsD28pm7dqW1/Q8JcGbpfFcHFjy+NLunt19DcnzUhzW2OEd
	2fUDf1xLashp9cTvfSendErFomhSq1P8BMLy5gNKAwAA
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_191848_807500_268FDB23 
X-CRM114-Status: UNSURE (   9.43  )
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

Make netdevsim access ->pp through netmem_desc instead of page.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 drivers/net/netdevsim/netdev.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/netdevsim/netdev.c b/drivers/net/netdevsim/netdev.c
index 611e7f65291c..2b80591981dc 100644
--- a/drivers/net/netdevsim/netdev.c
+++ b/drivers/net/netdevsim/netdev.c
@@ -898,7 +898,8 @@ nsim_pp_hold_write(struct file *file, const char __user *data,
 		if (!ns->page)
 			ret = -ENOMEM;
 	} else {
-		page_pool_put_full_page(ns->page->pp, ns->page, false);
+		page_pool_put_full_page(pp_page_to_nmdesc(ns->page)->pp,
+					ns->page, false);
 		ns->page = NULL;
 	}
 
@@ -1126,7 +1127,8 @@ void nsim_destroy(struct netdevsim *ns)
 
 	/* Put this intentionally late to exercise the orphaning path */
 	if (ns->page) {
-		page_pool_put_full_page(ns->page->pp, ns->page, false);
+		page_pool_put_full_page(pp_page_to_nmdesc(ns->page)->pp,
+					ns->page, false);
 		ns->page = NULL;
 	}
 
-- 
2.17.1


