Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340D0C05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 18:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Glgu/yk2U5EWQt75/QlM/u6TaWcg4FLsGoFLNc2dM8Q=; b=ZZ40/vOZf0BKUlfJ2xbr4tUhn9
	e+/VT6OQruUkeIbkanwH8Ke1MV71ssf98O6F0KYHJLD98MBm7P1t0ZX9CdhniaSpW57c/32VBS5qn
	vDvmywWKNt1cP9UlNIkJGvuj6dK7ZNh0egVMTJxLaAlQx1GxNJq8n2+LLBS7w5XBDXXcYQtEKbUCf
	NpQaN+pUq7P/xXqNMADYoXpayMcBY7YiDdHjgR20Ftna36GaB1lUzR8HnCe4mc54tYGfcQF4qd9sZ
	d13P++JREpOW8aiePRNmipfnoLKBBD82i2gM6L3f/7B1T7BzJb6G2H1mu3OtVtcStu+MpH7EP8ndc
	aRDZqlDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHoL-00DCC4-Ih; Wed, 01 Feb 2023 18:26:21 +0000
Received: from dilbert.mork.no ([2a01:4f9:c010:a439::d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNHo5-00DC3F-TT; Wed, 01 Feb 2023 18:26:08 +0000
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:c9a:3200:0:0:0:1])
	(authenticated bits=0)
	by dilbert.mork.no (8.15.2/8.15.2) with ESMTPSA id 311INgu6648787
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 1 Feb 2023 18:23:44 GMT
Received: from canardo.dyn.mork.no (ip6-localhost [IPv6:0:0:0:0:0:0:0:1])
	by canardo.dyn.mork.no (8.15.2/8.15.2) with ESMTPS id 311INbfD943502
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Wed, 1 Feb 2023 19:23:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1675275817; bh=Glgu/yk2U5EWQt75/QlM/u6TaWcg4FLsGoFLNc2dM8Q=;
	h=From:To:Cc:Subject:Date:Message-Id:References:From;
	b=Sph/y2KGFxMJYIQWs6QVFiaaGAQ0wWLhhp7LicCpUJjrfeqIDd+XJzvb2qVKxJ9Mr
	 GoKVwYDVvwbsoYHHw9BL0JEaEW+RJgTIhs1MXveqrhAqMZCzV5y67pbnRjj9vZtam4
	 tOWyevD+aLFExf/dfkE03aa4AFfKGglM9hQe1V4M=
Received: (from bjorn@localhost)
	by canardo.dyn.mork.no (8.15.2/8.15.2/Submit) id 311INbas943501;
	Wed, 1 Feb 2023 19:23:37 +0100
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
        Russell King <rmk+kernel@armlinux.org.uk>,
        =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
Subject: [PATCH v5 net 3/3] mtk_sgmii: enable PCS polling to allow SFP work
Date: Wed,  1 Feb 2023 19:23:31 +0100
Message-Id: <20230201182331.943411-4-bjorn@mork.no>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230201182331.943411-1-bjorn@mork.no>
References: <20230201182331.943411-1-bjorn@mork.no>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.7 at canardo
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_102606_296376_60BC27B0 
X-CRM114-Status: UNSURE (   9.25  )
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

From: Alexander Couzens <lynxis@fe80.eu>

Currently there is no IRQ handling (even the SGMII supports it).
Enable polling to support SFP ports.

Fixes: 14a44ab0330d ("net: mtk_eth_soc: partially convert to phylink_pcs")
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Alexander Couzens <lynxis@fe80.eu>
[ bmork: changed "1" => "true" ]
Signed-off-by: Bjørn Mork <bjorn@mork.no>
---
 drivers/net/ethernet/mediatek/mtk_sgmii.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_sgmii.c b/drivers/net/ethernet/mediatek/mtk_sgmii.c
index c4261069b521..bb00de1003ac 100644
--- a/drivers/net/ethernet/mediatek/mtk_sgmii.c
+++ b/drivers/net/ethernet/mediatek/mtk_sgmii.c
@@ -187,6 +187,7 @@ int mtk_sgmii_init(struct mtk_sgmii *ss, struct device_node *r, u32 ana_rgc3)
 			return PTR_ERR(ss->pcs[i].regmap);
 
 		ss->pcs[i].pcs.ops = &mtk_pcs_ops;
+		ss->pcs[i].pcs.poll = true;
 		ss->pcs[i].interface = PHY_INTERFACE_MODE_NA;
 	}
 
-- 
2.30.2


