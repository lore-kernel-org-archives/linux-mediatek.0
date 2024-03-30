Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3A0CD1288
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Mar 2024 20:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tE55+oHy1SdFZMDti49ppLTo/iHekalp6UeR7soZNdc=; b=rrMTtftjxZ21ihrqoZbfdFkXmQ
	3RxjtrTd72XALBlZU/SAlIpnNiEe7/475iBuvu3fwgoz45pg4X5CjcClaobc1qEgEhX1qPrYtySWl
	FzHr8Q17Dd8tlzYg11EkfJuePqbJ95XMW+47Yqf5bqCbUKjamxgLrNSsx9KtmMiPDLn0hx9SeRzd/
	yms6ZHOOnF2EW33/ZDKtGqNT4QG0bIcIjQ0Qw64Cnchhz8EMDd2KUqrUMlvGWBv4ZFtAjXzGVOGTf
	4A/DxXdXLJd5ZYx0zP3kTbwlTL4MY2mRaMgGAjq3wuEXcZkAvV1c/CCA3mrqGJvSn2QwJREv/z87X
	sGF/U/Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfZB-00000004Ce9-10m4;
	Sat, 30 Mar 2024 20:44:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfYU-00000004C7s-3W6l
	for linux-mediatek@bombadil.infradead.org;
	Sat, 30 Mar 2024 20:43:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tE55+oHy1SdFZMDti49ppLTo/iHekalp6UeR7soZNdc=; b=PpO/pkCm06wEuVnCr4YZBjW/nG
	Kd/j10D94A52H30ZF0inRIFY4OUhFKoVvtzHxuLRscuLsca+jPfxbuzLM3yZUuDmqxhifC9JQNFwo
	twOlSdGhgTMY88FKst2hNeFGQ08DopnnJNmCBmbSEqqp16JEDwRpwh83t+uKLe8MbETS09x3LmcK8
	pc2GYvL3dWHMvzcbb82yius2/+ihYGh9zTKUPGszhs58g5IWFxehmkfHaPXAwi67FqblUk+cRFFgH
	IGFnGZv1yuYVP6kPo8s1JnVEgBDgaUuSPtMQyqatelKIfAK2XG8BHiDkiwA06Po/h+7zPghOrn1iU
	YdVmL+/Q==;
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqfYG-00000002EIw-3BnQ
	for linux-mediatek@lists.infradead.org;
	Sat, 30 Mar 2024 20:43:56 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-33ed7ef0ae8so2005363f8f.0
        for <linux-mediatek@lists.infradead.org>; Sat, 30 Mar 2024 13:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711831423; x=1712436223; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tE55+oHy1SdFZMDti49ppLTo/iHekalp6UeR7soZNdc=;
        b=UA/uxqVzhX0rDPtAfkFMWQzxA/7gnX7b5JxlIF3h0jS9UoQ/X1T4klxuJfmXbWQXjW
         Pk0Vqveb6iy9GqdPv6I9LBgTPKGNgCd6qZmv3+Qu0CqrjO3wZ/A5ZFrkUjXHGiynrg/q
         JaLwv9nb2bwTizeR76EMJJz8N4aEyLLkh3gS5uR5HvnPLpbAw7GSXOyQpc5PTrtmJyjk
         Kvw8+uC2a+K8K9V0A/Rcd0Ns1Ntw5Vy025ZL/1Ms/ygJ5yrCpwWEPOTJiTSqpFIgg6Ao
         oyrLD9aeGnhoYdZQ2YzEcibHZ/7XJiGuXh2WcRcSRN/CQPeivKsNDy54yCM1M5yNAa1V
         KazA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711831423; x=1712436223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tE55+oHy1SdFZMDti49ppLTo/iHekalp6UeR7soZNdc=;
        b=QQRAKp4AWK7LeOC5wNhCTo9a37Sp5SiKqcd/SVWx5bhNqr4cbkrhcZKtLR7zK17DE9
         aNdgcJXoJhjSJk4QVS+7lWsAxv6WXESZM1ZmsMoytoKckn+0Qto6l5K1wPetvHY8eXA/
         QbsCwVU8NML/oaiNuWGzL+DqpQwxiMxT5gYHoUz+5en1MG8g0Px7latoYGNdbj7QgZXO
         Y70Qegb8K/FJLRrRjOC4RB1HiOXU3oIHXkJ+UV3b4exLPfTm7ZFydq4cXWWYsNNK+aoP
         V/hMXDmlbnKscPHmAiRuWEwoqYlradrSh4dqXht/46N1EP3ZhXytGSmFwcF8wdETxvwL
         VUBg==
