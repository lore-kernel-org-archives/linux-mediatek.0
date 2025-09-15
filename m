Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82948CAC598
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Sep 2025 10:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxXWRqnFqGYPd1tnhNthT3WKgGhl9VmDbyQfQ/+snwM=; b=4bbPw2c0XV+E2F/B6GnLoffRCa
	maGCW6Jp/ghmlzhLmE342iA9pSAsheK6VND0OIqyLTLQh2mbcTJBOETIn1+jL7+m5MRWgv4Q4RfwN
	IZgwsemPJYpSxRFibOs4/3UqTjTz1EILBsKIPwXewEPh2jLxQXwihA76AlgS2gDANmHpYa4B6h9Oq
	2QBlYZPvHXhCrN9LlDrBmMAc1x6d7DeD0nEYvWFWYrgiOVEQ0+97VMMf6S5K+68FK1RsW4IgC7tIz
	JicbFOLPiHAzcBkMMW7mTfbQ76L33lXTzSZC6A28gocp+IpfTZXJi2oQuOBXkRT+NWNeh0e1J5Zjb
	2elkjYog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6jE-00000003lLv-2DEG;
	Mon, 15 Sep 2025 10:46:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6iy-00000003l8y-1PBK
	for linux-mediatek@bombadil.infradead.org;
	Mon, 15 Sep 2025 10:46:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=HxXWRqnFqGYPd1tnhNthT3WKgGhl9VmDbyQfQ/+snwM=; b=MjO5cOKLCTHSKsi+F0QLiJFWjk
	Ts20SnoqGT2ZeiPnL6siI3MtABGX8dWCK0jXWOenddi4++42AXfmcQt5fJrXo3Uw2WzBE7H2tdaZl
	qPcEQbj6Tavyxc6MiVJvKGuWeDq2regaUWgAKUkwleMymlexqhgy3F3tm72H2mV4Pmnsi9PlZ+hCS
	xjYu0BG8QKT9udppsSv9Kv6M5QGabDuNvcxLq8CnFaCjOC5Zn4lUtugWrj1vqWqsb0iQfjhY5bahm
	tyTMt3Qf3jSxn684Cx+RMwUjC4GrqxdetnNBWa3ViYevmw1rcYuc0rs/greTyhOHMgF0I/GGY4X5B
	Z9oNFstw==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6iu-00000006wGR-3OIy
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Sep 2025 10:46:18 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3ea7af25f42so625058f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Sep 2025 03:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757933174; x=1758537974; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HxXWRqnFqGYPd1tnhNthT3WKgGhl9VmDbyQfQ/+snwM=;
        b=IYpSmZlY1tX0fX2A9oRPjSliOPVO431xwaafwCGJs66pgUrjcJD45OfMy2r9WxFACO
         Abw+Wq/yyFak/b/ZugSfgnyulRmqCVZLUZEuwUFcv/d1BVfL4ZleawIrk47jizdFIbK+
         PuQ3waMbVgEumOAANZhlyjuf6emIyeB8SNSR8EvDxl9XDwUnXo5DF53yYmGu5IGZpjt0
         8/0ZThMzLgCqKEbvBwDB+OACMCRoRa3SGrfLAAShRemHnpd32yCk7oeWKzeFhR6fafA1
         vh5Yl4h0KWzF1GHaGCfbPYQ+ehkbhNdgmxZ/kWMWbK1UNQxcKLNM6Rw93ahf9OMaeUuX
         rQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757933174; x=1758537974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HxXWRqnFqGYPd1tnhNthT3WKgGhl9VmDbyQfQ/+snwM=;
        b=QhpBrnA9fWzRR5KIJwFOTrRYQ8KJic6EFY1GMbawosueUdWQvjcYQt/jsrBh12YAYu
         W1POnA9/+mcF/uaWAodgszf7zs7OOKQb64XKmyPWCbQ2FPJpjlb35GNsJ0Sn6PderfM1
         Q+IBgr5DmXEaVWIeo5YUkJ9rzqQl18GWrlHmRW96J88kicyEzJhF4wJCO6XSrc2BBLqf
         ECzU2gvsiZh7WKpym0/5l/j7XmQ5c0yAFAFO1NHmgwGEyDzWfnf2BxPAS1OGdx7gFgaD
         7z27u37BbVOkSOpfHH6hKiGM/He8xgHl/UhzoXfFVGU8HJPxxfl1Z3wEjNJArUYDR8aS
         1JOw==
