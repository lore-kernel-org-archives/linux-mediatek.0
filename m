Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC77C55822
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2026 20:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBR0k3B+Ox56qcPWJ0TM79yte8w4B4AOdAQPCwDKKzE=; b=HioU1WH8ZnXFMDumSgBOiB4JM8
	UwdkIeWA4T6wuk2G6k3TQwX0qtkANDi5aX1FgbhPRqO4Qo/fOMv+yuuOhjop/VS/uE8Rg7kN+sD40
	TxydoQIhljGGtjuXlXugMCwL9QLj/1ilbZaLI7aE8bYOjMstEzKFLeRRKCiO3R0m7KprJspEIaZqO
	NY6nxgDkmY30BPsszEOyWudF7Ibcy/Yt+NOb9n1/2cBQPt9WPOyCtwJBJ85m+P0mMR5U0NnPSZoiL
	auBAugdWLgd/h93VpT8Td/rHVlwBkGezJCkjzAQPntt/i65jr5ZFBGm2E5FTg3ddnHIHyvms31yfm
	ZD3Cjfkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrLbx-00000002lGt-2ubG;
	Tue, 04 Aug 2026 20:19:41 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrLbt-00000002lG3-3ysx
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Aug 2026 20:19:40 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-ca12086c06eso161294a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Aug 2026 13:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785874777; x=1786479577; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hBR0k3B+Ox56qcPWJ0TM79yte8w4B4AOdAQPCwDKKzE=;
        b=Gv+JdJHcnukypVbvVlicUdJh75+jcZFwuCGcUAet2ZJKnN9W6GdrVwq9Zh8ksaU9mB
         /8+A5VDkDS1b/WM/lAqK9JV63nqcWT0YAdf47gVseE0EZaSix/e9XBcGQb+q7WO7zX+Y
         MReJP+vrCVMt6ndEAU28HGgRATCgZRvT065SKnPQSCOdzSwGrNx7ynVeOgyi5T+paRgE
         x9G6C3+YsC1Dk7GJJey7jn8nvrnfF7L2ozw+4M9vjCYsJUWPQbC6kUN+wyxwnht29Prq
         WKadNlCzjOpoO0P4BZyKWbLukoYIodarXnFHJZ1Zpa6dekXu10fyftzEvnRxxYmqEDeH
         zdtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785874777; x=1786479577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hBR0k3B+Ox56qcPWJ0TM79yte8w4B4AOdAQPCwDKKzE=;
        b=JONbSiDp9ToXSHFlhROZqACKmy6cSWkj/ySCmLnUAh2lV/CCJo2pHVFDQy/Hzvs9oE
         sF+K9CM7B/2PwesUzuGEcnXXDNRCyqasE38Oqi0E86W6tf+8/CLKxUgmIFUrXoVIPYgZ
         87ClXcGa0ary0k2mUmWif65Us9rnSy+rWNq9TtJsxhhbvSIFkKrlHFUhX+B1jF1jl5Yv
         FVmSEMMrxPF4I+X0MggVz6ShzeL+BwtcGj5LVK9bp9879KvAXv9NRbkdDizk54yrRXei
         206+HlAehyz5h6O/9tYNd/nNJq+CnIBb4177qmRM0LqstQ3lrRoqlredYU8ACfO4Umkh
         flnQ==
X-Forwarded-Encrypted: i=1; AHgh+RrlSZXrqGNlTRdr8f/O0sjBvdQfKvkbw3Rn/a8wRuxcMoTFob9Avh6qMO3TAStnTEO4EfrAEQccD9Qhipdjjg==@lists.infradead.org
X-Gm-Message-State: AOJu0YylLPA/751cnKMYBaMJvkBvW/WZ9oJpQ1fS2k4zmbgkiJVGxcT8
	6vm5kOkYp4lOE+IQ6tt3Cax8S153tz+IOInsQKsQ/v0GEOg8Re7xC9KGTQ3xOvxfCHE=
X-Gm-Gg: AR+sD12dB6hLQB3VeDkPpncZEegO9YKcOX4yuT4PTQx+143AtibH9pnCB4YzVJKzhjn
	i+ujj6TSBEVXSwlHN/RpnIolkBAbknaRU/KIHa5UsnxJI35S7+LjIeTVxM9tgpLL5A6SUHSyQz7
	STLy0cbEKgy5PVMsJVrnIRFsQXsUzqU6RJVu0TqIlHwP+GOxvNp8DtsHMVQTtvSeh/zPTmPKX+y
	c9wBm5mqo+m/W8w4ngnyX6ThWNs7qXnEQVARurcVoYVNoYAS3niamh6f+deNIaWTLgZ1V+oRdvX
	GMjAiaj2N7J4hB9Fzj4g25gs0imPAevqW05dWgmz6S5d1mVVFkIG/5fbFpeFNFVgdZM8ImI2cS3
	Yd5vWa0Pg9vevaBVVRWekgR47zqmJQGWgBJv+WNp8nVI9xg98b1VbEN69r1s+rGBCSkdJ2S3UmL
	cdsjsj4xiBo4lZHL/lVNJ4TAxj2dvxGDBddIauNvlooDg9KnqlsNBEa1mLfUSvHvXZ0KFbQbo4e
	GjvS2+C71nB
X-Received: by 2002:a05:6a20:d529:b0:3b1:cce5:9140 with SMTP id adf61e73a8af0-3cb85f4a5b8mr1402930637.33.1785874776947;
        Tue, 04 Aug 2026 13:19:36 -0700 (PDT)
Received: from localhost.localdomain ([103.179.230.122])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863b761asm12466072eec.1.2026.08.04.13.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 13:19:36 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: ryder.lee@mediatek.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com,
	oe-kbuild-all@lists.linux.dev,
	robh@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: mediatek-gen3: Fix 64-bit type truncation in mtk_pcie_set_trans_table()
Date: Tue,  4 Aug 2026 20:18:37 +0000
Message-ID: <20260804201837.2427-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <202608050123.GZC7hug7-lkp@intel.com>
References: <202608050123.GZC7hug7-lkp@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_131937_985561_DD66BBB1 
X-CRM114-Status: UNSURE (   7.42  )
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

Hi,

Thanks for the report. This build error was caused by an invalid function call in v1 and has been fixed in v3:
https://lore.kernel.org/all/20260728122810.3475-1-sreekuttan2156239@gmail.com/

Thanks,
Sreeraj

