Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0A07CE79A8
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 18:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AFbDR6t0K38pyX7+4JTYkuMmYcxx7I5Alx9o/xWJWV0=; b=CwrqTnf9RhF4pcKP89EhhBv+CS
	n8ttaju1kdG64vjQlM7o3NfWvD4QKFyf2w4lm+nFKutX4wxXPwm21r9kDmpQs0JFAkkfpob0skyCN
	Dq8JpA8HKGpV19q38ApahQEA3dZg+VAYjASv6ox1tcYGB4W24nYWIAM0M2aAFzcBonImRuyML3lMM
	aauWNwMjze19zOTqIqUKBHnZ9m2txgBycah60d7f4opnmuKqRnXaRE/r190LyzrjGNQSHfTu7XXKS
	mkNHoKljnGQMCh1TFbaP4FQsOHLC06LBAWyFcZ2fQDP9XMVuu66Y5Vp6GfQvqsEO8Wcx4mCPUefe9
	lCImPjGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qifQ3-0014Rb-2h;
	Tue, 19 Sep 2023 18:25:55 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qifPz-0014Pk-33;
	Tue, 19 Sep 2023 18:25:53 +0000
Received: from [192.168.2.59] (109-252-153-31.dynamic.spd-mgts.ru [109.252.153.31])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: dmitry.osipenko)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B09AE660319E;
	Tue, 19 Sep 2023 19:25:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695147950;
	bh=Y03o1iTpNXjxrNlIz4kiT40Tw5yePhhDd5i17lzN0Kw=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=GRnH7PhbECO0rLL158hqddE6ZOaUKo/ng/abZs9H48AHSNmeK40gf5ez6gx1xw041
	 nqp+KRz6DqSOTsqHpUDUxgTKBLyeTiGRSgz9gzKDDRUuJNshZ3AyQyze5F/zAF8q0x
	 ZS6s4i3RcHcfe1kr9lZMTANKCRcd5Bubg312JW8CYtpeXBaoTxp7PrscI8UxsVyEU9
	 e+LvnicvOCdtFUE8V0aYFeEJjcJe2X2l46TceO+/dVyKX4eFCu2IfFsuuZIsHcqR7n
	 bRNEPW1Q1kw5NE5iZsrtvKxETAhQVf7s114oogG9OC0JUNq2b7tvDqI+KhO7cbEINF
	 6UFAGNAIsSMpQ==
Message-ID: <9b47d551-991b-5a60-39cf-3d47fbf68ea4@collabora.com>
Date: Tue, 19 Sep 2023 21:25:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RESEND PATCH v2] media: mtk-jpeg: Fix use after free bug due to
 uncanceled work
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Zheng Hacker <hackerzheng666@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Zheng Wang <zyytlz.wz@163.com>, Kyrie.Wu@mediatek.com,
 bin.liu@mediatek.com, mchehab@kernel.org, matthias.bgg@gmail.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Irui.Wang@mediatek.com, security@kernel.org, 1395428693sheep@gmail.com,
 alex000young@gmail.com, Collabora Kernel ML <kernel@collabora.com>
References: <20230707092414.866760-1-zyytlz.wz@163.com>
 <8c8bd3ec-a5a4-32e4-45b5-ee16eeeac246@collabora.com>
 <CAJedcCxPG1mKtgB7AcJSwaQB_qvODObwq3gz6eM_1w777b2PfQ@mail.gmail.com>
 <54b14ebe-b51b-2744-328d-2adcdaaf6d0e@collabora.com>
 <CAJedcCyn+VHxcSXH+HqP3yiXX8L0wjNao+suti5GgyQzYORcYA@mail.gmail.com>
 <4d533beb-f416-1b22-6d9d-cee7f3cfdad1@collabora.com>
In-Reply-To: <4d533beb-f416-1b22-6d9d-cee7f3cfdad1@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_112552_112938_8BD64C04 
X-CRM114-Status: GOOD (  16.41  )
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

On 9/19/23 21:24, Dmitry Osipenko wrote:
> On 8/31/23 11:18, Zheng Hacker wrote:
>>> The v4l2_m2m_ctx_release() already should wait for the job_timeout_work
>>> completion or for the interrupt fire. Apparently it doesn't work in
>>> yours case. You'll need to debug why v4l job or job_timeout_work is
>>> running after v4l2_m2m_ctx_release(), it shouldn't happen.
>>>
>> Yes, v4l2_m2m_cancel_job waits for m2m_ctx->job_flags to be  ~TRANS_RUNNING,
>> the mtk_jpeg_job_timeout_work will finally invoke v4l2_m2m_job_finish
>> to trigger that.
>>
>> However, this is not the only path to call v4l2_m2m_job_finish. Here
>> is a invoking chain:
>> v4l_streamon
>>   ->v4l2_m2m_ioctl_streamon
>>     ->v4l2_m2m_streamon
>>       ->v4l2_m2m_try_schedule
>>         ->v4l2_m2m_try_run
>>           ->mtk_jpeg_dec_device_run
>>             ->schedule_delayed_work(&jpeg->job_timeout_work...
>>             ->error path goto dec_end
>>             ->v4l2_m2m_job_finish
>>
>> In some specific situation, it starts the worker and also calls
>> v4l2_m2m_job_finish, which might
>> make v4l2_m2m_cancel_job continues.
> 
> Then the error path should cancel the job_timeout_work, or better job

s/job/timeout work/

> needs to be run after the dec/enc has been started and not before.
> 
> Looking further at the code, I'm confused by this hunk:
> 
> 	mtk_jpeg_dec_start(comp_jpeg[hw_id]->reg_base);
> 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
> 
> The job should be marked as finished when h/w has finished processing
> the job and not right after the job has been started. So the job is
> always completed and mtk_jpeg_job_timeout_work() doesn't work as
> expected, am I missing something?
> 

-- 
Best regards,
Dmitry


