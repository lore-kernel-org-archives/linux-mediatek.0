Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75078C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 13:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x5y+fdEItm91yXlNSpZrwh5M2BvD0ci41lKh8d9+K5Q=; b=rZPl5JOzIhDs+U
	984moUDz7M0dH60FbE9hjf24ZnlBCa5+///UshgZfkmycqKkkQxwMDsLIz/ggmtZ5BZLcEXURDurI
	utXSM29wpwA9wYQqFOiQ/etWe/l1eYRWGRcX7FKxc85Qe7FwQ6etQrUGDvw3ATC+jpxiSyuMZokC+
	eNM4oic8ac7/+0PFCTMQuGVN9ypGaYmlEsLkhwuq3lz/8ghR6QncHufwI7Cly/W2Wq8/726azw2T4
	s6gV+Gh6itVryA49Nyt0Z0jUrCjN3FAAllYvPNYBC+hq3WpSeNgFG9+g0IXcSxM5GpOxQp8nf+pIp
	sPg27n/t98JGi57uNBtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njLVW-00EiTt-T0; Tue, 26 Apr 2022 13:45:34 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njLS4-00Egbe-E4
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 13:42:02 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 o12-20020a1c4d0c000000b00393fbe2973dso588112wmh.2
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 06:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lqk8ZG0qxpIIDvSpDmpiW10RXEh5f90c5tYGoIQTeBk=;
 b=Ld2I5By2ve8Ct4dPJ90lZhxgNO5il6+Sl6Mx4qVGQHec2ojQKQO7x9srGnXiJ8cR8F
 MQMj5i5gnGyXWfpe2m4fJSzW3QxxYFrSc1ghc0Em1Vw6bPvCRPSOFAqVK5PYs/wsWZCL
 +ITEiXeZKbHEvx6ra2hivQCnxe/gC58Lb9RigpjKQDCDXR/mqG5xJJ5nfwDoiAI+XS/M
 E1xYhNq7r98BwE+wj6EZnEws6OUIPejXyM+VbyeYnp1bjkAr0zu1mBBC2KS8alhLfEdl
 MNh1VPTVWNymyZ1W7GssJYgh/urf6MF0P8DtU1AObKt2pk9W72l32QvgsLk066mqXX8P
 igDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lqk8ZG0qxpIIDvSpDmpiW10RXEh5f90c5tYGoIQTeBk=;
 b=7c5nH8XpdwVIzGh0XiJUEY4b1l7lTlOC2KNJAq39BAOj14nvFW1sClsne/lRO5tvPy
 iqjnNM4mw2/QgP/roqc+a6m/JP5LHbui+8J0CiJ0SnktI5eQEjXGjzFyuDyqiVRmkFMY
 jNzcnLFbGGPUJk9Vve+u411Qio278gm9L1NJxXTKNHvUa9OoSNG54nQwbnbWffb/HmTh
 u1qpeJU8VOF65vHCl+N4OYN7A6ksy0TdRBlBmnnpKg4pAvpe5+B9FoY0UZT5xSuboW1Y
 g89eJ/Uirm7RZYfJfovYa2qRPffDuk8hD4DN1WgtYtRNCPowz2gsRB75xlFQnQS6tmfF
 bcQQ==
X-Gm-Message-State: AOAM530EVIubBSBnxmStGS8UW8O0vaVqPLYonk3KwWlLLv/EcjSCObWC
 h2thsRxxyKxut2QBnUtC+oF6tw==
X-Google-Smtp-Source: ABdhPJzIUFpskUEdsGQHDHpN9fuLdWE/J6FsWPSN4vkc1wjnQyDdu6kOKJ2iOFA8Zbk+ODv7dlvlyw==
X-Received: by 2002:a05:600c:4e12:b0:391:18da:1883 with SMTP id
 b18-20020a05600c4e1200b0039118da1883mr21617051wmq.101.1650980515586; 
 Tue, 26 Apr 2022 06:41:55 -0700 (PDT)
Received: from radium.lan ([88.160.162.107]) by smtp.gmail.com with ESMTPSA id
 b6-20020adfd1c6000000b0020aac8a9946sm13628475wrd.47.2022.04.26.06.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 06:41:55 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] arm64: dts: mediatek: mt8195-demo: enable uart1
Date: Tue, 26 Apr 2022 15:41:05 +0200
Message-Id: <20220426134106.242353-8-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220426134106.242353-1-fparent@baylibre.com>
References: <20220426134106.242353-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_064200_518540_7A288AF6 
X-CRM114-Status: GOOD (  10.23  )
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

The UART1 is exposed on a header. Enable the uart1 node to be able to
use it.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
index d1f650d99d7e..aa41df865c9c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
@@ -520,6 +520,12 @@ &uart0 {
 	status = "okay";
 };
 
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>;
+	status = "okay";
+};
+
 &u3phy0 {
 	status = "okay";
 };
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
