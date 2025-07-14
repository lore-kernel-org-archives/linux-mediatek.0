Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80522C83F28
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jul 2025 12:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9r9AqzJSLA1D1ZaSzMEcs3ZbuUbrvaNUswiizKwmHwU=; b=n+0XwDEeXIqSAWZv0aOAX/63LK
	z0Wb519a0sQgJvme3LVfHIJnxH5ge+osoqKsotv1Fq+AkN8EVWG596fwvx0tvCkITL4iW0nUUgkdu
	Uljkaje+iFKBXF0lUii+KRT3miQkyx+lxHOM4ZQnvPtFXrKd72fTJaSsc41ejADBJ+rfm0dvc3Wu/
	eMH5yKMlUStp7yZJTPXyAxEP9oFdpMPgqA9CqKEn44sSPpo+PNqn3XO3z6LfMLf/ExRURh/u87/hl
	+aMmAeNUrysz5EPalanGUndFHD/07aW3BoBtmciy059ESCsDH5fngnkoDqi4dwOO4M94SUmucKTFa
	EK1A2y1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIHj-00000002ALc-1Ghr;
	Mon, 14 Jul 2025 12:27:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHsD-0000000266X-06eR;
	Mon, 14 Jul 2025 12:01:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9r9AqzJSLA1D1ZaSzMEcs3ZbuUbrvaNUswiizKwmHwU=; b=jrHdbNGZyl+shGgxr6aPhhGZqG
	5HNxcSadjlHnDMf6oHWz+rer4WBz57E5s4CIXeK+trcOea18MXFcEcZ7nWVYyWbPCAvRSLIkbuPdN
	I+RTdPKK9XStFssUZ9UG9WMUHInsgn/HrOVmZZOdFFKCRRsqwwpXla3RIojDICqDCqoy6nIaQI4Mo
	snPvkZYm46qlSJXdLQgfeJRtY11x7rym0v1F9YEhozU8WQgQqmAdehJ0dtYLWkKmcREijEFT4IBNp
	Fk9TsmvP5IA9C/2W6Kn2jSfuo6qcboENHj+9dugmMC3hNCcrdKHe//Nzm7vncm+bcWOucPtBX6xwV
	fxHow3Nw==;
Received: from exvmail4.skhynix.com ([166.125.252.92] helo=invmail4.hynix.com)
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubHs9-00000009lEn-3J69;
	Mon, 14 Jul 2025 12:01:31 +0000
