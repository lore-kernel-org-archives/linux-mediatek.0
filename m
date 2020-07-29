Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FEE3C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 08:21:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E265206D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 08:21:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VHJVdS32";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="VggsJ4aJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E265206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CvM15J+ej0yBohplSr9D1EqLO3Gk0natd1zh/t0Gw6k=; b=VHJVdS32/WtjKRJYxO2JUQS80o
	/WpkoLMuhidsWe+zw/p4DDhYk29XSHp37Nbx7Xg9BsfC9VtlzxZDU7whJz60bDSdkTIFB1Gir0fVD
	o9aEkxo7eukd2w0704v3xRAbgk7yA+SJUDt23M02wFQkKHL2qRVdjQA/wStu6vzVIX3WtUmHzeYx4
	qd3uab5wl3T20PJpqyKHfboUuqciIfjXX03AQAyOvLQzCrvBowNMh9MrPmvVGUF4i6rARrr1+SgSN
	cAaVo07heKD2ZSRCRfoswC08jd28kD6yiVbiWyPFhS4Sywh9TUFjRZ75qye3tMIiLDqnhRHOT6soA
	lk9gk77A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0hKs-0003tq-8w; Wed, 29 Jul 2020 08:21:14 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0hKo-0003si-3T; Wed, 29 Jul 2020 08:21:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596010865;
 bh=SEqiVovF7XeGtohoS2GMeFwDMUmZ9pW/KT58etbzx3I=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=VggsJ4aJmjp24Yu0Xb3AfEW51PKzv+bgdZ5BvGf51Ce+7uVVAy64Kv2gAj80iRoqo
 AuqDpyktGnbSSY9hRF3YqEMRqhDTdLtKvBaIHoIbtREIiqDijw0KWT8++2RgPjbAUq
 hlM2PCZ7hN5br7klD1+h2E+4W1JPcKeAPjTtpsNU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([185.75.74.240]) by mail.gmx.com
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M9Fnj-1k6SfS2l1j-006QTq; Wed, 29 Jul 2020 10:15:25 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v4] net: ethernet: mtk_eth_soc: fix MTU warnings
Date: Wed, 29 Jul 2020 10:15:17 +0200
Message-Id: <20200729081517.4026-1-frank-w@public-files.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:SIqtPyJoGFptjlcPcxyQb71WF05R8NP7BOYsxZfVn4TevUka2hv
 16bkgQRk2SbtWS26redKg5T9xwqZyS6LYPZc4nlqNtdOfjc06O3Jrl08QXrr6YDL/rstb1f
 l0xWrYmKz/JACy8a9r7NVqZ4c8VThH2ylroN+QjDMqc0cPtmCd+236ZK1kPKzt1RGF4+1GM
 8VtrTh/CFp4NgsEdY2c9Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ELzh3LitQPU=:NfQc7TPjb/zfwSIzuKPA66
 G+J6cEu6gV2kyF1Adwn2umK209/s4ae4AnEd+3RfSTX/+SutzRmAYok4E6/IWn1C1qawbWyIT
 lg/GolcKvXQK8GJ6PPAatsMOfPWdnbw/wXiqR44HxNeRhrMbkXFNdrW2+evc3tWQOKfKg89ot
 UVWGcpX13rFg2lOOtmGac/FMZpZANC1VHHw0c4EtqQe741ql5Bq5OiB8w4GnRPQrA7hwb6vFk
 l+G2u0Bbd+u4YrVSVqt5fP3493zHi2omHkmM3tc013dkAcToryyFBeEmeZ8BT4aggw6YJ+011
 fVMk+RA0FrJMTA5lJajJpUdgKWdvPHq92XsWq3Tkf320I54BGI8R6oqIV4fCji80HrT2gWMrK
 Lb7qRQLvjAHOnlaxRDxcffP45+IeRtYPV+QHfa/jMQgUXhzhsTz1bjTJOtnV+V2/wgoFK14Q8
 PY6sd7bFpKuWeEj6zbM+J78FDruuF05owRikRXD3tseqmwBl2Ff0bG05WnOvITpR6ZPdlNDa/
 1j6R4PIaCW4Km22eJG0r+rnFOQis9xUE+lCpNeYRW5wTBqEoyt/X0pKdOmi3p6/syUK74Lewd
 M/WCc4jUtcCefYmh0ZrkSHmL9We4/59X+p4VO8IDv6zqg1dWbi0xvUnAyLMGSkJ6ndRPp8+ol
 WcjF3eqLTmmgclqRZFKZUWGWOKGUsqGDt4drvCSFoU9Wmtyiqf/PqTyF59RbMm02l/hANLCe3
 Hc2HeAUbBLBaEgfeANOvxX4CqXfokpEKImxCJY3t45hT/Y8hpnHSH7Ap/jfL96tW7TtnRO8K4
 7dMHY7sqbdv9HsRZXealdZnhMnChPOwdwfNR4LXePSAs534DREPcl5VAjRsYjsbVsfhcUrR7Y
 vkfrV4Vv7UQ8IrFAt6hm7/XX8/j4LEvjOrAy1aTYjnhD6brntMIXmgh/Kc/O1sd4UO+Uh8StK
 R99rzVa8bMpLwIH8RR8kRNO0ODiXEN4q0jJ4p69+PxRl1yXiEYkObhlEe8RvA3IkzDjmSzPtg
 d0rT0nq+6cpwWeO26AsuJBuv1UvF7X1PXik3maaHB/4JqA1ZB7N7Q9ZGRX/5QLHNizTIv4wEG
 p45HYpLv+hiQWedYsrzCQf+rORz4/OPE+cEQ2id/YJctgF0TAA6ObjloQjFtRujHTpDCeNwv+
 959RyXv+P+qG6EnW/ZWd95Psm3bJ8H30ob1Rk//VuCqswWN3SlpzU1ixQ80NQ9QO8iKTd0xaD
 NB4HZUHOnNq5sT6HVwlwrPodsVDBlmGqGcY5GHw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_042110_385457_BBF6E6F7 
X-CRM114-Status: GOOD (  11.58  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <landen.chao@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Mark Lee <Mark-MC.Lee@mediatek.com>, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Landen Chao <landen.chao@mediatek.com>

in recent kernel versions there are warnings about incorrect MTU size
like these:

eth0: mtu greater than device maximum
mtk_soc_eth 1b100000.ethernet eth0: error -22 setting MTU to include DSA overhead

Fixes: bfcb813203e6 ("net: dsa: configure the MTU for switch ports")
Fixes: 72579e14a1d3 ("net: dsa: don't fail to probe if we couldn't set the MTU")
Fixes: 7a4c53bee332 ("net: report invalid mtu value via netlink extack")
Signed-off-by: Landen Chao <landen.chao@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
v3->v4
  - fix commit-message (hyphernations,capitalisation) as suggested by Russell
  - add Signed-off-by Landen
  - dropped wrong signed-off from rene (because previous v1/2 was from him)
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 85735d32ecb0..a1c45b39a230 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2891,6 +2891,8 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
 	eth->netdev[id]->irq = eth->irq[0];
 	eth->netdev[id]->dev.of_node = np;

+	eth->netdev[id]->max_mtu = MTK_MAX_RX_LENGTH - MTK_RX_ETH_HLEN;
+
 	return 0;

 free_netdev:
--
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
