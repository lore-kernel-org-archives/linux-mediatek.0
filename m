Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40266606A323
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 02:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T/4e0iFp;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ugD1fctV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-Type
	:References:In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=h1ArAbbh+Nj6+8II10ytomm7q9koo3eQf1sW7tmJxyM=; b=T/4e0iFpnANcLNsLKpISSGccFJ
	DaTFhuA32u1aoIOTIn7vWj5srFZDQT+wlKIoZnRN2BC8Xeqxe/0/pVguQG78J81A50pG0kIRv8cih
	XwaAl5OM63p2qgTF+d2/TSfST8PIYfs7gPNwkhd6Ejk+xPUshvtFFcT2OIfG2TtRZn6zc48rm6BX7
	1+fHZqM2kw5D+GrHD8OLY7e3KpGWFSz5sVdu/+0W+HdT9sC4U94JGo4y/7pJoNg/zCBin9BNlzDeL
	Tx4YPk/RZTp8fNVQAKAPqEr6FwOFNqlGb2szQgg/K4Xq3rY2J7ImlR3OfR/BNkMuJG495kMjzA0m6
	GVt/sWjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlUb-0000000ElfF-22xh;
	Fri, 27 Nov 2026 02:15:17 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlUY-0000000Eled-3KqA
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Nov 2026 02:15:16 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8d2d4cdb478so45797b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 18:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795745714; x=1796350514; darn=lists.infradead.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h1ArAbbh+Nj6+8II10ytomm7q9koo3eQf1sW7tmJxyM=;
        b=ugD1fctVKFsd8x3Mhws+PiTUGxnsAz9iRawCgprJH4S1uACiQ6qn/2LoDQFRiwq2Gy
         hCBJoLu4k5E4Stjd2+c236e5AyopSaEuyWOPO1eVQ/6sbkgEBGaMJU2Me/0EYUGm8DRQ
         E+r2RXEGjXFKfcMvP9CZt0178OePX2lbvmP7n+JDmOEzG50nR7eUmSVA4GeSFDGkVR8d
         h9x6Jm80sN2NIdNzOely7qyAezxs+Vfs26KfSMFY9pN81DH2gxwlGOnMhdShrDZN22qX
         oVhlE8mR7ElbDyoCxatOIfNR0NMv6ZF/T11S44KfYoX1SyFMtgphcvigIwqcGg3gmepp
         5Hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795745714; x=1796350514;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h1ArAbbh+Nj6+8II10ytomm7q9koo3eQf1sW7tmJxyM=;
        b=QC76xQ+t/pZALgiS4MToWlU+2tuOG5yTuBJVkZLpPcVoaO18GwigT6I69elAn8e9HE
         1z2bc8QGG1JlP+2Yy25PlXMhgEVkH1AZ9HSltMNsoQWlnZC3p57s/xvR05ch8IxY4xkF
         AUTkggKh+xq67OnJCjVSetqv3sOAql500TI9q9XnSKQs8B9f+h5N1eMUb5E0ayNQziDD
         ZFCa+mH2M/YzkOAQynOTQG6sr7WZANLMD0gJUTqGRgLEg8uhqEgf0clNC3ht7gmpeiu6
         LL4XnHu+JMBq2JIC8qqCowcbccHmt81yiv3hXE9liQY6H9YyBPIQIdD4whNLOcb6+Hbj
         0Wfw==
X-Forwarded-Encrypted: i=1; AL+hErHKL9ds8C6Q38a8M8pPVjFIPMaTBT7fzx070Q+WLpObBcAgPW5qQM0oQD1pSsXDGalotClSBO/9HMUdSxv3pQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/yoPUBdDtO04PluOqUrkZunGCFyLxxy7Hv81ZuIuZaAZTp07f9
	iCwx0hquBwu3UwOH5VQWmnG4wS21ZZnnEB3zm8iGCG8KLKO3iE+0BoJt
X-Gm-Gg: AZFdTZcg2qhjAkzgv3x7s006mSOEzKukXBMHJRpYcsnMxG1pZ1yvRfMnJ7SH5vR4u00
	LONs/Hb8rNqlORMo99ZBVenKS6GzkNKdqoCKLhsnTzP+uGFH3DGd0lg7N4SIbfOb1aNguMHMuqL
	H8rifnjlR1HfVPKneShpnCorhJBBsuIyGHSuIO+Yhs/9YNFTvzvwUzhaT7xKocX6wcGYQdxaFNr
	o+DTtSdQBYfpWHSC/0QTwBR/8iycZ5lxkGhUpkkLRemBqtlRWd2So+MGSmQKU9V6KS6eEhp6VZD
	sk70L/M/aR0LBelxlYrPJq00DyWC4uysDJyjq0WX9thPaDDSNoNuDvlmv/tXCA96gqS1Exy4sbz
	MN1KHYD7Xc/fJ7AdZWZ22K3ktSxdfGpgKVbXfX64mfdiIZX9GZVC31Jm9zom9yEmYLoDT6JxAsY
	yqMRLvzRvdfDWuw/F1fKEUvOJaCBHhC85xZejvLNGPuHPbM0LCLWEL/crbiFeQZSMWvGQGs46hf
	Ac4VydkTWDez6K2LYfhw7lUE5b+BJqdLVln/EqIx2+Ipa1fXOJJhzOqoRzDldlCPkytQZfUFtOJ
	lhTUFZq6fFZJMR/kBMIcVWF2NHwoVbZyuqztvWWFuL1m86nx6TFW6zHl57DVDP0CihGQ+isvUyM
	=
X-Received: by 2002:a05:6a00:c4cb:b0:882:2b16:c314 with SMTP id d2e1a72fcca58-8c922b00017mr13559729b3a.52.1795745713852;
        Thu, 26 Nov 2026 18:15:13 -0800 (PST)
Received: from mac.lan (114-45-165-38.dynamic-ip.hinet.net. [114.45.165.38])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077babfsm11807929b3a.5.2026.11.26.18.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:15:13 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, broonie@kernel.org,
 amergnat@baylibre.com, leilk.liu@mediatek.com, me@adomerle.pw,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] soc/spi: mediatek: Add MT6789 PMIC wrapper and SPI support
In-Reply-To: <0Af_vuU3D7JCxCsHmjyJZCQhptiOPd3Y325yrg4ufwjT3C5cz6cgJxU4CHY4qfES7Hhzcb-sxm0o7dj-diOzMJPCcw5bSyrYi5CWUNsXQus=@protonmail.com>
References: <20261126031001.27288-1-iasnezhkov@gmail.com> <0Af_vuU3D7JCxCsHmjyJZCQhptiOPd3Y325yrg4ufwjT3C5cz6cgJxU4CHY4qfES7Hhzcb-sxm0o7dj-diOzMJPCcw5bSyrYi5CWUNsXQus=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 10:15:08 +0800
Message-ID: <179574570832.2422.15788597758077074271@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_181514_848407_99E9A38F 
X-CRM114-Status: UNSURE (   4.28  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 2.2 (++)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-1.9 required=3.0 tests=BAYES_00,CTE_8BIT_MISMATCH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Hi Roman,

Good point — there is no dependency between pwrap and spi here. I will
split this into a standalone pwrap series and a separate spi-mt65xx
binding patch in v4, and move all review-history notes below ---.

Best regards,
Ilia

