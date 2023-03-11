Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53833C61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Mar 2023 11:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c6tUGFbQ7oA7pUDn55v/Wy+VlBUMSyXyYmPtvu2ws50=; b=v73R493b1SFqWmbMmXVM9PrdQL
	Q+Zd159l83cN5bCCk67D9CqpEYOJTKysIKVcb0gRYTVI/JrUavmuu9gOJ0JUb4i7e/V6Gz0788hZ5
	Yv/CScX4oKQO656UjzhPxU85xXwBeBVBLPAL855b+sEdn7Ql2bCEPrMXMadD+qI0vZTw4i3iRUjtb
	LQk56qzP8V9UN4hd6sXILlvZTpNpM3ijDrv7mmX5juXxeM8DmlHgmGgFO9kezMSDp2dpnuf5Ie4LU
	yKKCOIyiyIBYvUecp0RAckNgJIP11T828HZEXCqbH8rr0LqLPHIyhA+A55kEbEgU+9HojbPKmmWCY
	PhvdND4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxD8-000GHl-Ab; Sat, 11 Mar 2023 11:16:26 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxAr-000F5B-Mi
	for linux-mediatek@lists.infradead.org; Sat, 11 Mar 2023 11:14:07 +0000
Received: by mail-ed1-x529.google.com with SMTP id cn21so532245edb.0
        for <linux-mediatek@lists.infradead.org>; Sat, 11 Mar 2023 03:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678533244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c6tUGFbQ7oA7pUDn55v/Wy+VlBUMSyXyYmPtvu2ws50=;
        b=yWfJY7Out3CLSvURy2RybRjEidhVO/LsVGJFdgbAa+h5D9jYNoCZ+WWjRxJaEMNzR5
         AHF/txrarIzqBQpbDHB6p2t9Z0JwTpECwOXzA5w/E7PPtfMuPamhT1gIwV9XCNd/k0TO
         guxePCLFhaVFSGDvnrej+2XHiSUfzbhVSjL9QGo7h57wM0/vi0ZYj/T/b64nP0ebtiAf
         FNCk/8F01LYXJGArb0gGwbV4KGUZ1VER6U3OFRW6MawsoLY4ZYPmnlk3UhbeRFXCfDjh
         riSSaZixfero/LblE/wyYAnZc8e9BKjFNu8VrvEbnWHGV/6AMzdNUPzeExmRLbwh3XTV
         xBqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678533244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6tUGFbQ7oA7pUDn55v/Wy+VlBUMSyXyYmPtvu2ws50=;
        b=0fc4QaBXeXg1rbYWz51MDQbuHz4FIC4FCoua72vHsXby9E3Neht0nSTWYRJMZXuXPf
         E4bht2y0DMyGvoyCKFcgEelsn42zoaIgrYJqZE/Bjy6LrMbpjqKfhJPHDSKTL1I99DZK
         5rxa60HSKXC3KmgltI7o9cUog05Q+ZOOfLvLvjICaJpOTjOroKvZv0QasCjiy1ZSsI2k
         m/7xXdEJu/MIpB86vduUx7dqg2SuVhiStqFBsZ3HmVE6uIZ8DNpGCmz07zoZCvbo8ZPW
         sNFNzHzuxEz2chVBVcZD1iB8WImyh3+nb7JREiosPzosIqu7/r2WbVe2wddERJ42iZVt
         VGUg==
X-Gm-Message-State: AO0yUKVDgELIZIhI+Ct29GRIWyWps8mnqfQ2K43JEZW5lxo9knjswnHs
	FcuNxu13lZ1RZZ9+GppzTQM2AQ==
X-Google-Smtp-Source: AK7set/Ym4uNmH4ker5UTWxzfE7MOeCqeY26Mt3utH2TftFJqHph2kbqZKF7D3tT1nW8fuqt1SHCRA==
X-Received: by 2002:aa7:c6c6:0:b0:4bf:1989:9e87 with SMTP id b6-20020aa7c6c6000000b004bf19899e87mr28871962eds.20.1678533244417;
        Sat, 11 Mar 2023 03:14:04 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:fa97:2d7c:bdd7:e1b])
        by smtp.gmail.com with ESMTPSA id q12-20020a50c34c000000b004bf2d58201fsm1053859edb.35.2023.03.11.03.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 03:14:04 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] Bluetooth: hci_ll: drop of_match_ptr for ID table
Date: Sat, 11 Mar 2023 12:13:51 +0100
Message-Id: <20230311111354.251316-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_031405_771174_A1810F6B 
X-CRM114-Status: GOOD (  13.22  )
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

The driver can match only via the DT table so the table should be always
used and the of_match_ptr does not have any sense (this also allows ACPI
matching via PRP0001, even though it might not be relevant here).

  drivers/bluetooth/hci_ll.c:769:34: error: ‘hci_ti_of_match’ defined but not used [-Werror=unused-const-variable=]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/bluetooth/hci_ll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_ll.c b/drivers/bluetooth/hci_ll.c
index 5abc01a2acf7..4a0b5c3160c2 100644
--- a/drivers/bluetooth/hci_ll.c
+++ b/drivers/bluetooth/hci_ll.c
@@ -786,7 +786,7 @@ MODULE_DEVICE_TABLE(of, hci_ti_of_match);
 static struct serdev_device_driver hci_ti_drv = {
 	.driver		= {
 		.name	= "hci-ti",
-		.of_match_table = of_match_ptr(hci_ti_of_match),
+		.of_match_table = hci_ti_of_match,
 	},
 	.probe	= hci_ti_probe,
 	.remove	= hci_ti_remove,
-- 
2.34.1


