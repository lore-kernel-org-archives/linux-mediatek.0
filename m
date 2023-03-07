Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E148BC678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 09:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30b+A82YFKJawa5iFYJbthRhjUy+EdxF/+Um+N70Mg8=; b=J+4F0tollCAuLWaubEmGLbKXA5
	eT75T2HZcrrdBqh4mcUpax4J6TYLbL/YUqszJEXP0abxruv6wjfqU1u5JED2CjT3RdWvQo0TQ9/gN
	3kXpo0dJRnFnFeNPM+7+GSfNBomGCBa8Q8mIzF7s7kG0NqGPkBu+gQ6MK5Jboqx5vUVA6I6cNRKPL
	Sac6ZVlk7/CZQJE6Ak10u6PV2Ql0PoGzauhk2xzHVeUY+Q2G65ryp9/89y4V2Wy3KLcncvjdqqIbu
	t3gHjADHxkbyIKJkLDpmRQY/X/w2cDjrQXx4nRAdAa+tiPvc27MKc3leujBaCp9yA2Rqr5BqMtjVZ
	eZoG6HdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTx8-00H1ty-FY; Tue, 07 Mar 2023 09:49:50 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTwr-00H1nM-He; Tue, 07 Mar 2023 09:49:37 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 834976602FE5;
	Tue,  7 Mar 2023 09:49:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678182572;
	bh=bFdUBSoZid4noEejpjbjSQLY78Rr8UCoRauX0ECcyZA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kcggbC72pydIcHkWby/ACFWWdCiqdOuN0UM0dY+WlDJcji32m0LSpuaHeJQzMfqID
	 SNZU4O4gOX9VBuV1AY0lgnanwvNp0V+VctHE+4BMgDQb2WBzH0YfV5IcomBGeTSLI7
	 qGZvfX5i/1+Jta4RCeH+0eUmB2T+03z01JP0TZgV6MRUCnBLjaOVX6X+mKQNsa6YgF
	 KatpFW1/mYXcuW3vv7gk4fyuFQCm7y4LLzeu5P8bwYRGZMzQpJ5NNtdVhL3sotm3aG
	 9gVq7W2vOtuNlI21Sw9WYPaLBbdmsRJP3cBrHmal8Ymjbuhg4GiALNL/TsSeV/3rIB
	 zhrED7sSSTScg==
Message-ID: <57c17bfd-83f3-fcce-0eab-e28469fb0ced@collabora.com>
Date: Tue, 7 Mar 2023 10:49:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RESEND PATCH] media: mtk-jpeg: Fix use after free bug due to
 uncanceled work
Content-Language: en-US
To: Zheng Hacker <hackerzheng666@gmail.com>, Zheng Wang <zyytlz.wz@163.com>,
 Irui Wang <irui.wang@mediatek.com>
Cc: mchehab@kernel.org, bin.liu@mediatek.com, matthias.bgg@gmail.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 1395428693sheep@gmail.com, alex000young@gmail.com
References: <20230306062633.200427-1-zyytlz.wz@163.com>
 <CAJedcCzeVwwi9SkkwouFXUAVhF-tKF4dkqsFqVQwszSwY1SJ0A@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAJedcCzeVwwi9SkkwouFXUAVhF-tKF4dkqsFqVQwszSwY1SJ0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_014933_756249_48EE23BD 
X-CRM114-Status: GOOD (  17.71  )
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

Il 07/03/23 10:27, Zheng Hacker ha scritto:
> Hi,
> 
> Is there anyone who can help with this? I can provide more details
> like invoking chain if needed.
> 

Providing more details is always good. Please do.

Meanwhile, adding Irui Wang to the loop: he's doing mtk-jpeg.

Regards,
Angelo

> Thanks,
> Zheng
> 
> Zheng Wang <zyytlz.wz@163.com> 于2023年3月6日周一 14:28写道：
>>
>> In mtk_jpeg_probe, &jpeg->job_timeout_work is bound with
>> mtk_jpeg_job_timeout_work. Then mtk_jpeg_dec_device_run
>> and mtk_jpeg_enc_device_run may be called to start the
>> work.
>> If we remove the module which will call mtk_jpeg_remove
>> to make cleanup, there may be a unfinished work. The
>> possible sequence is as follows, which will cause a
>> typical UAF bug.
>>
>> Fix it by canceling the work before cleanup in the mtk_jpeg_remove
>>
>> CPU0                  CPU1
>>
>>                      |mtk_jpeg_job_timeout_work
>> mtk_jpeg_remove     |
>>    v4l2_m2m_release  |
>>      kfree(m2m_dev); |
>>                      |
>>                      | v4l2_m2m_get_curr_priv
>>                      |   m2m_dev->curr_ctx //use
>>
>> Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
>> ---
>>   drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
>> index 969516a940ba..364513e7897e 100644
>> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
>> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
>> @@ -1793,7 +1793,7 @@ static int mtk_jpeg_probe(struct platform_device *pdev)
>>   static int mtk_jpeg_remove(struct platform_device *pdev)
>>   {
>>          struct mtk_jpeg_dev *jpeg = platform_get_drvdata(pdev);
>> -
>> +       cancel_delayed_work(&jpeg->job_timeout_work);
>>          pm_runtime_disable(&pdev->dev);
>>          video_unregister_device(jpeg->vdev);
>>          v4l2_m2m_release(jpeg->m2m_dev);
>> --
>> 2.25.1
>>




