Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD922ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 16:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDdem09UvQC6RtPh9eP/fPIosZi0f2DCCtFcOfni9E0=; b=nryWFW2JfKB8Qwc51LwTzYG/V+
	30nUlXhhy/DPp+dtJAi0CD2Cy0P2LsPKxxrjyOklMd1P5AFZGsbExEVIVSj07E/QxVePstsQGgTyR
	CV3eJKVXBhDEVBcJPef9/83dcAUtI9AA53Vqtf7WPtSgG0VsG523ArdfsCHW1gDySNVVhSq0j+FDP
	/o5htzV1xvLECSW4Skkcsow10TT+L93miLQXSkZ/RczGTLvq3R0fLiQMvUVCZqajDKdISDkAVdxGB
	ta3avoiyUlZQyRy260sDVGAGmfzw6qiO/LwIG6Fd3wir5HOaiw5VVf8cN/mKRLyD6rM6a9TjDF1C9
	u9DRNnmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooSKN-000w0g-Qu; Fri, 28 Oct 2022 16:35:27 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooSK8-000vrm-4y
	for linux-mediatek@lists.infradead.org; Fri, 28 Oct 2022 16:35:14 +0000
Received: by mail-lf1-x130.google.com with SMTP id f37so9131976lfv.8
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Oct 2022 09:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dDdem09UvQC6RtPh9eP/fPIosZi0f2DCCtFcOfni9E0=;
        b=iVRKB99bCuGg75YHK5Jin6eKXNVe9XeG9Wu8TuxvOpZO8X9g0HtdOKXe+lJnotbapy
         yY1d/TS43YunRmZBAdM4kiS1Sb8vvY1JzgsNRODuo9qg+niv7CXg1LdbK/MFiVHVTCVh
         uZZlAnEomqAMCPuV5LXMWtWwirMKSIYACBgbeq/QvJ2NTjC6iw3aocNENCpW3yfSF+VF
         h4Np4qcUKUFrsMntcE0udkLz1iH8nhF4d+Vl8ryBfkZ1woIlFqAplaVWyTnQlJUeIlwr
         w9vUx8zv8jyRRFHooTylzter5G7/0iRYvFvfCgrWmJ1KX4Ui/6vhhI2pxLyUISlF4kgT
         PF/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dDdem09UvQC6RtPh9eP/fPIosZi0f2DCCtFcOfni9E0=;
        b=PUMkAcYdQ+3jR5Wy5MwBerOzzYQGwPptqoSXVPxegsGoWi8vFd1FOJ8EUw/Z6MRgSn
         NGkYo963WJN4YY9Hn7XxSiNURlaWpBegH7bqQ5L2sXiQ1pAqWmZfzty8QVfjzAW7CGvr
         958vmgggq9cvk5AfXWDEQ3NUDGW7quN81avrY6eSp984h4rMBR3TsxxuMW5Yuog6ZAAf
         8pb/d6i7FohrdFJxp80SGOmnajOLUrEDIsutValWNlYQy2EV1zl3yKqwMAvMW1iCd0h4
         EBYrK1zjPfC6XrklCkYEsO6TPVNm48Yrtg6lT97vqSz4WXQbC3PiYpmNzyEqjUHC9YX1
         fGLQ==
X-Gm-Message-State: ACrzQf1BuvOA6Ryn9MN9hWGetJfmAb80LUXaqkxrGlKY+slNAYF2owBL
	K4LM++UT2rntf6omfhbRCER7DgRdjYTd2Lu1y8Ot
X-Google-Smtp-Source: AMsMyM4GCKg+Wc/lMbvqmo5qiLQjfqMXoXH+QadR3RXEfZMfTqJByvQ611ruQrIRULNKM67OA8DPiAstRGkRDG9JZno=
X-Received: by 2002:a05:6512:2616:b0:4a2:1723:cf40 with SMTP id
 bt22-20020a056512261600b004a21723cf40mr80364lfb.354.1666974906701; Fri, 28
 Oct 2022 09:35:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221028065533.23856-1-mark-pk.tsai@mediatek.com>
In-Reply-To: <20221028065533.23856-1-mark-pk.tsai@mediatek.com>
From: John Stultz <jstultz@google.com>
Date: Fri, 28 Oct 2022 09:34:55 -0700
Message-ID: <CANDhNCpWcfMfXKHU7rHSUXd8e0JcAnD+qJABWCs9rWTC_J3h6g@mail.gmail.com>
Subject: Re: [PATCH v3] dma-buf: cma_heap: Remove duplicated 'by' in comment
To: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Liam Mark <lmark@codeaurora.org>, 
	Laura Abbott <labbott@redhat.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, yj.chiang@mediatek.com, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_093512_215331_F167FEC6 
X-CRM114-Status: UNSURE (   7.36  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Oct 27, 2022 at 11:55 PM Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
>
> Remove duplicated 'by' from comment in cma_heap_allocate().
>
> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>

Thanks for sending this and going through a few iterations!

Acked-by: John Stultz <jstultz@google.com>

-john

