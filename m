Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A02DC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 07:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kC6wLXcG5jpDOyAuaOfUjxJXuJa1O1kEkMAIU128Bog=; b=ylGMBiYQ6r+pYKaNAwcHQUnO64
	db1Qsg8yCSEz6seBJWnyRk7cobn/OboLa+442x3lk5qCx3/NaUCVJE2AVanYGRIzdvIlME2vpEMwB
	mI5yw706BBH1jTY3kqCJLHH7CLXBZ/mtbaAt/5YgsoQC7n0L6ZTPmCPxinzNDW0voDhEEyzyONuQK
	QBONVGZAzId3j6q1IxSwQ8GnIgzO5MVelfEleHUbJDojGI6rfspXnvcT9SLAPt06RLInGOVhJNyxx
	+IyCTTJVN9BIDEhD429S9OncdZTGh6NDalMSMfkB6AbEjnvXj3ab8s2uT+RwdfskJJgnfHgvSj6/e
	4jn3QNeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEnXE-000nxP-5S; Fri, 22 Jul 2022 07:57:20 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEnWw-000nlu-5c; Fri, 22 Jul 2022 07:57:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 649E96601ABF;
	Fri, 22 Jul 2022 08:56:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658476620;
	bh=2DGolipgyjptolp4am/pfMdXRfTwRTSgmtA0z4LFs74=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TWjJcmibV8VEFEuMdfgD9HUYattJGFNft4NDLBqSyUYkaeici4lRn0ccNAgCz40cq
	 MQZt7GjX8qA8DUEWCTi8yIOL6u9YbtWgdCcaSo/an71v2OEpY//0cGgG2dgkd76qQ3
	 u6Zh1RqQxXPI6SdE1agHamet20MjIiy/F03N5QH8AI2jghDmLBv8M1L0nrrSOhXdiP
	 Ox5FUb8bFRanFQ4UPFYEQuBXsassSLjVfD4yQHp6JbcxfralOfGQ6rxILansDl2xo3
	 ovUHwyqpHQM7s74K/YR+Pv4fHMzMP3J4DkdJcxoQ/D3LrmxfM+REkM+KqQ8GHaIMRx
	 OMv/SONENFg+A==
Message-ID: <addbe80a-8fdd-fe5e-f880-c11dc1833fb6@collabora.com>
Date: Fri, 22 Jul 2022 09:56:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RESEND] media: mediatek: vcodec: Add to support VP9 inner racing
 mode
Content-Language: en-US
To: "mingjia.zhang@mediatek.com" <mingjia.zhang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
Cc: George Sun <george.sun@mediatek.com>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Irui Wang <irui.wang@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220715064938.5812-1-mingjia.zhang@mediatek.com>
 <6d8aeee4-9732-1c62-67e0-6e8f56373aa6@collabora.com>
 <cf62ea99e74ea729a38fe7f806cbc06a0c549ddc.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <cf62ea99e74ea729a38fe7f806cbc06a0c549ddc.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_005702_374984_86D33FDB 
X-CRM114-Status: GOOD (  16.03  )
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

Il 22/07/22 08:43, mingjia.zhang@mediatek.com ha scritto:
> Hi Angelo,
> 
> Thanks for your reply and useful comments.
> 
> In addition to running cts/gts test, I ran the fluster test with
> GStreamer locally. The test result is "Ran 240/303 tests successfully"
> 
> 

Just an advice: if you want to speed up the reviews and merging these
commits, always post the full output of Fluster/GST testing when sending
them.

This will make it easier for the media maintainers to review your code :-)

Anyway, thanks for the Fluster testing!

Cheers,
Angelo

> Thanks,
> mingjia
> 
> 
> On Fri, 2022-07-15 at 10:34 +0200, AngeloGioacchino Del Regno wrote:
>> Il 15/07/22 08:49, Mingjia Zhang ha scritto:
>>> In order to reduce decoder latency, enable VP9 inner racing mode.
>>> Send lat trans buffer information to core when trigger lat to work,
>>> need not to wait until lat decode done.
>>>
>>> Signed-off-by: mingjia zhang <mingjia.zhang@mediatek.com>
>>> ---
>>> CTS/GTS test pass
>>
>> CTS/GTS passing is a good indication but, please, test with GStreamer
>> (and
>> show the output, as well!).
>>
>> Thanks,
>> Angelo
>>
>>> ---
>>>    .../vcodec/vdec/vdec_vp9_req_lat_if.c         | 64 ++++++++++++
>>> -------
>>>    1 file changed, 40 insertions(+), 24 deletions(-)
>>>
> 



