Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F09CA5FCB
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2026 13:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PlB//ouJaFs8pbtEqztirI7J+BCIkiQ8y642fBX9rS8=; b=WjtLRbV9o62D79Sr11+nM8t8fb
	KBrfcivr9y1/aaOnA+VJex41HEA0XJtyf4Gx5fnFLV48ks22rzJCCWlAgv0otsjg5AUYGRpZiRyNu
	CuxATc7OV1Wq0Q2P/GI+2IpbtVA5+rYt7b5PjC3VxZOpiruYNBbHTq/rxIx6LRu0Dyj+slZmzDxBb
	SKHS7Em6fsgJYLdmFlhbzdKRBhtFqi8moJrHh7be1L80XOH1WHiC+xTaeM8KJ2y5bxCdPT9MKIOo0
	JYlr1bU+aJ8ltQpwdIw46VNM5CR6RnNp37GDOXTVtgDA5yM2rc2LLIB05Phayedp9TAp+AMxEZM27
	biTUZwVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGQU-00000009AA8-14u5;
	Thu, 01 Oct 2026 13:02:18 +0000
Received: from mail-wr2-x0d.google.com ([2a00:1450:4864:30::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCGQR-00000009A8l-48TY
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Oct 2026 13:02:17 +0000
Received: by mail-wr2-x0d.google.com with SMTP id ffacd0b85a97d-48b0fc598f8so281489f8f.2
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Oct 2026 06:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1790859734; x=1791464534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PlB//ouJaFs8pbtEqztirI7J+BCIkiQ8y642fBX9rS8=;
        b=eEVBVIUB9AwqegO20RIJgq2RMrAT5B5JbRJx6A/iIHq7lHS0rosW+3NK9Ucgi9C67r
         PL1X5gC7/FGveeBOgKEJYcgZlJmphz5xXWrAwwUwpB/FyHxdbwK2Z/PiyADoKWqkdi9B
         CB22aH7H1Ju6kvKXjEn++vPb/NsrHeaZY2oAwfJSEorJmP4OnJ0pVYu2ehBPBsTCHTNc
         NYFTAXSdHNd5yq9SLX4tgvV+F+U6oy2GblpvoYt/ROznPeCENfkhVrrvwdhjwI8gTAMy
         JR3OpeQD+b0CoIXtwjA3DLejOxuuN8crbrJsdgstvY1mQikN4QOd6AHlqAxB6rlf5BG3
         K+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859734; x=1791464534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PlB//ouJaFs8pbtEqztirI7J+BCIkiQ8y642fBX9rS8=;
        b=dvIFSBx1gQEoOfcsaR1lCJ7aqGA/o0JCQEsabuHafQESuqdcV+0Beaq/Y1GAGUvj6X
         gZp3Iw7yrwWUro5qRCWtPP0jhKN6o69VyBRsa5SkC3BkhDH/zr62QxgbmTeut6U158en
         77hFWPmgio4n+vlQJJyfmiROR0iRdZmdoT1W87ZfLiWtgvoVCj0UE8iMmZ4LJ2J00M42
         LbT0ZywHPVKMqr78O0uexy0gYmUsSyMwn63VJZ7FPNtZB0tmQ7SpbhN8D3P79uYX0CGL
         3y2lVgg4Mv2lefX6NpTBERZcWmGJs/pJMVu2spbE3bMb1MTDhfcda0/jcGaHHkmzgKTb
         0KqA==
X-Forwarded-Encrypted: i=1; AKwUvBxQ9mpw6LE+KMan32JkSSRTM09XtbEQ7XkYvgWr/mH3T4iBjOKPRzf4bCW0m2csGHCUBBzDqJ34oWkp+XQPyQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIEFKdekEH574J3Xulx1rQaUgwJyHRAeQpeHBFdQEgU0LFvC2rn
	TtgGuBldwXegXfcX59Y67dPbunuq0J4DJR6JrrvniuNwI0/NXGG68J46sVy9aJkBDBM=
X-Gm-Gg: AYBFou1OK9n5VdLnkj8K00t3zSBgXwPqpfnhcb/iJtkW+7n0qKsvbPFqWrs4IO57Z18
	8Wo1Eq+v68xozIpnP/Q3DXemjG+vBWFmfGdGT1BhthLCISGrxENOX2F6eC+yS1hTmK4NnKl6o25
	myd2nTSj00NzkZYc7Rk31uawu7Ec0G9EhdByWh2fcwUk9z2PWalToS2EsADeGTJiBhkNDM7IfTs
	bRrcvrjgb/jzuK2Nd14tx1Jf8zUUL0iLYxviibKyerrpukiH8xUmItdlCx31uWdIRIRRG0G8HH/
	O+827lVswz15jIysUNIwsIb/6NSd1LZNAnRLTn2GpOJ0Ye2O541DvwqWzIk1z0uI1dtu4t1/Qwc
	hkvW1DbkVGkEcMA3oi/pDXU/Gk6r0T5r3CcJber809MZL+PJhTBCg8dniYiCyAWkytMSLLfyDgB
	F3bYyrzg5BBsrOXhJBYvH1czEd+SJ5lPOBRaPSv1kb+XCs3bw7Jw==
X-Received: by 2002:a05:6000:3c7:b0:48b:a6:61b0 with SMTP id ffacd0b85a97d-48b0254d145mr7938379f8f.47.1790859734093;
        Thu, 01 Oct 2026 06:02:14 -0700 (PDT)
Received: from remote-01 ([84.17.55.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b06a2cd0fsm5568155f8f.30.2026.10.01.06.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:02:13 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Russell King <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v5 1/3] dt-bindings: net: ethernet-phy: add needs-host-firmware
Date: Thu,  1 Oct 2026 16:02:06 +0300
Message-ID: <20261001130208.105558-2-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261001130208.105558-1-f@lex.la>
References: <20261001130208.105558-1-f@lex.la>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_060216_043740_EAFAFF66 
X-CRM114-Status: GOOD (  17.64  )
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

A PHY can be one that the host has to load firmware into before it can
be driven at all. A controller that connects to such a PHY at setup,
before its driver has loaded, gets the generic driver or no PHY at all,
and one that connects only once gets no working PHY on that port for the
rest of the uptime, even though the PHY works seconds later.

The flag declares that. A consumer that sees it keeps the port and
connects the PHY once its driver binds. It describes the PHY, so it
sits on the PHY node and needs no prefix naming one.

firmware-name is not used for this: it names the file to load, and the
EN8811H driver keeps its two blob names in code, so it would only be
read as a presence flag.

The need is not derived from the compatible because the knowledge that
an ID needs host firmware lives in the PHY driver, and that driver is a
module not yet loaded when the MAC connects, so it has to come from the
device tree.

Found on a Keenetic KN-1012, where the EN8811H behind lan4 has its
driver on the root filesystem and the switch sets its ports up before
that is mounted, so lan4 stayed dead for the uptime.

Assisted-by: LLM
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
Changes in v5: none, Acked-by added.

 Documentation/devicetree/bindings/net/ethernet-phy.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet-phy.yaml b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
index df50c4c33d76..ab95b9a5d95a 100644
--- a/Documentation/devicetree/bindings/net/ethernet-phy.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-phy.yaml
@@ -215,6 +215,12 @@ properties:
       used. The absence of this property indicates the muxers
       should be configured so that the external PHY is used.
 
+  needs-host-firmware:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      This PHY runs firmware that the host must load before it can be
+      driven, and is not usable until then.
+
   resets:
     maxItems: 1
 
-- 
2.53.0


