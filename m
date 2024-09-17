Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 602D8CAC593
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Sep 2024 17:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWO2K5IT291YPVVlABU0X2IXqhtsWWaMdnFFVbIS0nQ=; b=lA9Mktznw7etRqyZncij92wc/o
	+kcF99kU5Gi7kzdhL+EERnLSA03UAZx2qGIb7Du3XDADBnuEQsPOtmvlD/juW3egh9LTTCTFJnBRN
	qxCrr+0CJzpZwEBrwQ9qdSyL6azD7V1yyIGNCko6bh7zCAmeUwDG15NGq/IFttdx8DiJ1VG16IIff
	qzen14V1dgOWFhRkGgiNR+lXnCr/N2DR9KB4GjZgGNU/Ll3eva3e+BVbHy9eH8bFwv2OaapqNPjYm
	zzDkRnXaIBvqi7Ab18qAWzOJAppEHFwn3DhTqM+MIZ5WTCdEqIOn8dmsf9fAGVmUrUnvQGeyM0FAq
	Vq6MuoSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqcFD-00000006dOy-07lx;
	Tue, 17 Sep 2024 17:44:07 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqcE5-00000006dBr-3n8U;
	Tue, 17 Sep 2024 17:42:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1726594963; x=1727199763; i=markus.elfring@web.de;
	bh=pWO2K5IT291YPVVlABU0X2IXqhtsWWaMdnFFVbIS0nQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=nOLSqfeUaAi/83mr3M7ve0VpFC+MafCe5E5429bRzapNrRIOPMPsRzkVLZO1K/H3
	 2bR5Rda94WOeJvm0+8XiyVygNF0W1PxKTRaEJ285+FjrYCJ8RQysQLmVMst1jsjEY
	 rrlIlQcoPH//5mTrQUnbT3L1nwPkkCPpY7AQWeqwGgqB68KTh1ahcnGA8gEJHf2bO
	 a+P6c4m8SfDU2SQOX33RY9Yhs/13em0DGRGxCweNTKT28e5ad/m++RdBQuzVL/gP6
	 PpXkmDbTCMnw7Bh/3DCETCfedAdQWYrOKZlfbU0LYxwJehAh/h6/kMQNf2TbX7Qxd
	 R8nCzfd/eOc7ATV5LQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.85.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mmhjm-1sA5bw3xmo-00fzWz; Tue, 17
 Sep 2024 19:42:43 +0200
Message-ID: <aa103a36-8cb3-4232-b4b7-3ffd117e303b@web.de>
Date: Tue, 17 Sep 2024 19:42:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] drm/mediatek: Use common error handling code in
 mtk_gem_prime_vmap()
From: Markus Elfring <Markus.Elfring@web.de>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Alexandre Mergnat <amergnat@baylibre.com>,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Simona Vetter <simona@ffwll.ch>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <254d16d9-d56a-4f26-9914-db75e7aa4287@web.de>
Content-Language: en-GB
In-Reply-To: <254d16d9-d56a-4f26-9914-db75e7aa4287@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ezgH/8fZhFI1IrNh24hqxGOueTJdBwXGIwmeneXLT7XGQmG+3V4
 z//xu1M6oMbjsPr4NXuaJ03mTgKWia4i1uBGqfgmZ8Q28a3Dkm65V1D+MJmuufEsX0sg4mc
 tjL9pBs6prJYXwFEZyRK2Ivb8gMtHOle/MHWPYU3IU8mK71vUkSWAZrcmaXiepPEzCL/RXc
 sfT1Q9i/g1tuB1VN+us7A==
