Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06815C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 05:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GHqgpi49F525hGNgrGw5jxJA5z8262KOfovIPeXSDkE=; b=5Gj0fv7iKPSGHquoDKsEQlpWgY
	PjDV+2rVKGx+ViZeFnNA15gaZIska9OmrHicKBoy91senm5Z2OYFaI1380JdcDDzHy/B581PO5kDn
	BJwZPPHiiFGjYgJkI7z/R8gadXGkR19xTm5IeLWKZrLO07N3lJ9BoEVamwcsz8QuYGcm/86ezlCGP
	I0ILsC470IWe35DNNXv8YLhBxzmiKIKTjPZ/dA5TYNN97T6+oL+b/dpJsSuN898hr8ZhKOpvdDsU9
	aQaKUXMBR/Fv+1A2NNsKpdc+CVBrQnH/qjXoLbk6L7HsJnTuwlKqeJDI9/53h+RwLeRdzN+FJTM2e
	9T4VLokQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq6dH-008Len-Mt; Wed, 02 Nov 2022 05:49:47 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq6d6-008Laf-4v; Wed, 02 Nov 2022 05:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From
	:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=GHqgpi49F525hGNgrGw5jxJA5z8262KOfovIPeXSDkE=; b=Pw+1ZCBBpSQGbjl9omMRX/HDUR
	PISJ5gZNcun2rUbxtx6gB/F8dAH3yS6U4VFO8xVZ1UdDVMP3HuAG24vDkQMDcXwb23pWdGHgLWIVz
	jkA/6RKt2AEhsyEI49a3q14XV+20onwacw8H7liW5/I+Lveccz09crjogPH4/BCTx110=;
Received: from p200300daa71950003c313de20777bbcd.dip0.t-ipconnect.de ([2003:da:a719:5000:3c31:3de2:777:bbcd] helo=nf.local)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1oq6cl-00Gq2Q-Rs; Wed, 02 Nov 2022 06:49:15 +0100
Message-ID: <770dd173-41b8-80f7-7c78-40319734cfbf@nbd.name>
Date: Wed, 2 Nov 2022 06:49:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>, Daniel Golle <daniel@makrotopia.org>
Cc: John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <Y2G9ANkdaaENNnOd@makrotopia.org> <Y2G/CaPrTVsYeGWB@lunn.ch>
 <Y2HBzEdmiKK9IPFK@makrotopia.org> <Y2HHOSaYQGAhWL/E@lunn.ch>
From: Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH v3] net: ethernet: mediatek: ppe: add support for flow
 accounting
In-Reply-To: <Y2HHOSaYQGAhWL/E@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221101_224936_295677_3EB08E19 
X-CRM114-Status: GOOD (  25.47  )
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

On 02.11.22 02:26, Andrew Lunn wrote:
> On Wed, Nov 02, 2022 at 01:03:08AM +0000, Daniel Golle wrote:
>> Hi Andrew,
>> 
>> On Wed, Nov 02, 2022 at 01:51:21AM +0100, Andrew Lunn wrote:
>> > On Wed, Nov 02, 2022 at 12:42:40AM +0000, Daniel Golle wrote:
>> > > The PPE units found in MT7622 and newer support packet and byte
>> > > accounting of hw-offloaded flows. Add support for reading those
>> > > counters as found in MediaTek's SDK[1].
>> > > 
>> > > [1]: https://git01.mediatek.com/plugins/gitiles/openwrt/feeds/mtk-openwrt-feeds/+/bc6a6a375c800dc2b80e1a325a2c732d1737df92
>> > > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
>> > 
>> > Sorry, but NACK.
>> > 
>> > You have not explained why doing this correctly via ethtool -S cannot
>> > be done. debugfs is a vendor crap way of doing this.
>> 
>> The debugfs interface is pre-existing and **in addition** to the
>> standard Linux interfaces which are also provided. It is true that
>> the debugfs interface in this case doesn't provide much additional
>> value apart from having the counter listed next to the hardware-
>> specific hashtable keys. As the debugfs interface for now aims to
>> be as complete as possible, naturally there is some redundance of
>> things which can also be accessed using other (standard) interfaces.
> 
> debugfs is by definition unstable. It is not ABI. Anything using it is
> expected to break in the near future when it changes its layout. It is
> also totally option, you cannot expect it to be mounted.
> 
> I hope you don't have any user space code using it.
> 
> Maybe i should submit a patch which just for the fun of it rearranged
> the order in debugfs and change the file name?

I believe that OpenWrt is still the main user of the PPE offloading 
code, since most vendors of devices with these SoC still use different 
out-of-tree implementations.
OpenWrt does not ship or contain any user space code that relies on 
these debugfs files.

Whenever I'm debugging PPE related issues, I rely heavily on the debugfs 
API, so keeping it as complete as possible is important to me as well.

Aside from that, exposing per-flow statistics (which is what this patch 
does) via ethtool -S API makes no sense to me at all. I'm not aware of 
any other offload capable driver that does this.

- Felix

