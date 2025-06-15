Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF47C71135
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Jun 2025 12:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Message-ID:References:In-Reply-To:
	Subject:To:From:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XRcdvBt0CthVJmnj/dbaqQtXhJV7sGdCW7ml88MPC1U=; b=On8+URKpAOd0UX
	rzZuPpX3WPjy8sshVx2jtONr/wqKu8Kam19sOeFJtBZs0HoNfE49DZ8c+c+uYVZ0vqEWFW9wlbyy7
	3lZ/19A0wVYzSuid9I9Me3Ki0406aAfufXsdoIYfxvKX99QFhGK0NrWr8lUoO5Ha0THzJ3vUWRh+5
	RydkyVcVYSJVzMpMVC22Z2e7OO5cWY7VaXxAJZqYX9mqzi3MEniW79REE+pSt3S0/BROgv8WPKMVJ
	6z8VOsm4cSRHdY+hk1JgZOEZj/v7XqB/cIDbrg995YWitk4BBQHn93dBtnMQNwcidVOrgV2O4HLts
	lFsiRR81M9zHdlXs/YhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQm6M-00000002TZm-1fYQ;
	Sun, 15 Jun 2025 12:04:42 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQm48-00000002TTl-0pxJ;
	Sun, 15 Jun 2025 12:02:25 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id D1E5F6028B;
	Sun, 15 Jun 2025 12:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1749988942;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XRcdvBt0CthVJmnj/dbaqQtXhJV7sGdCW7ml88MPC1U=;
	b=FlBhO5D2z9tg6W1gK4eedfxgObCDzADaUVoNpqI4mUbuJo2B9TDQMwJHp5qyUby+9IaLjC
	7CqRrCj/VLERiAuYikxrK8EwdtpC7gdJu+ZGVSZ+EsTQKM+CKTRd1KNvrH+aEqrbvr2AgO
	EwwRI18V5VA9KByMltAqfQujCGs6WMU=
Received: from webmail.hosting.de (unknown [134.0.26.148])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id EDB97100506;
	Sun, 15 Jun 2025 12:02:20 +0000 (UTC)
MIME-Version: 1.0
Date: Sun, 15 Jun 2025 14:02:20 +0200
From: "Frank Wunderlich (linux)" <linux@fw-web.de>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: Re: [PATCH v2] net: ethernet: mtk_eth_soc: support named IRQs
In-Reply-To: <aE6cyHC39IV27PcF@lore-desk>
References: <20250615084521.32329-1-linux@fw-web.de>
 <aE6K-d0ttAnBzcNg@lore-desk> <d4781d559e3f72b0bcde88e6b04ed8e5@fw-web.de>
 <aE6cyHC39IV27PcF@lore-desk>
Message-ID: <ed6cd7a2e489e89352322f77af1ddd89@fw-web.de>
X-Sender: linux@fw-web.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mail-ID: 982a129f-54e7-4806-9863-06e9150fd816
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_050224_407620_7F228BAA 
X-CRM114-Status: GOOD (  16.75  )
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
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, linux-mediatek@lists.infradead.org, Simon Horman <horms@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David
 S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 2025-06-15 12:13, schrieb Lorenzo Bianconi:
>> Am 2025-06-15 10:57, schrieb Lorenzo Bianconi:
>> > > From: Frank Wunderlich <frank-w@public-files.de>
>> > >
>> > Hi Frank,
>> >
>> > I guess my comments on v1 apply even in v2. Can you please take a look?
> 
> sure

:)

>> Am 2025-06-15 10:57, schrieb Lorenzo Bianconi:
>> > > From: Frank Wunderlich <frank-w@public-files.de>

> I am fine to have it in a separate patch but I would prefer to have 
> this patch
> in the same series, I think it is more clear.

I added changes for your and daniels comments to my repo (top 2 
commits):

https://github.com/frank-w/BPI-Router-Linux/commits/6.16-mt7988upstream/

i would squash daniels suggestions in this patch here (MAX without __ 
and fixed
value of 3 to use for the loop - i guess this was intended for this 
purpose) and
then the change for index in second patch.

>> > Same here, if you are not listing them in the device tree, you can
>> > remove them
>> > in the driver too (and adjust the code to keep the backward
>> > compatibility).

i plan to use named IRQs on mt7988 without the reserved ones (only rx+tx 
+ RSS IRQs),
and loading not index based.

>> afaik i have no SHARED_INT board (only mt7621, mt7628) so changing the
>> index-logic will require testing on such boards too.
> 
> I think the change will not heavily impact SHARED_INT devices.

I hope so ;)

> Regards,
> Lorenzo

regards Frank

