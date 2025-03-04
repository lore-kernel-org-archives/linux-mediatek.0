Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A704C282D0
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Mar 2025 08:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j4zOdy9bjTHPpFJ6qM2pfBrUcgPJN8LEW/a8X8YXn8o=; b=NsAhJASIo0ynP8bIChcpJv7jg5
	vySOmd++7cHbi0cIb47wG1SQKiNCMrzL8niWGL0R398fMuIRrDtbWZVRpxNYCD7QqZjb2AEbtFcTd
	wpcywmapheW1///E1wGBZbPVOW3uO88l+UgGs1jFaCmjHUHcKyfl+g6Sk75qeCbDul5XfO7z2UwPk
	3xzwdbfgQOpLVqQMIzEQNRoyaUuEo2K6M0+0myRRVaJcKq8pq1mfeX1x0C5qhE89lIfzMuGQnskOO
	g2OuJXQ0LrazlEQw5fHeSoss++fMKSDyI84IOpAkI4q5Oxtfrxiqw13OxJ70UdLG8vf81hlVu0ecA
	u7pd6rxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpO0s-00000003iLz-0sJE;
	Tue, 04 Mar 2025 08:52:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNzG-00000003iBL-3p8U;
	Tue, 04 Mar 2025 08:50:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 76E855C352B;
	Tue,  4 Mar 2025 08:48:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78631C4CEE5;
	Tue,  4 Mar 2025 08:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741078247;
	bh=kkHSMzZ1ZcS1cudL1bP14kHyWFdsefXdMRo3MFkzg1U=;
	h=From:Date:Subject:To:Cc:From;
	b=lNeax/tl/orxOms3UbNSo41u7p1ypGGS4KOLfO7ul8s8r11P7fDCSD3SgLx7NOTtd
	 6IBHKVVRlGC6MV/19/6Qa0Qf6qXVGIfBq8f18qEEDO3uhqhwebkCEvdVXLS1EUryJp
	 vuZh/1V0qjRin55p2NxW9iS4GJyZLApNGFJFZU/h59J1WH/U9O93RO6ivh+8AmhVSj
	 NiGUw6o+vlqJ0Nj8CfWH7bfRIPJ64gGtWSyg6ydG8ucvzQqHoZxApaitCBm/t+8z+k
	 5/5TbDF/eXkYyNd48AVQutDqGQCJeipVL/rTE5hMMpXHTzH9nax0i4F3dd+3VW+4ke
	 hgE3UaHjq60GQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 04 Mar 2025 09:50:23 +0100
Subject: [PATCH net] net: dsa: mt7530: Fix traffic flooding for MMIO
 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250304-mt7988-flooding-fix-v1-1-905523ae83e9@kernel.org>
X-B4-Tracking: v=1; b=H4sIAM6+xmcC/x2MSQqAMAwAvyI5G4hbXb4iHqRNNaCttCKC+HeLx
 xmYeSByEI4wZA8EviSKdwmKPAO9zm5hFJMYSiobqqjG/Wz7rkO7eW/ELWjlRm0sa6VmUjVBKo/
 ASf/XcXrfD/KhVsRlAAAA
X-Change-ID: 20250304-mt7988-flooding-fix-cdfec66a0640
To: "Chester A. Unal" <chester.a.unal@arinc9.com>, 
 Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_005050_994175_7090A0E1 
X-CRM114-Status: GOOD (  11.27  )
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

On MMIO devices (e.g. MT7988 or EN7581) unicast traffic received on lanX
port is flooded on all other user ports if the DSA switch is configured
without VLAN support since PORT_MATRIX in PCR regs contains all user
ports. Similar to MDIO devices (e.g. MT7530 and MT7531) fix the issue
defining default VLAN-ID 0 for MT7530 MMIO devices.

Fixes: 110c18bfed414 ("net: dsa: mt7530: introduce driver for MT7988 built-in switch")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/dsa/mt7530.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 1c83af805209cae40c56138fa8f72261e396f58c..5883eb93efb11423bec260a11ff8b60cfff1fd2c 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2591,7 +2591,8 @@ mt7531_setup_common(struct dsa_switch *ds)
 	if (ret < 0)
 		return ret;
 
-	return 0;
+	/* Setup VLAN ID 0 for VLAN-unaware bridges */
+	return mt7530_setup_vlan0(priv);
 }
 
 static int
@@ -2687,11 +2688,6 @@ mt7531_setup(struct dsa_switch *ds)
 	if (ret)
 		return ret;
 
-	/* Setup VLAN ID 0 for VLAN-unaware bridges */
-	ret = mt7530_setup_vlan0(priv);
-	if (ret)
-		return ret;
-
 	ds->assisted_learning_on_cpu_port = true;
 	ds->mtu_enforcement_ingress = true;
 

---
base-commit: 64e6a754d33d31aa844b3ee66fb93ac84ca1565e
change-id: 20250304-mt7988-flooding-fix-cdfec66a0640

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


