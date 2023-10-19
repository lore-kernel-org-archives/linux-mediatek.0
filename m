Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F471CDB465
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 19:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MAxN79BTDDU+c4UJTWyBroJMaNClKuyPXZ3ITF+x6Ww=; b=40qMjvIQDonzc5tASfhY0mlcIP
	lq12KxhuienXhMaWFzdG/2UTI56fB3rNTh3feI2wGRBMhxWoFMBHrWVe+vHT8od9Kr2mcJMIl5p31
	OE3VrOxd6wdtCaTRTEFiM5NKu0e367coAPf1OSj1a/GvLQGyWCGThizjBOjw2t2/WKX3a9RdnznCz
	GzEWwsjp8yR4QOdr/g4NnOQpbwPeFAQ89O/R6pAnCpHnhwj7PiTZ/v2/k+QwDNzTWTfSZEk6pZRMM
	ew2/yoNbjLqu6F4WQTPzs5KqSLEsklkS6Zg1cy6v68Hu7vl7948vN/FJBHH67Hs0Ve7iht4Q6rqYl
	h18/U3Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtZ84-000dMi-0l;
	Thu, 19 Oct 2023 19:56:24 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtZ81-000dKz-05;
	Thu, 19 Oct 2023 19:56:22 +0000
Received: from [192.168.2.39] (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dmitry.osipenko)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A29506607346;
	Thu, 19 Oct 2023 20:56:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697745366;
	bh=9S5WCALTYlD5YiF0ahDBN6EG/01T9j/IJBVoGdrQIxo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OAwxKFiMBtnWwN5Ym/JHSOPGn+D1On/E1gBE5GsJ9Hf3tsPBzdaaaf41XVcYgIL45
	 eGpf2wZdh7YS976DDCmZJvJvIYY+eLq4pWxNiFMzBHSCsWR6gf5jpG3+ttERgzIDkN
	 raH9UOWnyh4p7SiqDr2UbIrjWKnnxYzbxaRQGYvu85Wqal2BR8Zig2mq20r93HUQ5q
	 gq5I8rrmV/m54eElUL5FevSpsJPGIxfYzpgYx8rNX5OaaStT0s60DHNAK6T9DxNoGG
	 qseVIH/OH1vli5FxnTph7uBIVNWVjNXXxl43Kb4Y3TJszdQJcg9XOzBIU2E/ZI0W+5
	 1XlR93sazvAMg==
Message-ID: <6a9fda43-9391-eaba-11f6-87d4ff966cb1@collabora.com>
Date: Thu, 19 Oct 2023 22:56:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [RESEND PATCH v2] media: mtk-jpeg: Fix use after free bug due to
 uncanceled work
Content-Language: en-US
To: Zheng Hacker <hackerzheng666@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Zheng Wang <zyytlz.wz@163.com>, Kyrie.Wu@mediatek.com, bin.liu@mediatek.com,
 mchehab@kernel.org, matthias.bgg@gmail.com, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Irui.Wang@mediatek.com,
 security@kernel.org, 1395428693sheep@gmail.com, alex000young@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>
References: <20230707092414.866760-1-zyytlz.wz@163.com>
 <8c8bd3ec-a5a4-32e4-45b5-ee16eeeac246@collabora.com>
 <CAJedcCxPG1mKtgB7AcJSwaQB_qvODObwq3gz6eM_1w777b2PfQ@mail.gmail.com>
 <54b14ebe-b51b-2744-328d-2adcdaaf6d0e@collabora.com>
 <CAJedcCyn+VHxcSXH+HqP3yiXX8L0wjNao+suti5GgyQzYORcYA@mail.gmail.com>
 <4d533beb-f416-1b22-6d9d-cee7f3cfdad1@collabora.com>
 <CAJedcCwDemUSo8Hv1XYLcAkHeo2Y2RU=xX7Fv5aSRz52AixK6g@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAJedcCwDemUSo8Hv1XYLcAkHeo2Y2RU=xX7Fv5aSRz52AixK6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_125621_344003_BCDB519D 
X-CRM114-Status: GOOD (  24.78  )
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

