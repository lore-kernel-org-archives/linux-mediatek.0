Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFD9C7EE23
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 10:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dhncDJHXANDQNkfS842Kl2cY/c46thjSz6u0YRShRlI=; b=lCBtT4xcJehJRuPKc3AaYyRaw1
	Sq55tzMYC9a5v2LwRcKlqQnnZ5mTCD8qaK1Rq9PjcZqyjzBYqEJOVDmrJld3gS0mJVvikPrPCYFLG
	dD46ykFk3JvvnmRL1tU4llRtAY9ESfLzLnreVPYsTWRnkfxKZAEiAF0IED2gOx9oSrLkbCuDPs2Vf
	MLx5MsDA2gjf/t8Ws+U+R9tcgmFBYha60L/71VT/ZpKfzzV7HYHX6gevssdDmfrk77nFBJ5IUPIII
	eoJs0Z1LvOHgjhba8+O0tY934UIA2kSD8TGX9EgHuJmfntLhwuHtOLWPIHyvM2O44Ky6UbXj8ac3/
	TM6yoiGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3wfI-00DO2H-1g;
	Tue, 30 May 2023 10:33:20 +0000
Received: from ewsoutbound.kpnmail.nl ([195.121.94.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3wfE-00DO0A-01
	for linux-mediatek@lists.infradead.org;
	Tue, 30 May 2023 10:33:18 +0000
X-KPN-MessageId: 61661a09-fed5-11ed-ac2e-005056994fde
Received: from smtp.kpnmail.nl (unknown [10.31.155.8])
	by ewsoutbound.so.kpn.org (Halon) with ESMTPS
	id 61661a09-fed5-11ed-ac2e-005056994fde;
	Tue, 30 May 2023 12:33:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xs4all.nl; s=xs4all01;
	h=content-type:from:to:subject:mime-version:date:message-id;
	bh=dhncDJHXANDQNkfS842Kl2cY/c46thjSz6u0YRShRlI=;
	b=hWRRqJ6DH+lM/gLJocbXs+ntdE8QsfhQkBUthUzlo0N0MulXGN3MS7Qf8L54H1Ra4VraOe/cavATc
	 qUc6UcCGFMPFLoZQPNV1IWQ6niEjTKt8nsBs5A/DIiyFerqc1l1/hK9lH6/lSCCPnF85tUozWga3F4
	 4C2LppTrzamcJdFXxMNjTegrqNjNqQXXPczff542HLbg0Lt2OCwOWGLQaEmTpnf6FdAKguhxGn2a3/
	 S5yv3esp7UlRCucEljDGuCPFevlhmc88HchD+SZJ0P6vJjh0EYC+sjDiPIsnrDFOAtY0Qw1lL56WvP
	 upZmguP/MzDEhOZDV9B6d5gD02WmwuA==
X-KPN-MID: 33|2k5QJyYR4/t2fa9CzV1waT0MUhBFGBHIoKQn6RbdcKK+6mGoFeKy8NC6LxqDLuh
 bQ7dMBf67oZT4HbZHH2PWkbsvv8/uYo+PRjqlHOjDsZU=
X-KPN-VerifiedSender: Yes
X-CMASSUN: 33|qIwiHluoQX0nsW+Oi14G3QE1ZFn6v55r8PvRMvAIkDtKqqbFnwZ+zveHsoiNDtT
 ae2LsXDlJRkVo2EDC9xunog==
X-Originating-IP: 173.38.220.44
Received: from [10.47.77.214] (unknown [173.38.220.44])
	by smtp.xs4all.nl (Halon) with ESMTPSA
	id 6037fa81-fed5-11ed-b306-00505699d6e5;
	Tue, 30 May 2023 12:33:12 +0200 (CEST)
Message-ID: <da165529-ae9a-8461-c582-9c85e6f2fa4c@xs4all.nl>
Date: Tue, 30 May 2023 12:33:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5,8/8] media: mediatek: vcodec: Add dbgfs help function
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 =?UTF-8?Q?N=c3=adcolas_F_=2e_R_=2e_A_=2e_Prado?= <nfraprado@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230525021219.23638-1-yunfei.dong@mediatek.com>
 <20230525021219.23638-9-yunfei.dong@mediatek.com>
 <f3322e41-1891-a33b-daaa-731ec548ec4e@collabora.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <f3322e41-1891-a33b-daaa-731ec548ec4e@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_033316_483006_EC36C6F9 
X-CRM114-Status: GOOD (  22.12  )
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

On 5/30/23 12:06, AngeloGioacchino Del Regno wrote:
> Il 25/05/23 04:12, Yunfei Dong ha scritto:
>> Getting dbgfs help information with command "echo -help > vdec".
>>
>> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>> ---
>>   .../mediatek/vcodec/mtk_vcodec_dbgfs.c        | 24 ++++++++++++++++++-
>>   1 file changed, 23 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
>> index 237d0dc8a1fc..2372fc449b45 100644
>> --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
>> +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dbgfs.c
>> @@ -52,6 +52,23 @@ static void mtk_vdec_dbgfs_get_format_type(struct mtk_vcodec_ctx *ctx, char *buf
>>   	*used += curr_len;
>>   }
>>   
>> +static void mtk_vdec_dbgfs_get_help(char *buf, int *used, int total)
>> +{
>> +	int curr_len;
>> +
>> +	curr_len = snprintf(buf + *used, total - *used,
>> +			    "help: (1: echo -'info' > vdec 2: cat vdec)\n");
>> +	*used += curr_len;
>> +
>> +	curr_len = snprintf(buf + *used, total - *used,
>> +			    "\t-picinfo: get resolution\n");
>> +	*used += curr_len;
>> +
>> +	curr_len = snprintf(buf + *used, total - *used,
>> +			    "\t-format: get output & capture queue format\n");
>> +	*used += curr_len;
>> +}
>> +
>>   static ssize_t mtk_vdec_dbgfs_write(struct file *filp, const char __user *ubuf,
>>   				    size_t count, loff_t *ppos)
>>   {
>> @@ -84,6 +101,11 @@ static ssize_t mtk_vdec_dbgfs_read(struct file *filp, char __user *ubuf,
>>   	if (!buf)
>>   		return -ENOMEM;
>>   
>> +	if (strstr(dbgfs->dbgfs_buf, "-help")) {
> 
> I would print the help strings in two conditions:
> 1. -help
> 2. (nothing)
> 
> ...so that if you don't echo anything to vdec (no params), you get the help text.
> Otherwise, you would have to know that "-help" is a parameter that gives you help
> text in the first place.
> 
> As for this commit "as is", it works as intended and it is useful to retrieve
> the help text; you can either send a followup commit that extends the help to
> the corner case that I've explained, or send a v6 adding that to this same commit.
> 
> I would prefer to see a v6 -- BUT -- since this series was sent a long time ago,
> you will get my R-b and I will leave the final choice to Hans.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> 

I prefer a v6, rebased on top of the media_stage tree.

Regards,

	Hans

