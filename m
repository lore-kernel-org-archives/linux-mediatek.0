Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE9FC636D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 04:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tv51RN8ZPOSL8FQMrMpj33QZt/iLBJxo7WnaABcymgk=; b=N/B0JIlseuBuDwLu0v6ZmPkx+8
	wgiLimem2/HaoAjy6Iu0rFYzahJxvWl+ZI5s+YnnyXZ9ZAeut4wnV87cfi6txr30t4s6KDJXUV6hA
	iruVUmvI5wsPlnbLEnzgqlRagQrLDpw2+HBtSxrzfpqvgCkKRALRvXJLWI1X9DlN2wfry7uAPk/BK
	tGad1EJ2nJdCkuZr/WbZnVZN5hvUYJ/L0dRf5e5aEm95dHL7Q0+hQbBWPGVJAgHIEmzqw+vl+Vtz5
	QD23BqII2mejHXA+QoA3p3uJU48zC0jApQ3uCweUck832Wt4URVt/Sz2Ms2QjLDbOtKINzGmaL/dM
	MRSb/7Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSs5V-00CZKR-Ne; Fri, 17 Feb 2023 04:11:09 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSs5T-00CZIh-0Q
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 04:11:08 +0000
Received: by mail-ua1-x930.google.com with SMTP id 30so677434uab.8
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 20:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Tv51RN8ZPOSL8FQMrMpj33QZt/iLBJxo7WnaABcymgk=;
        b=DYxHCc7b94d68sW0RoGk9gagBMyxtdDN6ZZy48NmvLaaHnt38gta0+CDNPAbYc3so4
         /SgF9PF2nYjmkmh2zYbcPTz4Br7W9vvhQYszgRZqFtzcBwgio7+SC1kFTI/lLJAykPBk
         OBk+xsO16aSE1VkdBd103+usgkctZt32pu9o8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tv51RN8ZPOSL8FQMrMpj33QZt/iLBJxo7WnaABcymgk=;
        b=uYU20I/TTU2vHl6a3SiPfCAmP6Rc+SV3ZXLlXY5wgvoB+TgcEx2krX/OUwZzlI93Hm
         dJVn1b/7v1re3fr6rkXdhebbJEa9/4qE3uf5dzLWmFT3qAXg6PIPKrBE/eHJ5h9cmBNw
         FS7xBOjbwJmdRWIOQzG691iFSf1hEYaUBRqsa7HhCORxyNu/ckVNuBwg+0V5mOKSLGv7
         hlomhAq704fX3H6KPhubvXBZrboc+M6zLg9WoTdMDTfxu29kOoYb1vhX5lf9s5FdKm9Z
         3z5WE0EmfHQ2D3V7kUTj/c32W9GiJNSFottUnMbTr5MZOHlvI2MOv2AAtiG/e0c1u5YV
         9chA==
X-Gm-Message-State: AO0yUKVQBq0un+94EhOLO3WNGKaL1/PLWTlk94MAfco6Na9bGJbPisBY
	14K1yArVhzBMHpoY+ox+7yIQjRArSAXJRRlnJjCCHg==
X-Google-Smtp-Source: AK7set9g5rkkJR+rAneFO6YGqzw7ZUvJlNsFBBbIlTyh1g8j02B0R2Ks5BYAGdkMReLp8trUMQdhXOpABSd7Re3e7rg=
X-Received: by 2002:ab0:6f07:0:b0:67a:2833:5ceb with SMTP id
 r7-20020ab06f07000000b0067a28335cebmr1346837uah.0.1676607065792; Thu, 16 Feb
 2023 20:11:05 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-32-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-32-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Feb 2023 12:10:54 +0800
Message-ID: <CAGXv+5HUBj4v04zhqVgQApc+uq_7U7B7wrydACLHBBOmy2CVeQ@mail.gmail.com>
Subject: Re: [PATCH v2 31/47] clk: mediatek: mt7986-infracfg: Migrate to
 common probe mechanism
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_201107_066334_91F00FF6 
X-CRM114-Status: UNSURE (   8.05  )
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

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Convert this driver to use the common mtk_clk_simple_probe() mechanism.
> While at it, also use module_platform_driver() instead, as this driver
> just gained a .remove() callback during the conversion.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

