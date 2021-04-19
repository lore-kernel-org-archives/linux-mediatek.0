Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EC25C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 15:47:37 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 711F461279
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 15:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 711F461279
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A872W2Na01vr8V95OUYbNDnWMW2jt+wXXNyIs3QI/1M=; b=h5sxRUkAKgYfsAAzAyQDn7s8i
	Y73JG0byB3RkMETRJ0fM6Hlfj0t6g9NqPgDhyiB63yOsm6+3kwBjFxStVU3QgokXDS5nITVqzjy3S
	d4AxIzFiq2iKf+n21s0OQbcGHirMSPRHajS7ivefYery2G5VUgLibGQNQ8pAAZAgmBPYBAgYeDXLv
	NMtTz6Ax4e7kl+5BuaXaJ2C+NUlO+yla56ftl/t1DSiHT8xBbalPdlJ4f3rQ8FJy0aTZhr6OF/1k0
	ADhy9WxOSilenSVdHztWGSv/3HypkdYX984e1Pf3Zhh5HT/VZY/5xGGO//Brn+SVHLLJpJO017dIx
	wesGTluAg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYW7N-00ADEg-14; Mon, 19 Apr 2021 15:47:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYW7C-00ADDt-1N; Mon, 19 Apr 2021 15:47:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=d6IeN222L2AvMC3BWodguJL4uvfgEGERLTNiOfhrG14=; b=kWF7fGk/GHa2HthowEb2nWOuyT
 nwA8+aZeFQDMB/bcnZXOXztNPiEgu7rAolhqF9/9yU8KKtMLNY+yoBr0pCCB8CVCMcTDSJuXpSnHz
 x3/tbY6inxEtW5zPKlPuErdQWk2muP8aMnZFOha38cqc5ly7NSr7rwVtadEmyHqLUPImYPfBZCXmq
 h2dlivGH9nFdfR1cklcGMGfgRji0FC7RUTWJQ5PNWmT80lR/oiR9OU0dndO/ZAXjVO7grLNMm86nV
 qrHpTu33I464ejPgIaW3mc807KIM78kHNgK1gmou9wJqBESm4ZBlLnjYDubBopQ1PaeU2x0GnA6fK
 Yz8RDeRg==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYW79-00BUwa-BF; Mon, 19 Apr 2021 15:47:08 +0000
Received: by mail-pj1-x1030.google.com with SMTP id cu16so16181249pjb.4;
 Mon, 19 Apr 2021 08:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d6IeN222L2AvMC3BWodguJL4uvfgEGERLTNiOfhrG14=;
 b=d+KMjGdwLqY1RKsIEwvO2O/+nJyhETXl0eZQN9OgrfAQFOdo0cPkMwuPXUvA849dKX
 Z0OA/iV0oQNKVvgQASsytNZ+0D/qE25JJIWkIfJ7kVlTwQHmjbP3jXKCfm3fDShGUuzH
 BwMbic2WtsJxI/z4kZTSglL1GG9kr7BRGT1EajjilM5bSWuFXYYGMZmlUPP/vZlo/cQa
 LbiBcQ/44cAnK82wqwyA8jH54x8x4Sk2g/n3vIUevFzHqrJN7yWkX1bCPOfG+Nsn3fM2
 HSEiRieW7yA7bsKjTbnXiMySGxv8aiWYuhmg6xuTDNhQ3QoIOEVkQfWoDug3V6YnIGzO
 YVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d6IeN222L2AvMC3BWodguJL4uvfgEGERLTNiOfhrG14=;
 b=N4lbXEu32wFu5g1rngBBz2Uqt9tun4F4dtio8RcIq5CxWGjwzQx9RoZdlLwqq4EzjX
 5ktMh9aU9mrl2qDc45Sm08qOWT3nzDUlLV7EUsL6AHHEFZQ0zIOKULpSLZhpel8I1/7L
 UDC1tAFpK3JkND4cmCR6NvIUxu/Zj0UxzhMzTAgZfeYsujjw8crmhWrzOcdOme191Mc6
 hIbq1y6SJysvyTF/mrqMYlEQDQjB0elFpl5pwD4ZzK02GWEGQNekRbRHiz8NSzVwbhra
 oP2RivQaLT6qJWb0bM7+yBhjEuAJkRu0Ji4f/bCYTgtaZCmjUJx0ao+wsLYvOZYSBWmW
 ukqg==
X-Gm-Message-State: AOAM530x3jI6V41uWfEIRuldEzS1aqfNM79liLGXo/L98j2L0uQSq8Yi
 t9tmuPn0HIW7pYzcIJjwKS4=
X-Google-Smtp-Source: ABdhPJyQOLYsHUKaECSVkjdiOan+lnRWKTgrZi8x0QQ9DX5p0KE3pkRZKrm4yz1se7ftVYlH6bGPag==
X-Received: by 2002:a17:90b:4504:: with SMTP id
 iu4mr25401047pjb.76.1618847226695; 
 Mon, 19 Apr 2021 08:47:06 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id u1sm15314139pjj.19.2021.04.19.08.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 08:47:06 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next v2 1/2] dt-bindings: net: mediatek: add optional GMAC
 labels
Date: Mon, 19 Apr 2021 08:46:58 -0700
Message-Id: <20210419154659.44096-2-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419154659.44096-1-ilya.lipnitskiy@gmail.com>
References: <20210419154659.44096-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_084707_404488_6B80BD67 
X-CRM114-Status: GOOD (  12.24  )
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

Document the mediatek ethernet driver change that adds support for
custom labels and provide an example.

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 Documentation/devicetree/bindings/net/mediatek-net.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/mediatek-net.txt b/Documentation/devicetree/bindings/net/mediatek-net.txt
index 72d03e07cf7c..500bf9351010 100644
--- a/Documentation/devicetree/bindings/net/mediatek-net.txt
+++ b/Documentation/devicetree/bindings/net/mediatek-net.txt
@@ -51,6 +51,10 @@ Required properties:
 	is equal to 0 and the MAC uses fixed-link to connect
 	with internal switch such as MT7530.
 
+Optional properties:
+- label: overrides the default netdevice name. Useful when a custom name for the
+	DSA master interface is desired.
+
 Example:
 
 eth: ethernet@1b100000 {
@@ -74,12 +78,14 @@ eth: ethernet@1b100000 {
 
 	gmac1: mac@0 {
 		compatible = "mediatek,eth-mac";
+		label = "gmac1";
 		reg = <0>;
 		phy-handle = <&phy0>;
 	};
 
 	gmac2: mac@1 {
 		compatible = "mediatek,eth-mac";
+		label = "gmac2";
 		reg = <1>;
 		phy-handle = <&phy1>;
 	};
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
