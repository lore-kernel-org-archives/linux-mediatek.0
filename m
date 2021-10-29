Return-Path: <SRS0=A00R=PR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40788C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 19:16:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0243360F02
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 19:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0243360F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kHVjnb0qN2CjCOPKQbzRekDbJxBthOtZVBypTfO0Lzs=; b=RMW38yCQhy7z2ajMWPlPyo37XG
	gv2Bj5NaN5JFQOgR/HPIkEbchBWxKA6synMu4LQa1JfC0j1N/cR/n4Bvg0ye9N8ACHNDTWXEzaMjp
	kml3siVnI0wWi6t3HIZc5L8V5eY9ktwpEy7Z4+s1PKHCv00ngG5jG3yiIYGbX58v7vk/ZS5vrJlVU
	bJcfqiH9RrviQ3fXbd1BCnsF9TwUQLQblyxwBtd5fq878rBAWFyTW9JqJEYud0pwbL1EJDSmuucoJ
	RyQS7xkv1gnZ9dK0QKt+k2R1NGSvgUiXZtyJGLF6elVw1m9t9rfhdoH3xCtBe3shbYKGZ2y3BJTwd
	05HHoJ5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgXLv-00BwlS-S1; Fri, 29 Oct 2021 19:15:47 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgVnK-00Bbm5-QM
 for linux-mediatek@lists.infradead.org; Fri, 29 Oct 2021 17:36:00 +0000
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AE5083F1A4
 for <linux-mediatek@lists.infradead.org>; Fri, 29 Oct 2021 17:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1635528948;
 bh=jvV6mA1s9hOJyCsNlRY4ar4PhiLrM2nEHfaCHa+wtwI=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=TRysrsLPHcqxR7esUa3LCDjvbaubjeiqZ6WhCEwJ6BQ0wKTOSPvgk5KTWdWLkTIXB
 7uMoJCNebomP1t9ULSm65wxOAl3Iv0QSNXCZ1bWzpUrDozA5sHBsgEHmbWnPdIIGHx
 T7xxE/+Prs6cNpEyp0d7fyaXNYJl3Cs0UkGwaqhgFSQeP9FtTqz18Puk/6kGMvIJh+
 mvWqfm+wDECuVmtbTPFN4FiXhCYkRLcvL+wfo1F70V0c6QX76082i7VMtqPW7Hf68y
 8/PuD0wHANpL4+2eqErNbYKdxUqrc8z5D0pBtnVd7hWwtQhv09rPXEZFhR8wNHowNB
 A+nvVjjcDXd9w==
Received: by mail-lj1-f197.google.com with SMTP id
 v13-20020a2e2f0d000000b0021126b5cca2so3388866ljv.19
 for <linux-mediatek@lists.infradead.org>; Fri, 29 Oct 2021 10:35:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jvV6mA1s9hOJyCsNlRY4ar4PhiLrM2nEHfaCHa+wtwI=;
 b=g7epgwZW5MwIML6bCZUKkiExiYhB3G5CCakZyGBtW0oJE6iajV8rpyC7f7g2k/CAKI
 1zWpmmopQ4u2bww+SFhhi2Ele7IHn1jowFPbm3Hj0NPNHoq375BEkJlC97WL+kxTWlie
 HVjAMsztPvypur8wq3pvvXklQjqwS7blyTEa6IglzOAfwVRC01CPtkqje6Ht77JKyHxk
 AXOx8HbUhgBcJTwnsIfb+Tnce09dYqJR8sXkYn9qHOOK7r7+NKjbBXEvyb0bhNa/mNuq
 djph2MhxHVX/Yzsw0JgAzyIU8JK8w4L6viWiAh7O8nTw1pkYPYDmkdP78jWMoM6zBLof
 NafA==
X-Gm-Message-State: AOAM532chRlBr0ec05ER8idjbOvBry4J9xUB44gpjmzwX5ngZqRtiu3P
 BSdnFAva7jTNxeYc5unOP65uBfkS3T7RhgOFOODx2d4F5HL4gR8UivMvKi7RkcdmVxIDqv+DvKn
 n56FKY8Rlr7gg+oOomQ8BwxNtTQ4OLQJ40HiaSDI649mDS3qrPg==
