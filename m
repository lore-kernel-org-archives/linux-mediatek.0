Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1662CDB465
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 13:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgxKa8AO9ndn9A10MY0AzoFh3nJur0uCTmMfy39Eot8=; b=zINC217lDcQ08LSk+1NrMViH9h
	hegcHaLV1l7OlAXas5OzjL1Bz5c0+nRieIQkp+jalrrhYi7WZlpqSg/OznpsM2z+pPJrQG3ScFKre
	8CKwrWVl6uVa43BklniaLIJnT49xG0JQLed8D9MmeZu3fa2euSAs19zVC15kzHXo01YcZzAl5bIhS
	yx2jy04BWlF7DicHG0aEHEtMHM9WXUKR3xkw+4FUtpw6qFlTbd1csj6opydMWyTPi6KxxmDHLKj2W
	fBM/8sqWXQkufS7ibwj5iRm5Kxn1LK0yUBzUkTkRyC0avVrgkIVXPfEgOqihmjdNNMShem5LGX6bD
	VTito1kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSxy-00HVqP-1p;
	Thu, 19 Oct 2023 13:21:34 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtSxv-00HVnO-0t;
	Thu, 19 Oct 2023 13:21:32 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-53db1fbee70so13369232a12.2;
        Thu, 19 Oct 2023 06:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697721687; x=1698326487; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FgxKa8AO9ndn9A10MY0AzoFh3nJur0uCTmMfy39Eot8=;
        b=WlJXDwPzztGinIv7UmV4Kbc0zwTnWK2uvtTtb5QvlYnulPFQvHg/wLRR0xWR29jzfA
         Q/8T3BqE3TER9rIsxu1fXk1Sh48kQ0NKDr7lCq7yk0hf0GYAeSR+qv1S6VPjxbzHHWUW
         NG/bTxO56cA5L2MklwBF8weAt5sY2dY6jQAGHACg8bf6iGR/gkYF+ZTEvvAOmYyoL0UL
         3QyjztxdMXqSsV0CvFEhmdqdHXPpJ0Or08pv3WzYHE2QqIXBXiFV9e+690uPGIDdKo/z
         yS2rUdHIiEek2Mxs7XJy8jdqc6eflyF5NAZfEpthHPkJZP8KibwiW71yqe0flMhqpw3D
         jifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697721687; x=1698326487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgxKa8AO9ndn9A10MY0AzoFh3nJur0uCTmMfy39Eot8=;
        b=HB3HIjdx3B1Q9GzFZmwPH2x0ejRPFXQVqO7jUq+n16YL5zPBK34vkGhZyqFtI/1ePz
         D2kDoY4/BXk5xHMlSRytAvHryFODUsQB5FBuIKhpWCQU819x23jqYGPPuvM9fiVrYHry
         CvvV7aMbMQDGdIeoMUa+9eV+eqoUK82uU4mEAZ0QJyFNceiUageKKh6OZgCa5D2K20w0
         stHjPCTzSJr/iysMF2VdO/uoMC7gFPTNweprGHf5/o6T4FlYNj0IXADOJF4cDM3K8epP
         PPk4uS2lEV1yQxYQ0VSwcuoKIIB//tjlW1q1+FPKJRg+4pzfoB+1MJLG8dQ9eKOGReFx
         HJvA==
X-Gm-Message-State: AOJu0YxstgTGuJrMGGvRD2eMRONZ+aLDL72MYrRN0B3YwMiWJopDqMvc
	Ra8BLwUx1BuYev4PSqyOphM=
X-Google-Smtp-Source: AGHT+IGPYVxFFY4V5wJ9ZKXaFEG0/Ul9BCX45nfhQeyJcBnICEDGph1b8CwndVzz+OMYm+48TScO8w==
X-Received: by 2002:a05:6402:2813:b0:53d:f358:202c with SMTP id h19-20020a056402281300b0053df358202cmr1823338ede.5.1697721687185;
        Thu, 19 Oct 2023 06:21:27 -0700 (PDT)
Received: from skbuf ([188.26.57.160])
        by smtp.gmail.com with ESMTPSA id s10-20020a508dca000000b005340d9d042bsm4358136edh.40.2023.10.19.06.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 06:21:26 -0700 (PDT)
Date: Thu, 19 Oct 2023 16:21:23 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	=?utf-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	John Crispin <john@phrozen.org>,
	Gerhard Engleder <gerhard@engleder-embedded.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Sergei Shtylyov <sergei.shtylyov@gmail.com>,
	Justin Chen <justin.chen@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Sekhar Nori <nsekhar@ti.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH net-next 3/8] dt-bindings: net: dsa/switch: Make
 'ethernet-port' node addresses hex
Message-ID: <20231019132123.3jcyky3ruxfgstoi@skbuf>
References: <20231016-dt-net-cleanups-v1-0-a525a090b444@kernel.org>
 <20231016-dt-net-cleanups-v1-3-a525a090b444@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016-dt-net-cleanups-v1-3-a525a090b444@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_062131_330281_6099DCC2 
X-CRM114-Status: GOOD (  10.08  )
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

On Mon, Oct 16, 2023 at 04:44:22PM -0500, Rob Herring wrote:
> 'ethernet-port' node unit-addresses should be in hexadecimal. Some
> instances have it correct, but fix the ones that don't.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

