Return-Path: <SRS0=7QZl=7W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204D6C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 17:32:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8D9D20691
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jun 2020 17:32:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EB3hXkZx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8D9D20691
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=96jr7KrU1I/S1Fd7usqQwUTx28HutYFK7tStJTGhEtI=; b=EB3hXkZxHv5/5V
	QcFrONlRbkezIfUltNqi+X8JgZcsnpwhe1bqlCSwwajC0Jlo66sFg0qQIeionXUOcxIWJR2L2B8+c
	f0pTS8a768PgriHb2HQefL9pk6okD87jFHUN3UROkNJr5CpFfXgPP6KG+c3PXo8TwVAIo03hPRfM1
	iMsbL5Z5Q2ZI1BE2TE4FgZqS7gImncj2AaQ+WoFyaZzr0M8ovPi0GmwVxj3HIuJJagC39w5CGCw4v
	jxGPXV3PhDSklW+tXYGSgPLiWXYTGwxna1i8gxmjBLyPjoV+KaYfl5YRu89Qrlv/ZwalpTm3Z/RB9
	GwTfSj2Ho27546XBVqXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jii6g-0004JW-94; Tue, 09 Jun 2020 17:32:14 +0000
Received: from mail-il1-f181.google.com ([209.85.166.181])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jii6Y-0004BU-GP; Tue, 09 Jun 2020 17:32:07 +0000
Received: by mail-il1-f181.google.com with SMTP id i1so19938774ils.11;
 Tue, 09 Jun 2020 10:32:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IGnSfBXB+3nfSv3N6F0fbjwPESQfDqrwP19nspwqC6U=;
 b=lqtlHrsKaB6ntFyWutP0aDQknwTNjN0p2xnrx5YbagDVSmSZEjcCvxJihGsSuBDW5L
 IGAsZhKtNxLwpFci+iKBhxZLwsvr9eu+l0EROI6AyIZVMpS8gxQUHBzlHJgzBPx7g8FA
 y+Luqlu4qscRS8/DqEgiCdeDeTqv9Zvi2FIMKSw/WXL/oJVCU6m8GwXqu1ZDxX1mD8iS
 ZKyGUDjsn0U+IXpAlos7DOzGMeLvDb0wHr8b+fZ5xNXhkbwLyqZZjLrivVWUjDF/hGaL
 +OgZxPi1wx/u0jLZvh6INqF2snM+sAWsrm8WcmfvDfYCSOUfqmfpZR81p5q9/5mJtpVr
 tHSQ==
X-Gm-Message-State: AOAM531dRWe7TKJ5LuoGbhhw+wufxzhIX7cTXeqOjS+nzUYl0/f+VhDA
 GQRXe39HHnjIP/ajUywn3w==
X-Google-Smtp-Source: ABdhPJyVUj4y5yOWIEZhHu2FOPrV9CJO6MI8LLU5aR4WVyN9icWLtu67T0oniravBER69+CId1YnxA==
X-Received: by 2002:a92:89cf:: with SMTP id w76mr20191903ilk.10.1591723925603; 
 Tue, 09 Jun 2020 10:32:05 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id l12sm640246ilj.8.2020.06.09.10.32.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 10:32:04 -0700 (PDT)
Received: (nullmailer pid 1119483 invoked by uid 1000);
 Tue, 09 Jun 2020 17:32:04 -0000
Date: Tue, 9 Jun 2020 11:32:04 -0600
From: Rob Herring <robh@kernel.org>
To: Neal Liu <neal.liu@mediatek.com>
Subject: Re: Add MediaTek MT6873 devapc driver
Message-ID: <20200609173204.GB1107294@bogus>
References: <1591698261-22639-1-git-send-email-neal.liu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1591698261-22639-1-git-send-email-neal.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200609_103206_544165_6F92E4B3 
X-CRM114-Status: UNSURE (   7.79  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jun 09, 2020 at 06:24:19PM +0800, Neal Liu wrote:
> These patch series introduce a MediaTek MT6873 devapc driver.
> 
> MT6873 bus frabric provides TrustZone security support and data
> protection to prevent slaves from being accessed by unexpected
> masters.
> The security violations are logged and sent to the processor for
> further analysis or countermeasures.
> 
> Any occurrence of security violation would raise an interrupt, and
> it will be handled by devapc-mt6873 driver. The violation
> information is printed in order to find the murderer.

There's also a proposed driver with similar functionality[1]. Come up 
with a common solution.

Rob

[1] https://lore.kernel.org/linux-arm-kernel/20200128153806.7780-1-benjamin.gaignard@st.com/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
