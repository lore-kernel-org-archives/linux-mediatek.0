Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BFAC83F22
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jul 2025 12:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBehm+l6yNaIM6GyguD8OP8uRws9CAXHEEmzeunVrvU=; b=XZ8PUSNPMiIG7uUQy35iR47FPD
	Mvrv72CJNxHrNOCpigH/AmXljq/SiK1ha+/63PA9vZmjOLH80ynnxUe1HjKbuwZnRGysL9elZAkeD
	lfngYPGZgTm8BzgXqxCM2vFtvUiDeyE4UM4YiITJNYPRcWiRb3hsDvkJyr0dI/Lga59FjSjfITIoi
	kTnUiHE7SdEUKoIE2yACyBJ+SouCw1p9Ry4A9FNitdBPuCbVWIiJI15R07PE+MYb37w8Z0gazgPfu
	1d5uErOg0q6bDoMr5ETLLhVd/DqyPqdmbA96+hJzcHfrfSJ0NhrChA0aySTtm9VTx2sj0BIu7kwSo
	sJYVE2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIHi-00000002AKm-3aoG;
	Mon, 14 Jul 2025 12:27:54 +0000
Received: from exvmail4.hynix.com ([166.125.252.92] helo=invmail4.hynix.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHsB-0000000264e-29RC;
	Mon, 14 Jul 2025 12:01:33 +0000
X-AuditID: a67dfc5b-681ff7000002311f-6b-6874f17ac3ae
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
Subject: [PATCH net-next v10 07/12] octeontx2-pf: access ->pp through netmem_desc instead of page
Date: Mon, 14 Jul 2025 21:00:42 +0900
Message-Id: <20250714120047.35901-8-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250714120047.35901-1-byungchul@sk.com>
References: <20250714120047.35901-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUxTZxTG9973ftHR5KaDedVsc51kCdlQp85j3IzZX69RpwvRbWrCqlxt
	Y0EtiEBGxrA6bUYxbktAyywTWaHEkpaPDgpzpQoqCoJgHZRqmc6xOpVKpdbBap3//XLOk+c5
	T3J4rPAyc3hNdq6ky1ZplayMlt1L/Ondwoe56oUjvtlgstWzcDVUxYB1Kh9+vulkoL9WhLa+
	KQpMdc0IHkWGObAfGcEQ8nSxcKoqjCHSUEqDqVdPw6TtCYbb5wMcdLv/pcFqXwf+mjs0uL5p
	wdA5mQKBsm4WSvVRDBWjB1mY+T3KQHvkHw5KnBYK2v9u4qCv2cjA909OY2gpvhnLGhtiYKDV
	xMLAgasIRutnGLjjjgUGLSMcGK3HEbh/rWWhRL8Ygk2POHjwgweD37gKpsvz4Lz5VQhfCiIY
	Pj1IwYzLycGV0TMMeGwtFFy7FcEQ/raSBcO9MgSDFa0U9FQ2MFB96RoVuyMdhmaeUvBdv5mF
	Mb0fQX9ngIYTXxsR2Dq8DDx0xSpHp0zsqo9IZ/A+Jk5fNSKNtTcocvfoNEW8HRcp8stxH0fM
	9n3EYUklp1x/UcTg7cfEXneEJfaJYxwZGXKxpLs8ShNH9VfkrqMCbXhts+yDTEmryZN0C1Z+
	IVM3OuvpPSEuP3BwfTEaZQ0ogReFJeK5Qz70gk/qT1DPmBXeFr3eCH7GScIiMRToog1IxmPh
	cqLY7iiPi14RVOJ4iTFuRAspYpujN85yYal4oPTx/6ZviNaGs3GjBOF98WTlrfhcEdN0GKrx
	c401QTRX8M95tvibxUsfRXIzeqkOKTTZeVkqjXZJmrogW5Oftn13lh3F/q2m6OkWJ5roS3cj
	gUfKRDmM56oVjCovpyDLjUQeK5Pk4z6dWiHPVBUUSrrdGbp9WinHjebytHKW/L3w/kyFsFOV
	K+2SpD2S7sWW4hPmFKOsY8n2Q56ql+s0zZbln6HBM56+z+83rljw8WrjxqKm1eTKmnlzzcau
	9cOv//Hmj3+WieeSDx/2u+ePLafTU7ZuW9dTGLocTgu6dl0cHkjvGb+gL7huw9cnira8g4S3
	zu5Iilb1bJree2FQu/bTlOYHaz/M8C2b7DXIlQtXfHl7r/+TjZlKOketWpSKdTmq/wBsF4Sg
	awMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0yTZxTG937vd2kbmnyrRD410aQZLjERNV5yjEaJLvHN7gsjJiZGvuAH
	beSibalA1CHUGKtU0JmAQsBRlVssaRGqVNQWAfECcktVKFKiQdbNC9i1orDaZf/9zjnPeZ7z
	x5FhVQuzWKbNMki6LDFDzSpoxY+bilbmvzVoVgfbMFTYGll4PH2RgYZQLlx57mSgv06Atr4Q
	BRX1LQhmws84sJ8YwTDd0cVCzcUghnBTMQ0VvSYa3ts+YHjR6eeg2/2Jhgb7DzB2+SUNruOt
	GDzv48F/upuFYtMshnLfMRbmn84ycDP8NweFzloKPJX3IuWf1zjoa7Ew8PuHSxhaC55HAieG
	GRi4UcHCQNFjBL7GeQZeuiOpgdoRDiwN5xG4b9WxUGhaC4FrMxy8OdeBYcySCHNlRuisXgjB
	+wEEzy4NUTDvcnLwyHeVgQ5bKwWD42EMwVOVLJj/Oo1gqPwGBQ8qmxiw3h+kInckwfD8RwrO
	9lezMGEaQ9Dv8dNw4agFga3dy8Bbl4lO3E48gdeYOEetiDTXPaHIZMkcRbztPRS5fn6UI9X2
	HOKoXUFqXK8oYvb2Y2KvP8ES+7szHBkZdrGku2yWJg7rb2TSUY5+XrpLsXmvlKE1SrpVW1IU
	mmZnI71/msv1H/upAPlYM5LLBH6dUGW6QH1mlv9a8HrD+DPH8muEaX8XbUYKGeYfxgg3HWVR
	0QJeFKYKLdFlmo8X2hy9UVby64Wi4n/Qf6bLhIam21EjOb9BqKocj/ZVEU272YpLkKIafVGP
	YrVZxkxRm7E+Qb9Pk5elzU1Izc60o8g3XT78sdSJZgZ2uBEvQ+oYJUwZNCpGNOrzMt1IkGF1
	rHJqVKdRKfeKefmSLnuPLidD0rvREhmtjlN+u1NKUfHpokHaJ0n7Jd3/U0omX1yAFmp29z1I
	0ZRm/mGqSx5NOxs8OPZd7pZz3QvSzyw6mda7I33mqdXoTOqaq+opWT7ZN/7VN0mN+SXauCMh
	k7o1dWo5ObDn9afZuMRfD02kDclDKVR24M7mL30WNnlwqyHwSy1dI5zqFLflTQS133u64psD
	Obqmgz22u2bLxpjQJnmpmtZrxDUrsE4v/gugXSLdSQMAAA==
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_050131_679163_9050B2D7 
X-CRM114-Status: GOOD (  10.22  )
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


