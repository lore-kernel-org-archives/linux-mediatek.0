Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2118C30653
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 17:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xbMuRw1sQkRSiFh279rXdYSfGjfdwITvelsunE8eQ+o=; b=dK+pos8Z+/syy9uWq6RrIYyHz9
	l7i5omXpecTFmoD+2uliyP+ZUPYrbupPeBXemTqHi5R8nm5VNMuTQrA+mQaUTMhpDG38PCX1NhErc
	/HSPmwN5csfdM/SEV5Wq6j4fk44pqXcTloKFIydbD51qnns/sMNbJtqw0W9dmopnTrcdEGYsXP3uh
	eVnuFw2WC/PJ6v79LbHO0Qj6p5HsSwfVgpYKXPxNipDFQ5/qyLZttxh12SeJ0aCj2hL8g/vlNchK/
	apfD/Q+NJ/jgxlrIK87KO6vq50fDEgnPYCqCLhlVLkcnf0SinTwezp31iUX/bp1/Y1Bao9Cs6wobQ
	6p3fVkcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPQ9w-0000000DyCO-0UCV;
	Thu, 04 Jul 2024 17:22:16 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPQ9g-0000000Dy8H-2QkG;
	Thu, 04 Jul 2024 17:22:02 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-36794da7c96so526398f8f.0;
        Thu, 04 Jul 2024 10:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113718; x=1720718518; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xbMuRw1sQkRSiFh279rXdYSfGjfdwITvelsunE8eQ+o=;
        b=TO7yzDI1t69QdYq3zb4jADKWhdmLRcolG++POzeaI/aGtBHmloKYKiD+B3yAs4tDIR
         sQExWzkywIl22lj288vjtfTfz6jZQQn+IpoyaaPiQPu9E0KfiYe+LTPAbHlzJ1L1fb9B
         chV9XTxajCYrZkO8rq2pn+l0L85Mf6C+9ePadIRWPgMseecYv/vKOrAY4GfIFbM26wgc
         pWYSlNkdi/tShl5BsLc1ISbGvviLKghjeb8zxPF7jfOrWlgIa/RihQz4IyAV69KORAFf
         j8cy0NYtFc24H1nheCU/5O26LXBcYA175rn6YeKxAiWoTSem1iElNdE5SqldZbxkwGu0
         rErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113718; x=1720718518;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xbMuRw1sQkRSiFh279rXdYSfGjfdwITvelsunE8eQ+o=;
        b=cRGlei/bMephZV9z3zXn4GECa2j+pgnlzcYb1dXV3tVOasQWQMmE7lTwqmDMp4mms1
         A90CYL8VRK9JqI9ax2VP3g8ZSB0BMPyduUUrhyID9NegWM/Knnycu2fjE1o1gcT638eS
         wDRIGyZEXNRVSX+49mnyMH1MBEyzd/wK83bWf7n/hYr36qYlxnNFJOyxOPQG8Ba5RP12
         bAIcvrSMt72aI4l44aN5PgeCJowh0GQJosRSiuqmXARuhYA9m9hq4RIeFeRCCSJ47AnH
         gvzptbttTihTc3rBEO4tI4xq4hz/SdRzwuOtE7gl9t+ufcmSlH8fYmEGow8WeqMhMAKP
         l99A==
X-Forwarded-Encrypted: i=1; AJvYcCWZFTj8dJSEzy3MRb2CdPv9ig4dqs25fTUX0wMOqDRbFNWYcaMcwvdM0Pgr2bKBU1Jm+HYFGNa0vtUTfhBRVaeXaE0FdA1PPc5bf30pafkdwUVdW5PQeXt+jf93kgIqI//wSK2EwzgkKRnJ6wBuwwSyKIXFBpWNle4=
X-Gm-Message-State: AOJu0YyyqUSaf0lcW+kxBBViCRerDD8s1N1nbJf5q9nIQJ2IC8tj04ya
	4aISNOns0i0FmT6iqAB3Q6t/6PRgwUXwwt8dEz3KM4YjzklQycWj
X-Google-Smtp-Source: AGHT+IGdluLbnk0hTBC/jWbHuttDDQoIzwdZNIhKDlVq3XycWj2L2MDyVC25gNmwdtGq+W6484Ov3g==
X-Received: by 2002:adf:e94a:0:b0:367:88c2:23a5 with SMTP id ffacd0b85a97d-3679dd2b344mr1283829f8f.27.1720113717962;
        Thu, 04 Jul 2024 10:21:57 -0700 (PDT)
Received: from skbuf ([188.25.110.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367947ddebfsm4574672f8f.34.2024.07.04.10.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:21:57 -0700 (PDT)
Date: Thu, 4 Jul 2024 20:21:54 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, regressions@lists.linux.dev
Subject: Re: [PATCH net v3] net: dsa: mt7530: fix impossible MDIO address and
 issue warning
Message-ID: <20240704172154.opqyrv2mfgbxj7ce@skbuf>
References: <7e3fed489c0bbca84a386b1077c61589030ff4ab.1719963228.git.daniel@makrotopia.org>
 <d3ac5584-8e52-46e0-b690-ad5faa1ede61@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3ac5584-8e52-46e0-b690-ad5faa1ede61@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_102200_643089_52288D02 
X-CRM114-Status: UNSURE (   9.44  )
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

On Wed, Jul 03, 2024 at 10:03:09AM +0300, Arınç ÜNAL wrote:
> Works on standalone MT7530, MT7621's MCM MT7530, and MT7531. From MT7621's
> MCM MT7530:
> 
> [    1.357287] mt7530-mdio mdio-bus:1f: MT7530 adapts as multi-chip module

Why is the device corresponding to the first print located at address 1f,
then 0?

> [    1.364065] mt7530-mdio mdio-bus:00: [Firmware Warn]: impossible switch MDIO address in device tree, assuming 31
> [    1.374303] mt7530-mdio mdio-bus:00: probe with driver mt7530-mdio failed with error -14
> [...]
> [    1.448370] mt7530-mdio mdio-bus:1f: MT7530 adapts as multi-chip module
> [    1.477676] mt7530-mdio mdio-bus:1f: configuring for fixed/rgmii link mode
> [    1.485687] mt7530-mdio mdio-bus:1f: Link is Up - 1Gbps/Full - flow control rx/tx
> [    1.493480] mt7530-mdio mdio-bus:1f: configuring for fixed/trgmii link mode
> [    1.502680] mt7530-mdio mdio-bus:1f lan1 (uninitialized): PHY [mt7530-0:00] driver [MediaTek MT7530 PHY] (irq=17)
> [    1.513620] mt7530-mdio mdio-bus:1f: Link is Up - 1Gbps/Full - flow control rx/tx
> [    1.519671] mt7530-mdio mdio-bus:1f lan2 (uninitialized): PHY [mt7530-0:01] driver [MediaTek MT7530 PHY] (irq=18)
> [    1.533072] mt7530-mdio mdio-bus:1f lan3 (uninitialized): PHY [mt7530-0:02] driver [MediaTek MT7530 PHY] (irq=19)
> [    1.545042] mt7530-mdio mdio-bus:1f lan4 (uninitialized): PHY [mt7530-0:03] driver [MediaTek MT7530 PHY] (irq=20)
> [    1.557031] mt7530-mdio mdio-bus:1f wan (uninitialized): PHY [mt7530-0:04] driver [MediaTek MT7530 PHY] (irq=21)

