Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3711C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Feb 2022 08:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CGl7lMoDFn/RohTvt8ypPSUurTtXoDdg+kajfZD9E3A=; b=J6vW8OyVItys2f
	BciuSgCrnCjavh2VN8VZALhGNkiw3kXuXGcrxpJxrPJODEspO4Ar8oKCXHwjhj+CeM4LMDEe0vATH
	hry5xcRGGKelFrlkoEwWFVXpg+gWWki4czNNrg9u5kT1bH2ruGP8pQUkuQr9a1CT8sAlWxKvWijTV
	X7REHqT1KsZ1dTpxQAQuzNxXK2lBa5U7FAve58X7YWYVO6SL/Mb9J4VkyUC1nCGV1FaIVjMPeaD2W
	yvM7mLOqpVcPNluOrYQi9VI8rzkiAnSJPfFNrVcifwdy7jzDsNsO9J2JSKOgGcjSEcnZsC7EvtlQj
	JSKLcTknsbL9Cb63UzGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGzrj-009SYY-3j; Mon, 07 Feb 2022 08:59:19 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGzrg-009SXc-Js
 for linux-mediatek@lists.infradead.org; Mon, 07 Feb 2022 08:59:18 +0000
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6B0D63F324
 for <linux-mediatek@lists.infradead.org>; Mon,  7 Feb 2022 08:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644224355;
 bh=oEjed3fIhq32IMOHlcIF6oQTrZpj51jzYKSbl17Ied4=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=i1uXWK8DdE7DfM0tbjZ00M5sPGlKfgzZxbIb8MoWK4rkimkBJ56amV7964qOFP/Uj
 FOSXUTOszZHzxuRs+CzQnK9RPrre6qmWnNLLWBlf77ELCuAIL/A///TpkOKowBKiEk
 WP37Hdoqk1cI49miuyJXLgmCMtjuqLDwoxsDyx3R7wWLvob77lOjJ1lTIIMqepUqON
 bD05XeqP3sLzQqeS9hG3UPzfPQn6Q+pRjiLBXgZSJ8GXytTmSsdV5nUzEv7tyHtnBb
 R4vW3Qy238mzrx8mrXA3uZJlKhkFQHg6HE+fi9BFKpzcvSnh5zkwjfHqIm8ocmc7TE
 dp0fvAoaLSHRA==
Received: by mail-wr1-f69.google.com with SMTP id
 e17-20020adfa451000000b001e3267c9e9fso391300wra.9
 for <linux-mediatek@lists.infradead.org>; Mon, 07 Feb 2022 00:59:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oEjed3fIhq32IMOHlcIF6oQTrZpj51jzYKSbl17Ied4=;
 b=j3oOs7lwDv6licv7okVophXzjN+m6kWcGpVkmfOuYm8yBzHD/egvNndbquMNXZh6uP
 iSvTAWGVfwMVBpS5VkYKe2xu7718dAoD8hy7ffYHnM5WwuknpyIQoK76SuSu7/mVc4Ui
 y/edGCXReHlH19rvQz4JX0EN4wx9sLPQ+Kk49+m5hrT+x/47mCXyZfJtWclnAvjiCnR4
 CYSGUU3nR+n0O80akMrbnIuVjqT1FwY8fUTl9deQWq6ndCzqZXBNoeBM8x0stAcat2n1
 SJUw+B8ooEo2q9jKFLJ5hR7R2UFwc7oSrom+JF6y4bLwOxwAwj5PCycGhTtlU/MGo9GK
 4ojQ==
X-Gm-Message-State: AOAM531nc/V4Vn5b3OLFJmVD+26eTroioMQMYrbx082Wrklh1C+Vs+dd
 GiGxr16NBZ/FBIhdRPmoOTL9UgU+cwvZ0YRzOsXAfTd/DQU5q81vv5s1FSQ+NDgSyIfSGy+XlT7
 Z2YHWg1op3paoq0Cc69eAzG9baJMZjn0Iof+gkf4EHuDOu0kTMw==
X-Received: by 2002:adf:ce85:: with SMTP id r5mr4374611wrn.343.1644224355131; 
 Mon, 07 Feb 2022 00:59:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJweatKPbt15m4IWLQ+h0RfaFNSWZUextgkIqFhmsrO4tXSQ63YIb2/Ah2vi0QdAf43JWVr83Q==
X-Received: by 2002:adf:ce85:: with SMTP id r5mr4374592wrn.343.1644224354917; 
 Mon, 07 Feb 2022 00:59:14 -0800 (PST)
Received: from [192.168.0.86] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id u11sm3197884wrt.108.2022.02.07.00.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Feb 2022 00:59:14 -0800 (PST)
Message-ID: <4cf27630-31b0-c9f4-ee86-a33ebc49afe2@canonical.com>
Date: Mon, 7 Feb 2022 09:59:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] memory: mtk-smi: Enable sleep ctrl safety function for
 MT8195
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 yong.wu@mediatek.com
Cc: matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220204125543.1189151-1-angelogioacchino.delregno@collabora.com>
 <6c360daa-151b-5bb3-5c93-17f90cb693a6@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <6c360daa-151b-5bb3-5c93-17f90cb693a6@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_005916_824291_26A3D036 
X-CRM114-Status: GOOD (  21.06  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 07/02/2022 04:12, Macpaul Lin wrote:
> On 2/4/22 8:55 PM, AngeloGioacchino Del Regno wrote:
>> Enable the sleep ctrl function to wait until all the queued commands
>> are executed before suspending the LARBs, like done for MT8186.
>> 
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/memory/mtk-smi.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
>> index c22acd3ddd10..86a3d34f418e 100644
>> --- a/drivers/memory/mtk-smi.c
>> +++ b/drivers/memory/mtk-smi.c
>> @@ -351,7 +351,8 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt8192 = {
>>   
>>   static const struct mtk_smi_larb_gen mtk_smi_larb_mt8195 = {
>>   .config_port                = mtk_smi_larb_config_port_gen2_general,
>> -.flags_general            = MTK_SMI_FLAG_THRT_UPDATE | MTK_SMI_FLAG_SW_FLAG,
>> +.flags_general            = MTK_SMI_FLAG_THRT_UPDATE | MTK_SMI_FLAG_SW_FLAG |
>> +      MTK_SMI_FLAG_SLEEP_CTL,
>>   .ostd            = mtk_smi_larb_mt8195_ostd,
>>   };
>>   
>> 
> 
> Reviewed-by: Macpaul Lin <macpaul.lin@mediatek.com>

Thanks for the review, appreciated!


> ************* MEDIATEK Confidentiality Notice
>  ********************
> The information contained in this e-mail message (including any 
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be 
> conveyed only to the designated recipient(s). Any use, dissemination, 
> distribution, printing, retaining or copying of this e-mail (including its 
> attachments) by unintended recipient(s) is strictly prohibited and may 
> be unlawful. If you are not an intended recipient of this e-mail, or believe
>  
> that you have received this e-mail in error, please notify the sender 
> immediately (by replying to this e-mail), delete any and all copies of 
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

Please work on your email setup, so we won't see such stuff. I know it
is autogenerated by company systems, yet still it should not be put in
public discussion.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
