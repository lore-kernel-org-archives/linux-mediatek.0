Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05BBC83F39
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jul 2025 07:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3bhrYXWJvKjSvf77mbHNuVoet9w9SexuVEXBSFz8Pbs=; b=AJ3vl180BGU3jh3wyvze41thtz
	IdFyZP+aQ971rx47Y/25FlTW0bGymG6Nm8OhYuKr95Ql+vqKQUWjofCX37FmQFGgbtWk8RWiG/51F
	AoXD1PJjSBleWvx7JSr2YANpBia2e9DHCO7T8fnfXMjDk9Jj10LP6sQPBsQ3GvC5/PY7KDQOIQGVK
	wGGT1bgaZKT69IXFU3zFHPt9BuC0VycwK/ZpOZhl+HkPgNdpM+RcxbEW6FCVEA/nmDbiAImWu1Th1
	jpk+1Yhnxf3dVvw4Zbo1xlhiqk8QrZYXCj/Hqe0Gbo6DJA/dfDLViscnsQecFyagBaoBmPJ83I7xJ
	MqmhjdxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIwR-00000009Q4N-2RvQ;
	Thu, 17 Jul 2025 07:22:07 +0000
Received: from exvmail4.skhynix.com ([166.125.252.92] helo=invmail4.hynix.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucIcH-00000009MJf-0g8g;
	Thu, 17 Jul 2025 07:01:18 +0000
X-AuditID: a67dfc5b-669ff7000002311f-84-68789fb4f16e
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
Subject: [PATCH net-next v11 11/12] net: ti: icssg-prueth: access ->pp through netmem_desc instead of page
Date: Thu, 17 Jul 2025 16:00:51 +0900
Message-Id: <20250717070052.6358-12-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250717070052.6358-1-byungchul@sk.com>
References: <20250717070052.6358-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0yTZxTHfd7nvbXS5E3HtncY42wgZE6ZTpznw+Y1MY8fNCZmHzYztRmv
	tlu5pEiBJcbCaghEilOcoCWClmvNyopAwRa3gkh0m1CQVe6WYNDV6QQaapGuYPz2yzn/8/+f
	kxweK4eYOF6bdkLSp6l1KlZOy5/FVG24cSVHs7G6/UOw2K+z0DdTxYBtPgdqJ5wMeOtFuNk7
	T4GloQXBbGiYA0fhCIaZrjssXKsKYgg1FtNguW+iYc7+CsNUt5+DHs9rGmyOfTBe85gGV0Er
	hs65BPCX9LBQbApjKB87zUJkKMyAO/QvB/nOOgrc/zRz0NtiZqD0VTWGVuNENGtykIH+dgsL
	/T/2IRi7HmHgsScaGKgb4cBsu4TAc6uehXzTZgg0z3Lw4kIXhnHzDlgsM0B35XsQvBdAMFz9
	gIKIy8nBX2O/MNBlb6Vg4FEIQ/BMBQtFz0oQPChvp+CPikYGrPcGqOgeB2EwskDBeW8lC5Om
	cQTeTj8Nl/PMCOwdPgb+c0VPDs9b2B27SGfgOSbOUSsiN+ofUmT67CJFfB13KdJ2aZQjlY4s
	0lS3jlxzPaFIkc+LiaOhkCWOl+c4MjLoYklPWZgmTdZTZLqpHB1Y/bX88xRJpzVI+k+2HZVr
	XC/ycUanLCccrGWMqJwvQjJeFJJFa1kH9ZbNpkfLzAqJos8XwkscK2wSZ/x36CIk57HwZ4zo
	bipbFr0jfCc29+Uvi2ghQfRMz9FLrBC2iLWm2/iN6RrR1vjbMsui9XDpOXaJldGwgatGbslU
	FGwy8cyvNubNwAfi73U++ixSVKIVDUipTTOkqrW65CRNbpo2J+nb9FQHin5czcmFQ070sveg
	Bwk8UsUojjZma5SM2pCZm+pBIo9VsYrzXoNGqUhR5/4g6dOP6LN0UqYHreJp1fuKT4PZKUrh
	uPqE9L0kZUj6t12Kl8UZUbbxyGeRlssrf76Y2LJ667QieQDHf6SKjT0mH71QsHbhKb/t5E8K
	4fSa7V9k7MZu88baxP62u8m6QOnCloqkeHfwcMHtxBKSvjXuqzznziE6YWrznvX3h/cP9yTM
	2qf+pg7xTuuew6f08ZN5ewsXd2Zd/OZ58ZdXJkr8rcaaj7vfbXuoojM16k3rsD5T/T/bKOPB
	bQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSbUxTZxTHfe5z39rZ5Kay7YrGlzpDJNHNOfQkmuliDDcajdE4DV+kKXdr
	FYpptYJmoWKNsdGqgBEQYhEQCgaaIlK06NKCsDmclEKqImBVBOnwpUAsdXSFxW+/c84/53c+
	HBbLm6h4VqM9LOq0ynQFLSWlO9afXHnzapb6u1GzBErqb9DQFSqjoPZjFlQNOinw2ni48+gj
	ASU1txCMh58y4DjThyHU2k5DedkkhrD9HAklf5tImKifwvDqfoCBDve/JNQ6tsPA9SESXKeb
	MHgmlkPgfAcN50wRDEX9p2iIPolQ0BIeYyDXWU2Ap/SPWDnayMCjWxYKCqYqMTQZB2PCF70U
	dN8uoaH7ZBeC/htRCobcMWuwuo8BS20xAvc9Gw25pjUQbBxn4N2lVgwDlk0wXWiA+9avYPJB
	EMHTyh4Coi4nAw/76yhorW8iwPc8jGHybCkN5n/OI+gpuk3AX6V2Cioe+IjYHbuhN/qJgHyv
	lYYXpgEEXk+AhCsnLAjq7/opeO8ykZs2C57gWyw4n1Ug4abtMSEMX5gmBP/dPwmhufgZI1gd
	R4SG6kSh3DVCCGa/FwuOmjO04PiQxwh9vS5a6CiMkEJDRY4w3FCEdi5KkW5IE9M1BlH37Y+p
	UrXrXS4+5JFkRSarKCMqYs1IwvLcD7zF9JyYYZpL4P3+MJ7hOG41Hwq0k2YkZTHXOZdvaSic
	Dc3jDvCNXbmzIZJbzruHJ8gZlnFJfJWpDf+/dDFfa/99liWxfqQgj55heUzmu2ZkLiCpFc2p
	QXEarSFDqUlPWqU/qM7WarJWqTIzHCj2Ttd/+3TRica7k92IY5FirizVflQtp5QGfXaGG/Es
	VsTJ8r0GtVyWpsw+Juoy9+uOpIt6N1rAkoqvZVv3iqly7lflYfGgKB4SdZ+nBCuJN6J8xZBh
	DRP/0uePBh9/4GWdysSFK6a3vem/skV7IJx5qs6x6+22E+VlrCqnRmpP22X/OWUk2TbR/vD1
	2YQvNlbtsS7tWXZnqKDNt4Rq/kaOrKcrRzxr51/Wdy6iVKGxL5dNGduKn/DrugLHVZ5ffvI2
	f++1hfx1oyuLxX2aa409LQpSr1auTsQ6vfI/eYGsbkoDAAA=
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_000117_334185_374C32C3 
X-CRM114-Status: UNSURE (   9.67  )
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


