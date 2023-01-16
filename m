Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CC4C677F1
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 19:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEXSnU92F25+pQZ7j/ugqhVpdFpJuO21X3P5/Cl5PKQ=; b=IGlJchfsX44NUE2Auj+qcYBLQu
	aBL3UrcU9oKRhBvB864HZX7JPAJ7vnq4JGs2Yq7wEowoRuUjkS0qvNTL/xURNh/I05wK5L3KruO8/
	aSPSf4ZvVpEZBDowFRXljTu6xkXR/uMfZ3kExgVStebVDLPLCSqT4DWsRCAjOKankZyWRkCYcuK35
	e2rm6krQksO3Kd6ezG70sRJHB4d8azgb+t8LAAHgpyt6no0dvEUcScm6QwEdoRiYQkeUkKYL/YU7V
	iJNh3iexQxLcu6wcUwBfLOlo+nca+qMEvU2DJokGSS4x4ZZ3QrsciEIpb/BVNC+XCo+BrLsd3sD+T
	ntAV/Wtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHVAG-00Bryf-Cv; Mon, 16 Jan 2023 19:29:04 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHVA6-00Brwt-KT; Mon, 16 Jan 2023 19:28:55 +0000
Received: by mail-ej1-x633.google.com with SMTP id kt14so11420739ejc.3;
        Mon, 16 Jan 2023 11:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CEXSnU92F25+pQZ7j/ugqhVpdFpJuO21X3P5/Cl5PKQ=;
        b=Em5DoiYpYrIyZy2p3QJASxwL5PBvpr5AlBw7El6F3zr/+EEOD7iuRHUTJRYtzzVfRt
         A05Lqb4r5SV/e4bPIqK3cCgn3uMEO4L8Io2gsZgnn1fXhM3nzc2mnt6kRJt5cEWN119R
         NvUSwI4zMUtmaVKzaQWn5IRh2TnG8/IZ5RrwE/qQMihxQkNlMaK6yC2GjK16XJEjXa/q
         X6dVvb4nZq2sQTFjAKM+bAmsdvYNhJpPZNuk0bLY74X5w0bugQ5kNivcnB+j5FSMlBQ5
         OWvi6v7xzSbtwIpgPvMx8OGT/ihVDlsx1QLvu38cyk74ITIBRE9qRkneZNH0leKJiaD/
         mZ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CEXSnU92F25+pQZ7j/ugqhVpdFpJuO21X3P5/Cl5PKQ=;
        b=CPQF2ztRSUZ0E8NONsIH5nuZljRkCZEl0mkc2T8655qANX/ZQLvckmjT2cefOsvtC0
         BB3d3n0QUp7tnNcoYmXblo1cxqp8Oh2B+XrR/IY6zOkUnAgDkfifE+RQvlH/VqBjidy3
         9GiPenlzjnWsy6sa1ZcExrdJ7iFZ8s7GvKNlBjqqeboMj7FqxkbClyhnXiZVC5tDviPC
         0GqZX/2te6IEWHIAzJdLP+QUNezGMr3ll9tFYFra6tO7MvygbXK+QDEv213hPFz4MSx+
         jl0mT5SJiNvriN/6P5bj/q7Gpz9jQYIHs7C53YrKkbrgHWB0K1TlEOMhPbYdmxe3Ilhi
         HY7A==
X-Gm-Message-State: AFqh2kpL9puoxLgos/Ko52+xqSwiM3s4u7pU+4zlDlWHhWfrG9pwJ6/U
	oq/nOQ6yGIMX/stM31VQqow=
X-Google-Smtp-Source: AMrXdXsvdrtS57ZbbOQdVeoHVOfWaJG213U9hdwNzzZXDq7P7HeiNHiHnyKY7Z9C7+GuvgKw9jPSGQ==
X-Received: by 2002:a17:906:2288:b0:872:23b8:d6ed with SMTP id p8-20020a170906228800b0087223b8d6edmr155759eja.20.1673897332179;
        Mon, 16 Jan 2023 11:28:52 -0800 (PST)
Received: from skbuf ([188.27.185.68])
        by smtp.gmail.com with ESMTPSA id w15-20020a17090633cf00b008711cab8875sm1151237eja.216.2023.01.16.11.28.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 11:28:51 -0800 (PST)
Date: Mon, 16 Jan 2023 21:28:48 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Michael Walle <michael@walle.cc>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
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
	linux-mediatek@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>
Subject: Re: [PATCH RFC net-next v2 11/12] net: dsa: Separate C22 and C45
 MDIO bus transaction methods
Message-ID: <20230116192848.bi7bs5e55pdlxffm@skbuf>
References: <20221227-v6-2-rc1-c45-seperation-v2-0-ddb37710e5a7@walle.cc>
 <20221227-v6-2-rc1-c45-seperation-v2-0-ddb37710e5a7@walle.cc>
 <20221227-v6-2-rc1-c45-seperation-v2-11-ddb37710e5a7@walle.cc>
 <20221227-v6-2-rc1-c45-seperation-v2-11-ddb37710e5a7@walle.cc>
 <20230103153134.utalc6kw3l34dp4s@skbuf>
 <Y7ROa8ql9R5SHPsK@lunn.ch>
 <20230103155633.tfdxncl75s4tb2ln@skbuf>
 <6208c429b0b5541a4f6d2a8556ae1fcb@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6208c429b0b5541a4f6d2a8556ae1fcb@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_112854_691594_6503950C 
X-CRM114-Status: GOOD (  13.37  )
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

On Mon, Jan 16, 2023 at 08:51:55AM +0100, Michael Walle wrote:
> Hi,
> 
> Am 2023-01-03 16:56, schrieb Vladimir Oltean:
> > > So Luiz patches may allow a C45 bus, but are there any drivers today
> > > actually using it?
> > 
> > I sent a private email to Luiz a few minutes ago asking him to confirm.
> 
> Any news here? Do we need the c45 methods?

No news it seems. I am going to default to assuming that no, a ds->slave_mii_bus
created by dsa_switch_setup() does not need C45 accessors.

This patch should be modified to only touch the mt7530 driver, and
adjust the commit message accordingly. I see no connection to what the
DSA core does.

