Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAB4C55174
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 Aug 2026 21:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fuXEqimyffgC3r6i7frZWabp2CjAJ6czkCeh1u+cNBo=; b=ZocnYGqoViRDPFyVmF/8DC0LEI
	z4pioseufQGsmpPJv9XyUjOH+SD4n0ZPFcDDYfByRgbKvS64ZMhJSoVHnB+019z6vcgIa1AoHUPVN
	HafJDW/eBmRmv3KSiDUKvtQqciJw7WIVb3CBx8sQYRlmopd39Fl6qwiENsdTlCLkEQGlbuZltqS/V
	QnJXOtd7+AVk1xPV8X//hupTe6iWqQtftJtyz7x5NAGRWLiemas0iucllwF3Dzx1sFUKdFW5FlHjh
	ox71UV44suxBMfhy+gCJwXVKDxb5KWGvcvssmT3hEC9bkg6flw5FpEM/W6WVjuTuiPjyXnWfPxezG
	4cp2U1/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqdyW-0000000G4U9-06PS;
	Sun, 02 Aug 2026 21:44:04 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqdyT-0000000G4TP-1xZh
	for linux-mediatek@lists.infradead.org;
	Sun, 02 Aug 2026 21:44:02 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-9083f928b60so15912836d6.1
        for <linux-mediatek@lists.infradead.org>; Sun, 02 Aug 2026 14:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785707039; x=1786311839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fuXEqimyffgC3r6i7frZWabp2CjAJ6czkCeh1u+cNBo=;
        b=McKcFFCIzdQtsgWQUJi8CWFlYKPOXI48gLD0PgIPmwIk4SyiH0FTlGPzd0otq3WbE5
         AqB4BYECUn6r3U89VZOngXvcc+qMWxer9f/hfpJLmD1nYRxcAJ1XPVnm39j9MBfPrem0
         JFEL0E88DKWv9FhV55psTUsZFbE4GSX5F05EmjkASD9ciFJo8Fnpstu8vERLGkD+iDJQ
         L5XVfyHm4M1jSTncIx2J8WVE5z+D73WQ3/bPcjuv0wu+s8Wovoji/kYPXvzgFPajotwL
         T4QURF1IIvCtIs9gyE8rqoGOWn6y01hn6aDKHc/f8DFEg4VYFjPIrpXgxPkKLUvIx/Wi
         RPoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785707039; x=1786311839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fuXEqimyffgC3r6i7frZWabp2CjAJ6czkCeh1u+cNBo=;
        b=ZOAJWudH1o93E4oo+oL4HOwlv3CmK4oWsoe6Gwc1foZ5PNFo2YEPuASoA71GSoxSug
         QvbQGvQBSgTLKNu2I+9emPryYikM3SeKx9KqUf9rmByTSRSxVHn3X+sDT6S35/SAcD8K
         ga7O6l6vfPgENvu4xu8KyCDjLbQE1DVgrzYu8WTmQ2/exwTC8PjW7ZbEwIdGjevKZdFs
         KCSft8b9dCPG4/SnRKT1HZuMtLNfuBlx6fnma6k0LWD6tv9CwB+5UiTTYZIkXukoid9M
         odhXf38kMuoJ2JzoOZjFLfIZ1BcSP3g3W7GaIMMvD8RYp1th+28BaCwKOYMVHyH+S/Md
         M3jg==
X-Forwarded-Encrypted: i=1; AHgh+RpJVTRZfvXjilBm1O3wkV+qUW8HGeIucaQvjz7QYT9jmyde5TZKC1TCydkXYUdOEwrv/TCmcU4k4dilr/O2zg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxhw5iyid7sgHL6ZobUnr6qdYTGIR9pRasi4Qr/n6oJr4nDcM+n
	ggfFQOTUL8EmWD2vPTt2JZhKiO450BO3vTMh3HWFMJpPk8dVaJNjeWYc
