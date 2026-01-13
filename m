Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71D03D30CDB
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Jan 2026 22:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjrV8Ah/L7zNpoB870nEG8kWEgsLpqEksFVHqYTKqU0=; b=xYYGmYcFO9gq24uKOhfAdr3RyF
	4pWWJj2L8gu/ogdTlfja8fbgnGkozxuYWfn1QK+Sb7LNgfu8pFGIbQXgOdnfxmFC0D7ecRPiL2ORE
	ZKKH664WYH1a8mFZBrkt4yfkE7YUhm0Oxk7Ku+H1vtZwz0axySpxaPFGQ+FFJAMYAM6+ZGNMFrMxh
	KXhtsemCftiOEtmVOO0nQ/0qCS0NBUz6bbIC0bezJUsQuAAr4GeWLvOawDP1mCAHQR4ZB0cO37WIq
	uY5dstaCuzXplfzwStt1lWIL+EaVoTcRD/b9hAjk3AsyD1kOPWwzyKQm+x9dRDKp8ckqmMI4xCJz7
	Wsaqrjnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfn2Z-00000007pxn-47Wv;
	Tue, 13 Jan 2026 22:39:07 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfn2X-00000007pwG-0WIS
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Jan 2026 22:39:06 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b871b6e0c70so433804666b.2
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Jan 2026 14:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768343943; x=1768948743; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pjrV8Ah/L7zNpoB870nEG8kWEgsLpqEksFVHqYTKqU0=;
        b=JRe1TVxal1Y3WGk9vJX07BBfQ9xzcX8jwYqdUcRF/uoc/Tg3ebb6mrOuFlNvMj5akU
         5bdgbbbKoD1rhPMAH8VE1Td6QiUYYgNqOqxjSa4B5W9jZGAXFgimHfa0mMB8JGwUSyHs
         DhbDxDqyAGunbTSIYs/9D8nSKcc+VUrAz9lCuFwKfJB11erxUxpOqsp4lfF6YNfx+0sF
         Qy6mGu5dCTjIqr83JJKTSqQGgA2fHnv7dUxEgDtmKzPYqH7Qb2Vv0DKwqb45b1zF8/fb
         cRg6Y0YlxAX2MVoh9juOl4b7UCOv/74SUW7igoOBfiX5JTZVUCUpZPI1FgnK8yHTcqX5
         FtDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768343943; x=1768948743;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjrV8Ah/L7zNpoB870nEG8kWEgsLpqEksFVHqYTKqU0=;
        b=mXPq+de9kezBDD974877kY+XJgv5tNuA6Z7WAngR3dHQr5OtmwyfK+eWjuyeOalOI0
         9Iijf+nXXQxATF7rii8RTfGmNXeTxCdjQ6aGIr7SojGZ8h148RYq7ZwKE4kTrkrfvXAT
         RZt3L7unuiUK/9Y6ylNPq9b1xJkGceMrWycQSGRouKd93GZHZj6NvvkbtZMxlFj5Nu/L
         A/fTKpf8IXBzpLcx6Z6GPcgCgswuB3gfX8CC675EEWCMM5Gz+k6ay/031PCEapfRxv3z
         i0i64sXb7905Y3CiaX80CuOuhRRpbJG3ORuY/Sj2e6F3ZQtlQP8l6R0IGoHpeAG9pOH5
         sK4g==
X-Forwarded-Encrypted: i=1; AJvYcCW9WhGwr3VGGKjZuM3UNVw5lKnaqJvwHwzdOMWJn0jdqFAIr04SEqkWMOZQfMm63jV3gdeILzcEnSq7dunqEA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGHk4LAGJrh1gk2gtdfPyVDB+5rRGmJVHpE63xsXtT6FfMniax
	wKS9P9Z9XVcEeP6N5hW7GlSwwuZGn4bfCjRoGG5/56BsAVLyTLX1sMhVkvjnY8C2xW4TpdjUK/z
	CnKDDSokXe+VbDJtY1ahSPipCKeAzpZM=
X-Gm-Gg: AY/fxX6RLu4H94mKOtPaoepB9BfS/Z2UKYWZVp5F3rGNq2c9tT9+McyPMV29zTI5LXh
	htCAeg2w8UA/JNUYf0OmbGslzJ0zkERCum+/czhC0ehVBJowSaDUuhnK8ypyt8J6BTSOhR4gemc
	G5HFnjryXL7+dCDKk+lHEAUhok/E29WvNpjECX2EcPqkERFH//ZUmj/TqiTTrsycvfw3ybLUnEY
	DWcAe3M7zqLEtRhLSBvv95ydBYrBC1yrYRv3QK3mIDnWvNfMzU0x+l9Le4uYYW3Yw/zoWJ4TeIN
	pGgeh47bGXLfjdMQ5ZeF7Wi7eg==
X-Received: by 2002:a17:907:d27:b0:b73:7a44:b4d5 with SMTP id
 a640c23a62f3a-b8761139a87mr45560466b.41.1768343942489; Tue, 13 Jan 2026
 14:39:02 -0800 (PST)
MIME-Version: 1.0
References: <34647edacab660b4cabed9733d2d3ef22bc041ac.1768273593.git.daniel@makrotopia.org>
 <252d6877-d966-4d19-a38c-cc83ba908494@lunn.ch> <aWZVIBh6AKiIaxdr@makrotopia.org>
In-Reply-To: <aWZVIBh6AKiIaxdr@makrotopia.org>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Tue, 13 Jan 2026 19:38:50 -0300
X-Gm-Features: AZwV_Qjg4zpsS4od6KBCg5IH7ipEaILyUhtFhNBfGxqCxTWtWrTgv-97YJUF4cY
Message-ID: <CAJq09z727C=9mh2a0BEVcVLKkWcdVOL7oNvVBq12k6zm7nxXZQ@mail.gmail.com>
Subject: Re: [PATCH net-next RFC] net: ethernet: mtk_eth_soc: support using
 non-MediaTek DSA switches
To: Daniel Golle <daniel@makrotopia.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, 
	Sean Wang <sean.wang@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Bc-bocun Chen <bc-bocun.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>, 
	Mason-cw Chang <Mason-cw.Chang@mediatek.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Vladimir Oltean <olteanv@gmail.com>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_143905_165576_CAA0CDAB 
X-CRM114-Status: UNSURE (   9.50  )
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

> MediaTek folks also got back to me in a private message, confirming
> the issue and also clarifying that the length of the tag is the
> limiting factor. Every 4-byte tag can work, sizes other than 4 bytes
> cannot. As MediaTek's tag format includes the 802.1Q VLAN as part of
> the tag itself I suspect VLAN offloading will still need some extra
> care to work on non-MTK 4-byte tags (like RealTek 4B, for example)...

My suggestion is to enable it only when sure (mediatek tag) and drop
it otherwise. Something like this:

https://github.com/openwrt/openwrt/commit/2603d6d81d1a088c6ad271fe20a63fa6e3a75124

It is not worth it to risk enabling offload for unknown cases.

As Realtek was mentioned, the 4-byte tag (rtl4_a) is for old SoCs,
hardly paired with a mediatek SoC. The newer tag, rtl8_4, is already
too big (8 bytes).

Regards,

Luiz

