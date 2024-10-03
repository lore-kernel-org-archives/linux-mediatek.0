Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF55CF855A
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 07:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oe/n9hHH0mKojPtYx3rZSCjoPpBX5CErclQAFbwUbmw=; b=ln4oYPgeh7nTzN
	pvNZuYECaby5IewNzQEkUEHd8iTwfD6EOVY7rIW6EhxVTi6teL9++nz4m7x2wXbxubnxg1RTNaOBf
	GjLfsFV9TuakYl1VUdBR1NRKC5Ut/Be776TI3y9/tuLCuv2DezcmdRgGonGVJDmddsa1nNGxdEdXJ
	/4x91VQ08QB54C3vQ2VU9aVgSnVYdy3GAxXJvd1jC6l2b0tbIeXPN9BILkxZWyQoAsttjD83IScGW
	pN29H/cB/2agY8zAk1sRCee8nh7ca3hrq00nec6Ahh8DkLuErnOAajTSPTDf4UB6wkhZ80e+LSp9c
	EsjKRifO15ZlrODOZzkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swFsn-00000008L7V-1lku;
	Thu, 03 Oct 2024 07:04:17 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swFqQ-00000008KQJ-103M
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Oct 2024 07:01:52 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7e6afa8baeaso479164a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Oct 2024 00:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727938909; x=1728543709; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oe/n9hHH0mKojPtYx3rZSCjoPpBX5CErclQAFbwUbmw=;
        b=EmZFjxpgN/RLHBRczkOGcLjyxFOaIvv3ZV194nfdi6CFpxLsqHXf/n1Hx0/mc5cYUL
         ndVYlWI2/Sn0pGsiLSoLXug+34UVDKq6FQZeu14jPWE9YMOh5+aiz/uChPhoU60drEY1
         ujUYyw3ftbrvGD10FH6tRwAajZFmrTmRzQxes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727938909; x=1728543709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oe/n9hHH0mKojPtYx3rZSCjoPpBX5CErclQAFbwUbmw=;
        b=E3lo1ikKsqjsMPdN2i0kcgITMm4WXhOJ1kdTmIo7Jpk8WvKBLhapfmUGjySvjKh+l7
         869njpyQ6YjRgd/RJ6+c7+pENF+7jPAEJxea/BYebV8dE0/TnYZGC8m/Rghyfq2it6iE
         Bh7+xVjgHndW84o63+VprAPTB04X+xTikIo/HNWX13Im9zb2eS9SXHOcpNIApJuQr/V5
         MLG84GSAPZ6PlBpPjOBGwe8yrdy4QxcWRGPDSFOgKvW8k7uyba0RXwm8S+Ps8CivCl2t
         nc4xjIsOkaof2XYU+fOKc9fevy6S0cPYjgWQnmkfOTlDFrVbtZ2I1qnNBGk14g6rLRt/
         39Vw==
X-Forwarded-Encrypted: i=1; AJvYcCV7u15B85xTgXJwj1kYPCakd8no89xoIlnNFN9VFxRuTzhcQZrbINpEBe+Vt9Txw/57+t9nGjJG4O7WthimRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTNrcHFesIOO6EGxOYjqKRP70Uc/uGQCjWzPJWa/xTTSw8GhPR
	jjIc8Jiqj13kdbevzqbskE1f5czwN6ZB4iq8sQyFFg3yYedY4XJVm91wijCWCw==
X-Google-Smtp-Source: AGHT+IHnCV7kmSOR4DccXhZDS0a+MPrHfdhqHJncrbL+gRJDUqEcGORVVOObqAVae6mIpY+s/kJRIQ==
X-Received: by 2002:a05:6a20:c797:b0:1d5:388f:275c with SMTP id adf61e73a8af0-1d5db14c8d3mr8114513637.20.1727938909295;
        Thu, 03 Oct 2024 00:01:49 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:3bd0:d371:4a25:3576])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d8e473sm633782b3a.81.2024.10.03.00.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 00:01:48 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 1/9] arm64: dts: mediatek: mt8188: Assign GCE aliases
Date: Thu,  3 Oct 2024 14:59:55 +0800
Message-ID: <20241003070139.1461472-2-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241003070139.1461472-1-fshao@chromium.org>
References: <20241003070139.1461472-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_000150_374434_8C1481C8 
X-CRM114-Status: UNSURE (   9.32  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Create and assign aliases for the MediaTek GCE mailboxes.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index bf15ac9901da..10195a4e4e9d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -23,6 +23,11 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	aliases {
+		gce0 = &gce0;
+		gce1 = &gce1;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.46.1.824.gd892dcdcdd-goog


