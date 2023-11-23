Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55EEC5AD4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 19:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hq7LNXGTuldiV4ecttMMHQLmxEW4ioDA8UB5OvVq6I=; b=T7HwD8Ip9K7UBqp59/+VkIpHW9
	uAuXBkQDwNziTHAQfer8aWdM3M/ZKxqv4xSm77UcbEk7sfEe8Nccr1AI6OUXoYkFooeg5g1NfxxGM
	1kVR4wehyEORrHrP0CzTMLMzkFUHrLMZ2E5hwaGQ9wk+7VeILOGW22RNDYGVmMpTzfMJeFLZ6qujD
	uejG9XWIorqcTBeuu2kv6veg7rt2ggD03oTXoxZ0mcqueFULRMm9rvJN8dpDZS9U8S03AuZaJe/fF
	zSRM2U5MJF/T3oXYhmaFAbq1AtC0afFDGApgY2Dp9quW3AdWGSFYbODB4x87ltJUCmLto/AokxhH1
	t7mOGVaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6FS7-005bUB-34;
	Thu, 23 Nov 2023 19:33:31 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6FS4-005bTG-2W;
	Thu, 23 Nov 2023 19:33:30 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2c876e44157so14710371fa.2;
        Thu, 23 Nov 2023 11:33:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700768006; x=1701372806; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/hq7LNXGTuldiV4ecttMMHQLmxEW4ioDA8UB5OvVq6I=;
        b=f+U41HdXXoGS+8YGLeR4YrsO5hd5a6jGJskUar+v/+D0ETzm6B4qi0oQ7C788+mEsp
         n7SAf0NwWHv4pnL8umnHPQNTVCh99qZptMEWa3i8BPFRCcv46+XZCgGuzJgU4uWygbwU
         +8Tebjh/pl4M5GTIfV0wfi5ZcpsIGnEtlLSzo9sY1K8IOQIWzSKHAngmC9mX7fVhAbtY
         d3p4FG8eWk8QyXBfC9CBNL4a8NHrRbqJb8k3obyumwmtC96JRLxmfW5NoORgVXcBvlb9
         dP/KQW6QcsxagckdkFyuGd1HbJ9Ox1dnR3M5TJgYchdd4K4utVWLkg1tpJoSrj5/fYlT
         ZNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700768006; x=1701372806;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hq7LNXGTuldiV4ecttMMHQLmxEW4ioDA8UB5OvVq6I=;
        b=XRWmtY9CY8XZYay4st9Uk8p89tVjgqHP2dNnoVWx3wiCWg/gHdoasCtH9uQCJPXCt/
         V2qY0SIBUKmulTZQxZvPAupdAJfbIalq/np6DANVDQjO/0pPCp8UnWn0BDLc9+YU2f4j
         wq6MokYVsfhGezgcMjL7ZhodGkSgI+6s207D6b/5RFzXVny/gN6QP07QF7xJrECXNJUc
         beeHNJrPN/BFsJm8KC/vXtc5o9L1G2sX5LpROueZfSAPUfeaD45FgtOMWdSqCgUOfJRT
         1XjzrHQwKsgYpMbmoO8iSuf76W22MJNRjZj6VUwYoIAqknR0X6QNyHeg+S0Y8iaoruBX
         JYyQ==
X-Gm-Message-State: AOJu0YxpUFgVXZBXJPI0FBnYXXlB6IrJxKjxEPb9iNaa5hBWQe958en6
	BPq5ni1W3Zb7FXErGj/hyCw=
X-Google-Smtp-Source: AGHT+IEpZV8AAS3AX/kSyCq/TvjTy4lvHHyqL6QV8NqZ0ODQESSmWB93J1AVOkRbP2EeuZ27xtYNUg==
X-Received: by 2002:a2e:3a0f:0:b0:2c8:7962:cdc2 with SMTP id h15-20020a2e3a0f000000b002c87962cdc2mr223068lja.3.1700768005622;
        Thu, 23 Nov 2023 11:33:25 -0800 (PST)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id a4-20020adfeec4000000b0033130644c87sm2442265wrp.54.2023.11.23.11.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 11:33:25 -0800 (PST)
