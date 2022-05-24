Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0301FC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 10:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3NJo21atIzQY9i0lpIYKLWY0B28IqpVyDkPya3yvYNE=; b=NkojTfwImVkOxO
	W8dXyYmFDC/SkXw/YOlH3fZvAGZ+FvS7AIaJqOm60C9W/+Pq9Gg4ej5U6ygm2REXU9bdcjGQVX/vY
	GX0+wN//LVL9z/IXsE3cn/rJD7CJDbaCq8oT08O02pcnzs5WSsoVVZbqgt7gK6O28l/y1t7geWUsE
	m648L+Zi8O/o2wsdnQu79uA+hm7kTAvJYpSz6T6ddwJte0N2WBAJLLVvuRwF4ALKAYDl5zv0lIq4Y
	kOzQvY+vdyKfy9/ngNZAkT0uKStx7gC0mZ1rWXsd0REP4MLRaL+DeqJZfekolygMVqVn9339/x8wt
	hRO0XMWKVO1WhR+L+D/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntRwP-007exs-0O; Tue, 24 May 2022 10:39:05 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntRvP-007eXL-Gx; Tue, 24 May 2022 10:38:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D37631F42A6B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653388682;
 bh=kAIOsWqAMnO77xueu3Jw6gGhUwicsViTsQBfZcFuvfs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EhUmzDLt6WDvpAqb5EoHZudGltwo6RmNjLHv4rh3UaVC471tvIHAk82ala1QPJl99
 xiSAKZuUauXTZpDGcHpXBB+zHXy/J44Q6vVUfMmo4OSxHqEFDCzC044JpOYku6f1sD
 +lLQgGimgCA3B5OPv9ry5dhNGjvwVxjEZxn7v4ufcMBTH2A87yqjblnZrKzLK1LMIQ
 XRk3/+O+IiauYLSBowNKvl4mQCCpT6aJFHmrfMaL34CLciLXQgphyp5RLTOANxtHXl
 uBLpXyoHIF75EPNqToXQjColYdiaNmBya3lbmq6w+oLokegoTlKfXRYpnk+9clenan
 96rqLBFKEBwog==
Message-ID: <d97f0fd1-bbaf-331c-6b51-fc72648fab43@collabora.com>
Date: Tue, 24 May 2022 12:37:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/4] dt-bindings: usb: mtk-xhci: add support 'resets'
 property
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>
References: <20220523090449.14430-1-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220523090449.14430-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_033803_734569_34B585FA 
X-CRM114-Status: UNSURE (   6.40  )
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

Il 23/05/22 11:04, Chunfeng Yun ha scritto:
> Add 'resets' property to support IP reset usually by top pericfg.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
