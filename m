Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431A8C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Dec 2022 14:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjZvuZKXxzFJRZq3j75PnAQGUgw8cFsM3I4S8oUerK0=; b=H1zV1G1NaEJMpkok01laFvVd8J
	hwSFKt9rSk9Yedkjp4AQBP1TrkBuJ0ZKX2IZs2rZcbl3ku1HVB95XqXMlgXuTsdKQrBTHOikcCGUt
	eidKm0OZ3p7OQX6YisHO1ergnP4AsKu6KL8s/EWmKNy89Brm/3IdTyBcPwsmMY8cxmxGoz0ckJgfY
	JeXLyjJW4ybcYRjLWo+gxlhePIrWVv73IAaO8ro7rH1H2rahenN5zFZZLCCIGH9d5krkr+2jnqLGu
	SkE+xCCWhld7I++rnOEf+UlvXbEzaAtLKEGoyWqG9jq9TBH38ZrvbwUhWFEJseMipF6jXOfDjlcz4
	UDnxNIzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7dxp-00H0gO-U8; Tue, 20 Dec 2022 14:51:29 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7dwu-00H0Ig-5b; Tue, 20 Dec 2022 14:50:33 +0000
Received: by mail-wr1-x42d.google.com with SMTP id h16so11924352wrz.12;
        Tue, 20 Dec 2022 06:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OjZvuZKXxzFJRZq3j75PnAQGUgw8cFsM3I4S8oUerK0=;
        b=WeKBmMXkUslzNxtSl6xTWfys/L0DO0+UMz2LRHCQAQYGrsz2BBNvQt8vKMu96DAo9q
         xvKkCWuB0tULogMjegQmkUADXcLST3yFJga1+5MXRKp5XSkiSH58ERtX6pFouLpnFHxn
         SPXQCgRDarI3pgV8Nl58IS0adEHjPL+0GwFUw6J65qosRLkir1LtI4qUecSPwsRy1wcm
         OtkLGwZglNOSxNpp5XW07h7g4gCYrspHFABL1Q+xlxBxrXAv+y1RtdWvlkIebIYVbhEO
         HE5EkduLREZPmvj2mwAIIqGkcAHYAQsR+OdOuYPJalEig1ZD4/w30qDKAAD+VWGO+T5U
         3xyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OjZvuZKXxzFJRZq3j75PnAQGUgw8cFsM3I4S8oUerK0=;
        b=PAN86F3yxkjxGswlSdMZAE+g/QSrNiYMr9BBdWellzsvu+2vlllFlghllWg83zRMyN
         FPoeSzpEVbSqCcDzzbC/qLCKP2aMNHZrvqaUiUIKiCGIxjgTUNQlFsWw9F6TL1a+Nw8v
         UQ+J1n3OB7GNLVf3vF3uDhWpoCMlrC0b/Vd13AhAFbJHvuSAqnndsSvnSBluJV52GEOQ
         Z/8vMD7r3egFlxpANbWZERdfiUM1lm2C1ICc1TXaY95zAMviwJgRKxLZ+cNPZrPLpcBt
         WtbetfxyLNkV2bykFv8xrr/avA7bbjOtQrXfgcsjitwqGKzNAVApAViak/68TACGY6K3
         yglg==
X-Gm-Message-State: AFqh2krq3k0mu9DTz692QaxzUbl94Ua8FA3j+mKriGh/lDQIXNLgPOWi
	rpGEb8hQFrB33fEIu91Mxgs=
X-Google-Smtp-Source: AMrXdXsRXdqhXHnX5GaEcKChWQBEkh2vtqo9tt4aSVQrTqMRw9a6fhOSpxHrDn1nBpfr/5ne00KT+A==
X-Received: by 2002:adf:a554:0:b0:248:ab8a:5144 with SMTP id j20-20020adfa554000000b00248ab8a5144mr1823739wrb.63.1671547829189;
        Tue, 20 Dec 2022 06:50:29 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id b13-20020a05600003cd00b0024cb961b6aesm13171989wrg.104.2022.12.20.06.50.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Dec 2022 06:50:28 -0800 (PST)
Message-ID: <e0d3f5c7-6f6b-ee21-170c-51e5240de114@gmail.com>
Date: Tue, 20 Dec 2022 15:50:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] soc: mediatek: mtk-svs: Enable the IRQ later
Content-Language: en-US
To: =?UTF-8?B?Um9nZXIgTHUgKOmZuOeRnuWCkSk=?= <Roger.Lu@mediatek.com>,
 "ribalda@chromium.org" <ribalda@chromium.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
References: <20221127-mtk-svs-v1-0-7a5819595838@chromium.org>
 <d683a2e7-b886-9bf6-27df-d8c67cedbbdd@collabora.com>
 <b8b14bcb-845f-aa18-f8aa-ad0bed9fb0bb@gmail.com>
 <52fb6ccf3fe1cb11f3e330ecc4d9c6cf1225c98a.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <52fb6ccf3fe1cb11f3e330ecc4d9c6cf1225c98a.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_065032_236961_98BC7666 
X-CRM114-Status: GOOD (  24.42  )
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



On 20/12/2022 12:03, Roger Lu (陸瑞傑) wrote:
> Hi Matthias Sir,
> 
> After applying this patch, SVS probes fail as below on my MT8192 platform. If
> thing isn't too late, please do not merge this patch. I'll ask Ricardo how to
> reproduce this issue and give the correct solution. Thanks in advance.
> 

Ok, I just dropped the patch from v6.2-tmp/soc branch.

Regards,
Matthias

> #MT8192 platform SVS probe fail log
> [   10.209430]  SVSB_GPU_LOW: init02 completion timeout
> [   10.214402] mtk-svs 1100b000.svs: svs start fail: -16
> [   10.219479] mtk-svs: probe of 1100b000.svs failed with error -16
> 
> Hi Ricardo,
> 
> Could you share us how you reproduce this issue? I have MT8192 Chromebook and
> can give it a try to reproduce the issue you encountered. Thanks a lot.
> 
> Sincerely,
> Roger Lu.
> 
> On Fri, 2022-12-16 at 13:47 +0100, Matthias Brugger wrote:
>> 
>> On 30/11/2022 12:00, AngeloGioacchino Del Regno wrote:
>> > Il 27/11/22 21:22, Ricardo Ribalda ha scritto:
>> > > If the system does not come from reset (like when is booted via
>> > > kexec()), the peripheral might triger an IRQ before the data structures
>> > > are initialised.
>> > > 
>> > > Fixes:
>> > > 
>> > > [    0.227710] Unable to handle kernel NULL pointer dereference at
>> > > virtual 
>> > > address 0000000000000f08
>> > > [    0.227913] Call trace:
>> > > [    0.227918]  svs_isr+0x8c/0x538
>> > > 
>> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>> > 
>> > Reviewed-by: AngeloGioacchino Del Regno <
>> > angelogioacchino.delregno@collabora.com>
>> > 
>> > 
>> 
>> Applied thanks!
>> 
> 
> ************* MEDIATEK Confidentiality Notice ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including its
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or believe
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

