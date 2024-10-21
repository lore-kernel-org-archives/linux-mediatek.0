Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A161CD15D98
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 14:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qW983cpZTtlZpg1IF4URdP/C7ezGJs7rx0iCFccBLDU=; b=qu12+YN7Us96bmFB4lX05p9mX4
	XV7WqVJwGlQE8W23jVKv6QqjBH4TRMiBjrASVOw+lUhoH+c1sZCmGKE/xnqznqRcbLz6pFUEKsUVZ
	buAy4wdWoAzzeXI5310DNGnW4VPsclAiI8A50cXSx8LWrjuMe34GnCXn6hEB4rqVDWypHKWbKtCbU
	3pIWPJUGxXqUBkHLDm0CdfpozDfyZ3JLEV5NAVYYhycR5fRNKhBDsM3HaeZL380kE7YkFlSS4BbEk
	madsMuTvAIKs3X3Y8MgX4proBLxabodEK5Lz6l6ZLd+exzDgunLu4HAkGlrw9qcAfwH8GMGCpxetB
	J56LGBpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2syY-00000007XNN-1nNc;
	Mon, 21 Oct 2024 14:01:38 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2sdB-00000007Rx1-1itj;
	Mon, 21 Oct 2024 13:39:34 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-37d4a5ecc44so3362013f8f.2;
        Mon, 21 Oct 2024 06:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729517971; x=1730122771; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qW983cpZTtlZpg1IF4URdP/C7ezGJs7rx0iCFccBLDU=;
        b=FixYE6TYdytxzMzfIdvUxpIMatX3S3zajfeyZUot+NpndJCnlbZbkMNvIDmuXcoY3j
         5Vq/jOCZeov/P8FFToa75KhViCigz3+TOTswOo2DuyW/IsaRco2qMEnY+/TPqCwmntuQ
         jkikoTZ/LX5pQ/raKmo1WP4PVUTpjq6nLIFWNQiVxPopm7HPrASHKT+peA4WY0/hqsA9
         F7L21SfFbMLBQx3yzClCgC4U1Fz44Ev0Qa2npovwzPvkdemgogPpetGCfJW+B6vU/92C
         AqtXdlDlU8gmjkGcnDpiOL/rPr8HwHq+/Zjk3rCe+651vqbsscFxDMPqa4IF1Sp7TXn2
         b6Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729517971; x=1730122771;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qW983cpZTtlZpg1IF4URdP/C7ezGJs7rx0iCFccBLDU=;
        b=egF1mqDupTTRjt/rDAMXvBu4B7ARnZsZ46A6UbWc7EpbxFXLrAAL625vVt1Dwuo87d
         b+JiOjRGwfsngmF/v9eAbEgetFz00UxoUmcItS/GZbQflPDlP5tx9nwumRMKopn92ojW
         Idg3T8QwDutuF47jGWTJ9ty2OCbLDgN36F5KkCGC8JGV1QxEqifmsInKfmo7+XiKTvrL
         ML3wvs1bkU96S8KjMagAuuAX1l5o2RoyLmKJpkAe5uN12SibuavLqSHgGVxPL/g/YnMa
         DfUUR/J4tp19tS8ri9leYUSWImHbUsBYpn9iexKBfKBqhkrn924Xsr32zBy1+YQsvcGf
         vs3w==
X-Forwarded-Encrypted: i=1; AJvYcCUfXds8fy6cMnrPDBlT2qZkMIsJ0pkcKFw9aTUBTMDKhp1uryfGKIPQSTp3TzAdQAA5NXOfdRYzzHTQO8GsuTU=@lists.infradead.org, AJvYcCXrYfeyU7iZT1U00pkgsTNWDZGzmDLKPgoxhSW7XV9/u/vR8IXcLsEmpplde0qVNrDIXoXrIAdxFe/QJ/xtk7Fy@lists.infradead.org
X-Gm-Message-State: AOJu0Yyos61JOHtO/UE1BdcxxZzjdMTd3MEjYrNdkRZf6U+9XBWH+FRO
	M+aEINn6ddE63uwxz3zDGGQ1ma3Q7h21uGB5n1QQob7zd226/dAk
X-Google-Smtp-Source: AGHT+IH3QllBtkXK0c4TbYUbZZNT5mP3kTYyg2B2b7gHrcHd/jXQrDGes7Nj/6Gy+PFB3NGzv8QQow==
X-Received: by 2002:adf:f8c7:0:b0:37c:d57d:71cd with SMTP id ffacd0b85a97d-37ebd3a30dcmr6846705f8f.52.1729517970676;
        Mon, 21 Oct 2024 06:39:30 -0700 (PDT)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a365b9sm4387289f8f.11.2024.10.21.06.39.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 06:39:30 -0700 (PDT)
Message-ID: <67165992.df0a0220.170dc.b117@mx.google.com>
X-Google-Original-Message-ID: <ZxZZjvWdbk4wVfOl@Ansuel-XPS.>
Date: Mon, 21 Oct 2024 15:39:26 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [net-next RFC PATCH 0/4] net: dsa: Add Airoha AN8855 support
References: <20241021130209.15660-1-ansuelsmth@gmail.com>
 <20241021133605.yavvlsgp2yikeep4@skbuf>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021133605.yavvlsgp2yikeep4@skbuf>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_063933_475236_7161F6DA 
X-CRM114-Status: GOOD (  14.42  )
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

On Mon, Oct 21, 2024 at 04:36:05PM +0300, Vladimir Oltean wrote:
> On Mon, Oct 21, 2024 at 03:01:55PM +0200, Christian Marangi wrote:
> > It's conceptually similar to mediatek switch but register and bits
> > are different.
> 
> Is it impractical to use struct regmap_field to abstract those
> differences away and reuse the mt7530 driver's control flow? What is the
> relationship between the Airoha and Mediatek IP anyway? The mt7530
> maintainers should also be consulted w.r.t. whether code sharing is in
> the common interest (I copied them).

Some logic are similar for ATU or VLAN handling but then they added bits
in the middle of the register and moved some in other place.

Happy of being contradicted but from what I checked adapting the mtk
code would introduce lots of condition and wrapper and I feel it would
be actually worse than keeping the 2 codebase alone.

Would love some help by mt7530 to catch some very common case.

-- 
	Ansuel

