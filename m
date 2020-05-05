Return-Path: <SRS0=+Wu7=6T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6CBDC47254
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 14:09:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A324820675
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 14:09:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G8QTjCZw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A324820675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cjBlOkijR5Fcw0q9aDk89xciKL2Sdf3202UeL3Ap4Es=; b=G8QTjCZwn1tO9B
	9MrDRZGvh5JKNof4/qrUd9Uctqd+J/JmKa0u4S9r4IbOdtoy3EHQq56TNJBVuEgtdluwGfd6B6jRF
	CRqvxMi6SdfuY+JODWRx4Yt/UXpBpRgZLMhxwAssGjMQ/LfP+XWjURN7dEjvvtxQaC3fcTSlzXYpX
	6UXEUmgS1KGvKghyqog1oH7TcgZc+3GP3NkOhlguTCXAu4BZxK7yADeBy5PgM8t5kJXBgURoRbBRc
	XEu/6von/5mQ1bCI84RISqYHAL1zFzyGEQnAGq4mPKs1F08ZSYb/oL1oYNllJ5717DGKjSAfRU5s7
	qPEYBi+aDiLPIdwsGFlQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVyGC-0000tZ-62; Tue, 05 May 2020 14:09:24 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVyG4-0000lH-CJ; Tue, 05 May 2020 14:09:17 +0000
Received: from localhost.localdomain ([149.172.19.189]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MOAJt-1jl13t3uIr-00OWri; Tue, 05 May 2020 16:08:53 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Light Hsieh <light.hsieh@mediatek.com>
Subject: [PATCH] pinctrl: mediatek: add pinctrl-mtk-common-v2 module license
Date: Tue,  5 May 2020 16:08:40 +0200
Message-Id: <20200505140848.554957-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:8x+ElLntw4n38VdOKQUn1jKkUwp0cPhTkte/vCk9MXw5FBuRYzO
 aZCQhDaNInbB9duIFcVfR+IrIflB0RYYyOkVYS+7peR9ZqSuhIWA6dAu6Kmf7ot1i92NWvY
 g4FHlV3Nxs5+999B1PWHrMh56vUvgHX/CSR4cbVxkw/sSiBqgJtnIGYO7lq9SLmnrmL6//Z
 vY9Ixf3Ex6196kbCI/h3g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zcGuDdea3AI=:9gaJ956+e/S10zq8UOB7AR
 ZbUbesdyNXz+lmJ0cSTddlrcznHhOKalZ1lW/bayZKFtHepB5SJgtExFff1e8kaB+fmQTgOrV
 QYvRc1Wm0rfQgZBSGJZX2YOK9lXDjtny/xA8L153JTjJm/QvEStKSRCsXMUpMQGKmDbggABSJ
 6neIeahH7BGIuHJs0Fir45FWoGg6/anKlb31ekSjm4pOStevMTmVC+lDMV0bP95Pd1mul7j59
 y/YryQKIyKKfsKuOTXQ6h+zaXUsgKXDofLkn6egv6vDfz+0RQZKGx/rAYHElCIXKpZMLmYL1S
 M/bObKTqpNgi19LZokBLdy1BveelcokBT0uTNFPaTMq1Mtk2D4A2uN1EkoYb2G4EaFLQj+TBI
 w2lbaF4Ihl80niu4bAyHI5gx6a+Wo+5mpV7GyxvT1XGLGBlZGSjwSVu451HDlRO4d+jHxSxfg
 B75g+s2zKXfUSuZ/1dAJGPd/IZZr2N+AbTI8qj+eBKv7bdOG0XB50FNFH0e8aNxzk8aNZf4dr
 zElEykIHEdaZba0MaFXH9ZTXmlFFcJjNLV7dlhUUiqieOOnfMZNMH8sPSoXTf+w9wMmgOw/W7
 c7+NQZqZgb3jIwNSsebo3NQ7GqujbDEQv1wHCFxWVzASUlFy6xAuf/vpb7z7MrflX32NZv4Qg
 GkpStsiq59TeUo3TyBesfD6QAsc4leX6g9tV83XTBOd7Quuk/Fe4e6GgJv0C9cqWZPNyjBaTf
 LLoqUYqdn6JVmbYkchP6+hbypYs0N858++nrLcQHQ40j1e1BPPjvvNSHtc1MiYm6mLy/7zVR0
 VakUMnxloNVNdH0eJnsGjvF/dgyYo2igsrU85G/lFPCccAnP4Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_070916_710123_906B6AA0 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
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
Cc: Arnd Bergmann <arnd@arndb.de>, Sean Wang <sean.wang@mediatek.com>,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Kbuild warns when this file is built as a loadable module:

WARNING: modpost: missing MODULE_LICENSE() in drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.o
see include/linux/module.h for more information

Add the missing license/author/description tags.

Fixes: 8174a8512e3e ("pinctrl: mediatek: make MediaTek pinctrl v2 driver ready for buidling loadable module")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 6ea40b501328..b77b18fe5adc 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -993,3 +993,7 @@ int mtk_pinconf_adv_drive_get(struct mtk_pinctrl *hw,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(mtk_pinconf_adv_drive_get);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
+MODULE_DESCRIPTION("Pin configuration library module for mediatek SoCs");
-- 
2.26.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
