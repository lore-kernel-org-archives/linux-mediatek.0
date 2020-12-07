Return-Path: <SRS0=iI7F=FL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086F8C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 23:01:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF590239ED
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Dec 2020 23:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF590239ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2BrBr+xI0xw4eWZ9nLdpqJI1pWK4Jv7tDle1a6n8GAY=; b=ZIuo2FGlKnvZ30zfMGHpFqh6r
	nEcrr3Tc6202eW1GrFLsOgf+6PM8b7DNYUYzoGaX2IBb4mniOue6ZfaxTYGHd6zeHRYAW0FVG4R8s
	SzCsEqdx6J+izXlAAvK9bcEfVSsXw5U177sW0UBF7Y9CWRDkWiJ7V2KU3BaQSyRKk6W3I0fFeqtcR
	btgNugpVCJmmP/Gz64sXoBANVoobYQmL7p+eJ1kOx1EBuK1qK3HN+M6gBLqgP2uvrZl88DRQ3XK56
	h6W8pQEdnGh87ePjqrxl7gOi8QUZ9h3oRmUv2Sl/8HedoxMmIjOBMWrSkd79SVscuQtTxPqYw0/o4
	UDJmvvDJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmPVC-0000AR-WE; Mon, 07 Dec 2020 23:01:07 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmPVA-00008Y-Ij; Mon, 07 Dec 2020 23:01:05 +0000
Received: by mail-ot1-f68.google.com with SMTP id h19so14204785otr.1;
 Mon, 07 Dec 2020 15:01:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Yl8EdReeQNPvvWTCsgwnxMYnKdzktt93AM6rTiMbYOg=;
 b=D4pjHGKWML/aun/3ag8oWPFUa9AAHc79MkF7YOGE6ZvVgKWi87x6aT2RMmfDxIE416
 UetRr3FP4092iemKrwJQb+2vMNX9dcISkHL25zvt8XqA/+i2nhqNKPkkLMP6HKQ6ft3t
 1Oy4C4AjvNSutYvPYi/CyzeT8Ok/mA9c7dHQnwOKhWMwK1Kx2GA/Q3FG7yKkvGzffKPE
 qQphnIpwm5Rj3OFX67t8PLEzUi+HzvJM5UxO+3Ra9Luzpq//r6F2I7TQxwuoccvxI78v
 CqbNXUJn2XNjROm2yXWlDNB5CYmCLUKM4GjipcK+HnrjIKocm6mu5Q+l62UzyUQrV122
 EDuw==
X-Gm-Message-State: AOAM532QKY7Y7TFdQgpQhN54vKsPCgQH1Py1aqVIV75icE7GjOGh4DSE
 RdW45WwZHsojg1R8G/VmOQ==
X-Google-Smtp-Source: ABdhPJy4o+KKt2VsZ8/Ja1T2ELpm7ZEgXBUA9XH7X4kKGoAM+PzLDIBf1VLVvm2YaJvvjKBoOgHo3w==
X-Received: by 2002:a9d:6c96:: with SMTP id c22mr12740600otr.196.1607382062820; 
 Mon, 07 Dec 2020 15:01:02 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v123sm3264882oie.20.2020.12.07.15.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 15:01:02 -0800 (PST)
Received: (nullmailer pid 1008235 invoked by uid 1000);
 Mon, 07 Dec 2020 23:01:01 -0000
Date: Mon, 7 Dec 2020 17:01:01 -0600
From: Rob Herring <robh@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Subject: Re: [PATCH 1/1] dt-bindings: mmc: eliminate yamllint warnings
Message-ID: <20201207230101.GA1008158@robh.at.kernel.org>
References: <20201207032626.1445-1-thunder.leizhen@huawei.com>
 <20201207032626.1445-2-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201207032626.1445-2-thunder.leizhen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_180104_662246_AB377BF4 
X-CRM114-Status: GOOD (  10.96  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc <linux-mmc@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 07 Dec 2020 11:26:26 +0800, Zhen Lei wrote:
> Eliminate the following yamllint warnings:
> ./Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> :20:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> :30:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> :33:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 26 +++++++++++------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
