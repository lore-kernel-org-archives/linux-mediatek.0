Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFCEC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Dec 2022 18:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iPCgrlviixbG7fOLs6i0IAsETKWkHMzoOpHKYUaDEYk=; b=MPxPx0+EBnFSxILKkSRzoDmBTp
	IYGiBVtncHRpnyGqI20vaCXrhstG1eVdxgWCZ/qYqd5YgG/tgnBH53RW8kiLDXHkijkURpTWiYTtx
	v8dKwzpoi+NrcWSyOjvYPnkRxje3LB5+zY+IeEAs8mBVVRlQYV5sBJYc+OeKKrhJ5zb0aM2/YB81W
	iIxntLJI9YlP1OpRnX+IJ/FdYITwzdyGiP2vPebKTxFRh1aX9ilp1iYC8qmo3FXV1GMSEoxTrjLBm
	mRvdj9+gmdlO6b3klqG1q2aK3ySpMFTPUTWZomVjTG0a0WtyQVdh87zF3ycN9fX5eW49T7fRzY67h
	jjZze86A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4nvB-003yOJ-2X; Mon, 12 Dec 2022 18:53:01 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4nv5-003yET-VY; Mon, 12 Dec 2022 18:53:00 +0000
Received: by mail-ed1-x52d.google.com with SMTP id c17so14264630edj.13;
        Mon, 12 Dec 2022 10:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iPCgrlviixbG7fOLs6i0IAsETKWkHMzoOpHKYUaDEYk=;
        b=HwSSl+40WQy8PHXeSUcOdLyUorLDaMS9Lijwmo7u6Y+dzpqsh+SP0WO6UyzGtFdqoX
         Maa/0TAiTFq3MWXfnWSAhucyCjsoPCE4k/StCZ7oIoZ6TvUkBhpMW+UeyPWAeiQXgQ3R
         erwhUHNP1/sK/TPm/ESiPtRNnIibQYZkG95HDbjcos9zVOxktnuLVB8Y6/Roe/DREbEN
         b2QpUi0ua26HCbkEypvbqc1rccBuUgswFgGtEHS5sfBI7XzItWHJaxFMBDTCwI0tFlrJ
         CZOAyTZnek9HJoGV3MGs2S1KSVFWfbO63zJ0hwmo2wyeujO80G+AOwdGBg1YpeY1M+Qa
         s2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPCgrlviixbG7fOLs6i0IAsETKWkHMzoOpHKYUaDEYk=;
        b=Y/Fp3hQe6owlNTSe0N1eui3iwwJ6+b28Gr4rk6mcbpbxi8LmQZIK61/8upfFmCiIMt
         9UxxSU5BBRv2ua+g9dcezmcGJzkK/kgqXStrC1bxXu84mkX5N5d6x5D/hFTtBIYFEmea
         rRwkowjNGNAmkZyF9NHbScWSd/67wnNvJWxT7c6z5jSN25wFnbX24rOSzJxNCnspJye/
         47nf0D8PLGm3UAmSisTuVb89VzhWQ+6Gr7X/zGR0gKDv41mjby55Mf98ExoIxiKWIISc
         2+638Dn3ucdrkJ7CmLs29/hhTZTu3IqCztkWDAee64svjX7ENLIYRi4uZ5c0cjlMbL3O
         Hu9Q==
X-Gm-Message-State: ANoB5pnWYgVpZnKGONDTyvL2p9eA0nQyyZJkfxF51Ia65hlPKgaJ6ZMA
	FFcRdZIMmXhjwW0EhEuxHkU=
X-Google-Smtp-Source: AA0mqf5CAnzhtACya+XFABsMs7TzlVqewVFKf9KdarDIN+sQM2F4ORjjVz4XBP4GoTYV9kdty2IBpw==
X-Received: by 2002:aa7:de0f:0:b0:46c:43ff:6953 with SMTP id h15-20020aa7de0f000000b0046c43ff6953mr18540244edv.13.1670871172735;
        Mon, 12 Dec 2022 10:52:52 -0800 (PST)
Received: from skbuf ([188.27.185.63])
        by smtp.gmail.com with ESMTPSA id q26-20020aa7da9a000000b0046b25b93451sm4104460eds.85.2022.12.12.10.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 10:52:52 -0800 (PST)
Date: Mon, 12 Dec 2022 20:52:49 +0200
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
Subject: Re: [PATCH v5 net-next 06/10] dt-bindings: net: dsa: qca8k: utilize
 shared dsa.yaml
Message-ID: <20221212185249.do7un6kajlzgnd63@skbuf>
References: <20221210033033.662553-1-colin.foster@in-advantage.com>
 <20221210033033.662553-1-colin.foster@in-advantage.com>
 <20221210033033.662553-7-colin.foster@in-advantage.com>
 <20221210033033.662553-7-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221210033033.662553-7-colin.foster@in-advantage.com>
 <20221210033033.662553-7-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_105256_054306_600311D6 
X-CRM114-Status: GOOD (  10.31  )
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

On Fri, Dec 09, 2022 at 07:30:29PM -0800, Colin Foster wrote:
> The dsa.yaml binding contains duplicated bindings for address and size
> cells, as well as the reference to dsa-port.yaml. Instead of duplicating
> this information, remove the reference to dsa-port.yaml and include the
> full reference to dsa.yaml.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

