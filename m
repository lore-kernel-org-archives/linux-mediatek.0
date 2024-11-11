Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC9BD12D7F
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2024 07:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKS2ivMfGZwRbgqnCIUlWddkSsDm0WEsgdFK/5SEzuo=; b=NRvsj8TNp4YYXyFlD4T52ryoD4
	nVjCU92iEazvEsNyIeyeRcR3cvyv3JIJ/uWKLlrdAwefxcGY0CXnKcPoRpgmU716Y9KDXYpD2Hbz+
	KvIA8fjgIRy/A2wsC8eldGsOT31vZVY//IDw86Fc4/yE0kbsMKOasJF71PoeBuWlCkpdXTwr99kQe
	0YnbaSldxrMf6RzfsKbQdgjwEtYqCFtf2tzKM2VPIrt80efN/6QqA43tPH6LFG9n8Y4ErdbxppBGI
	sQFxgkAWZU7p+PyVuRgdx0+2Ckc3HO7CL+wpNqFhk6IjNk89Y2gf6KZ1MYx1V22pA3gk1TmdXk+Ql
	YiZ0jCVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPDk-0000000GiFx-1pjO;
	Mon, 11 Nov 2024 07:52:24 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAPDh-0000000GiFH-39uM
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Nov 2024 07:52:23 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-539e13375d3so4838577e87.3
        for <linux-mediatek@lists.infradead.org>; Sun, 10 Nov 2024 23:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731311539; x=1731916339; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKS2ivMfGZwRbgqnCIUlWddkSsDm0WEsgdFK/5SEzuo=;
        b=irDDtwo/nROOuK7BvZPIf7NYi884zEhGwakWqZHFNohUf5TyipT1nlDed3/Ov9OJLr
         CclhBYq2R6zrd98kalHIz4hCaZtqjOQuXKfQ03DHkvWpjk2wk2FZioKYxZzoNdf8e+pc
         Dfw/RTjEh0jQRZZFFOmboSJXWWC22GNyx0mto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731311539; x=1731916339;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CKS2ivMfGZwRbgqnCIUlWddkSsDm0WEsgdFK/5SEzuo=;
        b=V858HlukTFxVw5wX4gAcgVh9LrtDKsyZMxHG6NrIt1Um2E13DU8RKOurZRYpJwAIZr
         HR4Z+FWEm0ZhKvvweLMTNwiawRD1R3U4Aix2ctitWqEysgbuyBhl6hJmrRroNTduYWUm
         qp1NefrBG94yknFQ2KCzq92/vgSjzjoVW6qLhaPSS0UJ+xhZFcr6bXaSB+KwmI7Msy8c
         hmbohplPtkdvxCs1Mz+8/mWkwpdxSM2T4zuXCp4GAsKZj7HTRpS0b6US7cEDcx5z6ctF
         pJpGVl6+6i9MqcO7PFB+Eir6BTCsh4dgniwlcc9TofQFDm4gzaOPN1HUrypnza7iOuKI
         6sGw==
X-Forwarded-Encrypted: i=1; AJvYcCUN9mHdXq8qi6HFmrWCnmiro2e4HUUK0uIFV8IiMULgiyBTGp4KQRznqRkNvK3swACc8KBinDhym0QBy8PrGA==@lists.infradead.org
X-Gm-Message-State: AOJu0YybVUS7g5K6vuLEElRks1qgz4giUZVPWXtHtBmo1iZS+6+ipA1y
	DT/yWdOLXK6tYzi2Rn415I+T4S8MeHgTTkkc5AgCM4ihy1MIXsswMFLl45F6WgT93McM4VAa2Jp
	WKP0k0I/jrVrEf65owY15oKXFxwWlwjrjND5p
X-Google-Smtp-Source: AGHT+IGRHfTP9Kqq9mD5swqZoNxYRg8klYW5cXpLbVdWWLihAGznsqQ/hB9z7H/R/X3QaXj3PIOAVkGZbB37Lx2K3FM=
X-Received: by 2002:a05:6512:2214:b0:539:530e:9de5 with SMTP id
 2adb3069b0e04-53d862798damr4078071e87.56.1731311538956; Sun, 10 Nov 2024
 23:52:18 -0800 (PST)
MIME-Version: 1.0
References: <20241111074030.25673-1-ot_cathy.xu@mediatek.com>
In-Reply-To: <20241111074030.25673-1-ot_cathy.xu@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 11 Nov 2024 15:52:07 +0800
Message-ID: <CAGXv+5GC1zoTnSQueDOtH8JRB6R5cg6mBMzAoRTsWPKVWAxGyQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Add pinctrl driver
To: ot907280 <ot_cathy.xu@mediatek.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	sean.wang@kernel.org, linus.walleij@linaro.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>, 
	Guodong Liu <guodong.liu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_235222_085754_5D44493B 
X-CRM114-Status: UNSURE (   7.86  )
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

On Mon, Nov 11, 2024 at 3:40=E2=80=AFPM ot907280 <ot_cathy.xu@mediatek.com>=
 wrote:
>
> From: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
>
> Add pinctrl driver for mt8196
>
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Cathy Xu <ot_cathy.xu@mediatek.com>

No tag?

Please rewrite the subject as "pinctrl: mediatek: Add support for MT8196".
The current subject is too broad.

ChenYu

