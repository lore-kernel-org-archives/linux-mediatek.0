Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A32EAC3E8C5
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 23:31:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BDDD204FD
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 23:31:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l8NREd0S";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pHYa5byX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BDDD204FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Qq4B5bqApcM0NIq2B2gjRPn2b7RUBsXxjjmSWq1XdTY=; b=l8NREd0StsynyfkcgkZVlPwko
	FH2WLvXKy9j/wqMFfom234+cKp8iZvQs2FM4QqvNE2BCUZxSSfsIcSV8bbpxtjPdMQHtr59G5KFB3
	vj1o97O4DerMOFspYUfa20upLCCbxdXeVg1cRDMrN7J9KMJKzHMp3pp38GbiOQ3tbyEdBxA8vOXyG
	AVXlSE0f6j/Kntf/6Hm6/KwW1yRf1D+lkFE4bWLQ16ZEebm+0o8oJZst/XAIzq6JbejZqbPQOkNxU
	cDpafi4zNwmBI4PHnA9ALAuYYSmOKWVBemr9t3ztB7o2aOFNeQiuJOhp3SagfPiSTSn6eS8UK7nG8
	i6GEsYzHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kinCp-0004c9-9k; Fri, 27 Nov 2020 23:31:11 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kinCn-0004bO-5I; Fri, 27 Nov 2020 23:31:10 +0000
Received: by mail-wm1-x341.google.com with SMTP id x22so6305806wmc.5;
 Fri, 27 Nov 2020 15:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=alM8Q2njg9OwW6Iyx+ETd8L6mtGNw6gcD2v5Jf5iUb4=;
 b=pHYa5byX4guCipmpaAwa5bGiFApZpE0i0ilJYouFdfZu45ciRmSLt01KdZjMKVMrfS
 sDXjTAVfHGCHH/MDDc18PznTdJxsPs1neZEiITfPX0zL557YEFLuOULfy/8vmUzwTdUk
 jIhEy6FU5Y1h/fz5qZbH6QU1FsVkqCZ0zEEKs566ulY7+VTEO3VX+vQulszeK0sHdGG1
 Dim4dRxEiWhI+FFX+WIwiE1ijS4AysWLteLHBXbgK4Ng3Ufl0WQHhfTzI7RTFAUI00Wh
 nACxHSFY2ubNlEMUhGHU6tseZ9pnTfySykksiPTtMZYTS7s/fYK4eB1E1oa9j9TdGKsd
 yXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=alM8Q2njg9OwW6Iyx+ETd8L6mtGNw6gcD2v5Jf5iUb4=;
 b=HNkNAuRJVU6h599E5mjAHLu8/nXpMbY2sPhjAdEFAl5d8blADmTWoz3rGOnyUD9UVT
 nFkIrm98vBJ3WgXReul4pqU9yTOj6s4ZsNV/F1mNLwnKkRrBNztQX89BIw2yxf4WR5iq
 CrfYhQBQFuZn0BaE0lWLpHAx5y1pN7K0k3houIVh+pMK6b+uKJt2wH2eiSgUNbRE8Vka
 mHBgcHYkSoNE7KNmIY1kSQ0m/fI2y9kchM/MSmKFLvB0S4OEc7x+FRlHmoIZEska8DkX
 DPr7TFZYc/9SCzmU+ICMmApdK2zoD8KQzQHy947bj6+AFWYrgfDz4pPMCW4jCS3+h0x2
 hN/A==
X-Gm-Message-State: AOAM533D60O93E7zO2lZFxtBpqw+PqMXAnmhJg3GS+9SRV+fs/rp24ku
 EQBvaQkSSvKS06N5vdLBg14=
X-Google-Smtp-Source: ABdhPJyuID5dIKPZZQeVL9qAdblCudAB4aEcc6hTQC/271h9HuPtNvWw8Gmj4RK3tZ90EbOiU2vkgg==
X-Received: by 2002:a1c:6807:: with SMTP id d7mr5888750wmc.167.1606519867940; 
 Fri, 27 Nov 2020 15:31:07 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id l23sm14232895wmh.40.2020.11.27.15.31.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 15:31:07 -0800 (PST)
Subject: Re: [PATCH v8] Add MediaTek MT6779 devapc driver
To: Neal Liu <neal.liu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <1602732039-12179-1-git-send-email-neal.liu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <6ef61089-01c2-bea6-e2eb-958dbe43ef2b@gmail.com>
Date: Sat, 28 Nov 2020 00:31:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1602732039-12179-1-git-send-email-neal.liu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_183109_273221_52A89F21 
X-CRM114-Status: GOOD (  19.92  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 lkml <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 wsd_upstream@mediatek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 15/10/2020 05:20, Neal Liu wrote:
> These patch series introduce a MediaTek MT6779 devapc driver.
> 
> MediaTek bus fabric provides TrustZone security support and data protection to prevent slaves from being accessed by unexpected masters.
> The security violation is logged and sent to the processor for further analysis or countermeasures.
> 
> Any occurrence of security violation would raise an interrupt, and it will be handled by mtk-devapc driver.
> The violation information is printed in order to find the murderer.
> 

Now pushed to v5.10-next/soc

Thanks a lot!

> changes since v7:
> - fix VIO_MOD_TO_REG_IND calculation wrong problem.
> - revise parameter type of ISR.
> 
> changes since v6:
> - remove unnecessary mask/unmask module irq during ISR.
> 
> changes since v5:
> - remove redundant write reg operation.
> - use static variable of vio_dbgs instead.
> - add stop_devapc() if driver is removed.
> 
> changes since v4:
> - refactor data structure.
> - merge two simple functions into one.
> - refactor register setting to prevent too many function call overhead.
> 
> changes since v3:
> - revise violation handling flow to make it more easily to understand
>    hardware behavior.
> - add more comments to understand how hardware works.
> 
> changes since v2:
> - pass platform info through DT data.
> - remove unnecessary function.
> - remove slave_type because it always equals to 1 in current support SoC.
> - use vio_idx_num instread of list all devices' index.
> - add more comments to describe hardware behavior.
> 
> changes since v1:
> - move SoC specific part to DT data.
> - remove unnecessary boundary check.
> - remove unnecessary data type declaration.
> - use read_poll_timeout() instread of for loop polling.
> - revise coding style elegantly.
> 
> 
> *** BLURB HERE ***
> 
> Neal Liu (2):
>    dt-bindings: devapc: add bindings for mtk-devapc
>    soc: mediatek: add mt6779 devapc driver
> 
>   .../bindings/soc/mediatek/devapc.yaml         |  58 ++++
>   drivers/soc/mediatek/Kconfig                  |   9 +
>   drivers/soc/mediatek/Makefile                 |   1 +
>   drivers/soc/mediatek/mtk-devapc.c             | 308 ++++++++++++++++++
>   4 files changed, 376 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
>   create mode 100644 drivers/soc/mediatek/mtk-devapc.c
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
