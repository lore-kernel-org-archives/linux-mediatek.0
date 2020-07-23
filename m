Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E07EC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 21:18:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBEC0206D8
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 21:18:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q1d/yV5t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBEC0206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o068w6jx3PxNI7xrhWyBgbdRptB5uwBPXKbzmrZNfoU=; b=q1d/yV5tdVFowe3tg4jP+pMg9
	26f6MsYCrod91fTthqGIJvPaNUWtzRhSliHkwyi2SNLrTNKjtLixah7PXQKSLyaR547agJiQnzZ1W
	DZxeDbUkFy2YhWZz0YAkFjv8CdGTNHEodYQJ9tpAxpjjbdlzctFef2cdsj5dLZaC8O6x6tm/JGOBZ
	U0IxGl2tEYxGjyZxB06UEBxQi72ARHhYUGbBX+Iko7iWNACuL72+RUqfbYXYdp4NJYwfWKrCU3myV
	iREHcHgEpQLn187EThO+7AIZ2+XVFsE18NRct7H/hB+3bpyl+6MUZ3b+xmwoGtBF9MzFwr58v2nX8
	U80cw+gNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyibS-0003Dl-Og; Thu, 23 Jul 2020 21:18:10 +0000
Received: from mail-io1-f67.google.com ([209.85.166.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyibO-0003Ca-TO; Thu, 23 Jul 2020 21:18:07 +0000
Received: by mail-io1-f67.google.com with SMTP id s189so536045iod.2;
 Thu, 23 Jul 2020 14:18:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Hx09CFzFEK3rFI8A30xOHAnNXgPfvKjfqFgA/SCg1s4=;
 b=ecZ6kbravS4ZZkOhvzTaJlSAulfFm5zE1OKraGVjJWFRo8fY43EUf8TQsig/RU14eB
 ro4eOhp1OQkwXVfrWn1oWElwNlAyraGTSb4FKHe3tAtz6k9ENF99lW6/SXKUGxTIugSX
 kg8R9G0XFdgwUUQDoillyyrNOOcS5QeUJcjl9FXA4HiBpqYfsDoH7B7gUHoeTgYMuM95
 48CWg/fgj8sH2nxn8jKX88WRzDl6a7JOM7/pkiAyp0kAZZr/Nvm6IOoQUAXp9cRPmyWN
 Pw/noncJGKOosUfKb3SpMP6U1rYGZujkEH7aRprOte25vl+/i/Wl8vNgI426jw/ANrdP
 2J7g==
X-Gm-Message-State: AOAM533YlTHBHAf5EFg4JrEV10TEZkpoYoFdEgL7yoXSsuq7FkRZtOEb
 mOpxHUfU+U41rKkaKbr8EQ==
X-Google-Smtp-Source: ABdhPJzIrbGkisYa8iZy5IAqxlxr48Sy8HcbDiPVQc/+SP8E4CfSPaTNyFUPOeLZfDlyP9BAFCp0HQ==
X-Received: by 2002:a5e:d90a:: with SMTP id n10mr7039546iop.50.1595539086180; 
 Thu, 23 Jul 2020 14:18:06 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id d9sm2016925iod.55.2020.07.23.14.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 14:18:05 -0700 (PDT)
Received: (nullmailer pid 875357 invoked by uid 1000);
 Thu, 23 Jul 2020 21:18:04 -0000
Date: Thu, 23 Jul 2020 15:18:04 -0600
From: Rob Herring <robh@kernel.org>
To: Qii Wang <qii.wang@mediatek.com>
Subject: Re: [PATCH 3/4] dt-bindings: i2c: update bindings for MT8192 SoC
Message-ID: <20200723211804.GA875327@bogus>
References: <1595421106-10017-1-git-send-email-qii.wang@mediatek.com>
 <1595421106-10017-4-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595421106-10017-4-git-send-email-qii.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_171806_960822_62B5660D 
X-CRM114-Status: UNSURE (   8.88  )
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
Cc: qiangming.xia@mediatek.com, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, wsa@the-dreams.de, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 22 Jul 2020 20:31:45 +0800, Qii Wang wrote:
> Add a DT binding documentation for the MT8192 soc.
> 
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
