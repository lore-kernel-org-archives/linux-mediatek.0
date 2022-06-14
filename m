Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB60C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jun 2022 22:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w/j/4G3uIVZ9RpyIyMAX6r0UusyYpoF5FurghJRlsq0=; b=R5GdjmEXMRwFR5
	LSRdb0V+OJ1LQQP+T5TTB2mk93UMx8stMk5hbsG5I3xvV3AHlL/U62RTk1LPXMRYPLX+cuVCNykyH
	dsE/dCqMZW1eMelQdJVAGo1/nOmXJTLX4631DRJts0tPrFwwe1KekqO3V8GM34DulzIvOpmzeTSLz
	6ppFuKBIyPSJIg97BBPoFCV5ldj13MwfTyURuYlC9l2UtTPjWn0umrkcR3j7pe1RRBNEGMgem+SSc
	+c4pfuVYi/x1ssfwb+qkU0ZY9t2i0VNA2xxA/nDnfTieEjZf0NH/+/REUY9Tn2R7K3FE+lqI+bhjg
	UffSGt8ZeJFeKe3WvsLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1F7c-00BcRC-8p; Tue, 14 Jun 2022 22:34:52 +0000
Received: from mail-io1-f52.google.com ([209.85.166.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1F7Q-00BcNs-Dj; Tue, 14 Jun 2022 22:34:41 +0000
Received: by mail-io1-f52.google.com with SMTP id p69so10978855iod.0;
        Tue, 14 Jun 2022 15:34:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nfvtIdPgiXULHnvZfVP5vqYcUUa4+OVCxD93E+5pMPc=;
        b=Ga6ag4lJPgambSu7mhzx/583zio28o7tba8lQXvaNmnNXOWDp2S8egOvUtgDyEw5NN
         UiF8iCaQ9SYT5HMnQ15+lPppAP860pfptQoCevcVu2jabhCzaiT6Rr1DeWWbCEs2C8J9
         6fcNUuPQzzTFXWLEAXChrhLnRBybKkynOYZ/lutsei0lZfEKTr19JZJIt+tN0qoEjUuZ
         2pRPI7xM/37LZg6+ySmpyI5UtDytX9DsnLeNCwB3IHpTH+uEwmWneMu3B0rW6xaNrH3J
         NcNf3RQdPxj0B8YfpR92Y2ogDVxwi5m550t5zho4H5k8Rb1BOJkLH63iLVFKoA7RiMBf
         Y32g==
X-Gm-Message-State: AOAM531J67hAmg95jl4nfGlsDgnRhAGnLGC0tFXpTlGYgSN+g74cYbG4
	8Gq94FiK8FaTJX1HJxnNhA==
X-Google-Smtp-Source: ABdhPJxE1abxcZlYMoUexYa+t1QhZEgC3GbKhXiUkgv+6tmPmB+hvZlvUSYMxVLNMKQy432HbWyDcg==
X-Received: by 2002:a6b:6a07:0:b0:66a:2e5f:2058 with SMTP id x7-20020a6b6a07000000b0066a2e5f2058mr1167288iog.72.1655246076467;
        Tue, 14 Jun 2022 15:34:36 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id n11-20020a02710b000000b003315c00e885sm5402674jac.0.2022.06.14.15.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 15:34:36 -0700 (PDT)
Received: (nullmailer pid 2853736 invoked by uid 1000);
	Tue, 14 Jun 2022 22:34:33 -0000
Date: Tue, 14 Jun 2022 16:34:33 -0600
From: Rob Herring <robh@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v4 5/6] dt-bindings: net: dsa: make reset optional and
 add rgmii-mode to mt7531
Message-ID: <20220614223433.GA2853676-robh@kernel.org>
References: <20220610170541.8643-1-linux@fw-web.de>
 <20220610170541.8643-6-linux@fw-web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220610170541.8643-6-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_153440_492790_DB11E3BB 
X-CRM114-Status: GOOD (  19.95  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Heiko Stuebner <heiko@sntech.de>, =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, linux-rockchip@lists.infradead.org, Greg Ungerer <gerg@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>, devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 10 Jun 2022 19:05:40 +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> A board may have no independent reset-line, so reset cannot be used
> inside switch driver.
> 
> E.g. on Bananapi-R2 Pro switch and gmac are connected to same reset-line.
> 
> Resets should be acquired only to 1 device/driver. This prevents reset to
> be bound to switch-driver if reset is already used for gmac. If reset is
> only used by switch driver it resets the switch *and* the gmac after the
> mdio bus comes up resulting in mdio bus goes down. It takes some time
> until all is up again, switch driver tries to read from mdio, will fail
> and defer the probe. On next try the reset does the same again.
> 
> Make reset optional for such boards.
> 
> Allow port 5 as cpu-port and phy-mode rgmii for mt7531.
> 
> - MT7530 supports RGMII on port 5 and RGMII/TRGMII on port 6.
> - MT7531 supports on port 5 RGMII and SGMII (dual-sgmii) and
>   SGMII on port 6.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v4:
>  - add port 5 as CPU-Port
>  - change description
> ---
>  .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml      | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
