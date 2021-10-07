Return-Path: <SRS0=EI02=O3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D82C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 22:55:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D526661350
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Oct 2021 22:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D526661350
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=systemli.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gHI2LE0Smm47PoFc5J6+UMa41vTdwrpB86EIIWOPfoU=; b=HMNVEoWy+Glo9G
	+vCebUb0QNvJ3W4h6Q5HUUM4uTLKSY/i4GxvSri3Gjwr2+OrYztoNr3w2lTiz+n+wX5CRHbhBSGR/
	PHJA8g1Ht8Gu1kVWdeOyF2xxRqZUQIi/wjeRHK8FJ4o+oQIBR0RXtVdgcUvjz2qJjmV7KQz8LX3d4
	mXpzHdgRCNJwiIzp/osAyLwjVaABvIzreLuC3AadzH3Ia6RdpGgsp4nCgNKtctDHoCBgRN1I0QS43
	tqfHafBl6CW9jntWjGUP1oIgkDkq0EztqrDrci1ICzhkpVESzLQJZQCxVS8ztMxz83kc9pfndoZVw
	5cp25GhvDi3wChKyAGmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYcIK-000v4u-5a; Thu, 07 Oct 2021 22:55:20 +0000
Received: from mail1.systemli.org ([2a00:c38:11e:ffff::a032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYcI7-000v3H-Im; Thu, 07 Oct 2021 22:55:09 +0000
Message-ID: <9de61dcc-cf6e-aeed-a077-756b697fb534@systemli.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=systemli.org;
 s=default; t=1633647302;
 bh=e4EzXYaT64uH4mIE+8y/VnHFOhPneiui80T0S65fW+s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cxHuFn3uc0Nvx6xxmiT+pzHunfl5EblnogR2cqRVVzVVgS+JAD7kzkwmhdS2c3/19
 +G0+bzqWFSEqE16ro2C6BvIm0VXufwPaaflTk9sXq6qdrgLvjpxftaBl+fCT051N8/
 R/OdXtzRWctDzvtmuF+vcs0MrrkEZpNmHZ4fVE/mfD12VvwtI0qK7C+ybzQCWEdvDG
 TthE2CELJ3tDXa/QtGk/GVTKySXHWyQzGwcEWqGnVfOL831qLOnMdkzUHJamZD/fau
 8AYW76QyHKAQxVZZofAG3jqxu73qlRUHh8vyjQ3gyDEuq4FiTDDiv7p9xQC18r32bW
 Gj8zccSxfzeEQ==
Date: Fri, 8 Oct 2021 00:54:57 +0200
MIME-Version: 1.0
Subject: Re: [RFC v1] mt76: mt7615: mt7622: fix adhoc and ibss mode
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>
Cc: nbd@nbd.name, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, sean.wang@mediatek.com, shayne.chen@mediatek.com,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>
References: <20211007212323.1223602-1-vincent@systemli.org>
 <YV92Wjo+3dZ49DL6@makrotopia.org>
From: Nick <vincent@systemli.org>
In-Reply-To: <YV92Wjo+3dZ49DL6@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_155507_813663_15423C01 
X-CRM114-Status: UNSURE (   6.91  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 10/8/21 00:36, Daniel Golle wrote:
> On Thu, Oct 07, 2021 at 11:23:23PM +0200, Nick Hainke wrote:
>> Subject: [RFC v1] mt76: mt7615: mt7622: fix adhoc and ibss mode
> Ad-Hoc and IBSS mode are synonyms.
> What probably meant to write 'fix adhoc and mesh mode', right?
>
Yes. Or maybe even better "fix adhoc and meshpoint'. :)
I will update.

Bests
Nick

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
