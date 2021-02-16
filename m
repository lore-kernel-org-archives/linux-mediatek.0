Return-Path: <SRS0=aIq3=HS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1510C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Feb 2021 11:59:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43DD564DA8
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Feb 2021 11:59:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43DD564DA8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMO0ce163rhbrDLIoS0ReL5AO1rzRjNAc4n+hZ/uhds=; b=cD00XOQl6c7rRB18owF8CvoSSu
	JumTtY2cEZ9XVjoXNnLiRBoL8Ra35beVBOL6iOis99iyIRyhMLnxjThD3xO0XghYCCxwzfDgEgac1
	0C1ySQnoOKuFwUMl0jcNlnX9EdqfWh2/ZofUbw4shL4kdeJ/zaCI+3eoocaaM78paLr6rapoN+erj
	3qxXQIiFZ+ZKlxDd4DWODQZGEY54vqRn42LTSGv/nJ705NDYMWafWq2dbwWPHtiBUeywNyx32f4kA
	AU973EJeQvDH6aZzgydYx9nvs0tvPK21MgkjeXCxihtQ9h8Ygxl3QD4exh8xqjuV/undz+Zwe6SdV
	cBu1S4Gw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBz0y-0000KS-H6; Tue, 16 Feb 2021 11:59:36 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBz0w-0000Je-H6; Tue, 16 Feb 2021 11:59:35 +0000
Received: by mail-wm1-x334.google.com with SMTP id o15so8893887wmq.5;
 Tue, 16 Feb 2021 03:59:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Vdhu8U1QU4NNQOQK7F0IcKROqAkbt4T+2oowJvOiIEI=;
 b=ZeFHwIKLx8FPqrshhYW0vuyUCycDIe6jJJ4Oi3dPexy/VoZt5EbyHd7OrxmpBDLXXX
 sFvh5O3l/RCabEg/zzykeEufyihQbduluEKfe/0XA4xiB/L0Z0aFbhTpE/r7O4nAPfTH
 pdUo91iHchn27Prhs3g8mijIzWMGGVS/SDKYnPlftyQANAA4IdGTeSLb7JAG7WShN0qA
 QVsgvik1YjRj+1dRZbrUegnz+nhI7IbXe8TKlAt0DnFa4fQ3q6JqPk0ZpdwFhb+1Q7Yn
 lnZyACt+ZLU7oL/uOyPM5HYt3nA0ZS+5OTHaZ7z3s7WuVguHUy4pTkIkP7NSLLHSopY4
 vF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vdhu8U1QU4NNQOQK7F0IcKROqAkbt4T+2oowJvOiIEI=;
 b=bJ/TSlTyRzo15yL0mLV/Gh/0LuDeiOk+tCDMLAiJHBq3L5HL+yDzVkrYU0c53wHtnH
 jKAY/ldHwR+gsesvae/cZUy8hKJKvOgau3c0wqcHkgWEuEy6+ZOgxJOna82C9phytbHH
 iiw0ENGjM11NFzOyCHT48T9BmdF9LyLZBDMzgdDhpO4GBG/Ke80D2uszVUfg4fSvGAcf
 zlzB8pFa9L6ckI2ga0wz/nSoQrUOlCHWsNPqnHzKBx2YVdkIn24h2jpeFB4vqElEuf5V
 EJtmPHAD62TKVsMDdvZb8eLncg0iyg3HuDriwkoEg87apxYQ+F3zlP92pnwJphdNTDiy
 b/HQ==
X-Gm-Message-State: AOAM532d1AzLgaNDpqjD1JHv9UkhXWYtpoyzdSjcQHWGVMXC41flW0X0
 owkctvrvRl0ySNLQW7WoHZpAwGZgv/hsu8ZX
X-Google-Smtp-Source: ABdhPJy4QtaFpwXzcg7OezjI/QsgDUwtqJ6OSEDxhqyvkNRvsHScS81WKCW86b2sKWSUyZyosirTBg==
X-Received: by 2002:a1c:2d47:: with SMTP id t68mr3103988wmt.189.1613476771741; 
 Tue, 16 Feb 2021 03:59:31 -0800 (PST)
Received: from a-VirtualBox
 (cpc141888-watf13-2-0-cust663.15-2.cable.virginm.net. [86.14.42.152])
 by smtp.gmail.com with ESMTPSA id a186sm3348583wme.17.2021.02.16.03.59.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 03:59:31 -0800 (PST)
Date: Tue, 16 Feb 2021 16:59:26 +0500
From: Bilal Wasim <bilalwasim676@gmail.com>
To: linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 matthias.bgg@gmail.com, enric.balletbo@collabora.com, hsinyi@chromium.org,
 weiyi.lu@mediatek.com
Subject: Re: [PATCH v2 0/3] Misc bug fixes in mtk power domain driver
Message-ID: <20210216165926.46bbafc7@a-VirtualBox>
In-Reply-To: <20210201121416.1488439-1-Bilal.Wasim@imgtec.com>
References: <20210201121416.1488439-1-Bilal.Wasim@imgtec.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_065934_638839_37BFD5AF 
X-CRM114-Status: GOOD (  13.49  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
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


ping - can this series be merged ?

On Mon,  1 Feb 2021 17:14:13 +0500
Bilal Wasim <bilalwasim676@gmail.com> wrote:

> Incorrect mask for the "bus_prot_clr" field meant that imgtec
> gpu power domain (mfg_async) was not powered up correctly, causing
> failure in driver booting. Fixing this and also adding "domain_suuply"
> capability to "mfg_async" power domain (for mt8173) as imgtec gpu
> needs da9211 regulator to be enabled before enabling this subdomain.
> 
> Tested with mt8173 elm chromebook.
> 
> Bilal Wasim (3):
>   soc: mediatek: pm-domains: Use correct mask for bus_prot_clr
>   soc: mediatek: pm-domains: Add domain_supply cap for mfg_async PD
>   arm64: dts: mediatek: mt8173: Add domain supply for mfg_async
> 
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 4 ++++
>  arch/arm64/boot/dts/mediatek/mt8173-evb.dts  | 4 ++++
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi     | 2 +-
>  drivers/soc/mediatek/mt8173-pm-domains.h     | 1 +
>  drivers/soc/mediatek/mtk-pm-domains.h        | 2 +-
>  5 files changed, 11 insertions(+), 2 deletions(-)
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
