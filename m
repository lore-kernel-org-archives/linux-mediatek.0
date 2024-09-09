Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37498E6FE49
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 07:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wfX8T1x5rrOl6RrTYur3Zimg2UEhzKDAK20wqcPgU6Y=; b=2WLMXk9I/KdFITVboMZ0FIY1pL
	RLweUNy5+h0LgEApMs0H18jmFuGIqIxImxiDTjIWb2EpLxvGDQVWzySCHnbbulc6pJzXnMphzyX9s
	GMqjwTwf1nQzoLmB7C9kiNG4iA9ngUsBc5hBatz9RJ7oFcfozHArScAILuCVyMItOyoFLSQ8Z2t35
	heYB+oEx4Y9ZdTLLrNDWe8fMWhG+r5g3MYSGUasKkJapwdQerips7qIYww/2T5Bqv689JDY5D+HMc
	9Bf9nIZI1dia/zDPh8jGak6VCwvH01gxWb8PEXl++KAabFazYYg22RXHdoMy34Zg5qYWT4I/eKjdf
	Nps6ru6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYst-00000000qVN-3f2s;
	Mon, 09 Sep 2024 07:32:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snYpr-00000000pIp-0iM1
	for linux-mediatek@bombadil.infradead.org;
	Mon, 09 Sep 2024 07:29:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wfX8T1x5rrOl6RrTYur3Zimg2UEhzKDAK20wqcPgU6Y=; b=oN3yG7nDDkMkgfKL8aiAUStjUR
	eXI3O/XltutNvVWJ2FEKbDPKzbWkcPBVFZsl0tkyp1PSXIYuY2yv/FSE6Jn4nMfpQlxk/5bSZ7Cel
	LRIr9efH988IdDylaqQWytoy2/pgr761CPBYrhL7LEcybKT3J4Rf0IEAmTvKRdVQ7g22OgCl5VQGl
	eoYq49+JHcCmZN1CSkU73jCAvHWWLlo2nHPp5l3lynnbdMPqyv3LDfvec2Fl4oFZqelXPoE0vjbR+
	7NSMltlizaGooJKxdpLz3mHJCbv5OoD/YRRjq0adPPfiAn4yBo3siDucJ35W9GkdInic5Yx/pIm0Y
	8emlPQmA==;
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1snYpn-00000000L5h-0UkD
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 07:29:17 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7d50e865b7aso2798167a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 00:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725866951; x=1726471751; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wfX8T1x5rrOl6RrTYur3Zimg2UEhzKDAK20wqcPgU6Y=;
        b=Juo752FEBpkZOjjAlXQYTeFJZknB+nS50YtU7LRtMgI6FKqkZQn2EEeJTHrb29o7pG
         sF9vl4ejFepyc/+8OipfWBF/fNSJ1xLU3h7q+McJLms0B4xQsetpKvr5vIrIHtWzeEYv
         eEYtIZn/fqr+BceN7hrLs9B22kRsPYCn6voSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725866951; x=1726471751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfX8T1x5rrOl6RrTYur3Zimg2UEhzKDAK20wqcPgU6Y=;
        b=CdVL/5MAyg08IHEtK5Pp8USFth9Gr3VZ9PBAFeCHdigq4GbFV5kSyA1ECRsIoNChh4
         kyDRrck+CyU1LQijzHAiRr4B4PR2v6Khy9gHCvEk/3RnnbPtWxRkTOYTDUxeirMZUs0Y
         +I6CJfjiI57z87h/IXlqQEGTjlyrTl+howYLoc9fEHCHk/640wevQGJ/F+HanZ5sp8UF
         vqUVYxhx36UezGsVuS2HuGPNXx9lGGqfpYitCzVmYEX5kB3mn0EZ63sePaGqmuOswcAf
         BO4scwFVkMmLOqanEUBL4bipQZXepWtai25v3GhwwWwKybSlWzKakXwXuXxVjtbaSxld
         HRzg==
X-Forwarded-Encrypted: i=1; AJvYcCWbfdh8K6R9gARi/nTsmEItN3+KT5XQpY+P076oznqGJ4lHZAu24q+GK3ag/QnwRWSPTvfv3aeT3lG1pGn+xw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxT+pyBh2z2ceVCSLxYf6vcquOmNVGLnR8UZa93DDN/sAB74tCT
	j4P8DVOKd+ihje1k1nAOSfGzYQnq0AvRMEjQk0MgXBsOsJaLZBQxVYLouIfs6g==
X-Google-Smtp-Source: AGHT+IFbPA89AUmZRFyDq4qB/+xkqYmdbiGk8UB4QAOiyyGZy8U5yVeheC0f8PqoWtCwVplO3XGJJg==
X-Received: by 2002:a17:90b:3143:b0:2cf:def1:d1eb with SMTP id 98e67ed59e1d1-2dad4de1086mr11912837a91.8.1725866951350;
        Mon, 09 Sep 2024 00:29:11 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (30.191.80.34.bc.googleusercontent.com. [34.80.191.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2db043c3c51sm3841065a91.21.2024.09.09.00.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 00:29:10 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Mon, 09 Sep 2024 07:29:03 +0000
Subject: [PATCH 1/4] arm64: dts: mt8183: fennel: add i2c2's
 i2c-scl-internal-delay-ns
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240909-i2c-delay-v1-1-4b406617a5f5@chromium.org>
References: <20240909-i2c-delay-v1-0-4b406617a5f5@chromium.org>
In-Reply-To: <20240909-i2c-delay-v1-0-4b406617a5f5@chromium.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>, 
 Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_082915_335210_3AAA4D57 
X-CRM114-Status: UNSURE (   9.31  )
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

From: Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>

Add i2c2's i2c-scl-internal-delay-ns.

Fixes: 6cd7fdc8c530 ("arm64: dts: mt8183: Add kukui-jacuzzi-fennel board")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi
index bbe6c338f465ee7c11bfbfc30767bdb142706480..f9c1ec366b26607581c116b364cc2f80f8621a57 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi
@@ -25,3 +25,6 @@ trackpad@2c {
 	};
 };
 
+&i2c2 {
+	i2c-scl-internal-delay-ns = <21500>;
+};

-- 
2.46.0.469.g59c65b2a67-goog


