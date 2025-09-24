Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AD6ECAC5B5
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Sep 2025 15:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zyeSrCviALKLwpxVGFG8rZWElA3nuGww42zxu/BiFw=; b=nt2e3tkaFYJOEnbZsf+kyJhDHO
	byVX70qbqU943zq6q5uQmj/S0O/AcSW9lnIr4JCCA/cO7PLEafM/5qCEM1Eke+slTupexZxrE0EUo
	RNPowdQqeSMQu3qrNVmztgw7/tTrz6pcC6x4je5EdSPZ/QAdqicpJg5ToGGORfXbyEK2K3gcLFtgw
	8qr3eJ4xWRqVOnk8kAfdIiXSFD9vwqBkuTMpy+6J1fQMq+V8z0yHHDApXqV4IGPW2k1ib7SAqaPma
	qiAAULl7W5QvWsPjVIPRL8N83NJFP2+JQWmlwmUpnS2Av8h0CsaQpgSlQmz7zqJA8O03GUkV+NaPQ
	zkYlOANQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RVp-00000001JrT-245W;
	Wed, 24 Sep 2025 15:34:33 +0000
Received: from mail.simonwunderlich.de ([2a01:4f8:c17:e8c0::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RVh-00000001Jew-1UL6;
	Wed, 24 Sep 2025 15:34:26 +0000
Received: from sven-desktop.home.narfation.org (p200300c597296Be00000000000000C00.dip0.t-ipconnect.de [IPv6:2003:c5:9729:6be0::c00])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.simonwunderlich.de (Postfix) with ESMTPSA id 1DD0DFA184;
	Wed, 24 Sep 2025 17:34:20 +0200 (CEST)
From: "Sven Eckelmann (Plasma Cloud)" <se@simonwunderlich.de>
Date: Wed, 24 Sep 2025 17:33:10 +0200
Subject: [PATCH 2/3] dt-bindings: net: wireless: mt76: introduce backoff
 limit properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-backoff-table-support-v1-2-20e50fbc59de@simonwunderlich.de>
References: <20250924-backoff-table-support-v1-0-20e50fbc59de@simonwunderlich.de>
In-Reply-To: <20250924-backoff-table-support-v1-0-20e50fbc59de@simonwunderlich.de>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, devicetree@vger.kernel.org, 
 "Sven Eckelmann (Plasma Cloud)" <se@simonwunderlich.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3962; i=se@simonwunderlich.de;
 h=from:subject:message-id; bh=uBaOvLBEYw6cM2ZE3ZNKPKFL8pnovauxKrJogvIVOw0=;
 b=owGbwMvMwCXmy1+ufVnk62nG02pJDBlX+BOtF5cppdqdDdoyofRg+lKtvE7HAw3X+VLevNlsm
 HZFmaOqo5SFQYyLQVZMkWXPlfzzm9nfyn+e9vEozBxWJpAhDFycAjCRG4cY/hdccZZcEDKZzd1i
 jtnl5YdLrc+8nzpLtOkYc6tI4Qb2V7cYGS5y3dyhsV/hUGbVxIo089urX009qrkgVeD11Z3qv+q
 U/dkB
X-Developer-Key: i=se@simonwunderlich.de; a=openpgp;
 fpr=522D7163831C73A635D12FE5EC371482956781AF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_083425_574172_5D66E693 
X-CRM114-Status: UNSURE (   9.30  )
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

Introduce path backoff limit properties in mt76 binding in order to specify
beamforming and non-beamforming backoff limits for 802.11n/ac/ax.

Signed-off-by: Sven Eckelmann (Plasma Cloud) <se@simonwunderlich.de>
---
 .../bindings/net/wireless/mediatek,mt76.yaml       | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index f8f72f3f1b1dd185b4797be38b87c621ef3eac08..0b06455ce955c38b324efebf8c7762bee33b57f6 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -215,6 +215,66 @@ properties:
                       minItems: 13
                       maxItems: 13
 
+                  paths-cck:
+                    $ref: /schemas/types.yaml#/definitions/uint8-array
+                    minItems: 4
+                    maxItems: 4
+                    description:
+                      4 half-dBm backoff values (1 - 4 antennas, single spacial
+                      stream)
+
+                  paths-ofdm:
+                    $ref: /schemas/types.yaml#/definitions/uint8-array
+                    minItems: 4
+                    maxItems: 4
+                    description:
+                      4 half-dBm backoff values (1 - 4 antennas, single spacial
+                      stream)
+
+                  paths-ofdm-bf:
+                    $ref: /schemas/types.yaml#/definitions/uint8-array
+                    minItems: 4
+                    maxItems: 4
+                    description:
+                      4 half-dBm backoff values for beamforming
+                      (1 - 4 antennas, single spacial stream)
+
+                  paths-ru:
+                    $ref: /schemas/types.yaml#/definitions/uint8-matrix
+                    description:
+                      Sets of half-dBm backoff values for 802.11ax rates for
+                      1T1ss (aka 1 transmitting antenna with 1 spacial stream),
+                      2T1ss, 3T1ss, 4T1ss, 2T2ss, 3T2ss, 4T2ss, 3T3ss, 4T3ss
+                      and 4T4ss.
+                      Each set starts with the number of channel bandwidth or
+                      resource unit settings for which the rate set applies,
+                      followed by 10 power limit values. The order of the
+                      channel resource unit settings is RU26, RU52, RU106,
+                      RU242/SU20, RU484/SU40, RU996/SU80 and RU2x996/SU160.
+                    minItems: 1
+                    maxItems: 7
+                    items:
+                      minItems: 11
+                      maxItems: 11
+
+                  paths-ru-bf:
+                    $ref: /schemas/types.yaml#/definitions/uint8-matrix
+                    description:
+                      Sets of half-dBm backoff (beamforming) values for 802.11ax
+                      rates for 1T1ss (aka 1 transmitting antenna with 1 spacial
+                      stream), 2T1ss, 3T1ss, 4T1ss, 2T2ss, 3T2ss, 4T2ss, 3T3ss,
+                      4T3ss and 4T4ss.
+                      Each set starts with the number of channel bandwidth or
+                      resource unit settings for which the rate set applies,
+                      followed by 10 power limit values. The order of the
+                      channel resource unit settings is RU26, RU52, RU106,
+                      RU242/SU20, RU484/SU40, RU996/SU80 and RU2x996/SU160.
+                    minItems: 1
+                    maxItems: 7
+                    items:
+                      minItems: 11
+                      maxItems: 11
+
                   txs-delta:
                     $ref: /schemas/types.yaml#/definitions/uint32-array
                     description:

-- 
2.47.3


