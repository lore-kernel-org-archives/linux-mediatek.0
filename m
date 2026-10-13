Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E628CC6B03
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2026 07:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=98Qa2o/S1XoEMPrlowsac7BQiNC+nqGa1kAsrr8UqXY=; b=f5FrL/EuU6gqDpJ62salVU44/3
	7Hzea8NAuuvCEVpspbayqvAC6pzpu7pV5iCo6zwINN9pQQJxdrsjQd/NfG8ZNP1xa6UhbfacSEc2G
	uB6Me7yE0L9Ia1UCt9xUus4dCIc8Gp5XaifUFPPY2jpYlsn9T/j3jgErAqWNMw2fZJQCV5LYMlq9m
	ByEca6DTae24YMRiWG0DT3zwlwk5O6/XXq60eoMdJbqC4uMUlGU8F1erXnIb+A2YMM3WkAYoaJkEa
	lhEwHVMqL89IynsVa4yulVwX49kKeBOHGY0aYfcw+HPhij6a9TIy7Q+lYEGtFxPmqDTmRghwvzG9H
	4Frp1ihg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXEq-0000000CFbb-1u9Z;
	Tue, 13 Oct 2026 07:47:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGXEo-0000000CFav-1Hmr
	for linux-mediatek@bombadil.infradead.org;
	Tue, 13 Oct 2026 07:47:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=98Qa2o/S1XoEMPrlowsac7BQiNC+nqGa1kAsrr8UqXY=; b=Z7nhkwDi9D9gHkR2B4X2kMhHE9
	aNU0KCxgNYTyC7DWL7z6E6bJ3tr7g9x6d37d8NL2aQsaOnzAZ7lAexOZRDP/jERk0aYLhXO0qxuG9
	RofjWOibG03tJG1E/jj7YaotHKUYp3AxVfNszLn2+hRWpnMeywtPDvY9/TbIRkZPoJRwpoYNfqNgj
	62PdLNBs1OXWve+vK+C7WnWBllxWS0CGB/kAEK5Q0HOGy/XaKbe/bSpJRBrprONvC65FNe672gmLr
	IYpAjzv16jU8mJ8L9ddJ/3MVggZsw3tUFOFnMKZRwHUWwN+gOYiwOHIkPIh3rPfs4+2IB5S1m6dEV
	Gm5bWPTA==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGXEl-0000000FDTu-1D1W
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Oct 2026 07:47:53 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a1ad2e2391so2452655e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2026 00:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791877668; x=1792482468; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98Qa2o/S1XoEMPrlowsac7BQiNC+nqGa1kAsrr8UqXY=;
        b=Jqbfd2ZVcN9pofmX1E8QdjPB+PDGvTSJSTbo9uw5QgrCMVb6pC6tLfeXORUA82n3aC
         NAzU7SVEPJGu0d0g1/0x1OE8LfWOmjUWelC0T+TaUmVWZnzQeQUfJ42HCH59g3uv8Jkw
         Ujw1uWaHginevIVyiqlPbjZqbwzEbWQHuwvzRmIXG4rRBXzG6bxxGkGcoaAXk7KUDqcW
         2l1g3BAvWwGC22jJhNnxrnQEbUoq6hs3x1XRXw7ku8Sb0p213zqyawPpo40lDSZtmPm7
         Xn3BdeOZZxnJN2XYgrFhBiFp5LfwPzXay5ktEbYUayffemzpYkQkLR2EwSDUhSU9eAX6
         Gsxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791877668; x=1792482468;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98Qa2o/S1XoEMPrlowsac7BQiNC+nqGa1kAsrr8UqXY=;
        b=L99Gcb1CcDA6zcj1ZSfasdB3W0lLgpvp3HKq2Gem7iPA0NRrwgTD3kRP+rHbUZjFN8
         PEZgBvl4HCfXffjO+ogJ9yHkK7E/uspVsj8ZSbYuH+gdSDVwvBAWeXyoGKNidh+qxgk6
         c+bFWdhdHKQHjvk6mx2c9MaewdoA5gC+F8wpTkYQswmyMIgIk0P0xyEiQm6ybnFDZDQU
         OOXkzhi2XURdPZwTryvVyYBOs6A8XSPlJjJH/mJ+KXrHEhL7iUJzw682RxIRWVnysVXo
         2pua7+vfMvSFgpkaAbKbEtmhnrCA4RUTiJCe/WafZ0Rf/yFZkoPrLHbn5VnRuUUEfr13
         iA1g==
