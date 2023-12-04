Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9953C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Dec 2023 20:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2MNjE3SeFK0nJKBmYRJMHyr7VIIHtok8kfFl8JThkGU=; b=GS9UVT55L6nFdJI6WhVXlwe2uB
	kznu6wgvedOVPqpz1nCjlhsSgF4jIzSi29FAg5+gsO6/I7hx8wK5NFv4PDVc+NJwuRX1HVGtbxAi8
	SMIQ/wqU8jL1Cd5cN888EBw200JBEwSUeEnhoW9RxhAOJeeTXCCHUKAmOd7ILqEZ04CvLTPQcrFAj
	MLDCFVcOZv+Sv7j7HSmx3Aup4m2YQk/+Mr8pmQCYy0+GEg5JIh5TFEpZabXWXebhAqbBkYM6YX1Mf
	QjFCAQwmHzEhifDN3muWoq8R4T4HTqh/x8imbH8vPu/CH/aeZOaLOIElcMO6pSzBSn/sqYBvZok+D
	CJ3s6eeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAFGD-005WGd-2s;
	Mon, 04 Dec 2023 20:09:46 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAFG8-005WFH-37;
	Mon, 04 Dec 2023 20:09:43 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a1a52aecc67so351036566b.2;
        Mon, 04 Dec 2023 12:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701720577; x=1702325377; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2MNjE3SeFK0nJKBmYRJMHyr7VIIHtok8kfFl8JThkGU=;
        b=gvsrIsrSyRncsiOlOK6mwUqGCJysdrqMMOAsCKhY0GLzEI5Pv7sXjtT9QR5fCQm7+9
         aEbaLNgEJtRCM4yFDXqUYb9/1w0w1uckSQ84C/B5+Bybm+Rv1s3rUKUw/KUXC+zN7U+L
         jJPW5TPCkv1SS5AQwtue14MvhOfC53eFrpH/zubST5G5tCMUGdUQhg3YDPTKdt/jdUNG
         sqBSkm8Izifc6kXVvLdYMaxJZA4GhIv5q3DQgn0kjfz/VCNDVSCMVbBPh4azRbWzbpGW
         9zBUXrg/m1hHZGcFnXu8OKf6kqOJlUvDYno/fTPTBGegDJNUY9cSoNYfovIrKtEk8Tfd
         QR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701720577; x=1702325377;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2MNjE3SeFK0nJKBmYRJMHyr7VIIHtok8kfFl8JThkGU=;
        b=U//X9qU3+7HjuIv97J8yfrwMRQqqJYi7E9zjsxunuHxYSlqcCkjXIlezVdvM10xkKi
         SPxElMBZIkU3SJj7itAijnBImra3uXhEt654GU1wZasTgHT2P1GwB2bRibzEWUP5eHC3
         ZkryllrVMasiRiHmKZCK3PYqSNe8BzGALsNSg2gNZAZ8WY53z/8z7HDQ8E+wm8704MX6
         e4aovfcuePt83uZbciOL3K4ovuak3CVORLW94o+w6JCoM8LwbS1pV9DdR7qps7TTH1Mj
         +t6ibypaZpsbnjOdmqGRn2UAo6X3DWQyCp9zoLuK1xe5IhuzSYo+tCHjfNXvhy3dQCr8
         GF2w==
X-Gm-Message-State: AOJu0Yy0HrS+4tXaqYooEXdSi93qp4yaTzo68kBN/gcyPmmf+yvzYP34
	ucxycREPA8rbR3c0RS9X3L8=
X-Google-Smtp-Source: AGHT+IF6M+0ELigfCC740vzy41FYXkfYexMnqkneCjUbUz/KI9vUV3njKfj0W8V9eRTA3Zygn5UL4g==
X-Received: by 2002:a17:907:3ad1:b0:a19:a1ba:8ccb with SMTP id fi17-20020a1709073ad100b00a19a1ba8ccbmr2852108ejc.105.1701720577156;
        Mon, 04 Dec 2023 12:09:37 -0800 (PST)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id lt12-20020a170906fa8c00b00a0290da4a50sm5620666ejb.186.2023.12.04.12.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 12:09:36 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	=?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chris Morgan <macromorgan@hotmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sean Wang <sean.wang@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V2 1/3] dt-bindings: vendor-prefixes: add acelink
Date: Mon,  4 Dec 2023 21:09:05 +0100
Message-Id: <20231204200907.5687-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_120941_619219_98418D26 
X-CRM114-Status: UNSURE (   9.93  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Acelink is a Taiwan company providing network products (routers, access
points, switches, cameras and more).

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 309b94c328c8..503a3caf6fc9 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -39,6 +39,8 @@ patternProperties:
     description: ShenZhen Asia Better Technology Ltd.
   "^acbel,.*":
     description: Acbel Polytech Inc.
+  "^acelink,.*":
+    description: Acelink Technology Co., Ltd.
   "^acer,.*":
     description: Acer Inc.
   "^acme,.*":
-- 
2.35.3


