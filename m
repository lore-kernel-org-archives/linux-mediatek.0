Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B47D0E6C6
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Nov 2025 11:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JUh2PC+WK5zSF1iTYOPWPX3v48DEx4xDHnT5tg1qF/I=; b=NueNxuNbe9BFfU
	5AXGtXI/RqvpOuxu3qcG16dhPUsEzvvi0QKWUMfk3gMf0k12p44rTki7ndyJNWzz1U9tfOw98APkw
	/J6fvKE6H+FXf4mHkfMjJeU60qbCtTAbwTgEQmMzUFSGxkTH2DYilOU0iWjiSKjM+CTCu0FdyYu+Q
	Pq75fipgYrSbHLcZRIY5qWehf3TkPc+WSuRmiGq92roYPj2/J1EAwKrIr7V8PbCADrwP8Dvm7DXx5
	7NCzQWQKi2pgcWF4YBWLVxbMlfRgfhXVqadJcrHvgEV0sRcHnyE0QKfDCme/6e5rmEytp4wPZBGd0
	Jq6rtOGQPfuFTUYvKvew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNquu-0000000DBUL-1UtL;
	Tue, 25 Nov 2025 11:09:04 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNqur-0000000DBS9-2sj3;
	Tue, 25 Nov 2025 11:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764068939;
	bh=Ncc5CuNSCRB/UuJ5dRZNzT+XwsBAJ0RKRhvqese24KI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cBP91YTm3gUBT/0LvNQm69Cfb4fVet+PX86t57DJqyUtxyTZ4a2u+tCpDmHOXB+Tb
	 174vbUE/dw7ex+0Oum1XLHsL+QGlcncPNMCtxvqY75/7DOkds4dmglPP14Jkf9rvAe
	 KX9pfxlIaUSN4xZQjIU1F3fsqcDICDbwF7wDxbKYOPpbxIxmnzSdsXilUCxVS0Ywhf
	 U0SBTN3M5oCu1SFmbRWQdNa4DFO/xyHV7a6fnMOHRRlq6O+guJA1rm9r9FKkfw4AP8
	 li4Tta4VXB1ZG8DuxgI4wuXQ7t1haLBcIUUDhpUEBJnPdIecJmTFu7+9/BzYcmQC8+
	 hWM6+pEd9v5/Q==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:657b:ae76:a0f8:4811])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BF03917E0AC3;
	Tue, 25 Nov 2025 12:08:57 +0100 (CET)
From: Laura Nao <laura.nao@collabora.com>
To: daniel.lezcano@linaro.org
Subject: Re: [PATCH v4 3/9] thermal/drivers/mediatek/lvts: Fail probe if temp_factor is zero
Date: Tue, 25 Nov 2025 12:08:48 +0100
Message-Id: <20251125110848.23483-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <190003b6-2931-406a-a8f6-ec8909c65162@linaro.org>
References: <190003b6-2931-406a-a8f6-ec8909c65162@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_030901_880176_B748B850 
X-CRM114-Status: GOOD (  16.81  )
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
Cc: andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, laura.nao@collabora.com, kernel@collabora.com, bchihi@baylibre.com, robh@kernel.org, nfraprado@collabora.com, wenst@chromium.org, rui.zhang@intel.com, colin.i.king@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, arnd@arndb.de, linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org, srini@kernel.org, rafael@kernel.org, u.kleine-koenig@baylibre.com, krzk+dt@kernel.org, lukasz.luba@arm.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 11/24/25 18:56, Daniel Lezcano wrote:
> On 11/21/25 12:16, Laura Nao wrote:
>> temp_factor is used in lvts_temp_to_raw() and lvts_raw_to_temp(). If
>> platform data is incorrect and temp_factor is zero, it could cause a
>> division by zero. Fail the probe early to prevent a kernel crash.
>>
>> Signed-off-by: Laura Nao <laura.nao@collabora.com>
>> ---
>>   drivers/thermal/mediatek/lvts_thermal.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
>> index 1c54d0b75b1a..b49441d82ffd 100644
>> --- a/drivers/thermal/mediatek/lvts_thermal.c
>> +++ b/drivers/thermal/mediatek/lvts_thermal.c
>> @@ -1346,6 +1346,11 @@ static int lvts_probe(struct platform_device *pdev)
>>       if (irq < 0)
>>           return irq;
>>   +    if (!lvts_data->temp_factor)
>> +        return dev_err_probe(
>> +            dev, -EINVAL,
>> +            "temp_factor should never be zero; check platform data.\n");
>> + 
>
> From my POV, this is not really useful. The temp_factor is set for each version statically in the code. The scope is limited to the driver, IOW it is not a parameter other subsystems passes to the driver.
>
> If it is NULL, then shame on the submitter who did not test the driver before sending ;)
>

Ack - I'll drop the patch in the next revision.

Thanks,

Laura