X-Forwarded-Encrypted: i=1; AKwUvBwFce57H9A1TwTN9nL74A9Zbo/6n+Q6QhSfXpW+iCYu9uUIqTiIiYLwoYTiwQukiNFNO12C8vYp4/uO+ANANA==@lists.infradead.org
X-Gm-Message-State: AFq9FYIFSqTlx8BhlIv/vdLuCKimNBH3cSww5AWcSQKd4MIUVN4IL9xH
	pCT412BXA31b9ozv5px7iVIVhKXtT6BxSQRnGH5ewvqPE+nStu+7yWD7
X-Gm-Gg: AYBFou1E3ibMCIqTSE6+lESDhez3OnN/2gaRJa5RX4A3Ktx+HLd1K3v2ylKNDqC7fFI
	TcI2jhO5kW9ul8G3KUUlLHczkfp02sQTSI+w82zytrNhsPrpTSlAmzzLj5rbeQ4obz1L/jJQac2
	4Fb7T0eGBqvUrEj+FVtYpsEUgFZRx/Y4Z4PCCDqt0vkAAwpyl8MdZH1AlJwqAIPQvR6oYkW34Am
	3gZ4g7Y6Se7nGRTUSE0xfZ99WHq5eNpKxq4Wg3Wav+21NmyViJNoukuQ1oG2/O364wUDUX6lm8f
	oVmvrzXmqmJ0Wa+nvGakM7uFZi3GdkF8z06z0gt+SMlurClPlCXbqJSBaLFjXLQ12hkJ9fKzZcd
	LxFiJIlmRvXlxeZALwJhV9lwMLaWwz9J2GxSEyYdJe0jFMXi/HAHQ4DOc/bRU+MiIpzYZQwzu3X
	GuLVj3p/g1QxfHx/is4DH76J2auIUUihjz6Sv4Q0EvSuEQ4rU6Uf4IVLVIyBM1CgBw9wUhRTE2+
	EX6mw==
X-Received: by 2002:a05:600c:1c21:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-4a18e4b6241mr274887295e9.16.1791877668407;
        Tue, 13 Oct 2026 00:47:48 -0700 (PDT)
Received: from LAPTOP-AVI.lan ([2a06:c701:4778:c500:c7f5:a913:e714:a9c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f249692sm274850085e9.3.2026.10.13.00.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:47:48 -0700 (PDT)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Pi-Hsun Shih <pihsun@chromium.org>,
	linux-remoteproc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] rpmsg: mtk: release channel OF node on device teardown
Date: Tue, 13 Oct 2026 10:47:44 +0300
Message-ID: <20261013074744.942560-1-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_084751_617354_066112F2 
X-CRM114-Status: UNSURE (   9.63  )
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

mtk_rpmsg_match_device_subnode() returns a referenced OF child
node, which is stored in rpdev->dev.of_node.

mtk_rpmsg_release_device() later frees the containing allocation
without dropping that ref.

Release the OF node when the RPMsg device is destroyed.

Fixes: 7017996951fd ("rpmsg: add rpmsg support for mt8183 SCP.")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 drivers/rpmsg/mtk_rpmsg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
index 1b670ed54cfa2..430a9b2aa7bb9 100644
--- a/drivers/rpmsg/mtk_rpmsg.c
+++ b/drivers/rpmsg/mtk_rpmsg.c
@@ -168,6 +168,7 @@ static void mtk_rpmsg_release_device(struct device *dev)
 	struct rpmsg_device *rpdev = to_rpmsg_device(dev);
 	struct mtk_rpmsg_device *mdev = to_mtk_rpmsg_device(rpdev);
 
+	of_node_put(dev->of_node);
 	kfree(mdev);
 }
 

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.43.0


