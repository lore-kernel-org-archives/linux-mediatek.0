Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5747C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jan 2024 04:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CtN3ZmJcpck/YIjWiYKe7RqUHRSvK9EmrpKHkflf+yc=; b=0My7I4q+KyRN78qlQDe/T8njYz
	+qr0KZ7JKF5n3rgi+JtqZGPEYBlK+nFQPtuYxR0Wv0ZYXJFIWcEUiRRQ9H5pGOpKlxl2KvdMwf0Qi
	NPxNenSJXz7cgTxuqRQ+1cvynUyosTEw+qLh94LJlRmrE0siDQDX5iFikuIIvn639WnIadTSvRufW
	kR7qkz1gJ6RE46pqOsRF99WWjmdrVBWKslFMhh+5Khi3M2M8zneZa4h6wsxh7iaYEmYb4coE/xhXq
	E3sNjT1t+GgUXoWPQg5joUvxR0ULLSatalzthof1Z0El3kN+V+PQWojw7tQD9JewIgcbUOyZUU8Y8
	QP30uVJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rN3rm-006v4j-2Z;
	Tue, 09 Jan 2024 04:37:30 +0000
Received: from mail-pg1-f176.google.com ([209.85.215.176])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rN3rk-006v3r-05;
	Tue, 09 Jan 2024 04:37:29 +0000
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-5ce9555d42eso1955973a12.2;
        Mon, 08 Jan 2024 20:37:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704775044; x=1705379844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CtN3ZmJcpck/YIjWiYKe7RqUHRSvK9EmrpKHkflf+yc=;
        b=XEtqv9C4jjHJh7BvK+RR1+/eWa7RIJKMta/ZGVqabMScXC70YVylY4y7b2tezq3UdM
         HzNHkuR5uyJGLn+kcs0AXVUX9Vx88YW7LYL/ATpcTlek53geyiSRtdkKdRKBKqDkRKHc
         ps+LZZVN7/ml4uM1sXBRXIQtQYQA0sZvg6alBhtBFai4OmQSNTq9uNTdAr35CFLUp4Ds
         mnXRnkujmwD6Cg8udy4PFFdjydj3QrrNuAolsuDPbqIcqwGvKQdBn9NoKChoitpYBxYc
         jelKLtNM1gJXJzRc6tq+FwnVi7fRGQKHy5K2mjHGfJuaN9xnsgvxSoI2lsBKk8nPEH3a
         pQJA==
X-Gm-Message-State: AOJu0YyXJoV2S1fPesFQ+AIgurQvzJ6FNItnTyTx93j7Bq622yWwxBWz
	Dhx3XB/nScGjYYBunJPnPWxAA29eX8zZ2A==
X-Google-Smtp-Source: AGHT+IGnrfnENkktTC/HAy6Kyi0hoSLypKBEOvQYS+HnmqXAaepthmPAB61zJkRpucbhbGE3JnmlAQ==
X-Received: by 2002:a05:6a20:4298:b0:199:ee99:86fb with SMTP id o24-20020a056a20429800b00199ee9986fbmr571650pzj.44.1704775043784;
        Mon, 08 Jan 2024 20:37:23 -0800 (PST)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id jx7-20020a17090b46c700b0028c05e64f3csm806325pjb.7.2024.01.08.20.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 20:37:23 -0800 (PST)
Date: Tue, 9 Jan 2024 13:37:21 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, jieyy.yang@mediatek.com,
	chuanjia.liu@mediatek.com, qizhong.cheng@mediatek.com,
	jian.yang@mediatek.com
Subject: Re: [PATCH v2] PCI: mediatek-gen3: Fix translation window
Message-ID: <20240109043721.GA3337479@rocinante>
References: <20231023081423.18559-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023081423.18559-1-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_203728_062855_A6CCE652 
X-CRM114-Status: GOOD (  10.28  )
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

Hello,

> The size of translation table should be a power of 2, using fls()
> cannot get the proper value when the size is not a power of 2. For
> example, fls(0x3e00000) - 1 = 25, hence the PCIe translation window
> size will be set to 0x2000000 instead of the expected size 0x3e00000.
> 
> Fix translation window by splitting the MMIO space to multiple tables if
> its size is not a power of 2.

Applied to controller/mediatek, thank you!

[1/1] PCI: mediatek-gen3: Fix translation window size calculation
      https://git.kernel.org/pci/pci/c/8b7b89ef507c

	Krzysztof

