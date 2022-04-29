Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AE5C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 13:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QUhynuXJzMQFAgpvj5GjZfeNvC867hRhGxfjTijUFD4=; b=y4DIf6RHW7RsK5
	B1yXikDBhni7QeW00QeEBTfVArhkkAGTjYAb9dceZX06ALHX5fz7c6fPpl7QrqtZR7GJ64kgZ6TJX
	/afguUSO/vaKkORXwCqm+Q9ei7ytyAd/kCt4g+4HF7bthRmkvNQU+6L6Pi/2NYggGZ4Sdz2QYTAAp
	w6DfwCgJxBOAwFrb/Inig4873kBsWdjeyEEp8xqKuO3RT1cl0PmI5yrdM3OWA/MdNh5mXZMMWIvR+
	xw2k2V1cG5X2ntPZBcRtvucbMe1TWUvUhlOCnxOOkNajfN0Y8oNIFogc7rWqoFNfdaUVqofPHfSPX
	n9CA9bsTFhu0jaXAWCjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkQoh-00BOsY-Pe; Fri, 29 Apr 2022 13:37:51 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkQoW-00BOnf-5J; Fri, 29 Apr 2022 13:37:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 27DF61F46597
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651239454;
 bh=kcEQjWB3+aoh/KNYmS+gc/t6zz5Iohch35uok/tdZ2g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ebK2702xHh6jZr+XuacSG3T6K77O0e6jE4yrdtu4TG85TlKoWWfyhRSUooxkXDMXR
 0OoI3Ng05ua+RkKFNWUxH4AKEsV2ra3A4nupIfjQHulZQbrn6NeJ3nCemO0i8EO37n
 Zy4XpKKUqXxOTV8OlHIP6DfbqvUFKinAR4IbQvSyfDWJSguh8+h9IFwVR4AczojijI
 fHPfWMfaBjbACP1E9gfPgSRultAXHSnBqumARBke0iTzk2dgTcyd8nlMhywjJYwjXY
 90Lw1KN5skaMwO/WgwifwowJDIbGtdpeo4AnFoss0MfbjjpxdBGDAD+TB59o8vj/XP
 k4LE+kVxfrPkg==
Message-ID: <5f252726-3757-b063-d34f-c76beaa5d31b@collabora.com>
Date: Fri, 29 Apr 2022 15:37:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] rpmsg: mtk_rpmsg: Fix circular locking dependency
Content-Language: en-US
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: bjorn.andersson@linaro.org, matthias.bgg@gmail.com, pihsun@chromium.org,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
References: <20220114144737.375621-1-angelogioacchino.delregno@collabora.com>
 <20220428173148.GA2268704@p14s>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220428173148.GA2268704@p14s>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_063740_400793_6217B1B5 
X-CRM114-Status: GOOD (  22.25  )
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

Il 28/04/22 19:31, Mathieu Poirier ha scritto:
> On Fri, Jan 14, 2022 at 03:47:37PM +0100, AngeloGioacchino Del Regno wrote:
>> During execution of the worker that's used to register rpmsg devices
>> we are safely locking the channels mutex but, when creating a new
>> endpoint for such devices, we are registering a IPI on the SCP, which
>> then makes the SCP to trigger an interrupt, lock its own mutex and in
>> turn register more subdevices.
>> This creates a circular locking dependency situation, as the mtk_rpmsg
>> channels_lock will then depend on the SCP IPI lock.
>>
>> [   18.014514]  Possible unsafe locking scenario:
>> [   18.014515]        CPU0                    CPU1
>> [   18.014517]        ----                    ----
>> [   18.045467]   lock(&mtk_subdev->channels_lock);
>> [   18.045474]                                lock(&scp->ipi_desc[i].lock);
>> [   18.228399]                                lock(&mtk_subdev->channels_lock);
>> [   18.228405]   lock(&scp->ipi_desc[i].lock);
>> [   18.264405]
> 
> I finally understand the problem, something that would have been impossible
> without the pastebin you provided in your latest email.  Please add the content
> of that pastebin to the changelog and send another revision (checkpatch
> warnings can be ignored).
> 

Thanks for giving it another look... I'll add a cover letter with the contents
of the pastebin to avoid possible confusion for anyone looking at the patch.

>>
>> To solve this, simply unlock the channels_lock mutex before calling
>> mtk_rpmsg_register_device() and relock it right after, as safety is
>> still ensured by the locking mechanism that happens right after
>> through SCP.
> 
> The integrity of the subdev->channels list is guaranteed by relocking the
> mutex, I'm not sure what "through SCP" adds to the sentence.

I'll clarify the commit message.

> 
>> Notably, mtk_rpmsg_register_device() does not even require locking.
>>
> 
> I don't agree with the above sentence - if locking doesn't happen in
> mtk_rpmsg_create_device(), there can be two CPUs accessing the list at the same
> time.
> 

That's right, I have largely underestimated that for some reason, sorry about that.

Regards,
Angelo

> Thanks,
> Mathieu
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
