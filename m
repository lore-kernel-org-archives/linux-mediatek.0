Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8B6FA3734
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 09:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6impsIn9bj1fYNoSWgVMePOqtWT/x81uRv/UlQQ8o44=; b=oUyL2OcqXDn4aq3CZlaNDVKr0M
	CrosaXxsKIayniXVgGjaTJZGlHDjWHa4AuEPkG/5irvzqQw8nqQIQMGlzh66/EBQ6jyd4EWP6LZKE
	8lMNTAH9pgHrIPrWbKHrlmRWWzhnJgznhpkFXyZkYd3Xzn4Gfa39tfvaeFRDcqe4D1FNAZfqjzKxp
	A1653LlgiJAybDAG0aSyNJZ8EkLJEioHOIFHXT/hjKrav0+PwvQTMvDbpatgcYNFlieqoy5kPuvfv
	nx0O1bCCTx4wUODO9GCG5OTEBS6vb+A02WgLbbijz82Ifs3SXvrJGVT4pYX2bwEGL0KyUKebAeoLC
	cmvMmZBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp2Be-0000000FQJF-0o4g;
	Fri, 13 Sep 2024 09:01:54 +0000
Received: from a7-40.smtp-out.eu-west-1.amazonses.com ([54.240.7.40])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp2Bb-0000000FQIC-1g7I;
	Fri, 13 Sep 2024 09:01:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726218107;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=k3tL55Eci+GrdjJeRvNVxOv50wV+NoVOHuN5tAfMyJ0=;
	b=fuO7eJ501oL0ElFCUp2urGs80t+x6VRxS19JGryle7WtV7CtQp63AOyuy39S4m0k
	SQ6RAnQmH30Gnxsx4XdhI5aBqMRcCAFiVKhGyaQNPtovm60uLPi18jR1XJiISXX06pf
	IWYgjw8GWcw4arOSMCD6meKvBsdjdUK/RaHBJmrXV0ipwQPUoyA+biHssrcrRFfiMu0
	QI8dd7m61u7pI96wUmIpALFtvu8xlz09R3plLjBDL9AGzBiKpT5fA6I2Pmi9WxqXEYU
	/doNtvS4xzLMYYCcLavl/sooQqufR58/+tTU0Ohy0gCy7gZYhvypBeeQjweYGbKyTKG
	94JU4M8Y2g==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726218107;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=k3tL55Eci+GrdjJeRvNVxOv50wV+NoVOHuN5tAfMyJ0=;
	b=KVrbvgwsi7nFHc8gG1MYkCmJ2+r7AhCxY+SZj+qUHiCWIMRGiOM/M8lpRTLwhrj1
	DOynYf4/kk+jqVT0Jo9+GsqJml732mPbpaVHMnlsJU5Qpx98bTW5vt3hzSZbjsWNFhX
	V4EU+5hqnuPYk7FF87QqDaklS7ay0GKHh5ZzC8Zc=
Message-ID: <01020191ea9dface-81c48f9d-4cf2-4f96-a1cd-59c11fa810ff-000000@eu-west-1.amazonses.com>
Date: Fri, 13 Sep 2024 09:01:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/5] Support alpha blending in MTK display driver
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>, 
	linux-mediatek@lists.infradead.org, 
	=?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>
Cc: linux-kernel@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>, 
	Daniel Vetter <daniel@ffwll.ch>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Hsiao Chien Sung <shawn.sung@mediatek.corp-partner.google.com>, 
	dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, 
	David Airlie <airlied@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	=?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>, 
	=?UTF-8?B?U2hhd24gU3VuZyAo5a6L5a2d6KyZKQ==?= <Shawn.Sung@mediatek.com>
References: <20240717-alpha-blending-v4-0-4b1c806c0749@mediatek.com>
 <CAAOTY_8ThuusfHk9Gd5pFP8VhJkG2seuJmkFiruK1rPQFZGBzg@mail.gmail.com>
 <6c9b7f85-f92d-44ed-ae9d-00f6d55ea614@gmail.com>
 <a2cf4e9b9c3343a7398521760934f1740505aa13.camel@mediatek.com>
 <13f6dbc5d460e746352f68b001e85f870c89993d.camel@mediatek.com>
 <69776448-0328-4880-9108-54466e40ddd9@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <69776448-0328-4880-9108-54466e40ddd9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.13-54.240.7.40
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_020151_602169_93710898 
X-CRM114-Status: GOOD (  14.28  )
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

Il 13/09/24 07:40, Alper Nebi Yasak ha scritto:
> Hi,
> 
> On 2024-09-13 05:56 +03:00, Jason-JH Lin (林睿祥) wrote:
>> Hi Alper,
>>
>> I think that's a platform issue because it works find in my MT8188
>> platform, but I don't have any MT8173 platform.
>>
>> Can you help me test the fix patch in your MT8173 platform?
>> I'll provide a fix patch in 2 weeks via Google Chat.

Jason, Two weeks is a bit too late as CK already picked your series: reverting
and reapplying creates noise in the commit log, and when this can be avoided it
should be avoided.

Since upstream is broken, please understand that this fix should be developed
with *highest* priority (so, as immediate as possible).

Thanks,
Angelo

>>
>> Regards,
>> Jason-JH.Lin
> 
> I replied over Google Chat, but to make it clear for others on the
> mailing list: Yes, I'll try to test patches when you send them.
> 
>> On Fri, 2024-09-13 at 01:25 +0000, CK Hu (胡俊光) wrote:
>>> Hi, Jason:
>>>
>>> Please help to fix this issue.
>>> Otherwise, I would revert this series.
>>>
>>> Regards,
>>> CK
>>>
>>> On Thu, 2024-09-12 at 23:29 +0300, Alper Nebi Yasak wrote:
>>>>    
>>>> External email : Please do not click links or open attachments
>>>> until you have verified the sender or the content.
>>>>   Hi,
>>>>
>>>> On 2024-07-31 16:34 +03:00, Chun-Kuang Hu wrote:
>>>>> Hi, Shawn:
>>>>>
>>>>> Hsiao Chien Sung via B4 Relay
>>>>> <devnull+shawn.sung.mediatek.com@kernel.org> 於 2024年7月17日 週三
>>>>> 下午1:24寫道：
>>>>>>
>>>>>> Support "Pre-multiplied" and "None" blend mode on MediaTek's
>>>>>> chips by
>>>>>> adding correct blend mode property when the planes init.
>>>>>> Before this patch, only the "Coverage" mode (default) is
>>>>>> supported.
>>>>>
>>>>> For the whole series, applied to mediatek-drm-next [1], thanks.
>>>>>
>>>>> [1]
>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next
>>>>
>>>> I am seeing broken colors on an MT8173 Chromebook with next-
>>>> 20240912,
>>>> which goes away if I git-revert this series (commits 1f66fe62cc09
>>>> eb17c5909481 a3f7f7ef4bfe 59e9d9de25f0 4225d5d5e779).
>>>>
>>>> To illustrate, I took a picture [1] of some color mixing diagrams
>>>> from
>>>> Wikipedia [2]. Do you have an idea of what goes wrong?
>>>>
>>>> (I'm busy with too many things so I don't want to debug it now...)
>>>>
>>>> [1] https://i.imgur.com/tNFvovB.jpeg
>>>> [2] https://en.wikipedia.org/wiki/Color_space#Generic


