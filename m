Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE49C3DA49
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jul 2024 18:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JZoF3PGllS+ykKe0k+A8Fb6SI5VjVBwQNrkvYDcCXSQ=; b=bJJbs6YuRtkuS+R4lvfnPwdiqU
	Gf5x4WwN3BYtcWSaMD0MX0e8Ca0r0OtwKFmOp4MhKya0f2S4+DfirmLCWa9u7VWtpa/VVFCki5UIA
	1rhddmfKhQqNdywiqPePxZDb1SpP6iBmDGMYHZtW/Q/mtqVzsNEnaEIgBWwDrJcTWz4RZhjIuAPVJ
	jJZx9zHU+/yHVcW0nFuaXKI3VjrMOpIr0iwld7TOV6o6Dgrp1InolASSqI8+j8PYEbnyqLVsswVDL
	C8Up0y6RMunffWj047Q8ahNPmia3PrxhAhe+2o9HG6x8qxuF3HcP0pMJFzRT/tDkt7MMbQn5mvfwQ
	DfZzKwgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUVw7-00000000M2N-3OEq;
	Thu, 18 Jul 2024 18:33:03 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUVw4-00000000M1i-17C9
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jul 2024 18:33:02 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3c9cc681ee4so627597b6e.0
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Jul 2024 11:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721327579; x=1721932379; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JZoF3PGllS+ykKe0k+A8Fb6SI5VjVBwQNrkvYDcCXSQ=;
        b=Uea1Ix7toNzA+X1/UL1fIKNsSmJlA+P7uLj1dVWeAWI8rxzWcUfk1vAsjd88JNv3du
         yRyEi20dEGniYso+fZy6lOWd2doGQXTvmlhJE12T8YDwookEzhb15hF242jJk1xlXEV+
         U5VcoSTuM0JsN8O4sRg34ef4rkpgEFdJq0cG//jBOtVDtBcD7Zb+HJCSgAbQqrNKKfG5
         BFC43B8OIZBc/S9PUNsDKDaO6siffYbCeD+rWxof6UH8IjvKFysi1PR/yHUVh2A/lxG9
         7qqh6U66S84s4xBM+inAK/OUDEsSESakxLMe7shbTMtiXtgF/TZo5pNchUEu+mOvZhZU
         RLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721327579; x=1721932379;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JZoF3PGllS+ykKe0k+A8Fb6SI5VjVBwQNrkvYDcCXSQ=;
        b=owFUKsm+69+ku2b92wT86Y+aeOafyFMEICon++OyTAAvDIDT8gvy/3BAFZINyVnxli
         ZJG7yzAT2P5vzbO7JR2TqfIMYonYSW/UZGjkNHM++DTrQwrpznYtak7BLBb2HsnbpcYL
         HtITxCQ+uYDnVdwLCjptPWpYTiHdguaX7oAV8Wdzh2Bzg8OEuwOv48Aco0+j3Zav2lFW
         FwI+zBBVZ5MS3pGg48LJPG+AoaG7rO8PDDMovBuyDzmzwcHRBi9WBWEjRfeGZ/6IVqH3
         FuGO+/j1oo+5HiLEO0QpeRf7CSJ6E8Ew4yf+6Dz7I5ATeTw4JBoOxzhb8FJSSlR0i0Uy
         M0bA==
X-Forwarded-Encrypted: i=1; AJvYcCUfoh1hsWQBVN3LSGJomM4m+kf72EzXYSbJE3IWBCFM+zshL9L+4KrquQOi6ch3feigee2yYHcmX6EQObbWnGsjtr2QaBTJOBPQN8H3P1xhSryJ
X-Gm-Message-State: AOJu0YxvFg6TX/nvhZ8tHc/tcB+8nGKFe3Z326gpPbqCAHJdxDnc32rs
	3VX9+ORHNsyDnmV1Mg8YELCRPi+/iORoE8pMojsCA6iCXkKLcmw2I6M5MftISo8=
X-Google-Smtp-Source: AGHT+IEFyVDue4003XGqdQn9OI/JuHlnkRU4Kud0hIHuOq6RiiYeXuyi970NX/bzpTixUC9Cjj2hoQ==
X-Received: by 2002:a05:6808:23ca:b0:3d9:dc70:10f7 with SMTP id 5614622812f47-3dad1f88752mr7226128b6e.42.1721327579036;
        Thu, 18 Jul 2024 11:32:59 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8d5a:14eb:55d7:f0ba])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3dad5297cb7sm503186b6e.37.2024.07.18.11.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 11:32:58 -0700 (PDT)
Date: Thu, 18 Jul 2024 13:32:56 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: airoha: Fix forever loops in error handling
Message-ID: <693c433a-cf72-4938-a1aa-58af2ff89479@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_113300_332173_4406D439 
X-CRM114-Status: GOOD (  10.62  )
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

These loops have ++ where -- was intended.  It would end up looping until
the system died.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/mediatek/airoha_eth.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index 7967a92803c2..698835dc6da0 100644
--- a/drivers/net/ethernet/mediatek/airoha_eth.c
+++ b/drivers/net/ethernet/mediatek/airoha_eth.c
@@ -977,7 +977,7 @@ static int airoha_set_gdm_ports(struct airoha_eth *eth, bool enable)
 	return 0;
 
 error:
-	for (i--; i >= 0; i++)
+	while (--i >= 0)
 		airoha_set_gdm_port(eth, port_list[i], false);
 
 	return err;
@@ -2431,7 +2431,7 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 	return NETDEV_TX_OK;
 
 error_unmap:
-	for (i--; i >= 0; i++)
+	while (--i >= 0)
 		dma_unmap_single(dev->dev.parent, q->entry[i].dma_addr,
 				 q->entry[i].dma_len, DMA_TO_DEVICE);
 
-- 
2.43.0


