Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21691CCD199
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Oct 2025 16:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CA7cuB52W2mQEAqgkUGyrUbyJm9rGb31mdD8XpbhOA0=; b=rK2w4rmlaZJAhpKBsZiU+3Q3NB
	Hp6qwdEpcWf7y6/H7L5yKYgyrMG/0FEZarLP1n8xbk3GjgNGx4yjFa9b5b/f20Mvr9X82GX1FPuHk
	pBmwbIuV/Rqii++0uQXGHUxfnUsYeus6KvHMc9dDBtodeYgVnONMii8QM0kDYn35cigq5iiVPpsMS
	GqXAbFcjwvMzjAYyd2YGd3XmsEox5qgdsPDJRE5eEndyJj2CS7PfWT5Oa+/XSj41MePjM+agiURBi
	vr9Bcs8/3YZKu8Vwfvnl7aBxyNuXscu5B3YU6TOzSM46rDZU3uPghqplzH1uFBuJ/I2Wm4Tuywi81
	KowuVh7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Qjl-00000005POE-3Z0J;
	Thu, 16 Oct 2025 16:21:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Qjh-00000005PL4-3tKa
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Oct 2025 16:21:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760631712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CA7cuB52W2mQEAqgkUGyrUbyJm9rGb31mdD8XpbhOA0=;
	b=AnQdXSbpbaqc+pJ5AFJnZd1+MTaEZTpyYBLt8EOnkDZVB1Eb8qeY27XRzoeElMREOyyqFU
	ULmSwLwTk+m1meb1mBkYc35xQ4U6jO8z/oASHPsfsUXSm2qFCk9GpJ1V+Z2mEoeFWFiPJb
	kH9VDsKR3AvS9iQRFryMqyjNVnpncHY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-sBdt6miHPA-19AkUxRTjrQ-1; Thu, 16 Oct 2025 12:21:51 -0400
X-MC-Unique: sBdt6miHPA-19AkUxRTjrQ-1
X-Mimecast-MFC-AGG-ID: sBdt6miHPA-19AkUxRTjrQ_1760631711
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-87c2085ff29so9622546d6.2
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Oct 2025 09:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760631711; x=1761236511;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CA7cuB52W2mQEAqgkUGyrUbyJm9rGb31mdD8XpbhOA0=;
        b=AkYQ4u7YmHTNRaY/qPhxDs2e38mFm2iqnEMnqUQ8laj1xbbmERK2+vgr9cgfh31V6I
         kx3OY3IVK22P/9lAzWX4cuxyrJX8EUUqO7n0eGzp/vgUJNkmBmQj4sv8z+lKKw+/MXQv
         pAP4glIwb8YgidX1QWRRQJUzskvRxFfKnBKs4iNp7hDSj6zk/In+Tk8oDiCfrF1a5QYU
         +oOIeld+4GmeRoBrHyDe3lD8i+R7+WzEynvYt377IBfspnZYJR1UTkVn80VyoUTocKqr
         gt1lcQI3GhwR7MIEvEpfxDgB+LI/igDhLAMz8YiIfguh14jRLRrvdym0cpgj4uOYoRLZ
         BCLw==
X-Forwarded-Encrypted: i=1; AJvYcCX4mX4p5N+OXS0AkdvI0ce5GAIHFNLj5rVAPNxwknJwDF/A0LbKd58RJm5lU+sbCuFznkGssbShiKu4jls0OQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzD07s8wsO3d0F+hvHliX8LY2/LYBu/OTpjrovj7s/eMIZ6kXoK
	OsjxRU9h5nAl3xpsCBEnnbZhnVYM+gB8idqqapxIVTa9XY7t3hcbZnHZT52QumzsgCGUGkCK4Hs
	zuaWEB/JHxmMUKctA8MLMyqtp9DO4822dG66SwwKXXtpVkXOEkq3j0J/z9JgG2PqIhfG3SixBeQ
	==
X-Gm-Gg: ASbGncs8H1Ocvq+Gy4VfUFiATbg6c5YhOpeVvHsnVdSy9d+hpFkiYmSVTpgnWiXWGwU
	XiMM8qKNEXTrZFI1/K0XSjRlo8G9cMC+ypHgUS3oEGLqw8s12uJLJLeCOWFKCRz48shAv2fjUSU
	157itTpU2KVz7l0L30VHtvu0QG6yww3OucqRg71MmuIykDme1PTew8J7KHKbavomgoR0myK7EpB
	Rm/weyJ8m/bOf43sTruxuPnFzzvWyZAZvr66wecVNoFiL2mO71BWbGtX79ACCf6EC4C5zUsliJR
	DuBOb7tKlT7Fy+xQl0mMeuRaWcZ1jqWLrx72GvS8zMS45Oj80vWcsJGMTkxTFQ6bOxSJAirfUJF
	To1Q9PtEi/xCfw12yR+nlQwP3Ibuc01eAHSrJPoil9qFkHSMeBfn3PSolfDkDPOta9A==
X-Received: by 2002:a05:622a:1a9f:b0:4b5:ea1f:77ec with SMTP id d75a77b69052e-4e89d091468mr10559541cf.0.1760631711002;
        Thu, 16 Oct 2025 09:21:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4xG1metr/rpLguKpcRm9DUmy+rwmLo2vG6JrUEiGqV+HAheQWldgSDUdPw7Kfed4P6HKKmw==
X-Received: by 2002:a05:622a:1a9f:b0:4b5:ea1f:77ec with SMTP id d75a77b69052e-4e89d091468mr10559121cf.0.1760631710594;
        Thu, 16 Oct 2025 09:21:50 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e885a8e10esm36941801cf.11.2025.10.16.09.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 09:21:49 -0700 (PDT)
Date: Thu, 16 Oct 2025 12:21:47 -0400
From: Brian Masney <bmasney@redhat.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 0/9] phy: convert from clk round_rate() to
 determine_rate()
Message-ID: <aPEbm5qK8-hkV3w_@redhat.com>
References: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 96rBTZKVAuJ3NRJb9x-qKiJqrcNHy8QIEFXCke3R2_M_1760631711
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_092154_041276_3EF72525 
X-CRM114-Status: GOOD (  11.02  )
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

Hi Vinod,

On Sun, Aug 10, 2025 at 06:45:28PM -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the phy subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.

I'm hoping to get this series merged so that we can remove the round_rate()
clk op from the clk core. The clk maintainer (Stephen) mentioned this work
in his last pull to Linus.

https://lore.kernel.org/linux-clk/20251007051720.11386-1-sboyd@kernel.org/

Thanks,

Brian


