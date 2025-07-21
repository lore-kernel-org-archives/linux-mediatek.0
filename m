Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F39CC87FC6
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jul 2025 02:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3bhrYXWJvKjSvf77mbHNuVoet9w9SexuVEXBSFz8Pbs=; b=aLYuEGdqHq+y0CkUja2S+e4l1l
	8o+YX/v4GcZO9z6QfBMrFxJCc8PMQBmMPiRfqTuyfIHAJwVOHRU33hi5GEVR4o2LAmnfXeaXokUFT
	ImpOYMTxSk3EJgCZm9YGudQn20znb02ksJs9Uv9grge46bBlw3CX6sp/cimZ/WZAQbSQ5XB1eUqMW
	3JhuF2TsYO+TuoWa/Ku7ubbgA2/bv3Ip1UXGaQAIYpPJwH9YvRBqaz2kILHJesrMu3bAj4UJBkHIb
	AWuKhcLap663O0TWiGQwgCfgWVr85/pU2Th2AIjClS3aB0+CKb3RpzT3ZeJtE31URsgWtMK6/q/Lv
	9/tP82Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udg7N-0000000Fy1f-12kt;
	Mon, 21 Jul 2025 02:19:05 +0000
Received: from exvmail4.hynix.com ([166.125.252.92] helo=invmail4.hynix.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udg7E-0000000Fxgm-2Fag;
	Mon, 21 Jul 2025 02:18:58 +0000
X-AuditID: a67dfc5b-669ff7000002311f-ec-687da387f9c4
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
Subject: [PATCH net-next v12 11/12] net: ti: icssg-prueth: access ->pp through netmem_desc instead of page
Date: Mon, 21 Jul 2025 11:18:34 +0900
Message-Id: <20250721021835.63939-12-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250721021835.63939-1-byungchul@sk.com>
References: <20250721021835.63939-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0yTZxTGfb/3u7WjyZeOzE+N2VLj5iSysXk5f2zTmCx5EzNjdCZmZmHV
	frHduHQFEXBkjOEMDRezeaFSEgilXGNZO2mV4mapwIoyLkqKclvNDM4qDqShFKgtZv/98pyc
	5zkn5/BYOcqs53UZ2ZIhQ52mYuW0/GlC7bazdQXa963zKWC2tbIwOFfLQMtCLjRMuRgYahKh
	Y2CBAnNzO4IX4Qcc2EvGMMx5e1ioqw1hCLeV0WD+q5iGedsihn+6Axz0epZpaLF/BpPWRzS4
	zzoxdM1vhkBFLwtlxREMpokzLETvRxjoDD/joMjVSEHnk6scDLSXM3B+sR6Ds3AqlvVwhIHh
	62YWhn8cRDDRGmXgkScWGGwc46C85TICz+9NLBQVfwjBqy84eH7Bi2GyfA+sVOZAd80bEOoL
	InhQf4+CqNvFQf/EFQa8NicFd/8OYwiVVrNgfFqB4J7pOgW3q9sYsPTdpWJzHIKR6BIFvwzV
	sPCweBLBUFeAhqofyhHYbvgZ+M8dWzmyYGb37CVdwRlMXOMWRH5rGqXI9LkVivhv+Chy7fI4
	R2rsJ4mjcSupcz+miNE/hIm9uYQl9tmfOTI24mZJb2WEJg7L92TaYUIHNn4h/0gjpelyJMN7
	n3wl17qfF2F9lyw3EmpgCpGJNyIZLwrbxbqJAdaI+FX2zR6My6zwjuj3h3GcE4UUcS7QQxuR
	nMfCnQSx01FJxQuvC1+LtVbLKtPCZrHE7qDjrBB2iraVMuqV/5tiS9sfq0aymB6IXT/OSmGH
	GPzXxcRNRaFKJo5WDzKvGtaJNxv99DmkqEFrmpFSl5GTrtalbU/W5mXocpOPZ6bbUezhrAVL
	R11oduCQBwk8UiUo9HSBVsmoc7Ly0j1I5LEqUUF68rVKhUadly8ZMlMNJ9OkLA/awNOqtYoP
	Qqc0SuGEOlv6RpL0kuH/KsXL1heipCf9JWu69fsGTy/NK484FWsXDy9u+/zPLccs/db6DaWe
	Tebv+nqrNBWtuy69fXO5vcL77a96zbPW1PzXPt2d5GwoTc5rO5N9bL84HNV6v3zLl7i8L+ni
	wSup6969Zdrt2/Xx4+5xNtN34HRHypGpWxsrMbo4PXOewIkOuyyMZ34KOVR0lladshUbstQv
	AZbnnIBsAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0iTYRTGfb+7q9HXEvswKFpZYGmFFSeKCIx6CYooK+g+6qOt5pRNTQvR
	dBGuNLuipaFoazppspVOmxWbpGk3p8kq8zIprNbVC62ZNoX++53ngfMceA5HymrpCE6lSRa1
	GoVazkgoyba1OdHnyjOUy+v7I6DYUs1A+1AZDebfaXCnz06Du1KAB69+E1BcVYtg2P+OBWtu
	NwlDTc0MlJeNkuCvyaOg+KWeghHLHxI+PPGy0OL8S4HZuhV6jR8pcJyrI8E1Egneiy0M5OkD
	JBT1nGVg4m2Ahkb/Nxay7SYCXCVPg+OX+yy8qs2n4eqf2yTUZfUFAwe6aOhoKGagI6cdQU/1
	BA0fncFUn6mbhXzzDQTOR5UMZOtjwXd/mIUf15pI6M3fAOOFqfCkNBxG23wI3t1+TcCEw87C
	i567NDRZ6gjo7PeTMHqhhAHD14sIXhc1EPCspIaGirZOInjHTuiaGCPgiruUgQF9LwK3y0vB
	zTP5CCwPPTT8dOipDXHY5ftOYvv7CoTvVb4h8GDBOIE9D1sJXH/jPYtLrSnYZorC5Y5PBDZ4
	3CS2VuUy2PrrMou7uxwMbikMUNhWkYkHbUVo+9y9knVHRbUqVdQuW39YonT8yCaTXKFpgdE7
	dBYq4gyI4wR+pdD6a4cBhXIMv1jwePzkJIfxK4QhbzNlQBKO5J9PFxpthcSkMYs/LpQZK6aY
	4iOFXKuNmmQpv1qwjOdN6QI/TzDXPJ5aFBrUvcHGJ1nGrxJ8n+10AZKUopAqFKbSpCYoVOpV
	MboTynSNKi3mSGKCFQW/yZgxdsmOhjs2OxHPIfl0aRKVoZTRilRdeoITCRwpD5Pi5lNKmfSo
	Iv2UqE08pE1RizonmsNR8tnSLXvEwzL+mCJZPCGKSaL2v0twoRFZ6Jn3UiYKoORrcsGbeFrc
	ftVYv7AgLny/IZY9ZmoKWfZ5UUxryskdB52uuw0NEYH49gX6PYu/rInrM8ofrZvR3xmj2bU0
	OnKjvFsyM55G0xo9B0x/nSVK6Yj7/KItYu0YhMQ+jcpSf1c/3r13yb62gWrFUM583fWxW9Hh
	mUvNg5vklE6pWBFFanWKfwvrg4BJAwAA
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_191856_712125_D5904037 
X-CRM114-Status: GOOD (  10.30  )
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

Make icssg-prueth access ->pp through netmem_desc instead of page.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
index ff5f41bf499e..5e225310c9de 100644
--- a/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
+++ b/drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c
@@ -367,7 +367,7 @@ static irqreturn_t prueth_rx_mgm_ts_thread_sr1(int irq, void *dev_id)
 		return IRQ_NONE;
 
 	prueth_tx_ts_sr1(emac, (void *)page_address(page));
-	page_pool_recycle_direct(page->pp, page);
+	page_pool_recycle_direct(pp_page_to_nmdesc(page)->pp, page);
 
 	return IRQ_HANDLED;
 }
@@ -392,7 +392,7 @@ static irqreturn_t prueth_rx_mgm_rsp_thread(int irq, void *dev_id)
 		complete(&emac->cmd_complete);
 	}
 
-	page_pool_recycle_direct(page->pp, page);
+	page_pool_recycle_direct(pp_page_to_nmdesc(page)->pp, page);
 
 	return IRQ_HANDLED;
 }
-- 
2.17.1


