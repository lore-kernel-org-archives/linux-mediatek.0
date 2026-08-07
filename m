Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117E7C5ACC2
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 13:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=; b=nm0BUy2vKZ/zZYJcU20ORA9PEf
	1KwKvXybmyY26GSJDHk1Xyj0ZMv2db+8PRNlqS5YA1cXmdqsQ+0hsa5tx7b4DFR5Tx3vrle2L3m/0
	OTpuVQvU7eDHyWgZMpzTCRAKzrBErNP2BfvjlfnrTjgAPhQLxFa0MbzAz5SyyGwU7eUaxRIntY9Qp
	TO60Gr6gnsqt5jNSowHMtGqyKPpMXgn5EYAb3Mwx/QV+M7pb/fQFafJUwGXDXhXjADvVeki5Om22y
	lJjF0plBAP+EcSd60/Tb4UeovrJubnvVH6AY5RIS7x231hq2Twc3c53w02KD15ScwvsqcZFjUrb/1
	dtr1sEiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKOY-0000000862s-0Nqj;
	Fri, 07 Aug 2026 13:13:54 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsKOA-000000085fO-1wXC
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 13:13:34 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4953de5be0aso25639405e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 06:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786108409; x=1786713209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=Zfgjb8sdpyDNQ2Q+qnKaitcEz24c8ZBSknMDYMfj4Sv6+EdFx1+Pb5YOZoJTfN1c+i
         Uq6yXQfhKZkT1y4EpDlKbDukxpOfQ98ftBskbVpTK4kwvWQHjTzSru49HjbNb9E8Pi+v
         9aHTuX+04G7fll5CDXdmmpFJDw1UKPWGQjoBXJ0x93u0pWaa6OAFbIPMc6WnfH3WcY0N
         FiDqeduDAZyG6ZmUIQ6ISHVz70iSRhP85NvT6XzNw0fMrVrEVz8QBxLzVs3duhzWIjg6
         /LzRrkNit+MuJSk9HzDe6TUlm72Q7qNwyAZiWR8Cm7SEldizD8Vniy2+5Zqc2bj9wxYS
         bt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786108409; x=1786713209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KvAGMH2SF3OadC27x/m+3YmCq7OMNQ6xjFpJG6wyIOs=;
        b=niKCIrtk3XtSk/Alpb20on75p8vBkGn8mOJRbzaaaQuqUGrO909Q1ownhWeKDN8CG7
         CpxEp4MUkc/IwTYSSDAXEe2/szfjrgLgXIVSY8Z+q9MN5pWgtaapamJvI8QWV6giqFSE
         ddfrEhNqcoX/HAgaHWgi897pN/uLNFqNow/FU4ChC2jljBgyWaHyqfd1/OQNFVDpL9/u
         n7sBYcDZwM4cPBYfp5LospnAX4dxhx6K0Ce4Xwjs8oyharPO6ESs59CNzZ5SnnMFKIR7
         /uxaAiBp3tfG5FznCibCrhQSInk3OJxUdArLwpk2qRac0+vKb3jcsG6fR/IRhAyKCK7s
         GAig==
X-Forwarded-Encrypted: i=1; AHgh+RrV+k5Q0eYHby2au00t1HJ1CvLv8oT2S/mhdePsAcORs2VBlzmRGjFufX0YT/ydLwD3a1ybBeY839M+eoa9KQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0v0nDYcVIXkzKwG8KNfrIZUufVFroxoaADMC7oPrSlnhkS9kP
	2TMs75G2qI9BAI9vcKNKNK9e2qr8xv9+OmfPV24oMh31jdMCB7KAF8Wm
X-Gm-Gg: AR+sD117AxfRNaSpSVqP7PcDXmDTNAiMGjZBI/SCq4MllZ39xig36KQNCm///g6JKj3
	A2/JRc9V6pbNqV4dAQFbdUoG7An9/r1jZvKAoDE5MUXP0Hc9WxQh2TcU5gi4ncuzBrfnb0hqT6y
	hrLvY5HLrnTHKv8DJNlCqXL1Z9VXL5WccOq/oLthyTcySACf/88zn+GmuVRNUsJHE1vjImgF+1F
	VTakeJOQzo1X1WlnpqQ5vD98BEQUDbCqMhAA5c2Rddp6ra85qFfYU9pvwHKOmuWdBvYtCuzMyB5
	6wCpHc0brE89qRsC8oG5uhS9leQEPbCatePLHpOsAapEpd5tpdA8+8zGw1RssesdWOIO8ViAC84
	PwWkTH8kAPPCzYTge7xr0zrkJ6RQlBURGjPeR50+1SQgLUpm4iF62ZrI//ZO1na4VhKEQCOpkSJ
	DxX8qiLaR44ET+nxMs7YmSpreTlo2rMQb/OVpAI7aK99zeGu4kce/n4XwYU3XNwhGx5tUdUUcV2
	vepk1pXo6aGzCrf556JJ1BSi9Td+I/I6yQaJWXPhvaBpiFFcfNiXw==
X-Received: by 2002:a05:600c:46cc:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-4995e085347mr52863935e9.6.1786108408434;
        Fri, 07 Aug 2026 06:13:28 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-19-255-168.retail.telecomitalia.it. [87.19.255.168])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm58827665e9.4.2026.08.07.06.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 06:13:28 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v11 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Fri,  7 Aug 2026 15:12:50 +0200
Message-ID: <20260807131301.192060-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807131301.192060-1-ansuelsmth@gmail.com>
References: <20260807131301.192060-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_061331_503419_4E94FEFC 
X-CRM114-Status: UNSURE (   8.93  )
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

List all the files of the Ethernet PCS subsystem and add myself as
maintainer.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 08e43bc09735..e3ded0e4a115 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9688,6 +9688,15 @@ F:	include/uapi/linux/if_bridge.h
 F:	include/linux/netfilter_bridge/
 F:	net/bridge/
 
+ETHERNET PCS SUBSYSTEM
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	netdev@vger.kernel.org
+S:	Maintained
+F:	Documentation/networking/pcs.rst
+F:	drivers/net/pcs/pcs.c
+F:	include/linux/pcs/pcs-provider.h
+F:	include/linux/pcs/pcs.h
+
 ETHERNET PHY LIBRARY
 M:	Andrew Lunn <andrew@lunn.ch>
 M:	Heiner Kallweit <hkallweit1@gmail.com>
-- 
2.53.0


