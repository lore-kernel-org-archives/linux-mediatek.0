Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E589CD54AF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 10:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6LSwjHw3EzNKUT2fX+5gKMdhfqrBryfR8Z9qYkeQ8ks=; b=apaiY8gYJ7YCRKO//ee2UxNzTw
	1f+zO1QAaoeAPFC547oJBfvODmWTqZFALje9CRLUFiW7WHftMK9bdW1Xo0jOOrP3C6+RmBMKzcfyh
	4FD2mz8cgrDURpm+7K/NVwxT6t2Oediza+KYjAc9Q4PvBNiwlCz+FT7MXuekOx8mUkjzJbir5uQSW
	pETGCWrn40urmrIpxjuVvKve/bSsNlF9mYvSzUemCpTSSvdVK3Nh2bxmM0TPM77J8whTnzkGiFS/s
	8FYeJXtFaCTtZkyeFH6zTXJ7xmB5cp1VesbaFLBz3l4zfjktXMmTzEbhZbpibc1z1lRmNZOJVTIsn
	FbFOO+Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXtm-0000in-1W;
	Tue, 19 Sep 2023 10:24:06 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiXti-0000i7-1F;
	Tue, 19 Sep 2023 10:24:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 08B4666071A9;
	Tue, 19 Sep 2023 11:23:59 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695119040;
	bh=vEd/MlguL02ZXOoi5Lbo0eYYX6tjl/mBmpK3ZZEUtB8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ND8iOwdDEuuZr6o5GFR1BcGk2ITNPnArgMvUGFAJohCweD6qZLyhpVjkG1nFoh04l
	 /XF9yMOyv6CmWws+8IYm9fx/12p2Xq/2k/SV/5w5OFfnI4jFkNGEJcSdYZzAg/+KWN
	 +CK+wHtpexMo1hYbB3fasJsYDmxaBSHTUVj5+6VD6YMb9tX1iCteOb2D5gat/q0Pns
	 klLQPVyPR7lNfMzV0OWv8JqGcMaesyHa1qhhO9IRFycI6rtN96iSu7tgG5rDwlQdkR
	 7hdg9gZNBmNeYmn6TQ0mY7FpB1bO2nzFyzSCQcXbqbzlCnDadDg9klsyOHlp6eZ1D2
	 TjzD/OXqZFCzQ==
Message-ID: <f1e28c8d-c30f-d80b-3d6f-fbfd3e55a64a@collabora.com>
Date: Tue, 19 Sep 2023 12:23:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 2/2] media: platform: mtk-mdp3: Use devicetree phandle to
 retrieve SCP
Content-Language: en-US
To: wens@kernel.org
Cc: mchehab@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, moudy.ho@mediatek.com, hverkuil-cisco@xs4all.nl,
 sakari.ailus@linux.intel.com, u.kleine-koenig@pengutronix.de,
 linqiheng@huawei.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org
References: <20230919095938.70679-1-angelogioacchino.delregno@collabora.com>
 <20230919095938.70679-3-angelogioacchino.delregno@collabora.com>
 <CAGb2v66rEqWBjdMNO3VMZhYj36hhKTxPk+9pborPjnqW0B-=ZA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGb2v66rEqWBjdMNO3VMZhYj36hhKTxPk+9pborPjnqW0B-=ZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_032402_573480_36385CFD 
X-CRM114-Status: GOOD (  23.19  )
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

Il 19/09/23 12:21, Chen-Yu Tsai ha scritto:
> On Tue, Sep 19, 2023 at 6:00 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Instead of walking the entire parent node for something that has the
>> right compatible, use the scp_get() function provided by the MediaTek
>> SCP remoteproc driver to retrieve a handle to mtk_scp through the
>> devicetree "mediatek,scp" (phandle) property.
>>
>> In case of multi-core SCP, this also allows to select a specific core.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../media/platform/mediatek/mdp3/mtk-mdp3-core.c | 16 ++++++++++------
>>   1 file changed, 10 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
>> index 8677e7fd5083..d93d3833633e 100644
>> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
>> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
>> @@ -254,13 +254,17 @@ static int mdp_probe(struct platform_device *pdev)
>>                  goto err_destroy_job_wq;
>>          }
>>
>> -       mm_pdev = __get_pdev_by_id(pdev, NULL, MDP_INFRA_SCP);
>> -       if (WARN_ON(!mm_pdev)) {
>> -               dev_err(&pdev->dev, "Could not get scp device\n");
>> -               ret = -ENODEV;
>> -               goto err_destroy_clock_wq;
>> +       mdp->scp = scp_get(pdev);
>> +       if (!mdp->scp) {
>> +               mm_pdev = __get_pdev_by_id(pdev, NULL, MDP_INFRA_SCP);
>> +               if (WARN_ON(!mm_pdev)) {
>> +                       dev_err(&pdev->dev, "Could not get scp device\n");
>> +                       ret = -ENODEV;
>> +                       goto err_destroy_clock_wq;
>> +               }
>> +               mdp->scp = platform_get_drvdata(mm_pdev);
> 
> You need to keep the original code as a fallback for old device trees.
> 

I haven't removed the original code, it *is* there as a fallback :-)

mdp->scp = scp_get() <--- new
if (!mdp->scp) { fallback }

Regards,
Angelo

> ChenYu
> 
>>          }
>> -       mdp->scp = platform_get_drvdata(mm_pdev);
>> +
>>          mdp->rproc_handle = scp_get_rproc(mdp->scp);
>>          dev_dbg(&pdev->dev, "MDP rproc_handle: %pK", mdp->rproc_handle);
>>
>> --
>> 2.42.0
>>
> _______________________________________________
> Kernel mailing list -- kernel@mailman.collabora.com
> To unsubscribe send an email to kernel-leave@mailman.collabora.com



