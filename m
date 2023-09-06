Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1C5EB8FB7
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Sep 2023 11:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdlxO8xCKrQy/jRT0nkbbxVM9BFP+RkDY99mRvExc+k=; b=IYGWdxTm6fLF2GMbaVPtbp9dGT
	IszhuOC75NdkS9M+P/DEL1VDbDcef7yeiXoTaCns92R3M5qvwX7riWCpvEo4UMELgv2FglGO2K5cX
	IKv7IfQXwpixPtpIzBh6rAYJPDovoYgwNV/hDnrdq3GWau1FdR0GHmgLSmV+WD2czHc2BAnQbcu7x
	oJhufp5h6Rn1YNGcq4L9j+SEEHA0NcgVQE46gNQlT//UuvHbxVA3U76oLIrfilb0WJ16e1L7CmhAx
	IMUH/7oeHfhTpQF8qavdZ4VgW4Ey0mkUviH8unlvZfG5Z5rWhRfBGwAT+A7c38kRTHVEN/cFS1B6k
	E1d2SJBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdqkL-008lxN-1O;
	Wed, 06 Sep 2023 11:30:57 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdoju-007tj4-0k;
	Wed, 06 Sep 2023 09:22:24 +0000
Received: by mail-pj1-x1043.google.com with SMTP id 98e67ed59e1d1-2736e602429so723447a91.0;
        Wed, 06 Sep 2023 02:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693992140; x=1694596940; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EdlxO8xCKrQy/jRT0nkbbxVM9BFP+RkDY99mRvExc+k=;
        b=HQf+NOfOMlnTojshiHX+IVZdOc/Fy2zGEaKybJ+e/iDF9nUlbR3jNd0UzFZjZJ6SxJ
         ZvxfOD9QfUmtgrQw6DvKdqg5wp0hDKZLM8ksWcwLM5tr7eDrD3uWo2/KW6UjurhipcQK
         0PcbC3VdpxR3G+FjOg+TwcJV74nk0PeNrR4GUDcDLUZiF+63cIXvLC5hHR/rjQJiAN6T
         2JUvZc+JD5XTW32Wp3qgWP8Jwx3omUtikQmr4URIViQfgQ1I0nPx3vosPzu9czgKwST7
         7BBK86f8Npl1qQ1XHvGZU7SO23FbX/ds2gmJu0VCMvfeFBV7SB9XZ79COcjlt8vnMpU3
         barw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693992140; x=1694596940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EdlxO8xCKrQy/jRT0nkbbxVM9BFP+RkDY99mRvExc+k=;
        b=BxscESKbG36GnNIWfct8sBLAGRVEK74YUvfQyVyLJN54c4goAQp6nELKkmn3JVmqax
         EaxTFda7sFra80G+vbwm7vsZCz5ZrWHht+BQDA7ZVtvu5u/N0t9kYnfIvZzRY1eAEZmt
         78ni99UIS5CbnNy7A2/xjwtk8XZBedklLM+SHm0abzu1IxS8IgitbGvcJHL/plC1t/Nt
         7MjpePO0GokbHGEJlwRF5+7tJvj/JM4VZIdhj6RyttC3NLnwLpqEkBzC2eKOeRYOYh4d
         PWVW15P1YS0RefIjq5S1SqaVcPJ5wX8g/x+RkVAvNvH3t074YMW0WhQ12oVUW+Vs+Z0I
         yCzQ==
X-Gm-Message-State: AOJu0YxcHitjN3yZgAbRrr9n2UUGZ2Yv4U8/IAvUMXal5IlTuMsjuY+3
	aKwVor2o1QdgdrHDZE3iCl8=
X-Google-Smtp-Source: AGHT+IHMiYlrF3Jj3YOcK6rVl4xLdU7DgmAA3OTs/hdRqP6Fw6ddEdyaYMDL7Qb3ChEK1pnU2kkrAQ==
X-Received: by 2002:a17:90a:7564:b0:26d:414d:a98a with SMTP id q91-20020a17090a756400b0026d414da98amr13879578pjk.1.1693992139631;
        Wed, 06 Sep 2023 02:22:19 -0700 (PDT)
Received: from hbh25y.mshome.net ([103.114.158.1])
        by smtp.gmail.com with ESMTPSA id ft15-20020a17090b0f8f00b002684b837d88sm10679242pjb.14.2023.09.06.02.22.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 02:22:19 -0700 (PDT)
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
Subject: [PATCH 2/3] net: ethernet: mvpp2_main: fix possible OOB write in mvpp2_ethtool_get_rxnfc()
Date: Wed,  6 Sep 2023 17:21:06 +0800
Message-Id: <20230906092107.19063-3-hbh25y@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230906092107.19063-1-hbh25y@gmail.com>
References: <20230906092107.19063-1-hbh25y@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_022222_297777_0609554F 
X-CRM114-Status: GOOD (  11.23  )
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

rules is allocated in ethtool_get_rxnfc and the size is determined by
rule_cnt from user space. So rule_cnt needs to be check before using
rules to avoid OOB writing or NULL pointer dereference.

Fixes: 90b509b39ac9 ("net: mvpp2: cls: Add Classification offload support")
Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
---
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
index eb74ccddb440..21c3f9b015c8 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -5586,6 +5586,11 @@ static int mvpp2_ethtool_get_rxnfc(struct net_device *dev,
 		break;
 	case ETHTOOL_GRXCLSRLALL:
 		for (i = 0; i < MVPP2_N_RFS_ENTRIES_PER_FLOW; i++) {
+			if (loc == info->rule_cnt) {
+				ret = -EMSGSIZE;
+				break;
+			}
+
 			if (port->rfs_rules[i])
 				rules[loc++] = i;
 		}
-- 
2.34.1


