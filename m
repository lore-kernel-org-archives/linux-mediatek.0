Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B517C04FFE
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 May 2024 16:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zu3t1qGKiCHdEeShUHBMRSBx5w0/UYs7wrInBMlDHyw=; b=KOK8YS1yS1pObC
	Uo+VVl3B/RNsCtBlH4J42scBFUhnMIB58Mkr0BCZ1nD42mdyl2I0WxG3ArdvkLLAjYA5ycowlNAkY
	5A5plqNYyNuIKtUTNKDEkRDNHFprp2ZbIZPUvs60T0Ghiu1TPmaV/X8+4qn3ebwd+oKyh3hnKzxDe
	mNBdIk4HVtz+d0VAsxNIZY2o1Qh6nOwvZI7ukXs6YGoL3d1CBH2c842UqWpxnWsFVBcd2N+G8bt9N
	ZHdV2qHWGKm5dfzMkpfmuuV3QgJAQlGX9mX0IAmmAGBQhvJLNmW5A7fUzzyTuRwFUnIprePR3yKcF
	fJpRuvbvT23Uk4S7SpAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3f08-00000004psV-2bl7;
	Sun, 05 May 2024 16:46:12 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3f00-00000004poN-42KF;
	Sun, 05 May 2024 16:46:09 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout4.routing.net (Postfix) with ESMTP id D22291001BB;
	Sun,  5 May 2024 16:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1714927560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zu3t1qGKiCHdEeShUHBMRSBx5w0/UYs7wrInBMlDHyw=;
	b=t3cwjSYgbuK+d9TwB9w1UPmClSlr65BlMdK3z0HgTDwICHF8su+pk0o+C76fKi9lSjiGa3
	b9AaN8KwNaYViltpoWnBWVwrptCNgV4ZlDUd4yuY19FYyOKYzDuyI/nkDgdaHfz7SIzeO/
	wTqcZmqMBWrE1hNH6sn92/Bsc7/5Mgc=
Received: from frank-G5.. (fttx-pool-217.61.153.24.bambit.de [217.61.153.24])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id ECA573604D6;
	Sun,  5 May 2024 16:45:58 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [RFC v1 1/5] dt-bindings: leds: add led trigger netdev
Date: Sun,  5 May 2024 18:45:45 +0200
Message-Id: <20240505164549.65644-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240505164549.65644-1-linux@fw-web.de>
References: <20240505164549.65644-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 52850480-9ab4-47cd-8ce0-2b51c8b97ef7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240505_094605_178900_D29A00DF 
X-CRM114-Status: UNSURE (   9.36  )
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
Cc: devicetree@vger.kernel.org, Tianling Shen <cnsztl@immortalwrt.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Eric Woudstra <ericwouds@gmail.com>, linux-clk@vger.kernel.org, linux-leds@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add led trigger implemented with config-symbol LEDS_TRIGGER_NETDEV to
binding.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 Documentation/devicetree/bindings/leds/common.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index 8a3c2398b10c..bf9a101e4d42 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -113,6 +113,8 @@ properties:
             # LED indicates NAND memory activity (deprecated),
             # in new implementations use "mtd"
           - nand-disk
+            # LED indicates network activity
+          - netdev
             # No trigger assigned to the LED. This is the default mode
             # if trigger is absent
           - none
-- 
2.34.1


