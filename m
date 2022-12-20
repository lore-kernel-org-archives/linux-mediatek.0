Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72A5C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Dec 2022 13:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D2lmcw6sg9oCIyjMJfPlEp83UKJtlv55g1GrC7sAQz4=; b=yZSOzsHK+TXj5hk6Bo1ccmxHui
	TO9cDggSFkMrtUXs4xSS5vkV6YXLQdDP1DWb8Ex/TnuOdfcMM+2VtX4zp/4vWRS4kjwIwFluUfVoU
	qllCPPKBEBQHvHYp2W5upL7reWErNBs5/Lp6jkd16HWDKzDcLybkY2qsGEFRYC3Hx0nA7cHR6YJdZ
	lFmsVsA+kRec0nIt+pMb+DwQrguzC63Tg967Bbp5r+7169EfrcKqB1Bo/0WPA8ow7QHzmlAPtCrFI
	Phy7xwHi9fN0VGD3yZWp4TOGlRpvfYvBcygizmngI9ORIHCHqqrNmo4JalHlfzFVTaRgkOxKTjiiz
	RuxY/i1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7cIJ-00FSvd-01; Tue, 20 Dec 2022 13:04:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7cFg-00FQIg-HL; Tue, 20 Dec 2022 13:01:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 17FB061361;
	Tue, 20 Dec 2022 13:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03CF8C433D2;
	Tue, 20 Dec 2022 13:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671541306;
	bh=slrz46HiCnR36Ttz5lZwi2BzDl4AV9enAoKXs0qjmNM=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=UXKqSGIOyQZvfv+enBZrb4w4rxIfUxpC8+O6/Z9APCEJ7LTp1RxkoilHrcPTfgiom
	 A/E2K6hgvdTdkF+03z6Wj5wceZ7w0g4Z8H15BanUZR0qfQArf1zXWW/sviGezn9WKb
	 4aj/Q2APzcDuWMp8Fa+Bmz2Sc4iIjs2Ll0G76mH33aZiaC4l0TDEua3SGeEvgMdzXx
	 Sx171OfV+uC4PIa+oqWFqrAmX7bQIRKhvgFo8N7a21xgMNkuqll2G8uhXkeuspPCpv
	 fsU58EpwbZeqgaimp2KZsMWL6M8/Okvia8qgDROZWupSsfi9rV7MHI4Mf7OfKMb/Aa
	 JlU8uG8IuNL7A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: mt76: mt7996: select CONFIG_RELAY
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221215163133.4152299-1-arnd@kernel.org>
References: <20221215163133.4152299-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167154130077.23629.13270502460080911055.kvalo@kernel.org>
Date: Tue, 20 Dec 2022 13:01:42 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_050148_693189_9BCE24CC 
X-CRM114-Status: GOOD (  10.18  )
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

Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
> 
> Without CONFIG_RELAY, the driver fails to link:
> 
> ERROR: modpost: "relay_flush" [drivers/net/wireless/mediatek/mt76/mt7996/mt7996e.ko] undefined!
> ERROR: modpost: "relay_switch_subbuf" [drivers/net/wireless/mediatek/mt76/mt7996/mt7996e.ko] undefined!
> ERROR: modpost: "relay_open" [drivers/net/wireless/mediatek/mt76/mt7996/mt7996e.ko] undefined!
> ERROR: modpost: "relay_reset" [drivers/net/wireless/mediatek/mt76/mt7996/mt7996e.ko] undefined!
> ERROR: modpost: "relay_file_operations" [drivers/net/wireless/mediatek/mt76/mt7996/mt7996e.ko] undefined!
> 
> The same change was done in mt7915 for the corresponding copy of the code.
> 
> Fixes: 98686cd21624 ("wifi: mt76: mt7996: add driver for MediaTek Wi-Fi 7 (802.11be) devices")
> See-also: 988845c9361a ("mt76: mt7915: add support for passing chip/firmware debug data to user space")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied to wireless.git, thanks.

37fc9ad1617a wifi: mt76: mt7996: select CONFIG_RELAY

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221215163133.4152299-1-arnd@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


