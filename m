Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B4AC5AC82
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2026 04:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+3HW+UbDinwr8l0lTIom8vJ4+7ShLxx8WvyQiMaSHk=; b=GBEHV1NtJqcaegov/mAqKxMjtM
	8fi0u4UdI4swhSQQeFoa7zPcHBO/bftug7SPV5tjrpakRHEgCdJw10SZ9w8pcLEeODt/+8EmsWts5
	IFvuWOZd45wOqW/1mmgcFRsv3Z7ZzEgl0nL12NdNla6arBghOW0ddw9hzzJPaRvYgMAPmfeWiiGq7
	h+7HEHJqWfNBGx5nJhNPldbjLC2+0SA2fn7qD7Omz475nl0n2hGNZFIn+CY+BkUkjDYCAMfXoMCwW
	5iE7z7J2pzz9qPe3BFrHaI6MwCDxVHChVj/ltLGiW2BHJniIJhC3D7SU/3/3eBBOg9lyI16YB3CQa
	iQZ1KR9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtHis-0000000B0B5-2Iqu;
	Mon, 10 Aug 2026 04:34:50 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtHip-0000000B0AI-1mGh
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Aug 2026 04:34:48 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2ceaf8a1265so22732575ad.2
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 21:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786336486; x=1786941286; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=d+3HW+UbDinwr8l0lTIom8vJ4+7ShLxx8WvyQiMaSHk=;
        b=Il3ool/+M5wyk9I+v+1AxaQ0Jr8BCnqCp+ttSttJdlEAET24Ov+1L29+Y55pkx02os
         fZ4QOaMB3Lv/kPO8hk/NNnOoDNS5iItXJAL0aaymOyMlzfGkSisYWP3LRV50jE03qgJJ
         JWVDHhXypc9OvqxGYNpBnGHvVfgO9S7BVNRTyqKJlWunF+VDvtyvDyyyA9rTxTJ2uAMC
         nKcZUoNJtVrbAKShvGNiUZQ004cF70IIDr1WbvGsfdK9zPV11c8mNiUYGXTNoy1dWkKZ
         fj8b4OzI6oAhJBGrtCE7u5chm4o3wtyj2d2ErU/TiMCk4hQAu6fddpvJgeY4VIEteQ5P
         xGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786336486; x=1786941286;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d+3HW+UbDinwr8l0lTIom8vJ4+7ShLxx8WvyQiMaSHk=;
        b=p2v5YilXZxwGHBn0P4D2umq6fdmdpzjW5b3h2OeQlC9iA7k7onN/h1uwHA3c/Wd4ZZ
         L3ykIN9bcLpwLstpecqaq6F2Vk4av5VeBPt7jHOZ33zy2tVUfENXBrWCQJf5HvWyplPd
         MhDtmF4Mof8GSZqcIYkeK1iCWWZuepiiqID3w+oMxIa5U994nLpWEN6AgWxy5TqExbgU
         UakBw83rZRx1aZeppQTWjThxav4j23psl0XsOjki5jzeKl7TRyZbOiCogr04M8hpaUUY
         qcrbUJFwwjNiAtRsefQWw4ZJuLBl63ecLriIhHrNzSOq86uGGquDZ4xqOqJPn8zN3cq1
         ULKg==
X-Forwarded-Encrypted: i=1; AHgh+Rqfp01f0hBA27YUCX8rwWV4KPfRPkmG6cs9PIWPN6DNTqDc3VOw7LhC3EnoyZhDR2Uy+JhvCUJ9qWx9ZNmKcA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1EKorwDaHq8PVeVbwcbSRLiyhcYKk/9n4cgyp8U/k/fNTRvnU
	mMwC6QpsQuLpNSAXyvT2rHCUK6rbPdtvwoGle6JsIAn8yqQ4iR/LcX8T
X-Gm-Gg: AR+sD12YzifaA+9am2j4Z5+geDttXapSW4+c+MKfpMNAVdopxFJcpdjhZmOClAqyXDm
	itoq+CiDVbVmQtbfiBYG57ajxmGHiNeSTHcfEHFwSnEEkNyEltiyYwyCJ4jLPBaiDLlZxPtalwF
	K81kFurju7KJPezKdBzHrKRxP0Ug4TxJL7vVI+2v2LFFRbIVcNLR5qZP4ZlsQ86baeSV/Kx4dTk
	OAHtHT+1Pz6Q6gDaDNimYlGqEStpYpcjCByB8hfN47H4dm5kBhMTCn8aOsxQWF1Q/fS6AbTH64o
	gWd/+5g1PViN56StZiFF07GAzcvPDqFVgI5j9J7jk22670jdfTiqTOUyPV7hdNLfiyp/yNXPkk3
	hQE6mSI8WcobxFUXFWZJuirv9AFdUyv17YiUn4hlWmUu9kUVZ42Z/9Trz2huYX2KNyFVgLziszo
	Zx0LHv2T3FllArDoAcf7RiJXWgKtuUEz3j9IvbgPpGC/6zmIyjusGMmSlaBZHC1NFaRixiW7jeC
	7opRZGzLrU/
X-Received: by 2002:a17:903:ac4:b0:2cf:a1c0:d4ca with SMTP id d9443c01a7336-2d0ca961ad6mr521823535ad.22.1786336486542;
        Sun, 09 Aug 2026 21:34:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d16c502bbdsm28714455ad.81.2026.08.09.21.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 21:34:46 -0700 (PDT)
Date: Sun, 9 Aug 2026 21:34:44 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: phucduc.bui@gmail.com
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/4] watchdog: aspeed: Propagate errors from optional IRQ
 lookup
Message-ID: <443b829d-67f1-4af0-9e07-021e1592bb0e@roeck-us.net>
References: <20260807081652.38692-1-phucduc.bui@gmail.com>
 <20260807081652.38692-4-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807081652.38692-4-phucduc.bui@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_213447_464874_89E5A286 
X-CRM114-Status: UNSURE (   9.61  )
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

On Fri, Aug 07, 2026 at 03:16:52PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no IRQ is available, while other errors should be propagated.
> 
> Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
> probe without the IRQ.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Applied.

Thanks,
Guenter

