Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFFCACD1288
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Mar 2024 20:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQ6iRfApTBoRDrY2t1Fr9Ku/JGHxYaIezlkqm2YUAqc=; b=AImN6vgp6hdVKc52m7VJQ67ZCu
	+5UuetJEZyhMf38lJb2Dban4pIqsXPepi9pASdc1sVbhY2F8tLTkfjvykMYyPYl9XfBTq3te+Ll06
	n3yJ6rehltOymjqirmZaJpkBsis04INTzwp+nvxzTYFpo/9AbxQLrhOI8d9AlT/qfpSJgn97Z1Wjx
	ZyZVfmC/+IwJ+4dZYmFk1SM36XTH+IWYv66uS7JPvqC6zpoFPj1yj0doOhyiJ95IxrY+LbZLbs88j
	GQDzeEIIfEm3zYoeBQzEjnrF8W7aMPw6S5FAe0Q4mwR+RFb6E8aM+2Pm6TGIvWV9yZbhXPzQtiUTh
	ZEUtZRvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfYM-00000004C0b-2dFq;
	Sat, 30 Mar 2024 20:43:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfY9-00000004Br1-2hpP
	for linux-mediatek@bombadil.infradead.org;
	Sat, 30 Mar 2024 20:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=qQ6iRfApTBoRDrY2t1Fr9Ku/JGHxYaIezlkqm2YUAqc=; b=g+A0O8nq2SEqZoPWVQEM6+jWj6
	XomI307tE3FXNf549MtZ9KRYMxbD8hTMdgcMtoeLxOp20vIsq7K8c/UCND+1W2OueVvDp7TkfUt8a
	7Zpp6NgFHpoxzACQadtxKrNgExvc2I3Dt0BR2z1xz8QW3ybP/oSl1OcTsYt77KgVOpB/J9dwaq9ye
	WJuujWRf6QGNeDUtqd3wvzieEUilmI8bNBVuFzX/emDkMSdlPFtyphP2njDrErooEbASfY880l2JL
	OViMpZnnphOupBKx0apTMoPFBYUn7qKgv0HvclAjlfgZz1P9jxrbvZ5bt0OZazdg8BSs2/ZzaC8K6
	0LTcY1rQ==;
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfY5-00000002EGS-38eG
	for linux-mediatek@lists.infradead.org;
	Sat, 30 Mar 2024 20:43:36 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-33ecb04e018so2223623f8f.1
        for <linux-mediatek@lists.infradead.org>; Sat, 30 Mar 2024 13:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711831409; x=1712436209; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQ6iRfApTBoRDrY2t1Fr9Ku/JGHxYaIezlkqm2YUAqc=;
        b=o+qEWAE4MJUdSsS4yV58BLfRtLV4yt+jaCY59H7YU/quaCyFnsEyp2aG0HWqYYNm0m
         /D9E4/2StdMfHWAuNjMLZolFwZXFtk2LUfHn3YUWr3DUjS+zgg5Ka4b/ldO2/+v1DJ5/
         ohyXN3sbaNPRafHPPTyOoRnjoy+aOOyQy8N2KRiEBq/o6ozUOM1fK0uEINQ7NB2/FRQp
         F4SF391bbcgOgHEnuFw/p9tZhLUGWx6VIsjzi2WplsE548xo83DgRdVs7IFU/xuGhIYp
         nlgm4H+oEwrKnVzACCNADnAVahm/1yKRWrC5+xz0Uyk6pRes0nOuO2XRC0w7oRoQvr/7
         Zi2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711831409; x=1712436209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qQ6iRfApTBoRDrY2t1Fr9Ku/JGHxYaIezlkqm2YUAqc=;
        b=LiONGSgZOHHtV95f123GW3SRiWHGyIc1I+YWZvKGL5BWsTrmevMKxG9GMtR0Ex7zoD
         dAY4FxmD6FCwaNhFlYRW7ARgOIpNBiAWr9C1dnnaH9jGP85/ECvM0kF97Ta2Dg9DwT1g
         v56+pQZJjNj3dUq+KsHuolTT9ElmCCBTbpcrN5iTcrBspfNW4erhUQeJDBWPyIZAHX8T
         CdLqJxb9KkbH4uYx06JjSc+sYdBmdzvazmx+8Qq4WO/gqp42T0sWG9551vwySXUApJcf
         NY4PDFyXLEdCEr+KAeeUq6XnIQmCml9QmsZQatVu5avzhlKYQ42CIXLIE5Q4WM+yLvkG
         ihgw==
