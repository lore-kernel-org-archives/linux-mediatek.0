Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284EED0EE24
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Oct 2024 19:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kBIYBhNJLveBi0X8buyeW3/XiOUmPsQpigk1+cdvIw=; b=t26YLrGRnrQqsAV3GGrSUqRHGd
	NUxXxwdMiEUD2Dc7NO57tEJ5l1/Q/PJSx5ouK1beUnneQuBUtgvSqc1LrKZx+QWrsVVUk7uO/Ou/6
	G7AQMC+Wb1sZHF94weBrlxIrRVZtEJ61SNl1MMZsUXUnj/oqRzpcj4vcT7UUu85Dd/qvgKMk5DJg8
	RLYs9hcMKZUW2BG6u3/P/iA33jxf3q47CxhPvO2QtIRR22rALJkrWL9VFwoudBznfuwa//D2seB3Q
	+wuchRLqQPl/nHwIKv7DYrrMEI/Ys6N1q/sqjWyG9OM9dZbP5YWHoDb5+EgxiO6kN6fXsrgDohhJs
	28Gizcvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szLEs-0000000HPBh-0QFr;
	Fri, 11 Oct 2024 19:23:50 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szLDW-0000000HOyO-19FO;
	Fri, 11 Oct 2024 19:22:27 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-37d461162b8so1480613f8f.1;
        Fri, 11 Oct 2024 12:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728674544; x=1729279344; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4kBIYBhNJLveBi0X8buyeW3/XiOUmPsQpigk1+cdvIw=;
        b=ZP61iEusqEtJ4tx63dcmsznFAGe9X1P8r8adkieN3crE6sIwD02CwihFr5D/hq4ZTx
         7Atc1DRQ+2yQYZeYPqM/m9GWj7wuHNsp3zu7OKoNlMk6fcFI7BrB8O6EtoCu/0yshnCE
         TKN3AhacZV1v6HN8fgLRx2MO49osTV64WR0sfgzC3Zk8ySA8uqs8bnClBUzA76Bg6j1D
         QtvsgPvj/sL+Bk8KkakIdpb3pmBRLYpBmhmNi4p++xp66HOF0fIjvQfaGL7pMOIJzXdY
         GUySjmurglcWsANCCbx+Dr/K1rRhdF+WH8ntWjs324dy15sr+E1R+um+XneGcSP7pz55
         zSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728674544; x=1729279344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4kBIYBhNJLveBi0X8buyeW3/XiOUmPsQpigk1+cdvIw=;
        b=Usfpf52UDys6ez1cyEdxQRsRsP1YeHqWkXlk8AbFWWl0Fju5y/bWpBsF6MEdOcy97b
         pLam6WX+Ol55kOsNTtGlGGjhUViAERDH1NsMSCgLSwPlYF5PRPf7bdGPuGo6hOrwCYHE
         EDolCHL4mC4fbfxUyqCMsWhzI+ytTObo7MJYq2CUe+Mn61Kj2Y4nqe/82I5kXmx6G+Fq
         o357PFaF/H88Szm69Cs8GkGzBiRRU2b/i1zEbgPXaigiJriJ19hEWJdt/Fnph8EbtZ8p
         oz928vzJSVwVabE68NbyYTc4PzEtCSFi+/inSTDbKDwNuNmU9E+Jwd4oMTkYnkdSp4ld
         4bYA==
X-Forwarded-Encrypted: i=1; AJvYcCU4cDeJ7qSpAM3WPDcSSl2swbCeKaeJ3GUaadx943sih6x9/r3am06aDoFKfiIlfraMQuksxI4n20tJ19owNGc=@lists.infradead.org, AJvYcCWtRAmZngroEWCB6dVjIKdOkTJj0WpPk5SxIt4T+qeo2lMnrwYzRKiipi5liBKL1yBhS+u5vykt+qnV+UpObnH3@lists.infradead.org
X-Gm-Message-State: AOJu0YwbQYLOPMXsljSBPTwWMtpQmAJIpw/xp+yQ+Jja2SGNV7rMKrrO
	WQSXznG1OGKFF87/xBFdC+//Vhcvh7+28Qd/6I1v0JvRiFFnVbEQ
X-Google-Smtp-Source: AGHT+IEPObY61TTZUljSGVbxJ83DtlRp1vP8GuFprN167lb4Pr6rcaZZVUv+UkSSbZYzG56rZDvzaA==
X-Received: by 2002:adf:cc8f:0:b0:37d:4937:c9eb with SMTP id ffacd0b85a97d-37d5feb13acmr443072f8f.21.1728674544198;
        Fri, 11 Oct 2024 12:22:24 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-55c0-165d-e76c-a019.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:55c0:165d:e76c:a019])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b7ee49bsm4581663f8f.100.2024.10.11.12.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 12:22:23 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 11 Oct 2024 21:21:51 +0200
Subject: [PATCH 1/2] drm/mediatek: Fix child node refcount handling in
 early exit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-mtk_drm_drv_memleak-v1-1-2b40c74c8d75@gmail.com>
References: <20241011-mtk_drm_drv_memleak-v1-0-2b40c74c8d75@gmail.com>
In-Reply-To: <20241011-mtk_drm_drv_memleak-v1-0-2b40c74c8d75@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, CK Hu <ck.hu@mediatek.com>, 
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728674541; l=1023;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=GACFWz+z5+whIxiIEf5wTm2vjO+WqH2Y46iheppGzXc=;
 b=ctsLXzl8itXZ6YjbYlz1K50LW7nQRM1QFq2Ygrbx/fh9qsjr38w6zeU3uGz61wTvN3/n+WyDJ
 l0VO+LnC28wBFlo1TkzxIJ42L0f2a0eNe3vsDXXc4rOBCnHRlQ/or2M
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_122226_349053_37A56ECC 
X-CRM114-Status: GOOD (  12.08  )
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

Early exits (goto, break, return) from for_each_child_of_node() required
an explicit call to of_node_put(), which was not introduced with the
break if cnt == MAX_CRTC.

Add the missing of_node_put() before the break.

Cc: stable@vger.kernel.org
Fixes: d761b9450e31 ("drm/mediatek: Add cnt checking for coverity issue")

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a4594f8873d5..0878df832859 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -406,8 +406,10 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 		if (temp_drm_priv->mtk_drm_bound)
 			cnt++;
 
-		if (cnt == MAX_CRTC)
+		if (cnt == MAX_CRTC) {
+			of_node_put(node);
 			break;
+		}
 	}
 
 	if (drm_priv->data->mmsys_dev_num == cnt) {

-- 
2.43.0


