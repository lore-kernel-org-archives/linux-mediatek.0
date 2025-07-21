Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601C7C83F17
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jul 2025 02:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1/kIG9TrjmROALwhsmc6Z2cpkes2LxzDbMcoyPKDtO0=; b=a0sfVp/FBvmYwBmBEmcpllo9/h
	0CuaR0igXhJALV5Mjt2yLchZ3cat3+LR+aHLllTPdPWFMqRxw2WKadc1mw6zmjCPk4ZzXdb9j5W47
	YbWq7nImnJgBfDRQLwT8Sharxv4vRiTAXc83ZwK04xnAtyimk0Lc/4Ff6ftW3LU55pKd5+w8705Sj
	WjpCRcDkEONB+QJ2Ru1Y6sro7JPly+gJoIt6MdDFZmY3NbDLiTHQHdEXwvWBE/JvW7CAjxwr2jZIb
	JdEndzHI5qZvdNDuj/2vAjVcoAEk0SU0WzHXrDZ32bAGz0Oj4j4laFALq3IoEd/SmSKXuggXxaswR
	TXYePMUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udg7I-0000000Fxtg-09Oa;
	Mon, 21 Jul 2025 02:19:00 +0000
Received: from exvmail4.skhynix.com ([166.125.252.92] helo=invmail4.hynix.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udg7A-0000000Fxgl-3lst;
	Mon, 21 Jul 2025 02:18:54 +0000
X-AuditID: a67dfc5b-669ff7000002311f-22-687da385c1a5
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
Subject: [PATCH net-next v12 00/12] Split netmem from struct page
Date: Mon, 21 Jul 2025 11:18:23 +0900
Message-Id: <20250721021835.63939-1-byungchul@sk.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSfUxTZxSHfe97P0ql5toZveqMSTM1MZEPP+JxIUYNWV5dXKb8tWmijdzY
	blBJEQQjsdMqAUdlc5vAykQLSCkKaYVWVrp5QUHcEFGwagWFzAArfiENpUDXbvO/J/nlnOec
	5CfDSolZItPqDot6nTpNxcpp+VjspTWnLXmahPPeeDDX17Fwb/wiA7bJHLj8zMVAj1WAX7sn
	KTDXNiF4F3zCgb3Ah2G8rZ0Fy8UAhmBDEQ3mu0YaJuqnMPx1a5CDDmmGBpt9JwxUv6DBne/E
	0DqxAgbPdrBQZAxhKO0/xUL4cYiBluBLDk64aiho+buRg+4mEwM/TFVhcBqeRVxDfQzcbzaz
	cP/kPQT9dWEGXkgRob/Gx4HJVoZA+s3KwgnjOvA3vuPg9Y9tGAZMW2C2JBtuVSyEwB0/gidV
	vRSE3S4OuvqvMtBW76TgwfMghsC35SwUjp1F0FvaTMEf5Q0MVN55QEXuSIG+8DQF53oqWBgy
	DiDoaR2k4edvTAjqPV4G3rgjL4cmzeyWbaTV/woT19NKRK5ZH1FkuHiWIl5PJ0Wulz3lSIU9
	izhqVhOLe4Qihd4eTOy1BSyxv/2eI74+N0s6SkI0cVQeJ8OOUvT5si/lSalimjZb1Mdv3i/X
	TDX5uAzPppzuMyc5AypdU4hiZAK/XqgaHWLe80/W2/8yy68SvN4gjvICPlEYH2ynC5Fchvk/
	Y4UWRwkVDT7gtwqucIiLMs2vEILO0yjKCn6D8DJ4nftv6XLB1vA7jg4LfH6McMN283/bYuFG
	jZcuRnMr0JxapNTqstPV2rT1cZpcnTYn7sChdDuKNKs6b3qPC73tTpEQL0OqWEUGnadRMurs
	zNx0CQkyrFqgIO1HNUpFqjr3qKg/tE+flSZmSmipjFYtUqwNHElV8gfVh8WvRTFD1L9PKVnM
	EgNKXN67ccLwcWBmkWt2emRvfrnDsjfZOW/OrjflLZZPvmoeS3k0ok/qNHV6ZvqPNzWycmne
	w92u5O+My4bLejsWOxOokmRH4/YyJqvO/cWuoh1XinfO3z666vynO157PjPsj72gjMPWyaqV
	r851+T/czP3S5UvSbeuTCuriPoo5NhSYq6IzNerE1Vifqf4H/jYm1FUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAAzWSe0hTcRzF+913w8FlSd2MjEZSRGbR69uDHvSHP4Kixx9BBbnq1sbUZFtT
	A0ndKrJcT0NNaeJzTprMcquW1mZpb91KVpraouhh9tCkq9XaiP77HA6cc/44HKm4TMdxmnSD
	qEtXpSoZGSXbtNKUeLQyR72gr3oOlDkaGOgarqDB/jMLagfcNPhtAtzs/ElAWX0zghGphwXn
	iV4ShtvaGaisGCVBaiykoOypmYIfjjES3t4LsdDh/U2B3bkR+mveUeA57iLB9yMBQqc7GCg0
	j5NQ0neUgfDLcRpuSUMs5LvrCPCV34/IT9dY6Gy20HBhrJoEV+5ApPBNNw2BG2UMBExdCPoa
	wjS880ZaB+t6WbDYSxF4W20M5JsXweC1ERa+FrWR0G9ZC3+KjXDPOhlGHw4i6Kl+TkDY42bh
	Sd8VGtocLgKevZZIGD1VzkDB59MInpfcIOBReSMNVQ+fEZEd26A7/IuA834rA2/M/Qj8vhAF
	l/IsCBwtQRq+eczU2vXYN/iFxO5XVQhftb0g8PszfwgcbHlA4Oulr1hsdR7CTXVzcaXnA4EL
	gn4SO+tPMNj5/RyLe7s9DO4oHqdwU9UR/L6pBG2O3yFbtU9M1RhFXdLqFJl6rLmXzWhZntV5
	0sTmopLEAjSRE/jFwkXbfTrKDD9bCAYlMsqx/EJhONROFSAZR/KPY4RbTcVE1JjErxPc4XE2
	yhSfIEiuYyjKcn6JMCRdZ/+FzhDsjbfJM4izogn1KFaTbkxTaVKXzNdr1dnpmqz5ew+mOVHk
	NjU5v8660Ugg2Yt4Dilj5BlUjlpBq4z67DQvEjhSGSvH7YfVCvk+VfZhUXdwt+5Qqqj3omkc
	pZwi37BdTFHwB1QGUSuKGaLuv0twE+NyUcXdXY9nDRmC1EtlZkqAdUjihKUfdmoL7x5wKeJD
	cZqpeIuta3elI+nsaG2pPSnxqad0Ums42fugbY0jRbNV2p8HA/FHrOE7N9O08/JbJsfUZvc7
	Z4YCyaZlrUv9088Nr9qT99mwYoXBkmksuvNdW9XlnvMxK+9rw8mYuNc+0yklpVerFs4ldXrV
	XyhXj/QyAwAA
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_191853_076687_0B682D4D 
X-CRM114-Status: GOOD (  19.09  )
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

Hi all,

The MM subsystem is trying to reduce struct page to a single pointer.
See the following link for your information:

   https://kernelnewbies.org/MatthewWilcox/Memdescs/Path

The first step towards that is splitting struct page by its individual
users, as has already been done with folio and slab.  This patchset does
that for page pool.

Matthew Wilcox tried and stopped the same work, you can see in:

   https://lore.kernel.org/linux-mm/20230111042214.907030-1-willy@infradead.org/

I focused on removing the page pool members in struct page this time,
not moving the allocation code of page pool from net to mm.  It can be
done later if needed.

The final patch that removes the page pool fields will be posted once
all the conversions are completed.

	Byungchul
---
Changes from v11:
	1. Rebase on net-next/main as of Jul 21.
	2. Change page_pool_page_is_pp() to check for const type of
	   page.  For now that it's called along with every
	   pp_page_to_nmdesc() call as Pavel suggested,
	   page_pool_page_is_pp() should also cover const type of page.

Changes from v10:
	1. Introduce __netmem_to_nmdesc() and use it in
	   __netmem_get_pp(). (feedbacked by Mina)
	2. Fix a bug that fails on casting 'const page -> const
	   netmem_desc', by using macros and _Generic. (feedbacked by
	   test robot)
	3. Add comment on pp_page_to_nmdesc() to ask for more attention
	   before using the helper. (feedbacked by Mina)

