Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CFBC6FA99
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 15:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKhPGEn48aizwdQtbeZiRqDsuVUTk1YIcEaDe2udzRA=; b=aUae1QF52GYduY1D/D5yIq+W8f
	9764+pRTvzqDCmB8+4B8+Ml7pGsmnCpRgdkBK0vclLruabOEwtB1yslObftv1gEKfe4uISKPcILrh
	tYatYv6VzJw3NoxW1t4przJOohRC7DiKndc+odO83QLvYOvLa5jAYL0V21hRi0+RR0j29Yknqenaa
	XRo2KU6o7C7x2hgClav90H9q60o4j4pQ6UTQnhbUuTi8N4aaUxWGHS+DG7plkLljt5AqbuTxKKX/6
	DdMakNOgItiryshdkVrkrWh+00HGKycJl1iNq9fLFqiUiH/M4O7/KKtCC+IuBGwczOMe3ckHx5G5T
	LSWYFJ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbNQW-002kHV-PE; Sun, 12 Mar 2023 15:16:00 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbNQK-002kFz-PC; Sun, 12 Mar 2023 15:15:50 +0000
Received: by mail-wm1-x32b.google.com with SMTP id k25-20020a7bc419000000b003ed23114fa7so570685wmi.4;
        Sun, 12 Mar 2023 08:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678634143;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HKhPGEn48aizwdQtbeZiRqDsuVUTk1YIcEaDe2udzRA=;
        b=gEuJTs8rAj1FCry+rF1CeDbSIJK4LxGMUnOjarG4/VP8KKgqsJUS97hWWDm/LLbiLW
         DNQ0Lgv+r71NlgTtrHCdRkFUVfk67F+DDREcWS4aUT+4VSSOCJmJZsO8W0QkU9rwf7Pt
         Cn53G5xe1ZmguLXX7D5vjKUUiGAvx0jMMHBtIGc0xb6cQC0pyqgYzQq/5exWq7S2NgAw
         puJNDQ7cMwLtW2DmEDwPz2M617RtRbHrqK+okSwZHzrkzpQJMYdHvGJ3PJY/Qo8cR4bp
         uGPv8bwajsDGqCgW0wzlKakgzcPmmU6xg/kmQMWn5STGhVY0qNHM1t9MX50d2RvaCpBy
         MmyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678634143;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HKhPGEn48aizwdQtbeZiRqDsuVUTk1YIcEaDe2udzRA=;
        b=1nuXAFJNaCUEw3iraq9x5WbFLyxFwN7rqy6039rfyKuDW2thqKeuuqOWKDs8MN57XC
         0f+/Z1/v7y7LfWhVE/n4ZMt/s3bqVE1ejaJdMTPSiQMyyMmB0EVKkKLFjr60/npqfe08
         NtP4SJzDGQ+PXQ/+dqq9KThLfsHYBWJ3Md0xCDdnaf/DEVPWBr7ZSusiLVttAPG6OnkW
         XODgLEkeYGEDdOmukI11EGUWrSfxmyK/So9gK8w8r2Ox+ImJ/TQ4Vs92tgkfpyKxBYB0
         pjNFZkAALvo40w7D6hRMcbQ/aIQHeOXlTsTC1cgfMr1DInpVI38yA5Ywx3UR4C+Og69o
         1GiQ==
X-Gm-Message-State: AO0yUKVLVZtO9tw3UEx2w051h7SrG+gyWUpBEAIRAu5jCQE+FFUE9C9U
	t3pX2tuz/29mEjpCnddsiXM=
X-Google-Smtp-Source: AK7set/bjPBg/zjhzM6DAttzOabIYrkqkkyVgJDWMpQSEhOR00TB9rrFvoFv2QmmclSj+Zkfo4wXvg==
X-Received: by 2002:a05:600c:46cc:b0:3ed:1f9c:aeff with SMTP id q12-20020a05600c46cc00b003ed1f9caeffmr2414620wmo.36.1678634143542;
        Sun, 12 Mar 2023 08:15:43 -0700 (PDT)
Received: from ?IPv6:2a02:168:6806:0:1606:cc8d:640:3d4d? ([2a02:168:6806:0:1606:cc8d:640:3d4d])
        by smtp.gmail.com with ESMTPSA id v7-20020a05600c444700b003e204fdb160sm6741547wmn.3.2023.03.12.08.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 08:15:42 -0700 (PDT)
Message-ID: <024b696003d8403d62c45411c813058684e0418c.camel@gmail.com>
Subject: Re: [PATCH net-next v2 4/6] net: mdio: scan bus based on bus
 capabilities for C22 and C45
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Michael Walle <michael@walle.cc>, Heiner Kallweit
 <hkallweit1@gmail.com>,  Russell King <linux@armlinux.org.uk>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Felix Fietkau
 <nbd@nbd.name>, John Crispin <john@phrozen.org>,  Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo
 Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 UNGLinuxDriver@microchip.com, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,  Jose Abreu
 <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 netdev@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,  linux-aspeed@lists.ozlabs.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>
Date: Sun, 12 Mar 2023 16:15:41 +0100
In-Reply-To: <0a1ec04fe494fcd8c68d03e4f544d7162c0e4f39.camel@gmail.com>
References: <db6b8a09-b680-4baa-8963-d355ad29eb09@lunn.ch>
	 <0e10aa8492eadb587949d8744b56fccaabbd183b.camel@gmail.com>
	 <72530e86-9ba9-4a01-9cd2-68835ecae7a0@lunn.ch>
	 <09d65e1ee0679e1e74b4f3a5a4c55bd48332f043.camel@gmail.com>
	 <70f5bca0-322c-4bae-b880-742e56365abe@lunn.ch>
	 <10da10caea22a8f5da8f1779df3e13b948e8a363.camel@gmail.com>
	 <4abd56aa-5b9f-4e16-b0ca-11989bb8c764@lunn.ch>
	 <bff0e542b8c04980e9e3af1d3e6bf739c87eb514.camel@gmail.com>
	 <a57a216d-ff5a-46e6-9780-e53772dcefc8@lunn.ch>
	 <2f64385a350359c5755eb4d2479e2efef7a96216.camel@gmail.com>
	 <29ee3cc4-a1d6-4a07-8d90-4b2f26059e7d@lunn.ch>
	 <0a1ec04fe494fcd8c68d03e4f544d7162c0e4f39.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_081548_840820_73D5C323 
X-CRM114-Status: GOOD (  14.19  )
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

On Sun, 2023-03-12 at 10:04 +0100, Klaus Kudielka wrote:
> On Sun, 2023-03-12 at 03:53 +0100, Andrew Lunn wrote:
> >=20
> > Correct. But their also should not of been any noticeable slow down,
> > because there should not be any additional scanning when everything is
> > described in DT. And the move of the MDIO bus registration from probe
> > to setup should actually make it faster than before.
> >=20
>=20
> But then, why *do* I see such a big difference on the Omnia?
>=20
> mdiobus_scan_bus_c45() takes:
> ~2.7 seconds without phy_mask patch
> ~0.2 seconds with phy_mask patch

Following up myself, the answer is in the call path
mv88e6xxx_mdios_register()
	 -> mv88e6xxx_mdio_register()
		-> of_mdiobus_register()

A child node "mdio" would be needed for the scan to be limited by
the device tree. And this one is *not* in armada-385-turris-omnia.dts.

My (incorrect) understanding was, the child node "ports" would trigger
that behaviour.

Best regards, Klaus


