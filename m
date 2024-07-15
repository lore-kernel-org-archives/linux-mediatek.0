Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFCCC3DA4B
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jul 2024 17:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9k73sA4KaYZWSPUciUi3HDdqr3lc/EAyIdqeVOGRMM=; b=Yp8IAU4o8l3iBt/lHBP4V8lbPn
	hwa4fpkl5fD6MZ3rhjeYohdYaMWQrxaLIkv1nTy73tzjo5jNbVL6+/AKt/KyCd2yY4J7MVwPZVJVN
	NSgVBxNn0gmve8fyKWxfVD2mCfhIFGdkv2xkKAwTykSMS5DNFktdFoXq3QxbvJ0+31+tMoVrAYRsg
	HmnYycut6PRIqoQQl1Fhi05yWSqXlaZlvReW4LpW7iJ37fYCJiwqGit2yBMDUjXDbubW50OjfIqra
	NiP1zM7MVKf+UTgAut0GyBAnF+S+SmxiYjJyATEqr8laU75mw5Llh47nRJ5qcPQdT8j9AJUQQg9Ur
	a0ODI3+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTPOG-00000007qMw-0cuW;
	Mon, 15 Jul 2024 17:21:32 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTPOC-00000007qLt-3aGM;
	Mon, 15 Jul 2024 17:21:30 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-75e7e110e89so2587549a12.3;
        Mon, 15 Jul 2024 10:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721064088; x=1721668888; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i9k73sA4KaYZWSPUciUi3HDdqr3lc/EAyIdqeVOGRMM=;
        b=jLfTYEe9jmoHUl9JXD5xyI0lvJCEfrTfEEShGf+HfdJAdhy8G68Ch77o8s2A4V9uUJ
         4w9/I1kwrTGe/UsXqWTuvfGD9OcY9aCaTc3+5ZwCGP+hnEm+52NUQiqfy0YN8wx83y5B
         5CUETTMOpMEUVdLLHc960k7tdMZ+u6qLDVYaovBoj6XB7b9w3aFNSOb4njvTETKowTZU
         v7qxHFOkpb347yGn5UVMp0rSIBHJWBocmHpzYch7y48wS58TNq0zh8YJk5ZbmjISfb7e
         r9kt3YmDw3I7zmMrtZQRX+4UID/qBg8nG3SEuly43NW8PG8V3H+R5HopYqDtJBaasWtT
         Y9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721064088; x=1721668888;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i9k73sA4KaYZWSPUciUi3HDdqr3lc/EAyIdqeVOGRMM=;
        b=ePPF418AykZULnmgsprlgrnXeLh0lptSXC8ol7Y5unVUT/Oif5nmjWt/fmjURs8sdu
         VEcVCwsX+0qDGtnCOxEKEziCXJc1ZyUaEF8D5J1FVKWzvuso9r/HvcMHjfaR5ZKJjRWw
         RHF9i8G17fCbIqbmD9O7SeQzSKDdd0ZoomgenPsx6hLEb4gmv02B3mDhUVgeo5tPpIwN
         NbPJQdksp4mgqBfyxLuztTTPassDEm285h1gPyN78xlZGeAf3kcWfEiJD2diCUWDR96a
         3du7BU3VK7E8SxlfgqH+ySg0RnXLjLu41nKlB6HrR/Gu/Z5ecmtf8MdBASdvPHcYRD25
         AWuA==
X-Forwarded-Encrypted: i=1; AJvYcCWP15RGQ3wHtfQRbKYUNdsIMUdc8FSo6SzL2dmkJp9rJSLGBe8o2OJZZIobKB09aoXgZaaMj42N4ixEv5E966ogPtyAxoBa+KaJnF8tzJgK4asm5MP6AZloFmn5SLNBPytLPS7eTE69Qr7t7TAdnJ+qAzPd2jFFB0U=
X-Gm-Message-State: AOJu0YzGLI+KCl0VkaTn4fyfgQ3UL8uO72+fTugHYRv2PPC60iRwW3He
	QSD4S+ufw2CsejztnZ1G11jZYqb9d4uSJ+eSNjiPJjMMzvNv1gtuOZ0k4Q==
X-Google-Smtp-Source: AGHT+IGMeZvsUWpVQkC9G9DR/tknpdedHPhniJeUBf540YOjexOrwcOmXJRbjo2pfRCHhHE9MPBbzw==
X-Received: by 2002:a05:6a21:10b:b0:1c2:94ad:1c5d with SMTP id adf61e73a8af0-1c3ee506766mr603367637.2.1721064087793;
        Mon, 15 Jul 2024 10:21:27 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net. [141.239.149.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cacd6da7b4sm6688202a91.46.2024.07.15.10.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 10:21:27 -0700 (PDT)
Date: Mon, 15 Jul 2024 07:21:26 -1000
From: "tj@kernel.org" <tj@kernel.org>
To: Boy Wu =?utf-8?B?KOWQs+WLg+iqvCk=?= <Boy.Wu@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"boris@bur.io" <boris@bur.io>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"cgroups@vger.kernel.org" <cgroups@vger.kernel.org>,
	"axboe@kernel.dk" <axboe@kernel.dk>,
	Iverlin Wang =?utf-8?B?KOeOi+iLs+mclik=?= <Iverlin.Wang@mediatek.com>,
	"josef@toxicpanda.com" <josef@toxicpanda.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2] blk-cgroup: Replace u64_sync with blkg_stat_lock for
 stats update
Message-ID: <ZpVals5maZs4L3e0@slm.duckdns.org>
References: <20240710061334.1888-1-boy.wu@mediatek.com>
 <Zo8HTD2AD-b51q0C@slm.duckdns.org>
 <6114fbad7bce9b15806bb9fee25a1075ecb53dd1.camel@mediatek.com>
 <ZpBIfwThiVwstlXL@slm.duckdns.org>
 <70c37035f006de3a4fde895ceeee92826cd280e0.camel@mediatek.com>
 <ZpF4Pfu83W9Wp_R9@slm.duckdns.org>
 <5a1e1bd5168696a0857b62572336c5e598cb5493.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a1e1bd5168696a0857b62572336c5e598cb5493.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_102129_049636_A587AEED 
X-CRM114-Status: UNSURE (   8.86  )
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

On Mon, Jul 15, 2024 at 07:15:24AM +0000, Boy Wu (吳勃誼) wrote:
> I think I get your idea. You want to replace all the u64 sync for
> iostat. However, I have one question: why use blkg_stat_lock instead of
> adding a spin lock for each iostat like iostat.spinlock? We don't need
> to lock between updating different iostats, but only lock when updating
> the same iostat.

Oh yeah, that'd be even better.

Thanks.

-- 
tejun

