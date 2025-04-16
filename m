Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328FEC369BA
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Apr 2025 07:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xWD5DtO8Zmjj8hm/jgNeXXYBfzD9O0HKgWcyYm/pe+g=; b=1c8DGFwvSmG6+oNwlX2yIhgTMJ
	q3fA/ht0BoaaeKEAbvk/tiY5qBQtZLgeoS8DXlRJkWpWe9CmyqCuB2ebl2wlPnper+ij58IdSbHTO
	uLqYTGcyNuu8LfoPz2dQoDUSWMJwOJkvIP9QCFeX/SUufEiwSzmHZGnBX07VUpBKW2NvCGybxhDtF
	q9tNa1D5/HLfMCAbJWLk8Q5oyLGQUvuh91HK4DrExE5VkwuphLWDwYzCoNe6afieBXQMy+vkoQkIK
	MnyqyCPUpIpHuICKxvDKH8aEYYEmLcmBju4fA1VA0LY6aI9qA10e8wR/fiAZl4lbguUNW3/KfBztO
	QwFeUkZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xC7-00000008c8H-19Vw;
	Wed, 16 Apr 2025 07:28:27 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4x6e-00000008b3V-23WX
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Apr 2025 07:22:49 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-30c461a45f8so56365501fa.1
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Apr 2025 00:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744788166; x=1745392966; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWD5DtO8Zmjj8hm/jgNeXXYBfzD9O0HKgWcyYm/pe+g=;
        b=SQ2JhPr5W7ircCiYq+TjJ2UiNiLictiljDv++6ZgfLBYCO3qRA46askCnodROHRNKf
         imen+o8KHd9saZzTzDHOPdwqr/DxzlMn322KOAEW4i0RzSagP454W+mto8/aOE0NqRqr
         SfGYGQs3kyP8Hx7uI6fdoeaqY/68KDX+Mr9/9Allz4kJOz5zpHNMyDsZ8ROIO0YgvGsS
         u/JCOMleuX90kzUm1b0ZsvjsmTrSA2jN5aQCFaBg990RNcRWVjFvTpxzvWUN/fRWSC6z
         1+FZg0/WitVq/NeGorsEyM87q/ED5rY5AejA0Jbhy1GSWyZbFrEB0jyTHBOxQqI0NWgl
         syBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744788166; x=1745392966;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xWD5DtO8Zmjj8hm/jgNeXXYBfzD9O0HKgWcyYm/pe+g=;
        b=jQCGBVTYSjvtsMfiZDXZ00Su/A4d4raWc4DpJrIFg9UaX0HoCJD/rUrmb4Fty8sqmA
         d3MXMbF+hXsv3vxnhIrRRYfDolqljPXcKc3/7UdnQNNo9Mrq/7a2xl8lB6/qD2nvOWeh
         iuBjbv+/KuLcjL9+rcuHXiSVr+rB0X8Ohrz2r3b9Rd8aU1W7MDEg6FCJLADYaqMqNG0V
         34wvveud/bkUmqILD0HhK4JppcucWqbOvjYaG+I4hMnEV2zHClwnvLVi/CFzMA9QKcrX
         zhhS7OJBC3cI46QoaejyRJpsIWUBmNDWfeblDXb9MD0+N8gj6K86w8TRa0YJ4nLDVtcZ
         DTrQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+KTcaShp6NIrYE7jgPc8fvajRMo40esxFWy5nF6/KHJYbIql6UrYT20ayqWGaiLv2zECT9+m9JRV6EL778w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5+IX3e0amRZSQlby+eKn+nsSq2B7oU5R2rmETxoIxWLzyerVS
	aut+UToA9isjQC4JuJLqcxNi1nN2ug1RYeeUgRV18qrhymVid+gkIKkIeq5Q0lIGW9byRMZWISf
	Ot8/LzheS30MXo6VYJzBUGVrVSixmJwlY6prqww==
X-Gm-Gg: ASbGncu5wPXskE0BbZhoataYN6HGNlg9nfnto87Ei87KQJDKAft7/Tst4OhAuW5/8wq
	YTMvxeKORsnarFPb7TsOjTh/2qXaD7ZlEuxwgvDfmx9ZeE56+8dgfeZ6Yu7y62WUzcLRM/djb/b
	NxWBm5B0JS2UvR1GcUPUPs2w==
X-Google-Smtp-Source: AGHT+IFJzy+zttruUfUSE7DAKwZxb0lvHyIXLpWKETv/eqQTmvTOtmlAPv2KPiXrE9yHLzHL0bc/wktEHBwODzsfibQ=
X-Received: by 2002:a05:651c:243:b0:309:2ed:72df with SMTP id
 38308e7fff4ca-3107f6ceca2mr1915221fa.24.1744788166445; Wed, 16 Apr 2025
 00:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250414090215.16091-1-ot_cathy.xu@mediatek.com>
In-Reply-To: <20250414090215.16091-1-ot_cathy.xu@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 16 Apr 2025 09:22:35 +0200
X-Gm-Features: ATxdqUGunV3YCOGXGIOJ9QSL-oTOhWVqzDgVFDf8RsYkNrat6ruPMmmT7W9km-0
Message-ID: <CACRpkdYUqHzid4Rnuv4arC9wu9fmpcGR22Jc5JzJhyr7fABMCw@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] pinctrl: mediatek: Add pinctrl driver on mt8196
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	Lei Xue <lei.xue@mediatek.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	yong.mao@mediatek.com, Axe.Yang@mediatek.com, Andy-ld.Lu@mediatek.com, 
	Wenbin.Mei@mediatek.com, Jimin.Wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_002248_523486_2A20A2C6 
X-CRM114-Status: UNSURE (   8.50  )
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

Thanks Cathy, this version looks finished!

On Mon, Apr 14, 2025 at 11:03=E2=80=AFAM Cathy Xu <ot_cathy.xu@mediatek.com=
> wrote:

>   dt-bindings: pinctrl: mediatek: Add support for mt8196
>   pinctrl: mediatek: Add pinctrl driver on mt8196

I applied thes two patches to the pinctrl tree.

>   arm64: dts: mediatek: mt8196: Add pinmux macro header file

Please apply this patch to the SoC tree.

Yours,
Linus Walleij

