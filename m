Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2BFCD1294
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Mar 2024 20:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0emvF/cLhXuWiqzlLx7GJV12jM/n36nJMZKi2m5TQa0=; b=v9w0NyWzohszKCc1KDRTzq+0Ib
	kZ1zPWOcL8GyjptW1/J44qUKK13WJr4ZDAldlwSF9FxM6Jm/DXKDXoMgMssAmEkKtbMQKmKCNKFKL
	1B77K6Wj+ObkbnYZU0aMG65JHwvjA/R42CXy2KQoV5X8gqGlwn5IXK/OZVGPRgaHshQibkjQ9mW+w
	DqiC4AmYQoPWnXYCES9aaK5Q5f1fux6rdq0XU8IIbX4BDn1zZlXZmEdNFrqoCsUJZUlYN6fflEU7w
	nPQ3AW0OfQMIpU7Bt+HmXWNzt7CIBhGuMW/e1NrLqUeTYf4IdN+OXJ+JtDsMBTaFJbYyQUybv2FGT
	L/wnd67w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfYN-00000004C1B-0uY8;
	Sat, 30 Mar 2024 20:43:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfYC-00000004BsE-2SuT
	for linux-mediatek@bombadil.infradead.org;
	Sat, 30 Mar 2024 20:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0emvF/cLhXuWiqzlLx7GJV12jM/n36nJMZKi2m5TQa0=; b=VZ1Aq1uAj9VE5WD3eSFsD90BUM
	qPTsmWhCbttQ+y/LcrPezpB150MMCP3v7rwVJVMm1KKNA0qRgv+noR7U4bnfSIutsD+IT8SZSgy5i
	r45IyGx7pEmBcgVaP00l6C22dIypHKn0GQWe5oSEXt8Ce1ag4+uvYkM9d6zBcGn0th1cimDgA5/BO
	3veOgBLqvbhPc70k5QKefZrLHUpy0LeCLJNUIMihD/cKcxUzV4Br60/czxirQ1f1wOUv6WcQB3SJJ
	JgQ6T7zoDeUynUfSkB3Zdb49ZVsZEdECPh+Xx1UDxmS/KeQyBQIaV5RNsO6Z389Kb46MdjnVWr76B
	WU1ezpgg==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfY6-00000002EGU-0AH1
	for linux-mediatek@lists.infradead.org;
	Sat, 30 Mar 2024 20:43:39 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-341cf77b86bso2033267f8f.2
        for <linux-mediatek@lists.infradead.org>; Sat, 30 Mar 2024 13:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711831412; x=1712436212; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0emvF/cLhXuWiqzlLx7GJV12jM/n36nJMZKi2m5TQa0=;
        b=LxjWEaRLUaK2m/kT4yyEKdF6XlRMWZDN/gDMNvxaIXFUJNhFCDHaehRT0n2r2u1L6I
         Y2Bx1TISvBHX+9INmjTUM8PJrzT8wWR74Ri4iVpcmxuhFgdNatd9bZ25jbV4fguyAHok
         i8KHNPXsM9FO+b8YMjS4m+eCJPvaiglsjrqoT9AE1GAwzYxk0FIZvd3C4FyUZmBNpcSP
         EwsYzF+7YGYUH4jp8C62KxUG/Hjyx7vGjK+L+PomcxvdqSE2glJi5afvagC+bCzzr+H7
         xmGUR3cTfFd0etjPLhMsItTdpRGHsPuXDyN/u31/+epnwEX17EFnaBZGliCL3NcEb/ax
         bNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711831412; x=1712436212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0emvF/cLhXuWiqzlLx7GJV12jM/n36nJMZKi2m5TQa0=;
        b=QVXQy08W89qZ1KgvjxPIyl/LadJz/QF4/9YAShC1w+ol0/FJjmadpuWKNFyPdYrzVs
         FQD+eP6aDRgJB03nXpC8GyW1CCcr+bzQoFZDNEwa4DHGS9Omf/5pgNPhJ8+D9ZJRFT0D
         jTNK/MDcJPDH2bl47vnmfL1XCNilrpQgEU9yusDilV3JlGEHLjWojcOPxk+qf1q4RvKq
         mJA6YzfQmv4+bgfuwkwof9eB718ETgb+4CmHoxoN9/8oHd3Cdobzor9N4rkVejW2dMez
         PqIYkKhGoIHNDPDXow+RsEUNCPcWlCxvQVbm233iZQNlwL0tqfgwYshUpD1ZTyI8yj3D
         4TDA==
