Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DA2C87FC5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jul 2025 02:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qld9P5uMxoJlY3RdRhcPJx1llFYd6ALjjuMqphGGMew=; b=QGUEi48UfCNYjvSFcLA9kRWD6w
	iiZdTuJDtARlDMqPRV9wL2zirdx2EMO1YFBI+h+zOH9rASHFM0+7NJ85P3erz8pRq+fjqrKE88h94
	r5MrEk430QxQ/ZAeBhxSxKsoTJAwRUNA7URf4ayaw9M7GQFMMNurn95fLxWx11Ol+K6XZpFV8uA2n
	ir4iWlabm2XA/kjDgAlHQf3IEChPIGVxPmRlkRuC6YuTHL0opat82Rh4jiNoHS34Uh0T4kcn47htW
	HY3xA2Tq+fRJPk3qjsjbALF9WnGgp7+mI8st/ePRFPK+HEaSx79oGsSYfUmz23LB4vw7EWIBH8COU
	dm31FPTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udg7N-0000000Fy2S-3U2Q;
	Mon, 21 Jul 2025 02:19:05 +0000
Received: from exvmail4.skhynix.com ([166.125.252.92] helo=invmail4.hynix.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udg7F-0000000Fxgl-1eZq;
	Mon, 21 Jul 2025 02:19:00 +0000
X-AuditID: a67dfc5b-669ff7000002311f-fe-687da38723dc
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
Subject: [PATCH net-next v12 12/12] libeth: xdp: access ->pp through netmem_desc instead of page
Date: Mon, 21 Jul 2025 11:18:35 +0900
Message-Id: <20250721021835.63939-13-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250721021835.63939-1-byungchul@sk.com>
References: <20250721021835.63939-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUxTZxTGfe9970c7ai6dmVecURvJMheZn/PMqDH+9W7LjMbETF2indzY
	ZgVJUQQjCogYGynqMAFXsAR0pTWWlK+KRbQQICIOi5KrtKBFGWrFjwKh4mStZv/9cp6c5zkn
	5/C0WmYSeH3qfsmYqjVoWCVWvoyrWHKiMlu3tLlpLVicl1m4G65gwDGZCX89cjPgqxbhWs8k
	BRZ7A4KxSD8HrpN+GsJtHSxUVkzQEKkpxGD5Ox/DuPMdDU/bgxx0ev/F4HD9DIOXhjF4TjTS
	0DqeCMGiThYK86doKB04zsL0wykGmiOjHOS5bRQ0v6jnoKfBzEDxu4s0NOY8imYN9THQ22Rh
	offYXQQDl6cZGPZGA0M2Pwdmx3kE3pZqFvLyV0CofoyD1+faaBg0b4APJRnQbv0CJrpCCPov
	3qdg2uPm4M7AFQbanI0U3HscoWHiVBkLppdFCO6XNlFwu6yGgaque1R0jq3QN/2egj98VhaG
	8gcR+FqDGP7MNSNwXpcZeOOJrjw1aWE3bCStoVc0cQeqEKmrfkCRkdMfKCJfv0WRq+cDHLG6
	DpBa22JS6XlGEZPso4nLfpIlrrdnOeLv87Cks2QKk9qqo2SkthRtnrdDuTZZMugzJOO363cr
	dTeCQlo3m3m1+yyTg9oZE+J5UVgpDjt2mpDiI56y+5gYs8JXoixH6BjPEpaJ4WAHNiElTwvd
	cWJzbQkVEz4XdouBW1dwjLGQKNbUjbIxVgnfiSMFY9Qn0/mio+bGRyNFtB6MHj/GamGVGHru
	ZmKmouBUiOGqIvypYY540ybj00hlRTPsSK1PzUjR6g0rk3RZqfrMpD37Ulwo+m+Xst/vdKO3
	PVu9SOCRJk6VhrN1akabkZ6V4kUiT2tmqUjHIZ1alazNOiQZ9+0yHjBI6V40l8ea2arlEweT
	1cJe7X7pd0lKk4z/qxSvSMhBP838WrHDsG7bN589iR98SII36xe0fb8iUpz0zzzvwm3lSbZV
	eaPbcxeucexVPXkz3lv8qxTINcWPx53pKo/vz36xAJuMpQmz8Z7A6Oa6a/bt8tKWX57NVC3f
	FJ6/68cL8pc/tJpfpZUVNGQOVRRsWXLOWp7oX21xpyxqOby6wH+k8LcmDU7XaZctpo3p2v8A
	/S99NmsDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0yTZxTGfb/3u9HY5Esl84uLl9Rb1OjmEDzJlOim8c0SdQnJlpg4afSL
	bVoKaYWBkQylYkRBFJdwDSjogDogRaBKcVgqIAyVckkVaLFEhrPiBQQKam1d9t/vnCd5npM8
	h8eKBmYJr9Efkwx6lU7JymjZvm/TN54pS1V//cCxAopqbrDQM3mFAfNsMvwxYmXAWSlC06NZ
	CoqqGhBM+Qc5sJwdwjDpaGeh7Mo0Bn9tFg1FD000vKuZw/CszctBh/0DDWbLXvBcH6PBdqYR
	Q+u71eC90MFClmkeQ777NAuBJ/MMNPsnODhlraCgtfh+cHxRz8GjhmwGLs9dw9CYNhIMHB1g
	oPd2EQu96T0I3DcCDIzZg6m+iiEOss0FCOx/VbJwyhQBvvopDl7/7sDgyd4BH/OSoK30C5ju
	8iEYvNZPQcBm5eCBu5oBR00jBX1P/RimzxezkPnyAoL+/NsU/F1cy0B5Vx8VvCMGBgLvKch1
	lrIwavIgcLZ6aSg8mY2g5o6LgTc2E73je9Lqe4WJdbgckZuVjykynvORIq47nRS5VTDMkVJL
	IqmrWE/KbM8pkulyYmKpOssSy9tLHBkasLGkI2+eJnXlv5Hxunz047IDsm1HJJ0mSTJ8FR0r
	U7d4hYRuNvlW9yUmDbUxmSiMF4Ut4vkq52dmhbWiy+XHIQ4XNouT3nY6E8l4LHQvFJvr8qiQ
	sEiIFYc7q+kQ08JqsfbmBBtiuRAljmdMUf+ZLhfNtS2fjcKCe2+w8RArhEjR96+VyUGyUrSg
	CoVr9ElxKo0ucpNRq07Ra5I3HY6Ps6DgN11PfX/RiqZ699iRwCPlQnkCnapWMKokY0qcHYk8
	VobLSftxtUJ+RJVyXDLEHzIk6iSjHX3J08rF8h9+lmIVwlHVMUkrSQmS4X+V4sOWpKEodW7i
	/lV/Yt4UrTTfM3hwoafw8NVJd/32vq70uyVzb06YTt9ftvvh0aZF51Yla60xluq7ygxzyTfN
	vx6cESPsSz/8M8Nv+S5HF6FlNjT9tGaiecPKjKsjqnW/PH+alft2Z4eo9zauXakIlBzcVbDH
	HdUTvcYVO6s17tdNbHXsjWlR0ka1avN6bDCqPgGcUR1QSQMAAA==
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_191857_625368_3CC0DDFD 
X-CRM114-Status: UNSURE (   9.86  )
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


