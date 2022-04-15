Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98872C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 10:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i2Hf5GjuRhznkdh3o4SaD9L6DmPqblEmO6KGQiXrfrQ=; b=NlMfqALtQo8bfU
	m71Hi3GCtEDOElpdlnHgJz2ShVbz643OSHVyGj+ewmQwar5TIv4vr3tO3EzV4uSrnUBBTdqbZjFqq
	p9uurwOZJMiIEzr8/Ejf4yv3Bc63kgtYlTYyNPW/tcNJe2nmxATF040b4q6IWN0Uq2EJ2Ss8sPAe5
	hGA6IF48mO3eUjuyVbISzgsqQy0RGbzwF5nwooR769FCD1pgIfxVTU4QhQyEn+FwvbFqZ4w4QXSid
	6M88Bw6FnTIipfwk5RICR1GjRWdipYBdfT1hl9ynad7LrRm/LcUoLP+4UdWDKnX2biyRX4lVGifDq
	xAivFTGk2x88L5yZQTLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfJG6-009fB7-NO; Fri, 15 Apr 2022 10:32:58 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfJFs-009f4s-GU; Fri, 15 Apr 2022 10:32:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 528AC1F47E6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650018763;
 bh=o3B0CJoa73EGtPrdPd8q/dHzTCP0JQ19PFMotaGHh2Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YqgqgY818zgL/yZrmonREhd9kAKts0WzHOubFJUu6GJkIk56jwELmHZwGW5VYtRyN
 vk20W1Xz3jFZrrMXKKDlutccF5JiELA6uk2VtqhTeWAQpcHMlooYZnKuqHZdAKu0aI
 roIEvtF1YVIzj0EkC02uolZ1tMmxsSmUEZoUgr2MFmt0PpA5HONPJ3JFmBkrhUnrjx
 iLqX24u0djPJhCFfXhV2wg6BbnUdVRpjxLePK9fu95GRGHWrZu2cTd6k4ILRikTXTO
 fy3juF6JCaeYmbnKptYT/3SK+dqUws7nHZhwuaHwAmkv0KbVPW5IIUgWZVfCCi5b+W
 GMe2ZE3qfHHUw==
Message-ID: <387ede3f-20be-cb84-f343-f68c75eaf5fd@collabora.com>
Date: Fri, 15 Apr 2022 12:32:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v19 10/10] soc: mediatek: remove DDP_DOMPONENT_DITHER enum
Content-Language: en-US
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: CK Hu <ck.hu@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220415083911.5186-1-jason-jh.lin@mediatek.com>
 <20220415083911.5186-11-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220415083911.5186-11-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_033244_780635_73CEA45A 
X-CRM114-Status: UNSURE (   7.07  )
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

Il 15/04/22 10:39, jason-jh.lin ha scritto:
> After mmsys and drm change DITHER enum to DDP_COMPONENT_DITHER0,
> mmsys header can remove the useless DDP_COMPONENT_DITHER enum.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>

Can you please fix the commit title with:
soc: mediatek: remove DDP_DOMPONENT_DITHER from enum

that "from" is important, as you're not removing *an enum*, but *from an enum*.

After that:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Thanks!
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
