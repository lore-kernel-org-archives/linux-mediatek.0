Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97D8C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 05:45:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DA4D2251F
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 05:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DA4D2251F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nTocSie7f7MOOwDWNfI+r5DQKNAVC6ZEcvzaA2KW9MQ=; b=vbK2pgi78TZARGHTOia1eDRZ7
	qbXimMZGJzj1thjt6+eglfbX8SsqChqIn0wasOi+hYBTB/r8ounpTGnvowTMgn6dqtRA+jaHcEIyI
	VAzFluFnq9p+JBOaZCvL1hlC3ZX3x0ycuu3IDMMFdqIgUKH1/ZX9Xw3YWZB1zigRiEwNSo/VgDm2q
	k45MNK+368Kj+nQXkwJV21JzdQyKe8UgqHuHF5xsI5qDjrGhFDkTxCk2Rw5NgwdBJhq1MUYzrBaeP
	GX7yKBSpoMlLobyv9XW0DoAWnrDeut/RF4o6lf7V5LmcXezb5hjoss10pYQXS4GVgIv/ZNZ5OjhjP
	h6hqKbQAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyq0u-0004Ln-RS; Mon, 11 Jan 2021 05:45:12 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyq0p-0004Ji-Pj; Mon, 11 Jan 2021 05:45:08 +0000
Received: by mail-pj1-x102f.google.com with SMTP id m5so9838168pjv.5;
 Sun, 10 Jan 2021 21:45:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hAuWqa9zlPPGWTNtjhAqXZcvz6sHDTbdxmpDtENLE64=;
 b=rVbqmT/X02rO8QBcLBtux6QeipDc3s5TLMhcnvsfAnV0FdYwRR4249B8XlG0gTcLYd
 c9ZL9CdNUraHUjRWCVo8yDXS3mIPiuqp7gkFcOBSStM3l8dnoIOfdUKJqYe9h0ladMAH
 VRWJSUALWmnPTCPXZZele6O3aQIwtlZqp/lGa6H5OLcaGaRMYOtbCneNSSghgma78Ux0
 nFN4zeRq1Pq02ync4HzngCCIc1DiaVTqQr61kmqgd08oiTmig90ol8sU5G//3ImlRBr0
 bVIiUwZ/z38PAoDYNijItNCO8q1+cbF3ShxzHfozfg22e4JDc2ig/QQ4UGa/+4OmAqER
 67gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hAuWqa9zlPPGWTNtjhAqXZcvz6sHDTbdxmpDtENLE64=;
 b=ggnVAiZvij0U4zlbVuNmDz5FgbdBWTBj3lnrXnLRPMkTHf0WrM7DD7PYDagv6MyeHP
 Y5Fqz4U0GGpd4IlvevFrnSeP+z7OMEOKL7tpGxtfWBA5gwXjp5wt+8C7rKB6ZPM/cZqu
 LvmlgvnNyBHnFOHgT89zzJKC6rE7SThyZjJcHZF+NO+EyeVQGNIo6DQuhlW8x0AChf2c
 79baaC9797A+Kfw8oER78i0BZ4gZCtGw5ysmQ/y/ms84WJ/7B7o4CO1Kekcoj/7Fjl1Z
 /6VmqiUb8HVjrUYkkseZdrwfwKNdwyuITV+npFEg9K/HXZdz56aGwmEkJYb+uCI376bN
 EMCQ==
X-Gm-Message-State: AOAM533jtYJ8kTXuK0HgeUXg687pCkyl5kPplLtoaeQiTg0rqNDmehcd
 pxKMHgyXVRTaB/N+4KzAmWZxKutoLg6enmTQ
X-Google-Smtp-Source: ABdhPJzo3wpZfqA6rcjyBlf0VOquXBGwi2+VZQkVOwsgg4IQXYtz5suctAmJgG79C9X13kRDPkqZLg==
X-Received: by 2002:a17:90b:1894:: with SMTP id
 mn20mr16282586pjb.100.1610343905989; 
 Sun, 10 Jan 2021 21:45:05 -0800 (PST)
Received: from container-ubuntu.lan ([218.89.163.70])
 by smtp.gmail.com with ESMTPSA id q16sm17548005pfg.139.2021.01.10.21.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Jan 2021 21:45:05 -0800 (PST)
From: DENG Qingfang <dqfext@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH net-next 1/2] dt-bindings: net: dsa: add MT7530 GPIO
 controller binding
Date: Mon, 11 Jan 2021 13:44:27 +0800
Message-Id: <20210111054428.3273-2-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111054428.3273-1-dqfext@gmail.com>
References: <20210111054428.3273-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_004507_880951_4377C930 
X-CRM114-Status: GOOD (  10.85  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add device tree binding to support MT7530 GPIO controller.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 Documentation/devicetree/bindings/net/dsa/mt7530.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mt7530.txt b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
index 560369efad6c..de04626a8e9d 100644
--- a/Documentation/devicetree/bindings/net/dsa/mt7530.txt
+++ b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
@@ -76,6 +76,12 @@ phy-mode must be set, see also example 2 below!
  * mt7621: phy-mode = "rgmii-txid";
  * mt7623: phy-mode = "rgmii";
 
+Optional properties:
+
+- gpio-controller: Boolean; if defined, MT7530's LED controller will run on
+	GPIO mode.
+- #gpio-cells: Must be 2 if gpio-controller is defined.
+
 See Documentation/devicetree/bindings/net/dsa/dsa.txt for a list of additional
 required, optional properties and how the integrated switch subnodes must
 be specified.
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
