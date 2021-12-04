Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54D60C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Dec 2021 17:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVqu66KVBWlW77lk0NaIIYMJBIQj0nwpy3iEcW95TCY=; b=g1kRaF48qDBX8l
	Ud7xyVj1ozn13QnTCmrN8qyEdaTzarh7BcCK7yo14kPL+Ub6/9n5jvHVNpjUu/Rh08TnxG01YylDr
	aAXn4WlMBuUgaOsd3mD4RrRTRvDKrmF5GRnJszu8mgp5KkIebXE6BAM/lBbfvOmvKqhdVnPwlk9qz
	CsF+LjMrzdZGxYIVt8FSsezwmQxFWjcGJn+eAuM45paQhWb5scuMCys1whuimeLcrcBFG2GNC246w
	sNGn88mVMZAxbwzY+Umyec5t1dQq0ejJfgqny4wxJRiDHad83B+uAn01q0mJSe6rATrBtZV0I3q6U
	bk7cCpaU5+S8QzumFMUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtZCz-000d6r-Az; Sat, 04 Dec 2021 17:52:25 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtZCm-000d4Z-7w; Sat, 04 Dec 2021 17:52:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mVm0eifmz8RdIj10Mwm+9KkTNvgkzEf2FRbG+abQdDs=; b=WhzLYDXfVIHsYWm/Wu89gTyxGu
 lkn0ml71cSVnNmy9weUUNcmgnP1YRaFrEKQAtTStQ648SxMncHDk7Q6vECPQmWWqZQtVRrFoYYK2S
 I7AM6ORevMJCVaH6MKNrgTZ1ThwqVpffe2Wmcfd+Y5+NlY1mThEnX8IkOiWa2MkE0jX4=;
Received: from p54ae911a.dip0.t-ipconnect.de ([84.174.145.26] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1mtZCX-0004Ca-EA; Sat, 04 Dec 2021 18:51:57 +0100
Message-ID: <36891e25-2896-f351-726c-26e308b808fa@nbd.name>
Date: Sat, 4 Dec 2021 18:51:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH 3/3] mt76: mt7921: fix build regression
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Shayne Chen <shayne.chen@mediatek.com>,
 Soul Huang <Soul.Huang@mediatek.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20211204173848.873293-1-arnd@kernel.org>
 <20211204173848.873293-3-arnd@kernel.org>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <20211204173848.873293-3-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211204_095212_545240_BCFF1A76 
X-CRM114-Status: GOOD (  11.43  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2021-12-04 18:38, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> After mt7921s got added, there are two possible build problems:
> 
> a) mt7921s does not get built at all if mt7921e is not also enabled
> 
> b) there is a link error when mt7921e is a loadable module, but mt7921s
> configured as built-in:
> 
> ERROR: modpost: "mt7921_mac_sta_add" [drivers/net/wireless/mediatek/mt76/mt7921/mt7921e.ko] undefined!
> ERROR: modpost: "mt7921_mac_sta_assoc" [drivers/net/wireless/mediatek/mt76/mt7921/mt7921e.ko] undefined!
> ERROR: modpost: "mt7921_mac_sta_remove" [drivers/net/wireless/mediatek/mt76/mt7921/mt7921e.ko] undefined!
> ERROR: modpost: "mt7921_mac_write_txwi" [drivers/net/wireless/mediatek/mt76/mt7921/mt7921e.ko] undefined!
> ERROR: modpost: "mt7921_mcu_drv_pmctrl" [drivers/net/wireless/mediatek/mt76/mt7921/mt7921e.ko] undefined!
> ERROR: modpost: "mt7921_mcu_fill_message" [drivers/net/wireless/mediatek/mt76/mt7921/mt7921e.ko] undefined!
> ERROR: modpost: "mt7921_mcu_parse_response" [drivers/net/wireless/mediatek/mt76/mt7921/mt7921e.ko] undefined!
> ERROR: modpost: "mt7921_ops" [drivers/net/wireless/mediatek/mt76/mt7921/mt7921e.ko] undefined!
> ERROR: modpost: "mt7921_queue_rx_skb" [drivers/net/wireless/mediatek/mt76/mt7921/mt7921e.ko] undefined!
> ERROR: modpost: "mt7921_update_channel" [drivers/net/wireless/mediatek/mt76/mt7921/mt7921e.ko] undefined!
> 
> Fix both by making sure that Kbuild enters the subdirectory when
> either one is enabled.
> 
> Fixes: 48fab5bbef40 ("mt76: mt7921: introduce mt7921s support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Felix Fietkau <nbd@nbd.name>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
