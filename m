Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE7EC54791
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Mar 2024 11:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Khp9WhdhrUMC3rjvLeiFVDA0pee+bxFrxYN8BOO/r2Q=; b=l+eeu25x0iirCmJgLTdpqF1nVr
	65ZECPO1uOsaf8HyFanWtQk+Pbo1FZPqvLP4HJNQ31+sRw5nx6WD59vvSo+u8t6SfMATBY2wIqaS3
	/pwcnTugxBJ09V5TcestEgfDgdapjyLN09DjTaqUe10OK9T/z/20m/NqlQveSr43vPoP6eu2keGG3
	sXB4V2HwcWz4u6ePa9i23WZQt5MjiH6ogLk/m3/T8gu5QDTMg0v8DwqB/tbx/X8mlLyi3tQ2Fka0/
	NytQmFSlQDyIRVOt2I89G8glnw/Py4/S8CghJ8xy3Po+/L+ZperCqysmSJNG3YREYa4UnmuSGEMqs
	tsjKLkVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkMjt-00000009uah-0iHT;
	Wed, 13 Mar 2024 11:25:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkMjp-00000009uZu-1SB6;
	Wed, 13 Mar 2024 11:25:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 240BC6141C;
	Wed, 13 Mar 2024 11:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8D208C433C7;
	Wed, 13 Mar 2024 11:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710329135;
	bh=LYcNh8f/VUH2gSW2953XdtfYjWbGSG8COCLwOqFU9ss=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=UbL5fwOesmZxDjwGCadSLhlMetEzhhV4Sk6MRiBZPi7LHDafsiZ6rtdallYJqmKiM
	 79yeNbQpI9PHxcxAoF7Etf1rVvKhH8EZ0hAXLqHgMBzVHs1vWpU2iuwGcDT3/uPDIv
	 qbNYSTqmojPupxOpwiIC7PyLYq96LuxCM89+phSPRnLP57O/ViLtUG4b2o+OzwSJXl
	 cSLK2aGj+Y1mT7eDUipud8VnAtU1K4RBjfW3lW58ZPteo1JsrpKl+iB7xQJSQ+Egul
	 sZaN/0scE39HIUN15P74xpLI1w0J1c6lGwjAmtIghqbsXfpnk/AaJPjXQ0QpW4Myqg
	 iMkw97lR19y+A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682FCC54791;
	Wed, 13 Mar 2024 11:25:35 +0000 (UTC)
From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= via B4 Relay
 <devnull+arinc.unal.arinc9.com@kernel.org>
Date: Wed, 13 Mar 2024 14:25:07 +0300
Subject: [PATCH net] net: dsa: mt7530: prevent possible incorrect XTAL
 frequency selection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: =?utf-8?q?=3C20240313-for-netnext-mt7530-better-fix-xtal-frequen?=
 =?utf-8?q?cy-v1-1-5a50df99f51a=40arinc9=2Ecom=3E?=
X-B4-Tracking: v=1; b=H4sIABKN8WUC/x2NzQrCMBAGX6Xs2YX8WEt9FemhrV80oKluVkkpf
 XeDx4FhZqMMich0bjYSfGOOS6pgDw3N9zHdwPFamZxxR+Ot47AIJ2hCUX5q13rDE1QhHGLhouO
 Dg+D9QZpX9han0Pa9t12gmnwJqvXfXahWaNj3H5EuS5uDAAAA
To: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Landen Chao <Landen.Chao@mediatek.com>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>, 
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Justin Swartz <justin.swartz@risingedge.co.za>, 
 =?utf-8?q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710329122; l=6561;
 i=arinc.unal@arinc9.com; s=arinc9-patatt; h=from:subject:message-id;
 bh=L64g+46HN+S29jthqvg493sRpkqBmVTreKHISDH47E8=;
 b=QETKrDhCZGIxxkfvVHrUw+tUQmz/zGwkbwSTF7U2X5bdPBFZKtDOmY0SPiSsK98/qW7i0Kty1
 Fo+cDhkeTl+DLsjd42I1KWahApVmEMICNgNOyCa7nk9iV2a8eGtGNzy
X-Developer-Key: i=arinc.unal@arinc9.com; a=ed25519;
 pk=VmvgMWwm73yVIrlyJYvGtnXkQJy9CvbaeEqPQO9Z4kA=
X-Endpoint-Received: by B4 Relay for arinc.unal@arinc9.com/arinc9-patatt with auth_id=115
X-Original-From: =?utf-8?b?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_042537_703689_E1D460CB 
X-CRM114-Status: GOOD (  14.13  )
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
Reply-To: arinc.unal@arinc9.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Arınç ÜNAL <arinc.unal@arinc9.com>

On MT7530, the HT_XTAL_FSEL field of the HWTRAP register stores a 2-bit
value that represents the frequency of the crystal oscillator connected to
the switch IC. The field is populated by the state of the ESW_P4_LED_0 and
ESW_P4_LED_0 pins, which is done right after reset is deasserted.

  ESW_P4_LED_0    ESW_P3_LED_0    Frequency
  -----------------------------------------
  0               0               Reserved
  0               1               20MHz
  1               0               40MHz
  1               1               25MHz

On MT7531, the XTAL25 bit of the STRAP register stores this. The LAN0LED0
pin is used to populate the bit. 25MHz when the pin is high, 40MHz when
it's low.

