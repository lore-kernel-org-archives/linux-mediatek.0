Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E120EC6FD20
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 15:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4XComTE4i6SDGb8Nd12lKuqwC4Bpv8edDFxbst2By0=; b=zTGfabW/vbth43qjseoF6XOlB6
	ch0okDCa6KDz0jx/TGJj2P8IvBBLJPOzPOmhdNmub8GSIWWAZXSRsMvqXD2EurCfK/4fPZkghrgA8
	j2Xrw3Hp5sRiPNNMeYKa+bm/D7vNvaiaqbuLy2aOol4HZtA+TQ2aTrLBb5LU0P1OBLvZkMUU54zYv
	O6qtkkESGl+GS8w6cj2IudY7MxUYzc+8AbZPdPMyiB2YnxHOKrCsefc6KePESVk622YMVZnA5lmxM
	jGGTs3sschyeDpemk4dHs5VhMiTmB5yy0nbfUTFSoCra9D2IyMJ3tOOp9RImTcM/pR0jjeJRjOdLq
	o0YwMSJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfjBO-004owM-21;
	Fri, 24 Mar 2023 15:18:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfjBK-004oub-2G;
	Fri, 24 Mar 2023 15:18:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 32CE3B824F3;
	Fri, 24 Mar 2023 15:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6113C433D2;
	Fri, 24 Mar 2023 15:18:10 +0000 (UTC)
Message-ID: <68ba7b3f-57f5-3969-5036-2c8d08273548@xs4all.nl>
Date: Fri, 24 Mar 2023 16:18:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC 2/4] media: videobuf2: Replace bufs array by a list
Content-Language: en-US
To: Nicolas Dufresne <nicolas@ndufresne.ca>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: David Laight <David.Laight@ACULAB.COM>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 "tfiga@chromium.org" <tfiga@chromium.org>,
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
 <cbf34cf1-e065-8136-8344-89ca1864f637@xs4all.nl>
 <20230319233358.GD20234@pendragon.ideasonboard.com>
 <f085aa9225c573df906bdc7ff032a8fd591b18b3.camel@ndufresne.ca>
 <20230322150153.GO20234@pendragon.ideasonboard.com>
 <2d6480e36ce061a63440d1e11d52b02e57ba746d.camel@ndufresne.ca>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <2d6480e36ce061a63440d1e11d52b02e57ba746d.camel@ndufresne.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_081819_052129_2EA3AEAF 
X-CRM114-Status: GOOD (  21.96  )
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

On 24/03/2023 16:14, Nicolas Dufresne wrote:
> Le mercredi 22 mars 2023 à 17:01 +0200, Laurent Pinchart a écrit :
>> On Wed, Mar 22, 2023 at 10:50:52AM -0400, Nicolas Dufresne wrote:
>>> Hi Laurent,
>>>
>>> Le lundi 20 mars 2023 à 01:33 +0200, Laurent Pinchart a écrit :
>>>>> The typical usage is that applications allocate N buffers with the
>>>>> VIDIOC_REQBUFS ioctl, and in most cases that's all they use.
>>>>
>>>> Note that once we get DELETE_BUF (or DELETE_BUFS) support I'd like to
>>>> encourage applications to use the new API, and deprecate REQBUFS
>>>> (dropping it isn't on my radar, as it would take forever before no
>>>> userspace uses it anymore).
>>>
>>> I was wondering if you can extend on this. I'm worried the count semantic might
>>> prevent emulating it over create_bufs() ops, but if that works, did you meant to
>>> emulate it so driver no longer have to implement reqbufs() if they have
>>> create_bufs() ?
>>
>> For drivers it should be fairly simply, as the reqbufs and create_bufs
>> ioctl handlers should just point to the corresponding videobuf2 helpers.
>>
>> What I meant is that I'd like to encourage userspace to use the
>> VIDIOC_CREATE_BUFS ioctl instead of VIDIOC_REQBUFS.
>>
> 
> I'm not sure what rationale I can give implementer to "encourage" them to use a
> more complex API that needs to copy over the FMT (which has just been set),
> specially in the initial pre-allocation case. For most, CREATE_BUFS after SMT
> will look like a very redundant and counter intuitive thing. Maybe you have a
> more optimistic view on the matter ? Or you have a better idea how we could give
> a meaning to having a fmt there on the initial case where the allocation matches
> the queue FMT ?

I wouldn't mind if we can make a much nicer CREATE_BUFS variant with just the
size instead of a format. That was in hindsight a really bad idea, terrible
over-engineering.

Regards,

	Hans

