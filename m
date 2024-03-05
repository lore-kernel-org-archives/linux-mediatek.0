Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25435C54E49
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Mar 2024 04:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m3G7uqGep2jRTiY2MUFrRQpXBp2XUJrcB1aaHLU8GHM=; b=YDdvvwD3rbcbnQVWpxCRbi6xU/
	KfT1R6AEEfrkChMvaey5UgZeq6/d3RhR4S3VRZo26v3/ly1RcQH9DbSWMAjXertcL1YLrBiYut1oE
	FNNeNYiMrz0k0FA1a1um2QPQdbrWO07LWulrFDKmJUqfZy+XoUWVsiW3sfXdHAVpn/P85mAmMlE7o
	5SwTvkptOWS9SkpGrXvtEcC9+lEM0GkGnqHNnFZVSt/M2cCFhgC8IJGttbfxrJkqrfPe16xB4JaN9
	7EQ31W//L5gXxVdF8gzDWpDfyik/WhPvm1ksjiDpyQLUUuZ6HB0sdRwy/RtHIhMlnaU7VC57h5kFM
	uhuJ70/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhMbv-0000000BscK-1CsV;
	Tue, 05 Mar 2024 04:41:03 +0000
Received: from outgoing4.flk.host-h.net ([188.40.0.90])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhMbq-0000000Bsb3-00LG;
	Tue, 05 Mar 2024 04:41:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=risingedge.co.za; s=xneelo; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:reply-to:sender:bcc:in-reply-to:references
	:content-type; bh=m3G7uqGep2jRTiY2MUFrRQpXBp2XUJrcB1aaHLU8GHM=; b=vT1SgjPmcYN
	d1lFD6XiX8in9sqYFQRcj8Eoa8XyyDdh15JEydux/xq/eVD5DNWGqiDUixS6S2adw2tk62pafAA87
	51h1dmdbGKc1JoPe4ytB4NSOgIXYV7sNUqfA6ZeYjsBFrKaw1Vcr1hfUfFU4Eua8b+8hhnZmBhQyv
	pzrdKh3GzmHc+VR7ZsPkoZyiDSn/y4/fJd0RoXu0VTv9VjMXdNLbaDxuR+umJrjSPDBAow/kl8EVb
	x//uqAlDcr6nFnqG7hGH+AEmS7ckGTVJn8GfZAb3YU+OCCkjoRu5Tu6NI2t+R15YUW990vC4eE2Fc
	62IwLFzyd8PO+eCqW50XQ7A==;
Received: from www31.flk1.host-h.net ([188.40.1.173])
	by antispam1-flk1.host-h.net with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1rhMbc-00HBd3-Hf; Tue, 05 Mar 2024 06:40:47 +0200
Received: from [41.144.0.96] (helo=localhost.localdomain)
	by www31.flk1.host-h.net with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1rhMbW-0005M8-1G; Tue, 05 Mar 2024 06:40:38 +0200
From: Justin Swartz <justin.swartz@risingedge.co.za>
To: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Justin Swartz <justin.swartz@risingedge.co.za>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] net: dsa: mt7530: disable LEDs before reset
Date: Tue,  5 Mar 2024 06:39:51 +0200
Message-Id: <20240305043952.21590-1-justin.swartz@risingedge.co.za>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: justin.swartz@risingedge.co.za
X-Virus-Scanned: Clear
X-Originating-IP: 188.40.1.173
X-SpamExperts-Domain: risingedge.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net; auth=pass (login) smtp.auth=@risingedge.co.za
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.03)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT8bSAwkwoC1TJJiWLFQYyDsPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5wCPRB8bAzJcv2cv+UqiTTc2+CpNcmBnO4XM3Sck4bwNogU
 WCl1nkLBzZX0KuJ9bXiS85Z42w/+2OBolTNFbPomXFWCX8oNdggW7HE9XDTdSejrkEpbuUvwMvHx
 3T+KSG//gbuP7hnUK8NQdLwsVWKIv+fXqqb3FJ1Z7kkAIev0U9CKH/oA07tJunDPm536TODb5GPR
 oyaaXp1VNA9dXvxV+mFktoWo3CKg4C3LDJ75vu2U4GT70q7ZqN/P49BncZ5XB7lfx9K88uL/WnJE
 LAEP514Y/yfAEbrTclu3OeNcbACmFr3ts0d2E6vXySsvfMaT9Bjf4etJ827HW1/sdZ81dz6BqXHU
 oYg+nmOeSIjjxA24TPuOyBrko5yKpcR03QEJ9DjWmjcfK/FpTD0spWG+rMYoj8CdNq4vLYsMDbt4
 2oUP1Ae/eGZl2OLANHAHEjHENEhX9cq65nsXPA0MIFDIPOMDW/6+MC+5Mq5RH9OoW0W22an/ubzj
 InB/ImqScRfGyrhHVstPeAuxsRhUFJC4TtSvIahFt3uEpT0304dV2Yoz1SesQUA6bnjJZT6m9lal
 9vikoy50DqR3hu/rL5PGAoTDzn0QdoxFeruM0Uhu+dTUSiL7T3enG3jHhaXbbkcihnVW8zB2Qi26
 vkVALycwzSdeC1kd8cXa71WqOc72jXbRpMw6Agze1f399OurHEyYS7nq+EBNvgiWKNNSkdVDPqq6
 +NRG0tTqWfoM12ajaPKeGaSpuwkt9kMFaoxOFH1hIqsDqiY5NFuEmlCmGLsHMs4VIrisX+dtrxYn
 /0jYEvj5QBAPtzfeVlNHdCJmwgf0M7fnqgzRvCMiN68tcHQey84mBB4XoB473XOJmIRPynE3O7YZ
 oFBs6I7QuC1BjGNT52hVLEr/9PrrMm81h6IAYzikeIJfw26MB/V1E5BP9Gv0xI1YXOxC1lZqyFpL
 AwQr6muMti2YanICQnMITeB2fd0UyjU/MIq3Vtx6CgQGHtezYqxGMqsKjARq8PBC4qgGsfAERwCB
 JFs7XjZYbJPBsmpIto2O4JO2fx1gIuNHgi11AwJSTGCrOFs22K1ZnDqAw3gLmOBPHazhChxq9nGW
 aSi6bFHidB1VgzDzDZn/+QEiRQv+PVjjwa+Z5RFCOMQwU3LvoOQWIGmR34v72byEdfFYVDBYJee7
 gx/u82RtUwfD5ALHBf4EnQOzr8vuDU00mVfWLKEgol9rYV4JEcNP1rJoln/cD8h/RIvkzXRTCYvX
 WLQhlD92+1l+zHfJg1FMwntsduNBxKPaTpE5L8d4VqFy6yKUFQtzhTlGiGL9B+FvFA6U1VLNI5ac
 F+7LBSfmrQPvc5+YzzlWlzLxTUJwIIDSVMZhrIoAWTF5tIdhy/UIEBYDcZg+Q8UhuRLyBn1+pvlH
 hV6a5QjptwQBGybQyDQ2/GYwPjlMcE57ESN6G+kn87CtwPdB/10jfVNpDbYnXJdSRQj8460WHJib
 IxmU2pb4i4DTkMZeMiNI9JSIyUbtnrlbG4BI8o81FOo91axhCaqPShJzgHH7y4ZfQxML