X-Forwarded-Encrypted: i=1; AJvYcCVjMw4FaEj6pxTPbpCxsxILl830WyFFmNzzj4vKVabuIme1i5UvHBGj2qqRtMMT0QCrGB/aOg75Yfik+EJYfNMCjg0Nz8vhpcvc0r/NmFv6MEcc
X-Gm-Message-State: AOJu0YzjpTaQ8iqrNVxIKZCawbYX2O4SYtO3kIMZo26t5Cc0zCxESD5M
	Z8Rn25Nhf2wHhynazzUHtF1JkU9oRPzNEwzi6bYrdlbr0cXg1ijjg9/mM+gJCHw=
X-Google-Smtp-Source: AGHT+IFof+wGW9GxDz08XDMp6C+JQTVetnRPBObjFVAE613n9FHrpR+tNujyuR5lpdLBVcyRgTGtXw==
X-Received: by 2002:a05:6000:250:b0:33e:67c7:e2c0 with SMTP id m16-20020a056000025000b0033e67c7e2c0mr3096634wrz.38.1711831409452;
        Sat, 30 Mar 2024 13:43:29 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d4a8c000000b0033e7b05edf3sm7231299wrq.44.2024.03.30.13.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 13:43:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:43:12 +0100
Subject: [PATCH 01/11] drm/mediatek: aal: drop driver owner initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-mediatek-v1-1-fd5c4b8d633e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=839;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=w3IeKAjnHBm8kl2xZSK2QFuYLup7/F/VoSrvI0alzKY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHllE0eKbHKME3Pw1H4CbKUpy9mgJwywTALwm
 8LLCuYguqyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh5ZQAKCRDBN2bmhouD
 1002D/9XrWcY2yuyJCyP/EFAaoXJOdXI2ZjZNPj1enhHgt215/5Hq4umqeqJfzLIrjTzKZqMNeT
 274U1WzmqF3vl7oc8fOG6lArneQdJffyeJTU6IBFx3hUvfStz5a2hERTop6d4/EZ0A27CEsNO/v
 vTQsssxxwN1V7TmiiFqDjwKSGXLZj5KbjJVqJg29vF+cKz9ylWp9D7GO7lTSCnDVy8RT1v7w6Dv
 p/KQS+LcUZNsOhgjeDAaJkiFigku4o3Un/I/T+l0an9KRakHP4ALOas2g52wN7LYeXtj9LGTM7d
 QR4hV1ZwI9rf0NTKpvXjIA6D5ynsS2o9/4/uv5pgA8CUmljDzw+Ar3TkFG7GYBaimmtHJHVQ34z
 rHdRVbBhvPlJf8vLfCpoWvEmSJvONlbndk5UZJrlfJ15yGI1Bh+x/w1fa7NogDKvxheUeUXh7II
 JdKgfZVf02epyusd5EJzrFcL4spSZmlI11kXmSx8dZ1wC5xaYIkAWPtc9mMUcNa238VVUXeQW94
 dA3f7q/uDRXlVDxtMnJK9OE788U1KpgWacBeW4SUiSyB0/DW3Rr8JMVHLK/Esk1JFBC7U7oBCn+
 94Ao2epihnCjjdLcCTEwIdAZX77dwdCS3TaYSChWa0kTPymFJA6zmDndVtEOlna1yKbho70pInK
 OBYxA/SkR5ieDkg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240330_204334_122890_131A3ECC 
X-CRM114-Status: GOOD (  10.53  )
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
 drivers/gpu/drm/mediatek/mtk_disp_aal.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
index 40fe403086c3..f6f2c24abc93 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
@@ -223,7 +223,6 @@ struct platform_driver mtk_disp_aal_driver = {
 	.remove_new	= mtk_disp_aal_remove,
 	.driver		= {
 		.name	= "mediatek-disp-aal",
-		.owner	= THIS_MODULE,
 		.of_match_table = mtk_disp_aal_driver_dt_match,
 	},
 };

-- 
2.34.1


