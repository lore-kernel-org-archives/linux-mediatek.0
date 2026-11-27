Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15898606A332
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 02:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M1au6VHO;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ie/UskJA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:Content-Type
	:References:In-Reply-To:Subject:Cc:To:From:Reply-To:MIME-Version:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Hx5DhP45Gc6LodtMts6vbsFotwIaFwhRMtG1SHCp+jI=; b=M1au6VHOuj8mPh3biZQgGdMVpF
	Wnvl7jGP9egYJqAaYSBULkC5ZJgPgviTdOHcKTUg4ku3db+sKlj3o78dcO48GJp2wVqN+woqXHjZU
	3kImcU731diK+YCIL3oqbanRi8TT5tYms33eRDczE2hR2YUNZ/6YjI/TDuylMNy+B8Y/ajo5eGNV0
	qGGEyInlEbIEGBf7OBIwLGbN+sGhEOMmkCmrT8XSJh2P/RONS6BD/f9u81VBFeGyLPGL3qRq3WBm6
	1MWTv/szx4Y9/o7oZJ/bjbUmX7Sw7Q0DlHBssU+RDBkg8WepFKw9yjIHWpqIE0pe6+N7+RKU76qvZ
	pPv9DL1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlcN-0000000Em34-2SeE;
	Fri, 27 Nov 2026 02:23:19 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWlcL-0000000Em2V-2Erh
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Nov 2026 02:23:18 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-cdb684859cbso4454388a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 18:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795746196; x=1796350996; darn=lists.infradead.org;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hx5DhP45Gc6LodtMts6vbsFotwIaFwhRMtG1SHCp+jI=;
        b=Ie/UskJAdnxgvi7WGnIXBW6KI9OdDnDT9WUZCqzjMp4ENC/3FUQ3O+lgYmXFLPr4at
         guCEcuC1UNa0eEOFwNkKA/pZSl60iiaJCDax+PB5lDow4C+SMAddU6RBdGPCXwfT2nBW
         5DNb3K11uG4Tvt/A/eL6bdfJz8G2bwcG5UDECjG4hrJjl14GvcSysEeMW6GZafay/AMJ
         fhh+u+IUnD0Vz3rqd9aLmSZxQdmeET1Snhl+jyZlXF6t37wmIgN1XutQZi/00w7a0z2R
         4LWaHHUX/+qVjPXHJvJK9mgj2qlEqJ5LaQyx6EcdkiknvEBtyMdvNC8Y610+XCtznhOq
         qd6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795746196; x=1796350996;
        h=message-id:date:content-type:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hx5DhP45Gc6LodtMts6vbsFotwIaFwhRMtG1SHCp+jI=;
        b=k/OeFj8xgcx6/wksFfqigAKXVSey9Ud0By19iXqzDr+6JNCDsp5poa4eSzHKURqTeb
         PmNi3pqbuc3ReXrMqXW1XYebCzNQemg6LT2dHiM9pGYwKkxW52PDtYn59YpNhogKoO8i
         Vq9nargd1qr1ZtR+GOh2HUn7eOMzL9yWJiK5OolGffXY3jmW/IEaY1lGMgSOW3LD37aF
         pXbtQOs1OnRsTBI+nSSpbeIu8hShWURXlMj6S5t20eVCUoANn3vaZzzkupd6E9z+N6Im
         s/9/CTNhS1QyddIBkhs05v1coH9WVwxIfvk9OF70OmNgrnDAoOFTxxVe+PZSygrfkk7D
         wpMA==
X-Forwarded-Encrypted: i=1; AL+hErHGCxTw7y03Cwi1FswTPpjF/jsVwCN8oHyyLBldOolTQ+v0YfCCrzMDBEK4CPG93qjkjKAJL3wGHllwPv5Rnw==@lists.infradead.org
X-Gm-Message-State: APuU4Z8RG/scJw+YB0sFXrVbKERSxfqlZ3/EIied+3tN5Ccy72+raLxj
	hPLmaFEJkxw9XOvg5P4CZfCjzOUTA3K3FjxCwTnZ3E17E/Mqo+laxPmO
X-Gm-Gg: AZFdTZeKMOgffRkUvF4ve1JxWC0skcXZUMfNSa8wUE1d9tB6f17C+bTn3uWMuK+NvYu
	Sw358QgnqFxNEtAv6Zl/ASPK8XvToPevmKV9OIKygFwQLzPIXBU8hFlEoBLMTJzFVD0yXcd8FhR
	sZDPyropU7VhA1EQxQOEB+iVa4t7OKycHI4vgbU0FE+Dz2U9l5Qk9BxOBrZiFQ/B7qZJQQr3Nbj
	gQ0Vjkb8drcZcVqze1+BZg78XP90HP5T8/WAdOC2tYzdBuBhnZ9BMNZmEu+GBRNbcS62opuyg8w
	Upqo826+q1V9ssjKtxeXdwpOlbyxeUKPFY5l9FD9a4cqdv1LiRMcoM42OXAJX463GisjV+MDAwP
	VVqkEAiYM8vXnuttkQ5eHpCb/OY0X6iqfTUxInrmq8xp123/8HIEgN3G3UaaA0AhrMaQr1WcYUC
	0RXVi5DhFfSL1LRkuuiZe91fLykNzH5gFZjoq3NGUgr/tyQdUKZGEAHldt7bqaDu8o3DWPm873O
	6Ri64JT5V25kUKf0xv4IvwhzeGlcdIXm36+1z0PzSwpacsb2aWVqrXs1b9ZIaR39HdpRxHsRExh
	DJZxgAmMDW1YJmjFyhT537rSKhsMOc8ddcZOmKu6Fsutdhp5laerx3U/+qMoOFQMh3OWhIMDHAs
	=
X-Received: by 2002:a05:6a20:c992:b0:3e2:3c7:7754 with SMTP id adf61e73a8af0-4014d25482emr23831723637.65.1795746196540;
        Thu, 26 Nov 2026 18:23:16 -0800 (PST)
Received: from mac.lan (114-45-165-38.dynamic-ip.hinet.net. [114.45.165.38])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdea2aed207sm5635547a12.11.2026.11.26.18.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 18:23:14 -0800 (PST)
From: Ilia Snezhkov <iasnezhkov@gmail.com>
To: Roman Vivchar <rva333@protonmail.com>
Cc: jic23@kernel.org, dlechner@baylibre.com, nuno.sa@analog.com,
 andy@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-iio@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] iio: adc: mt6359: fix MT6357 ISENSE/VCDT and
 MT6358 VCDT request bits
In-Reply-To: <r7Vh1EmPu-wr1NpHp23HZp7Fa0qmIAj6FTo_g8upWCKPJmnTk4kpjHxcDEjYankGVSc7WkkdWEklsFFUDQBF_XRB3GMM2XauzSsdw39czF0=@protonmail.com>
References: <20261126031013.27701-1-iasnezhkov@gmail.com>
 <20261126031013.27701-3-iasnezhkov@gmail.com> <r7Vh1EmPu-wr1NpHp23HZp7Fa0qmIAj6FTo_g8upWCKPJmnTk4kpjHxcDEjYankGVSc7WkkdWEklsFFUDQBF_XRB3GMM2XauzSsdw39czF0=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 10:23:09 +0800
Message-ID: <179574618985.4164.4856012256948069545@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_182317_571229_62CA075F 
X-CRM114-Status: UNSURE (   4.15  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: 1.2 (+)
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1
X-Archived-By: <archiver.kernel.org>

Hi Roman,

Thank you for testing and reviewing on MT6358! I will carry both tags
in v3.

Best regards,
Ilia

