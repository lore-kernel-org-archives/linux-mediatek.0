Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C70C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 13:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJjJi/jD7zoJ80j1NB2hsX8d3IFWB26lCfmvanobgFc=; b=K1UoQTD5tIuVoqkj4BD0+3tvCz
	Lrpc1+15iSvrFwzsFbgX+Y7MWeuWO7BCQUD+Gvc4jyhV3ca8N2k6dXHzYXdT2i6RFocTu0YX9QP4F
	Agx4eSgpjiaTB104dlqYgD54QS7L3MtTTfa4AwtwFzbi3sR2fDJyHHUXaMKCAh2wbhahGRn3I+PEY
	jFZ0N0Ck8UluTFg5zp+Id3KlBHUAm4Pi44Ny+xsUhnEnP50KBRLH1oXHCtu0w31CwNfjRyURRBYc8
	LytwXFGkDRP+HJueSn2wRIdtWd2CC2oj1UBDPg8qznP4ECkV+ncZm7Kn3TTEhXAHznqjY5Q0YXSpJ
	zbD0P48w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXHo-000M5d-JW; Tue, 07 Mar 2023 13:23:24 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZXCg-000Jft-Pe
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 13:18:11 +0000
Received: by mail-wm1-x333.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so10386476wms.2
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 05:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678195083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aJjJi/jD7zoJ80j1NB2hsX8d3IFWB26lCfmvanobgFc=;
        b=km89PlWfqZbqxuCY96wokhG3NILnYs1FkpKTahAPUtPzn/JrO4yBxMuWb4ZuYyFQTb
         s0DXPoDXxPC1BU3j9F+FatxADKGJsFZgAf0BnF21eKSENwG0EVihHkruXlR4qYF3KD9a
         JC1VxafgACDTDBmNOPUS+rk6KlKDKEUQtkilHwF1WYAWNvm44/DK85/zL4G6mLdxvBaL
         lyNSynI8MLl8xqtZB626a5HEzo69wKXa69sQ5z1HILYAR6fwki9/LzKDwmceP6VumkXF
         XNRZxNFqbPKbUkz+9r87lYFQ1VM/k9cUJboo7FLVojRD4fE1QmCfAalC/8mvWeFF3mQj
         6o+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678195083;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aJjJi/jD7zoJ80j1NB2hsX8d3IFWB26lCfmvanobgFc=;
        b=KFON8TiKTHRBdcacqivJOaQ/87AiqbPsliTZs3Wik6ryoRGsZy4q9zIwg54J+VkyQ6
         GfMkL0ArKXDRNpGd4+ccOiJb5TgPTfu8rtM07IJEPj8v1PfIdW3x4RK+uBdECy9vuUjS
         jp9j2YoV+FDk7w5g/gpC0Ll1xrFzH1uYd4+YmIXLtNxklCcH2gVN/Lbvd4U2WYgRVMif
         pZYghAcmhIEynXWWZhla8yh2EcZ03pcaelake82p6LKfvXaJuHhz9rdq5nJv38PnvoTR
         jpGnZ0Y1Qf3Lf6h3bw37W5LkOgjA/ba9son3g0cAMMqFMYymUp9yIR4gReMF2ywu8KQl
         gUfQ==
X-Gm-Message-State: AO0yUKU3yxi5tzfUxyxcteIrHQuwWuQFduggWcs4R4HHIQQQfMQEy38v
	5neB+aNPIrsXC0P+UNk4oHfnVQ==
X-Google-Smtp-Source: AK7set8DDYX66nG0msdQYq6P9pgzNizADGbWf1Lun3UGPnZzP5PHZH7wcfDGsZnzzX3hkBZafVadbA==
X-Received: by 2002:a05:600c:4687:b0:3e2:201a:5bcc with SMTP id p7-20020a05600c468700b003e2201a5bccmr12836559wmo.33.1678195082918;
        Tue, 07 Mar 2023 05:18:02 -0800 (PST)
Received: from [127.0.1.1] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id hu21-20020a05600ca29500b003eaee9e0d22sm12986242wmb.33.2023.03.07.05.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 05:18:02 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 07 Mar 2023 14:17:33 +0100
Subject: [PATCH v2 04/18] arm64: dts: mediatek: Increase the size BL31 reserved memory
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230203-evk-board-support-v2-4-6ec7cdb10ccf@baylibre.com>
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bernhard Rosenkränzer <bero@baylibre.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chaotian Jing <chaotian.jing@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, devicetree@vger.kernel.org,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>,
 linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=jc8O8Cu6v6QK5aTt3UJ8M0QNPMTHLmcDIgeyPjVKMdw=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkBzmEcV1JZ2uiyH7wxNfPDxn+nJ3BFTjExeREhmqw
 BgZZ9ImJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAc5hAAKCRArRkmdfjHURWSuD/
 92Qh8UtfdeQJyr1MWsUBmjifPfD2epW/4/7M09tz/7AnUQzg37eUDlGwKcfAzE4qFj6sSjoXgcg+Cr
 zpdF1rPt8PBPlejX8Ip96rMH/y8XKYlymgGJksKVy5JSC2C0hTKc9BN44dLXbldIoPmyYPOrfjtj6u
 /y3dhS+4JFNpWOJdzVM3+AEqGbkuPkrBwyCQKP9taXIm8y4zEg5vFw7OWSgyyJg4CNnRzC1qYzMuIu
 AwDjKJ/d0sftGU1I7XLX0TOpKogejBzluwsOVI1Ds6wWYOYcv7ZcKf63Ittd86W2bmRuH5STE/Fg5P
 Z1Pmhtpzkz7VVxYQ05G932yiL+K0ln8vvRCFIXRXANDUVi75pNnfJMcmf6QJ1APSnKEQkZJWqOaGV/
 JoplZ3/D0H36llyfQF1sGbHipXHP+nu0+OZno05YfHpSpMOwjG/4fDot3vvll6fHgqPiPztmaw2UXs
 66W3bzcSWIej6f4ZGb0FtSZXE3h/+5YYMqa5StnoTkM0igFHuqMYrtBPljD3ZU9dNVDiPHABCgDU6/
 kzbvpODQQaBMoRcOtlSgpoQ53KMqC9jWbrMTw9SuUj3MVx66S+OBvnphZRvg7+w89HwOn2Wo+OPPY3
 us/kHbjKFvUHmeKqPBDTU07HJMh8J/b8Oh18T9DfjtU6+iOzLHC5YFTEuZUg==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_051806_960340_DC20273B 
X-CRM114-Status: GOOD (  12.19  )
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

From: Alexandre Bailon <abailon@baylibre.com>

The reserved size for BL31 is too small.
This has been highlighted by the MPU that now restrict access to BL31
memory to secure world only.
This increase the size of the reserved memory.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index b68aee8f229f..fc7f6d8ae173 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -65,10 +65,10 @@ reserved-memory {
 		#size-cells = <2>;
 		ranges;
 
-		/* 128 KiB reserved for ARM Trusted Firmware (BL31) */
+		/* 192 KiB reserved for ARM Trusted Firmware (BL31) */
 		bl31_secmon_reserved: secmon@43000000 {
 			no-map;
-			reg = <0 0x43000000 0 0x20000>;
+			reg = <0 0x43000000 0 0x30000>;
 		};
 
 		/* 12 MiB reserved for OP-TEE (BL32)

-- 
b4 0.10.1