On 10/8/23 12:13, Zheng Hacker wrote:
> Dmitry Osipenko <dmitry.osipenko@collabora.com> 于2023年9月20日周三 02:24写道：
>>
>> On 8/31/23 11:18, Zheng Hacker wrote:
>>>> The v4l2_m2m_ctx_release() already should wait for the job_timeout_work
>>>> completion or for the interrupt fire. Apparently it doesn't work in
>>>> yours case. You'll need to debug why v4l job or job_timeout_work is
>>>> running after v4l2_m2m_ctx_release(), it shouldn't happen.
>>>>
>>> Yes, v4l2_m2m_cancel_job waits for m2m_ctx->job_flags to be  ~TRANS_RUNNING,
>>> the mtk_jpeg_job_timeout_work will finally invoke v4l2_m2m_job_finish
>>> to trigger that.
>>>
>>> However, this is not the only path to call v4l2_m2m_job_finish. Here
>>> is a invoking chain:
>>> v4l_streamon
>>>   ->v4l2_m2m_ioctl_streamon
>>>     ->v4l2_m2m_streamon
>>>       ->v4l2_m2m_try_schedule
>>>         ->v4l2_m2m_try_run
>>>           ->mtk_jpeg_dec_device_run
>>>             ->schedule_delayed_work(&jpeg->job_timeout_work...
>>>             ->error path goto dec_end
>>>             ->v4l2_m2m_job_finish
>>>
>>> In some specific situation, it starts the worker and also calls
>>> v4l2_m2m_job_finish, which might
>>> make v4l2_m2m_cancel_job continues.
>>
>> Then the error path should cancel the job_timeout_work, or better job
>> needs to be run after the dec/enc has been started and not before.
>>
> 
> Hi,
> 
> Sorry for my late reply for I just went on a long vacation.
> 
> Get it. I'll write another patch and change the summary to the lack of
> canceling job in error path.
> 
>> Looking further at the code, I'm confused by this hunk:
>>
>>         mtk_jpeg_dec_start(comp_jpeg[hw_id]->reg_base);
>>         v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
>>
>> The job should be marked as finished when h/w has finished processing
>> the job and not right after the job has been started. So the job is
>> always completed and mtk_jpeg_job_timeout_work() doesn't work as
>> expected, am I missing something?
> 
> After reading the code I still don't know. I didn't see any function
> like mtk_jpeg_dec_end. The same thing
> happens on mtk_jpeg_enc_start. I think I'd better fix the first
> problem and wait for someone familiar with
> the second part.

I missed that the code mentioned above is related to the multi-core hw version, while you care about single-core. Nevertheless, the multi-core device_run() looks incorrect,

So, the error code paths need to be corrected. Please try to revert yours fix and test this change: 

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 0051f372a66c..fd3b0587fcad 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1254,9 +1254,6 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
 	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 
-	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
-			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
-
 	mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
 	if (mtk_jpeg_set_dec_dst(ctx,
 				 &jpeg_src_buf->dec_param,
@@ -1266,6 +1263,9 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 		goto setdst_end;
 	}
 
+	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
+			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
+
 	spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);
 	ctx->total_frame_num++;
 	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
@@ -1330,13 +1330,13 @@ static void mtk_jpeg_dec_device_run(void *priv)
 	if (ret < 0)
 		goto dec_end;
 
-	schedule_delayed_work(&jpeg->job_timeout_work,
-			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
-
 	mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
 	if (mtk_jpeg_set_dec_dst(ctx, &jpeg_src_buf->dec_param, &dst_buf->vb2_buf, &fb))
 		goto dec_end;
 
+	schedule_delayed_work(&jpeg->job_timeout_work,
+			      msecs_to_jiffies(MTK_JPEG_HW_TIMEOUT_MSEC));
+
 	spin_lock_irqsave(&jpeg->hw_lock, flags);
 	mtk_jpeg_dec_reset(jpeg->reg_base);
 	mtk_jpeg_dec_set_config(jpeg->reg_base,

-- 
Best regards,
Dmitry


