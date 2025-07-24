Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C87C83F1A
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 13:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+1yeaes/5WO9C98Ce+RQRl+sqAXx+8dUlJLLdWKreso=; b=O7708rDogsTt0Z
	n2FdsksrYYQuOW08eQ0INTHY54WPpRnmdQzcCfZBN5TeYT7vkkpBauis5sw1FplWYOhmKRdqU9+Qi
	NmbrL+gGgHJeP+x+EkBiKPv5+FZasXqKl7RQmsMy2mtvsIGbTyiLM5IvJtNfGiw2j6rY3vKsUoMUV
	mhokrv4NKGOe9ZdGyO6JqNTohUxAQQv7pWG7eLTu9Yp2Nifsks9zqC2xgQ/iYk4T7ZhjlDifngQx5
	pQ6KnBR6CNTUIeob3nKatET59FQJas7hJoOFtwZoUsQAqKRKFWus4M0Cp9iIqIbSLc3ULKRnFTh+6
	Hk0GATHIZPxWNDEo8b8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewMY-00000007YNm-1PHW;
	Thu, 24 Jul 2025 13:51:58 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesaO-0000000773F-0GgT
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Jul 2025 09:50:02 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-55628eaec6cso747225e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Jul 2025 02:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753350598; x=1753955398; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1yeaes/5WO9C98Ce+RQRl+sqAXx+8dUlJLLdWKreso=;
        b=UilMd6ydkXPJuZtXQFJfn9tDX8OtQ36vfLIAzH1zlp+sOzK4WYbVjAaSEuHRRx0v9u
         Mogtm9tcMimyWXrcKMPbzmTaTHBpIenrfPabGSYAaN4EgNj7i9XX2DxnuvNXBLNIPtg2
         7EmRjbV5tttueCj9YWIW8hJ5OCgnFOuP93qAI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753350598; x=1753955398;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1yeaes/5WO9C98Ce+RQRl+sqAXx+8dUlJLLdWKreso=;
        b=LrSqmIVjxwhg5My+X385x7iV6J2Cba757qWrkwy2eMJrOThkMl95GuJgYuaFPzXn+l
         5I/xNwYOpjp3Q0O0ktKVb4lesjiuBwX1a/QdUci0cC1mosHnZuNo/TBlg+E5Aun/7W5I
         8fO/Bvfe3AGQtSZ2rDoEM6bzfKQQSZaOfLSLprvf406S4UbCncPQdh106Lc+ymxvCVY1
         c1QVgGvviKjhROJgKbCw1Ue36+fUmc3AW203AYxf1opcI7ibeLGEUZCnNDCdzJLdGYht
         iIUabLutK5LBdLnzghxKAdHqlDVq0O4fkaKQY+EGY4ZeOpw3Q6Rns535miHj4bigDHnx
         rPQQ==
X-Gm-Message-State: AOJu0YwYex5AuOFG1hbpno9Zo03uufi0A45p9YDyycwivGtZmzxC3ryd
	78wNjVQMv9Sdb50ixKIOyEqzvYrnvp+B9oVpIfvL21z/kzymFj8oPi6iaHTxY9E8OkN/OAS9nQi
	rUNX0Niu01GB7s+gEDSYhpT4mF1FstSOEHbGBvrIu
X-Gm-Gg: ASbGncscJQgPRab45x6L2EIaqMaKSe/dMFr0PF1Mf8aBpVCOUemP2uTjPQzwIkaGDp8
	Ot1r0Mntu4x6lUCnFn7K9GsfjLb5OoKwD/QHcZ/r70lpdoN9XDkAucfIKdJHAifSvwIh6K/4bS9
	Ley1SNQagaPgS6hSxap2xJm++Ed6G/uk8qQdJR/9dASavCh5nQK9g8v7lVYECb2P3BIQ6J2CG45
	lS8odnT4lBCUqqKz+sfSFsJL96t2l/tZ6U=
X-Google-Smtp-Source: AGHT+IGItj9eON5joXD9a2IIIdgBC35OTh38AkPzmXEBTTEZMPnEPcqJK3Z5OhBEkyMLKp8WCCWs6kzvOlePUXbqfGg=
X-Received: by 2002:a05:6512:239d:b0:553:2dce:3ab2 with SMTP id
 2adb3069b0e04-55a51354ddbmr1925545e87.6.1753350598082; Thu, 24 Jul 2025
 02:49:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 17:49:46 +0800
X-Gm-Features: Ac12FXyptxSYdnZvhVmVzcLhUSOXFaRzx8la2O9AgbSx3nJkJt7JLwM6IxluTrU
Message-ID: <CAGXv+5FWV+RtWUJW=e5pJKiSpeK57fHpTrst38bN=1OSgf6P9Q@mail.gmail.com>
Subject: Re: [PATCH 03/38] dt-bindings: mailbox: mediatek, gce-mailbox: Make
 clock-names optional
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_025000_121128_DE16D29A 
X-CRM114-Status: UNSURE (   8.33  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, chunkuang.hu@kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, herbert@gondor.apana.org.au, eugen.hristev@linaro.org, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, kishon@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, linux-mediatek@lists.infradead.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 24, 2025 at 4:39=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The GCE Mailbox needs only one clock and the clock-names can be
> used only by the driver (which, for instance, does not use it),
> and this is true for all of the currently supported MediaTek SoCs.
>
> Stop requiring to specify clock-names on all non-MT8195 GCEs.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

BTW, I see that the cmdq driver has support for sub-nodes which was never
actually used, possibly originally intended for the MT8188.

