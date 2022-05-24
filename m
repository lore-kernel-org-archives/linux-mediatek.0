Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E087AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 10:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tjEc8/mMERXwyMFF1PMkWFMUFKZQ0HnDwGOFtrLPrWw=; b=FPZdxihcmircxc
	PNyuf93GtrowXQ8uTLWXfNWrMvj8VrT5zPnFoSTM6lq0Ks0MNsg3sAM2EldoG38J5T9Ju/0HmHkkR
	hXmpfuTyQyQ50TGsOhkw44mrOF0VDfVUikH5xYl2E7HCemiuR2DVMV35D1LQZhiuHwAeEft6cpB/Y
	V3fLQ1zhs+/Vbd3Wzd6EZQZKm1EphcNRnjE3iUpZYxNh5Lb/bLPTBENG1RQk07cTW1YnQDQBs76JM
	2q7JiCBYi+IsobuUrN3A9XDu/QvGS66VOILAA+QplRjCEujOTkQmYJwsSnTtKFIpR/58RhoKL6kvo
	86PJ8BdEoOofi+fCqckg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntRvq-007egb-7p; Tue, 24 May 2022 10:38:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntRvO-007eWi-He; Tue, 24 May 2022 10:38:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 4769A1F42A2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653388679;
 bh=kAIOsWqAMnO77xueu3Jw6gGhUwicsViTsQBfZcFuvfs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iR4swGpiPR41BNToRdQTFQQNWsQP+4TUqjPzbbjmKohIoLg4DoMiT1BjV2qz8wXZY
 07geHSacIlAcrmurYqy2S4cNEBLczjFIcNJAUzmWMdMR9abvHYwU6d1x0o8q4cNXtQ
 g/x43gcAADMAE36MTXkm9DImhvNAkcjGSsG99k8RIt+PMjOUNr4Bg0snkPDrUZ+h0Q
 DhX0IxwtBAR5srN/RjM8eyRqnXLa4UWrjxAuj1RQFuvjXAiivOqGoezwaxt3GpQKld
 oE14SI7ExuY4tBmQDR8i5o15nLi7dsHyCNh6FBl/gDXWfzz4PetwoxJKpg/usypUbe
 X7Az98gT+tEXw==
Message-ID: <1bd4f795-ded5-13ee-91cd-295b05d7c05a@collabora.com>
Date: Tue, 24 May 2022 12:37:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/4] dt-bindings: usb: mtu3: add support 'resets' property
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
 <20220523090449.14430-2-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220523090449.14430-2-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_033802_862272_1A015B78 
X-CRM114-Status: UNSURE (   6.41  )
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