These pins are also used with LEDs, therefore, their state can be set to
something other than the bootstrapping configuration. For example, a link
may be established on port 3 before the DSA subdriver takes control of the
switch which would set ESW_P3_LED_0 to high.

Currently on mt7530_setup() and mt7531_setup(), 1000 - 1100 usec delay is
described between reset assertion and deassertion. Some switch ICs in real
life conditions cannot always have these pins set back to the bootstrapping
configuration before reset deassertion in this amount of delay. This causes
wrong crystal frequency to be selected which puts the switch in a
nonfunctional state after reset deassertion.

The tests below are conducted on an MT7530 with a 40MHz crystal oscillator
by Justin Swartz.

With a cable from an active peer connected to port 3 before reset, an
incorrect crystal frequency (0b11 = 25MHz) is selected:

                      [1]                  [3]     [5]
                      :                    :       :
              _____________________________         __________________
ESW_P4_LED_0                               |_______|
              _____________________________
ESW_P3_LED_0                               |__________________________

                       :                  : :     :
                       :                  : [4]...:
                       :                  :
                       [2]................:

[1] Reset is asserted.
[2] Period of 1000 - 1100 usec.
[3] Reset is deasserted.
[4] Period of 315 usec. HWTRAP register is populated with incorrect
    XTAL frequency.
[5] Signals reflect the bootstrapped configuration.

Increase the delay between reset_control_assert() and
reset_control_deassert(), and gpiod_set_value_cansleep(priv->reset, 0) and
gpiod_set_value_cansleep(priv->reset, 1) to 5000 - 5100 usec. This amount
ensures a higher possibility that the switch IC will have these pins back
to the bootstrapping configuration before reset deassertion.

With a cable from an active peer connected to port 3 before reset, the
correct crystal frequency (0b10 = 40MHz) is selected:

                      [1]        [2-1]     [3]     [5]
                      :          :         :       :
              _____________________________         __________________
ESW_P4_LED_0                               |_______|
              ___________________           _______
ESW_P3_LED_0                     |_________|       |__________________

                       :          :       : :     :
                       :          [2-2]...: [4]...:
                       [2]................:

[1] Reset is asserted.
[2] Period of 5000 - 5100 usec.
[2-1] ESW_P3_LED_0 goes low.
[2-2] Remaining period of 5000 - 5100 usec.
[3] Reset is deasserted.
[4] Period of 310 usec. HWTRAP register is populated with bootstrapped
    XTAL frequency.
[5] Signals reflect the bootstrapped configuration.

ESW_P3_LED_0 low period before reset deassertion:

              5000 usec
            - 5100 usec
    TEST     RESET HOLD
       #         (usec)
  ---------------------
       1           5410
       2           5440
       3           4375
       4           5490
       5           5475
       6           4335
       7           4370
       8           5435
       9           4205
      10           4335
      11           3750
      12           3170
      13           4395
      14           4375
      15           3515
      16           4335
      17           4220
      18           4175
      19           4175
      20           4350

     Min           3170
     Max           5490

  Median       4342.500
     Avg       4466.500

Revert commit 2920dd92b980 ("net: dsa: mt7530: disable LEDs before reset").
Changing the state of pins via reset assertion is simpler and more
efficient than doing so by setting the LED controller off.

Reported-by: Justin Swartz <justin.swartz@risingedge.co.za>
Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
Fixes: c288575f7810 ("net: dsa: mt7530: Add the support of MT7531 switch")
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 drivers/net/dsa/mt7530.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 678b51f9cea6..6986f538a4d0 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -2192,22 +2192,16 @@ mt7530_setup(struct dsa_switch *ds)
 		}
 	}
 
-	/* Disable LEDs before reset to prevent the MT7530 sampling a
-	 * potentially incorrect HT_XTAL_FSEL value.
-	 */
-	mt7530_write(priv, MT7530_LED_EN, 0);
-	usleep_range(1000, 1100);
-
 	/* Reset whole chip through gpio pin or memory-mapped registers for
 	 * different type of hardware
 	 */
 	if (priv->mcm) {
 		reset_control_assert(priv->rstc);
-		usleep_range(1000, 1100);
+		usleep_range(5000, 5100);
 		reset_control_deassert(priv->rstc);
 	} else {
 		gpiod_set_value_cansleep(priv->reset, 0);
-		usleep_range(1000, 1100);
+		usleep_range(5000, 5100);
 		gpiod_set_value_cansleep(priv->reset, 1);
 	}
 
@@ -2420,11 +2414,11 @@ mt7531_setup(struct dsa_switch *ds)
 	 */
 	if (priv->mcm) {
 		reset_control_assert(priv->rstc);
-		usleep_range(1000, 1100);
+		usleep_range(5000, 5100);
 		reset_control_deassert(priv->rstc);
 	} else {
 		gpiod_set_value_cansleep(priv->reset, 0);
-		usleep_range(1000, 1100);
+		usleep_range(5000, 5100);
 		gpiod_set_value_cansleep(priv->reset, 1);
 	}
 

---
base-commit: d7d75124965aee23e5e4421d78376545cf070b0a
change-id: 20240312-for-netnext-mt7530-better-fix-xtal-frequency-31e6f599317f

Best regards,
-- 
Arınç ÜNAL <arinc.unal@arinc9.com>