X-Gm-Gg: AR+sD12PcBphXfGAqKfhF1kvFOF9sBNYAi+lmrbW0+o1EN9RnChjAIjLEY4EGwgsnID
	zxfiU4HNN5+AAexGsV+1K0NIrUqEqSRAiWuzF+qrb9QjD32sL9jZ70pM63iwxnm5ePIT9fVmuur
	9d0qCqnZq+KhCCykgPhKwXV7CDbgqvBkPin38f+2Ap/n4KJMyiVV4a0LZcPQBLz8lXdTY6+qUwg
	i6KiQbbXf8sRo7Hb0ThvxKBpdR0YrIhM1Lsp1PX8LWuMSoS+KAz3WbpTXtHPvWCaOLZMXyoWXCH
	4rkU3jurawVGgzDs3Z2srT51rXQySED/eAt+Wqjv7xnwEhGdgUPaWTbmAfaaQWhnTSwCyHrOO1E
	RyBpf0/UBnV6TM+/ish2Ipm5/cnvPW9HbcL0Fa3G84NwU3av4RpOrXP19RDQALAOHq21WtNwqmw
	+iY2CkqoNZtA5xcs6ehOR5ZYWp3d+Ny9rFxSQiIcodiL/i+ltJ7bneF4iK+j5fvCMvdcwhObOeY
	yegB3gfzNTSbB18E3okRbZst+40i87Mp9QoL1j9npwXF/Xl8Gd6p8uvx5eFjVwSOhyHw4WUWHt8
	ACugGAxBqZMhuF9+CtiDY87mt/WpbKkUjT3iT2qA/5jFjzjk
X-Received: by 2002:a05:6214:5403:b0:8b3:f911:c1df with SMTP id 6a1803df08f44-9084966585bmr185128876d6.21.1785707039288;
        Sun, 02 Aug 2026 14:43:59 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908435b6778sm60683266d6.30.2026.08.02.14.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 14:43:58 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mailing List <devicetree-spec@vger.kernel.org>,
	netdev@vger.kernel.org (open list:NETWORKING DRIVERS),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek)
Subject: [PATCH] dt-bindings: net: add nvmem-consumer reference to network-class
Date: Sun,  2 Aug 2026 14:43:54 -0700
Message-ID: <20260802214354.490074-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_144401_515945_687FF442 
X-CRM114-Status: UNSURE (   8.97  )
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

The nvmem-cells and nvmem-cell-names properties are used to supply MAC
addresses to both wired and wireless network controllers. The wired
hierarchy already allows them through ethernet-controller.yaml, but the
wireless hierarchy (wireless-controller.yaml -> network-class.yaml)
does not. As a result, brcm,bcm4329-fmac nodes using nvmem (e.g.
bcm4709-linksys-ea9200.dts) failed dtbs_check with:

    Unevaluated properties are not allowed ('nvmem-cell-names',
    'nvmem-cells' were unexpected)

Each wireless driver otherwise has to add the nvmem-consumer reference
individually (qca,ath9k and mediatek,mt76 already declare their own
nvmem-cells/nvmem-cell-names).

Add the nvmem-consumer reference to network-class.yaml so all network
nodes inherit the properties at once. Wired controllers keep the tighter
single-cell, mac-address-only constraints via ethernet-controller.yaml,
which still apply alongside the relaxed class-level properties.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 Documentation/devicetree/bindings/net/network-class.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/network-class.yaml b/Documentation/devicetree/bindings/net/network-class.yaml
index 06461fb92eb8..f7c8e24016f7 100644
--- a/Documentation/devicetree/bindings/net/network-class.yaml
+++ b/Documentation/devicetree/bindings/net/network-class.yaml
@@ -43,4 +43,7 @@ properties:
       maximum frame size (there\'s contradiction in the Devicetree
       Specification).
 
+allOf:
+  - $ref: /schemas/nvmem/nvmem-consumer.yaml#
+
 additionalProperties: true
-- 
2.55.0


