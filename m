Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E88C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 19:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Smi2COAdQAVoYWiGr1M86lAErU5XY7rmE/j5fDLbhp4=; b=sEPlEocBgJ7k9u
	En9EMhhC2OInENt2UWefYex9xgcxm89FZ45mBJkN9s8AVMRf5eNemJGNFJ1XLKHZBXUjOcZ0gw5vT
	c6UtN2l0tWq8G0blC7kac3XxlWQWx81KNe+uLzAhlNofyyoqQCcnG4QgF6V6k78pP3166JtIB7FlV
	YCMtdJuNovnBslIN13vS6R6BNUM6AzEPmMwho2RkJ20JxhlLazk/SJT62/zUjQjyZ3T9hgzO9u/Eb
	HB6/JaoV+F7uQz6FR6WlA1qopBbbUBqoJQZqqjbwTRyR7pLivzGYxlBwAhSKE7sSnOwGXTZ25VgdS
	eIFCsn2EmACZd5IQGU3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvPRs-00HOLt-Ro; Thu, 09 Dec 2021 19:51:24 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvPRp-00HOKq-Sd
 for linux-mediatek@lists.infradead.org; Thu, 09 Dec 2021 19:51:23 +0000
Received: by mail-pj1-x102e.google.com with SMTP id np3so5221219pjb.4
 for <linux-mediatek@lists.infradead.org>; Thu, 09 Dec 2021 11:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1xL00HEz2mIMU5pdZJruClkdf/MyXgTu87e9xQELm18=;
 b=WZq6rypW7k+AzsUveoK3r9SKgtfhYIfGCoOT56YzjLSEpDm2YC/7rj2sgov4HqOfNu
 Q7FLDBsSEjPaCr936M1+JJ5ev1O3fWAoBWVyrzb6hEtrTstcnEUPAbAWgLkGaeUHheuu
 fxIBaBgQXkoFsdolomVW8Dr+F055S6l0K2icA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1xL00HEz2mIMU5pdZJruClkdf/MyXgTu87e9xQELm18=;
 b=MIEqsW9bVIWe4EepYk3Kg1n4Cvs71CPLlffSMAxMgd/5e3XixBYEtUtOCvZYywxzi5
 dRdFYF0hZMbv3bj9stzMuAM3q7EcHhGwNh3ERVkIuSkQi95hpjX2Jeocl+iPQNNYUxnp
 tB5jW45xTF164HiKaPoDuJVyznS9rB4SmDNGzDXI0eHpCO/H2a/G1l+doLRIFPRUz2Ul
 DzO9b27QqZ+mxntgiLDK/34rAFyx6XFxaxZqMhJ4dvcpMcrGrHwTLCGmf65+io1UEyvd
 4A41Hmyj/qXNQp0WrbNxQmiiFEFdy/azDTIXntx1jPcSfc+CRpjL5rsmhOCXOElisAik
 lgRA==
X-Gm-Message-State: AOAM531jBVddHXhPLtbpGx3te5jnr/Tqv+kxj4D1WKNUptb4NEC6kxYx
 wyrC8ZPI+dO4od4GpTONcTkNOw==
X-Google-Smtp-Source: ABdhPJzR/2Bd1qC5yCsKlKBvm1I+vCWtXKI31p2KN54Q+o8D9XrSASm2Q4rvj47MDjeVS6Tu+DEFgw==
X-Received: by 2002:a17:90a:7e0d:: with SMTP id
 i13mr18203822pjl.171.1639079479659; 
 Thu, 09 Dec 2021 11:51:19 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com
 ([2620:15c:202:201:14a7:14ad:d975:ffa4])
 by smtp.gmail.com with ESMTPSA id w142sm506410pfc.115.2021.12.09.11.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 11:51:19 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Prashant Malani <pmalani@chromium.org>,
 Alexandru M Stan <amstan@chromium.org>, Benson Leung <bleung@chromium.org>,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), 
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2] arm64: dts: mt8183: kukui: Add Type C node
Date: Thu,  9 Dec 2021 11:51:12 -0800
Message-Id: <20211209195112.366176-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_115121_935661_F0B2A3D2 
X-CRM114-Status: UNSURE (   9.16  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a node describing the USB Type C connector, in order to utilize the
Chromium OS USB Type-C driver that enumerates Type-C ports and connected
cables/peripherals and makes them visible to userspace.

Cc: Alexandru M Stan <amstan@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---

Changes in v2:
- Alexandru mentioned that HW specs suggest preferred power role for
  devices like kukui to be sink, so changed try-power-role to "sink".

 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 94c13c459194..0f9480f91261 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -886,6 +886,20 @@ usbc_extcon: extcon0 {
 		cbas {
 			compatible = "google,cros-cbas";
 		};
+
+		typec {
+			compatible = "google,cros-ec-typec";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			usb_c0: connector@0 {
+				compatible = "usb-c-connector";
+				reg = <0>;
+				power-role = "dual";
+				data-role = "host";
+				try-power-role = "sink";
+			};
+		};
 	};
 };
 
-- 
2.34.1.173.g76aa8bc2d0-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
