Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFD7C55184
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2026 18:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T46aT6b6jrcEqP7BKbyuJ+Dqx/tXTl32zZ60csvLnD8=; b=0ae9WxM7mlzJQhjET3s8Zlxei4
	Hcs5quEgR64+xEnaKvKGrd/TpPvkk1TU+r5doLOAYLjJe1P8w8rARE5felddnh/em+BZyvI3qYjyr
	dTg7zRPRm3KUmmZj543wNu6UG8ZeLdW/JB/g8+Xo+dASWeDNuHDSasyHqUeG6gwBPpocAqinHG24p
	vxLLzpF3EJIhkur6fjZzDsPSxDWS8fK3HffWgDx+oQpeqcLW+gHgPmWdtELt9+TxEIvMdbUclh2G2
	B3tsD5p7RsLhCVfCD6nLsh4vFjU3BssuEHWhsg/Swn+R13rCdFqvxlI5nYzdMNb3jt+2yFtWDB5h1
	MiSgBnlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJwY-00000002cZi-3BXB;
	Tue, 04 Aug 2026 18:32:50 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrJwV-00000002cY5-3g9e
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Aug 2026 18:32:50 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so123144a91.0
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Aug 2026 11:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785868367; x=1786473167; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T46aT6b6jrcEqP7BKbyuJ+Dqx/tXTl32zZ60csvLnD8=;
        b=tJtikfivZdEjbl1FKOzzrRR05iCy8BXieNThz9Bd+tLnbvtcDwzEH6SBJ1mHQxLKLT
         gSycN83TD7ZdpnUBaFUBa+HCxDF/ehn24TxpFQzoP0j92NkCQ+yNS+7Lw5xsr9i7BR4e
         liAfu0MnIQfhTAhnd4Z5gCCu5bFQ9NY545geKXDDKBuI6QZjG0QRavET23XMzRrgJsm+
         mXVWoqNCk1IR0Psp8M/b2mvMrn3VhUEX8xOJmXmoFRKjjK0hKVVPWvSf1U3qH0ees7y7
         9CfKU0eT5jRaMuB2WHkXJyq+h9+Vh8oN/ACwZrt3nfHZYsKe1RshQlB5QTYYm5qaakSr
         vFXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785868367; x=1786473167;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T46aT6b6jrcEqP7BKbyuJ+Dqx/tXTl32zZ60csvLnD8=;
        b=F9dQfaCcdU136VrCJRyIg04y77iHDIxLFY7dEeb3hrJgH9BR24R8zmN0l/8H8kv9ol
         3rO6kQysemHLNiaBam0WUzNzlJKUpbi0EJyeVgTANmRQsMGfy21bbMHqtEEtGnVW9CzM
         LL8FuHpOrt/Z8PYBRBMQH7tnVsid+fw2apYRf6SPExqRGsHd/DID//ayyxMGI9w9AfmQ
         Ef72mXWlvNKEoIT429+zQitS4/mMIyu/K1tfCofGZ0IV50FN5yYU71mxnfJ+O6jURuxt
         RrUqc6Wtj6DL2aBK5t3vVLBPVfDeyhlGVIc7ftCk2vFVyCjY3OnBhxrzztnuZqROM5Hf
         69tQ==
X-Forwarded-Encrypted: i=1; AHgh+RpVDp9W9QEi5XkJgLYKFxVZUmoLdxHefEkb3jZleOd/Dg0BMJDf3Pc+/pMIFMfErwlp00ce23AT4TdkOGD7gQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9LBPMpeNjVJUWGKaQG0+YAU8fL6HE7GPrJg7ZuoRXsLNAMbk7
	b4p/QgzAgXWe83S4NDxgPA+NpVhSJ0GyRfXHPIE1X48qFcA7jKp6oZ2n
