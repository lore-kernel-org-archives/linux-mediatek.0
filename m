Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1466C4829E
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Feb 2024 01:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jzFjftUHCCCXFtG6EptiA3RMrTwV5kvtkepZmVTZewE=; b=vQC3WZfi51uH6TSfQae0hanSce
	iQpSdYAGMzr7F0CDp/0urw/mguhp35iRW7geHTTRH8Xmu3PChI25T4VSwTWEGkyGJxRZW93yzbJP/
	gDt4szMzvoTOdCZItaz+WIYg2gXLUA6okbR+eYEyjyiNPCIU5PO2NK198hZVQDoxXSqdqKsoqDnPC
	g2ht8K+LQjtRZbd3v2uZW76KDz76weX/+IGsI9PBvES94Gn17PtidePaHp/568ZElYEqsOJ/ctS3q
	rsDqdj5kFb41E4LD5p9Ibzd1K21VK0JjQDTTKuTpO43MpSauhBQR7dDrX3mAfMSFz3XdEru4WBNPU
	JaTa2sxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ran7o-00000000kpW-0bOm;
	Fri, 16 Feb 2024 01:34:48 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ran7k-00000000kp0-40Zv;
	Fri, 16 Feb 2024 01:34:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-41205e19660so10752775e9.2;
        Thu, 15 Feb 2024 17:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708047282; x=1708652082; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jzFjftUHCCCXFtG6EptiA3RMrTwV5kvtkepZmVTZewE=;
        b=S1y5qulTUakrtt9+OI2J5NNS53r81cB/J5OjWp1Wnw1OC14UAD2PSyttouN8vHsc4F
         XTxakHn4/9y2low2ShQvr//1yo63mTpckqidIpmlmaDb72Tj3ug11GWs6vV+bdGuPaYk
         c4svr6Wty4YZw9pLwns1RY7phZzb312kDWfA/wuou6Haw/OPS747Ti+CPjzTnD5npIB+
         n1/s+WbtbzrL69o92JHITGf4mcdkhY33Cb+Zosi0i8uC8Ph9SF/mzW3JRqX3muTtAAhD
         0OC7pApuoed8inJf1WUT0d1/omw0KRrQUazA/EAj7Hlf2YFYgYSdb9rqf2RWFEInre/0
         SYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708047282; x=1708652082;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jzFjftUHCCCXFtG6EptiA3RMrTwV5kvtkepZmVTZewE=;
        b=cZwUYFdC2KNt7GapXqaYJ5CI9VVlrc8aeexdOhJ2q4NYWshSoeZWingqR2Uq6OJtts
         FpXrws1gzZijc130nt23HupgnOfHsx+hmUP2tjHemD6f3Yk2o0hAEpOI0b1l3y+wEcSV
         Wt0536TBm0XVfWRDpi4GO7C137CXUXbgfsTsIJEJny5KYralSaeQdAGgkMP0fGWJ8QOL
         NA1AgsUj7PQKB6XfOl77pBbdaS/JKDh3sKGGPazTxHHfcQrjhm2xSQZc8KkuzfBsG2c4
         yUjak/e/Ja3E2O/HqZTcK7s7LDa3rNmYhEx/emz9Q1BGftJhL/3Zbt+Nq1U9etYAxVP8
         aruw==
X-Forwarded-Encrypted: i=1; AJvYcCV8yPkWjBJe9Tgrhe+AbNpVaGEuSCoZgyGTt8MAPaJnUNFvqLGAzCDUl9DniDD0TIYE6xqeWIru+f/wMtredr2cIKZFCrNnOJGh5tTxJJHLkAzuhdwET+DwqpGmUOlp7lWc51yI5hu+/sokc2rybPpid6dN1C3Vuus=
X-Gm-Message-State: AOJu0YxNMURzEGZQKgGLkBO/V2NYDlMIvY1FzpRQDmjH8jf8cRjuMEn8
	PW7alcGeDgO7DF+gJIEpFY6RU9cJuy5EtyllPWIoX8dELKcPgdh7
X-Google-Smtp-Source: AGHT+IEKX4mPK8p3LVtgqAEYyCPcuWaiS7Wg/M61Uzh8Z2MrCR1EPMqWz1zamkiXHkPSe7lbjeYPxA==
X-Received: by 2002:adf:f892:0:b0:33c:fb94:1e12 with SMTP id u18-20020adff892000000b0033cfb941e12mr2617815wrp.54.1708047282318;
        Thu, 15 Feb 2024 17:34:42 -0800 (PST)
Received: from skbuf ([188.25.173.195])
        by smtp.gmail.com with ESMTPSA id b7-20020adfe647000000b0033b406bc689sm665199wrn.75.2024.02.15.17.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 17:34:41 -0800 (PST)
Date: Fri, 16 Feb 2024 03:34:39 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc.unal@arinc9.com
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>, mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	Bartel Eerdekens <bartel.eerdekens@constell8.be>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH netnext 0/8] MT7530 DSA Subdriver Improvements Act III
Message-ID: <20240216013439.dq7s5hp74mjahy4d@skbuf>
References: <20240208-for-netnext-mt7530-improvements-3-v1-0-d7c1cfd502ca@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240208-for-netnext-mt7530-improvements-3-v1-0-d7c1cfd502ca@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_173445_019924_55D14D7E 
X-CRM114-Status: GOOD (  12.55  )
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

On Thu, Feb 08, 2024 at 08:51:28AM +0300, Arınç ÜNAL via B4 Relay wrote:
> Hello!
> 
> This is the third patch series with the goal of simplifying the MT7530 DSA
> subdriver and improving support for MT7530, MT7531, and the switch on the
> MT7988 SoC.

There was an automation failure, you used the name "netnext" in the
subject prefix and patchwork reacted with "Patch does not apply to net"...

Please resend to get some build testing. I gave a quick look over the
patches and I didn't see anything obviously objectionable.

