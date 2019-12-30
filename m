Return-Path: <SRS0=GpGz=2U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF85C2D0C2
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 14:38:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F10A920663
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Dec 2019 14:38:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rFx432yj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=dlink.ru header.i=@dlink.ru header.b="o1PvHtIv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F10A920663
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dlink.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QtC0qJCs25cDMnbWoSIRRNmdhDj0U12fKoHQSACi0y8=; b=rFx432yjOeXRAL
	cBLHYCBqUA68xUuz6fpRU6/hI5akssmM6VJ1M0yTTINd+ToVi0womvDDSizupYO/CR5DIhTNw4xt2
	ZrflH/FHlUXHaJX781/k/2WOqkmYbmPya1SVx/Hp/VLTf78HMT7CJixyM6BxKBxGWOoZK4kRlOas6
	TvQNSNbCqueg5GEHvNvEDCBfjNeDTXUlJlVZhjVNGdupQB4YfLPmky4igZGbNZHuR2869xSHRFmPX
	Qk/BF/WNwEAPGK0eA6oH2xfPuWWxLxEqACZ1IoiXfU/STrFz4WDzJh0z0VwkQRUAe7FaKJdaYJU00
	DlUyIJEJ9pwk3S8Z9cCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilwBQ-0001ix-MY; Mon, 30 Dec 2019 14:38:12 +0000
Received: from fd.dlink.ru ([178.170.168.18])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilwAk-0000xS-4X; Mon, 30 Dec 2019 14:37:33 +0000
Received: by fd.dlink.ru (Postfix, from userid 5000)
 id B981F1B201FA; Mon, 30 Dec 2019 17:31:16 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru B981F1B201FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dlink.ru; s=mail;
 t=1577716277; bh=RwOI8oAxd+fijp+Xuc6Oa+5EbKzjW8W4KCZUcnbzQOs=;
 h=From:To:Cc:Subject:Date;
 b=o1PvHtIvToJL7zKhu8jpjdoeiOaz87nSFOdQtyEXLajOapuuo7RLoHiwKzn46tHm0
 Nl0paQ7EifqSHDnuCh9Ai+IK6J1msf833KXg/KQOLaz49bNs9JRD7za5TZD9K/6mL4
 zYFhTQbBXEbWXLw9vLUyzoA0PuKuAM3OAIns7n3g=
Received: from mail.rzn.dlink.ru (mail.rzn.dlink.ru [178.170.168.13])
 by fd.dlink.ru (Postfix) with ESMTP id C75FB1B205E4;
 Mon, 30 Dec 2019 17:31:03 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 fd.dlink.ru C75FB1B205E4
Received: from mail.rzn.dlink.ru (localhost [127.0.0.1])
 by mail.rzn.dlink.ru (Postfix) with ESMTP id CA84D1B229CB;
 Mon, 30 Dec 2019 17:31:01 +0300 (MSK)
Received: from localhost.localdomain (unknown [196.196.203.126])
 by mail.rzn.dlink.ru (Postfix) with ESMTPA;
 Mon, 30 Dec 2019 17:31:01 +0300 (MSK)
From: Alexander Lobakin <alobakin@dlink.ru>
To: "David S. Miller" <davem@davemloft.net>
Subject: [PATCH RFC net-next 00/20] net: dsa: add GRO support
Date: Mon, 30 Dec 2019 17:30:08 +0300
Message-Id: <20191230143028.27313-1-alobakin@dlink.ru>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191230_063730_546633_EE1872C3 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Song Liu <songliubraving@fb.com>,
 Jakub Kicinski <jakub.kicinski@netronome.com>,
 Alexander Lobakin <alobakin@dlink.ru>,
 Yoshiki Komachi <komachi.yoshiki@gmail.com>, linux-kernel@vger.kernel.org,
 Eric Dumazet <edumazet@google.com>, Stanislav Fomichev <sdf@google.com>,
 Matteo Croce <mcroce@redhat.com>, Edward Cree <ecree@solarflare.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Jakub Sitnicki <jakub@cloudflare.com>,
 Daniel Borkmann <daniel@iogearbox.net>, Paolo Abeni <pabeni@redhat.com>,
 Vivien Didelot <vivien.didelot@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>,
 Sean Wang <sean.wang@mediatek.com>, Jiri Pirko <jiri@mellanox.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Paul Blakey <paulb@mellanox.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Taehee Yoo <ap420073@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

