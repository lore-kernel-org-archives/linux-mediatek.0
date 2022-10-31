Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5A6ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 12:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FimjysKcElGtPUVau6NM+mxCrsdNQICgW3ETSGgxlMc=; b=ry/FWJdwuxktBXsvQn0xHpBVHN
	dMDeN4L9C8AmanK1WRxU8w2QQ6nIih5NgWBJjQ28JUHAMwnWxhJfGRjhbb3NzJleyL7nEvMjrMOke
	ZAsOFp/HYTGSK8jwkRo3k+JHsSXYh4DJ230h6vreQa6KQN3ho4a3YWJrmvFEks25RLTZeU9fOXmtd
	oewsz0ZvR0Ar21Vv7JtCJ2/RD3XcMrIj2JhnorYfnIjjtnEn0kZkBV4ivsVHLVV1tWpUt3N/j4r/W
	NXFD2RVd7mA9owjrPAWIrLpOrLaUvvanfrPHw6z0n4+B6fm2jv1zaQWFlfJj8nFC9859icoSoe+Eg
	vP195qfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opUDx-00Bpia-Ri; Mon, 31 Oct 2022 12:49:05 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opUDm-00Bpg3-8C; Mon, 31 Oct 2022 12:48:55 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 48DEA6602387;
	Mon, 31 Oct 2022 12:48:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667220528;
	bh=ETLcOC6RqGvMLvwInB/+hn555B0YojoNFYRHkoq15ys=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IVJTu5Kmw6Bx3dBbjqANAxFC42H8FCVyp7y5hDD88QU6z/8dffprYyNN7wg7NfQlL
	 VPdKu/AIXrBedGLMVMl3rUzDrlqCQqD2ZqcwvNUO0UcAiUTm6wZgH7CQaa4Fg+KQUi
	 r1SkLpU5f9hR4yku37q7q8UdrVoV15MFT0mPGwUoM+ReQhPO+Yb8Xxqh/gQ6whADPm
	 zXBQiS24Qsl81Jhx19reqEmL47I7O4vR5T0QqaKuR14Ufy0/VKJ3wWW1kVlaMmgXGR
	 XlKzP9qSY8bWQjxIwh9B3zgiUqYpeWlqLdnFbnqyxS0ML3bvk1kDRl+C02Q7/uOLvP
	 ijCjc4NCnI0iw==
Message-ID: <2fbf35b9-3cad-4211-db5b-501d5eb14a2e@collabora.com>
Date: Mon, 31 Oct 2022 13:48:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] vcodec: mediatek: add check for NULL for
 vsi->frm_bufs[vsi->new_fb_idx].buf.fb in vp9_swap_frm_bufs
Content-Language: en-US
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Anastasia Belova <abelova@astralinux.ru>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, lvc-project@linuxtesting.org
References: <20221028125811.11340-1-abelova@astralinux.ru>
 <664bd195bdde7fd740572c4981c60b32de1465aa.camel@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <664bd195bdde7fd740572c4981c60b32de1465aa.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_054854_544964_EAC6BEB7 
X-CRM114-Status: GOOD (  16.79  )
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

Il 28/10/22 15:02, Nicolas Dufresne ha scritto:
> Hi,
> 
> Le vendredi 28 octobre 2022 à 15:58 +0300, Anastasia Belova a écrit :
>> If vsi->frm_bufs[vsi->new_fb_idx].buf.fb == NULL while cleaning
>> fb_free_list NULL-pointer is dereferenced.
>>
>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>
>> Fixes: f77e89854b3e ("[media] vcodec: mediatek: Add Mediatek VP9 Video Decoder Driver")
>>
>> Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
>> ---
>>   drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
>> index 70b8383f7c8e..b0679aaf6192 100644
>> --- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
>> +++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
>> @@ -512,7 +512,7 @@ static void vp9_swap_frm_bufs(struct vdec_vp9_inst *inst)
>>   	 * clean fb_free_list
>>   	 */
>>   	if (vsi->frm_bufs[vsi->new_fb_idx].ref_cnt == 0) {
>> -		if (!vp9_is_sf_ref_fb(
>> +		if (vsi->frm_bufs[vsi->new_fb_idx].buf.fb != NULL && !vp9_is_sf_ref_fb(
>>   			inst, vsi->frm_bufs[vsi->new_fb_idx].buf.fb)) {
>>   			struct vdec_fb *fb;
> 
> Perhaps we could try and maintain some readability ? I'd suggest to move the
> check into vp9_is_sf_ref_fb() as an early return.
> 

I don't think that this will ever happen, as the check was omitted because of being
totally sure that vsi->frm_bufs[vsi->new_fb_idx].buf.fb is not NULL.

In any case, it doesn't really cost anything to add a check... in which case, I
agree with Nicolas about moving that to vp9_is_sf_ref_fb().

	if (!fb)
		return false
	for .....

Regards,
Angelo


