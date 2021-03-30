Return-Path: <SRS0=H7Ok=I4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48781C433C1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 09:10:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C74BC61968
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 09:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C74BC61968
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rRKtzSj9nji5QmHFOV9rTwDFtP+riax9Xr6YruJQzUc=; b=YD5qEQQP8yzMYGWIN0/ny88ov
	v6D2tLE9lTCLGwqVna/Td94zYeBYMiqBHhfJmFv8W+yZtkGxSpRrXHK/d1nOX6/c2Tun1k+EjzWgC
	PwRgVGZV27Os14FPefyLsZTRRGM66xqvU4j8bCc/pYCUkPxUhU2XvlgGarGqW7xvl31d6GAEhrhPx
	EnuUi6Xf+y/lKTOGj8bXbUefUexhOWiOUqZvhH4E/ljpKQyhO9/2lzzyVXnAJl8d5p5YGiq1qXA3f
	qbNdPXWk7a8W3ldQY+d+BUOVrQE8eS6VNYOIcUFuL4Pa5KE+r2HcEe/ohHeAy8Nch8s4R4gtov1P8
	WyGqMkiTg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRAOM-0039jg-P4; Tue, 30 Mar 2021 09:10:32 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRAOI-0039ie-Gw; Tue, 30 Mar 2021 09:10:28 +0000
Received: by mail-wr1-x436.google.com with SMTP id b9so15445952wrt.8;
 Tue, 30 Mar 2021 02:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=z5DCAj7NVDVNfpSZjWR8M5jLq6WPETQxdZhOG5sD1z8=;
 b=pqvv6KRbqK9UNpiG6OcQfbAr+R59ty+YH5DBQsdn8BnkaBlUPjH1FApi5Ei5VmlYyB
 zAO09LbALoY2NhIoKqNs7r5qYnslNkMOzBlTMB6ilpIy3wlXIFl76Rav0jvVmFA0SWif
 E5iIbhE4WmPWCM6pKrE2deGuEnLoxGxwztJGUVz1l+exyFTULlEIlHuQ+SE3hhnoPBaP
 UYZ/BAY/GCGLDXT5+ivGQuFlzf5TnqrUgtT6zCrcpX/0O+hjIduJhb35CcoA88K1krcU
 LMkWWzY3Tk/cQkItk7Nh0kJD8bnmvugq8ERnhrsAW4tuI92Q7SaDrk2uUrdYbi16tO3f
 Ux1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=z5DCAj7NVDVNfpSZjWR8M5jLq6WPETQxdZhOG5sD1z8=;
 b=nTzbYsp4qsBFAQ9N/BT8CBT0mU36O7MxFoecUoqImAXymq8G/LIIOlqizRthwDooGb
 km/RlsFUUhIgqKll6NJAJVMlS69oQKQpSyVQ5npa2zP0w5RbHoMvLlJ9VE6lqJvhNWlT
 CBAm7jSyShAGtEXxzu+VU1zhVHJ3uaw0nbksDlhZhLS+jmAl6Xk/qsQ1A9LhyFW72km7
 HVIkV4a4rd3KwiCYnElQyAtjbzjwLAi90H/xP8+WrW5bsqeqOA1Vbi50WwdeO1rZI72e
 KRpMO69XAtZn4IcjFiyDzXUhGLODCZDlhb5a8Vz3GOSCt9eNkkumBajzDy7v1cCWUfXq
 LEJg==
X-Gm-Message-State: AOAM532a7NuQydQyGSg8QnBcMoMbT+asFzH2fpv5SRGrtUmI7GGe3yBC
 N2U2alTTwpwihGFN3raqQl0Z2vf5llGko1Ea
X-Google-Smtp-Source: ABdhPJweDUo0yRtRVVcnq0c+GFxDoqdf6UE26XHvsMvMeuKxVRud5qkChQn9oQJZ4jqRpXO73KvK7w==
X-Received: by 2002:a5d:6411:: with SMTP id z17mr32243825wru.119.1617095425723; 
 Tue, 30 Mar 2021 02:10:25 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id j12sm33771727wrx.59.2021.03.30.02.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 02:10:25 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] soc: mediatek: Prepare MMSYS for DDP routing using
 tables
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: drinkcat@chromium.org, hsinyi@chromium.org, weiyi.lu@mediatek.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20210317181711.795245-1-enric.balletbo@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <9ae52157-c4b3-3080-6835-a6c4b349284a@gmail.com>
Date: Tue, 30 Mar 2021 11:10:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210317181711.795245-1-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_101026_802575_EF67EC0A 
X-CRM114-Status: GOOD (  19.06  )
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



On 17/03/2021 19:17, Enric Balletbo i Serra wrote:
> Dear all,
> 
> This is the second version of this series intended to prepare the
> mtk-mmsys driver to allow different DDP (Data Display Path) routing
> tables per SoC. Note that the series has been tested only on MT8173 platform,
> for MT2701 and MT2712 based devices we're using a default routing table
> that should just work.

That's a good base to improve the driver.
Things I'd like to see:

Split the mmsys_default_routing_table in the SoC specific one. But each SoC
specific routing table in a new header file.

Whole series applied to v5.12-next/soc

Thanks a lot!
Matthias

> 
> Thanks,
>   Enric
> 
> Changes in v2:
> - Use a default table for mt2701, mt2712 and mt8173.
> - Remove the mask field from routes struct as is not needed.
> 
> CK Hu (2):
>   soc: mediatek: mmsys: Create struct mtk_mmsys to store context data
>   soc: mediatek: mmsys: Use an array for setting the routing registers
> 
>  drivers/soc/mediatek/mtk-mmsys.c | 300 +++++--------------------------
>  drivers/soc/mediatek/mtk-mmsys.h | 215 ++++++++++++++++++++++
>  2 files changed, 257 insertions(+), 258 deletions(-)
>  create mode 100644 drivers/soc/mediatek/mtk-mmsys.h
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