As of now, napi_gro_receive() in cases where the corresponding
device is installed as CPU port of DSA-driven switch is in fact
an overheaded version of netif_receive_skb{,_list}() with no
advantages over:

- dev_gro_receive() can't find packet_offload for ETH_P_XDSA type;
- so it immediately returns GRO_NORMAL;
- napi_skb_finish() passes skb to gro_normal_one() -> netstack.

This series adds a basic infrastructure to allow DSA taggers to
implement GRO callbacks and adds GRO support for 5 tagger drivers:
* tag_ar9331
* tag_gswip
* tag_lan9303
* tag_mtk
* tag_qca

I didn't make it for the rest because they are in fact way more
complicated (e.g. combined DSA + 802.1q tag etc.) and require
more familiarity with them and tests on the real hardware, which
is inaccesible for me at the moment.

This series also includes a bunch of random fixes in several tagger
drivers and some cleanup. I left them all in one place as they depend
on each other, but there's no problem for me to split this into
different series.

I mark this as RFC, and there are the key questions for maintainers,
developers, users etc.:
- Do we need GRO support for DSA at all?
- Which tagger protocols really need it and which don't?
- Are the actual changes correct in every single tagger code?
- Does this series bring any performance improvements on the
  affected systems?
- Would anybody mind if we'd add DSA support to napi_gro_frags()?
- Any code/other comments/notes.

I also would like to see more taggers with GRO callbacks, such as
DSA and EDSA, and the results of their addition.

Alexander Lobakin (20):
  net: dsa: make .flow_dissect() callback returning void
  net: dsa: add GRO support infrastructure
  net: dsa: tag_ar9331: add .flow_dissect() callback
  net: dsa: tag_ar9331: split out common tag accessors
  net: dsa: tag_ar9331: add GRO callbacks
  net: dsa: tag_gswip: fix typo in tag name
  net: dsa: tag_gswip: switch to bitfield helpers
  net: dsa: tag_gswip: add .flow_dissect() callback
  net: dsa: tag_gswip: split out common tag accessors
  net: dsa: tag_gswip: add GRO callbacks
  net: dsa: tag_lan9303: add .flow_dissect() callback
  net: dsa: tag_lan9303: split out common tag accessors
  net: dsa: tag_lan9303: add GRO callbacks
  net: dsa: tag_mtk: split out common tag accessors
  net: dsa: tag_mtk: add GRO callbacks
  net: dsa: tag_qca: fix doubled Tx statistics
  net: dsa: tag_qca: switch to bitfield helpers
  net: dsa: tag_qca: split out common tag accessors
  net: dsa: tag_qca: add GRO callbacks
  net: core: add (unlikely) DSA support in napi_gro_frags()

 include/net/dsa.h         |  10 ++-
 net/core/dev.c            |  11 ++-
 net/core/flow_dissector.c |   8 +-
 net/dsa/dsa.c             |  43 +++++++++-
 net/dsa/dsa2.c            |   1 +
 net/dsa/tag_ar9331.c      | 139 ++++++++++++++++++++++++++-----
 net/dsa/tag_dsa.c         |   5 +-
 net/dsa/tag_edsa.c        |   5 +-
 net/dsa/tag_gswip.c       | 126 +++++++++++++++++++++++-----
 net/dsa/tag_lan9303.c     | 139 ++++++++++++++++++++++++++-----
 net/dsa/tag_mtk.c         | 115 +++++++++++++++++++++-----
 net/dsa/tag_qca.c         | 167 ++++++++++++++++++++++++++++----------
 12 files changed, 629 insertions(+), 140 deletions(-)

-- 
2.24.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
