Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D193DC636D7
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 20:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FC7A22kDDKm4iFJZCz/SFv4XLBhZwuNgB26sBiqqUIk=; b=CCfr5Dlt3w7E1GrZiiH9CSL9Tj
	ugqipk9dM8ue7Alv4XM2zyhxEwK6T5EXs5a8cKy3nNWSl1XOUHBUya/JoMH4afReIjT8hJ5rfXybc
	l2Fh4YvuuqOVgalaGLkmWasYrqW/wHh2EKPpSSkXcM18d7tI47YhvTDSQ+Fm0jQXRJJQdZuArhYjA
	gMvAdxp1Y+WEbVxEM2gF9bXPzHQDcJo3DISHnHy/0FKetluDdt8IPItG8YNQFEb6THq13JhfSyBxv
	v657djEn5jjjaqQieFcZbkiNMzfELsykHQV94UR4APRhsRzS+l9N+ka5DTRXzDJ6UU/BKpwk3NXhU
	jHYyggRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNg0c-00H8cB-VQ; Thu, 02 Feb 2023 20:16:38 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNg0a-00H8b6-T3
	for linux-mediatek@lists.infradead.org; Thu, 02 Feb 2023 20:16:38 +0000
Received: by mail-wm1-x334.google.com with SMTP id n13so2324901wmr.4
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Feb 2023 12:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FC7A22kDDKm4iFJZCz/SFv4XLBhZwuNgB26sBiqqUIk=;
        b=MA3Uv8wS1+3DfUVRaW3sli5xx3tew+Vf3aZFl8o8QYZjElxZKMVhA3hH2qpWufFiQN
         jjRThM+SFIestcZqSB1+s8zMREhlgzoTSLS1XG3DXoubsXZZG0A1Zwt6wgGOMH7XzzkV
         pKmK6pOpsSC+94aqLczscoJiglLCZgqzk8qY4y8M/Wd0xFABFzwKvxTdVUiDJYyygLG2
         iXqfczRdt7b+q5i/vMa8cjehZoG0+0ZJQfkUUI6y4e/cV11XJs/jn+mJHoXNt519rf+e
         +Nd461aBv2am+/BeVW+k+APqja/cZY9+az6N0d5EMdUbGYndy33QCBC/DOWjNORGIZwq
         SrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FC7A22kDDKm4iFJZCz/SFv4XLBhZwuNgB26sBiqqUIk=;
        b=suAM/IozP633PfR5hldTCIpsmDxJvmeTOJbcU8YltfR8f0+Z/ZQpH8Q/a/3xEP2f6y
         PtHk/S/OdwRK8k/LrPHBTUrLVr8qULLysqhgRd3kKg7caxutq2eQxURfUnHSzZCrsPM6
         Xb4LN7aU+sNYMldsIb2BRtpIrJb3Ufu9CmnOuKUeq5II12DFZ+2l/Nv2uXhNNfapVp7Q
         GIDwSywUG1wQdA98rA6qvl1ja+3kWnJj2b9JqDVVxmPNm+7Nbhr2XKcyuMe7XNJxIwOx
         vf0QkPdKOh8Vp5DhIwa59Fjt8mq/J9RKyXl7zC+jqkN3z2YWVtXMQGoIiqJZ4NoeKvEV
         tGuQ==
X-Gm-Message-State: AO0yUKWj85ECEK5ZVhzLH7KArASsbh7cEZmRidRzrvVL3I6EU3i3IybC
	KNq4XVkqDye/3IdHhktazew=
X-Google-Smtp-Source: AK7set9RCCOggsVsOTU+HQYsqzAOze3x49AbZ1gunvi2oPWfSNFOc6BFqCq2Z8l1VgPzLVxLZAGyPg==
X-Received: by 2002:a05:600c:1c22:b0:3dc:37d0:e9df with SMTP id j34-20020a05600c1c2200b003dc37d0e9dfmr7221240wms.14.1675368995175;
        Thu, 02 Feb 2023 12:16:35 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id w15-20020a05600c474f00b003db0bb81b6asm887846wmo.1.2023.02.02.12.16.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 12:16:34 -0800 (PST)
Message-ID: <15711c23-43c4-86c4-0f56-4a76b5ffea46@gmail.com>
Date: Thu, 2 Feb 2023 21:16:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/3] drm/mediatek: Refactor pixel format logic
Content-Language: en-US
To: Justin Green <greenjustin@chromium.org>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 angelogioacchino.delregno@collabora.com, jason-jh.lin@mediatek.com,
 justin.yeh@mediatek.com, wenst@chromium.org, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 daniel@fooishbar.org
References: <20230201170210.1253505-1-greenjustin@chromium.org>
 <20230201170210.1253505-2-greenjustin@chromium.org>
 <e96bd735-cf36-0dbd-cf93-446c1ab28778@gmail.com>
 <CAHC42Rf8+yS45VBUc_dDuvCydg4ttKYuGwdgFshZRUZWzGiXRQ@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAHC42Rf8+yS45VBUc_dDuvCydg4ttKYuGwdgFshZRUZWzGiXRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_121636_984906_64760341 
X-CRM114-Status: GOOD (  18.53  )
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



On 02/02/2023 19:59, Justin Green wrote:
> Hi Matthias,
> 
>> mt8173_formats are the same as the old struct formats. Maybe we should use that
>> and only overwrite where we actually use a different array.
> I think this was sort of how the original patch worked, but we wanted
> to add some flexibility to allow different components to support
> different formats. In patch 3 of the series, we actually overwrite
> this field with mt8195_formats.
> 

Yes, I had a comment on the naming in that patch. Never the less, I think if we 
don't need to "overwrite" the value, we should use just one struct for the 
values instead of copying them to the different .c files and give them SoC 
specific names.


>> Why can't we use ARRAY_SIZE(formats) here like we did before?
> I think ARRAY_SIZE is just a macro for getting the length of
> statically allocated arrays. Because we won't know until runtime which
> list of pixel formats we will be using, I'm not sure we can use that
> in this circumstance?
> 

You are probably right.

Regards,
Matthias

