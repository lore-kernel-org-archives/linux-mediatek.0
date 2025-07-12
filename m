Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F65C83F21
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Jul 2025 20:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wlbqk2XieQcaf+xQ3cw9oEoHT0dKFrkXApK+hvN4gj4=; b=x0If6dvX3oZOa+/kbc2+GCPkcO
	SYzOHnOMxnkzHNCDriWR5/aeQEygnUH6CewhQsOvg38OGG3gmxoAjUvPwXTWGRNoROZ9scVUX8oPz
	LZuquGzcmLxhp20HG0lwaIkVtI7vUK5rKVrq4jTiJGqaDYglw8Rwg4+V6Lvdrm2JhFqqL6Z3umrir
	sQRKcaqhzq2yxCMVpfpbvkw0VqVzX7Bw+lf2z9iYtjB4KLES2h2N8xAfvUPz7PLTkpfA/FQzUPjva
	Lvs3W8zEYXW7HEInNaznRSHYLtsIgckgkpIvheihcU83XaSCD+RaI6RbRXGmhqRgpVkfpUtEDW7nG
	vEQBrpzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uagSW-0000000GyoL-28YK;
	Sat, 12 Jul 2025 20:04:32 +0000
Received: from mx4.wp.pl ([212.77.101.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uagNN-0000000GyML-34lT
	for linux-mediatek@lists.infradead.org;
	Sat, 12 Jul 2025 19:59:16 +0000
Received: (wp-smtpd smtp.wp.pl 39414 invoked from network); 12 Jul 2025 21:59:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1752350346; bh=Wlbqk2XieQcaf+xQ3cw9oEoHT0dKFrkXApK+hvN4gj4=;
          h=From:To:Cc:Subject;
          b=RPfVbN7Et+lbrTTRTl25H1goZDw4pZypc04PDwOkIkic7PokAqHqPHLb8Qz19QgD3
           IZ7lFBBiLCfRfEqz7PP/mB++Jn18pbtL6q8igWATS6JDZUovetGtEy1rw6APX8ILdT
           uF2Gzskb17UZiJNE1jbJqJiGzsdWeNcM8yV3nN9J9J0vy6UcqkkCLOm1i1Y1WZeyeQ
           OJ6jxS6yoIKJA2vMM50StN/zHq20Rn/aPi0JjIu2YH6mkEC7OcXU1vbaa3A9xlFCPI
           xXX05fGF/pd7I35ZY/eBvzpkEyB+IU/tQF38oM5Hu/cCCIGbetmyVziXlz5wEXyjbM
           nScAIKkwTIf5w==
Received: from 83.24.150.40.ipv4.supernova.orange.pl (HELO laptop-olek.lan) (olek2@wp.pl@[83.24.150.40])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <rafael@kernel.org>; 12 Jul 2025 21:59:06 +0200
From: Aleksander Jan Bajkowski <olek2@wp.pl>
To: rafael@kernel.org,
	daniel.lezcano@linaro.org,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	s.hauer@pengutronix.de,
	rafal@milecki.pl,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject: [PATCH v4 0/2] Add thermal sensors support for MT7981
Date: Sat, 12 Jul 2025 21:59:02 +0200
Message-Id: <20250712195904.6988-1-olek2@wp.pl>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-WP-DKIM-Status: good (id: wp.pl)                                                      
X-WP-MailID: 32c096a57224f34a4b90e33487e56936
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [0SOU]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_125914_253774_A818BFDC 
X-CRM114-Status: UNSURE (   7.90  )
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

This patch adds support for the temperature sensor in the MT7981 SoC.
This sensor is exactly the same as the one in the MT7986.

Changes in v4:
 - sorted bindings by fallback names
 - dropped accepted patch

Changes in v3:
 - added fallback in bindings

Changes in v2:
 - added fallback to an existing compatible string
 - removed second patch as obsolete

Aleksander Jan Bajkowski (2):
  dt-bindings: thermal: mediatek: add falback compatible string for
    MT7981 and MT8516
  arm64: dts: mediatek: add thermal sensor support on mt7981

 .../bindings/thermal/mediatek,thermal.yaml    | 27 ++++++++++------
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi     | 31 ++++++++++++++++++-
 2 files changed, 47 insertions(+), 11 deletions(-)

-- 
2.39.5


