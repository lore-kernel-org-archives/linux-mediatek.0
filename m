Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 755DEC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 11:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UuFCwnffzd+quhbEToG3XVCxB8jZD6Ldkr6gzvrOkqI=; b=cVI1x8yeO13hASzN6060FRHBdW
	86PYgPb/NAd22iAKnYweDK4FqNXfgyXd3Ra+rLevldgOmv93+26H/p70DGljmd1/jHQBs8XWnZcR0
	M/50Pfsmkg+c/s41EwhPMdbTbe7LriO2C78SaHnyEl4PvW64AzQi668r9LJL3hzw2or//Eiq7YKDq
	iODc1zSMDh4vZHdGUnVZFxd9Vmk0kqT+z9SMOTxAZboVynZGLvxX7trGJzTVM8P/amkkfh3PQGaA9
	zOCAhmqx+j7DERNho8IpxsTOaM/agaoPoY6m/PY4EdvOc+hnQ4rS+63Aa0wrqayaAXNt6v4Wdxk9f
	osebZHXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7F0X-00Fy3w-6a; Tue, 11 Jan 2022 11:08:05 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7EyX-00FxAF-AK; Tue, 11 Jan 2022 11:06:02 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 776741F43F66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641899160;
 bh=HrxQbDIhsm2WebOMeG8xU6zQC8Wui+ntZtYG/xinG4Q=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mcIZ0zhem1thW68bzJExY3avXN7EdpgHkyph9+8oWf9bj/33fOSbjg4qd3H/M6fRs
 nc8RFw18/KAN9dPVSFtGuaJBwxgLe9IyXJTi9o5fbyf4XTN4qXo80wNOMfGac9dOMD
 KOKw9B/JPZ+F6cQfey1fAOpAruW51SbNuRQL03Tzi4U9hyOCkc4tGW7Y3GQ1rCe534
 U6MUszzl6/7RFG5bG3EItCHKc/EWd7yHe9TQt2UkzM1/xbIms7aAGD9tfCCEYQrXOn
 5UM64bnOr5t69Jtci7NR+W+3GACpnbVfuF9BvxwZ8B30bNMpZjvuPDxTIKzTd284l2
 ynLAwX/H23wKw==
Subject: Re: [PATCH v2] drm/mediatek: mtk_dsi: Avoid EPROBE_DEFER loop with
 external bridge
To: CK Hu <ck.hu@mediatek.com>, dri-devel@lists.freedesktop.org
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 matthias.bgg@gmail.com, kernel@collabora.com, andrzej.hajda@intel.com
References: <20220104095954.10313-1-angelogioacchino.delregno@collabora.com>
 <c0279078032bae61e6c1d70be74d1fb8c528083f.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <8a87c97e-fd58-bc73-44a6-0055b86cd7ea@collabora.com>
Date: Tue, 11 Jan 2022 12:05:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c0279078032bae61e6c1d70be74d1fb8c528083f.camel@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_030601_555733_257236F8 
X-CRM114-Status: GOOD (  21.31  )
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

Il 06/01/22 06:22, CK Hu ha scritto:
> Hi, Angelo:
> 
> On Tue, 2022-01-04 at 10:59 +0100, AngeloGioacchino Del Regno wrote:
>> DRM bridge drivers are now attaching their DSI device at probe time,
>> which requires us to register our DSI host in order to let the bridge
>> to probe: this recently started producing an endless -EPROBE_DEFER
>> loop on some machines that are using external bridges, like the
>> parade-ps8640, found on the ACER Chromebook R13.
>>
>> Now that the DSI hosts/devices probe sequence is documented, we can
>> do adjustments to the mtk_dsi driver as to both fix now and make sure
>> to avoid this situation in the future: for this, following what is
>> documented in drm_bridge.c, move the mtk_dsi component_add() to the
>> mtk_dsi_ops.attach callback and delete it in the detach callback;
>> keeping in mind that we are registering a drm_bridge for our DSI,
>> which is only used/attached if the DSI Host is bound, it wouldn't
>> make sense to keep adding our bridge at probe time (as it would
>> be useless to have it if mtk_dsi_ops.attach() fails!), so also move
>> that one to the dsi host attach function (and remove it in detach).
> 
> This patch looks good to me, but please add 'Fixes' tag to note to
> which patch this patch want to fix.
> 
> Regards,
> CK
> 

Hello,
unfortunately I couldn't find a valid commit for a Fixes tag. This
started being an issue at some point, when the DRM API was changed to
adhere to the documented probe sequence: the MediaTek DSI driver was
not the only one that got broken/affected by these changes.

If you have any advice on which commit should be tagged, I'm open for
any kind of suggestion.

Thanks,
- Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