Changes from v9:
	1. Remove the patch 'page_pool: access ->pp_magic through
	   netmem_desc in page_pool_page_is_pp()' and decide to wait for
	   Pavel's work of PageNetpp() to identify page type for page
	   pool, that doesn't need to access ->pp_magic.
	2. Rename page_to_nmdesc() to pp_page_to_nmdesc() and add
	   DEBUG_NET_WARN_ON_ONCE(!page_pool_page_is_pp(page)) in it,
	   just in case. (feedbacked by Pavel)
	3. Apply just simple casting from page to netmem_desc for
	   accessing ->pp and ->pp_ref_count, instead of full converting
	   page to netmem_ref for network drivers e.g. mlx4, netdevsim,
	   and mt76.
	4. Expand the support for drivers to access ->pp and
	   ->pp_ref_count to fec, octeontx2-pf, iavf, idpf, mlx5, ti,
	   and xdp.
	5. Squash each helper with its first user. (feedbacked by Mina)

Changes from v8:
	1. Rebase on net-next/main as of Jul 10.
	2. Exclude non-controversial patches that have already been
	   merged to net-next.
	3. Re-add the patches that focus on removing accessing the page
	   pool fields in struct page.
	4. Add utility APIs e.g. casting, to use struct netmem_desc as
	   descriptor, to support __netmem_get_pp() that has started to
	   be used again e.g. by libeth.

