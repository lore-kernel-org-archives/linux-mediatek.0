Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68102EDEC4F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Sep 2023 13:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YrbAZ7p+q0hOYwba3y8YZqHpfIOsVvTzknQ/Q/Cixt4=; b=4AIH2o38H58Joa3eRd4xTCgPhz
	Z/zVpNRz4HLLkbD+iOFXZQ9vgZo4l8jet54RLb0juBZ19bYa/9iGXD55vGGVdfE+flBIBQbTpHfFT
	7ixMfuNnM0kb2/6BU3MEb1Cnz3MghmpnIg1TZfnx5TJWg+jX0U6/Z1Oe69ur0pLkp+0vICgmT3L03
	ymjkIlEjxvfS9FggHWm29TfJtyntOXu6j+cnmGIhq9d5sNLh/N4CkGJ4SsylK6QLqQW8BiPAFwmG/
	f/2uIhsybxQ6r1nAx0TdG6YjlKhTeYOZJ8bkSAzXlVNfhkoIWiBMPRgzjS+ApBgwtipJcSQbWtQLS
	hUUU/nqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgPUJ-005v2c-3B;
	Wed, 13 Sep 2023 13:00:59 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgPUF-005v1Z-0E;
	Wed, 13 Sep 2023 13:00:57 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-529fb04a234so8995977a12.3;
        Wed, 13 Sep 2023 06:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694610053; x=1695214853; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YrbAZ7p+q0hOYwba3y8YZqHpfIOsVvTzknQ/Q/Cixt4=;
        b=Hsif4P+445UQNAyhLCBhURfI1asUABcyGroG8Tsexem8pHwWYmVBJq/6MbNvkYyj3k
         He2l2PGsY0VnAgektzYjQf04FpOaLtj+ZxL7N41mnH5qOTAIEn8elNq7bPxggGOtD2Sn
         +zblfClAEMmB41zqPtbrpXpxq1HNbVbAewHMvUekEonDVxI/orwpHj6GiEao8dsyQmo6
         WTIKHqKc52Gi91AXIZ7lVt8H6kY2pGsJZQcGOiDMTRJiMsVGYCJIfJKhtJBc8chtRAW0
         eyzXJKW8StBFs4VntoaFsCi+4VGPbHKwyMmOcLbfw6I480px3wIgeqWTgAJb+NCc7ZOT
         r42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694610053; x=1695214853;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YrbAZ7p+q0hOYwba3y8YZqHpfIOsVvTzknQ/Q/Cixt4=;
        b=pDqwERA1BCRJRmO3NgNvDSVbA4I4uv2p3SeZyuN0gNzFLajTsWVx2gusvE1gL39EjE
         4CtglD9gYw9a3D+oAnH2tkY2/0te11Em7yaKndzk6YzS66wjlvS8lPYlHtr/flVGfgW/
         Tmkqw5xMNmIPW34ZMQtEUZKobUifvw5df32Yc/3dA1r1r+FA5WBxSSW43OFEokUoa13z
         AqGJpRC4vYBQIG2kb6T4EekBdVhvKwE7gRZ6kOLa9RCxv084BVoZ4OcHd/uLkVl3FsIS
         JbZNUUVImt/1s4ymv1WtvqXNBmqOiSpnf963d6vdfNIJFU6WmPKziyKIMrvl61cg/iTy
         uRWw==
X-Gm-Message-State: AOJu0YzWzsfGyE3BiweZnaK5dXm64qylmtp4dvDtE1HcTZZkIR092suw
	zV+sU38AJeq0leNG2rRtr3o=
X-Google-Smtp-Source: AGHT+IFZY1lZRYIGtnHSSLJ5Dv9nUSo3FSHlEpmP7yJBNk19dcocL3jmULDt3kHQBRqk+jZdLrELeg==
X-Received: by 2002:a05:6402:743:b0:52f:b405:4f21 with SMTP id p3-20020a056402074300b0052fb4054f21mr2383088edy.7.1694610052353;
        Wed, 13 Sep 2023 06:00:52 -0700 (PDT)
Received: from skbuf ([188.26.184.93])
        by smtp.gmail.com with ESMTPSA id j18-20020a50ed12000000b0052996528b81sm7285107eds.45.2023.09.13.06.00.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 06:00:52 -0700 (PDT)
Date: Wed, 13 Sep 2023 16:00:49 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mithat.guner@xeront.com, erkin.bozoglu@xeront.com,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/4] dt-bindings: net: dsa: document internal MDIO bus
Message-ID: <20230913130049.ivvl4vzjcfedsddr@skbuf>
References: <676d1a2b-6ffa-4aff-8bed-a749c373f5b3@arinc9.com>
 <87325ce9-595a-4dda-a6a1-b5927d25719b@arinc9.com>
 <20230911225126.rk23g3u3bzo3agby@skbuf>
 <036c0763-f1b2-49ff-bc82-1ff16eec27ab@arinc9.com>
 <20230912193450.h5s6miubag46z623@skbuf>
 <6cec079e-991e-4222-a76d-d6156de0daca@arinc9.com>
 <20230913074231.5azwxqjuv2wp5nik@skbuf>
 <89c9b84c-574c-4071-9524-9207597a3f0a@arinc9.com>
 <20230913110404.co7earmnbzf6hhoe@skbuf>
 <137fd54d-7d2d-4d0b-a50b-cca69875a814@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <137fd54d-7d2d-4d0b-a50b-cca69875a814@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_060055_125213_64E72DA2 
X-CRM114-Status: GOOD (  13.99  )
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

On Wed, Sep 13, 2023 at 02:35:11PM +0300, Arınç ÜNAL wrote:
> On 13.09.2023 14:04, Vladimir Oltean wrote:
> > I don't think they're for switch ports only. Any driver which uses
> > phylink_fwnode_phy_connect() or its derivatives gets subject to the same
> > bindings. But putting the sub-schema in ethernet-controller.yaml makes
> > sense, just maybe not naming it "phylink-switch".
> 
> Got it. Should we disallow managed altogether when fixed-link is also
> defined, or just with in-band-status value?

Just with the "in-band-status" value - just like phylink_parse_mode()
implies. If not possible, just leave that condition out.

