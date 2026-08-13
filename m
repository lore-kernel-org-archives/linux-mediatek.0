Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA03C5B572
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2026 12:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qozE/6Jsz/i/baB0e57vxp0gFaz1rBUfSBvJdVPfpxI=; b=IRBERil5wJV/lfiRgnQtn4oRVx
	K+FfbSmGNbA3pNMpNyjZdIKfG+A7rj2FvQ1iPjH69dDnZquxM78pE2LqbrUn4BhszLN+Vr2azvJBa
	lr0exNwZKqVYLbUSnoVDNXPJ59yRfvBIc3QM2RtD5HTLon9j82xnsGDQ71AsttL3NI0fvmdfeuLvw
	w23ANhVk+vcynkOUFy9IS8gF5+O9QwDZQw2lj84SGybWEA452U7myUnjWflHTgq3fZvW4gIsp2vQF
	CJWgFi/EMZ8rotW1LnBl29kwGol+PCzySaLBFjGzp0CN9bRyLTVvQbRaTS5QpzLkY4ZC3gOB98qBG
	nq9Hks7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuUhR-00000000fC6-1QQo;
	Thu, 13 Aug 2026 12:38:21 +0000
Received: from mail-wm2-x07.google.com ([2a00:1450:4864:31::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuUhP-00000000fBa-03WG
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Aug 2026 12:38:20 +0000
Received: by mail-wm2-x07.google.com with SMTP id 5b1f17b1804b1-49557073245so2314835e9.1
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Aug 2026 05:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786624697; x=1787229497; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qozE/6Jsz/i/baB0e57vxp0gFaz1rBUfSBvJdVPfpxI=;
        b=AHuMX75aOlQlljHd0x/aCtAyxlGmsJmlAWQuWYHzJqJ1GRBmTwVrL+2ys9FlLog2Kl
         G8odVbb6yLsYKbcpBk87Ia+mLUvSCGGrJBLfWMZjbUtFFyl6qyqr1SFa1ubecDq4qd6j
         yaJfekEtzDpCbCVXqUqSQEpa+ICEubAlAnC+1ZXI0w+soW5KVLADtI7CWXTl5LfDsGkv
         sTgf3Thl8SZO4nBx4BHEMSUyIEouBDk+bkmi46UDnr4toXkhmWzX/XjVC9fxwyG1emAw
         ImYggz/jckTSYQNSLaw3BQfGOP+GuNkBDi74is2DTGGjb9SULXXao4twN0b8PN295P/Q
         +Erw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786624697; x=1787229497;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qozE/6Jsz/i/baB0e57vxp0gFaz1rBUfSBvJdVPfpxI=;
        b=PHq0nft6g38ETG+RmbhXGFXzQxj96plLTeKHZ+ppVzPgv/R9BjmLK6L+FBQcI/kzOs
         u+78S7uhBeKhYx2L9tbjTWNk5qi7QCCyCF8J6ayNI7Ta3+u41irc9+iCEO6Ht92qDyxa
         4zFZ6+4ja35Np+Sut1i67/A8nJOdMgSXzVevrGMUH8NwkbpzJPLlXegTwe421ZFE0VFi
         hp4X7u6SE97Vm+mLlRf8R4rdHAIy8iIsf5yRVrPXzYaqtx2R+civgCU5QwCQuHFKYKdj
         x+5DAaOSiBjFlZ8VNVuDZzqALytxoI2rDMSxhy6t+CicfYTY+SOjWTRyzq85exP9LorY
         T9qw==
X-Forwarded-Encrypted: i=1; AHgh+RqXDsTjv/cW7jgV4UMbV0Qf4ahr/8JDlFmzI+ntOgDpX+BrDNfwNhhg8BMVq8nGcFd2mV7xX9BGIXJTiLEBWA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxoLKL34spSxkmEBkjY9RxIYicS97h9oaeRS3I2knV5HwS4Yg2B
	u9jcYfedYJ0BEgnhk8Gt5QIz+RMqMW9niaFfKm3qf8j0xkZA0f42zb7K
X-Gm-Gg: AR+sD11FUAHuD+kI4a6NZuQuQpEKcMSzpEYv7QggG2tEyO3aPUlVQ2prgT/MubtW+nQ
	zEVP3x4tDGfJrucq8QSoS6GSBiEBaKfE7IKtx0/iNflNBOotz1TERWgkccmV8QfHj8hNwALSIjs
	u5+jLW0WN0atkngvkeTWHJh0I5mgYrC7gjqrWCBrTq5BJo2geDoEZGQqZWyWzR+2GEP3wRcauTO
	8ctk0P8fA6oYIgWHDEK+yFPDjJE+fc2m5UglSGaNrcTBw+88CbQ4dTWIO//RxZfoQ6KM9x4surs
	nyhjXaIgBUucS9pLS/coYz5WLBb5PWDxDhhjGxOrT6J+ToOtD3injonZ2YpcET/FP4EbPW/oFdv
	uK+xSFqb47lwWlKAy5rua+eM7eT1slOkYIQIHNBfZczkgx5EWFpq4hGAUy+lhKXWku65Wl6t28E
	H5gLItqAtAODTXtQ5dbLs/K7NNyfrPhRWBbAc+1G8usdKPvj5j3B/MpSxpHHeAjhVZqNrlV4wD6
	wHJNKJDljl1SR8pgoyGh/npZkodKVLgMDJlKW3tP7LdamSfeF9hSDPsNBM=
X-Received: by 2002:a05:600c:1d19:b0:496:c379:b2a1 with SMTP id 5b1f17b1804b1-499821548efmr77322515e9.2.1786624696381;
        Thu, 13 Aug 2026 05:38:16 -0700 (PDT)
Received: from fedora.fritz.box (dynamic-adsl-84-220-246-20.clienti.tiscali.it. [84.220.246.20])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981b585b3sm67349925e9.10.2026.08.13.05.38.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 05:38:15 -0700 (PDT)
Date: Thu, 13 Aug 2026 14:37:56 +0200
From: moosager <moosager90@gmail.com>
To: Devin Wittmayer <lucid_duck@justthetip.ca>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Deren Wu <deren.wu@mediatek.com>
Subject: Re: [PATCH wireless] wifi: mt76: mt7921: check drv_pmctrl return in
 the PCIe reset path
Message-ID: <an23_8DALILoGLP6@fedora.fritz.box>
References: <20260809012309.43657-1-lucid_duck@justthetip.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809012309.43657-1-lucid_duck@justthetip.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_053819_057011_E33A6002 
X-CRM114-Status: UNSURE (   8.27  )
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

Hello,

I can confirm the patch works as advertised:

> With the return checked, 26 ownership failures produced no firmware
> download, and mt7921_mac_reset_work() got as far as logging "chip reset
> failed", which it never did otherwise.

I would like to reiterate, though, that a more complete fix should be pursued by 
anyone who has more knowledge of the driver or firmware. Previously, a marginal 
improvement like this one was applied, but the issue persists to this day 
(see [1]).

Thanks in advance.

[1] https://patchwork.kernel.org/project/linux-wireless/patch/727eb5ffd3c7c805245e512da150ecf0a7154020.1659452909.git.deren.wu@mediatek.com/

