Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FD4C61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 16:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUj1tb4TuSYwUwoIhNOw99sNhzHtGAEfhnWg+uq4J14=; b=HVT1e2oeLdY4EPXfumvAwUf7XE
	oY0ya49r+9ziT6iqbHoGauUXv2ZyifYkOx/+NX40FWW8oMV7eCDDPhfmi5sRFqMjHQ0+hL8Aj6Q8+
	SF7oIY27QyV2uYxEKAGcoHc65OeU1bVwO4TLYO+YhiPr8xqlrz19xWvPlVYtF9uHmf7MdZd3pV/qA
	vFFoH3jipVF7iFEcm5B4Bj4Rc0FWDwwsXXKr7OnNUyLlS3sGd4LTgo3xQ2S565NOAAm8adbsSay5L
	mVeifmZ5EKxRwFD+6N620sl7xIJ51ACp27zcufVO9fFvSoy4wcbzq7rbwePp/ZythSJq4xH29WZvM
	dXchf17w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNyu3-002uew-Fi; Fri, 03 Feb 2023 16:27:07 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNyts-002uck-KV; Fri, 03 Feb 2023 16:26:57 +0000
Received: by mail-ej1-x636.google.com with SMTP id dr8so16715937ejc.12;
        Fri, 03 Feb 2023 08:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RUj1tb4TuSYwUwoIhNOw99sNhzHtGAEfhnWg+uq4J14=;
        b=Asl8uQue9LWo08MaIkIb7jI1hRkLqzzudtQvDBpXIXqQkoxbdF/KLvIZZWQEXwvMPL
         bMvtYu3kDoM3Ub2P8qPZk7gb/iij7N7PVRvrSQ4BysUH7hVGOpm5uyc227mcM/PAEiEZ
         J+uoaJyFsFKUvfSBtY2fmSCxbDemT+ka2phibXCr/SauPiiEtHlXPsH/rhdDDC9Rx3/1
         faQ+ppX0WmhLws/GI1EvYhGEqfcK7VzFbgWjcJirBtrr0FTn56MDjm0W3gTJW7rGi2i3
         WHIoQhSkKqIWXhGqFNZtL0oGmQT8RKffugBYkey/NNNmOsjNTfePuW7lCLVVR72PvZvq
         ZhwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUj1tb4TuSYwUwoIhNOw99sNhzHtGAEfhnWg+uq4J14=;
        b=TrwABHagbr9MasVhUAKIT4hH60oRwaFR1S4xpogcROxXSqs2COMm44GLFDbG8bWuN4
         DpYLln8tiqlT9mawAOZV7F7u4Y7al0PvYfmrK7/FveoHAb/mWVts3OG+CIOV7nFxKVJ7
         SwvRbevbzS2dAlN7xuCnDBnvMScCVKKaO7PtAon4I2t/D+BLqDwxPcy2Pk7x0tvHul/c
         3kQyR/2IMl1wkcEB0N5SB4oOvUIiMgYmwJ4l4vybpqJHhe6cxyXirMzXvdvHxu447weX
         /h7pkbzvK9iytAAfxaHgCnHyqVo0GYWddsZycC9307Y/G1vPDAoBY+F/oRM0Jq3fMfi5
         zbsA==
X-Gm-Message-State: AO0yUKVw6O6HYGe3A7Q6WKHKz3WDJjeMsGg5ojAmztYDe4PYm0hE/xvo
	qOBNTR1Q7WTcKe3Zwvne19kQqsW5pUvNMx1eKlE=
X-Google-Smtp-Source: AK7set9ZvBjDxtOpPvZm4xJVgjoc5lWay022JeXGf0nkD85UtAmHom1fDaYmgZrZMxxjELD+WyybujbXQE5jPLUyEc0=
X-Received: by 2002:a17:906:ca41:b0:88b:a2de:ed92 with SMTP id
 jx1-20020a170906ca4100b0088ba2deed92mr3145596ejb.193.1675441613406; Fri, 03
 Feb 2023 08:26:53 -0800 (PST)
MIME-Version: 1.0
References: <20230130173429.3577450-1-netdev@kapio-technology.com>
 <20230130173429.3577450-2-netdev@kapio-technology.com> <Y9qrAup9Xt/ZDEG0@shredder>
 <f27dd18d9d0b7ff8b693af8a58ea8616@kapio-technology.com> <Y9vgz4x/O+dIp+0/@shredder>
 <766efaf94fcb6362c5ceb176ad7955f1@kapio-technology.com> <Y90y9u+4PxWk4b9E@shredder>
In-Reply-To: <Y90y9u+4PxWk4b9E@shredder>
From: Vladimir Oltean <olteanv@gmail.com>
Date: Fri, 3 Feb 2023 18:26:41 +0200
Message-ID: <CA+h21hp5Eh3zF60J2mTZL+xenD7iMBXKG+Ui0t-oUzgwNwSw2g@mail.gmail.com>
Subject: Re: [PATCH net-next 1/5] net: bridge: add dynamic flag to switchdev notifier
To: Ido Schimmel <idosch@idosch.org>
Cc: netdev@kapio-technology.com, davem@davemloft.net, kuba@kernel.org, 
	netdev@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, 
	Kurt Kanzenbach <kurt@linutronix.de>, Hauke Mehrtens <hauke@hauke-m.de>, 
	Woojung Huh <woojung.huh@microchip.com>, 
	"maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER" <UNGLinuxDriver@microchip.com>, Sean Wang <sean.wang@mediatek.com>, 
	Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>, Roopa Prabhu <roopa@nvidia.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Russell King <linux@armlinux.org.uk>, 
	Christian Marangi <ansuelsmth@gmail.com>, open list <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>, 
	"moderated list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_082656_693529_1EBE8617 
X-CRM114-Status: UNSURE (   6.43  )
X-CRM114-Notice: Please train this message.
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

On Fri, 3 Feb 2023 at 18:14, Ido Schimmel <idosch@idosch.org> wrote:
> I *think* this is the change Vladimir asked you to do.

Yup, although instead of "is_dyn", I would still prefer "!is_static",
but again, that's a preference for bridge/switchdev maintainers to
override.

