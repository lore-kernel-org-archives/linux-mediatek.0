Return-Path: <SRS0=yE1p=NL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66C46C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 03:25:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 23482610E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Aug 2021 03:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 23482610E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fISAD0FKa3+4ADOTYaiWIDHQoxk7Ql9f8jPaEkw5JhI=; b=fbv+bHBDf9m5B1
	bL1FIldlchmmTWewhABUIYwYbiAf1ADxKsc3Yc3byIDtnlRJg12qG/x2KbIOAHFOQ987wqjqOXLFC
	npISRkKy7PVhOXTqZj25YcHx9x6rJusc0mZ6aFoPNJFVu3D7gRQ20drA8vkaaa4VdflNGPO8sth4+
	ggFE1cQnYJbfLCNUtDDF001R5trZ7pVEzLKhS37Cdt7WDOndr7UgR6yvuKgk0o5EoCAHzzs/wGphI
	MsieVbmMNGYhpjMdxwplg7zSljn0QT+7KX1+gbhX2cfcg/bE0t+SY+1Ns52bBHCsznpYPur5tYOnI
	IVBkaYlMsZq8vFY3NSIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGv9v-009zXt-FI; Fri, 20 Aug 2021 03:25:31 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGv9t-009zWp-2N
 for linux-mediatek@lists.infradead.org; Fri, 20 Aug 2021 03:25:30 +0000
Received: by mail-pl1-x62e.google.com with SMTP id o10so5242217plg.0
 for <linux-mediatek@lists.infradead.org>; Thu, 19 Aug 2021 20:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Tb+3c4sIXia8Tj7TXbcGSfKzAoHqBRtrMhGgnoxQz9c=;
 b=UlcCDs1covM/o5EVQkDUvKUq4BYzlVfj1O2NkuVwbGewbHLaYA1k7cDj99iuCJ4Hdr
 xqc/9D4LE2CQyZxqjlgvQYwYXY7f7d9Ln2txosp4PvwCHCGsanahVQNsdHVVTDpqy4Ph
 4gcyPp4AY4mgBwL4Naw3GS/5eoZXW4DEBE9Y7AilAJWtI+j4IvSR4gztQ4iuCR+l7Ya0
 wnJWFKfHLajnhyHepNgovu2GaEkbJs+34/1u9qZtpurbnl5UA47SCUUfskBIjfMaiGlC
 WlgX8qJGVA9wnFreDDWgmMokCHhor0vJxt511fs0jyPIhuo5R3qyJvUuDbf5x1+FLrpC
 sDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Tb+3c4sIXia8Tj7TXbcGSfKzAoHqBRtrMhGgnoxQz9c=;
 b=TjxqSjxb/Pj7DwMlNSLzTZ15HpmzNGREkZ5ksEESzmfHo7nunPiJQ8wjHwqpulzgHd
 4YkD+VSUQSYxNK8A78FLLJk2U7cUSTU73ojoDmcgmMEfVTHT+aJneXu0XlGk1Jci+ahi
 /Uk4rP7XAJsYNHkZM2YB0ukrqxta/SOSGGuE8pZGYuSn3XXfTbIQhVADPJy+SMAOE5al
 QlushRl7UTAInzEIN762cvYmW44tVe9sgUdSHC/kbPhZ/cvc/RJ+nWlP2QMcxvJkvolh
 ZMBqbATUb/J9m20emRGGp1ParBtJLx4krxeKA+bNMxK5nYwzPxMvCgeqovnXVUjPJ43a
 1KoQ==
X-Gm-Message-State: AOAM532PNztalFSLn0IDE/ac65sNzz7FhEkL0i0DQ3LY1I2RTetRqw34
 FyYIiD1Ku6ohS8y31hUT04nIyg==
X-Google-Smtp-Source: ABdhPJy5lEitPCHFg1OSUQG2byPt0M4/Vn2i9PLMWC8UpSbU447SdR7DBz6vRKpV6owBYA+uCyeJpQ==
X-Received: by 2002:a17:902:d3c5:b029:12d:32f2:8495 with SMTP id
 w5-20020a170902d3c5b029012d32f28495mr14949223plb.72.1629429927093; 
 Thu, 19 Aug 2021 20:25:27 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:549a:ad5a:e5bd:8c8a])
 by smtp.gmail.com with ESMTPSA id u3sm9211597pjr.2.2021.08.19.20.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 20:25:26 -0700 (PDT)
Date: Fri, 20 Aug 2021 11:25:23 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Wilczyski <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 qizhong.cheng@mediatek.com, Ryan-JH.Yu@mediatek.com
Subject: Re: [PATCH] PCI: mediatek-gen3: Disable DVFSRC voltage request
Message-ID: <YR8go1l0Xnvvqn5E@google.com>
References: <20210819125939.21253-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210819125939.21253-1-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_202529_170456_AA42F0A5 
X-CRM114-Status: UNSURE (   6.80  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 19, 2021 at 08:59:39PM +0800, Jianjun Wang wrote:
> Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
