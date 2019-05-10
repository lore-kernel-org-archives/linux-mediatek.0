From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH net 0/5] of_get_mac_address fixes
Date: Fri, 10 May 2019 15:15:01 -0700 (PDT)
Message-ID: <20190510.151501.1636787564971451909.davem@davemloft.net>
References: <1557480918-9627-1-git-send-email-ynezz@true.cz>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-15
Content-Transfer-Encoding: 8BIT
Return-path: <netdev-owner@vger.kernel.org>
In-Reply-To: <1557480918-9627-1-git-send-email-ynezz@true.cz>
Sender: netdev-owner@vger.kernel.org
To: ynezz@true.cz
Cc: netdev@vger.kernel.org, matthias.bgg@gmail.com, andrew@lunn.ch, robh@kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

From: Petr ¦tetiar <ynezz@true.cz>
Date: Fri, 10 May 2019 11:35:13 +0200

> this patch series is hopefuly the last series of the fixes which are related
> to the introduction of NVMEM support into of_get_mac_address.
> 
> First patch is removing `nvmem-mac-address` property which was wrong idea as
> I've allocated the property with devm_kzalloc and then added it to DT, so then
> 2 entities would be refcounting the allocation.  So if the driver unbinds, the
> buffer is freed, but DT code would be still referencing that memory.
> 
> Second patch fixes some unwanted references to the Linux API in the DT
> bindings documentation.
> 
> Patches 3-5 should hopefully make compilers and thus kbuild test robot happy.

Series applied, thanks.
