From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net-next v2 0/4] of_get_mac_address ERR_PTR fixes
Date: Tue, 07 May 2019 12:23:06 -0700 (PDT)
Message-ID: <20190507.122306.163240491107984253.davem@davemloft.net>
References: <1557177887-30446-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-15
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1557177887-30446-1-git-send-email-ynezz@true.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: ynezz@true.cz
Cc: netdev@vger.kernel.org, matthias.bgg@gmail.com, andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com, frowand.list@gmail.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, maxime.ripard@bootlin.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

From: Petr ¦tetiar <ynezz@true.cz>
Date: Mon,  6 May 2019 23:24:43 +0200

> this patch series is an attempt to fix the mess, I've somehow managed to
> introduce.
> 
> First patch in this series is defacto v5 of the previous 05/10 patch in the
> series, but since the v4 of this 05/10 patch wasn't picked up by the
> patchwork for some unknown reason, this patch wasn't applied with the other
> 9 patches in the series, so I'm resending it as a separate patch of this
> fixup series again.
> 
> Second patch is a result of this rebase against net-next tree, where I was
> checking again all current users of of_get_mac_address and found out, that
> there's new one in DSA, so I've converted this user to the new ERR_PTR
> encoded error value as well.
> 
> Third patch which was sent as v5 wasn't considered for merge, but I still
> think, that we need to check for possible NULL value, thus current IS_ERR
> check isn't sufficient and we need to use IS_ERR_OR_NULL instead.
> 
> Fourth patch fixes warning reported by kbuild test robot.

Series applied, thanks.
