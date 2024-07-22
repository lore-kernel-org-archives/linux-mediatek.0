Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B40BC3DA5D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jul 2024 09:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rqAxuPwHe6ewTOQqtnUshUdwOCuglZgMggOvLSlURPo=; b=mVAkJJ5pJosaDxI7zfOyoHf+Yi
	BS2t7rzhAycciHoXIFSlH5S1BrEB9EBCwYexFkwXhwesCyYEIdz127GuqNOSvmKSgfnxbkQlmLonO
	KYjGLBCDdmjKZQmZQgfFXFC0KpQjQSh+zNJf1QJhRr++ja+PCoinIV2t2kV4Gk80+DW/MGJoX/zyL
	fL5cYYbynK4VPWasqB+MKl7MpRwiS5JZvXnN0MaOE4mYSvPCAb3AqFKcz5f7r7kU60q51KmiBKtlY
	mrM5GLLyBGmfrL3ccHjBeoIo9cDyZQCOSdMArdRGckhc4+YzzHXT9mJxZU8QbGtGI/WJgzfcibrsV
	bplteMWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVpL6-000000092OM-3Prt;
	Mon, 22 Jul 2024 09:28:16 +0000
Received: from mail-lj1-f175.google.com ([209.85.208.175])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVpL4-000000092NV-0Td2
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Jul 2024 09:28:15 +0000
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2eeb1ba0468so54806731fa.0
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Jul 2024 02:28:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721640491; x=1722245291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rqAxuPwHe6ewTOQqtnUshUdwOCuglZgMggOvLSlURPo=;
        b=LIOluBlMz23c9ADgJtejfrodqU0ly25bxX6U7gVgI6FU5uJ4VjUubPnV5Wqb5iyNxu
         UXnbzJbmamfD10BihyLhvcmwRIonoje0aiGuxIAX4SWXxPdQdO6kF6wOZTqO677mbQ8I
         jzrQzci4fQ9TNe1DbipI8nd3hv7Un8TtM2ICb/3RiN/rWEGMx+v1xnZ+kQqbzJmTLjf/
         jaxzhns7YL6R7WIIqUcpvZS01QYT2WTZxmwguNQlwjiTBidn2esx0G2xjhyqI74zRd9q
         Y1yZv2gq7ORgfq79E+MExROGXfAfT1QSxNybUN7IHODZompmQ58kMqBKR5pnzBqOY8RI
         SY4Q==
X-Gm-Message-State: AOJu0Yzu03h80eN3r0SfQpoBZb9KJCoXGsAeWEwL4159CmpAUl4Y0W/c
	ChVHiqzS4wu4kCcoqX1x7jhjihV+X08QTy7eJ2cOh1tgtm8BbUrcW0OpTg==
X-Google-Smtp-Source: AGHT+IHfSmzWVIDD8uWyohtLPIG/YOLFJx/XSErUoHXnaQkRWxoKR3Hg56MQAwTji9rX7dCIZIE+7Q==
X-Received: by 2002:a2e:92c5:0:b0:2ee:7a3e:4721 with SMTP id 38308e7fff4ca-2ef16826a21mr39363401fa.39.1721640490632;
        Mon, 22 Jul 2024 02:28:10 -0700 (PDT)
Received: from gmail.com (fwdproxy-lla-008.fbsv.net. [2a03:2880:30ff:8::face:b00c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a30c2f869dsm5833437a12.65.2024.07.22.02.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 02:28:10 -0700 (PDT)
Date: Mon, 22 Jul 2024 02:28:08 -0700
From: Breno Leitao <leitao@debian.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-mediatek@lists.infradead.org
Subject: Re: [bug report] net: mediatek: mtk_eth_sock: allocate dummy
 net_device dynamically
Message-ID: <Zp4mKL/X1HSrjufq@gmail.com>
References: <4160f4e0-cbef-4a22-8b5d-42c4d399e1f7@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4160f4e0-cbef-4a22-8b5d-42c4d399e1f7@stanley.mountain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_022814_172503_3894773D 
X-CRM114-Status: GOOD (  12.17  )
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

Hello Dan,

On Fri, Jul 19, 2024 at 06:52:50PM -0500, Dan Carpenter wrote:
> But it's free here.  (NULL dereference).  I really would suggest moving the
> free_netdev() to the release function.  The probe and release function are
> easier to read if they're in mirrored order where every allocation has a
> matching free.

Thanks for reporting it. It seems a real problem at the error path,
indeed.

I've hacked a patch with your suggestion. how does it look like?


Author: Breno Leitao <leitao@debian.org>
Date:   Mon Jul 22 02:14:19 2024 -0700

    net: mediatek: Fix potential NULL pointer dereference in dummy net_device handling
    
    Move the freeing of the dummy net_device from mtk_free_dev() to mtk_remove().
    
    Previously, if alloc_netdev_dummy() failed in mtk_probe(), eth->dummy_dev
    would be NULL. The error path would then call mtk_free_dev(), which in turn
    called free_netdev() assuming dummy_dev was allocated (but it was not),
    potentially causing a NULL pointer dereference.
    
    By moving free_netdev() to mtk_remove(), we ensure it's only called when
    mtk_probe() has succeeded and dummy_dev is fully allocated. This addresses
    a potential NULL pointer dereference detected by Smatch[1].
    
    Link: https://lore.kernel.org/all/4160f4e0-cbef-4a22-8b5d-42c4d399e1f7@stanley.mountain/ [1]
    Fixes: b209bd6d0bff ("net: mediatek: mtk_eth_sock: allocate dummy net_device dynamically")
    Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
    Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
    Signed-off-by: Breno Leitao <leitao@debian.org>

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 0cc2dd85652f..16ca427cf4c3 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4223,8 +4223,6 @@ static int mtk_free_dev(struct mtk_eth *eth)
 		metadata_dst_free(eth->dsa_meta[i]);
 	}
 
-	free_netdev(eth->dummy_dev);
-
 	return 0;
 }
 
@@ -5090,6 +5088,7 @@ static void mtk_remove(struct platform_device *pdev)
 	netif_napi_del(&eth->tx_napi);
 	netif_napi_del(&eth->rx_napi);
 	mtk_cleanup(eth);
+	free_netdev(eth->dummy_dev);
 	mtk_mdio_cleanup(eth);
 }
 

