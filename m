Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FD3CCA470
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Oct 2025 13:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XBg5ffSo2GrH186PgVqj31fJqaeqJpOT+XmNAkbPa8=; b=QwAmCoulVnG6t0AbHyM6HwZbuR
	T60REFAyuLnf2Hr8KKymIqBZ5vqprnW2H6Knh7TbZdpnyRFUeIWcNc2VG66sXr79CH+jrQMbQ6tvN
	oEkDASg9Xj2SKvV8NR+bOc+I8hK0wVqaTCi9lTsq+zIrooanUyWqIi8ujgwGbHiKNX7g0CYVl7dTd
	KSeJgN7yYZjWE2vp2esVpETzXB/nhFFwfX2r7zzo3YP/CarmgKw2bX52IaIBXSCfcqDrh+BuFVAK9
	gMZZYtODYzpaxaKiaNMA+Y6W1yA2wIGgXWrYWpErXcARqux/IPEGCB7S9xCUEk6hIIP2yLaGfoVAs
	b0hsFWgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v67PZ-000000021oU-0Xcq;
	Tue, 07 Oct 2025 13:07:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v67PW-000000021nT-1sJB
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Oct 2025 13:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759842441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/XBg5ffSo2GrH186PgVqj31fJqaeqJpOT+XmNAkbPa8=;
	b=iMjYNXjwKtvjpqGSpyeZBsUeRR+M5j6lVW5JHUNXHTxBO3oDvLT2ZuWxnUnihtXdaTIZkf
	IoK0ge8ETr8cZFs5aDv4zTnEJXSC2hQsld/SgEew076hQ3o8dbtnYyS1I+RUTeauck5wDI
	zRyBzGQme6+Tdz5JS4plY2rv6Zz1jR8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-TM2a5YAAMdWyN8eRq1JLKw-1; Tue, 07 Oct 2025 09:07:18 -0400
X-MC-Unique: TM2a5YAAMdWyN8eRq1JLKw-1
X-Mimecast-MFC-AGG-ID: TM2a5YAAMdWyN8eRq1JLKw_1759842437
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-46e3ef2dd66so31353175e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Oct 2025 06:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759842437; x=1760447237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/XBg5ffSo2GrH186PgVqj31fJqaeqJpOT+XmNAkbPa8=;
        b=CIVpQ7jVrnVHz8HMXjZ5RFZt/LOzXXWVGLItme6boxX8ME6HULVknXfIKFMG9Vnpdc
         coSFWH7HZoS/dp7yzPRGiG7mVQxpmZuUymJjKetyXx0287HyqfEPGDB/pjB55Uxz4h13
         fAKVacgcjCibCQqXVJe/PoPpYBH5SEhz+IG2UlSvqCPOUcoj6WITzjECBPtWe6hxyNh5
         NWqFHfYT7PPIIEZI0TfvAJXhJ4rQ+06PwB6FkhF5S9XTnOQ7F8kQXV1Wu4tKFz3cusjs
         EBFkhtKUT8ub0qmioPzRk3DGqGKPfDX0oTyOPUuvSsfnQ8cPphsKoW8jA21yTAhWK7dS
         73AA==
X-Forwarded-Encrypted: i=1; AJvYcCXTrP12hNYrBm2E3CXAOSPHGEPzwi7tL9uNCEmyGQvnjSMz8G2zjP9NK32H6P9G8RwTyqvv/F96XOPodL6PXA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/th3PcDwzl1xJAUtBqeRJoTcyNhnHapzAiVW7Z4QSpaHGJw1R
	ThOKm+XYOrFBoJF3NY53OrQzQqwCpDvUtFkQj8Ran3gGPawEcnEnuG1eIyo4tpLdZ6P841kovBS
	UAskayIfoVKr4U/iom58ZI652QMzQeCpYEGzvU2JSEcHq2E16NGiZb7CgCQsSnKMQ4D4hpW7TyQ
	==
X-Gm-Gg: ASbGnctzVlGfUM5fOi016pZEUf4ahvI/VApXOI3QHiKm0Uq9iFrsCjU2YCuHiTWEMm/
	1clXM7P+E7450fJk9+zXFpuXaG/wq4HAjXxQ0masg22EkiLqVruXNRCKDki3Z75n+84m3Se2Ur2
	ARQ0P6e+E/N+mLKDyluZ26sxv9rWjStEDiu+Z0uneIYTgpIZFX1E2rvEP3+Jsqqu4kRjzhRnu3h
	N8DuBRGT7u5XmvMQf0IyAuHIfmNAbANiN1a3E/395giMOYeC7WVLvEjLw5JauxdOf07NDWObCLQ
	BX2C7gmPtgvZ7KpjOCAvF25n43XTnXV9Y2/feoA3iH+yEMx9RL+yxAuLBjQu7KnlCLSPazpeOtK
	ijO5ALGkq/30fOCZAyg==
X-Received: by 2002:a05:600c:6a07:b0:46e:74bb:6bd with SMTP id 5b1f17b1804b1-46fa2952c89mr17285465e9.4.1759842436891;
        Tue, 07 Oct 2025 06:07:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2L851GpOZr+HLN+RmzEFHJmku4g/YovfWmiVjt/V8y3IuJukmtrAjm+9vQy2k3rcv11whEw==
X-Received: by 2002:a05:600c:6a07:b0:46e:74bb:6bd with SMTP id 5b1f17b1804b1-46fa2952c89mr17285295e9.4.1759842436449;
        Tue, 07 Oct 2025 06:07:16 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2712:7e10:4d59:d956:544f:d65c? ([2a0d:3344:2712:7e10:4d59:d956:544f:d65c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e61a020a3sm307487145e9.10.2025.10.07.06.07.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 06:07:15 -0700 (PDT)
Message-ID: <7b460ea8-c340-4ab8-96d9-43568227ee07@redhat.com>
Date: Tue, 7 Oct 2025 15:07:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: airoha: Fix loopback mode configuration for GDM2
 port
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <20251005-airoha-loopback-mode-fix-v1-1-d017f78acf76@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251005-airoha-loopback-mode-fix-v1-1-d017f78acf76@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fmWcCHfhN2K3bZEsaV8MHoQN3O-XqBUL9zhaeDFFL9g_1759842437
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251007_060722_550327_0ABDA649 
X-CRM114-Status: GOOD (  12.96  )
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

On 10/5/25 4:52 PM, Lorenzo Bianconi wrote:
> Add missing configuration for loopback mode in airhoha_set_gdm2_loopback
> routine.
> 
> Fixes: 9cd451d414f6e ("net: airoha: Add loopback support for GDM2")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  drivers/net/ethernet/airoha/airoha_eth.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index 81ea01a652b9c545c348ad6390af8be873a4997f..abe7a23e3ab7a189a3a28007004572719307de90 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -1710,7 +1710,9 @@ static void airhoha_set_gdm2_loopback(struct airoha_gdm_port *port)
>  	airoha_fe_wr(eth, REG_GDM_RXCHN_EN(2), 0xffff);
>  	airoha_fe_rmw(eth, REG_GDM_LPBK_CFG(2),
>  		      LPBK_CHAN_MASK | LPBK_MODE_MASK | LPBK_EN_MASK,
> -		      FIELD_PREP(LPBK_CHAN_MASK, chan) | LPBK_EN_MASK);
> +		      FIELD_PREP(LPBK_CHAN_MASK, chan) |
> +		      FIELD_PREP(LPBK_MODE_MASK, 7) |

I suggest introducing some human readable macro to replace the above
magic number.

Thanks,

Paolo