X-AuditID: a67dfc5b-681ff7000002311f-46-6874f179b704
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
Subject: [PATCH net-next v10 05/12] mt76: access ->pp through netmem_desc instead of page
Date: Mon, 14 Jul 2025 21:00:40 +0900
Message-Id: <20250714120047.35901-6-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250714120047.35901-1-byungchul@sk.com>
References: <20250714120047.35901-1-byungchul@sk.com>
X-Brightmail-Tracker: H4sIAAAAAAAAAzVSe0xTdxjd7/7uqw1dbgqyK8aQNSNGEvExIJ8J29Rkyf3HR2IyowTn3bix
	jYCkIK+EjCHGWAXdmLFIyUAqtlQtaRU6LA8LFuKLp6QqBSxInCIKKKFW6VrM/js55zvnfF/y
	sVjpoWJYTVaupM0SM1S0nJS/jri0oWguV73pZJ8CDNarNAws1FFgWSqAKxMOCgbNPNzqXyLA
	0NiM4J3/KQO2U6MYFrp7aKivW8TgbyonwdBXRsJ76wcMz90+Bnpdn0iw2HbCeMM0Cc6TLRi6
	3seB72wvDeVlAQxVYydoCD4JUNDmn2Wg1GEioO3VTQb6myso+OvDZQwtJROhrskRCoZaDTQM
	HR9AMHY1SMG0K1Q4YxploMJyEYGrw0xDadm3MHPzHQNvz3djGK/YBsv6PHDXRsPivRkETy8/
	IiDodDDwcOw6Bd3WFgKGn/kxLJ6poUH3+iyCR1WtBNyvaaLAeG+YCO2xF0aCHwmoHKylYbJs
	HMFgl4+E6t8rEFjbPRTMOUMnB5YM9LYdQtfMGyw4vEYk3DA/JoQX55YJwdN+lxD+uehlhFrb
	McFuihfqnf8Sgs4ziAVb4ylasM3/yQijI05a6NUHSMFu/E14Ya9Ce9YekKekSxmaPEm78ftD
	crVB7yKzK5mC59XrS9BpWodkLM8l8mbDFKlD7Ap+9SY/TNPcOt7j8eMwjuI28wu+ntCInMXc
	gwi+za4nwkIkt58fPuNbySG5OL7j2u0Vg4JL4uuG56nP+bG8palzhZdxyfzfNc9QGCtDM+06
	Iw6H8ly9jHcP2fBnw2r+tslDnkOKWvRFI1JqsvIyRU1GYoK6MEtTkPDr0UwbCv1bQ/HHVAea
	79/rQhyLVBEKeJmrVlJiXk5hpgvxLFZFKV56tWqlIl0sLJK0R3/WHsuQclxoDUuqvlJsWcxP
	V3KHxVzpiCRlS9r/VYKVxZSgzONDs51b27gp7z7z1IbmNHfchV/SVtu13ktUuWlHx8HgtREm
	Zhf39dp4jGN3W6Nao+XO2KiUZTGp6Dz/zcT27GLrZLVYt6rH9McPpbuTIt9WHvjyCKf/Lt/V
	sFPJNozJ9ltSA2nEnvvl7ofdC7PJPxk7Ew7dSI7cdOfE4x/39RSryBy1uDkea3PE/wBNZQ3Y
	awMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSa0hTcRjG+5+7w9FhSR0yKlYRCllRxtuVqA8doiIKun2pkae21CVn3mZI
	Vuu2UrMbszbyVnmr2UxdNs3mJUstczpmeWtiZK7MNGla2Rb07fe8z/vyPB9eBpeVkbMZlTpW
	ENWKKDklISQ71p5Zoh2JVS5rKV8JRnMxBW9Hs0ko+pkI9/usJLQVcPC09ScGxsJyBGPe9zRY
	LnbhMFr3goLc7HEcvCWpBBjf6Aj4YZ7AYaDBTUOj/TcBRZbt0HvvIwG28xU41P5YBO70RgpS
	dZM4ZPacpWDq3SQJVd6vNJy25mNQa3rpk0NlNLSWp5FwfeIuDhUpfb7AficJjkojBY4zbxH0
	FE+R8NHuS/Xkd9GQVnQLgf1ZAQWndSvAUzZGw7cbdTj0pm2EP4Z4aMiaCeNNHgTv73ZgMGWz
	0vC65yEJdeYKDNo/eHEYv2yiQP8lHUFHZiUGzaYSEvKa2jFfj93gnPqFwbW2LAr6db0I2mrd
	BNw+lYbAXO0iYcSmIzZu5ms9wzhv7c5D/OOCToz/dOUPxruqX2H8k1vdNJ9lieNL80P5XNsg
	xutdbThvKbxI8ZbvV2m+y2mj+EbDJMGX5p3kP5Vmop1zD0jWRQhRqnhBXLrhkERpNNiJmGt0
	4sDtkBR0idIjhuHYldzQcIIeBTAUu5hzuby4n4PY5dyo+wWhRxIGZ1sCuapSA+Y3ZrD7ufbL
	bsrPBLuIe/bg+b8DKRvOZbd/J/3MsfO4opKaf/MAdhV3x/QB+Vnm26nW5+FXkCQLTStEQSp1
	fLRCFRUepolUatWqxLDDx6MtyPdM95J/ZVjRmGOLHbEMkgdK4XOsUkYq4jXaaDviGFweJP3c
	LSpl0giFNkkQjx8U46IEjR0FM4R8lnTrXuGQjD2qiBUiBSFGEP+7GBMwOwXdKFE4hjMX7mFr
	NmX0a7Tz3hzRpHaGrD+XvCZpYLpwk0amyfqc9N6zkdsXJKA6T5PBMbhamrCvUhpSHJdzLCa0
	fvCqLDnpfsK2jKFpni+71KPOwJmPJi6Mtc4Kmr5gB9XUuVPikUvEvuaW4PliTdW7OQtfdTh/
	B9t2cyPj5uycE3JCo1QsD8VFjeIvbEu7MkgDAAA=
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_130130_254803_53360425 
X-CRM114-Status: UNSURE (   8.66  )
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

Make mt76 access ->pp through netmem_desc instead of page.

Signed-off-by: Byungchul Park <byungchul@sk.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 14927a92f9d1..7e9ddf91b822 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1798,7 +1798,8 @@ static inline void mt76_put_page_pool_buf(void *buf, bool allow_direct)
 {
 	struct page *page = virt_to_head_page(buf);
 
-	page_pool_put_full_page(page->pp, page, allow_direct);
+	page_pool_put_full_page(pp_page_to_nmdesc(page)->pp, page,
+				allow_direct);
 }
 
 static inline void *
-- 
2.17.1


