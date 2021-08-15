Return-Path: <SRS0=EFw0=NG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE04C4338F
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Aug 2021 07:25:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC50B60F46
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Aug 2021 07:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CC50B60F46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cufjoa4Qgx/zWv1iWSTGDXXPtXiKsMV/Z/Ho7AWNAAc=; b=01RO5reHV2Wt6sgWk8VDhjqCDR
	kbAP0JAkuN3mNRa0SbpV5sHlU5HB0T9eloYcq1LBHaoKL68h8NxdIeZ/rLNFIfBQVAcgXvVVmytxx
	Gut+azRXDSH9bFxThmkzfu8XrzDnzBAPXjQ1jDm73z+kZZvuO8L1krtnFRcp/Atfp7xxcS+yJt/7q
	jrlCPkarcXxIkJh8GARHeHT6N+Wowhnqkb/L5zcQ/pT6bsvfVOQxHmNQpIITYLVQaxdqElw0Kvhj5
	cb7FQwaKNa7KvAK5FUX8bKsw5Cmz2K4Rvzix7XMN1X1dcMyjUnuadKp+nv//SkvLP1DOyacjzf3FL
	Q/ni+SCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFAVj-00EzN8-Nu; Sun, 15 Aug 2021 07:24:47 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFAVh-00EzMX-VH; Sun, 15 Aug 2021 07:24:47 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 om1-20020a17090b3a8100b0017941c44ce4so9191245pjb.3; 
 Sun, 15 Aug 2021 00:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JJDOH+AsHu2AM+5trq9kiKo9CgyK57KxYI3IwWvbE3M=;
 b=RKVBuxnf6xQR/pSKO2SpOS4Lo6yWbvzYlN2vrYeM3uoUInGkiTdUEcKTamCVloy6Iu
 ZA9Exggoimx2UOW0KErLqGMmY0WkwWINOzzwidewuOoNoGSp8vQ+H965y14rWqUP1szV
 YeHPCkKyFA1Cl9AfjlNiFM2Y66k+g0E5jwTXCdyfpfmn7AZfhiNX69hX4MzurMx1p7UB
 jO1cDfd2BiMw06dGq0kLS6mxxwXvdMt8BI02AdSUlo/GRsgMQr01g81S7i605nNOB+B3
 v4euFQpY/eX/sBO6CwpOVDqdKZaccw1UyGOi8jqbIzdgr94kaIeDcnVnsHAcUIs8sjBR
 qOpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JJDOH+AsHu2AM+5trq9kiKo9CgyK57KxYI3IwWvbE3M=;
 b=d5BMsxYdiiCqDS8VqG+ypjTPhrRhEexSWRpSSkySygXMYB/x7Xk7rgWC26MpKK/O6j
 7l6FqWZ4a1ByubssUe9YmIpR/14qwKwdnTt7jwz1wgKUHMKikoF99ZTOSbudvTiaKwUD
 Vhy2pkjOdOTzsz/9tcpKr47lbtMc66fvzjQhCkXZeC48cR2PVZNeKU72EYRrQ1yif+D9
 6HHexuwD8Kk8WgwQf50uTWCY2UWx7xZCcIGRbjj0JzDAs42x9VY4uUY2f+bzzeokdVeT
 fWPvT5HSbFFhBhdtT5XBNuMZxcJpxnUBPCtPB+cBXrSKsolyXdKUXarbb9xiH868H+cG
 fqRg==
X-Gm-Message-State: AOAM5324vXeOhJ2SPceKBvVlegEmrZdx43pM0z2otRbZlw1MDEG7TqhU
 IPvDCQGR7FZZN5Npi5Pamwo=
X-Google-Smtp-Source: ABdhPJzq7sSAhv3mhPPXmyKVf5x9azgnIMZToYUs9eoJVEO0q/kFfEa3Yd9UMtVPm1x4oAezGGF8aw==
X-Received: by 2002:a17:90b:14b:: with SMTP id
 em11mr10845400pjb.125.1629012283879; 
 Sun, 15 Aug 2021 00:24:43 -0700 (PDT)
Received: from [10.230.32.65] ([192.19.148.250])
 by smtp.gmail.com with ESMTPSA id 16sm7337825pfu.109.2021.08.15.00.24.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 15 Aug 2021 00:24:43 -0700 (PDT)
Subject: Re: [PATCH v3 6/7] usb: gadget: bdc: remove unnecessary AND operation
 when get ep maxp
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Felipe Balbi <balbi@kernel.org>
Cc: Pawel Laszczak <pawell@cadence.com>, Al Cooper <alcooperx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Eddie Hung <eddie.hung@mediatek.com>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>
References: <1628836253-7432-1-git-send-email-chunfeng.yun@mediatek.com>
 <1628836253-7432-6-git-send-email-chunfeng.yun@mediatek.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <e191402f-69e1-2fb5-f5e1-6fd73e8b0699@gmail.com>
Date: Sun, 15 Aug 2021 09:24:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1628836253-7432-6-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_002446_064149_886785B4 
X-CRM114-Status: UNSURE (   8.03  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 8/13/2021 8:30 AM, Chunfeng Yun wrote:
> usb_endpoint_maxp() already returns actual max packet size, no need
> to AND 0x7ff.
> 
> Acked-by: Felipe Balbi <balbi@kernel.org>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
