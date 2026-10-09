Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF83CA601F
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2026 18:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOA4c9z5sUn9VN7fOpKn/7mWxETsDjWhelJneUehGWw=; b=waVT9DNfp7ffCzVqDCX7bBhYzv
	ku63XXCNk/1BHARIjUsZ70lIC9FjOGHVLS9c9xxb1Kic8S88N1SyXo09MPDVdeVFV2YzXKcrdSsLq
	2MefbdKncWFLA2RfoBYTpuGMa8CWVoxiLvHCrN3Ua1pCAXpkWzbd5/h73f1kqG6KqsUrMxL83SmuZ
	WiSMNNpspO6nTBarVkl0+Y6J78GLEj2x7QV6kZQFY0eHbrHaBxT3pxJ+XgbyjSZDZPn/5pT4Qsx46
	JOkAxjo61/T5CQEk9w75EY9KAKfhgAJYddihTNky1zP9pmgwAAk5ky3DW30PMbrXB9diErJA9/lPJ
	iwYmECaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFLM-00000006xom-2cZJ;
	Fri, 09 Oct 2026 18:29:20 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFLI-00000006xfl-3YKI
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Oct 2026 18:29:18 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48c4be28b82so79323f8f.2
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Oct 2026 11:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791570555; x=1792175355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sOA4c9z5sUn9VN7fOpKn/7mWxETsDjWhelJneUehGWw=;
        b=XeU07Ca7xQpxTiy58uCJ8MoSU4EbnjczZLmVahazFobKbIuFfQM+MQHZddLSGbSIqo
         T3oppUTz05Fy972BFiJH6jbGlu9/pPCZtISglPahBQRb531Sh62IIi0GDROC5s+rQNj3
         Wd2RJ6nvZAeeIjY6HLhhaVZZMw+88Z5jxmfLgSpbH0f8BsCfWv/dNOqlgGRnJWeYSe03
         YJyEAFs9zHIzhTf2uhFlCVqBrkVVSr5xsFtp8lS1yd61hJbJoIXYOOngGcMhKoFfnWQ4
         H+4z8yKU/7ZilYyoXqAw/pb0RO4WIh1DfxntcMytuXhpcHhCFwy1lr+sYe0ROYBHg9c8
         ObUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570555; x=1792175355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sOA4c9z5sUn9VN7fOpKn/7mWxETsDjWhelJneUehGWw=;
        b=VaJQ5eBLiBju416lPxYCkYcQL7DhBKI42HzDRirewE6SGE+DeodTtzEUb/EGr3gt6r
         94NZ+f9EjVgnhTiOUN/dHpDeBd7GuWDuZtHdt2zkAGP9SrhdcMQDU93ZUxIP5Se1orXK
         sHmVrLVa1WJbz34RiuiBWfjOiVBreIQbR3WvhNxF8kbY/GeXE+T8sp1N1sXX7JZoNsKZ
         dPnbHj5txwmWCOZZ5oDY6TkQUBFjM3tFNaS5MHWXm8lKxMdCCeOX15c2yRRweu1APiin
         VNCwivVRQhF+A+Jf2NB9/HjYzdgRVVuGYUCt1w8KgRwr0dmUD+cpY3Qgkp+lspMCWo9v
         ovUg==
X-Forwarded-Encrypted: i=1; AKwUvBwbYzMA6mrxwCXoNvH8sA3SpmoV4Jmzh0UKD02BuFiefYivSHyFlnRcb+7VvSLMN9rVjjSm4Ame2vGFHjR6JQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKIo0hvRBcVoqpyxBHhYnAyvbqQlkNrAzk/ZqkdaLasdl79ETDp
	Q3u1twpzpnIBxHq5y9vCIEA8AFW7r6PKOBHdTeX4571jOY6zj3OMCBmF
X-Gm-Gg: AYBFou0k5wYh3RIhpiSUMNFi7KaVgTK4Trg0eEC+9aP+n+e3itnHq0T82cchS6I4qT1
	LSDWiIWfvzmNPaGEiNPmoTXh9qbyEzyp1kyVUbrmxwD20b2WdoY0o/ZkND3Dx8rjXfRMYZrbWUX
	/0D1s77h6JRTaMtGE9/KS3PlVunDJoph62nLQ3RsPtBr0hcLFHW5/yrwhwEdU45F2hl2CWXbMzd
	KEbhd2JAEhI0I6ojsd4+ALqKyH1Fe1YXD7Ejqm0VcdSmZfFgtVREynRwJaJcaK/PgFbg1R6abJU
	lmPDW4cvmgtSqVP2Vh0iwSwD6kqbh77kmjNAfKw1LwtfgdpNnSxMPiE/vT1aceT8WYdkwX3NsVl
	co6ngFn/batl2Njl2W/WNqBhOQlIl60ydHSFWFI+RkskWwsKn6Vf2aaD5D/ErGotLDJLZFMQNd6
	11BG28XFW3EHQbuH1Lxhx9P4+gw3h7VmwR1zOySASo1bDv4A/ASVCnf58l/ZERPtEx1QTyBMwvb
	jKxOiBr49Aq3lD6PhNddaxg1PpZCGrFBgd6Kx9uoNshptk+UOlcebLkuamo2rLfSwI458/9bc7H
	2ZRm3i7ZxtKZ0RizzQ==
X-Received: by 2002:a05:6000:46db:b0:48b:e50:7152 with SMTP id ffacd0b85a97d-48dbaae21dcmr3669370f8f.28.1791570555000;
        Fri, 09 Oct 2026 11:29:15 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-213-45-9-252.retail.telecomitalia.it. [213.45.9.252])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48db9adf5e6sm5037794f8f.56.2026.10.09.11.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:14 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
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
	llvm@lists.linux.dev,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: [PATCH net-next v18 08/12] MAINTAINERS: add myself as PCS subsystem maintainer
Date: Fri,  9 Oct 2026 20:28:04 +0200
Message-ID: <20261009182836.50631-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009182836.50631-1-ansuelsmth@gmail.com>
References: <20261009182836.50631-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_112916_916725_13568401 
X-CRM114-Status: UNSURE (   9.41  )
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
index 509b35b5a0e7..d8533e36941c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9759,6 +9759,15 @@ F:	include/uapi/linux/if_bridge.h
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
2.55.0


