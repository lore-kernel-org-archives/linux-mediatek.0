Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5312FF8855
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 18:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsjeeVtAkvtmQCzhPvbG7FaRQP12aRU2hZI/S64sceQ=; b=T9mDq0zxRXCLXRtMa0nRB9ZSMJ
	5svq1PSq+2Y4UctWj6BFv7ba0Ee0YFNDgliqL2aIBBAgIKskukpmFyvS6+Y2PWhKuqb9RRUAm8uss
	fvUw/BGqomwc4uIIs3LhI9NSgq0ueYdx9ohqtDcxWN8H2imOV0DPuaTlrWwPxm7d9B1L80MeYlYIm
	J+7JQee3+oeN68T5D2Adg5tSR1ICVdlKkdl+3I2YLzU4RTa39dvjhoZQ8Y4EJZogi1o6Me9CFyRP3
	EG0Q18G6Qmg0HpN15NdsVGbTRfdl6keBEsg9Wp8WCXhVSyN0aW6/ODoJbGESbXXf7qoO2Ko/nNfys
	R+aK88SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKUf-0000000HAUj-3mb8;
	Tue, 05 May 2026 18:27:41 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKKUc-0000000HAPD-4BNI
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 18:27:40 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48374014a77so66099595e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 11:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005657; x=1778610457; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zsjeeVtAkvtmQCzhPvbG7FaRQP12aRU2hZI/S64sceQ=;
        b=OhpPrn/DOM9TuCivqfv5bLG2HxEC4iM3nMv+62IImR6amuFSJbpO8tb/RwbQkM1687
         02Trp6UtJWXNBZjx+5mTmJvpZXCwv6KLDev5hBNTtVnIjTeYb0rGtj3m8Rp8ds0LPLMz
         hDq+KIOjDgXr3oNACNbD6leZZWAHW44Qwlfdw6J7MqoFQH4FrVLE7/3HZgOiCLvpHzaT
         89nq+WLBxEexDFE4of0CCXdJ0VqwWX8ZEaAInPwcHgdz+KubdIDLbJ5c8gBQmPumfJIZ
         ZGI4OyDUoX+z6gMiD7Y07M5lspEDFuItXSc0g9unOHOIbYO3gZ4QHIyi4p0Ep+w00P6o
         DPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005657; x=1778610457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zsjeeVtAkvtmQCzhPvbG7FaRQP12aRU2hZI/S64sceQ=;
        b=J+mQRGwGQ/QPMKdDXNZL1Zx6CgedSCsTulmJV0aiSZfmudQUpQZY0jYwsb0bFfKbWz
         nixTHBoorO3gYiQbExvCUi76zH67NP7S4APWzRrSjPlBdA/d9PUjT1shpXYDPk7JDTnp
         +h4N2uwfNS7Ux4QV+nKkknQHHzBawcBue6yVc4dwchB5KkIFNNGeiDb+sVOl3LbPU7j5
         Xfr6PO4fDUTQzirFz9Dr/+tQLAtL0VTGz6foQZNRTvWQefypksCyfIRnvL6od2GCDsUl
         LDD/QKHMJW8ht862cuATCTIBAnqMZWW7BKqddhqWlWChQ4rq74ASVzhzGy2mP31sNwoU
         4v7w==
X-Forwarded-Encrypted: i=1; AFNElJ9UAWdAI4fryZDc/LlRueBrSAoKsKbIyVkRZckv0gsoz5yehEEInQA2hUr7jpwtfvFLNq5WS9oSpzo6890slg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7CqrOGvu2lgsnym9uF/Nr7uCHCpLIY75GXx/mmG89K9fkXYNR
	Aq525tPWGEWkm+1wxNhJfkqHH7cQZAod1ckjy9P2iMoRo8tqmVjd/6PC
X-Gm-Gg: AeBDietSKyXyFbDA1/hHtClzfmqyrIr/TIrHslJ3+tA4CmjEPt3QK/zjTwyoSwUhgZ3
	fO0V+JoEB056lfhZAWAUgJ8DzxqYUw+66vEBOflXpw1F52oDis0GSSiSIcSOz6JGascrGAB9sMP
	ScYZiwvAbBC9mKQXfpItu9IuZzp8RxElZknxiws1+ueKEKk3eTd8nchiLFRVm0zxJBXwPlNnZx4
	gJNlEP9e2l4MxAgq7EdLZHotBdnFKRgnsaE7IctnuaKNHSGVQNpAniJAJGOPlihaI8IestuAY+z
	F8dPyWi1GZ97p7ziG6MuYhD3w9RhpnIbAOd7989UJiRrvItmPN7sJTV7eXOj4AOs0BMcuiifsb+
	zBuLnQUC79vtLHlAXnFin4VShMRf3+nSCknLOACcek+Q+CrT3PlDYxLXNVF8iVSyg8csLGnVWzC
	wXUJHLIBjRrYdtiS8yIq7TRM6dZc6NIE+gwtBJfOvuyrNqzL2fKRhbHaOC3gh6z5TzhE8DjcVyQ
	O8O77E=
X-Received: by 2002:a05:600c:17d0:b0:48e:526e:101a with SMTP id 5b1f17b1804b1-48e526e115bmr262175e9.12.1778005657086;
        Tue, 05 May 2026 11:27:37 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-59-227-65.retail.telecomitalia.it. [82.59.227.65])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48a820c865esm408208245e9.5.2026.05.05.11.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:27:36 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [net-next RFC PATCH v5 06/10] dt-bindings: net: ethernet-controller: permit to define multiple PCS
Date: Tue,  5 May 2026 20:27:07 +0200
Message-ID: <20260505182713.27644-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260505182713.27644-1-ansuelsmth@gmail.com>
References: <20260505182713.27644-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_112739_050417_FD921515 
X-CRM114-Status: UNSURE (   9.87  )
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

Drop the limitation of a single PCS in pcs-handle property. Multiple PCS
can be defined for an ethrnet-controller node to support various PHY
interface mode type.

It's very common for SoCs to have a 2 or more dedicated PCS for Base-X
(for example SGMII, 1000base-x, 2500base-x, ...) and Base-R (for example
USXGMII,10base-r, ...) with the MAC selecting one of the other based on
the attached PHY.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 Documentation/devicetree/bindings/net/ethernet-controller.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index 1bafd687dcb1..51a8a418955d 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -85,8 +85,6 @@ properties:
 
   pcs-handle:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-    items:
-      maxItems: 1
     description:
       Specifies a reference to a node representing a PCS PHY device on a MDIO
       bus to link with an external PHY (phy-handle) if exists.
-- 
2.53.0


