Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D98C52D7C
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Aug 2024 14:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3FoKnazzhoSynDMr6FzFSNCp4QJxDulvfbdU8hPmOk=; b=nSrUZKlfxkE+2oz8e5I5HAcRjP
	yz4XK9p9Q9Ih8yfb0dhCgU9b2FhGn/ePhLZayHT3UFPdD4VCq26giOghz9eXsghD3HJYjb+oX+L7u
	XHsvVrxAgG9frPaHQbbIKPhyAtAAsl4J5P4tuate5wOx+eNtGfxajXIv364H3uLzQBnci+G7fEGw/
	XFLa5GUZ1FzYVCoCV6OA6X5a0diTej7hyrylUnU5OI8sAcFD3eaM4RguBjj8Lj4RPuZlFs18KK3G1
	rVkYwxY0mhUu9proiHT1sof+TzjP1ZkpoljDMANQgxpKr7IdMTnDccywCo/BN15HpzUwDSQiWkTEW
	C8bG//bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8ja-0000000D8RG-167p;
	Thu, 22 Aug 2024 14:24:18 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh8jW-0000000D8Q9-0pkk;
	Thu, 22 Aug 2024 14:24:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1724336651; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Mpx6Tju8i2+Z/P9CadF62VFv3LtT3DTz5DReE9TaEdq7pAGYUCdZbjTtQXqYoQ2WAeKEllZYt96/taERw53o+pFb7+pQJpRondfa0Knqty/98l6aLdgqNFQnp84fP+o5pkWggZXbrQbtNjeP8pbKg+3nkgj+GbF3q+AeK6bjJoA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724336651; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=m3FoKnazzhoSynDMr6FzFSNCp4QJxDulvfbdU8hPmOk=; 
	b=lASDQe8P+lMwn4YyIjk42b/pHMwqvVRjiG7NB9QI8U81GcJZtesUQqC4pM2WQuwfVOrw+hN5ZPHSs4xlp9b5SaG2hA9bp5AF0ltQJLSvQj6TPqPFHo0RrPRIKqNEbz0Jc27gKUxBBCGBdbkqj4Tb8b+/Rw3jKp2Wavq2QCEbo6I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724336651;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=m3FoKnazzhoSynDMr6FzFSNCp4QJxDulvfbdU8hPmOk=;
	b=fMnrl6jU07UoRPvSalOg4CYeppuHPIcRYHopPzTznW+43U6NrEVyCZs/fZrWJ8Fm
	G3W69oWQYuqhMn5l3ZNMG02pp7Kg9KJGxaStkB+BTE6aZI+mpZIU/OW0nKNm/Q0ATQd
	3oIylcKHfSz5EIQJbMXTGd/2fmJxylAwwvYJh8eI=
Received: by mx.zohomail.com with SMTPS id 1724336649022368.2581026629399;
	Thu, 22 Aug 2024 07:24:09 -0700 (PDT)
Date: Thu, 22 Aug 2024 16:24:03 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Fei Shao <fshao@chromium.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] media: mediatek: vcodec: Reduce msg queue trans buffer
 size
Message-ID: <20240822142403.qz3ia26at3rxob2v@basti-XPS-13-9310>
References: <20240521095536.3869399-1-fshao@chromium.org>
 <9f73dffc48394e6304263ac2293a2b18864ae3dd.camel@collabora.com>
 <CAC=S1njnqrdrQqJZYQ7mffgmAUUxtoO7utZumED0dmX=Fa9+Qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAC=S1njnqrdrQqJZYQ7mffgmAUUxtoO7utZumED0dmX=Fa9+Qw@mail.gmail.com>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240822_072414_321686_F3571885 
X-CRM114-Status: GOOD (  21.77  )
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

Hey Fei,

On 07.06.2024 19:20, Fei Shao wrote:
>On Fri, May 31, 2024 at 8:47 PM Nicolas Dufresne
><nicolas.dufresne@collabora.com> wrote:
>>
>> Le mardi 21 mai 2024 à 17:54 +0800, Fei Shao a écrit :
>> > In the MediaTek HW vcodec pipeline, the `trans` buffer is used to
>> > transfer the data decoded by the lat decoder to the core decoder.
>> >
>> > In the beginning, 6MB and 30MB were allocated for the trans buffer to
>> > handle FHD and higher-resolution contents respectively, but it turns out
>> > that's more than enough in practice and there's room for improvement.
>> >
>> > The buffer sizes were reduced to 5MB / 8MB respectively and the decoders
>> > have been validated to work normally on the MediaTek Android products.
>> > It's time to adopt that change in the upstream MediaTek vcodec driver.
>> >
>> > Reduce the msg queue trans buffer size to 5MB / 8MB respectively to
>> > optimize the memory usage per decoder instance and improve the overall
>> > system performance.
>>
>> I don't disagree with the change, but it feels like this is has hack over a
>> hack. We have an entropy decoder (LAT) metadata buffer, which of course is
>> resolution dependent, for which we hardcore two sizes.
>>
>> Any chance Mediatek can document this blob, or at least document the proper
>> relation between the size and the resolution ? This way we could dynamically
>> size the buffer for the chosen resolution and trust it to remain big enough for
>> a long time. Removing the non scientific claim of "have been validated", which
>> is producible for anyone hitting issue with that change in the future.
>>
>> Nicolas
>>
>
>Sorry for the delayed reply. I totally agree with your point, but last
>time I was told these are what they are using internally so I guess
>it's not there... or it could be me that didn't ask the right question
>(we want to do this with finer granularity or dynamically).
>If we don't get an answer here, I can also bring this up to MediaTek
>next time and see if they can provide more details.
>
>Regards,
>Fei

So are you going to send a new version for this?

Regards,
Sebastian Fricke
Consultant Software Engineer

Collabora Ltd
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales no 5513718.

