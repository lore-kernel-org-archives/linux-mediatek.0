Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B61CD6E57
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2026 14:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6kW6ptgyg5H5Ykwdbp8DQZ2euT25CNIXLSKPhd7nzg4=; b=wY9NS9OHb8kX+t4DA3lqfFjyLd
	0TAI6450dXy6BtQ51ju3Rki2IAyPtfHIbQeaSfHMP3kjJGwPvcsFy+UoBgfCMJ+dqZEKWsN0GHpIp
	u3+oIwNhfWxrrVR/KeCbBXH/Z9KzLsVLP6EOdibCdC+eXRHGjulwTUf+w14j7hbmXLcAeKGehCaPl
	3P2+oMWkse0+ltX9DfzdbYxVL9wxSnWrbrkzOIElP0KK+stx3ExQzyoXMQWEQmWwK14vKRK8vENVu
	F2hAEMdzzw+x75TFlitDOHiNQ95ReMu0EREY+GkcMknaBMy7kSM+hh6JI1fvLE3gKqvlRIhWcspGq
	AOUnmx6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmwK-0000000FIv1-11gO;
	Wed, 03 Jun 2026 14:51:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmwH-0000000FIue-21Yy
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jun 2026 14:51:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 035CD40BC5;
	Wed,  3 Jun 2026 14:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D77351F00893;
	Wed,  3 Jun 2026 14:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780498283;
	bh=6kW6ptgyg5H5Ykwdbp8DQZ2euT25CNIXLSKPhd7nzg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XSICvxH3AvCsXhr/oIpKcbA9WVCvTjdM2xMNi6kuE4XSIKILLjgJxn03F+c+KnjC8
	 zW1lv+i+veWu0Hgug8Sa7//B6wAUVKRoTuQ9mFVU7oakoWOqni79uRJHYDe4Z5abcv
	 H3lcm3LKnHW56YdyA37zMDBJQTV3PY6+7rTrov5eN4X56dPcI9BoI/7Y7lhRkfO4n+
	 K6OfPoqo0Lo+Dvs9FZvQxRUdVj67cDyGUJ0XfI1zGPc6oBDQm3Z+g7hZpGL3m17/VC
	 yTBPuqe480+6J8vEEVm4NIk6Dbb3cOD5Ua5brzLIbJRluMPd/MwAKCm21YY7fp6ooT
	 6vTPH35peH0Nw==
Received: from johan by xi.lan with local (Exim 4.99.3)
	(envelope-from <johan@kernel.org>)
	id 1wUmwD-0000000AYYj-2wiC;
	Wed, 03 Jun 2026 16:51:21 +0200
Date: Wed, 3 Jun 2026 16:51:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jakub Kicinski <kuba@kernel.org>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND 0/5] wifi: mediatek: drop redundant USB device
 references
Message-ID: <aiA_aYcTPizOPhtT@hovoldconsulting.com>
References: <20260430083335.215239-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260430083335.215239-1-johan@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_075125_542187_CA7D1517 
X-CRM114-Status: GOOD (  13.16  )
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

On Thu, Apr 30, 2026 at 10:33:30AM +0200, Johan Hovold wrote:
> [ This is a resend (with trimmed CC) of the five Mediatek patches which
>   still haven't been picked up from [1]. ]
> 
> Driver core holds a reference to the USB interface and its parent USB
> device while the interface is bound to a driver and there is no need to
> take additional references unless the structures are needed after
> disconnect.
> 
> Drop redundant device references to reduce cargo culting, make it easier
> to spot drivers where an extra reference is needed, and reduce the risk
> of memory leaks when drivers fail to release them.

> [1] https://lore.kernel.org/all/20260306085144.12064-1-johan@kernel.org/
> 
> 
> Johan Hovold (5):
>   wifi: mt76: drop redundant device reference
>   wifi: mt76x0u: drop redundant device reference
>   wifi: mt76x2u: drop redundant device reference
>   wifi: mt76: mt792xu: drop redundant device reference
>   wifi: mt7601u: drop redundant device reference

It's now been three months since these were first posted.

Can someone please pick them up?

Johan

