Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B63CD5BC8
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 May 2026 21:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MliZIEyZF+cjr5tCFsvOUcyvGEDv7HTQGjwah9i0HJo=; b=VqGcN3+EcR2i5ygBHQk7Ns4SGD
	1NCrFT8v8RdVB+NFTQIxqHw9+gm6y9+7CoL0brJEEzi/H3bMgyT+oA+/pdhxA589D4NcA4Cst0OWk
	yxuviAPt72lMrqoUAyPZlTowto3xBM6CjXuVivSIW+z8APtf0H6jqsKI44d/MhuzTmqJDGT3nJ9Ni
	olrW4WR5C8N7hhd/kga3RSk/k5nCXO1lMyzq1gFKrpU81N7F5kl5E3kMUrJFUkXNsNF0uw8udvUld
	MJLzWHmQObNNIp4JnqVix+lvEBYUWWZKpbGfW1anQ+xiJ3m9nN20UF32gXxemiv2YhFn/TRgF8H5T
	2P/d/6IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRzEr-00000002yyt-1YEf;
	Tue, 26 May 2026 21:23:01 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRzEo-00000002yyK-3daB
	for linux-mediatek@lists.infradead.org;
	Tue, 26 May 2026 21:22:59 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-304545f5206so6540220eec.0
        for <linux-mediatek@lists.infradead.org>; Tue, 26 May 2026 14:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779830578; x=1780435378; darn=lists.infradead.org;
        h=references:in-reply-to:content-disposition:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MliZIEyZF+cjr5tCFsvOUcyvGEDv7HTQGjwah9i0HJo=;
        b=ipnPVk0KlolbakvWKyB0JByECTyizZpPgNRmkGYWYQbSXsB+PCjfRj5WT9dgGKyExC
         zUU3lhkRTP7es07sYsU9d9cnY3z603zvsbUBFzIsM38QkdBdYihfNvqc8n7iJmowb8H8
         Q93zdHOmhIR+gYNIWI4QGUHk/4E/SHTjcMDE16G9/gcNrBlkqixpIqxpzfnr8Ov4VmOp
         vOw6QFUItPOyLiMhn+qNunve/KT4dszGxyEcHPh0vyNUir0YVSvaKF5Pv2/jbiaqmhEC
         vhCcOudikFtmgXG9cMS5bIaKZj9d0F4fkreo1j2QxhsFwHq+0Y426e91mjPndiaTUOYD
         PMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779830578; x=1780435378;
        h=references:in-reply-to:content-disposition:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MliZIEyZF+cjr5tCFsvOUcyvGEDv7HTQGjwah9i0HJo=;
        b=a9N9yBV2UF8JL/05EVFPgTY/6KaW68bihFqyEniKf4bHmOwCHNUFHxKs3GNIh5hPHt
         1uA5hVmolkOjBDo7W+jWrMbPFQC0u8rkSXOFjaU1vxyphF3h4ZKR4Onho5FrGsTfwiho
         YI04txjOYPO+3oDCQuhMgkPQDZl2IxMQPmoWsttKicl7OyKfNxYH4XkXIYiBrUvm4YWK
         WBRimq1bRNzJIUNkPQhON4CueYCCGlZTS+TEdj+8UEcqjpTIVnr2+KsQlV9JqStgD+p/
         dWJc4lA3+9LDdmKcyttVnQlo22tXaIo25YoPhRBKod8dMnTCoY5WUkCv8kfbDsO2DNav
         Mkog==
X-Forwarded-Encrypted: i=1; AFNElJ+xKiBtzC8gdKZ52ldadgZp73rA7J0ldTXQtjGy78V/tmR3BzpKuUsnnBPg7wyl8V+7HjzyoTF9YeZlqheACA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo7Nqp9LoTgK883bLaDvRN0S7JC2W+pq/8Hy0BAV/q+cGsqwXJ
	FtY/8gpjIYM+FPAr63Frq4Z9r8REfllC+1z4bL9oz6NYxbi1hsp6+ie0
X-Gm-Gg: Acq92OG5iEGUeAAuNCetup56I4QChSIjkMLgwzZT7BTsoA7hNylss4MBxGgXcPUGsci
	zQWpz6ZZ7gxUy9eK7gq4/yUFu7wpqSvS+rndPFurGRecTvEFG13uj1VGLF2LcOzo6LrhJKC45JU
	QtKME70fOuyHzF2zew/OjVmXgT/p7E2sDQ0dwGjYYvgLFlpVPAO6EDEfQ8H3h/Fnwic131Upy5u
	uJjvj1k4eXUU2KV0piNcqNg67eL8FKkRTHzr4svh5cq5L/08OSd9b61vXy5NPeQtehG2VRcDxEI
	COHo7zRAECCLZwYBq+TBGPhEPmr4sDySuQA4zH7GE2iB4G9fEZfGheHhdNzC5/LXwvTX0HmsBnt
	/4Xud7rl2SoUuO1k8S4xQ3bawnhYXZ2uzMcrr891KnMYrU00zG/d+WfZRSp5InZwdTpWIP1iQLQ
	uOYZIvSAlFmprUMJrxoFCaZ55kowB55oxja/As8+460nw=
X-Received: by 2002:a05:7300:6920:b0:2ea:4228:ab11 with SMTP id 5a478bee46e88-30448fd6079mr8891943eec.3.1779830577830;
        Tue, 26 May 2026 14:22:57 -0700 (PDT)
Received: from wico-dev.wnam.ru ([23.95.253.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451f3feadsm14592570eec.13.2026.05.26.14.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 14:22:57 -0700 (PDT)
Date: Wed, 27 May 2026 00:22:53 +0300
From: Ruslan Isaev <legale.legale@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: sean.wang@mediatek.com, nbd@nbd.name, lorenzo@kernel.org,
	ryder.lee@mediatek.com, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] wifi: mt76: track rx napi ownership for cleanup
Message-ID: <ahYPLdcoyMmzk3WN@wico-dev.wnam.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahTdpNQp2va_xTVR@wico-dev.wnam.ru>
References: <ahTdpNQp2va_xTVR@wico-dev.wnam.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_142258_931745_30DACD9D 
X-CRM114-Status: UNSURE (   5.68  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Sean and others,

Tested on:
- MT7915E (PCI ID 14c3:7915)
- MT7981 WMAC

On both devices, the Wi-Fi driver module unloads cleanly without warnings
or errors.

Regards,
Ruslan

