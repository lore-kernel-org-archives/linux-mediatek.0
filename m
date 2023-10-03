Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF51CDB47E
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Oct 2023 08:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Z5ADml8UEYFyYxVl60KXFq6v7496GwJKAXl/Dq0m1dI=; b=FQxjPN/2p/rRXsfy179QsYdoyG
	meZrngdv5sof6XgB+Kh8H1AZOrz6VxyRFcPGstKuw4xTHSIO2wxyT2Gf/99GPutisgu4ThPGwzEzB
	1t6YhmPwXpNNXG6vN7Zk4GVpSYVKwALvjshsbqs3pXfzesggP6KooxkS2bx0N9xc7hHbVGvgChbUU
	txdHI6o2nsIXsEs7mSom+7/39rncp/zxiABSiSdjiyIHB1ALshhMVoLWuSrOPC2nWu65pEvtKUG+l
	5TuYCorDGWiaKz676i2bMMbvo03bkn7vnAReOnlF/Lcf0/pgmX+ftZDiD0NYb3z1owH+61U0QPvPb
	ZRMrigvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrDxR-002scz-0s;
	Fri, 13 Oct 2023 08:55:45 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnjpa-00F5vR-2d
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Oct 2023 18:09:15 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c6185cafb3so20785ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Oct 2023 11:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1696356552; x=1696961352; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z5ADml8UEYFyYxVl60KXFq6v7496GwJKAXl/Dq0m1dI=;
        b=p+gl9jEg6+undxuwJv2Q1q2K0gcmhIyyYFh/HTzW9+MvZPLWxcvlzAom6T1mINIHF/
         NJPpe14x24HY3vDDB8TRj3Yc1DonsPQdodPRLxooqgFQaGahOLUOll54FAk3Gabad1hU
         0utR2uVnhpgwysct4abzxA2VYswG7Gu0FWAXsmjhgwxqIwglBkKOWxDOFPm2BDpneXUV
         neZdrK382oequUlCU8nhFE0oD1p+BmwGrkZ8IEVru/SnfhJlBULbz0MHHUo+F9bSdeaf
         3jOSvMh9qUC+sZyIJ1NMEvaYqHQA7oY+AbqyHLUkAmMc7iisNVH7mvyxPjOm65+19BZM
         wDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696356552; x=1696961352;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z5ADml8UEYFyYxVl60KXFq6v7496GwJKAXl/Dq0m1dI=;
        b=mZoCoqogYJCF77azQAEOVZDdsOaQu6K9RF6HBHemoDeqQnqM/q1+O5lKJyy0L4bn7k
         ws9VN6ECvb8KxndmyX7bGVkAWO0pOiak3diS8gToiW6Dnp/dc6S6z0AFt/dfA+B88iaJ
         vmfkQCF/eKTK6EMSairlRuFKpDceAXzvpMy7TO40YGP+xDBKczqPObzG3p5zdf1zt1Jt
         jwt/LxYLH7BUnkwjsQOosUspslnObeQ0zLN7LDcXpPxtl9qizP9AyKocfsWholTPl8MR
         5DjJk1E7ghnBrQeWM/FvPfD+nc5vtyIgr1AiOzjvEqjpANWzzQK6sHEWtA4GDtyLUYuS
         vJ4Q==
X-Gm-Message-State: AOJu0YyPguSaxFrkVyphJby7BpgDzsJQmaptLYnq55m6vRmQGjRDwfaM
	KdsT3o1ly+5yIVVpraC7ZoXzxkKgXR3lUBlu5frF
X-Google-Smtp-Source: AGHT+IEl6IJ3DsIw7oyXRf7R7HS8s4r59Isc2f9JN+K4IY+u/eiaCuHNxh0RznXZ+FmVCsNdWoBLHGhb923Bp4V1USc=
X-Received: by 2002:a17:902:dad1:b0:1c6:1e4e:b770 with SMTP id
 q17-20020a170902dad100b001c61e4eb770mr19311plx.28.1696356552314; Tue, 03 Oct
 2023 11:09:12 -0700 (PDT)
MIME-Version: 1.0
From: Jeffrey Kardatzke <jkardatzke@google.com>
Date: Tue, 3 Oct 2023 11:09:01 -0700
Message-ID: <CA+ddPcPS8oUsMk0ziumwdTTWetekE37cK0Gkt9x5w2ig1m2pXQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] drm/mediatek: Add interface to allocate MediaTek
 GEM buffer.
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	drinkcat@chromium.org, Jason-ch Chen <jason-ch.chen@mediatek.com>, 
	Johnson Wang <johnson.wang@mediatek.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-mediatek@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, Nancy Lin <nancy.lin@mediatek.com>, 
	Rob Herring <robh+dt@kernel.org>, Shawn Sung <shawn.sung@mediatek.com>, 
	Singo Chang <singo.chang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_110914_857092_647C2FAF 
X-CRM114-Status: UNSURE (   7.11  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 13 Oct 2023 01:55:43 -0700
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

You can remove the DRIVER_RENDER flag from this patchset. That should
not be upstreamed. The IOCTLs are still needed though because of the
flag for allocating a secure surface that is in the next patch. If
that flag wasn't needed, then dumb buffer allocations could be used
instead.

Thanks,
Jeff Kardatzke

