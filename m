Return-Path: <SRS0=zFd5=FP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3F74C4361B
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 03:36:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DBB423C16
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 03:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DBB423C16
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TTuF6atst8x9TE2YRZFs2gztJgdZnTIqpIg7O8zKAds=; b=cfrwcqY/b5vxpk8SI66usu1zE
	7Weh7dD4epXhrZAFny1ephQ/4yki+1QEw1lK0qsu890Focj2MS3YWtE9NrfxG0z+lOoPQe+LFVPzi
	m9s1q1MUS5ENDFg+WGeQP6AZa3boxvb6wadDiLyLFV8n8QO7vuZbjSvKtJG+CDGMxHHtknVJOfLC+
	O04FFn2bGVsWt+TaSTjyTSlFAZVeMMOy8JiDFXLiWwZeHkk3lh7kBrA7H5qPqXKhZJVc+5ySYwRqF
	DEV8v86Yikark5QAiulh9RqH+Q3o34QLHdPkOmdbe4R96kOTct7Z5PDkVWAgO+aopDvP3h51FL8Tv
	Jb0n7MCGg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knZEL-0005ql-RC; Fri, 11 Dec 2020 03:36:29 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knZEH-0005pL-Gg; Fri, 11 Dec 2020 03:36:26 +0000
Received: by mail-ot1-f65.google.com with SMTP id q25so7058997otn.10;
 Thu, 10 Dec 2020 19:36:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2YCw8mPj1l7lOOUQN8Gm4gmeF455YbujAM0oOrlkgbE=;
 b=I04HWgjG0biUFrTm8McqzqKBdSoZ1Di26Dhed2SV71d1DjgMl8tdLM1ZoDvv0+PE2i
 yFs8kh4hKcnpAsm89soMZcRUH9VFyN7j45W+3ktGy251IYoPaBQDvJdMOWfXPZH8iglN
 eLQAPrtu9FOfhd8QU/gRp12MZX8fJ9+H0q+KzEl/NX1072wo3/qsjwnjoqIxWIMD+8KW
 o2FkO7FsWcjYLd3Mj2HDNdtUvXEH7j/inXC1wd4tiCbDffBud5EZZhTTBkXmX9e5bPwu
 Eij3YrHTEeU4OpLYHNMi/JK55riD50ldv3XL+NEWs3+TkytxrAPkAr8JStupaAxtYosh
 zsng==
X-Gm-Message-State: AOAM531vaARyPemTYTX31JoareR93FWcYlEzrM3kM5PSqmLvI/K0Scoe
 RJCtHPi5pN95YzdJZ+AfLK2/lksA1g==
X-Google-Smtp-Source: ABdhPJxFVPh9P9P0ZHVmYQhR/hbIoLZ1rNrT1zRHbmPx8R1rze/TvRPDhMvNzVSdbSB2eheEIHHPfQ==
X-Received: by 2002:a9d:1f0:: with SMTP id e103mr8424722ote.74.1607657784884; 
 Thu, 10 Dec 2020 19:36:24 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r204sm1144158oif.0.2020.12.10.19.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 19:36:23 -0800 (PST)
Received: (nullmailer pid 3588674 invoked by uid 1000);
 Fri, 11 Dec 2020 03:36:22 -0000
Date: Thu, 10 Dec 2020 21:36:22 -0600
From: Rob Herring <robh@kernel.org>
To: Gene Chen <gene.chen.richtek@gmail.com>
Subject: Re: [PATCH v12 4/5] dt-bindings: leds: Add bindings for MT6360 LED
Message-ID: <20201211033622.GA3588630@robh.at.kernel.org>
References: <1607580057-4408-1-git-send-email-gene.chen.richtek@gmail.com>
 <1607580057-4408-5-git-send-email-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607580057-4408-5-git-send-email-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_223625_589599_A274D62F 
X-CRM114-Status: GOOD (  10.51  )
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
Cc: dmurphy@ti.com, devicetree@vger.kernel.org, gene_chen@richtek.com,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 jacek.anaszewski@gmail.com, pavel@ucw.cz, matthias.bgg@gmail.com,
 Wilma.Wu@mediatek.com, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, shufan_lee@richtek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 10 Dec 2020 14:00:56 +0800, Gene Chen wrote:
> From: Gene Chen <gene_chen@richtek.com>
> 
> Add bindings document for LED support on MT6360 PMIC
> 
> Signed-off-by: Gene Chen <gene_chen@richtek.com>
> ---
>  .../devicetree/bindings/leds/leds-mt6360.yaml      | 159 +++++++++++++++++++++
>  1 file changed, 159 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/leds-mt6360.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