X-Received: by 2002:a2e:7617:: with SMTP id r23mr12947364ljc.187.1635528947892; 
 Fri, 29 Oct 2021 10:35:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBv6+kvbnDwAjjNuXfYL+0ezjFAhs3r2BkTi8MNivnnR7id+AwsxbYbbuG2Mbqzl68kUEMrA==
X-Received: by 2002:a2e:7617:: with SMTP id r23mr12947326ljc.187.1635528947569; 
 Fri, 29 Oct 2021 10:35:47 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id s4sm182963lfi.180.2021.10.29.10.35.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 10:35:47 -0700 (PDT)
Subject: Re: [PATCH] memory: mtk-smi: Fix a null dereference for the ostd
To: Yong Wu <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, yi.kuo@mediatek.com,
 anthony.huang@mediatek.com, Ikjoon Jang <ikjn@chromium.org>
References: <20211028055056.26378-1-yong.wu@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <23b036d1-bdc4-da55-a800-03fc3dabd48e@canonical.com>
Date: Fri, 29 Oct 2021 19:35:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028055056.26378-1-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_103559_061889_4B2CD8AB 
X-CRM114-Status: GOOD (  25.93  )
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

On 28/10/2021 07:50, Yong Wu wrote:
> We add the ostd setting for mt8195. It introduces a abort for the
> previous SoC which doesn't have ostd setting. This is the log:
> 
> Unable to handle kernel NULL pointer dereference at virtual address
> 0000000000000080
> ...
> pc : mtk_smi_larb_config_port_gen2_general+0x64/0x130
> lr : mtk_smi_larb_resume+0x54/0x98
> ...
> Call trace:
>  mtk_smi_larb_config_port_gen2_general+0x64/0x130
>  pm_generic_runtime_resume+0x2c/0x48
>  __genpd_runtime_resume+0x30/0xa8
>  genpd_runtime_resume+0x94/0x2c8
>  __rpm_callback+0x44/0x150
>  rpm_callback+0x6c/0x78
>  rpm_resume+0x310/0x558
>  __pm_runtime_resume+0x3c/0x88
> 
> In the code: larbostd = larb->larb_gen->ostd[larb->larbid],
> if "larb->larb_gen->ostd" is null, the "larbostd" is the offset, it is
> also a valid value, thus, use the larb->larb_gen->ostd as the condition
> inside the "for" loop.

You need to write more clearly, what you are fixing here.

> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
> Hi Krzysztof,
> Could you help review and conside this as a fix for the mt8195 patchset?
> The mt8195 patchset are not in mainline, thus, I don't know its sha-id,
> and don't add Fixes tag.
> Thanks
> ---
>  drivers/memory/mtk-smi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index b883dcc0bbfa..0262a59a2d6e 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -257,7 +257,7 @@ static void mtk_smi_larb_config_port_gen2_general(struct device *dev)
>  	if (MTK_SMI_CAPS(flags_general, MTK_SMI_FLAG_SW_FLAG))
>  		writel_relaxed(SMI_LARB_SW_FLAG_1, larb->base + SMI_LARB_SW_FLAG);
>  
> -	for (i = 0; i < SMI_LARB_PORT_NR_MAX && larbostd && !!larbostd[i]; i++)
> +	for (i = 0; i < SMI_LARB_PORT_NR_MAX && larb->larb_gen->ostd && !!larbostd[i]; i++)
>  		writel_relaxed(larbostd[i], larb->base + SMI_LARB_OSTDL_PORTx(i));

The code does not look good. You have already a dereference at line 244:

	const u8 *larbostd = larb->larb_gen->ostd[larb->larbid];

You are not fixing the NULL pointer dereference.

>  
>  	for_each_set_bit(i, (unsigned long *)larb->mmu, 32) {
> 


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
