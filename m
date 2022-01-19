Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CA9C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 09:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/79wC92oPGe//CeKSolCIykC+Z3B+CCRSQqe+nHO+2U=; b=LNJdZEXB1KsAfFNCYHV8JzLa1L
	9fdQykeWl0rY/YJ24vlLynvRrCzY4KuznB/T2p0Akd6F13Cdb0bPTiO/24dBvCmnd72izvG1XjovG
	8D+6btBf0TXpkw9saoP1N9mFm/ldngqtAZujewR3TXe1FwKTDPH19i/ilap67NGwZ3BM6aOjALDwU
	o754KaPd7LXR9HxlwwVWL8NfRlnUSb5Gna6imVe2y7wcplL8lNsqbIEwSZIMLG+R6kr3X3Zdsc6hk
	ekmY74MqM038fgmbVtfP4LkpHdYV2aABWl4knAseTnhXr62ZQ/DaXnNWz9dy/2c+QtzSmAi7ulP94
	e5K+ITYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA6zh-004TPW-W9; Wed, 19 Jan 2022 09:11:06 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA6zO-004TFn-Tb; Wed, 19 Jan 2022 09:10:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 093B71F44374
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642583445;
 bh=IY0TsKf1sV4zasOINyvJyjE0S/SNcaARx1RJpjSFlFk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QRaDfysl0CJDjDqq1df7gr4YfD5pUJ/xuCpGRFmr/VcaXM2I9N53LwquKHDYsicm9
 p0IsntKGidGnWVE05v4hmWB8wS9PTjB99UvQSIPgTPPy40CVnW0iH9YhJwCCa3DDKM
 NZA+cqg9iWPcNvyxUzggA3YC/HR8UICU3F5w1Z9U585EGhnX6yGOtRPH5H87a5EQto
 b9NmHyS42x44nQs1ffP9pSYOYqbAhEtIxBB6gvJC+4vKPOwvWtCAA8ty4Xy3r45Rwz
 6dV6zIaSzdsR7PIMUXo0MxYAfM7CiNBTgfZohfRLss/VCUib54N/Sq+2XZuRgpFxDw
 p7ri8JuH97fxw==
Subject: Re: [PATCH] media: platform: mtk-vcodec: Do not force /dev/videoX
 node number
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, mchehab@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.co.uk
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20220118150717.706074-1-benjamin.gaignard@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <72ac959b-ad5f-8f4e-38d1-3da9d9866290@collabora.com>
Date: Wed, 19 Jan 2022 10:10:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220118150717.706074-1-benjamin.gaignard@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_011047_189428_52C98FBE 
X-CRM114-Status: UNSURE (   9.52  )
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

Il 18/01/22 16:07, Benjamin Gaignard ha scritto:
> Let's v4l2 framework use a free /dev/videoX node for decode and encoder.
> For the decoder call video_register_device() before register the media
> controller device so the mapping between ins correctly done.
> Since the registering sequence has changed rework exiting errors case too.
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>

Hello Benjamin,
please add the following Fixes tags to this commit:

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder 
Driver")

Fixes: 4e855a6efa54 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Encoder 
Driver")

After that..

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