X-Forwarded-Encrypted: i=1; AJvYcCUgcUgWUJiwO7pRJggrAXp1ClfkhNDg6BUiCLKQanDWLtfZW0ICTnzupUdcp+IFLBgD3T4dGXtqQno5eALJ6NQqcfEZgKItp8Asqo+Z4Wz+cyrf
X-Gm-Message-State: AOJu0YymSW29heWPzQGTpRKamVNtfEqTdPXfr1IpjibALNw++WoL2zkf
	XziMj6XqAHXgAazHm/xoABL0esFsZQW6mvr/a4ecOPmjjSnXO55By160eBbVvts=
X-Google-Smtp-Source: AGHT+IGhj6aUvEDGcPyq+BIjFVcHMWr4SCkwY++xRHGQ99myAD65Sbm7IyItf+0BA4rNbjIYqK9HxA==
X-Received: by 2002:a5d:526d:0:b0:343:3ede:c166 with SMTP id l13-20020a5d526d000000b003433edec166mr2587207wrc.68.1711831423068;
        Sat, 30 Mar 2024 13:43:43 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id o12-20020a5d4a8c000000b0033e7b05edf3sm7231299wrq.44.2024.03.30.13.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 13:43:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:43:21 +0100
Subject: [PATCH 10/11] drm/mediatek: mdp_rdma: drop driver owner
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-mediatek-v1-10-fd5c4b8d633e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=838;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rma3zTFbs+wEApKyePcrne7HCkkuvoEKS0IhtWThFuA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHlsrCBkLAni5OwOGut1qOb6HE9LI4wMpnfhf
 n1aFWutFbiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh5bAAKCRDBN2bmhouD
 18TRD/4hW6BmN4P/LbhIRVJSb1k9TFXOIB9cs6FIcrKfP12OOg96bu9RGCDfqrgclJKkoX37g6a
 L9PgCn4kK+nn0LNe36FCIyVvSuEcjJN9+L8BKV4//9XSt2e51YTTAOftpHQiSmCZIqthA04LBlc
 AC0gnGoXRcbX3fcdFkDgX6hFf6ToGnJoRu6/X4PyBokuQQ8BR+Ur7uZam2g4en+JI/+7IfgMC1d
 k6yLqsyKDM88+tu3blzU62agRcLDQPd5grNTqJuucWoZst5v9o1yITxlmCGUiNjks5psg/+9d2V
 QV/tG0gWaqr88RwaN6qOg+vH3uaZNIJMs3PtxnwJXDsXeBTmOornUfpNoex/3dWoXvjvZKZLLk0
 Hue2CNIzFX+YU72PMe3ISgRSb/IOl6Lcu0olEd0sHM/LOLM9kPAdXXwtFq19NBm+wGRZYlVDODp
 CcvzB6XhOHLs1favpokkW40O8N65NbEoElIHQcLVdNkdHglONyHACxOBTOjuB/1/ngkKDuji04h
 Uymh1ShYQZme+rKTAAPwB1fR7C7ngwGJSPo0hFr2z8tGWoQ+XK0sBiXPdJe8AnhkX9QvYEgoNdx
 qbJ8kojb6R3jVRU6pNebLl/QZn92wtkY/TvwuQFFjVmWgfj84VPb0dKfvozoOeHomg/XMHSqhiJ
 UB1nDx7vuAY2Q6g==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240330_204344_883839_2BD55F06 
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
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
index ee9ce9b6d078..925cbb7471ec 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
@@ -346,7 +346,6 @@ struct platform_driver mtk_mdp_rdma_driver = {
 	.remove_new = mtk_mdp_rdma_remove,
 	.driver = {
 		.name = "mediatek-mdp-rdma",
-		.owner = THIS_MODULE,
 		.of_match_table = mtk_mdp_rdma_driver_dt_match,
 	},
 };

-- 
2.34.1


