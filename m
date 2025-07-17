Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D919C83F1B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jul 2025 07:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RbUQ3++q4iYZul3ioQdNOTIB1W3aEiyunf6GCe+sEwc=; b=pPsnjcsjLj7UWjquf5zTNRkSzH
	oItPLdpvKqn9tN3ZJh7udq3eggg/xcuiobJywpdhPF8ydZc82Rm0ORF23xp2wlWjhARynZ+QGy/ux
	qXyNbznV/71e/LqnAUL0BuFAjQGNozWJMZ4W1TVmzfsX+4iriNRLkRTokO/RnKfLhoMzod6ySHxxJ
	jrmWueuAtPzfQVNSIb3aicZ6yrZDUA4YOn6niXudynCMXzEtGU2HYG4iRM6fK2mTuxd3v5SHmHvii
	RzmDZfPDbWtFFCIbNszG8tvfO08Xieb8wRIxaCrlVy835MxyOTo5i7EyUpqJivLek0p3MQoruo4xK
	fCS5B7SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIwP-00000009Q1j-2Ett;
	Thu, 17 Jul 2025 07:22:05 +0000
Received: from exvmail4.skhynix.com ([166.125.252.92] helo=invmail4.hynix.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIcD-00000009MJV-1LLi;
	Thu, 17 Jul 2025 07:01:15 +0000
X-AuditID: a67dfc5b-669ff7000002311f-02-68789fb30538
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
Subject: [PATCH net-next v11 04/12] netdevsim: access ->pp through netmem_desc instead of page
Date: Thu, 17 Jul 2025 16:00:44 +0900
Message-Id: <20250717070052.6358-5-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250717070052.6358-1-byungchul@sk.com>
References: <20250717070052.6358-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0yTdxTG/b/3dtS9q2R7p/GyGuImERUxOTHTEL/4+sFLhA9T8dKMN7ax
	oGu1gsmUcdHQaCFeQaqrXJRSAqQVKFrYVphURVcrNkWQIgyC4eKlgi11dq2Xb788T87znJMc
	Bpf2kHMZZeYhQZ0pV8koMSGeiClfZv09S7HixL/xYKivpeCh/yoJ5kAWXB+wkeA2cXDLFcDA
	UNOE4E2wlwZLYR8O/o5OCiquTuMQbDhNgOGffAKm6mdwGL49SIPT8R8BZssm8F0bIcB+shmH
	9qk4GCxyUnA6P4RDaX8BBeEnIRJag5M05NqqMWgda6TB1aQn4dxMFQ7NOQORriEPCY9uGih4
	lPcQQX9tmIQRR6RwvLqPBr35EgLHHyYKcvNXwXjjGxpenu/AwadPhvclWrht/Bqm740j6K16
	jEHYbqPhQX8dCR31zRh0PwviMH3qMgW6iSIEj0tvYtB1uYGEynvdWGSPFPCE32Fw1m2kYCjf
	h8DdPkhA2W96BPVtXhJe2SMnhwIGKnk93z7+AudtTysRf8PUg/Gjxe8x3tt2F+NbLj2leaPl
	MG+tXspX2J9jvM7rxnlLTSHFW16fofk+j53inSUhgrdWHudHraVo6/wd4h/TBZVSK6iXr9sr
	VgTMHnSwQpT1xBbEcpCL1iERw7FJXPNLE/WZu4svkFGm2CWc1xvEoxzLruT8g52EDokZnL0f
	w7VaS7CoMYfdzQ07LkaYYQg2juupSo7KkkiOvvftp8yFnLnhzw85InY1Fzp35oMujXaV59DR
	TI4tE3GmwgL848C33F/VXqIYSYxoVg2SKjO1GXKlKilBkZ2pzEr4+UCGBUUe7tqv73ba0GtX
	igOxDJLFSPY2HFFISblWk53hQByDy2IlZ91ahVSSLs8+KqgP7FEfVgkaB5rHELJvJInTR9Kl
	7D75IWG/IBwU1J9djBHNzUHrx06Uxfx07Jb/QtuWuh27Er5vzzvasmFjadeK735p2R5vTTXG
	09d1xXVfEanBO4kaV6/3ZOWaVbGiodG12IKhxanb0sA9e9GMx/PMUZF7ZbgrLe2VLP7LkYJu
	55qk8K6B8i+eJxYNbxr1dQYmyn6Yf8Osmj3jm3Tuu+L/e52hbWPKZhmhUchXLsXVGvn/Rquh
	wmwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0hTcRzF+923o8FtWV0yCgYVBFlRwZeKEIS6BEVQ0AvKS97acE7ZdOlC
	MltEK5e9tbQsH+kWObbUZbPHNsxeptPWzFdqhdHs5TLXrLUV/Xe+58D5fP84DC5rIGczSnWW
	qFELKjklISSbVh9ZbL+ao1haeH0GlNbdpKBj7BoJlokcuPHGQYK3loO77RMYlJobEARDPTTY
	jvfiMOZ5REHFtXEcQtZCAkpfGAj4XvcTh3ctQzS0un4RYLFthIHq9wQ4jzXi4P4+H4ZOtVJQ
	aAjjUNJ/lILI6zAJzaFPNBQ4ajBwlz2Onh/raWhvMJFw7mcVDo35b6LAYR8JnU2lFHQe6UDQ
	fzNCwntXlBqo6aXBZLmEwHW/loICw3II1Adp+HLeg8OAKQl+F+ugpXwmjD8NIOipeolBxOmg
	oa3/FgmeukYMugZDOIyfLKPAOHoKwcuSJgyelVlJqHzahUX/2AK+yCQGZ73lFAwbBhB43UME
	XD5sQlB3z0/CV6eBSErm3YHPOO/oq0T87dpujB8p+o3x/ntPMP7OpT6aL7dl8/aaRXyF8wPG
	G/1enLeZj1O87dsZmu/1OSm+tThM8PbKQ/yIvQRtnrtTsiZVVCl1ombJ2hSJYsLiQ5kVcTmv
	HSEsH7XTRhTHcOwKrqvoAhnTFLuQ8/tDeEzHs8u4saFHhBFJGJx9PpVrthdjsWA6u5t757oY
	1QxDsPO57qqkmC2N9ph6flD/OudxFuuDvz1x7EoufO7MX18WY13Pp4uQpBxNMaN4pVqXLihV
	KxO1aYpctTIncW9Gug1F11SdN3nagYKd612IZZB8qjTFekAhIwWdNjfdhTgGl8dLz3p1Cpk0
	VcjVi5qMPZpslah1oQSGkM+SbtgmpsjY/UKWmCaKmaLmf4oxcbPz0WLN6pGDHbuUOzzjQt+0
	25OrytQFtWj47onWtyN6q3OB/NgW8/bmVH1AjirS1p5w96YkSwan+Ab1Cb42jLlifKgtbsmy
	GvsieXcCz03TwsGPsCZv3ZM5TRlbPdlp5urk7lFJwqv06rA+ddbog32W/dt/tFVuVrmCHQff
	ZgqOL3JCqxCWLcI1WuEPXGe7KUkDAAA=
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_000113_498694_A8C3CAE6 
X-CRM114-Status: UNSURE (   8.81  )
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
index e36d3e846c2d..d6b3a7755f14 100644
--- a/drivers/net/netdevsim/netdev.c
+++ b/drivers/net/netdevsim/netdev.c
@@ -842,7 +842,8 @@ nsim_pp_hold_write(struct file *file, const char __user *data,
 		if (!ns->page)
 			ret = -ENOMEM;
 	} else {
-		page_pool_put_full_page(ns->page->pp, ns->page, false);
+		page_pool_put_full_page(pp_page_to_nmdesc(ns->page)->pp,
+					ns->page, false);
 		ns->page = NULL;
 	}
 
@@ -1069,7 +1070,8 @@ void nsim_destroy(struct netdevsim *ns)
 
 	/* Put this intentionally late to exercise the orphaning path */
 	if (ns->page) {
-		page_pool_put_full_page(ns->page->pp, ns->page, false);
+		page_pool_put_full_page(pp_page_to_nmdesc(ns->page)->pp,
+					ns->page, false);
 		ns->page = NULL;
 	}
 
-- 
2.17.1


