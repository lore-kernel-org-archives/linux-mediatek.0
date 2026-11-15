Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91D5D606A31F
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Nov 2026 23:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fs3HwwXv;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Q6vwdnwo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zW3WAwOIhD2940ok5Ysp8C9N1lcPwOPYgjTzBcC4E2g=; b=fs3HwwXvXwGxeF
	H9JW2bqnzLkTd0nyuIrsJzcKm7lINEQEzL4CNI3cNVmQhOL1L+wEMPEDxgf1BwX3ubF4xtvkoBkQi
	NkW/6NHZRnV3mSfh1k6TsnDFCW1a+ktUcKAwWSC/ez7O2Mi2uifogRWKdGlgNFVyrEDWM1Sjjgk2J
	1W5k7yAxOBeRS4bYKuwsgMnnoBMLVxO17hepu2/BORatAcQjdv5p2Buxw60wXbeJEIL6pAr9sIyId
	6IwsLn0nC45XBjPeDR9enfV/nUSSj64jYB/WjF89KbZNelI3doP5bKyjQ9tUjKJ+SK9kuojEI+jOb
	yvEKoCWxz1iiF1DApr+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSjVB-00000000i02-3NeV;
	Sun, 15 Nov 2026 23:19:13 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSjV8-00000000hzd-2mB8
	for linux-mediatek@lists.infradead.org;
	Sun, 15 Nov 2026 23:19:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=zW
	3WAwOIhD2940ok5Ysp8C9N1lcPwOPYgjTzBcC4E2g=; b=Q6vwdnwo0i1zIwDlDq
	J7RNLcxl6SWskDC+f7SHrE7lTMwe+p4kiCHYKJE9UYpK5ZciKG1F7b/XG42hNQm/
	V26ycwV0fVPg38ArFJn0M4ZCc62iEATVsFviYPxsAkskEhcCpHzjn5Pt4RpoIh0e
	Is0Hbleipvw/hxhDq1ZqcUgbk=
Received: from user-VMware-Virtual-Platform.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBn8YfgPfpqh0u8GA--.59459S2;
	Mon, 16 Nov 2026 07:18:57 +0800 (CST)
From: Ziheng Wei <zihengw03@163.com>
To: Zhao Li <enderaoelyther@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] wifi: mt76: mt7925: fix mt7925_reverse_frag0_hdr_trans() for MLO
Date: Mon, 16 Nov 2026 07:18:56 +0800
Message-ID: <20261115231856.965757-1-zihengw03@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261115192725.8230-1-enderaoelyther@gmail.com>
References: <20261115080239.910402-1-zihengw03@163.com> <20261115192725.8230-1-enderaoelyther@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgBn8YfgPfpqh0u8GA--.59459S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsBHqUUUUU
X-CM-SenderInfo: p2lkv0ljzqjqqrwthudrp/xtbC7QHgMWr6PeFs7gAA3z
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_151911_149015_59A46A18 
X-CRM114-Status: UNSURE (   6.17  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 03:27:25AM +0800, Zhao Li wrote:
> Not every entry is a station link. mt792x_init_wcid() reserves index 0
> for beacons and management frames and installs dev->mt76.global_wcid
> there, a bare struct mt76_wcid inside struct mt76_dev, immediately
> followed by the wcid[] table.

You're right, I missed that the unicast branch returns the entry unchecked.
Only station links set wcid->sta (mt7925_mac_link_sta_add() does, the
global wcid never does), so your check covers every entry. I'll send a
v2 with it and without the redundant !sta test.

Thanks for the review,
Ziheng