X-Forwarded-Encrypted: i=1; AJvYcCXt2Nu2Xle3zVetYjHWTsHVO2HxhzGmQdFyUMcfAuMNkgJAr853I1/2M/L2F4njwZFrABh4xEXGAnFbKfmXHPpYeSEtHxS8PE/QVbhNO7TZ2Q1Z
X-Gm-Message-State: AOJu0YzkO9TFJPc9Hq0+HjzZupy8jUYiXeiqbgooaS4IdfUpq6J96kWf
	jY5bBns6Tb9TH0IQ2plrmyf8tqElqvfXd5OOkz3BTqDFeLX6pk3cBN9H0ueRCdU=
X-Google-Smtp-Source: AGHT+IFkGqAbKXnEB2y8QAY0Zo3dFiMkav7aBNaw2zsKLOXyCOq5nMycSsl9SDGCHPDFBAqf4p0WrQ==
X-Received: by 2002:a5d:4a08:0:b0:33e:c539:977d with SMTP id m8-20020a5d4a08000000b0033ec539977dmr3478175wrq.22.1711831412348;
        Sat, 30 Mar 2024 13:43:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d4a8c000000b0033e7b05edf3sm7231299wrq.44.2024.03.30.13.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 13:43:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:43:14 +0100
Subject: [PATCH 03/11] drm/mediatek: color: drop driver owner
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-mediatek-v1-3-fd5c4b8d633e@linaro.org>
References: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
In-Reply-To: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=857;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=GRHvmMpjGaimoM6mb70wpxBieg+Y2V7L3kfHMvFyhf8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHlmQX028BWFMF7uYbxxXKUF/44ZixRru4Atg
 GlhsSuXrtyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh5ZgAKCRDBN2bmhouD
 13ehD/9Hd4ygwzrjIvHIIwXY8PJt8UReasJZDJHAagJiHw+xkF0t5Ec1gIny/0GNd/jke3znzZN
 I1KVY31Tppzsk+l0aMsK+Dqta5He7KERwdfWpZorLx/4OYmLuGji/q3X1pK5PmOEbBYz5a26Fc1
 QCpM6bpUJxn3a1hDJguxb3d9RDlss1xVKWi4SXvFFXEt+wRIK+IaPspPQ4X5fgWSi559skINnZy
 UNFwl9mTeDv9bWydib0pGgaR0BdqlWtPx6mAuLrDlFl08HEE3XmuQyR6SrxFokIlF7rFZx3LXPQ
 ecDqvoSUd+PHla9esGDUFZMK4hFsasW08AC4ZGL9gCCTWR4/wLrsuO+SgBr6kmM/ElZCqulyTnD
 hFInPjuF0IoeO4cLeR+ChknPft/mZYylGRmcKJMfqjVKMsWKklDhYDYQ+yplNNzbGGu/Gwh910M
 j+MDAZElVS4b7Y6+aTkFh5+1HBIOnrQGFacFhvwSHHyWalr5vzHAxXTiMaN9NhzssJFH8N5p4Nc
 JaraB4apf1q3MkxiX9OrrrEJpdYJBCaGEQ3KTLWs0LgB0M+mIcXIa1F+IMMJZrm5UXr55vRM8Te
 G25+SaIwsLjDVI6nOtbSK1DGVUlpifEXp7x0yKNVGgEGUrY5ZI1dVIpWfD/1XnMJzRCZywRG7jG
 6oT/e40ZzEUHaaQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240330_204334_168972_D84E0D7D 
X-CRM114-Status: GOOD (  10.43  )
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

Core in platform_driver_register() already sets the .owner, so driver
does not need to.  Whatever is set here will be anyway overwritten by
main driver calling platform_driver_register().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_color.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_color.c b/drivers/gpu/drm/mediatek/mtk_disp_color.c
index 78ea99f1444f..b3117a1a6535 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_color.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_color.c
@@ -164,7 +164,6 @@ struct platform_driver mtk_disp_color_driver = {
 	.remove_new	= mtk_disp_color_remove,
 	.driver		= {
 		.name	= "mediatek-disp-color",
-		.owner	= THIS_MODULE,
 		.of_match_table = mtk_disp_color_driver_dt_match,
 	},
 };

-- 
2.34.1


