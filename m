Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7027C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 08:45:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D7A022D04
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 08:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D7A022D04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xA0lNDftaKp/J1T0alxG8J/ueBupttE1Sf+B7a4TDKo=; b=1/xJ4fKPz0gSMARt5LqqzWx2H
	VZWM3VR0xx8aHu5u8XagLeVgwT0cV+iEmTqpMJzyADHcB8RVyaeamP0onNt3u57C9H8sz1e8C8XyV
	zTEjzfZf3w9wLgs28CcV46ieIi107DiIMpvZw+DMAyLQjHm909dAYbpN5sveLup9vd0V/ZWs7qMht
	DAEPENurBtqyv5eW1dZvSEigaZXEt3ge5QZGdZ6jk2fu01ScHwo1gOcbqF3tQDJ4pDEkHQz0e77Zf
	awcS+Wi6EP3YT+/KnvZE5Oosr27alNov6fuja7dUHywfN6IRYufOz/YmjnSLUCqa3OLGVZij2LUMj
	yI6C1iX7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3xUX-0003ot-2J; Mon, 25 Jan 2021 08:44:57 +0000
Received: from mail-wm1-f48.google.com ([209.85.128.48])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3xUU-0003nk-7v; Mon, 25 Jan 2021 08:44:55 +0000
Received: by mail-wm1-f48.google.com with SMTP id c127so9946533wmf.5;
 Mon, 25 Jan 2021 00:44:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iG617n7RY186O/pmG7ncN7Xf1mrGP2hULOGFRnrxrOI=;
 b=d1no/xOkjFEb/qCjoEc9uncR+nhlM+6VQPaaU1VWHLCLagWRkoLyS3g/RVCpMrHA88
 rkHSlP0WqPdn/+ua4qPRiUKvSdA/jkeI44YCL2l+KO7tC3bxLD45dYJOKYZgWyopZm3a
 bUYie2hkYD+1aGOF0DYynSfyqrPB8vHwmbu6ARlmMG7QToGhfqYmOmUkTOwL7SuT0gJa
 uvFLR6l1urFBH/NR11/l5GLpKnsqEB0ttbLSMV7w3tMmhcDmNxreR3pJVEd4dSAUICOc
 xhZIqtqDI1hpuPV34AljW1Czby8oH8aQo03wFX03hqcWFYmbwEycEbIYIXEUkdUvuBEB
 /6eA==
X-Gm-Message-State: AOAM533LjlV+bRmN3ltbJGEff6XGlLthJMjeGuZpVOW2fqdnHC4GC6AT
 7ZJGQo8PDywKCWpYWNHjHaw=
X-Google-Smtp-Source: ABdhPJwbi+N5mhqS3OVl7qZ4K7X04AkWAmdd1Z98I7yaiQ3n0D1F04aYVUoXBZy4+it6iLZGkS40Hg==
X-Received: by 2002:a1c:7dc4:: with SMTP id y187mr1502306wmc.42.1611564292632; 
 Mon, 25 Jan 2021 00:44:52 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id
 h125sm20907834wmh.16.2021.01.25.00.44.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 00:44:51 -0800 (PST)
Date: Mon, 25 Jan 2021 09:44:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH 3/3] memory: mtk-smi: Switch MTK_SMI to tristate
Message-ID: <20210125084450.wurwhi2hbbuueapy@kozik-lap>
References: <20210121062429.26504-1-yong.wu@mediatek.com>
 <20210121062429.26504-4-yong.wu@mediatek.com>
 <20210122213558.qnboqc4obdmipxs4@kozik-lap>
 <1611557384.3184.22.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1611557384.3184.22.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_034454_303623_6E0AD0F1 
X-CRM114-Status: GOOD (  23.68  )
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
Cc: youlin.pei@mediatek.com, anan.sun@mediatek.com,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, yi.kuo@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 25, 2021 at 02:49:44PM +0800, Yong Wu wrote:
> On Fri, 2021-01-22 at 22:35 +0100, Krzysztof Kozlowski wrote:
> > On Thu, Jan 21, 2021 at 02:24:29PM +0800, Yong Wu wrote:
> > > This patch switches MTK_SMI to tristate. Support it could be 'm'.
> > > 
> > > Meanwhile, Fix a build issue while MTK_SMI is built as module.
> > 
> > s/Fix/fix.
> > 
> > What error is being fixed here? How can I reproduce it? Aren't you just
> > adjusting it to being buildable by module?
> 
> Sorry, I didn't copy the fail log here. This is the build log:
> 
> In file included from .../drivers/iommu/mtk_iommu.c:34:0:
> .../drivers/iommu/mtk_iommu.h:84:28: error: array type has incomplete
> element type 'struct mtk_smi_larb_iommu'
>   struct mtk_smi_larb_iommu larb_imu[MTK_LARB_NR_MAX];
> 
> Our iommu driver will use this structure. but it was contained by
> "#ifdef CONFIG_MTK_SMI". thus I change it to "#if
> IS_ENABLED(CONFIG_MTK_SMI)"
> 
> If reproducing it, we should change mtk-iommu to module_init[1]. and
> switch kconfig MTK_IOMMU to tristate, then change the CONFIG_MTK_IOMMU
> to m. we could get the fail log.
> 
> In this case, Should I squash this change into this patch? I though this
> is a preparing patch and the fail is caused by MTK_SMI. thus I squash
> that into this patch. or change it as a independent patch and send when
> I change MTK_IOMMU to tristate?

If I understand correctly, there is no error before this patch. In such
case just don't mention the error to fix, because it is simply part of
making things modular.

Best regards,
Krzysztof


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
