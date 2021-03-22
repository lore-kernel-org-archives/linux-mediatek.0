Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7FFC433E1
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 08:59:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F35761973
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 08:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F35761973
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OVTBMlf46yBajUAWF2ec8pbFjgoCr37ReNR6aIPFTI8=; b=JDMyK7A1VVu64/Na8b5RyUm78
	hsqtKgQuF7TgIYcS43A2tBKSJJXcOg5o/g375zNko+umtjaCpaWTwjF2344Tr9R04ZLmTTYbSGNu+
	3MKSjZ4PsObJFHZjx9EoWHQYOCFNvGaA0Sz5g7QbBAfW8BCpgXZ3i3mzXRmUVv2aA7Ei4h28BpdOc
	nMC/jyPwPX9KOXSRmz+mf0vADQlyI5TXGFvkoGFkjfQUoFZfEuM2PhYvLeeqwqJmKKOVk/pdq0lxz
	OmJDqwQpNNpoegfBvi9Ewcpa+U95PQe32pxq5GQc38wZaSQHQt/POyoqYhF7lT6ST3okvtkJnPbMF
	dbF+mOdgg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOGOh-00BD8M-Lr; Mon, 22 Mar 2021 08:58:51 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOGOd-00BD6x-02; Mon, 22 Mar 2021 08:58:49 +0000
Received: by mail-lf1-x134.google.com with SMTP id q29so19877527lfb.4;
 Mon, 22 Mar 2021 01:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PczL/i8DI0v6bV5Bqb7xK3jB9Ud2bBghp0p1H6uE45k=;
 b=Zzfgfbhjr6omMPasXx7EptNOXKHhyfoa79NSlCDRNvUiypFULzvxaoJj1ZBJ9jInwB
 vCm7/FAI/cNI9KxvCdyTNNQp48vS1A6koufQSCC1Xgk6/z7JvES1gxayZ1nbsrMd/BwB
 y/7DPt3s3w6PfMWgfbzHxfqx85U2GXiMgmSinIMlKRUwuewILIrfBaRfD4Odv3Jensjt
 vAU8RqYi3x/nTtRTyRyRwiAMoYHicuOU3AvZtXTA6fPaFhcnK5uZbi2iwymjTmKy46QR
 L01FJWiIRYfWI4KYIvVEUyytFx/SEFm6UgcAnKCbEzpDMxUR379ZVkud7UoroUwO5ion
 O5kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=PczL/i8DI0v6bV5Bqb7xK3jB9Ud2bBghp0p1H6uE45k=;
 b=JTeV2J6ynHXGJWOlvKKs1sqtZ6IN5xyOUCw6ABG8UB3B+sPM9rbbOxEP/Cv3MpQV0g
 R+RjjksNAjKgFconSMoj06KtF0q2b815ivyNsediEuXlwlgHp2dJYsrxc6jcPjh8cPo7
 aQLuaUfQl3o+BIZosbF0Ey1ZKJDS7nbLBmfJModqKczmcEfaUAmZGMDGhkNla63wfNb5
 IOW9Vo5ExmC1UozKSadRC41BzDUpyyr1aE42wTkVkCwZAYEhmCCGl2m+RY7NekPXDGRb
 8oYRYcoPjfaBHtb30wTzSHnuvqbo7EXOjtDTtQvDkZMeEk/w6yA27lx7pISN/EUCu7Zl
 AIdQ==
X-Gm-Message-State: AOAM532M2peoe1A0ISWeDrpfUXZUjNofeXs6/i6QX/aJY3/YhCglLCjs
 eYxo/8ep5kmscU+4W6g2z20=
X-Google-Smtp-Source: ABdhPJwkYZ8LlbYbzeHnceTbtbYUvqyReoc5EvZh4NuqQ8PKASe1h6Vo0Di4YEMIEm0AlcBM7ZoV8A==
X-Received: by 2002:ac2:5933:: with SMTP id v19mr8182977lfi.405.1616403526211; 
 Mon, 22 Mar 2021 01:58:46 -0700 (PDT)
Received: from [192.168.1.100] ([178.176.79.3])
 by smtp.gmail.com with ESMTPSA id k30sm1792377ljc.140.2021.03.22.01.58.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 01:58:45 -0700 (PDT)
Subject: Re: [PATCH 07/13] usb: xhci-mtk: add support ip-sleep wakeup for
 mT8192
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>
References: <1616382832-28450-1-git-send-email-chunfeng.yun@mediatek.com>
 <1616382832-28450-7-git-send-email-chunfeng.yun@mediatek.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Organization: Brain-dead Software
Message-ID: <f9d14506-5db5-8f97-e3d0-5956cc17dadd@gmail.com>
Date: Mon, 22 Mar 2021 11:58:40 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1616382832-28450-7-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_085847_266139_F2B354F2 
X-CRM114-Status: GOOD (  14.24  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 22.03.2021 6:13, Chunfeng Yun wrote:

> Add support ip-sleep wakeup for mT8192, it's a specific revision,
              ^ for

> and not follow IPM rule.

    Following?

> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>   drivers/usb/host/xhci-mtk.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index 8ba1f914cb75..1bfa28c9b5a2 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -70,6 +70,10 @@
>   #define WC0_IS_P	BIT(12)	/* polarity */
>   #define WC0_IS_EN	BIT(6)
>   
> +/* mt8192 */
> +#define WC0_SSUSB0_CDEN		BIT(6)
> +#define WC0_IS_SPM_EN		BIT(1)
> +
>   /* mt2712 etc */
>   #define PERI_SSUSB_SPM_CTRL	0x0
>   #define SSC_IP_SLEEP_EN	BIT(4)
> @@ -79,6 +83,7 @@ enum ssusb_uwk_vers {
>   	SSUSB_UWK_V1 = 1,
>   	SSUSB_UWK_V2,
>   	SSUSB_UWK_V11 = 11,	/* specific revision 1.1 */
> +	SSUSB_UWK_V12,		/* specific revision 1.2 */

    SSUSB_UWK_V1_2, maybe?

[...]

MBR, Sergei

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
