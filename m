Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F0FD3C934
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Oct 2024 04:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPX042dJwNsDd6EwKBGzToksDykTZ4Q22JDteLvPDCA=; b=fsM9DMIyZo2mM+thiENuUtVfRU
	FTBXDmoRmCemF+uwErQsUiMdLFdvELIsMSEPSk3OcumcWtZnMCNsJQoi0y62XIIG5MLwxZ1qge/nM
	DqSrWacQbJgn3FNwq7ooKZX7lguPvpuRffGoTrnNPxYJ37B2CK+ciJ3hyHnkN/wzNuw8IzUAitI+k
	h0DBsWyKzZIhcezKcB2i7SZFWeYjB1+ngKLpbIL5TaOYam6CAsSkDk1hvjdxsiJW9lRyBc7B5ugzk
	q+ExLMis6KV16N2Xj5P2zTv/TQDsv1kapOukRLBaE8kDbvRMtwAijgRFqxE4kNhNZdocSa4IePP18
	Pbky93MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2NTy-00000004OhS-1AYS;
	Sun, 20 Oct 2024 04:23:58 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2NQX-00000004OFk-2wU1;
	Sun, 20 Oct 2024 04:20:26 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2e56df894d4so1504002a91.3;
        Sat, 19 Oct 2024 21:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729398025; x=1730002825; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rPX042dJwNsDd6EwKBGzToksDykTZ4Q22JDteLvPDCA=;
        b=ZYZ6QncK99YZh3SXGA/LzvmEbx1YvXaF0BnDfispoZiC7cDPmMGF1/hVYMiJvS5aVm
         pFgx5VzLvouzvP/QpVvN7AZ54mZv0XJ6NloKI20A0Rtl1As5/LCPajw0hV1SVqSexEv6
         4uSK4XTFROItEPyqEzHp4neTzYyZfrnes8G0yV8FoKRAwgm/MOgM2W4Zq57f7Jrm8Vnt
         tXJgPqRa9osPbUicB6Qb4CMNDGEDVFWW3A7pZZF5G24TKtjqsjhhiZgK2cYmZOryn2lP
         51QOjbHx5St11FtuQV4FvhzW4l3/3mikU4OQA0NHnjFuf/S7tzBUMKKraqyoGnpHNkK7
         2jEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729398025; x=1730002825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rPX042dJwNsDd6EwKBGzToksDykTZ4Q22JDteLvPDCA=;
        b=NiHEEl73IS7KqOhDsAseF9SZwA3rO9Mf3Kv12HCbg+u/J0yczo2vpL/4bJpcOIY9KA
         D0s338yNf9vgAQoxl1sWG7JKn84uBj9Y/+P/DVuALMkOFBImK5kxygMeKFVCneLfC90W
         nRVHdnP++ZE0HhEwWNYymbqheGXfGvkULBnaQDcsToh04jfqphKqAukxNJb9JQBJtXv7
         MuL8VGn0anwtQtAF7QI8E4eKav6Qm11xcddkL2UQ1zpyItpRY13zvJTbStODyv85A9qj
         9NhsAXl/LzRI7vo+k/NDEpwMRyDVIsZ7njMSzIsWqgXjq3RnZSInUVBQMgaQzfGQ9lNJ
         7t3A==
X-Forwarded-Encrypted: i=1; AJvYcCUSXvEEvU5KzCFLK4sR+JEnXBeIbojx/00uH+4hk7MklSg4fc5RBsTiVF7NpOZR6ZvYmHJwkXxGrgoO1e7EhEqWbw==@lists.infradead.org, AJvYcCUv18TIr2OYXXpwYT/GJeD/ljHB1RjIDVhrZUVf8FSm2GAfTm/11WuLRvWLH4liVlQPsjLksj5FWinC+0Y1ILXO@lists.infradead.org, AJvYcCXCTlire1Wn8GIkEHKS9n60NGAtVgF/p9XshtiEJUFzLUce+AI1L7qkFcUI4sGnfycORgyDQS7LmVuf1ceasZo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2xS32scDUQjv3vcqAks1dAZp9XcORX2sDqfzqjXP+lAft+W6u
	oFu5pfNUBK/1ttlMhzpQoWkCYJ0dWXLhfVxNwcsLc+ZCMK4Eqdqr
X-Google-Smtp-Source: AGHT+IHA6YFEqEtg61PXYGVgACwL+Cintoefuk4OglOjvjRf+3hwgSbRVFqdWX6TDCZbDfVBCqjZbw==
X-Received: by 2002:a17:90b:4b03:b0:2dd:6969:2096 with SMTP id 98e67ed59e1d1-2e561a230ddmr8389123a91.38.1729398024690;
        Sat, 19 Oct 2024 21:20:24 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:2ce:a853:5ea4:fdb6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad4ee3b0sm644120a91.42.2024.10.19.21.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 21:20:24 -0700 (PDT)
Date: Sat, 19 Oct 2024 21:20:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 10/10] Input: ts4800-ts - use cleanup facility for
 device_node
Message-ID: <ZxSFBbo5sO3w_9sl@google.com>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-10-ebc62138fbf8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010-input_automate_of_node_put-v1-10-ebc62138fbf8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_212025_760934_17FEB8D2 
X-CRM114-Status: UNSURE (   8.31  )
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

On Thu, Oct 10, 2024 at 11:26:00PM +0200, Javier Carrasco wrote:
> Use the '__free(device_node)' macro to automatically free the device
> node, removing the need for explicit calls to 'of_node_put()' to
> decrement its refcount.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

Applied, thank you.

-- 
Dmitry

