Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4F46C7EE2A
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jun 2023 07:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIhKNTPXPe0u0jsGPi0f2cIWsy51Xap3dptIpk88dVw=; b=kkm3kJudoghMWtUeksw2DFOg4D
	G5vEHUAbhrFvRC4h3BvU8SkP/jFNbuBBBC+7Jjc7UjoKTJFQDrXWyxy1C+1Sz/s9G7TH4kz4ln2US
	uf62pZquayCTeSpXmse8X5qvCGlwSdX822zNIwyvJcycEaUWfuAyslr7FIpIvacqQKxgf4I+wg1Ri
	GuXi4RGXCGmM92RtEuesPvl8PdrAI7l1RH66IQKkhXsBF7C8xdGnjq1womfFTfGWGKN2EjpJ0iGwB
	U6jCOTupSXc7FF5gkwIzqRzcx+LduLoOSsOjEjMIKPwaxpwbE5/J6X2ULXGO59YUucGflwrHCkTU9
	s214VdEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5hx0-00BWrv-0C;
	Sun, 04 Jun 2023 07:14:54 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5hwx-00BWrD-0D;
	Sun, 04 Jun 2023 07:14:52 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-974f4897d87so304006666b.0;
        Sun, 04 Jun 2023 00:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685862889; x=1688454889;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xIhKNTPXPe0u0jsGPi0f2cIWsy51Xap3dptIpk88dVw=;
        b=aBZpo9amahon3ntrSsg2wteLLxu4t7tqyGv95gv3ZHpEeiM8eqfHkNcoO/IQ7z9SwE
         zymWvbJ4G1AtHsG/hxqmWZ+PlBs6fiXIIaY39HODoNe0s8jZRdoY5OLs6w9n32UDxK7F
         5kApV6hcVgQ5heBbpGT27297qXuGu2UfRvlqZQG/4CGwIlxdXd6rqTux8vHQltdza16a
         6NzBkLH0uWU0fPhlgxSSGrChc5aJK1tkYNFiZ68/YvfikLup1Li1WXyNtegvknaNvYEF
         f7L0IwOEo6Bs8DRxT/H/Ak1wKgi7IEIzQywmZEYiIXH26r9sEbxIRXhPoxTAyyfBVOJ1
         cJoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685862889; x=1688454889;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xIhKNTPXPe0u0jsGPi0f2cIWsy51Xap3dptIpk88dVw=;
        b=LwY2/MgqGR6KIUoWE/ST0CXka4pfU4dmCH0e4baS45lKzzKp7N3325TwWPJiQAKoip
         /TM1uAT7mNp/cQNCc0P4rzISXvQQ01AWAiqiawoFN5RiKmbUNEw4PFNZm1QIz74lD5lQ
         xTD8nkZHCXOG4wg601T1dPgW6PHFd9HPxOXXkXAYEEkFo3cA3KqAeXo4m2lAApt3C7uc
         SzFCcMRebqkA9rB1XFdn9LrcLs3tFKXpDP0EZs4WnRNq1T1SW600Uvg+TN6Wl6CfLTa5
         z24puiPboMZ6hs1Vr3B9x5bzijRtSwgvJ1Ute54Me65W2yyoI3ECHduGrmAcI2cwrlYk
         iGnw==
X-Gm-Message-State: AC+VfDxVhGW/g2eW/xiOP0rkXaFFI4668oBrRROrkNENGcPVRuC+jHe2
	SUaJd2bxTvUNEwS7XfMqC0o=
X-Google-Smtp-Source: ACHHUZ4w1MieX+7rRio+qeSsBwtrLBg/KVLl5GMMP8Mx9DGNgb0YpvWremR2+g4SdP15RlY5jrN1Cg==
X-Received: by 2002:a17:906:9b8a:b0:967:142b:ff07 with SMTP id dd10-20020a1709069b8a00b00967142bff07mr3545323ejc.21.1685862888389;
        Sun, 04 Jun 2023 00:14:48 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id t5-20020a17090616c500b0096a6be0b66dsm2707305ejd.208.2023.06.04.00.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 00:14:48 -0700 (PDT)
Date: Sun, 4 Jun 2023 10:14:45 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 16/30] net: dsa: mt7530: move lowering port 5
 RGMII driving to mt7530_setup()
Message-ID: <20230604071445.a5hg2tiybqp2iqwz@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-17-arinc.unal@arinc9.com>
 <20230522121532.86610-17-arinc.unal@arinc9.com>
 <20230526131739.5mso5y2d3ieelasf@skbuf>
 <08e9c220-cf15-4c61-f7f4-ad8073a3bcf7@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <08e9c220-cf15-4c61-f7f4-ad8073a3bcf7@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_001451_127122_C81B4452 
X-CRM114-Status: GOOD (  12.77  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jun 04, 2023 at 10:05:44AM +0300, Arınç ÜNAL wrote:
> It wouldn't. I'll drop this patch, thanks. For reference, PMCR_TX_EN (bit
> 14) for port 5 is also set in the case of PHY muxing with this code on
> mt7530_setup_port5() which doesn't use phylink.
> 
> 		/* Setup the MAC by default for the cpu port */
> 		mt7530_write(priv, MT7530_PMCR_P(5), 0x56300);
> 
> 0x56300 = 0101 0110 0011 0000 0000
> 
> Maybe I should make a patch to use the definitions on mt7530.h for this?
> 
> Arınç

Yes, I don't believe magic numbers make things particularly obvious for
other driver writers, they should be avoided if possible.

