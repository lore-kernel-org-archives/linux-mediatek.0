Return-Path: <SRS0=8MsW=7V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A842DC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 23:20:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3925720823
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 23:20:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h2rivVCB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="l0qSSwPM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3925720823
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PjA4fJS6+0gIK/5vwDaklY97b6xXRnP98KadBjFl/2g=; b=h2rivVCBdthyn5
	+jf0C0rRPPcNOLQ7lNU/yiBWtZzGjZsgSU+RQOFbwY73npjHY92k1PjxbfiHEgyjixuoadZPGR7Dd
	GM92r4vmA3+sEbDuPAOwPq5fv6RtCXV6bhKo1x0NCU7Xd+tPrFR6jZBLYSfWmKQrSAXwBH9rlVClP
	V+w8yxrz7Ksh1j7t9jujycuN1wfgT9fNlwwS484Qz3AVetfjNAJoV83SxDhAQbcC/2RwgkrBp6/kk
	rA18rsi399PCDXgKOwtOdT59Wt0x/ntpYKZRkIPzFhtWz4Df92HFNf9UOEe9yv+C6uOLC1CwCJqO7
	y4MqAewckHlSuUhxcFJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiR3b-0006EJ-Fh; Mon, 08 Jun 2020 23:19:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiQuW-0003xM-0B; Mon, 08 Jun 2020 23:10:34 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 102CA20B80;
 Mon,  8 Jun 2020 23:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591657831;
 bh=eZBp0tsDujcrF4Qv8GoWmXbcnp4p9Qe7aDwVYZD6/yg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l0qSSwPM5IgKH3FNyWY8dE9U1ZF/8XvrKxJ0rtiohfV8syQpcnfZbzkHzlIg0MOIi
 Qs52tNU3de00EmHgsIOhH5sDwWo1zOE24giowPgQdt4t4vj5Lib5Kaq+Vd5qG5qNMV
 yMdY6Ej4LDfj853T/upz42t3wY5JYXD2c8JQv2VM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 201/274] net: dsa: mt7530: set CPU port to
 fallback mode
Date: Mon,  8 Jun 2020 19:04:54 -0400
Message-Id: <20200608230607.3361041-201-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608230607.3361041-1-sashal@kernel.org>
References: <20200608230607.3361041-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_161032_189065_B8B5DF17 
X-CRM114-Status: GOOD (  12.50  )
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
Cc: Sasha Levin <sashal@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>,
 netdev@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>,
 linux-mediatek@lists.infradead.org, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: DENG Qingfang <dqfext@gmail.com>

[ Upstream commit 38152ea37d8bdaffa22603e0a5b5b86cfa8714c9 ]

Currently, setting a bridge's self PVID to other value and deleting
the default VID 1 renders untagged ports of that VLAN unable to talk to
the CPU port:

	bridge vlan add dev br0 vid 2 pvid untagged self
	bridge vlan del dev br0 vid 1 self
	bridge vlan add dev sw0p0 vid 2 pvid untagged
	bridge vlan del dev sw0p0 vid 1
	# br0 cannot send untagged frames out of sw0p0 anymore

That is because the CPU port is set to security mode and its PVID is
still 1, and untagged frames are dropped due to VLAN member violation.

Set the CPU port to fallback mode so untagged frames can pass through.

Fixes: 83163f7dca56 ("net: dsa: mediatek: add VLAN support for MT7530")
Signed-off-by: DENG Qingfang <dqfext@gmail.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/dsa/mt7530.c | 11 ++++++++---
 drivers/net/dsa/mt7530.h |  6 ++++++
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 34e4aadfa705..b75d09783a05 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -807,10 +807,15 @@ mt7530_port_set_vlan_aware(struct dsa_switch *ds, int port)
 		   PCR_MATRIX_MASK, PCR_MATRIX(MT7530_ALL_MEMBERS));
 
 	/* Trapped into security mode allows packet forwarding through VLAN
-	 * table lookup.
+	 * table lookup. CPU port is set to fallback mode to let untagged
+	 * frames pass through.
 	 */
-	mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
-		   MT7530_PORT_SECURITY_MODE);
+	if (dsa_is_cpu_port(ds, port))
+		mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
+			   MT7530_PORT_FALLBACK_MODE);
+	else
+		mt7530_rmw(priv, MT7530_PCR_P(port), PCR_PORT_VLAN_MASK,
+			   MT7530_PORT_SECURITY_MODE);
 
 	/* Set the port as a user port which is to be able to recognize VID
 	 * from incoming packets before fetching entry within the VLAN table.
diff --git a/drivers/net/dsa/mt7530.h b/drivers/net/dsa/mt7530.h
index 82af4d2d406e..14de60d0b9ca 100644
--- a/drivers/net/dsa/mt7530.h
+++ b/drivers/net/dsa/mt7530.h
@@ -153,6 +153,12 @@ enum mt7530_port_mode {
 	/* Port Matrix Mode: Frames are forwarded by the PCR_MATRIX members. */
 	MT7530_PORT_MATRIX_MODE = PORT_VLAN(0),
 
+	/* Fallback Mode: Forward received frames with ingress ports that do
+	 * not belong to the VLAN member. Frames whose VID is not listed on
+	 * the VLAN table are forwarded by the PCR_MATRIX members.
+	 */
+	MT7530_PORT_FALLBACK_MODE = PORT_VLAN(1),
+
 	/* Security Mode: Discard any frame due to ingress membership
 	 * violation or VID missed on the VLAN table.
 	 */
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