X-Report-Abuse-To: spam@antispamquarantine.host-h.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_204058_665455_15292282 
X-CRM114-Status: GOOD (  12.15  )
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

Disable LEDs just before resetting the MT7530 to avoid
situations where the ESW_P4_LED_0 and ESW_P3_LED_0 pin
states may cause an unintended external crystal frequency
to be selected.

The HT_XTAL_FSEL (External Crystal Frequency Selection)
field of HWTRAP (the Hardware Trap register) stores a
2-bit value that represents the state of the ESW_P4_LED_0
and ESW_P4_LED_0 pins (seemingly) sampled just after the
MT7530 has been reset, as:

    ESW_P4_LED_0    ESW_P3_LED_0    Frequency
    -----------------------------------------
    0               1               20MHz
    1               0               40MHz
    1               1               25MHz

The value of HT_XTAL_FSEL is bootstrapped by pulling
ESW_P4_LED_0 and ESW_P3_LED_0 up or down accordingly,
but:

  if a 40MHz crystal has been selected and
  the ESW_P3_LED_0 pin is high during reset,

  or a 20MHz crystal has been selected and
  the ESW_P4_LED_0 pin is high during reset,

  then the value of HT_XTAL_FSEL will indicate
  that a 25MHz crystal is present.

By default, the state of the LED pins is PHY controlled
to reflect the link state.

To illustrate, if a board has:

  5 ports with active low LED control,
  and HT_XTAL_FSEL bootstrapped for 40MHz.

When the MT7530 is powered up without any external
connection, only the LED associated with Port 3 is
illuminated as ESW_P3_LED_0 is low.

In this state, directly after mt7530_setup()'s reset
is performed, the HWTRAP register (0x7800) reflects
the intended HT_XTAL_FSEL (HWTRAP bits 10:9) of 40MHz:

  mt7530-mdio mdio-bus:1f: mt7530_read: 00007800 == 00007dcf

  >>> bin(0x7dcf >> 9 & 0b11)
  '0b10'

But if a cable is connected to Port 3 and the link
is active before mt7530_setup()'s reset takes place,
then HT_XTAL_FSEL seems to be set for 25MHz:

  mt7530-mdio mdio-bus:1f: mt7530_read: 00007800 == 00007fcf

  >>> bin(0x7fcf >> 9 & 0b11)
  '0b11'

Once HT_XTAL_FSEL reflects 25MHz, none of the ports
are functional until the MT7621 (or MT7530 itself)
is reset.

By disabling the LED pins just before reset, the chance
of an unintended HT_XTAL_FSEL value is reduced.

Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
---
 drivers/net/dsa/mt7530.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 3c1f65759..8fa113126 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2238,6 +2238,12 @@ mt7530_setup(struct dsa_switch *ds)
 		}
 	}
 
+	/* Disable LEDs before reset to prevent the MT7530 sampling a
+	 * potentially incorrect HT_XTAL_FSEL value.
+	 */
+	mt7530_write(priv, MT7530_LED_EN, 0);
+	usleep_range(1000, 1100);
+
 	/* Reset whole chip through gpio pin or memory-mapped registers for
 	 * different type of hardware
 	 */
-- 


