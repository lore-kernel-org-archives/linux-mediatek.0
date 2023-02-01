Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCEEC38142
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 18:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s4K1xGJV0XdXmmrYpx1babEqIgkFPBu2QhDaQJVAc4E=; b=WLOoJo6Tcph/Ajq9QmEeZxnXX5
	jmHA+KvC94LRtnKzBnp7E0TjhOsjDrBMKz+U2HP9J0UlEVFZUTVB13Tdc9n3obQj2UVkKEiyO/Yl7
	P3Br6ZAQsmiSlcjSTphgTslvd1p/940lAqRDRwCVte/NT35e6psL5x8Dz8LAFSdIn20Lel5p8ftfH
	7brr827p5jL10WNeyYaOtoEIVqgK7oLzpJBTeRF10HAnmR9o2nR6Qw3H8huMVEhmAHGDfdOgvj+Tz
	FzBha5ssPIW3iZ6wKZAoHgu8tTXaCCpymbS1JIDFEOZOIaXN3o8xqIwZxQN9Bkczo3xvKBd+VBMYm
	R3ikHhlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHmf-00DBSm-I2; Wed, 01 Feb 2023 18:24:37 +0000
Received: from dilbert.mork.no ([2a01:4f9:c010:a439::d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHma-00DBNb-E9; Wed, 01 Feb 2023 18:24:35 +0000
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:c9a:3200:0:0:0:1])
	(authenticated bits=0)
	by dilbert.mork.no (8.15.2/8.15.2) with ESMTPSA id 311INgS6648784
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 1 Feb 2023 18:23:43 GMT
Received: from canardo.dyn.mork.no (ip6-localhost [IPv6:0:0:0:0:0:0:0:1])
	by canardo.dyn.mork.no (8.15.2/8.15.2) with ESMTPS id 311INaIB943472
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 1 Feb 2023 19:23:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1675275817; bh=s4K1xGJV0XdXmmrYpx1babEqIgkFPBu2QhDaQJVAc4E=;
	h=From:To:Cc:Subject:Date:Message-Id:From;
	b=eemcd2kptDBwwV+pbimZXLHvrb6Db8x/V9Nt8fbE3l5K6cyAf67lDGWPd4DhE6Qa+
	 VeGu1jN9ha95BShzRpPpDlahMJMGaEQ3++u94WdrRv4BPUaohu5XSd2lqcdGXNbfFW
	 a3l4s1oP16WV6f7Z//teQsSgefCExtZL/+XRxN+g=
Received: (from bjorn@localhost)
	by canardo.dyn.mork.no (8.15.2/8.15.2/Submit) id 311INWCl943459;
	Wed, 1 Feb 2023 19:23:32 +0100
From: =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
To: netdev@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Lee <Mark-MC.Lee@mediatek.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Daniel Golle <daniel@makrotopia.org>,
        Alexander Couzens <lynxis@fe80.eu>,
        Simon Horman <simon.horman@corigine.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
Subject: [PATCH v5 net 0/3] fixes for mtk_eth_soc
Date: Wed,  1 Feb 2023 19:23:28 +0100
Message-Id: <20230201182331.943411-1-bjorn@mork.no>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.7 at canardo
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_102433_111534_3E00B55C 
X-CRM114-Status: GOOD (  10.52  )
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

Changes since v4:
 - use same field order for kernel-doc and code in patch 1
 - cc'ing full maintainer list from get_maintainer.pl

Changes since v3:
 - fill hole in struct mtk_pcs with new interface field
 - improved patch 2 commit message
 - added fixes tags
 - updated review tags
 
Changes since v2:
 - use "true" for boolean
 - fix SoB typo
 - updated tags

Changes since v1:
 - only power down on changes, fix from Russel
 - dropped bogus uncondional in-band patch
 - added pcs poll patch from Alexander
 - updated tags


Fix mtk_eth_soc sgmii configuration.

This has been tested on a MT7986 with a Maxlinear GPY211C phy
permanently attached to the second SoC mac.


Alexander Couzens (2):
  net: mediatek: sgmii: ensure the SGMII PHY is powered down on
    configuration
  mtk_sgmii: enable PCS polling to allow SFP work

Bjørn Mork (1):
  net: mediatek: sgmii: fix duplex configuration

 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  4 +-
 drivers/net/ethernet/mediatek/mtk_sgmii.c   | 46 ++++++++++++++-------
 2 files changed, 35 insertions(+), 15 deletions(-)

-- 
2.30.2


