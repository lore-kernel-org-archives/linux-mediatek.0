Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F8960A3808
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 19:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VVC5pdQd;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gOSVRVxk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eMWHFoyo0YwzH9rx4I0HyeLY8CG4WgxTdYM32IMESsM=; b=VVC5pdQddI6Mnk
	I29Fo4svufG/cCw2wve9Q+JXRoVphFkgMrLu/ghLyo9jijIPx7lb0bg2yM0EyDzKuq5en4rkbHclv
	GfzLm1AOngINls0lkzwPwQjKs3lID5/DGt4mkw5Ge1LhNa8rOdh8B/8CuNXAAsV/DqhOKkwVLndzj
	iFB5GMBziEqWUF8OoModjcneR2fuAsWxFwnOfQ/nVjnN5F7mhqv5D3jIsTNHtgHkeogwDw83Xenml
	4LMp3EuaGg4sJ6RzfI0GJCR7TRvq0YbHpLPhRokhfa8YC1k6XdHRfnQ/EDntW/mOZPRteIdcuzhHP
	EJw1GajKnpx4qGMXFATw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUiJ-0000000G9ae-1fFo;
	Fri, 20 Nov 2026 19:56:03 +0000
Received: from mail-oa2-x09.google.com ([2607:f8b0:4864:30::9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUi2-0000000G9JD-2Oqy
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Nov 2026 19:56:01 +0000
Received: by mail-oa2-x09.google.com with SMTP id 586e51a60fabf-4a9971eefa8so520777fac.1
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Nov 2026 11:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204545; x=1795809345; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eMWHFoyo0YwzH9rx4I0HyeLY8CG4WgxTdYM32IMESsM=;
        b=gOSVRVxkQeDPKebIoc8PDVTDw5JX5+JU6hS9vgz4A6jmBN4Fs9Vuv9jKRHr1bwrmIu
         Rk2SclBUecJ1E19SW1UCvRD2OkIAMvd9Fbh7zEI+EyIQfEV+hk6vhJQtp8zc3krMqKpk
         yW0Shvq4jnMskQi69H3LisTsvzr3VCJsHSqgLbOAFdbkh3nTVAQVJzlSMCXT6PC2HwdJ
         7zxwkwxry7Y8xtYzn6Ddm77C44AEMXgr8N8RCDn64LCH7lZlIpf2mmOWhBXVxPZZLTx5
         kQAxWJYc6VXowvEYJZYgQcXqwZi46cn+9USjOgknNspatjk261P2PZAiOx+k4/wf6ecc
         8DIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204545; x=1795809345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMWHFoyo0YwzH9rx4I0HyeLY8CG4WgxTdYM32IMESsM=;
        b=Dz6ouIoFnLAtu1T367T306ju+6miyslxihwr8TjYai5dmCXJDQmZRVOUtMT2ZaOLOs
         cpZfdmZcXEipeNPV29TxEad13WiprxXwMPyDb6/Wj+HYxRsZssxKn+3kTws/i5RuXga1
         K0N7DkPnDRbOvHlN98fn63peFFw6r4QL3aNdnBQIiGlSTD8b9bWgZOOVvC7CF/5DzYDS
         2Vrvkf9CpnNtNKx7GECBbKxeYBhQWs2S4uLurHsj2BRpBKp93dPJlQ2np6n/1QrwApBr
         yLKczXZAiVj1bGgJDWmNl1Oqtq89BSz69/BVP+bwJIhRpnLgiBVI1edwJl+4YOscgQID
         k1fA==
X-Forwarded-Encrypted: i=1; AL+hErFyBlwgh0UbACVcFR4rDh9CZSs7ld1/7SwKcZT9JHx6sQDOeodfiLnjVSdNSwFu96LNxizSsL+eugSlcQhUrQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9cOgty8EOi7LhiC2m5BCiXHGPuoCBVVUcQq0/U7ueBrI24JzNi
	u5WLm3JjIsUHeAQrFpegs9gqwnwl7U+CYHKbC44c7vSX8EfrSK9T+G7o
X-Gm-Gg: AYBFou1qcsMoVYlrjjOqPBCXqabzz2R5IbdSxkXVBAit6BQMj9DUTZeu8AHzeKid2EE
	rqDqfuJ5DSG8G9zv5NxYjVPYwMnOuKDpVRsRn5CSbglIvDldjloU8eLw5d4ptEtWH/zf+iHumh4
	P1DrwjG1n+egqikjzTisn7pd0uX/JIgrzJ0E0/G0+JgZ4qIvpETlPFGGfk4duJ4YCyJKlTPzFmF
	KZ45BP9+IGsPl3D+Zwwft/AL+DNoWLsvXCu+QZRa2q027F/2Lw266cqrpkaYKEgy/y8s3DXK41C
	QFoQ1/ax68QVmrZ/bHmO3UeszgD/esQoXeFPgsKeeTszCGKB/byhrP9TWft6+aNZvPqVLWCdlNI
	GkbdBLwRVAW6E4VvSY92PfOjnCQ2QOHwrqdePRAmGnVEqPDfw5CURtrSko3Z2d+O0rBiIT1toKM
	8xOHHXCKZhkT0E93y1J7hoha64xVufBo0Zy8793Tf+115hm4pT1YpcHtFxGs+FfXI/3QJnYFMYu
	l3zpEiAGGLK7/1bZiJ+hjYW+IYn1ZJyV34lMn/d4LoXpbtISgfQZyKfymACUrgtW64brRWkuC0P
	wYfx83ph869Lwy2OvrtPCSi6rU0ywAZKhzRPGv39WoxYmPj0gRUGqXvng2W96Qk6PVIyc9drM1y
	8tdKPOfszLVbs40EufQM=
X-Received: by 2002:a05:6830:2309:b0:7f6:ec23:7956 with SMTP id 46e09a7af769-863152f7039mr4827356a34.2.1795204545560;
        Fri, 20 Nov 2026 11:55:45 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dcf38sm2703953a34.9.2026.11.20.11.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:45 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 13:55:38 -0600
Subject: [PATCH 4/8] media: mtk-mdp: Round MT21C sources up to whole tiles
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-4-877dea14c3d0@gmail.com>
References: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
In-Reply-To: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Eizan Miyamoto <eizan@chromium.org>, 
 Francois Buergisser <fbuergisser@chromium.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Youngjoon Lee <getfeus@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795204536; l=1240;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=5J/eI70FCyDjB2S3myLsMuolgA4DStIsxM91Bga1384=;
 b=SqbifpdhBYdDKEWSD1Bg9yo3dJkJj/+ZjLhPLwuCFT2ajdG3xUkTtmCGEe0nVkbHMfOyIpOuI
 2jFrbzN5uKiABZiVVyvpT+MJPpE0NCPpLF9mPq4/OmLydHf+5NNUDB6
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_115547_116539_E93D9FD1 
X-CRM114-Status: GOOD (  11.93  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

MT21C, the MT8173 decoder's output, is laid out in tiles of 16x32
pixels, and the MDP firmware refuses a source of a size that is not a
whole number of them: converting a 1280x720 picture fails with -EINVAL
for every frame, while 1280x736, the decoder's own buffer size, works.
The alignment was 16x16, so 720 lines passed the format check.

Align MT21C to 16x32. mtk_mdp_bound_align_image() already rounds a size
up to the alignment, so a source covers its picture, and the visible
part is the crop rectangle.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index d2813890cceb..34d02de4453d 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -40,7 +40,7 @@ struct mtk_mdp_pix_limit {
 
 static struct mtk_mdp_pix_align mtk_mdp_size_align = {
 	.org_w			= 16,
-	.org_h			= 16,
+	.org_h			= 32,
 	.target_w		= 2,
 	.target_h		= 2,
 };

-- 
2.56.0