X-Gm-Gg: AR+sD13s6494l2R3q9kc2L5SA5uToKu5vnXgGSAiySaEU52dmwFcnrQm1HFyrkKYBkK
	Eixh01w/oONBEY1ktFUihmnGqNNh5y+yhD4fRHqKz6fs9vEGU6ZLDn2/Hp8xwliLNYKUC1LDuNv
	aScuXYMJ6DqV8kpq81AwcYnQLNrRaLG8wo+OjjHcb3hNRni0VI9cBbFPJ374kYSl2+RO6g/bPQA
	QkTppiGn3se686enry22N5S0mDfcDEB/5aHsEBDBtcOCFl45qZfGGp/F8U1x9SdQWXsyIWkF290
	Ra2hiiiLQtFTvDiiLhZqCr/aGgkIi3FH6TnJEDvlP/ZJ3momNr/iWjiE+zu+yrG2ezwWnap+vLO
	8hVJdQiodMtXbUCp1f+zvGMv6lVyvB6UIe22GImGzocCQ2Mi+pS2z5fEysuNTJ8clJlciNAVi9p
	jntSUPFuHdHZxGhtZ1Ar+QfFH39veow2QrxR3mrNU8S0tvH1kx1mCLySQQ0560jLpkCpDGca8k8
	8iD
X-Received: by 2002:a17:90b:224e:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-3903c5c443dmr636262a91.16.1785868366824;
        Tue, 04 Aug 2026 11:32:46 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.localdomain ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca926c0bsm5440864c88.14.2026.08.04.11.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 11:32:46 -0700 (PDT)
Date: Tue, 4 Aug 2026 22:32:38 +0400
From: Ahmed Naseef <naseefkm@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Ahmed Naseef <naseefkm@gmail.com>, netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>, Qingfang Deng <dqfext@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: phy: mediatek: fix TX blink masks using the RX
 bits
Message-ID: <anIwRrQT9qMD89v5@DESKTOP-TIT0J8O.localdomain>
References: <20260804113511.3371248-1-naseefkm@gmail.com>
 <ab2f7f4f-0f46-4c6e-b3b1-ea713dbd08c6@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ab2f7f4f-0f46-4c6e-b3b1-ea713dbd08c6@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_113248_171246_5183D824 
X-CRM114-Status: GOOD (  17.98  )
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

On Tue, Aug 04, 2026 at 08:11:21PM +0200, Andrew Lunn wrote:
> On Tue, Aug 04, 2026 at 03:35:11PM +0400, Ahmed Naseef wrote:
> > MTK_GPHY_LED_TX_BLINK_SET and MTK_2P5GPHY_LED_TX_BLINK_SET are built
> > from the RX blink bits instead of the TX ones, so both TX masks are
> > identical to their RX counterparts. The TX bits they should be using,
> > MTK_PHY_LED_BLINK_{10,100,1000,2500}TX, are otherwise only referenced
> > by the per-speed branch of mtk_phy_led_hw_ctrl_set().
> > 
> > A TX trigger selected without a link trigger therefore programs the RX
> > blink bits, and the LED blinks on received traffic. The masks are also
> > used to decode the blink register in mtk_phy_led_hw_ctrl_get(), which
> > as a result cannot tell the two triggers apart: an RX-only
> > configuration reads back as RX and TX, and a TX-only configuration
> > reads back as neither.
> > 
> > Fixes: 7f9c320c98db ("net: phy: mediatek: Move LED helper functions into mtk phy lib")
> 
> Was this bug introduced in this commit, or did this commit just move
> the code around and it was broken before? The Fixes should go back to
> where the bug was added, which could be earlier.

It was introduced by that commit. Before it, mtk-ge-soc.c correctly had:

  #define   MTK_PHY_LED_BLINK_TX      (MTK_PHY_LED_BLINK_10TX |\
                                       MTK_PHY_LED_BLINK_100TX |\
                                       MTK_PHY_LED_BLINK_1000TX)

which 7f9c320c98db removed, adding to mtk.h in the same commit:

  #define MTK_GPHY_LED_TX_BLINK_SET   (MTK_PHY_LED_BLINK_1000RX | \
                                       MTK_PHY_LED_BLINK_100RX | \
                                       MTK_PHY_LED_BLINK_10RX)


Thanks,
Ahmed

> 
> 	Andrew