UI-OutboundReport: notjunk:1;M01:P0:aomhZC9t42M=;tH2TV6U/oikQBx24ke6cbQaKNNk
 5aVG/0ORPx83Ltc+EJ6HAwycWg8bWs4jcBpBMqoB48FpOl8kA5105zrzU3FXdzIWxSMS+bGn0
 GxkRFke8i+DFXmE5ET6OUboflcwOLDHBvC22gFwVizMbvS87dZh9a/drZ6PKQ644DnnncFiTr
 71eZ83L0dT7bxdAPQ9c6DhgBp6w+ulfyKeioAmHvAsK2yhoaNvW4crGDETlKaXqxaO7Aco/L7
 N4IRnZUyDH77qweJ1nWZkU1Ol1cL9X+Yolu3XLex48Z8wdcMXYbVkE4/qgJ24cDJB6QU35Z3N
 JqBzC1GXbeXzIei4+gUKeopqr2hR0p9dq0IhXOMLzFQ7bEz0VpUoYNt+5bGw8ty0RNrxe89JN
 tAHl17rzrScENx72+etL1s7YXg4RHBNCOEz2FDuhdIaEOqoE1D7OsusXT0pXObw3q20DVWD/Y
 A+kP7X8XUnjM1Yi6Tqg/oWPtOf48FnBPwvN+Ee77N5BSgAdPFTZKGUHQwhIiQtBygT4EqwSzp
 1gAv+gpTUFzQTb4JJBvp8JUM6BrMSfYKntquoBp6MiHB+WAKN/2Lo4KQmXB2qeQeWqRM6BUp9
 vxCNMZDdZB2fo3U0v/LCfc36U9kKgmjrW7nX91SAWEjMI1HVLudgGL6a9GJcBAqE1TccDSBI8
 qe5WM+Vknyw3ru4gxh5d5AJRp+nizJQu8576r16nQkg0Kd28UEFKcdn2OU9X8305s0P/xIXmz
 gbOpjrW/pd8Tq/1bLxxbHIk/xaoS+w0cQa0CtLHMqk6bj7McA9DExt33JwE/j95JViOIxc2so
 BrSSOZpqessm8iBfa5zGFMHA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_104258_235993_4D3C0107 
X-CRM114-Status: UNSURE (   8.86  )
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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 17 Sep 2024 19:06:23 +0200

Add a jump target so that a bit of exception handling can be better reused
at the end of this function implementation.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/gpu/drm/mediatek/mtk_gem.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_gem.c b/drivers/gpu/drm/mediatek=
/mtk_gem.c
index 9c7b7d0a3ffc..5713156efb4e 100644
=2D-- a/drivers/gpu/drm/mediatek/mtk_gem.c
+++ b/drivers/gpu/drm/mediatek/mtk_gem.c
@@ -251,8 +251,7 @@ int mtk_gem_prime_vmap(struct drm_gem_object *obj, str=
uct iosys_map *map)
 	mtk_gem->pages =3D kcalloc(npages, sizeof(*mtk_gem->pages), GFP_KERNEL);
 	if (!mtk_gem->pages) {
 		sg_free_table(sgt);
-		kfree(sgt);
-		return -ENOMEM;
+		goto free_sgt;
 	}

 	drm_prime_sg_to_page_array(sgt, mtk_gem->pages, npages);
@@ -261,9 +260,8 @@ int mtk_gem_prime_vmap(struct drm_gem_object *obj, str=
uct iosys_map *map)
 			       pgprot_writecombine(PAGE_KERNEL));
 	sg_free_table(sgt);
 	if (!mtk_gem->kvaddr) {
-		kfree(sgt);
 		kfree(mtk_gem->pages);
-		return -ENOMEM;
+		goto free_sgt;
 	}

 	kfree(sgt);
@@ -272,6 +270,10 @@ int mtk_gem_prime_vmap(struct drm_gem_object *obj, st=
ruct iosys_map *map)
 	iosys_map_set_vaddr(map, mtk_gem->kvaddr);

 	return 0;
+
+free_sgt:
+	kfree(sgt);
+	return -ENOMEM;
 }

 void mtk_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *m=
ap)
=2D-
2.46.0


