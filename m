Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DF6EE57CA
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Sep 2023 06:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bZKTZfBK+A502bdB4x6E91XtGMQJaKt3JAZWmYT/Cyk=; b=a68vwtwqgEYK1SoeOe3DKcLQXb
	zdu/+Sn+8fkO4QEu7pWhSU07qJqungBIrnfY5rKWyFMf++8SE9/bErsHA6ukEOtPtR1M2iOmRg+WO
	fcGnCJyJGxGdHtY85jj+c3nQrvtuX97enBxJIQSDDr26a/1RnKSnjgaGfalBfUjUxwJO92LUrjjQA
	Q6AeHfuhbYY96rNQkYBNLsB7qGgixWyiqCzLGfEUMGUYVwYgpkQRspN2e6lUkOvR1S3J8FKpPKs5c
	s0kn8wCTG/2vFVBsYdsp3hbl7/rUPzpxnpyklgP6et6jh/srXKiSoqJ4JaXX93BDrXhu2PWKJZbun
	1Nu4dzAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeUrs-00D9qc-0k;
	Fri, 08 Sep 2023 06:21:24 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeUrn-00D9q5-0O;
	Fri, 08 Sep 2023 06:21:22 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-1bf1876ef69so3929605ad.1;
        Thu, 07 Sep 2023 23:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694154077; x=1694758877; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bZKTZfBK+A502bdB4x6E91XtGMQJaKt3JAZWmYT/Cyk=;
        b=Om/B0LX0Ln1Bv/hsDP2g40+14IrNk7qcWcFCo+vSOBaSmSroiXGDcfnBO6WD51Qavg
         DUE7Sh6hFy+9g0UjtCX9X3GPj0HnyrAbjClrUj8fGluxuARjMTYwtAC8c/4bwESii+wV
         zrj7a18+AdAa8rYNE0L7ubwXaT2d12XlN/OiTbVrtYaLHTan11MtCyPziXwcnvl9LfLd
         YkohqHwWiAfMc7hsZkNSDmCb5yF9LkXsNl1FHy9UH+9/+t1XhhID7g3/L1oyNYfSVKLE
         Qfz3EPX/5jnCjcNTi0zIWFR6e3oeK/jwzuE3aqjXb0vuuvZXCWqDp/A2qNNpM9pRULkx
         NgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694154077; x=1694758877;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZKTZfBK+A502bdB4x6E91XtGMQJaKt3JAZWmYT/Cyk=;
        b=s0sJJ2BqAN+Ezm67cArh6P8XldS8YuafGtg9khVC92vF4RZGvwHFWj/hqt3RMYhO2q
         WyHHwwwQWUTr1kHWNnt78us7Cx3P+OnPpZRy44L/ddQw4/X/uk2zGS/ttFoiI8BN/3L0
         ah2i3DJKfRWEkXXB7IW633kymr2XE7OgKx1frcTphnRXPaa/p3au7gT27maml6R4KTmS
         2m9mAW4IUsqwR59+15w4GEjVZnXI64zawRIrEmWKW680ym35eR6HTg/cs4kUcb1254RL
         TVWioZ6EN28wqyihbIeK6QBNPW0CFqN4sCN+JViD4e6p31yejb2dHZZbuotdB9iGEWcb
         W5Zw==
X-Gm-Message-State: AOJu0YzoopJsdvEm9gf8bZDtzZqCZh/E54SzuA41d35wdswmQuVuU7Lx
	rakBteMpbP5SQdmTgAunpu8=
X-Google-Smtp-Source: AGHT+IH5FFj2A0AMT8B2pjOk722yu7NFnd14Qmz4rc/had4vrkOUm7nQ3ZH8agE8XZ2zEOBykPYxRQ==
X-Received: by 2002:a17:902:d508:b0:1c1:fbec:bc32 with SMTP id b8-20020a170902d50800b001c1fbecbc32mr1781145plg.6.1694154077596;
        Thu, 07 Sep 2023 23:21:17 -0700 (PDT)
Received: from hbh25y.mshome.net ([103.114.158.1])
        by smtp.gmail.com with ESMTPSA id l7-20020a170902f68700b001b8c6890623sm768620plg.7.2023.09.07.23.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 23:21:16 -0700 (PDT)
From: Hangyu Hua <hbh25y@gmail.com>
To: justin.chen@broadcom.com,
	florian.fainelli@broadcom.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mw@semihalf.com,
	linux@armlinux.org.uk,
	nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	lorenzo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	maxime.chevallier@bootlin.com,
	nelson.chang@mediatek.com
Cc: bcm-kernel-feedback-list@broadcom.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Hangyu Hua <hbh25y@gmail.com>
Subject: [PATCH v2 0/3] Fix possible OOB write when using rule_buf
Date: Fri,  8 Sep 2023 14:19:47 +0800
Message-Id: <20230908061950.20287-1-hbh25y@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_232119_181717_24640979 
X-CRM114-Status: UNSURE (   9.10  )
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

ADD bounds checks in bcmasp_netfilt_get_all_active and 
mvpp2_ethtool_get_rxnfc and mtk_hwlro_get_fdir_all when
using rule_buf from ethtool_get_rxnfc.

v2:
[PATCH v2 1/3]: use -EMSGSIZE instead of truncating the list sliently.
[PATCH v2 3/3]: drop the brackets.

Hangyu Hua (3):
  net: ethernet: bcmasp: fix possible OOB write in
    bcmasp_netfilt_get_all_active()
  net: ethernet: mvpp2_main: fix possible OOB write in
    mvpp2_ethtool_get_rxnfc()
  net: ethernet: mtk_eth_soc: fix possible NULL pointer dereference in
    mtk_hwlro_get_fdir_all()

 drivers/net/ethernet/broadcom/asp2/bcmasp.c         | 9 +++++++--
 drivers/net/ethernet/broadcom/asp2/bcmasp.h         | 4 ++--
 drivers/net/ethernet/broadcom/asp2/bcmasp_ethtool.c | 2 +-
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c     | 5 +++++
 drivers/net/ethernet/mediatek/mtk_eth_soc.c         | 3 +++
 5 files changed, 18 insertions(+), 5 deletions(-)

-- 
2.34.1


