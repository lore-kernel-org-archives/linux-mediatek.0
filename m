Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EA6C48260
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 14:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AwSTu8c9+qn7K/wj1Yj/0NOW4PVVyZ52gG9hFp6sXb4=; b=Ek/QHAfKBTZ0gHIoULdutN2WEd
	EveixrBO9253k98YJGOwYHl9aUlAGvu2k1mRMNG/8eJj8vRE+aOrvoDyNwDe7sRuyuoMbPE2xY45p
	WXOj6IBVjoVBXB8fzr5Y9IYSXLqk6MSogfMEehZHAYgZRuMECSZCQqv0xukCJ1OpvvfSE23CGc7pk
	w2NkAvZg+hEd18eLviaKrKH9m64afdQYY8FeAqEkUGsL+exjuJrRWUiRlSosR3daBF0s+6xN8xZ+m
	zcmGwV9kBQW0E/uDuzigMFH2bwrBu+bbohF0ryOAT3gHyHcg+s/KceCyncOEOU27aJOG3VKp7oaqQ
	KenaaCmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZttr-00000009XTB-0kg6;
	Tue, 13 Feb 2024 14:36:43 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZttg-00000009XMr-3bI9
	for linux-mediatek@lists.infradead.org;
	Tue, 13 Feb 2024 14:36:36 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-55a8fd60af0so5900662a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Feb 2024 06:36:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707834988; x=1708439788; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwSTu8c9+qn7K/wj1Yj/0NOW4PVVyZ52gG9hFp6sXb4=;
        b=IKpQznH1dO3yfDcbsKi1xRJsjrxtiustApkm9RAajyKWkw5HS5C2p+68rnnIfZeNvN
         6bce5T5dd8nBJsXVChhrvveyWUmsqIXcEVi9c+zKDXTQv9fbBazxi9gIcApE+6na068x
         5MoKuIrh3bm4WNOdXEgzskjbK9Ldi4DrD85vfxuDL/DBt2rUKWu1uk7bQgE8xGWxSmR6
         YbCpHdxHPkT0rFuu56v2Uqk+l3Vc31KOJUqXDUxtk4pnkjLaUnXgLlvKj80WitEmRMqU
         UQmRFrOqHFn3QPjmu+iqG+otYKQFd8ynq2JUPxImYBOoCx8ETiLd2vTS/Kjx46XamihH
         MzSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707834988; x=1708439788;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AwSTu8c9+qn7K/wj1Yj/0NOW4PVVyZ52gG9hFp6sXb4=;
        b=A9dKWRRYMZIzZHiYIu+4vRhfzxloUaMJSSkrL96O5hE4qJ5vxN+LOK34De1gTwipnE
         Cbw4UPzEUL6EsVPEGZ3oimM03DTzxAvYxfzaudX0H4v6LPGH8XHN2dSZBRe6BxoohtVv
         CuVQjf+LKo/Tp2Dz4+bdBVjulDEJjcczEDi6bEfvDfGderU6/S90+r/58ZumvpYvoDME
         LYG0xTlyVooYqdAaVfbiBh5XFlNC3ENCuFGK2TOGhqnpWTSspjK1kfvdoYFK9ILByNvr
         pROJ7DqklQlrCIfik/Jykzy0ySx0BLN6lVCZdBIMsBKzrAndiDqCSVbJCxYWT6TVe2u3
         3qsg==
X-Forwarded-Encrypted: i=1; AJvYcCXW2FvbsqR7SWvcpN/zR6Kn1axR/gPOxpODWAfnO8x86/f3uWK6scEfvlS4dGnLncqh3L673NsuBnDdgFkCLVpGkc4mkvLpU9fZiZquNUd3ogi/
X-Gm-Message-State: AOJu0YwoKm53DVxK/MIB3+mR9GkJHcYoA4tWvumZdqQgrXOF+2awQcvV
	KpqhdQomh3mMW/3rzlpstHltDkOGvVPMXzgw6JLGaEgvZTltpqlARqXF45N3EJc=
X-Google-Smtp-Source: AGHT+IHyHB8+V0ex2KGnCGWHx2WLq8vEbnal2ITlQNjq3J21S86EHHwC/7phG+WC3CHeAwZNB/t1aA==
X-Received: by 2002:a05:6402:31a1:b0:561:8918:9f5d with SMTP id dj1-20020a05640231a100b0056189189f5dmr5613758edb.20.1707834987982;
        Tue, 13 Feb 2024 06:36:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVXg13xPEGFVWMYvqH44/VdTQLrKxPXlhHGHNZ5XQjfSYTplx8peZ1KfqNcaIA5Iwl8OsJ/l9ZncWjcPbpkWKsah6sqzAuX6hGPFEZxc78H+3sC/5WmbtPvCVwAZVz3X0Nfp3GCWIgmX88Y6trfce5Wwi8eOKgEy7rCii2wR027nVxlV5IWyPI1Ta2jmk1NNsEUfurXc1nK4Acv+RiCtwU650PxrQV0Ea/WQmwBWYvs8Vknx2AQo6uo73K20BNUmkz3qftZxOKWAm+0xhZoblSGFlo=
Received: from srini-hackbase.lan ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id j1-20020a50ed01000000b00560ecb22d49sm3688362eds.84.2024.02.13.06.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 06:36:27 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 William-tw Lin <william-tw.lin@mediatek.com>
In-Reply-To: <20240130095656.3712469-1-wenst@chromium.org>
References: <20240130095656.3712469-1-wenst@chromium.org>
Subject: Re: (subset) [PATCH 0/3] soc: mediatek: mtk-socinfo: Fixes and
 cleanup
Message-Id: <170783498706.33763.10510416022837379654.b4-ty@linaro.org>
Date: Tue, 13 Feb 2024 14:36:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_063633_100844_FB544AE1 
X-CRM114-Status: GOOD (  10.94  )
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


On Tue, 30 Jan 2024 17:56:50 +0800, Chen-Yu Tsai wrote:
> The new mtk-socinfo driver has a double put of the nvmem device used to
> read the socinfo data. While fixing it, I rewrote the read function to
> make better use of the device node and device relationship.
> 
> Patch 1 rewrites the cell read function in the mtk-socinfo so that no
> resource leaks happen, and device lookup is more efficient.
> 
> [...]

Applied, thanks!

[3/3] nvmem: mtk-efuse: Drop NVMEM device name
      commit: eadaa6f9aaf682b1840bf08a8320907de4e32d50

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


