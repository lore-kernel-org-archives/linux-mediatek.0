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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E58EC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:31:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21052613F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:31:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21052613F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QZLzfR0Bv7ZW1nzy+7F+TsUiaKDYplELWN3IAzIdgS0=; b=HZMWOtQ8mpU60h/ccUqomFsM1
	SIBkP9u7loSw55OAi7QjDo4hGQkSaPxx0ZqK/iMx8ioOlF5zIOcOM7paOOVEGLvFnYym8NyWdl4Bo
	jVeRit9ApNxhwSlcQuCUwUQ9lvLocUxer2/BkVzGWMMvK/8FkOggIAnZrlAQF//yE2BVGtBdM7497
	a7PO6kXRF1ylOOKCSXDPQdqI6K2MfePeV3+pfsB9H7oebllGyEXMbn46Zyx73XJlMGiY+/MYKr2kg
	jZgHU2U8odFEwVYNzU2f3I2D6u2JGg7AvFjX5kSTum/sJiacJcrUcdP7OmNIUiJaeIlQ3EhIBeUrB
	/mDwcLI6w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZoP6-000hPW-9S; Fri, 23 Apr 2021 05:31:00 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZoHm-000fbX-34; Fri, 23 Apr 2021 05:23:46 +0000
Received: by mail-pl1-x635.google.com with SMTP id h20so24681453plr.4;
 Thu, 22 Apr 2021 22:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gg/rWc1cINoL2FH5CJEjCow0QyQU7jLI6ek3affIyww=;
 b=mVfonw9+g2aQXAAo6MdpHMUX05//o0mlrwM168LRxmOEU7Hj5nBFXMbwlFeS+XBWGG
 a6v3Qh91kRjJHP+9SKYN9FlBcqINPt+2vnqZlU27MJ4cLtIs17lYtUTptCoZtSdUFVRF
 A+wyQ2omVIrFTfBRjHgWXQbmG3+RSnBjjQIkVkekW8qoMIaTyw9KzKIF3ILq/kfBoz35
 w3XphpbYiImmn2aEKJNlEg1cgzrtaXtFnkUsClO4Fq3uGv922YCYuLz0UNzLwxBeeVVg
 M0GslZ8/22jMbuz46w6tt1NVYRhQ0e/t7tObcDBeN2J/QYvULdb8cSsDoqvhFn4ur203
 0TBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gg/rWc1cINoL2FH5CJEjCow0QyQU7jLI6ek3affIyww=;
 b=bCpoe/4QnxpGTOLlVIEtjj5QNqOiLbFCsWaBQy/AdLHt5/k+RGOeEbXKpqg+VE3Vub
 yWTzdwxcxr6gSR7OcJDsC4ZVQilON2rDEhEUGrfgxdyv8Td6cJDwoX/5LWQ7cpO5uNkh
 mNO2KF/x0D2sevM5TwU/cUToa7vo59KyhAHOOqSeTRz5eG6cycZ2gCWgPg1yjwWe90yV
 NyRdyim673Gks6LtYlqeHtpS0Xj844fJbo/6BayFFeBoxO1M0gxztRXCMk8o9RVyU8NB
 TuBcTNxNhoX4NhjZ4dpHENRH2+JHzBtWElx9b54SlohdkrTzvfrqK89jfm5S2RI/ja8I
 76ag==
X-Gm-Message-State: AOAM532lkm86HyDl2Kl8uOFFQDO8tJc5mXhnh0Lj4KWQPrezrwkXWq/b
 vrU1OHqKKTi6AiAmwJWFoC0=
X-Google-Smtp-Source: ABdhPJxAVghnaX081IZtbsM8hmJXe+URl3wx1vFIBP0POUNj0vLcd2sYlm6nrYC/A+GuYl8TXNLOyA==
X-Received: by 2002:a17:902:109:b029:ec:9f64:c53d with SMTP id
 9-20020a1709020109b02900ec9f64c53dmr2003503plb.83.1619155285132; 
 Thu, 22 Apr 2021 22:21:25 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id y24sm6238825pjp.26.2021.04.22.22.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 22:21:24 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next v2 08/15] net: ethernet: mtk_eth_soc: increase DMA
 ring sizes
Date: Thu, 22 Apr 2021 22:21:01 -0700
Message-Id: <20210423052108.423853-9-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
References: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_062344_593959_879E8C98 
X-CRM114-Status: GOOD (  11.37  )
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

256 descriptors is not enough for multi-gigabit traffic under load on
MT7622. Bump it to 512 to improve performance.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 83883d86b881..540a5771b7bf 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -22,7 +22,7 @@
 #define MTK_MAX_RX_LENGTH	1536
 #define MTK_MAX_RX_LENGTH_2K	2048
 #define MTK_TX_DMA_BUF_LEN	0x3fff
-#define MTK_DMA_SIZE		256
+#define MTK_DMA_SIZE		512
 #define MTK_NAPI_WEIGHT		64
 #define MTK_MAC_COUNT		2
 #define MTK_RX_ETH_HLEN		(ETH_HLEN + ETH_FCS_LEN)
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