Changes from v7 (no actual updates):
	1. Exclude "netmem: introduce struct netmem_desc mirroring
	   struct page" that might be controversial.
	2. Exclude "netmem: introduce a netmem API,
	   virt_to_head_netmem()" since there are no users.

Changes from v6 (no actual updates):
	1. Rebase on net-next/main as of Jun 25.
	2. Supplement a comment describing struct net_iov.
	3. Exclude a controversial patch, "page_pool: access ->pp_magic
	   through struct netmem_desc in page_pool_page_is_pp()".
	4. Exclude "netmem: remove __netmem_get_pp()" since the API
	   started to be used again by libeth.

Changes from v5 (no actual updates):
	1. Rebase on net-next/main as of Jun 20.
	2. Add given 'Reviewed-by's and 'Acked-by's, thanks to all.
	3. Add missing cc's.

Changes from v4:
	1. Add given 'Reviewed-by's, thanks to all.
	2. Exclude potentially controversial patches.

Changes from v3:
	1. Relocates ->owner and ->type of net_iov out of netmem_desc
	   and make them be net_iov specific.
	2. Remove __force when casting struct page to struct netmem_desc.

Changes from v2:
	1. Introduce a netmem API, virt_to_head_netmem(), and use it
	   when it's needed.
	2. Introduce struct netmem_desc as a new struct and union'ed
	   with the existing fields in struct net_iov.
	3. Make page_pool_page_is_pp() access ->pp_magic through struct
	   netmem_desc instead of struct page.
	4. Move netmem alloc APIs from include/net/netmem.h to
	   net/core/netmem_priv.h.
	5. Apply trivial feedbacks, thanks to Mina, Pavel, and Toke.
	6. Add given 'Reviewed-by's, thanks to Mina.

Changes from v1:
	1. Rebase on net-next's main as of May 26.
	2. Check checkpatch.pl, feedbacked by SJ Park.
	3. Add converting of page to netmem in mt76.
	4. Revert 'mlx5: use netmem descriptor and APIs for page pool'
	   since it's on-going by Tariq Toukan.  I will wait for his
	   work to be done.
	5. Revert 'page_pool: use netmem APIs to access page->pp_magic
	   in page_pool_page_is_pp()' since we need more discussion.
	6. Revert 'mm, netmem: remove the page pool members in struct
	   page' since there are some prerequisite works to remove the
	   page pool fields from struct page.  I can submit this patch
	   separatedly later.
	7. Cancel relocating a page pool member in struct page.
	8. Modify static assert for offests and size of struct
	   netmem_desc.

Changes from rfc:
	1. Rebase on net-next's main branch.
	   https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/
	2. Fix a build error reported by kernel test robot.
	   https://lore.kernel.org/all/202505100932.uzAMBW1y-lkp@intel.com/
	3. Add given 'Reviewed-by's, thanks to Mina and Ilias.
	4. Do static_assert() on the size of struct netmem_desc instead
	   of placing place-holder in struct page, feedbacked by
	   Matthew.
	5. Do struct_group_tagged(netmem_desc) on struct net_iov instead
	   of wholly renaming it to strcut netmem_desc, feedbacked by
	   Mina and Pavel.

Byungchul Park (12):
  netmem: introduce struct netmem_desc mirroring struct page
  netmem: use netmem_desc instead of page to access ->pp in
    __netmem_get_pp()
  netmem, mlx4: access ->pp_ref_count through netmem_desc instead of
    page
  netdevsim: access ->pp through netmem_desc instead of page
  mt76: access ->pp through netmem_desc instead of page
  net: fec: access ->pp through netmem_desc instead of page
  octeontx2-pf: access ->pp through netmem_desc instead of page
  iavf: access ->pp through netmem_desc instead of page
  idpf: access ->pp through netmem_desc instead of page
  mlx5: access ->pp through netmem_desc instead of page
  net: ti: icssg-prueth: access ->pp through netmem_desc instead of page
  libeth: xdp: access ->pp through netmem_desc instead of page

 drivers/net/ethernet/freescale/fec_main.c     |  10 +-
 drivers/net/ethernet/intel/iavf/iavf_txrx.c   |   2 +-
 drivers/net/ethernet/intel/idpf/idpf_txrx.c   |   8 +-
 .../marvell/octeontx2/nic/otx2_txrx.c         |   2 +-
 drivers/net/ethernet/mellanox/mlx4/en_rx.c    |   4 +-
 .../net/ethernet/mellanox/mlx5/core/en/xdp.c  |   3 +-
 .../net/ethernet/ti/icssg/icssg_prueth_sr1.c  |   4 +-
 drivers/net/netdevsim/netdev.c                |   6 +-
 drivers/net/wireless/mediatek/mt76/mt76.h     |   3 +-
 include/linux/mm.h                            |   4 +-
 include/net/libeth/xdp.h                      |   2 +-
 include/net/netmem.h                          | 153 +++++++++++++++---
 12 files changed, 161 insertions(+), 40 deletions(-)


base-commit: 4701ee5044fb3992f1c910630a9673c2dc600ce5
-- 
2.17.1


