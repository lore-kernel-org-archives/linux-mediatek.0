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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 285E5C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 10:35:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC870619AB
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Mar 2021 10:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC870619AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9SWT0lyMwXT8aK/pClWlhYF3UoqxXtDLpSQyoccs0JY=; b=T3S6BI2FOk8RX87V6c221cHxr
	GYT+mYomqkmh3wQR+20oTRZnk9ouki3fiXQSkR9LtXpnX+5y5BDUYbs0NVUPHOz7+XE1xmsF4gwZm
	xLpMuEW/rqzGotAHYzW/G05FRtND0bZYsltDiNxAjdvsTiNIrtvHcI6OnTN4ek8S6FjwTsdFV9ncL
	Okmdxs34cRK2qPbnTT//0fUh4kA3PZagtAi4lVNpWM1wwlYmfThcGyG13l234SkMDINhOzlkZPioI
	+Zl8FH2GAl6AXfjL54o6aB0hWttUsm+DsxtNDXOSjb7vW5jbY6q6OM/BcekNvLAlUdG3zQu4GBk2Z
	oTEN8Xinw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRBi6-003PiQ-DL; Tue, 30 Mar 2021 10:34:58 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRBhy-003PhF-SM; Tue, 30 Mar 2021 10:34:55 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 b2-20020a7bc2420000b029010be1081172so8135585wmj.1; 
 Tue, 30 Mar 2021 03:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IKhgdA7IcdpUmIcp9LYMuYlTkJ/X/xDStYFjCCWtH0E=;
 b=L9+YP5uF5lUC3kfPwHeot2K4g+mhil7Im7mx8/oxjEUmwQodlNz08osCMRZp8xy5vH
 3adG+ekiScfM04iHesfJjtJdK8YhPc+4AzcLRtHBt8xyI14fFSxpwS0p54kHBJgZeZps
 baVPelKyUT8J/XlK5M1aiVM8cQWfbA5tmcX5DQIXMgoxi6TMcsLv1OV8aVcfABv/u8id
 QbwVaBO2KQrz6cElI91T/+7RpwY4DJnuS0qMaAgm84syvoAiXwwcKbZWXEA1iO3SELA7
 B8nnY8CmplaeZg/v97dr9CgedV+tnmeBl/cSlWAkVRToeDWbNnJGLFE4AoQLL6a3oTkT
 xkwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IKhgdA7IcdpUmIcp9LYMuYlTkJ/X/xDStYFjCCWtH0E=;
 b=qf1clsS1XkfK19Krh53coLR8iYTrFmvJ39RyyhNLDrrSBtCiIe5qryTok4YkkJGEjJ
 CnFCkUVBXPhqAJOXr36s087TKLnZy7iluC4uMCsQwyRBxX66nIWQkcpGw/Ic7mhRQyB0
 Mz2a6HRimKb1nCMkruxIa6nNrhGS1AiyPFMHFRBuO5sUVkHG4ulwuVMFTsC8QVZ7+TY2
 ZAkRM4CYUoW0O3bVN9t02uguR0ggDIKy3wMwu7Nrcs7YatKBD7OPZxKvtuOfVxygH+9o
 WGDgegCmOrc2jP2avLmzAdUac1fAwX8sQKKwgCOnv414axk9xjj65XUx3/YtkC2ziMYj
 8inw==
X-Gm-Message-State: AOAM532X3K4NKLzm4odoQIMg35Mbw4SuD3qkN38mNH+g96xkxnE05JL8
 ncQMDPsvM0U/cT0a/bcBZXY=
X-Google-Smtp-Source: ABdhPJyeURqXYD/cnr28buRAMw5ZpFL6vzxE5BY1Y9JvfpjlzuG9PzdcIzBZ2PZDVFebowgOj+DlNg==
X-Received: by 2002:a1c:bd55:: with SMTP id n82mr3310167wmf.3.1617100490242;
 Tue, 30 Mar 2021 03:34:50 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id z8sm31845449wrh.37.2021.03.30.03.34.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Mar 2021 03:34:49 -0700 (PDT)
Subject: Re: [PATCH v6 0/5] Add PMIC wrapper support for Mediatek MT6873/8192
 SoC IC
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, drinkcat@chromium.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1615563286-22126-1-git-send-email-hsin-hsiung.wang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <e33053cf-f337-d7f6-fbf6-93d385f7e683@gmail.com>
Date: Tue, 30 Mar 2021 12:34:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1615563286-22126-1-git-send-email-hsin-hsiung.wang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210330_113451_145086_11EA81C0 
X-CRM114-Status: GOOD (  15.57  )
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



On 12/03/2021 16:34, Hsin-Hsiung Wang wrote:
> This series adds support for new SoC MT6873/8192 to the pmic-wrap driver.
> This series is based on Weiyi's patches[1].
> 
> [1] https://patchwork.kernel.org/project/linux-mediatek/patch/1608642587-15634-7-git-send-email-weiyi.lu@mediatek.com/
> 
> changes since v5:
> - rebase to Linux 5.12
> 
> Hsin-Hsiung Wang (5):
>   soc: mediatek: pwrap: use BIT() macro
>   soc: mediatek: pwrap: add arbiter capability
>   dt-bindings: mediatek: add compatible for MT6873/8192 pwrap
>   soc: mediatek: pwrap: add pwrap driver for MT6873/8192 SoCs

Applied to first four to v5.12-next/soc

Please resubmit the DTS node once the clock driver is accepted.

Regards,
Matthias

>   arm64: dts: mt8192: add pwrap node
> 
>  .../bindings/soc/mediatek/pwrap.txt           |  1 +
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi      | 12 +++
>  drivers/soc/mediatek/mtk-pmic-wrap.c          | 97 ++++++++++++++++---
>  3 files changed, 95 insertions(+), 15 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
