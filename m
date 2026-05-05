Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7CBCD3427
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 14:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfM4NvdvryCmOJVCLqFWvSmVDCVw+NV/K5dXudnJRKY=; b=UPW41MKyUq9pPg/FLI4vpcMRKw
	Rq+RgXDfe5CH9KXFH3vy2Mo1LHLHbRmGKe1ps0QZaV9LvrECiXH1Sz2wDBOthB1cb/7bTl8ke/FAf
	bOquU5SOKt5+Yf7uGnniEyaMa/OVsjg1R/lvpiweSeZDPhnK568K9MeOxnDW8fK0bRdHJfDOx2CvO
	8YGK9dB7MlkbFQZLlIXH7ebamPTSFxzHudMNR95kv0GC7cB2ycSsdo79z9qwd+ya554pPNw8Pc4Xf
	osAd2pMe8mXqp+j/3FpaOuOPpk+zTMDE/Z8gVYwme3u3bVY8/s95Lxfr6H2Bh+8ZtyT2FgI+rY8wv
	7rh1iIqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGaE-0000000GTpV-0zHu;
	Tue, 05 May 2026 14:17:10 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGa9-0000000GTlJ-0Uhr;
	Tue, 05 May 2026 14:17:08 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wKGa3-000000008T3-1K8F;
	Tue, 05 May 2026 14:16:59 +0000
Date: Tue, 5 May 2026 15:16:56 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: "Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Edward Parker <edward@topnotchit.com>, Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net 5/5] net: dsa: mt7530: untag VLAN-aware bridge PVID
Message-ID: <79d4032a475ad94569669a330bc1a731b85db962.1777986341.git.daniel@makrotopia.org>
References: <cover.1777986341.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1777986341.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_071705_166306_A2892EBF 
X-CRM114-Status: GOOD (  13.07  )
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

From: Edward Parker <edward@topnotchit.com>

With bridge VLAN filtering enabled on a port configured as untagged
member of the bridge PVID, ingress untagged frames do not reach the
corresponding bridge VLAN upper interface (br-lan.<vid>). ARP and
similar traffic is visible on the physical port but not delivered
to the VLAN sub-interface.

The MT7530/MT7531 forwards frames to the CPU port with the user
port's PVID tag applied even when the frame ingressed untagged on
the wire, because the CPU port is set to MT7530_VLAN_EG_CONSISTENT
and is a tagged member of the VLAN entry created for the bridge
VLAN. The DSA core then sees a hwaccel-tagged frame whose VID
matches the port's PVID, which the bridge does not treat as the
untagged-on-the-wire frame that the user expects.

Set ds->untag_vlan_aware_bridge_pvid in the mt7530 and mt7531
setup paths so the DSA core strips that hwaccel tag in software
when the parsed VID matches the bridge port's PVID, restoring the
on-the-wire frame as the bridge expects to see it.

Link: https://github.com/openwrt/openwrt/issues/18576
Fixes: 83163f7dca56 ("net: dsa: mediatek: add VLAN support for MT7530")
Signed-off-by: Edward Parker <edward@topnotchit.com>
[daniel@makrotopia.org: improve commit message]
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/dsa/mt7530.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 2e5337186800..4b7e5398b211 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2452,6 +2452,7 @@ mt7530_setup(struct dsa_switch *ds)
 	}
 
 	ds->assisted_learning_on_cpu_port = true;
+	ds->untag_vlan_aware_bridge_pvid = true;
 	ds->mtu_enforcement_ingress = true;
 
 	if (priv->id == ID_MT7530) {
@@ -2641,6 +2642,7 @@ mt7531_setup_common(struct dsa_switch *ds)
 	int ret, i;
 
 	ds->assisted_learning_on_cpu_port = true;
+	ds->untag_vlan_aware_bridge_pvid = true;
 	ds->mtu_enforcement_ingress = true;
 
 	mt753x_trap_frames(priv);
-- 
2.54.0

