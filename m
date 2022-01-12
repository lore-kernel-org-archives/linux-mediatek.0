Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00ECC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jan 2022 01:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=57eeAIsUqeOO8ctjwCQoGwEvsVvZ9fKcG2lUA6xa7hY=; b=gMMDAJMduSHAyW
	I1gWAE75ekGjzeNudrgOuAFbQv7+jyCffnNRuLAVL854tkLaz2xDkDexMqniTcCwu8daWMxjuVQ3K
	9UBvJ8U9LWnQmjWJpQYaf8GxAC0oIyhb8gM9LHOwPzjqzqrsoKRq3szpmOHFA53RfNcDHJZaD4zXG
	62xeCbOSLa1HTko8NQVFCoh8N96s35ogcOyQstBSaolxFedYW/xSYNx4qyGQWdczkLdtDOjOdqMlH
	JM5v+9pxEM6d/h0iEebUKIhN9FUxMiuuu8dgl2eltrZnbFqa4qtuBy08YtweuarF/dJCyZvp26z53
	5HSVEULZPa5I30SKry7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Si1-000fmr-JC; Wed, 12 Jan 2022 01:45:53 +0000
Received: from mail-ot1-f46.google.com ([209.85.210.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Shy-000fl9-12; Wed, 12 Jan 2022 01:45:51 +0000
Received: by mail-ot1-f46.google.com with SMTP id
 t4-20020a05683022e400b00591aaf48277so852598otc.13; 
 Tue, 11 Jan 2022 17:45:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=auPBZIGqkRu4jbT6MtHpI7dAZqPiNO/igFKYp+QNdq8=;
 b=Vpo2M/8o8EdsuEx0VHoABAi+1szL6JM/Q/fmR9A0BufG+jQtoPnwXdw8YGRgt8Fye8
 WXPDoosOtlBkwHRaJlKSozYyuqukqyaGHTgGoM2XHipSIRSXJ2SefxHBW5jRCK8m7IQd
 tEdt+hdSc1fb3gKU+9K4Riewyzy0mRN+7JaCKX1Gb/UdjfYaDVp3wzkJSlN2xiJFniym
 nS1bw8jYk2aE4dhPS2MfvQ73HCQGRL+spGJelC2Tr8pGh+FqoDiJAarUGasG00Sr1bHg
 jE2IbGgbd+jzIrWG8CUXjDyJSqThyNJgM0y3U/vECd4wgESFbzO6pqTfPrj07r/Dya/M
 7pBA==
X-Gm-Message-State: AOAM5302au2vmztt/v689SU7Asba+njSNL8cDhrjskucCbTAV/rvuEma
 RJRrUIZ+UKjP8qem773yqw==
X-Google-Smtp-Source: ABdhPJzMDVWOj9+lKA02JctrkIDbu8daIh0sw3J8ORBid5N5iLpuPv97D7EQ3IVri4nmi7yrt9UgRA==
X-Received: by 2002:a9d:7f82:: with SMTP id t2mr5350884otp.87.1641951949381;
 Tue, 11 Jan 2022 17:45:49 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w15sm642991ott.49.2022.01.11.17.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 17:45:48 -0800 (PST)
Received: (nullmailer pid 3891376 invoked by uid 1000);
 Wed, 12 Jan 2022 01:45:47 -0000
Date: Tue, 11 Jan 2022 19:45:47 -0600
From: Rob Herring <robh@kernel.org>
To: Johnson Wang <johnson.wang@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, lee.jones@linaro.org
Subject: Re: [PATCH 4/4] dt-bindings: regulator: Add MT6358 regulators
Message-ID: <Yd4yy2emxSSh80UW@robh.at.kernel.org>
References: <20220106065407.16036-1-johnson.wang@mediatek.com>
 <20220106065407.16036-5-johnson.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220106065407.16036-5-johnson.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_174550_106756_ED9E3726 
X-CRM114-Status: GOOD (  10.07  )
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

On Thu, 06 Jan 2022 14:54:07 +0800, Johnson Wang wrote:
> Add buck_vcore_sshub and ldo_vsram_others_sshub
> regulators to binding document for MT6358 and MT6366.
> 
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> ---
>  .../bindings/regulator/mt6358-regulator.txt   | 22 ++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
