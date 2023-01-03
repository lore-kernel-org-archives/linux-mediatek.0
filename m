Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF82C46467
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 17:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zfi94AWNBKuZY0/RUI592SsfY5H/S43YqK9cJfxHwlk=; b=H69KvuTvo2H8rRjHLUuNke4FFE
	dzcdZSzHzWlhtmdkvphjcyPNuoRmMtOFq9FCBg8G7gVz9k+pnshDpfhExnIaGUbbbO6M+6qr9Wfu1
	eb3W1ddP7J22XGzXjfdUTjEkSA6rcCUJMqsJT711vkEJ0BwhWi2F5NEtzcrcCGv3a7p+zm8c2TOyD
	xoGtDwZFXltvYCu/HhRKKEmcFqiXMO7k1CSXv+Ss/D5F12MuZXZAWsaIlV2COluYWEAO75lZKQNGZ
	dkkTMA3leo/JrhQkJPuIS41eKPiUZOIwXczHpbP8tiMtzHld5eFbxZK/nJoCuF28LHosuJ9XKIFXt
	qH69tt/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pClUY-003cFC-Tq; Tue, 03 Jan 2023 17:54:27 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCk1O-002rYM-Ah; Tue, 03 Jan 2023 16:20:16 +0000
Received: by mail-ej1-x631.google.com with SMTP id u19so74981775ejm.8;
        Tue, 03 Jan 2023 08:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zfi94AWNBKuZY0/RUI592SsfY5H/S43YqK9cJfxHwlk=;
        b=HVRvJ5mHZIorQrHjaETTJ9cWHxVB50V50Af0bHipldr0jt3ACH2XWmJ8j1KLk7M7E3
         kRNlecVPV78Qx/GG4RYgDC1Sl5XP62uu3fJFKepB4gF1awMujkKWCiGoAFVurLh1b8kq
         5tY62yw+lgP7rF4Z0qjBXMTpUR2EtJarcpTNdTx1L5vChTBtLijodKm99sRv9EyGhhmN
         K/BlSC7EQ7X3BIvti3cO07MOSfq+1e/J3XM1wZYr/joe4RhQNTjDyyItpgNCUK4Tch1M
         F10Nx4o92IktxBpAvr45DlcpRR/Kn5TeXvPmec2KMaHr84uva2Wvba5Hh/rogLMYYJ7H
         rbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfi94AWNBKuZY0/RUI592SsfY5H/S43YqK9cJfxHwlk=;
        b=pQKfAXCGXKBZk+WHA1abS2BvWAUafsbeB8YSGeglq+NoQMaIbmLjCQ6VwufHVr+86u
         yUEY4G8lVyP5AAZJgfvawsMw+TAZLB8OxcKfKITeIpGWT/WFov0xdD8HzsPMWXfAAGf2
         D6NZvLEL5XtjmTBUDI10RfFYCBPwbASLWn2YUNjBLAd5pL7A4gj3Iuv8oj1k00wkMSo2
         ZwFg4Y3+b2AV5YdZYCjVJeywdKdXd2V4wiDkSknhB9PrRrgVD6gnMIGvu1Xanmg2nYJY
         qap1mB672jXoJD7Wv3n0nw588BL8u7DCmYgbqZf/cQgW09zJpMRsF1y2dX0mKYjbwmuB
         Bq0w==
X-Gm-Message-State: AFqh2kp1CUs5ozHqLh9ZGrrHT3bhdc+f2HBd87VYCDkihSXFembTCXEX
	izqPC/1hoarkWsGblbTguNw=
X-Google-Smtp-Source: AMrXdXv5zpMo2gF+dqhm9M8us4GOLQdoYlmZq8Oh5NeW0IHa/REMSyTvHTzMxIprKOOFBuYQw/HXdg==
X-Received: by 2002:a17:906:185b:b0:841:e5b3:c95d with SMTP id w27-20020a170906185b00b00841e5b3c95dmr41382213eje.30.1672762812094;
        Tue, 03 Jan 2023 08:20:12 -0800 (PST)
Received: from skbuf ([188.26.185.118])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906201100b007c08439161dsm14150897ejo.50.2023.01.03.08.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 08:20:11 -0800 (PST)
Date: Tue, 3 Jan 2023 18:20:08 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Michael Walle <michael@walle.cc>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>, Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH RFC net-next v2 12/12] net: dsa: mv88e6xxx: Separate C22
 and C45 transactions
Message-ID: <20230103162008.7d7nypbdg6dyjtpw@skbuf>
References: <20221227-v6-2-rc1-c45-seperation-v2-0-ddb37710e5a7@walle.cc>
 <20221227-v6-2-rc1-c45-seperation-v2-0-ddb37710e5a7@walle.cc>
 <20221227-v6-2-rc1-c45-seperation-v2-12-ddb37710e5a7@walle.cc>
 <20221227-v6-2-rc1-c45-seperation-v2-12-ddb37710e5a7@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221227-v6-2-rc1-c45-seperation-v2-12-ddb37710e5a7@walle.cc>
 <20221227-v6-2-rc1-c45-seperation-v2-12-ddb37710e5a7@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_082014_487995_CA192C79 
X-CRM114-Status: GOOD (  10.72  )
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

On Wed, Dec 28, 2022 at 12:07:28AM +0100, Michael Walle wrote:
> From: Andrew Lunn <andrew@lunn.ch>
> 
> The global2 SMI MDIO bus driver can perform both C22 and C45
> transfers. Create separate functions for each and register the C45
> versions using the new API calls where appropriate. Update the SERDES
> code to make use of these new accessors.
> 
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---

Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>

