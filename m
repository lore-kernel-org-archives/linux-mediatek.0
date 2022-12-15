Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0559DC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Dec 2022 11:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RlvyFV2/6hhj/uD5cDiwkUuxnX/vHzPjf4ZKGMAyf04=; b=tYPTS6VL4p/uZ9L37CqSUJhhgO
	Z5p5uH59R9luIEf1sVjJW1RPbmV71pxNBip4SczdVz35hJTacM7RSlueU2mOmKgoYsNYIXTdvA4fJ
	YnHrY2q1B8alxpUN7PXoVJ50HgInd5y7zElLi95VzOkgEKzk2C/0vuT5TwmEz1gDkQs14ls+15mdQ
	OFOdSFGNn3S70RQq3B9JQhoIeinudPaqLto5phnG1UaoUnGI9ab7ag+oOqIG6WVN8HKNlQ9+3ft43
	zVcLIYQrhP9ioDQQKwPNhiTnW7m032XxJSZ855+a8x0sCOSucV6Jcdq0mUmY5ur91Rg3TJVAB/VlT
	RjHGE81g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5m7u-008wh2-24; Thu, 15 Dec 2022 11:10:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p5m7i-008wd6-3H; Thu, 15 Dec 2022 11:09:59 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 76AE26602C62;
	Thu, 15 Dec 2022 11:09:55 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1671102596;
	bh=OiEexPLSc3VRGJggDVHCDD4pkJJ10eF0O12K6/3xdP0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FpQj6WOlDhF7nut5vD1Ey7TTuDdhPbAdMVE+vUMB43+yT16a+p3vjYZizvtpDP/94
	 PIRaAqnT0issGZYkeVoOGXYM+TmeuL9k9FtQUImujf59jo9v3u1WurHxEh+EKzY8u1
	 cODuFHqpM2MTjvtRxjmge0oEL2L/3KzNrduRLMo+oEVcHQDLE8EHUfEqSHl0LiaMS/
	 5Qm/kVapBq4ZIahEsgXCVCE/A1P9FOR7hFVTmwlzxgoZ+8h1SJTv6+MEvx+vZsEm9m
	 6C0ZFgvha2q+gfxlIKsbAOKqvIww3Tb4u37OlKlKN3uIrwAUF+8kXrrPGIquQYX4sk
	 SAG4M/lZmRQlA==
Message-ID: <9a7434ba-2d42-cf15-334b-637b5f1b01a3@collabora.com>
Date: Thu, 15 Dec 2022 12:09:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] media: jpeg: refactor multi-hw judgement
Content-Language: en-US
To: =?UTF-8?B?Sm9obnNvbiBXYW5nICjnjovogZbpkasp?= <Johnson.Wang@mediatek.com>,
 "nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 =?UTF-8?B?S3lyaWUgV3UgKOWQtOaZlyk=?= <Kyrie.Wu@mediatek.com>,
 =?UTF-8?B?SXJ1aSBXYW5nICjnjovnkZ4p?= <Irui.Wang@mediatek.com>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "tfiga@chromium.org" <tfiga@chromium.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 =?UTF-8?B?TWFvZ3VhbmcgTWVuZyAo5a2f5q+b5bm/KQ==?=
 <Maoguang.Meng@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?WGlhIEppYW5nICjmsZ/pnJ4p?= <Xia.Jiang@mediatek.com>
References: <20221215093026.12322-1-irui.wang@mediatek.com>
 <1895ff3f71fe7fe6c228d76dd046ea4f43b3dbf5.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1895ff3f71fe7fe6c228d76dd046ea4f43b3dbf5.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221215_030958_375455_6BD3B5CB 
X-CRM114-Status: GOOD (  13.42  )
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

Il 15/12/22 11:50, Johnson Wang (王聖鑫) ha scritto:
> On Thu, 2022-12-15 at 17:30 +0800, Irui Wang wrote:
>> From: kyrie wu <kyrie.wu@mediatek.com>
>>
>> some chips have multi-hw, but others have only one,
>> modify the condition of multi-hw judgement
>>
>> Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
>> Signed-off-by: irui wang <irui.wang@mediatek.com>
>> ---
>>   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c |  5 +++--
>>   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h | 12 ++++++++++++
>>   2 files changed, 15 insertions(+), 2 deletions(-)
>>
> 
> This may conflict with kernel mainline since mtk-jpeg folder doesn't
> exist.
> Please fix it.
> 
> BRs,
> Johnson Wang

Ouch. I just noticed that the folder is mismatching; this didn't deserve
a R-b tag. I'll be more careful next time.


