Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CA40C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Mar 2023 10:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MblS3wPiejH8wWKzPlRNHbipiWFCA8kFaj7hsvg8aIw=; b=Rx21RZUaWJxp3oFW0sB5TapUuP
	TdG/AO1Fs+ONtJv+4MXKMtajEBcxL4eCFUKvfRnyq1AqJnL8AaZJEs8TlKJ9hBYIclMx8vxj+CgFo
	LzQhMW9qi/XZFJlJbB1xDgCCGPS/zLRfnTQxe+xYcTlJLrBLMeSoQdI0n5SqtMTJl2HTs4Y2J2xoG
	cec6Ek/xTP7tqkhUeDD8WfrAUcvPMIYAWaweYw071QBDOdjB1iQ1R62m8lnGhw6oMLVk7ev8B1xu2
	Zdcg5/kqFh3kloTiiZmlDOCiBpWJJIOfyQCTM13uKaoOv/tclwEC6+8Z/QBUT+B/exh3LKh2yi/n3
	yOLzfmUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pc27R-009nBM-0E;
	Tue, 14 Mar 2023 10:43:01 +0000
Received: from ewsoutbound.kpnmail.nl ([195.121.94.186])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pc27M-009n8E-2b
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Mar 2023 10:42:59 +0000
X-KPN-MessageId: f4436f54-c254-11ed-be37-00505699b430
Received: from smtp.kpnmail.nl (unknown [10.31.155.7])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id f4436f54-c254-11ed-be37-00505699b430;
	Tue, 14 Mar 2023 11:42:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:from:to:subject:mime-version:date:message-id;
	bh=MblS3wPiejH8wWKzPlRNHbipiWFCA8kFaj7hsvg8aIw=;
	b=IC1Bek6tsLB+ZBUNcDl3p2uU4adHKFJTNwb/AKrs331rzK40Mv+EgCYHoIV0e1MNHxxRNVpKdOH1u
	 4fu5XN5lv+mLFusQyNzts9Ul1OSCejTm+DL3yNa3jm+QZHPySDS1h5Ck/lEINQUxl6QFNeLl71zcgk
	 bi7ykaaHDON3BrkiYGV2eFa+GZaMJMBHiIS3We+44p9xpkzwLCy/0NIxxx2phxbKzkK3XuWzE060H9
	 3M6iGSBP5aEEt2s6WULeFnfSNdDcmXrfTJjDdP8sh16nPPoLkukaSgxJaL3zkdlDCxUso3P540aHLa
	 bvLdn0oCfNbUDnoIV4Ti0A8uR+4N5fg==
X-KPN-MID: 33|FkStRVpM6778JWRbee5ORbKlr5uso33caDVGRFqX+YdM2ajMXig/EgK1pUqjMB2
 ZvpFy22o4lZ02rXeesS5Bkw==
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|b6x6ba6BbG6VwHaXfZoELLAJBsMWVu0BpjvVbFinw6bBbG9MWR/C5kVxOti2FHv
 KdyqhcYeHZREjXLMFQDHNlQ==
X-Originating-IP: 173.38.220.44
Received: from [10.47.77.214] (unknown [173.38.220.44])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id f52d4607-c254-11ed-a8eb-005056998788;
	Tue, 14 Mar 2023 11:42:49 +0100 (CET)
Message-ID: <cbf34cf1-e065-8136-8344-89ca1864f637@xs4all.nl>
Date: Tue, 14 Mar 2023 11:42:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC 2/4] media: videobuf2: Replace bufs array by a list
Content-Language: en-US
To: David Laight <David.Laight@ACULAB.COM>,
 'Laurent Pinchart' <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: "tfiga@chromium.org" <tfiga@chromium.org>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "ming.qian@nxp.com" <ming.qian@nxp.com>,
 "shijie.qin@nxp.com" <shijie.qin@nxp.com>,
 "eagle.zhou@nxp.com" <eagle.zhou@nxp.com>,
 "bin.liu@mediatek.com" <bin.liu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "tiffany.lin@mediatek.com" <tiffany.lin@mediatek.com>,
 "andrew-ct.chen@mediatek.com" <andrew-ct.chen@mediatek.com>,
 "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>,
 "stanimir.k.varbanov@gmail.com" <stanimir.k.varbanov@gmail.com>,
 "quic_vgarodia@quicinc.com" <quic_vgarodia@quicinc.com>,
 "agross@kernel.org" <agross@kernel.org>,
 "andersson@kernel.org" <andersson@kernel.org>,
 "konrad.dybcio@linaro.org" <konrad.dybcio@linaro.org>,
 "ezequiel@vanguardiasur.com.ar" <ezequiel@vanguardiasur.com.ar>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "daniel.almeida@collabora.com" <daniel.almeida@collabora.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "kernel@collabora.com" <kernel@collabora.com>
References: <20230313135916.862852-1-benjamin.gaignard@collabora.com>
 <20230313135916.862852-3-benjamin.gaignard@collabora.com>
 <20230313181155.GC22646@pendragon.ideasonboard.com>
 <86df05244d974416903e919d387a0a0b@AcuMS.aculab.com>
 <e704b505-86d8-c6f2-8546-adccdab72622@xs4all.nl>
 <dc04d48e34ed40e58f43badd001a81d0@AcuMS.aculab.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <dc04d48e34ed40e58f43badd001a81d0@AcuMS.aculab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_034257_406657_AD4AFA49 
X-CRM114-Status: GOOD (  14.99  )
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

Hi David,

On 3/14/23 11:11, David Laight wrote:
> From: Hans Verkuil
>> Sent: 14 March 2023 08:55
> ...
>> Why not start with a dynamically allocated array of 32 vb2_buffer pointers?
>> And keep doubling the size (reallocing) whenever more buffers are needed,
>> up to some maximum (1024 would be a good initial value for that, I think).
>> This max could be even a module option.
> 
> I don't know the typical uses (or the code at all).
> But it might be worth having a small array in the structure itself.
> Useful if there are typically always (say) less than 8 buffers.
> For larger sizes use the (IIRC) kmalloc_size() to find the actual
> size of the structure that will be allocate and set the array
> size appropriately.

The typical usage is that applications allocate N buffers with the
VIDIOC_REQBUFS ioctl, and in most cases that's all they use. The
current max is 32 buffers, so allocating that initially (usually
during probe()) will cover all current cases with a single one-time
kzalloc.

Only if the application wants to allocate more than 32 buffers will
there be a slight overhead.

Regards,

	Hans

> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)


