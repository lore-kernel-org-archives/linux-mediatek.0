Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D16C04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 13:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+Kho1tTDYMy+feUtLoUrIepxnc5e58P8cS7A/7gF+U=; b=mLvqCOg3IUqxUsd2Tcj67pz42I
	M/zEQ+FTidxHFrvChAOtLy6WER8k+GX5VRMPHlEs5HEAKqj4YHFlWW919kMVxSjGIKDNyCxPf1WNF
	psoQsM9TXdzk9ToAUUKHlW0cnTh042XIoxVaWs00TMEfV7U7gr2SIRy3KtlnOjUXpbfixvVGWqYnP
	vh9lfZBY2cWqEoAFoShQfhpx7H4AD6p84ENSlzH4QG3ejhmTV7XRNC0RwzoNIRlV2xGSuaGudGjyE
	z+d2TiAwpxR6wzn+qZA28UOeLsv5n0sP69HpUWosUXAmsU4ot9XaSHyk6pizbl+Nozp7B/06qZAiS
	U1wTTWyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGhFN-00E75L-3O; Wed, 27 Jul 2022 13:38:45 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGhF9-00E6zL-L0; Wed, 27 Jul 2022 13:38:33 +0000
Received: by mail-ed1-x535.google.com with SMTP id a89so706426edf.5;
        Wed, 27 Jul 2022 06:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=N+Kho1tTDYMy+feUtLoUrIepxnc5e58P8cS7A/7gF+U=;
        b=qxLOalOnGgYaNSBiFh7kG611YZYBypvahjLD7H1hwxpmxyssGZ1k2CisnikXq7XsLG
         N41BKOmt4wK76lryxMWoSpzMK9BIrvFX6nrrtTzZw2RXKMbsilE6/ilIrKSMVCsl1tAQ
         FULDxEcIGAbvZhrcbK3bBczD45KB0mtMiun56LjdTtQkFdFX1fzK+J3AI9a1NQmpszvm
         3WsI4DSQ+t9EU7CL2uEUHduuk8Bh8uo5GUXNKE6CSKxrbTivW2tZHoJ9FRPYFH3Uv86b
         SIdJY6L+UQegZ4uyqiqNtGPsd7ovg44+S/QfRCqOkLDhmznl/9GZu21QGsaGbTOO33Jm
         OFeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=N+Kho1tTDYMy+feUtLoUrIepxnc5e58P8cS7A/7gF+U=;
        b=Ic4Y4z0BPpSmZP2MBuPNRYQ9nFSu/DokDpG535wIOAahsNE+/epDhjFDoSkjRv++HB
         RiM+Jczkj3UIWiKwwH+fS055pJ5m3B1yKpxaqfQPuxOMcRWoZH0idTqH8j3Bl8BwsoZB
         n6cJXHfzNN9vk7tgVMKW6iVjNIfhDgFPdlNLChxt4q9puqWw4I7MQWfpEkI12qt8YdDu
         xZNuDLlStWsfJUgsLqyQ9nDhLHCC1LBtR9ixfjLZY9qBbPUqqklTr5XEoyuwoW8pY5rP
         Ea2LjYa7fc7b0MwPyo92wbtpB9+IGHKZM+cxrwPTTSqiUzFc8gJQ0XmuvJikgrhgOXN4
         pfpQ==
X-Gm-Message-State: AJIora/L//fvdnDwcFmTTHEUvHt5qi+2UpQbg86xEBH5JzytNbsz8C+F
	BcchS6W8g89cdB35xxKApdw=
X-Google-Smtp-Source: AGRyM1tZdX7DcKsI0OH23LMM8bUt8j1r6SKxeLv0A5Vc723Jp1Ef5b9L3U3LBQ7vPjvnF4yyq0Tmdw==
X-Received: by 2002:a05:6402:3282:b0:43b:e650:4352 with SMTP id f2-20020a056402328200b0043be6504352mr18381276eda.376.1658929108106;
        Wed, 27 Jul 2022 06:38:28 -0700 (PDT)
Received: from skbuf ([188.25.231.115])
        by smtp.gmail.com with ESMTPSA id g21-20020aa7c855000000b0043bd753174esm7940248edt.27.2022.07.27.06.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 06:38:27 -0700 (PDT)
Date: Wed, 27 Jul 2022 16:38:24 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Daniel Scally <djrscally@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	George McCollister <george.mccollister@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sean Wang <sean.wang@mediatek.com>, UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>
Subject: Re: [PATCH net-next 0/6] net: dsa: always use phylink
Message-ID: <20220727133824.ymedhfhrggietmpj@skbuf>
References: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
 <20220727110051.2df82bf6@dellmb>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220727110051.2df82bf6@dellmb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_063831_713015_18AC7355 
X-CRM114-Status: GOOD (  14.85  )
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

Hello Marek,

On Wed, Jul 27, 2022 at 11:00:51AM +0200, Marek Behún wrote:
> Dear Vladimir,
> 
> am I understanding correctly that your main objection to this series is
> that it may break other drivers?

Yes, but I'm not saying this in a way that tries to make it impossible
to make progress. But rather, I've identified 8 drivers which may lack
complete device tree descriptions:
https://patchwork.kernel.org/project/netdevbpf/patch/20220723164635.1621911-1-vladimir.oltean@nxp.com/

Simply put, I have no indication that the changes presented here are a
step in the right direction for the remaining 7 drivers. Each and every
single one of them needs to be studied and discussed separately; the
discussion has already started for some.

> Do you think it would be okay if I changed it so that only mv88e6xxx
> driver would ask for phylink for CPU/DSA ports?

It would be a good start, yes. What I could do is I could move my
validation logic from the patch linked above into dsa_port_link_register_of().
Running that logic would let DSA know which properties are missing.
Then, for drivers that don't enforce validation, we could add new
dsa_switch_ops that separately ask the driver what phy-mode to use
(if missing) and what speed/duplex to use (if missing). Drivers can use
whatever heuristic is appropriate for their deployments to respond to this.
If the phy-mode and speed/duplex are finally resolved, DSA can create a
software_node and register with phylink that way. Otherwise, DSA will
continue to do what it does today, i.e. skip phylink registration.

How does that sound?

