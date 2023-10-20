Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56197C004C0
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Oct 2023 08:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rtf53FyRtxZSyhw4blTkrbmiepngXr4uy1TVaIBNFQI=; b=AJiA8SLOrEc0+SQ5M1q6GwTTtb
	XinaJJhdN6q7QU2vAybve7T96gCkGFdHU8zewPqcpw+T5A+xFjSh6Um9oli9OkldG1nqWprodlCUp
	bO/0KTaT5zmJ8gFKLr24yBOBfmCX/odBTLdgRA+Fz8a6fM5wg/rdrFIS/psDbxp93uT+91kbJZKem
	gGtpWzncLCwbrMAp5TyFXwO10LBZ/rhIkH1Mxxit1a+djTf/JOdRQC1Z3GqNba5bxOWARK7BFtKEX
	nfxXTm9gahVHw6a9vPZ+fP8HaMFh1x15eP5r2FCDLEa09JR7g/dXsf8r/G2r5FiSwvViKPFQmXXn7
	/T/qGzew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtkjz-001Xp0-0p;
	Fri, 20 Oct 2023 08:20:19 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtkjv-001XnH-1H;
	Fri, 20 Oct 2023 08:20:16 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 60F966607352;
	Fri, 20 Oct 2023 09:20:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697790014;
	bh=RSQ5/DMeBnjdqm4h5GEDNo41Y8NPcwqWmF2hl3CzU4Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LTr/BwXEXjwM28l/WBLy3g4Y6rSO7GmucFVzcI6oDTvGsGkpsDiWKWtxsyA/UVPgO
	 godKZqiaTA8xWdepYuPjuEOg1rJ8pG7MrICvM7PLNO8wrymvthXDzPCKoWtZj39ts4
	 XxNQez3PUaVRWnI1iMFG6nJp7yYgnckhziuZ8yAJ5J9SHiW2m6z1cV0f7eDMT2IZ/i
	 56Ykk4SQwQoFQHUAxA2Ce2pGKQxe5iIOcGD1X96lNDl+3daRKbujVdr+ZmJ8f/SQ+C
	 43fnemdqYE1JnQRm2rxKJsly8AdjEh+0TT9H3iXfIvL4Hv5isgvxMUVb3h1i1Mg3km
	 Vr7OwHYB0r7Xw==
Message-ID: <8b799079-fd98-46ba-a2cd-04ecf0c0df1d@collabora.com>
Date: Fri, 20 Oct 2023 10:20:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: mtk-jpeg: Fix use after free bug due to error path
 handling in mtk_jpeg_dec_device_run
Content-Language: en-US
To: Zheng Wang <zyytlz.wz@163.com>, dmitry.osipenko@collabora.com
Cc: Kyrie.Wu@mediatek.com, bin.liu@mediatek.com, mchehab@kernel.org,
 matthias.bgg@gmail.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Irui.Wang@mediatek.com,
 security@kernel.org, hackerzheng666@gmail.com, 1395428693sheep@gmail.com,
 alex000young@gmail.com, amergnat@baylibre.com, wenst@chromium.org,
 stable@vger.kernel.org
References: <20231020040732.2499269-1-zyytlz.wz@163.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231020040732.2499269-1-zyytlz.wz@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_012015_564421_5CFBCA0A 
X-CRM114-Status: GOOD (  16.66  )
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

Il 20/10/23 06:07, Zheng Wang ha scritto:
> In mtk_jpeg_probe, &jpeg->job_timeout_work is bound with
> mtk_jpeg_job_timeout_work.
> 
> In mtk_jpeg_dec_device_run, if error happens in
> mtk_jpeg_set_dec_dst, it will finally start the worker while
> mark the job as finished by invoking v4l2_m2m_job_finish.
> 
> There are two methods to trigger the bug. If we remove the
> module, it which will call mtk_jpeg_remove to make cleanup.
> The possible sequence is as follows, which will cause a
> use-after-free bug.
> 
> CPU0                  CPU1
> mtk_jpeg_dec_...    |
>    start worker	    |
>                      |mtk_jpeg_job_timeout_work
> mtk_jpeg_remove     |
>    v4l2_m2m_release  |
>      kfree(m2m_dev); |
>                      |
>                      | v4l2_m2m_get_curr_priv
>                      |   m2m_dev->curr_ctx //use
> 
> If we close the file descriptor, which will call mtk_jpeg_release,
> it will have a similar sequence.
> 
> Fix this bug by start timeout worker only if started jpegdec worker
> successfully so the v4l2_m2m_job_finish will only be called on
> either mtk_jpeg_job_timeout_work or mtk_jpeg_dec_device_run.
> 
> This patch also reverts commit c677d7ae8314
> ("media: mtk-jpeg: Fix use after free bug due to uncanceled work")
> for this patch also fixed the use-after-free bug mentioned before.
> Before mtk_jpeg_remove is invoked, mtk_jpeg_release must be invoked
> to close opened files. And it will call v4l2_m2m_cancel_job to wait
> for the timeout worker finished so the canceling in mtk_jpeg_remove
> is unnecessary.
> 
> Fixes: b2f0d2724ba4 ("[media] vcodec: mediatek: Add Mediatek JPEG Decoder Driver")
> Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



