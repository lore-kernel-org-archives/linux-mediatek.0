Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 344DBFA3740
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 12:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xVJodACOlUyVw6jJB0o/QffeIPQi24/sF6MmyMfBvgg=; b=m0thRHulbNEGopEZKEU5LjmkOm
	EvwgwxJZnQnnqrEwCNZhQB6Av+z8SZP/v2WryWDHZdEhjCOPFbL1QAsAwKtPe7BKHplwcXLDtoXvm
	MMyGq2by773wGe3L23ZpuLZqCHGYslvhA4JxmFiucRbS6Hl0yD8NV/av1MVCTVl5FMnMMlmiqu2SA
	kokfLtTfUrwPENLKZ5hwM5xjEbRzk5nX8x27FtUiyzQn7I41uYDxLQrqfjp/pQaHRSE+0dLuCOK1l
	Smj/3QiPFBvsqyTaQ/ZwiRWxJrmfF9rG3mzlOOzG7z2DEmz4yQGZEekcEyFbIc1O6qizMLqz09lxs
	BQM3QIwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opToL-00BdCZ-4m; Mon, 31 Oct 2022 12:22:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opToG-00Bd8h-4l
	for linux-mediatek@lists.infradead.org; Mon, 31 Oct 2022 12:22:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667218951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xVJodACOlUyVw6jJB0o/QffeIPQi24/sF6MmyMfBvgg=;
	b=LZ4iXvdkRSSwkC6apyzAdTE8vF3QQ8owH6QCB57lkWvCyos/FF+9T35r8khEDMVIPjQUXX
	Jamq4TFx75i0k9FitLZaCSsEvhq/plCmP1Pw4/treV8AYzlSGM6v6lO4a2+iN78m2eDoiS
	LgYw2fpZWsrhxO/N0xfmnMbqbK+ZG6I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-360-UW_Neb9QNwClGBNRnhvpig-1; Mon, 31 Oct 2022 08:22:28 -0400
X-MC-Unique: UW_Neb9QNwClGBNRnhvpig-1
Received: by mail-wr1-f69.google.com with SMTP id g4-20020adfbc84000000b0022fc417f87cso3017523wrh.12
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Oct 2022 05:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xVJodACOlUyVw6jJB0o/QffeIPQi24/sF6MmyMfBvgg=;
        b=foDgwqGDnss2MXp/KqYhX8+Ju+EYkcG0kBJrxGjZ218O4N9YC/Sr+Sy37Ik7VokxTE
         sIiOPEpBKVK6hH9zf/V5Ggbecmc5WwHSZ3ji5J634GDtguK7oV11is7+kDGpBorS481Y
         cunlkZ+7pgMLsQAZDPI79lM5n7zhOfYTF1XREHGLcgZ0bCOGafQVfCmcy9PQgFzemUV1
         ipzE6Udzf1sZPnfLFoYCePCd6/eU0aIjQaeemu4FsOXg5JDa9jukxayzTh5R5tlUmHlp
         fBq5hSsBtRjZ5bmnB2ccfCKeKplSMuzW2hXZBptzKOFFME+P6iE1g5EryuPmUTiDdQzP
         +Ayw==
X-Gm-Message-State: ACrzQf0wP5rh++9DKkPrKhb/Jkn6SpliSG8xDE4UY54jVmhtsQxTQVYB
	RH00pNaRKLtpmJwCx75GbTZbnYIIt4obSUtk9Z68b4l1jukfyNHBJRH7lva7W4LlOOvBRlU5bUv
	0DEHLLU/qe46kU8bASZe20B0omxfMQNPO
X-Received: by 2002:a05:600c:46ce:b0:3c6:f274:33b2 with SMTP id q14-20020a05600c46ce00b003c6f27433b2mr7860194wmo.27.1667218947042;
        Mon, 31 Oct 2022 05:22:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4zVdpLNc1mYDp74XAWVtjpPddzcwMDONTh4D+G0X15w3fKqsphKr/pP9hn5PrcknLAkhJ5Mg==
X-Received: by 2002:a05:600c:46ce:b0:3c6:f274:33b2 with SMTP id q14-20020a05600c46ce00b003c6f27433b2mr7860165wmo.27.1667218946788;
        Mon, 31 Oct 2022 05:22:26 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id f16-20020a05600c4e9000b003cf568a736csm5157904wmq.20.2022.10.31.05.22.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 05:22:26 -0700 (PDT)
Message-ID: <ea046b06-fb0e-b7c2-8f70-b299401d9adf@redhat.com>
Date: Mon, 31 Oct 2022 13:22:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 10/21] drm/tve200: Include <linux/of.h>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-11-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-11-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_052232_407222_EB5D4D97 
X-CRM114-Status: UNSURE (   6.57  )
X-CRM114-Notice: Please train this message.
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

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Include <linux/of.h> for of_match_ptr().
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


