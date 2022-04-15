Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DD92C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 16:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lqT+bpZzcUj5+mMfq0hnLf5m+9AE/efvW/dDebR1oTI=; b=tzPHmvInRh7HFL
	+4IoYe2mZNrLkhDPM01FdXy5yTIQPL3j7CptgdGoEHWQnv6D+J0zYblNNSQCid5QuhczmB7mHkasI
	cQhuTTJWz4MYmdqm1jghwwLcrbtrSDfYad4Vr4ILXMNubdjG3DMGM9LJ1X6wL8KJbpziEbXtI71Im
	9POpCylisjrxIVypc938AaGRdSDOuQ6njrlDnkmB95Mcb75eJCy5pa/VCS0CteHfkU4vSaNphOm8G
	HWQKfgShk1Ldw2gIY4aue5EzknAVNn1v8H5uv2ASaL8NSYumAPjvalpQioB1jLh0gP5zzWwHhja4o
	tOo2lel1PF6/HdCdd+3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfOUw-00Ao3R-5x; Fri, 15 Apr 2022 16:08:38 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfO0I-00AbMj-Nk
 for linux-mediatek@lists.infradead.org; Fri, 15 Apr 2022 15:37:01 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso5226835wmz.4
 for <linux-mediatek@lists.infradead.org>; Fri, 15 Apr 2022 08:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JhEtTen/OTg3PJJ7iqAml5q25LdqyTzaqfuuqefiN5c=;
 b=2F5kkZXslQBZQDEVI1eT07zwv/QhNjHIl/mMuqCoLThy3XYmXTZhUxRkwe/wXR72d+
 H/oyq0BkXdf8TgyvhP1C7zlIoaFLiLy40XUXLZy4iDEYtMGwmpBZxZ0sWa+latx2rykY
 9jiuwJt6kl+GEOJW2pDZFz9mmKrAQP1/W+WMrkYr8GcxAGmct84yEo99m8HtwwcGIVRj
 uFRJUnQunFxy8fQZQuOKF9VJMhoZScUKJWGMp5EZk0W225l5nEvO7S+mWNW4o9K8bCz4
 /ZeCU/NFpn5O2XbyA+/et+I+vj855vu2fIsyOhLu+rzxjsnSTEkNn7xejiiBohmy77Rn
 EeeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JhEtTen/OTg3PJJ7iqAml5q25LdqyTzaqfuuqefiN5c=;
 b=yznqnoU3ADCcmhAyKTwxDAqxjj4tWJRrf5o8MrJCHR5nQjQUZwG4MdIrfWLdHi544z
 y5XG9qEciulxxDtNAO1RuujYFzx9ARs3SJGVzDHwTmOeVHTsXDYlSq1e22+FuF98MqsR
 se2Dg7DqbCIyokB58HmphTcQwqo4B+2ZV0gh9wB0zK6Fc7iSFl7pGGfRxnoyWmLvILdh
 1cGbMWv3PeC7KHZkihLUCs71NdAVABpuRAvpl1c4xla68voCmQUMxdsFnzA+3CoEiLC+
 ikWugA2OhEx2jjAMNOFnwDbLmD6+rmTbPJseirCUT9RNXqcHKVBRQNvxpWQprvXzgx67
 2Y3g==
X-Gm-Message-State: AOAM533XAflNeRwyYI8cWoV6p5uCrEvS8voRBAvdPS9wPKs0LjwR37DT
 efXfRWFH1mhoKluKVDrDznijVw==
X-Google-Smtp-Source: ABdhPJyh7Z0Z00QWiNLIy+5j3/O8XdYvaMyMfjr7hPlt34IcdXBMTAfRZ5G2nW7+HUfJyvgJOzNe7Q==
X-Received: by 2002:a05:600c:3c9b:b0:38e:4c59:68b9 with SMTP id
 bg27-20020a05600c3c9b00b0038e4c5968b9mr3758734wmb.105.1650037015922; 
 Fri, 15 Apr 2022 08:36:55 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a7bc018000000b0038a18068cf5sm8459292wmb.15.2022.04.15.08.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Apr 2022 08:36:55 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 0/7] Input: mtk-pmic-keys: Add support for MT6359 PMIC
Date: Fri, 15 Apr 2022 17:36:22 +0200
Message-Id: <20220415153629.1817202-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_083658_843049_6F49931C 
X-CRM114-Status: UNSURE (   9.81  )
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

This patch serie adds support for the MT6359 PMIC keyboard driver.

The last commit has a dependency on:
https://patchwork.kernel.org/project/linux-mediatek/patch/1622011927-359-9-git-send-email-hsin-hsiung.wang@mediatek.com/

Fabien Parent (7):
  dt-bindings: input: mtk-pmic-keys: add MT6359 binding definition
  mfd: add missing defines necessary for mtk-pmic-keys support
  mfd: mt6397-core: add resources for PMIC keys for MT6359
  Input: mtk-pmic-keys: rename platform data struct
  Input: mtk-pmic-keys: add field to store if PMIC has key release IRQs
  Input: keyboard: mtk-pmic-keys: add support for MT6359
  arm64: dts: mediatek: mt6359: add node for PMIC keys support

 .../bindings/input/mtk-pmic-keys.txt          |  1 +
 arch/arm64/boot/dts/mediatek/mt6359.dtsi      | 15 +++++++
 drivers/input/keyboard/mtk-pmic-keys.c        | 41 +++++++++++++------
 drivers/mfd/mt6397-core.c                     | 13 ++++++
 include/linux/mfd/mt6359/registers.h          |  2 +
 5 files changed, 60 insertions(+), 12 deletions(-)

-- 
2.35.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
