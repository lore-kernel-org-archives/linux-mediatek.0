Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 138A7C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Dec 2022 18:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BgV8i0tXAyZeNZyh4HIfX0CjYjIHu3CMOk3qOrTDz8E=; b=qeAGlbKczaNkDos91AKXcZG/6f
	OE6Xn1SGTxI0KH2i2ZhaHz84pI64DcyPz7kXa0sEiBtvV8xQ3Aov3atnmX04DND1On1nCiKRX3erM
	uPtH9ItMVypgB6hv36gK7YSOxWEP8prJNkAGvGat75jpoItce7DOGhQuxCuvSgTiJFULcs1f6FXnz
	qVbJcc90UProavC0l3X6JvB0hhehnd667D/HXpcrgObVd+iOISG1q4y1LWl1mQtw8X/M6KK8pV+Wy
	b3U6Ygqrahm/bFHnDoNR6nXq+7Nu6ZqHPJn4aeyrAa61RPtG+cxdtOfHjpTDEh3CgXTqRavKFUb02
	1z7h4s8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4nwY-003zva-Kz; Mon, 12 Dec 2022 18:54:26 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4nwU-003zlq-Hv; Mon, 12 Dec 2022 18:54:24 +0000
Received: by mail-ed1-x52c.google.com with SMTP id v8so14345081edi.3;
        Mon, 12 Dec 2022 10:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BgV8i0tXAyZeNZyh4HIfX0CjYjIHu3CMOk3qOrTDz8E=;
        b=XCVvWXp4U42UcmKN6L7IJtVa16hwaVbR6xY1vgYKIgrXVOY+0V/4Y0r2ngm7iZ9Yxs
         E7nQ1uF6F8o02wXrFSpv8oBqv+kr09m7OJKmfUQO+rHikcjG2b36X+ujhN306TKptuuG
         Zv4nBJ3qITL7j7Kqbu0n5uyUUTlXAxW76jcGnkHLCYeaPK9Ct1FnfV/kp0IV9qpBT8S/
         6Bg0T4vMpuiqCd0QfEym3HI7JPok/2WlXzsEIw/YAuseYe4OE9EhBXWn2SGYYVoJUrn5
         CivZlyaOQ6zIisw2NXvR2M8Nk6A3PYYyOXoDgztY9j0ynan9vSDHkbY2V38DZWp6bHNK
         4KhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BgV8i0tXAyZeNZyh4HIfX0CjYjIHu3CMOk3qOrTDz8E=;
        b=yvvJqiH03MA6vwPtbUtblqVy6LMa3cyIhdQafiTcJUoNSEvIBMviHsoc1ub6Cf/BNM
         dDx7OdZbcwZxfdmfgCG1cTvEn7fJjTkXuVZr1oFlBChOlpCPyZndNGMzlv6g4ZwLJAC4
         kbTdDx+ZFHycYcZCn4Vss1J+mdZnlRJ0p8mAF6l5Lm/ZwApxbna/W3WqnTjBrplWSKG1
         564PfAKjZM8Q8/A8XeCHPU8JieT+N8UQBGQZvEBGd7qLKfXjlLOuWEp0ia+UyARUhdB6
         Bt0uqLoZQx+BZZx9Vt7YeWo32q5c5e+eT8I3y+iJYMobe3stmptSidjU4QzYwCDNCB8r
         TzKg==
X-Gm-Message-State: ANoB5pmDQP7ig3xLC7S6snrDfZyJBa66ErFec2hXr4I7xGsyzUBfOBbm
	cWnOSFZFu31muFvuS6KbzA0=
X-Google-Smtp-Source: AA0mqf6+bzmOMDoOOVtF3VuMwbnXX3csUvARTR0d2wG839EPngtGTTTbFv0evGi3ci9A4F2BxyR1oA==
X-Received: by 2002:a05:6402:1148:b0:461:2160:9356 with SMTP id g8-20020a056402114800b0046121609356mr20319824edw.29.1670871260875;
        Mon, 12 Dec 2022 10:54:20 -0800 (PST)
Received: from skbuf ([188.27.185.63])
        by smtp.gmail.com with ESMTPSA id f5-20020a05640214c500b00458b41d9460sm3998447edx.92.2022.12.12.10.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 10:54:20 -0800 (PST)
Date: Mon, 12 Dec 2022 20:54:17 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	John Crispin <john@phrozen.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Marek Vasut <marex@denx.de>, Sean Wang <sean.wang@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	=?utf-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Linus Walleij <linus.walleij@linaro.org>,
	UNGLinuxDriver@microchip.com,
	Woojung Huh <woojung.huh@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	George McCollister <george.mccollister@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 net-next 08/10] dt-bindings: net: add generic
 ethernet-switch
Message-ID: <20221212185417.cyoqye5ql33aajaw@skbuf>
References: <20221210033033.662553-1-colin.foster@in-advantage.com>
 <20221210033033.662553-1-colin.foster@in-advantage.com>
 <20221210033033.662553-9-colin.foster@in-advantage.com>
 <20221210033033.662553-9-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221210033033.662553-9-colin.foster@in-advantage.com>
 <20221210033033.662553-9-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_105422_644198_80518F2B 
X-CRM114-Status: UNSURE (   9.89  )
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

On Fri, Dec 09, 2022 at 07:30:31PM -0800, Colin Foster wrote:
> The dsa.yaml bindings had references that can apply to non-dsa switches. To
> prevent duplication of this information, keep the dsa-specific information
> inside dsa.yaml and move the remaining generic information to the newly
> created ethernet-switch.yaml.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

