Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0995CD0E6C8
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 08:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAUk5W98O64U9IZMaqTyyBAdnws1M/z10hXkJohh3N0=; b=MsGGSE5Ar0Jr/kOw9Edfds3S0r
	3MpKS3SrzruwAjZrnmumWzZZLeawMtJtvEz/a+xrORlvNfX1zUamfvBX5XZwSKGds/hzBQ9lhwNUC
	zN8LOUsasd9jGRdfkTxYnV7csqauaOkWt+Zfo4GDF1Kj+6glRWJWmwcmij04aQBFFPLG11t8bgaMG
	zNi8EglDNjJt83wENEoieUdea3XVKRWwnAs8ygLMTSlKTkajMwrh/IOuSvYjm0L2VcQnLZodgGtI3
	vyvzlQHmri0qnZr6/ymGGu8QINW7/LIoDavYv2hfFhIfKhckdxkFR8PorneBQuwemp5M+aI/Uth4b
	SfTjemqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2nnz-00000006Y4z-2oC6;
	Mon, 21 Oct 2024 08:30:23 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2mfL-00000006KsW-21Mu;
	Mon, 21 Oct 2024 07:17:25 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2e3686088c3so3019314a91.0;
        Mon, 21 Oct 2024 00:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729495042; x=1730099842; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cAUk5W98O64U9IZMaqTyyBAdnws1M/z10hXkJohh3N0=;
        b=Cc7vZrJXZSACjN0NigfaGSDIXJ6MSCL8tD80Y+t5GWt3vEV6sR0MopZOgMGylk2gsS
         Og9Xp3kq/ZAqJagiiR3ZCWV0Pv9nVSB7MFad65T5n0dFMdzROwRsV5svA5v7Xm3yBvYT
         hLiq0lHyd4rqL+TZn3m2DJ4/hJ1a6gE9+5qcHrX8Bg6h+ppC6qXy682FhAe/3vAmZNBu
         RSKw0lonGfWQR/5hq+opmzJpXSXybmX54Uihw1kB7Capwo5pPv/rbf4dHdbkvBxAlVIe
         TsvEP5sQ6N+RYiMPLpDdfvWXdtr87SIbFSgKcwAMIvEYljPcjoQUYxgkHOQVpjqqH652
         /9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729495042; x=1730099842;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAUk5W98O64U9IZMaqTyyBAdnws1M/z10hXkJohh3N0=;
        b=cnn4HkhgVUsDOZJtJcvu+e7+kOh8IwvdUirxUlDfYguW0lkk2aiB4PHkN9tto3JvaP
         twmTgqbbD/NISpJZJ5/OGSCb1vq2MYJp7rokQgA0TvoxFxCKsaoAWw2DzAeX006aHDJp
         iL/r2EwqdE0fxo04YWHuV2W5ct4wa4HzlHqh7SPTQyJJjJsymGhDQ2GFSXWBdisEzscV
         +Id4c1EYy760oAOJIflmHhn6nisnG7rT1WRvZqqca8TXIt3gkqTtBu7Q4SbEpsmF2jrJ
         orR3Mc4X1Y0iTd1sbEKoAPywqDmRfO0XMdR8BIUYpepNf1vAhZZO2zXS17+V5ziMeh6K
         VKwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcAI0FUIMdEYgSYbw/1lf0D7le+ObqX1bPJ5AR2GT1ylEPJssuKT8+ophoIEVqA+kRLbG0gZapHV0Q8NOfzRw=@lists.infradead.org, AJvYcCXjbWYV9NTlXY5jTJa8rKAKfO6nZTWE+ZG4vAbxDVS13ZKBjlOOPA86ujUWibOZd9Y9f232PLTSQL3eyfDaOjVf@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2zha76klP9GTkc5ncgLK8mVrtMxPkPgHcrSR6GQgq1syowQRg
	cJqD9+hOBj4zWidbAFr3TYzkfisggKcRnkmeCCzHRN3ch0MT0s7hyjeMcA==
X-Google-Smtp-Source: AGHT+IGneQjtaluKEP/Dr7JWISPzjl8lPXj+gklNXWwqzoxaJiGA1EN7a1TRxGE1qWenqDLpbFxmXA==
X-Received: by 2002:a17:90a:8d14:b0:2e2:c00c:cb79 with SMTP id 98e67ed59e1d1-2e5616db842mr11923766a91.3.1729495042427;
        Mon, 21 Oct 2024 00:17:22 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:6e21:7092:f7c7:3951])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad389146sm2818628a91.26.2024.10.21.00.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 00:17:22 -0700 (PDT)
Date: Mon, 21 Oct 2024 00:17:19 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, chen.zhong@mediatek.com,
	linux-input@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
	kernel@collabora.com
Subject: Re: [PATCH] dt-bindings: input: mediatek,pmic-keys: Add compatible
 for MT6359 keys
Message-ID: <ZxX__86dGl5QNsYE@google.com>
References: <20241008074137.20269-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008074137.20269-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_001723_556093_E6A4BB36 
X-CRM114-Status: UNSURE (   7.78  )
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

On Tue, Oct 08, 2024 at 09:41:37AM +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible for the keys found on the MT6359 PMIC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thank you.

-- 
Dmitry

