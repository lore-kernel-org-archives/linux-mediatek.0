Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FA1C77B6F
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 14:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ooA/O5How6wQvdMPwj1oVf9NjGnfxxmKWhsoBtFQ4c0=; b=y/OIlHkhGhcb7SUDi9a8ZEZi8+
	nhGb6Q80Ww9xLtTdNft1bvQdupSMa2fATOR9mcvhloj9CyKnIPvOQVZT76gZcydabQU8eEJKuFRCb
	R13pIUSRG3jcpU+5m8QZe4tCZ7MZIN9Nv0hFRDLMFksLEXELAmbikWtIQk1rpVO54RBTKGqb+P4DT
	MOo0Q61pvcG9fvzS5ibwwder8GCU62zn0kZ7R1DwsIB/4+KZhKsdQ5kOY15dY1QLAOG2m/qfx2dKK
	MLO+//9A5xXvMasaNL6tusNbBFclvmkaMeh17kXjHfn8ituXpL48AkfhfUCPeWUPRgoVU4/7gY6xp
	ChKZuWyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmFO6-000JXR-1n;
	Tue, 11 Apr 2023 14:54:26 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmFO2-000JWd-2N;
	Tue, 11 Apr 2023 14:54:23 +0000
Received: by mail-ej1-x629.google.com with SMTP id ud9so20889739ejc.7;
        Tue, 11 Apr 2023 07:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681224860;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ooA/O5How6wQvdMPwj1oVf9NjGnfxxmKWhsoBtFQ4c0=;
        b=qfMaiqu0EvyxBXJQV5iXyTIteNFwIp0kn8IXJ+o4Az9OdrCE9VDs6EwSVZQlWYbM2r
         0MC7x+fv9U9MFiDopk0B/XMmtjYn074RbaOslhcR817eOP5y6G+e3jCLW5S/OTraueQ2
         6iEd/czylPiPpA0BR19KncZbLxMd5pZ7xcuR10nXXVAaMWItAap1rtVrzdhj4uqXmtIQ
         EZNlbnJ7Xsp35jBwgYryuVnJhul2IksKBKhDqlS1B3phYWL0QHsyFWHPIzAUa1eaOUEI
         93U/JkwQ/rFKY5QY6p1Vd6Ue/VlqdBPmdrRywUO08v3i7MZX21EjCP4Lk1bkUASDTXEX
         uu3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681224860;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ooA/O5How6wQvdMPwj1oVf9NjGnfxxmKWhsoBtFQ4c0=;
        b=OfR3NO22Qf33nQpd0s/V5kAAZ1T5QU7I1INMmFEjtz02c6TH8LMGMwIFc6NFPz+Q52
         9yqWIQHfbVkVg4RgIahCAs3Sf4qQGtz84ed5F3iqQnYUo7jgPD/D2fQIkOi0EE2x25nY
         FE59HkOjIIm3m9L3L1z0YO2JEFQxAoUZGOsi2nfUeW7JpOBuxCujWFxdYgMII9/FxE39
         F0JDv0eOWezepFV3Smgd9QOsj6MFmfTB4A5v2nEllKnR+av2N8U1ZwdF1fAW3GzBWoA3
         8b+CFmwHMPDvHAep/FwrfE5MxC5xSXXKnuoWE5vpr2p+5QnUTRZvq7VSVVaQJU6FdhjE
         dyIw==
X-Gm-Message-State: AAQBX9dXWggFLJ5Cl2ybvk7WxT8XoUDVFXlTO1mS5Xif49C8xOocKMp4
	lZFlnqx3dTly+5MGvd8FaKU=
X-Google-Smtp-Source: AKy350bG/mKyWotWt/5WTONtgPkIJlgfNGN0xCvfvLkEQA0SDIwmC8iy16B3Z2wDkS0Ug3nwQcT6gA==
X-Received: by 2002:a17:906:70cf:b0:939:e870:2b37 with SMTP id g15-20020a17090670cf00b00939e8702b37mr12602594ejk.70.1681224859587;
        Tue, 11 Apr 2023 07:54:19 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id z21-20020a17090674d500b0094e1026bc66sm975125ejl.140.2023.04.11.07.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 07:54:19 -0700 (PDT)
Date: Tue, 11 Apr 2023 17:54:16 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [RFC PATCH v2 net-next 06/14] net: dsa: mt7530: do not set CPU
 port interfaces to PHY_INTERFACE_MODE_NA
Message-ID: <20230411145416.kovyu3wb3dhtgbl4@skbuf>
References: <20230407134626.47928-1-arinc.unal@arinc9.com>
 <20230407134626.47928-7-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230407134626.47928-7-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_075422_810928_7D0E8661 
X-CRM114-Status: GOOD (  10.79  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, erkin.bozoglu@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Apr 07, 2023 at 04:46:18PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> There is no need to set priv->p5_interface and priv->p6_interface to
> PHY_INTERFACE_MODE_NA on mt7530_setup() and mt7531_setup().
> 
> As Vladimir explained, in include/linux/phy.h we have:
> 
> Therefore, do not put 0 into a variable containing 0.

The explanation is unnecessarily long. I only provided it to make sure
you understand.