Message-ID: <655fa905.df0a0220.49d9b.7afd@mx.google.com>
X-Google-Original-Message-ID: <ZV+pAo5jt0N9/AE2@Ansuel-xps.>
Date: Thu, 23 Nov 2023 20:33:22 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Jie Luo <quic_luoj@quicinc.com>, Rob Herring <robh@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 03/14] dt-bindings: net: document ethernet
 PHY package nodes
References: <20231120135041.15259-4-ansuelsmth@gmail.com>
 <c21ff90d-6e05-4afc-b39c-2c71d8976826@lunn.ch>
 <20231121144244.GA1682395-robh@kernel.org>
 <a85d6d0a-1fc9-4c8e-9f91-5054ca902cd1@lunn.ch>
 <655e4939.5d0a0220.d9a9e.0491@mx.google.com>
 <6a030399-b8ed-4e2c-899f-d82eb437aafa@lunn.ch>
 <655f2ba9.5d0a0220.294f3.38d8@mx.google.com>
 <c697488a-d34c-4c98-b4c7-64aef2fe583f@lunn.ch>
 <ZV9jM7ve3Kl6ZxSl@shell.armlinux.org.uk>
 <e32d5c84-7a88-4d9f-868f-98514deae6e9@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e32d5c84-7a88-4d9f-868f-98514deae6e9@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_113328_823233_B7299794 
X-CRM114-Status: GOOD (  26.12  )
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

On Thu, Nov 23, 2023 at 03:57:58PM +0100, Andrew Lunn wrote:
> On Thu, Nov 23, 2023 at 02:35:31PM +0000, Russell King (Oracle) wrote:
> > On Thu, Nov 23, 2023 at 03:27:05PM +0100, Andrew Lunn wrote:
> > > > Just to be more precise qca807x can operate in 3 different mode:
> > > > (this is controlled by the MODE_CFG bits)
> > > 
> > > > - QSGMII: 5 copper port
> > > 
> > > 4 slots over QSGMII, plus the second SERDES is connected to the MAC
> > > using SGMII/1000BaseX?
> > > 
> > > > - PSGMII: 5 copper port
> > > 
> > > 5 slots over QSGMII, the second SERDES is idle?
> > > 
> > > > - PSGMII: 4 copper port + 1 combo (that can be both fiber or copper)
> > > 
> > > 5 slots over QSGMII, with the second SERDES connected to an SFP cage.
> > > 
> > > Are ports 1-4 always connected to the P/Q SGMII. Its only port 5 which
> > > can use the second SERDES?
> > 
> > I think what would really help here is if there was an ascii table to
> > describe the configurations, rather than trying to put it into words.
> 
> Yes.
> 
> And also for ipq4019. We need to merge these two threads of
> conversation, since in the end they are probably the same driver, same
> device tree etc.
>

For everyone that missed Robert response in patch 12 let me quote him
also here.

"
Hi Andrew,
I think that the description is confusing.
QCA807x supports 3 different modes:
1. PSGMII (5 copper ports)
2. PSGMII (4 copper ports + 1 combo port)
3. QSGMII+SGMII

So, in case option 2 is selected then the combo port can also be used for
1000Base-X and 100Base-FX modules or copper and it will autodetect the
exact media.
This is supported via the SFP op-s and I have been using it without issues
for a while.

I have not tested option 3 in combination with SFP to the copper
module so I cant
say whether that works.
From what I can gather from the typical usage examples in the
datasheet, this QSMII+SGMII
mode is basically intended as a backward compatibility thing as only
QCA SoC-s have PSGMII
support so that you could still use SoC-s with QSGMII and SGMII support only.

So there is no way to control the SerDes-es individually, only the
global mode can be changed via
the Chip configuration register in the Combo port.

You can see the block diagram of this PHY in this public PDF on page 2[1].

[1] https://content.codico.com/fileadmin/media/download/datasheets/qualcomm/qualcomm_qca8075.pdf
"

-- 
	Ansuel

