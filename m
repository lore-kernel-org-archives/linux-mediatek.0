Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B728C7EE29
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 10:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zIvKceeBrzD3QErH6cL4HbavmMBBb8lhJ0TmN8kkJf4=; b=vtKkjLiRQbvwqziWGUJcjwBGp7
	vo6q8JQ/uRFFan2ZxgkWL3lm/t3+Vu4gM4Jgn/XLxxuTYHkh/CMkxvhq6D/Xv6MmCGwIcUrL8325B
	MdqRKc/bt2wcucDr3J4qP2Mymi1N318c+F+Xe339425SiHGUYLMYusuuh/ChTkxGJsTnXlEkdOhg0
	F01f6A5o5Kfp6wFi0yqgXgwN6yjIQpx5ndha1nOpQDd6VHtGFdpzy3nlrdvsB+rhKiiKtf+aednna
	5upYQjMKI5Po7kZOBtXrWubWab8YBSFGXQrkT7oihnOB6fKqc2Uz1t8CW3aOtBBdVVT+P6skaqGz0
	XTVLlvTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4fEw-002qky-0p;
	Thu, 01 Jun 2023 10:09:06 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4fEt-002qjg-2A;
	Thu, 01 Jun 2023 10:09:05 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 309466605838;
	Thu,  1 Jun 2023 11:09:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685614142;
	bh=0DH3SQ6KF60gTcR5ThYQNd1f0rnSgcmjQjZkKuVl7Ro=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kUoXbXyNfE0HOrOILlfjHF7W3KZzTaCj+wCqaphJB9QbwQKoprA809jPe3RZJK/Mh
	 VnXbhXP9PNiGSp0MExLpl1SUPgW5xMPDaCbprhkPWJP7spEpYceZ7d/sbre0SG7heB
	 Ovyq92HgweaE4+HHayWMDKklaUjYrVVNsac2WBm07qM3/qjeoWLATE0Km3sfL07vqy
	 H2ZkicBFl5v7beALdRbVrY8excLIdIH41JhvSnXp4Dbjy4T91v3trxhE/BIYawfxlO
	 6ByVL8rdBUnAL5mpa145V6Lgdu0cTtQzadrZiKqp7FyHqN45AMvHQ41XW3cArr5TMz
	 30xny07QTinSA==
Message-ID: <71cd6c8b-bb4c-0c9a-4f1a-68df89aa2a90@collabora.com>
Date: Thu, 1 Jun 2023 12:08:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 4/8] mediatek: vcodec: remove the dependency of debug log
Content-Language: en-US
To: =?UTF-8?B?WXVuZmVpIERvbmcgKOiRo+S6kemjnik=?= <Yunfei.Dong@mediatek.com>,
 "nhebert@chromium.org" <nhebert@chromium.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "frkoenig@chromium.org" <frkoenig@chromium.org>,
 "stevecho@chromium.org" <stevecho@chromium.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "hsinyi@chromium.org" <hsinyi@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20230601030256.29875-1-yunfei.dong@mediatek.com>
 <20230601030256.29875-5-yunfei.dong@mediatek.com>
 <ef3aaee1-e6ca-a89d-e002-42bf918736f4@collabora.com>
 <1f0509fea9f3326a90e04ee7a0a0ffad0aeb4b9f.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1f0509fea9f3326a90e04ee7a0a0ffad0aeb4b9f.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_030903_968509_0056C33E 
X-CRM114-Status: GOOD (  15.66  )
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

Il 01/06/23 11:52, Yunfei Dong (董云飞) ha scritto:
> Hi AngeloGioacchino,
> 
> Thanks for your suggestion.
> On Thu, 2023-06-01 at 11:29 +0200, AngeloGioacchino Del Regno wrote:
>>   	
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>   Il 01/06/23 05:02, Yunfei Dong ha scritto:
>>> 'mtk_vcodec_debug' and 'mtk_vcodec_err' depends on 'mtk_vcodec_ctx'
>>> to get the index of each instance, using the index directly instead
>>> of with 'mtk_vcodec_ctx'.
>>>
>>> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>>> ---
>>>    .../mediatek/vcodec/mtk_vcodec_util.h         |  36 +++--
>>>    .../vcodec/vdec/vdec_av1_req_lat_if.c         |  78 +++++------
>>>    .../mediatek/vcodec/vdec/vdec_h264_if.c       |  46 +++----
>>>    .../mediatek/vcodec/vdec/vdec_h264_req_if.c   |  32 ++---
>>>    .../vcodec/vdec/vdec_h264_req_multi_if.c      |  62 ++++-----
>>>    .../vcodec/vdec/vdec_hevc_req_multi_if.c      |  54 ++++----
>>>    .../mediatek/vcodec/vdec/vdec_vp8_if.c        |  38 +++---
>>>    .../mediatek/vcodec/vdec/vdec_vp8_req_if.c    |  36 ++---
>>>    .../mediatek/vcodec/vdec/vdec_vp9_if.c        | 128 +++++++++--
>> -------
>>>    .../vcodec/vdec/vdec_vp9_req_lat_if.c         |  67 ++++-----
>>>    .../platform/mediatek/vcodec/vdec_vpu_if.c    |  48 +++----
>>>    .../mediatek/vcodec/venc/venc_h264_if.c       |  74 +++++-----
>>>    .../mediatek/vcodec/venc/venc_vp8_if.c        |  44 +++---
>>>    .../platform/mediatek/vcodec/venc_vpu_if.c    |  54 ++++----
>>>    14 files changed, 399 insertions(+), 398 deletions(-)
>>>
>>> diff --git
>> a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h
>> b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h
>>> index ecb0bdf3a4f4..f018af38b39d 100644
>>> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h
>>> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_util.h
>>> @@ -31,42 +31,38 @@ struct mtk_vcodec_dev;
>>>    #define mtk_v4l2_err(fmt, args...)                \
>>>    pr_err("[MTK_V4L2][ERROR] " fmt "\n", ##args)
>>>    
>>> -#define mtk_vcodec_err(h, fmt, args...)\
>>> -pr_err("[MTK_VCODEC][ERROR][%d]: " fmt "\n",\
>>> -       ((struct mtk_vcodec_ctx *)(h)->ctx)->id, ##args)
>>> +#define mtk_vcodec_err(inst_id, fmt,
>> args...)                          \
>>> +pr_err("[MTK_VCODEC][ERROR][%d]: " fmt "\n", inst_id, ##args)
>>>    
>>
>> This *huge* cleanup (congrats btw!) would be a great occasion to
>> change those
>> pr_err() to dev_err(). Can we do that?
>>
> 
> Can change pr_err to dev_err, but need to add one extra parameter "dev"

Yes I'm aware of the fact that you have to add a `dev` extra param, of course.

> in mtk_vcodec_err. Whether need to change mtk_vcodec_debug?
> 

Yes please, change everything you can to use dev_* prints, that'd be great.

Cheers!

>> Regards,
>> Angelo
>>
> Best Regards,
> Yunfei Dong



