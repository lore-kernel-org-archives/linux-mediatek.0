Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F21C87FC8
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jul 2025 02:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CeDMN0y2LxxzXxmac8Sov5r+FiCgBlJtQe7PAfm7O1w=; b=Fit+OCdGrOkkn9wxBZ7NW4iLje
	teYlgu1Ue2eaJC0/HdfN1RhOLLHsBtCAXKUVkQNcueKxyrLZH9x8WF6Xf7+TUdp82uaMU0frhcL9n
	TeTi5QGUTOZ2FNT1IEMQ7Ieelcig0Zarfo/TIj3Kqpbed2ER+MDR6Y2Rl59mdZ/fAhEnWtR3DWgTB
	oqpUdyyS+MtlpI9SxX7dlHaJkD02iuZ4bqagk4uMfOEBi6MFQ14sNQJwg2ih2k68ISowcScreti6J
	YIf+pk8+ER8hKDm6azoSY637XW9fVDZv9B9zKfWCxyV3O9UFBFQJtawjgSf2Lz/ZiQhdDUl5P2pb4
	rqfyCW1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udg7M-0000000Fy1E-3uCw;
	Mon, 21 Jul 2025 02:19:04 +0000
Received: from exvmail4.skhynix.com ([166.125.252.92] helo=invmail4.hynix.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udg7E-0000000Fxgh-0iCs;
	Mon, 21 Jul 2025 02:18:58 +0000
X-AuditID: a67dfc5b-669ff7000002311f-d8-687da387e959
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
Subject: [PATCH net-next v12 10/12] mlx5: access ->pp through netmem_desc instead of page
Date: Mon, 21 Jul 2025 11:18:33 +0900
Message-Id: <20250721021835.63939-11-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250721021835.63939-1-byungchul@sk.com>
References: <20250721021835.63939-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0yTdxTG/b/3dm3ypjb6rotxaWIwOpmILkezqXFf/h9mosHE4CWukTdr
	Y6mklY5iiKhFBplgNjSgNVIBpdRY1k6pUrwUQvEOpWIZNy1iUKtDUNYCylqN3345J8/znJNz
	OFLRS6s4nWGfaDRo9GpGSklfyezLimsKtMtLXnwNNtcFBrom7DQ4Y3lw/rGXhqBDgObOGAG2
	hssI3sb7WHCX9JMw0RZgoMY+SUK88SgFtgdWCt65pkgYaY+w0OF/T4HTvRGGzj2jwFfcRELr
	u0UQKe9g4Kh1moSqwSIGZv+ZpqEl/pqFQ956AlpeXmKh83IZDRVTdSQ0FT5OZA330NB91cZA
	9+EuBIMXZml45k8ERuv7WShznkTgv+5g4JA1HaKX3rIwdryNhKGy9fCh0gzt1fNg8k4UQV/d
	QwJmfV4W7g9epKHN1URA6EmchMnfTzNQ+qocwcOqqwTcPd1IQ+2dEJGYIwN6ZmcI+DNYzcCw
	dQhBsDVCwamDZQhc18I0vPElVp6O2Zj1G3Br9F8SewdqEf7b0Uvg0WMfCBy+dpvAV04OsLja
	nYs99Utwje85gUvDQRK7G0oY7B7/g8X9PT4Gd1ROU9hTewCPeqrQpgXbpN9niXqdWTR+u/Zn
	qfbE7QCdE2LzvLHf2ELkYEqRhBP4lUJFYzH6zL1XXtJJZvgUIRyOk0lW8mnCRCRAlSIpR/L3
	ZEKLp5JINubymUJR+amPRhS/SHA8+Ssh5jg5/50w9WbHJ8+FgrPxxkcfSaIcSVw/yQp+lRB9
	4aWTngJ/RiKcbwgQnwRfCjfrw9QxJK9GcxqQQmcwZ2t0+pWpWotBl5e6e2+2GyUe7lzBzHYv
	Gu/M8COeQ2qZPIcq0CpojdlkyfYjgSPVSjkO5GsV8iyNJV807t1lzNWLJj/6iqPU8+UrJn/N
	UvC/aPaJe0QxRzR+7hKcRFWINMtHRzKPOyx1ZwU9pO2n86dkXYoS5/W0PemLU5Qp1nGLccua
	3KKZn8btoUesY7NUudX/NPYeHlTY96s6ohKlymT6Jnr4B9Y80Le6vc5wRPpF82b5j46xZbc8
	wxmuEcPOYHRC+mip/b9MFUfmXNzFhc6uay4ckKWmj/m6K1+rKZNWk7aENJo0/wMuA3g+bAMA
	AA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzVSa0iTYRTu/e4uRx9L7MOiYBCBkSllnK50+dFLUET96EJkI7/acJpsJlpJ
	WrNUastuaCloam0aarN05bowRS3TbF5Y5XVWlK7MpsupuWbRv+ech+cC53CkrJoO4VRxCaIm
	TqGWMxJKsmv9+RUXilKU4aOZayGv4j4Db92FNJRNJMG9fgsNdpMAtW0TBOSVViMY835gwZzZ
	TYK7vpGBokIPCd7KyxTkvdFRMF4xScKnBicLTbbfFJSZd0Lf3c8UWC/WkFA3vhSchiYGLuum
	SMjtTWfA936Khqfe7yycsxgJqMt/6R+HH7HQVq2n4fpkCQk1qf3+wMEuGtqf5DHQfv4tgt77
	Pho+2/ypLmM3C/qyWwhsz00MnNOtAtejMRZ+3KgnoU+/GWZyEqGhIBg8zS4EH0o6CfBZLSy0
	9pbTUF9RQ0DHgJcEz6V8BrK+GRB05j4h4HV+JQ3FzR2Ev8de6PJNE3DNXsDAoK4Pgb3OScHt
	ND2CimcOGkatOmrzNlznGiGxpacY4YemdwT+cmWGwI5nrwj8+FYPiwvMJ3GVMRQXWb8SOMth
	J7G5NJPB5p9XWdzdZWVwU84UhauKz+IvVblo9+KDkg3RolqVKGpWbjoiUd581UjHd7BJlokM
	NhWZmCwUwAn8auHd42F6FjP8MsHh8JKzOIiPENzORioLSTiSbwkUnlblELPEfP6AkG64/VdM
	8UsF08ADv5jjpPwaYXL00D/PJUJZ5Yu/PgH+tdN/8Vks4yMF15CFvoIkBWhOKQpSxSXGKlTq
	yDBtjDI5TpUUdvRErBn5v+luynS2BY21b7chnkPyQGk8laKU0YpEbXKsDQkcKQ+S4sZTSpk0
	WpF8StSciNKcVItaG1rIUfIF0h37xCMy/rgiQYwRxXhR858luICQVHRM07JlZebpsOB1M4cC
	Mx7YFvl2K9La4n//Slq9vFzWbHRfH5GGhF9QN5UMdUgbiGqV3pkQut8QeaC5xtV/eO7GcM28
	7tKtnj2enSPTPY6Dy63txm2OzuyUdPudoX5DhjHmTJ/bY3GkBkfPjdIuXKHMnxqnF8+f56zN
	Lmz9aH7vk1NapSIilNRoFX8AjoMWi0kDAAA=
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_191856_361791_84EB1378 
X-CRM114-Status: UNSURE (   9.54  )
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

Make mlx5 access ->pp through netmem_desc instead of page.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c b/drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c
index 5ce1b463b7a8..5d51600935a6 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/en/xdp.c
@@ -710,7 +710,8 @@ static void mlx5e_free_xdpsq_desc(struct mlx5e_xdpsq *sq,
 				/* No need to check page_pool_page_is_pp() as we
 				 * know this is a page_pool page.
 				 */
-				page_pool_recycle_direct(page->pp, page);
+				page_pool_recycle_direct(pp_page_to_nmdesc(page)->pp,
+							 page);
 			} while (++n < num);
 
 			break;
-- 
2.17.1