X-Forwarded-Encrypted: i=1; AJvYcCVR4BXU7L6FXX7pw5WilOJrmk8w1MyrAA3nm39t0iT1yfLs8OoIKT8YwPEIlhM/jAsX2/hUaBriP5jT2gqF7g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWOgkz0tkbp5kB/66Mr5GJcj9d6Zf48+ujMv7jX7DO1ik+8bzU
	l2T+SVLmDM9FD4sHQqHAdnZ6hz7rKd2GlaQfcoqfs4G3Y7kLUoiaS1Xo
X-Gm-Gg: ASbGncsqKqxYQkWYT21HjpaZg/JuIARyI2LcSCtphEJS5F7yEj42aQ+tWHKf7NHjBla
	ayBepA2i8lvbXQa6yNCyRCEz3yYLynHj+4keCFWp1nicpaAW3xH7kPFtXt4NMRxtoxju7mCEdyC
	ec8sPzid793fNKqa8THoQVnd4kg0DtUtKl0jA40E9y3vsOeZKdO99hb+Ymf1hqt8Y72XgA9F9h+
	2Hi/q3cbbSw1ufVwIM7YQL2FcqZpUUS/C13EBsK2v9pH1Aykmwcsc6jw/k5YUiXDB9bXnt5F0bT
	26W1s4HY7xtjF4F6eRXdiYbrQrV19OF2Xa+5DhHh84Brfx8nvKVRiuS0fparM3FMXfx/N7vr+yZ
	kvDqOuvw3zofotAOyW8yisxC5GmOGAp/CLjnWEuh/BGRT39TBxAjEez0rnEaKEa9W9fK92vgVCv
	jTdrpW/rsETjSYzTPP
X-Google-Smtp-Source: AGHT+IEiFbkrpONQ4XqXk19ByjgEAHG7EmwNVeSeBkfcrYsWrMW7FZrDKlSQ24Q5Qd7fFkQP/hDrrQ==
X-Received: by 2002:a5d:5d02:0:b0:3dc:2930:c7e3 with SMTP id ffacd0b85a97d-3e765a13065mr8441662f8f.35.1757933173856;
        Mon, 15 Sep 2025 03:46:13 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45f2acbeee0sm67163365e9.0.2025.09.15.03.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 03:46:13 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [net-next PATCH v18 8/8] MAINTAINERS: add myself as maintainer for AN8855
Date: Mon, 15 Sep 2025 12:45:44 +0200
Message-ID: <20250915104545.1742-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250915104545.1742-1-ansuelsmth@gmail.com>
References: <20250915104545.1742-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_114617_102045_A5808F66 
X-CRM114-Status: GOOD (  10.15  )
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

Add myself as maintainer for AN8855 DSA driver and all the related
subdriver (mfd, mdio, phy, nvmem)

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b81595e9ea95..818fe884fb0a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -740,6 +740,22 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/airoha,en7581-eth.yaml
 F:	drivers/net/ethernet/airoha/
 
+AIROHA AN8855 DSA DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
+F:	Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
+F:	Documentation/devicetree/bindings/net/dsa/airoha,an8855-switch.yaml
+F:	Documentation/devicetree/bindings/nvmem/airoha,an8855-efuse.yaml
+F:	drivers/mfd/airoha-an8855.c
+F:	drivers/net/dsa/an8855.c
+F:	drivers/net/dsa/an8855.h
+F:	drivers/net/phy/air_an8855.c
+F:	drivers/nvmem/an8855-efuse.c
+
 AIROHA PCIE PHY DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.51.0


