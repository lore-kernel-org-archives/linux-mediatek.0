Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7444C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 09:40:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57E8060F4B
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 09:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 57E8060F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=aV+4SUqOZwb5VIArDNGi7iZwMdGSY0GJtwjYRiNpIDg=; b=CwjbrkaCIBCL6IOQbU7c96Qqbc
	+TvSmQN24ZD/aapCIKzmdWvRRiqAzhdB0UBUsbqCi4l6+CT7DksRak5TVBwmqFrVAziUON1URqkST
	ZrtiTKy/Cja43gVs0a67em6qRZCHUeVBXkFbpkq8ouqc4HpEsmP3+ES0bgGdgtAWUDsWCx+4gfOul
	a5teQsfB4pdhN1fVRZFK3PILEOvdXphYNV2Hd8HQj0F4YqM4JtIj3DaW5YmfZcTUUodpro8zeWxt/
	lcOpeWdTivEKW/6mMTCkMVsW4kEDxGPbzFnxjMhIglGbzmqVvR1nHEpoZY1h8veKeBF1jvPfVg97+
	jIOibJCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLMie-004ws6-FI; Wed, 01 Sep 2021 09:39:44 +0000
Received: from lb2-smtp-cloud9.xs4all.net ([2001:888:0:108::2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLLwo-004fBV-4K
 for linux-mediatek@lists.infradead.org; Wed, 01 Sep 2021 08:50:22 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud9.xs4all.net with ESMTPA
 id LLwjmc8LmlQKhLLwlmI1c6; Wed, 01 Sep 2021 10:50:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
 t=1630486216; bh=L1Hm2aLkf3i/IjC5xIVHFEMl/4mMjYqCoTuVtImCZAk=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=qiqTv2u71ZnOwm2+AZqXSAbwl7OBbXyPotNF9UtraXTcDMSN2hlmT/yVajlvedDiJ
 3se9xFDNM/gATH+g2nlSrrZz08iWvLFI6XF57oA9spHF5vUv6PmHiiIMIgMmAaqFkh
 87A6fZ4t9T9vNAGRwlPAMwD/GIJimd4GlRFm9ML1nRX9OA7uvpWUAeEz8cway9KjPM
 5FkxNCZMNvr13xbKWkaSTF5BVaAhQg8cmWfVSe7gs9HGXSMEJnKEQKA2zuR8aDzU/9
 qp8WtFpCxwIb7WJRnh6ssTzOEvxJ437NIWqg1+BDl77gUsi+1bbaBdM/HvGXq3u4uP
 pvF7xygjFGrow==
Subject: Re: [PATCH v3] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Alexandre Courbot <acourbot@chromium.org>, kernel@collabora.com,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, dafna3@gmail.com,
 mchehab@kernel.org, tfiga@chromium.org, minghsiu.tsai@mediatek.com,
 houlong.wei@mediatek.com, andrew-ct.chen@mediatek.com,
 tiffany.lin@mediatek.com, matthias.bgg@gmail.com, courbot@chromium.org,
 hsinyi@chromium.org, eizan@chromium.org
References: <20210825101717.18075-1-dafna.hirschfeld@collabora.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <c1712278-8d18-2958-853b-09e5097ddce7@xs4all.nl>
Date: Wed, 1 Sep 2021 10:50:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210825101717.18075-1-dafna.hirschfeld@collabora.com>
Content-Language: en-US
X-CMAE-Envelope: MS4xfBTca500Lj6dw3wajxUQ5QRMAYqdwKA6ftnq1Y+n5E26TXacpH65KTGTNvyD+k09c/0JrPoIr71SZRlxb6lZxZGra1qADtYH1MCdnguL4xIPl8BO+QGA
 heq0ktLKmXuHsQ96m8ve5lrTG/7hnYIaH1l88rTKHxfbp3SdJ0RyB4zmNKoe7h3kFmAze0WB4T+lH52YsaOCkUp41mVq+ObemqYRpDX6lNo8hF0PUfxRRkAq
 SUC1oExH+1x84kzsw8AZuOV/Mlm99S7sO1d6ZedS/CKXzovEJASyTz4heQ64NlNiXt1u5OG1ybBNLsUzEZJH5yyl/T0aZMqtVqU9KJPtvagHfkxRCP/C9IAD
 dpjZv0Fqulz52N7TVe3ChRp7NZD2llLX9XbZtzwQrdpSeQOYt+ZLkTzNEF2sjk6w2nSkZaPE0wPSh+H1L8zB72cXS411WQH/kxEu5EZC6ExCHlSJdB1B6Nu0
 r+ReHqh6t7BBemDHGC5ZrJhPzKUfcvJX3AS1k1yrXgDIqzWc/3gSH3qPHLwtSpZ5d0xg3LK28So575fx17bCHqGSx4O22Z8Hd2KTBcgMEtiMfgDWLzPJ4v7Y
 7nKaCOBya9GeNJbEqqsFqsHRO+xpWFCMQSLfJMiwjSS31w7Lj70CR1VbNEeH/+DdjmbwrKVmzWaSCs7+WJXpeHchN4m/7MxvA7XKLf9XOtu3+s0yZVTUT6YV
 M03P2r8t0HNVBIvBuild8iO14JFR01471w+4jMTHsj8F/JZFuhDO6lCBubrS/O4gUz7+p/ObDbjbg8qgmEjxgo85H+IlT712MCM7luX5NPZ6EWFIFdSQS952
 Lg6Ox2Ta8+0cyL8WLYjexcdeEobC+gh8pabD1Ef9wvFZtfmxgmg2yKC4K4A+ik1H0thUZHL+2/G7xbwOTPY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_015018_408328_1297A3A2 
X-CRM114-Status: GOOD (  22.87  )
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

On 25/08/2021 12:17, Dafna Hirschfeld wrote:
> From: Alexandre Courbot <acourbot@chromium.org>
> 
> When running memcpy_toio:
> memcpy_toio(send_obj->share_buf, buf, len);
> it was found that errors appear if len is not a multiple of 8:
> 
> [58.350841] mtk-mdp 14001000.rdma: processing failed: -22
> 
> This patch ensures the copy of a multile of 8 size by calling

multile -> multiple

> round_up(len, 8) when copying
> 
> Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access to DTCM buffer.")
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
> changes since v2:
> 1. do the extra copy only if len is not multiple of 8
> 
> changes since v1:
> 1. change sign-off-by tags
> 2. change values to memset
> 
>  drivers/media/platform/mtk-vpu/mtk_vpu.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> index ec290dde59cf..658161ee3e4e 100644
> --- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> @@ -349,7 +349,16 @@ int vpu_ipi_send(struct platform_device *pdev,
>  		}
>  	} while (vpu_cfg_readl(vpu, HOST_TO_VPU));
>  
> -	memcpy_toio(send_obj->share_buf, buf, len);
> +	if (len % 8 != 0) {

You need to add a comment here explaining why this is done (basically what
you also say in the commit log).

Otherwise people would have to dig into the git log to figure out why this
code is the way it is.

Is len often not a multiple of 8? If that's the case, then it might be easier
to just always do the memset/memcpy.

Regards,

	Hans

> +		unsigned char data[SHARE_BUF_SIZE];
> +
> +		memset(data + len, 0, sizeof(data) - len);
> +		memcpy(data, buf, len);
> +		memcpy_toio(send_obj->share_buf, data, round_up(len, 8));
> +	} else {
> +		memcpy_toio(send_obj->share_buf, buf, len);
> +	}
> +
>  	writel(len, &send_obj->len);
>  	writel(id, &send_obj->id);
>  
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
