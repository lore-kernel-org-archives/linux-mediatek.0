Return-Path: <SRS0=bWHh=K5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD09C47082
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 17:43:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CBD9613DE
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 17:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CBD9613DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=e+zmPlOIgeimmTzUMj2C0Kd3Q5aTJ8yfMDGkxPyw8M8=; b=5CWgLmGAb2M1QhPLO/KKrcUIzj
	Fg6g9Es3qbdrFah8mOLXTpFeDPS4ep7p4210yUfmy+Ztrw0O2eK0BoAGiDbkTFRBp+Jm9LrJx0f5c
	iOeZxjNUt1LLLMJpDjOvB5eN4vNjXSCyKY9lKSR32YpJXn/hB1dR3hY9sN+pyubnLYmiUUntKX9rA
	ZqUhPNcxjBf6jW02k8ZsTmvUymVlNT0e6YDZonsros2EcVfZEtDGc8VjBsaV/lEhaMJ8xWnatT1kG
	VxU0GhXTTbseLoI/xwgDfD7msKK0jzLtukMP8xRXcRV/BOPurIkofOpI6MvTNEVYVeeSaEKX3MdVC
	yHa89oVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lorNS-009wHm-Tf; Thu, 03 Jun 2021 17:43:30 +0000
Received: from mail-wr1-f54.google.com ([209.85.221.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lorNO-009wEI-Fj; Thu, 03 Jun 2021 17:43:28 +0000
Received: by mail-wr1-f54.google.com with SMTP id a20so6745315wrc.0;
 Thu, 03 Jun 2021 10:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=okckV04a+Y2elinebUcRRfGaPp6ssJZ3DbsuQ4OOgZ4=;
 b=tsS3eP6hQWuKt4hjonfExiQ1dz5OpJGYMw24ZEG6/qCpMjO5JmP5xZvJqB1CnoIrDI
 UQS3hXYmN+3IZkQ/i8I+HuoChVvN7J1GAzO5PMTNUxdMcGzns9zQyWGIK+o60zKYStCo
 b4EoI/hWhgb8aEpjB8vflkLJpD9PZM90pTOznyAFCJRQAapHsqNHXTjj3Zwrkf/hxMcE
 6dJtjU0om9hKLSSXOJqQe0LrXF8zgyumf71Iw2suD1GeQp5GAZEeQjmrti160pOT1qzg
 j2bEvg7UHevy05w/c1aSDP4FAgf8k6mV1+vcD3Q1xe5BO9yQHwojWuOaHXdkvZ4wkFA+
 j8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=okckV04a+Y2elinebUcRRfGaPp6ssJZ3DbsuQ4OOgZ4=;
 b=cCGdyxUwjV9936AAP+RqorxPuNc4gmnm9OahLQD9NuUfd2ZQ45oqAAcp12+BQKjFMA
 +OVGHW7DdoYmWlv/sMeACNEl9H0JR+DeiLsLFX7l51nbCX1si/3t9iu+KVOqRKLTMhCt
 XRZoCmfg3e9TiXTTwbP6xFjgjlH8UTvoHF0VCU8Jus1IcfE9QRNd6wX+U+wjF/qauUDM
 2d2hOz6aROrfgxSVjkLX9Y5m/u4trn5fG/Jiy95dtrw/2Fx+HY0HbsZN+jHF3HCu/Cdm
 5U8LtVnKbwCFrNJWZ5WVT1Ub4q3PBIoLdJj/3azr7BEgUgW+StowDR9R5Q2v9D5pFnMd
 qStg==
X-Gm-Message-State: AOAM532LhZ5VW7AwfPT61PZr517X5SsHi/b0Vyv7HM9aVKocioPAwGqB
 EccUR4LQyW1b8VHrj69incM=
X-Google-Smtp-Source: ABdhPJxc8GBv5MWHwNdKUo9Ass5iXG8Y4dR3LXh2wRU11oE/YZ060aGOdU14D3PwAAWiNpY6YH+IFA==
X-Received: by 2002:adf:ec43:: with SMTP id w3mr148203wrn.270.1622742143250;
 Thu, 03 Jun 2021 10:42:23 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id h46sm4728578wrh.44.2021.06.03.10.42.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 10:42:22 -0700 (PDT)
Subject: Re: Add PMIC wrapper support for Mediatek MT8195 SoC IC
To: James Lo <james.lo@mediatek.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210602112050.12338-1-james.lo@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <2b569103-4c35-8096-a0ce-1b7e5939cf7f@gmail.com>
Date: Thu, 3 Jun 2021 19:42:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210602112050.12338-1-james.lo@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_104326_590994_6A7DEDF1 
X-CRM114-Status: GOOD (  12.62  )
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



On 02/06/2021 13:20, James Lo wrote:
> This series adds support for new SoC MT8195 to the pmic-wrap driver.
> 
> Henry Chen (2):
>   dt-bindings: mediatek: add compatible for MT8195 pwrap
>   soc: mediatek: pwrap: add pwrap driver for MT8195 SoC

Whole series pushed to v5.13-next/soc

Thanks!

> 
>  .../bindings/soc/mediatek/pwrap.txt           |  1 +
>  drivers/soc/mediatek/mtk-pmic-wrap.c          | 35 +++++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
