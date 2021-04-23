Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8460C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:31:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 906D7613F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:31:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 906D7613F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9Nxd4JXYG5wO2M9wNZ6WCANcHMoV88Z+HxntgCe4RlE=; b=aN/Z/1kPnBoXcFnwBvUTv8A4f
	TAiyuRu4scl6aw7J419YQPDtqEskLqbW8G8xfLOpPlV3yGIIsYdZOakJ9+CMNeMWeVv+Wjls/1v8O
	D8cOIOn9VKr1SBMILJChfqktkp7sFYvpQgdnk2A4wUGbGLk9r5qHPgiXr+ujEDrzxkSz4kUrRDtRZ
	rWKEoTzL1MOU+WWwFHTG5ebAQSNcJ7OhAIQmLlLmGgKIRvp68kQX30FULErUgflV13sVob8SVOPN5
	9I+F8OPt6pW6xXg/tmc8nsHQDkk+Gk5jDh1L4OEag8nNCA+lrZ83/vtNP++gHn7gxXDgRUw01uVph
	BCsn/UC+w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZoPH-000hSY-3C; Fri, 23 Apr 2021 05:31:11 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZoGt-000fY3-Nd; Fri, 23 Apr 2021 05:23:58 +0000
Received: by mail-pl1-x635.google.com with SMTP id 20so20722768pll.7;
 Thu, 22 Apr 2021 22:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oCguuBzXzGvGn2bpnQzkSyzGRllJCSh+eewGXVSf1rE=;
 b=MHMI7yDYGqn8zq/FZ4jyCKzBzBSGVUpLws/egw5RYREDUwNt1/5nibN5vsTSaK0mPJ
 5XMBffQrNzw6+e9/43KdK9qgdT0sn5bob2n2/3b1ahrzQ5STCqZFqXHhrURRRn3AVZTf
 hE64u9uDhJNNcaTRAyo7FVGPM6M4a99+V1266y0wwrC7WfyVJsg4bmCGBnGQwd1Y1d4S
 4+g8sNZ+cOIgY3E657sYN2VWja0DbyhJLommN264eB8JKGLfVIV+TBkR/UDOtwIIuU6h
 2lAqU9L0iZAjoClMeQ0ac2cAFE8AYLuyaLWIPBEUTJq3htUUcHuQ9+aIXpfC9thWRjQI
 CL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oCguuBzXzGvGn2bpnQzkSyzGRllJCSh+eewGXVSf1rE=;
 b=Z1nU//jzhe941kjLos1d4E/rYFkzUVZq+dmEatuhEZdtqYdgSjCUL6a19lJsbPGML4
 CJTmzvYfnK25eSkSeownZOJM43EGU0uDYj26v7i+ZNT7Q9uftXf2sEdyPRVLbN3si/77
 +bLwgbdKPnNdsIGf7Z6ewDFMrmj0SNLy4oRVgVCRMkneTtyV7jGWTH8XB7omHCiNK38e
 dOr/053vSpXAWtyZfe1pl71XQH61sk3o1nFjkWHaGzVME2kLILqX5kzCiJgN7ys16mDX
 ilFxqdPwBmm9o6cZ+7e5HTRNVdggdUDfmwhsU60Ia5mvItDHb/U9XWLUAgpvlfKYWwTL
 BgJw==
X-Gm-Message-State: AOAM532Px4AzWAMBKoGdvSaP/qBg2hkrzDxr/k4tllzCUcb17i1efatt
 htLdvo4vap7UQfHzb8wbMJo=
X-Google-Smtp-Source: ABdhPJxXEwjA66TlNmzYlUZCuMfuAaRE+874S9Bqpa0e67m7LPYgUUhtbwPh1eTSX8cCwirlRy23Ag==
X-Received: by 2002:a17:90a:2acb:: with SMTP id
 i11mr2381934pjg.131.1619155282437; 
 Thu, 22 Apr 2021 22:21:22 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id y24sm6238825pjp.26.2021.04.22.22.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 22:21:22 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next v2 05/15] net: ethernet: mtk_eth_soc: reduce MDIO bus
 access latency
Date: Thu, 22 Apr 2021 22:20:58 -0700
Message-Id: <20210423052108.423853-6-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
References: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_062334_377707_1D931E81 
X-CRM114-Status: GOOD (  13.73  )
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

From: Felix Fietkau <nbd@nbd.name>

usleep_range often ends up sleeping much longer than the 10-20us provided
as a range here. This causes significant latency in mdio bus acceses,
which easily adds multiple seconds to the boot time on MT7621 when polling
DSA slave ports.
Use cond_resched instead of usleep_range, since the MDIO access does not
take much time

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 5cf64de3ddf8..d992d4f1f400 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -86,7 +86,7 @@ static int mtk_mdio_busy_wait(struct mtk_eth *eth)
 			return 0;
 		if (time_after(jiffies, t_start + PHY_IAC_TIMEOUT))
 			break;
-		usleep_range(10, 20);
+		cond_resched();
 	}
 
 	dev_err(eth->dev, "mdio: MDIO timeout\n");
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
