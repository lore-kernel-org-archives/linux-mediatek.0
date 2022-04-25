Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D94AC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 21:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MvrYauXYMH75f2SKYC+88rdZD87DYozgF0ahkIIcXd4=; b=OHKw8oNB1bNLZ6
	yuVYD0q7kv+1ymYBYZ5tp/vUhAi2EpVKKuqUE63g92xtU2Yg1UvYcUwdCatYOlbmrPtOOAXLIFt7Y
	Ee3ehqW5WChCG5sl5JF7+yHsmv1Mr/vN1DPzE2gq4z/L4jW8Onaozwmk2AQKfZ/WMtYuxjYLfub97
	o+tqUtpIMXZLFBzjokMK1lhsXWY9rwVpaBJ4pV9KTrynQhZdTCWMIz43RDDYuF87FykNk70NMsIWu
	k8jQVdA+b6n7TggAzdlg8jIKSyx4ZAQVv5nROq0iKdbCbQIBHtHDL7BIDNnLEaqTnVV8EARpZMEl6
	8ce6vthMuFR8i0uEN5lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj6Hy-00BVtL-Ed; Mon, 25 Apr 2022 21:30:34 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj6Hn-00BUiu-20; Mon, 25 Apr 2022 21:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nSOwnD2KEk4N7ErnAP/pofJi+VXVrRz52uEAOjq0GqU=; b=AIiOpl2GYBirVe5GE1Xpv0V3TK
 L+HXC+yQSUA8dezg65TU/HbZTjJ2kYQYLEqB27BAe1xgkoqewnV++unfTdzlVW161u75fJtJ0xA46
 aSPKdqQt2qJ9j8+QtNjixms3xPCPfIvBKSK9RSR702gXBi1oWLNJfr6udXD/ppT7XDE37dpr1OfWR
 xhl0jEGK2hgJwbhFywiJX6IJpqZK3OS7Jp+NeXEam08vQJatNpCP/B+IIl6A2QExaeb+ZU2xQdLHI
 w1uLqzdAqJn9CYs84gS0vgz24KUxMRsBqqAlf2tt6wcevOaVhivZQyTGPZSepF6Zg9OBopz2RXJ+6
 ovr5IrWg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47190 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nj6FX-0007nz-1X; Mon, 25 Apr 2022 22:28:02 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nj6FW-007WZB-5Y; Mon, 25 Apr 2022 22:28:02 +0100
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH net-next] net: dsa: mt753x: fix pcs conversion regression
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nj6FW-007WZB-5Y@rmk-PC.armlinux.org.uk>
Date: Mon, 25 Apr 2022 22:28:02 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_143023_142329_259082E6 
X-CRM114-Status: GOOD (  15.55  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Daniel Golle reports that the conversion of mt753x to phylink PCS caused
an oops as below.

The problem is with the placement of the PCS initialisation, which
occurs after mt7531_setup() has been called. However, burited in this
function is a call to setup the CPU port, which requires the PCS
structure to be already setup.

Fix this by changing the initialisation order.

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000020
Mem abort info:
  ESR = 0x96000005
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x05: level 1 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000005
  CM = 0, WnR = 0
user pgtable: 4k pages, 39-bit VAs, pgdp=0000000046057000
[0000000000000020] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
Internal error: Oops: 96000005 [#1] SMP
Modules linked in:
CPU: 0 PID: 32 Comm: kworker/u4:1 Tainted: G S 5.18.0-rc3-next-20220422+ #0
Hardware name: Bananapi BPI-R64 (DT)
Workqueue: events_unbound deferred_probe_work_func
pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : mt7531_cpu_port_config+0xcc/0x1b0
lr : mt7531_cpu_port_config+0xc0/0x1b0
sp : ffffffc008d5b980
x29: ffffffc008d5b990 x28: ffffff80060562c8 x27: 00000000f805633b
x26: ffffff80001a8880 x25: 00000000000009c4 x24: 0000000000000016
x23: ffffff8005eb6470 x22: 0000000000003600 x21: ffffff8006948080
x20: 0000000000000000 x19: 0000000000000006 x18: 0000000000000000
x17: 0000000000000001 x16: 0000000000000001 x15: 02963607fcee069e
x14: 0000000000000000 x13: 0000000000000030 x12: 0101010101010101
x11: ffffffc037302000 x10: 0000000000000870 x9 : ffffffc008d5b800
x8 : ffffff800028f950 x7 : 0000000000000001 x6 : 00000000662b3000
x5 : 00000000000002f0 x4 : 0000000000000000 x3 : ffffff800028f080
x2 : 0000000000000000 x1 : ffffff800028f080 x0 : 0000000000000000
Call trace:
 mt7531_cpu_port_config+0xcc/0x1b0
 mt753x_cpu_port_enable+0x24/0x1f0
 mt7531_setup+0x49c/0x5c0
 mt753x_setup+0x20/0x31c
 dsa_register_switch+0x8bc/0x1020
 mt7530_probe+0x118/0x200
 mdio_probe+0x30/0x64
 really_probe.part.0+0x98/0x280
 __driver_probe_device+0x94/0x140
 driver_probe_device+0x40/0x114
 __device_attach_driver+0xb0/0x10c
 bus_for_each_drv+0x64/0xa0
 __device_attach+0xa8/0x16c
 device_initial_probe+0x10/0x20
 bus_probe_device+0x94/0x9c
 deferred_probe_work_func+0x80/0xb4
 process_one_work+0x200/0x3a0
 worker_thread+0x260/0x4c0
 kthread+0xd4/0xe0
 ret_from_fork+0x10/0x20
Code: 9409e911 937b7e60 8b0002a0 f9405800 (f9401005)
---[ end trace 0000000000000000 ]---

Reported-by: Daniel Golle <daniel@makrotopia.org>
Tested-by: Daniel Golle <daniel@makrotopia.org>
Fixes: cbd1f243bc41 ("net: dsa: mt7530: partially convert to phylink_pcs")
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---

Fixes line added so people know which net-next commit is affected;
this is only in net-next at present. If you think it's unnecessary,
please remove when applying the patch, or let me know and I will
resend.

Thanks.

 drivers/net/dsa/mt7530.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index c4ea73d996e8..e55d962fef9f 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -3035,9 +3035,16 @@ static int
 mt753x_setup(struct dsa_switch *ds)
 {
 	struct mt7530_priv *priv = ds->priv;
-	int ret = priv->info->sw_setup(ds);
-	int i;
+	int i, ret;
+
+	/* Initialise the PCS devices */
+	for (i = 0; i < priv->ds->num_ports; i++) {
+		priv->pcs[i].pcs.ops = priv->info->pcs_ops;
+		priv->pcs[i].priv = priv;
+		priv->pcs[i].port = i;
+	}
 
+	ret = priv->info->sw_setup(ds);
 	if (ret)
 		return ret;
 
@@ -3049,13 +3056,6 @@ mt753x_setup(struct dsa_switch *ds)
 	if (ret && priv->irq)
 		mt7530_free_irq_common(priv);
 
-	/* Initialise the PCS devices */
-	for (i = 0; i < priv->ds->num_ports; i++) {
-		priv->pcs[i].pcs.ops = priv->info->pcs_ops;
-		priv->pcs[i].priv = priv;
-		priv->pcs[i].port = i;
-	}
-
 	return ret;
 }
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
