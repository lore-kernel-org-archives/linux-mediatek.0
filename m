Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21CCBC4829A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 16:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jt2WxlQdO4fysvQIUvE9sZzH3jia5VewAudv21NzUl8=; b=Tdy7S1/P9RzSWZd1KnFVtystSH
	9o8aeAxPO1D02GRaRlMVJPxFUKDkrRZYm6CmOZtFqCrug50e/whiKDhxax4bViN8L+L+2+jxmaeCF
	Tj6MOHFierG16xGDihja8c4Ph02BQbnNGizNJhAVh/KRCauWfgvVBn7fT2fprtU0qLapFdzDQxjkP
	KN8LWONdfo9CEiTYQoXEfQfpxWdtP8YTFf4YmPFmDFjc48O5d3orem+CYq44g26jUzTtxdNxbMsAR
	73C6CTL6fUnNlbbDsZXfBbENrgWgh0pjVcJEDA4MVA5clkCX53vUDGCgEhFoaFMu+O9DbLWCmkjvH
	ddMFAMew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZvvz-0000000A1P3-3hnx;
	Tue, 13 Feb 2024 16:47:03 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZvvu-0000000A1LO-2XP4;
	Tue, 13 Feb 2024 16:46:59 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-55a5e7fa471so5997548a12.1;
        Tue, 13 Feb 2024 08:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707842817; x=1708447617; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jt2WxlQdO4fysvQIUvE9sZzH3jia5VewAudv21NzUl8=;
        b=I2Tk55OSPT7rVLCTktfmOn0dr6j4M28lAWW1JW4lfadYOEFgu/b7q2CgwAVMIGdvYH
         V8l2i7Q2sIVFGkKf/oJGRwRVoHLCY7DI/cBiFRueJHIs7EtmqoAvmg4c/dGsx8rbhyKZ
         1gAlBQy5HCXqUsUaF9nThq24AjwY9y1e2wKXZagSBKxcDpcfQdlUdXBUpPSTz3YOXCyE
         jm4VJrBWUG1tqxEeZ4zSMOMVJIbh+vVx5BBv1FOCVuZ979SXWWzgPdTxeSskyT2TWJl6
         tN7DfSyD7sxLfHS8mtjvq0aWUGeDwFw0ic+0t5koOhs1fMAawVnfnmzm+N0loToh/uaZ
         f6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707842817; x=1708447617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jt2WxlQdO4fysvQIUvE9sZzH3jia5VewAudv21NzUl8=;
        b=Vqe/PVNlrR1meiivwpeiWOWdnZWQ6saLa8nqPTUehbwmq0+tRzdj6qobc+5G2b4GXb
         9l/yACgiqR6JCrAfQTAxRv/bwL4TLz/F7TCPWYmo1H+RYcuUy4uVpHfnWHXfkuqtShX+
         wLRPNlz74XF7MaAs/Xd6ZZqCfMqkxNOk7Y6FJdZcFGvTbfL5P16o4gx58E7ca5xwgL46
         NgpMAeRMVP792uSvctAKcOo2HCEEDpa0Cf7qkjZj2fp2w6qDCPS/IESgiRasQ+MPRpXg
         FbgAlgMNOBnvI78nMu9gW3fYuZSNozdsJixfBuT4mnU8rHUbTA9TNLL/sZEla9gX8y/V
         NokQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOPkjxbpIE0ytJKLFkmA9dK13zjbHNNPpdcyKPBcoG15EYV0c+MFxLfBfBMXoGEsj46RhSmWsj9V6Pd2K/oBHv6LXxB3gI3DBEFFk1YS8TKJ/egzmG4UgNqugYBO0oBO8RSrtIlbaymm4qxp8KNwJKXHa8OuE6HAM=
X-Gm-Message-State: AOJu0Yz5hWk9sysktNaEq3TSnXpvgzOiJPxiL6vrUbu43kzqBhlM9rA6
	pJDqpWC06BMwQw+rUX2WW4siTcDAM/fZIcReRgWuKgUh3wvuwhMS
X-Google-Smtp-Source: AGHT+IEOCuvXmALVsWy4q9bGIKo+OXF34mZhyPYSUBl6z9/EoOR8YE2mtz0a0xXVLC4slWArIRenxQ==
X-Received: by 2002:aa7:c40c:0:b0:561:1917:eb9e with SMTP id j12-20020aa7c40c000000b005611917eb9emr150247edq.35.1707842816518;
        Tue, 13 Feb 2024 08:46:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUp1qw97K6riBY5hQWZ39Xfd6wBeiupyxbDZhQ9Tw0QXIGrw09l88kbuSjt4WSUlnYTmfmDSo+5AG1vhQGUSPSmPYVmd2kCMAlXPM2tOdLdoUvzGq/VqyEXih48rOYxOn0LW/aV+jnI3nF32md93O7aqg52dc+zOzxx2SnoDllN1R2MX59F1wwDQPTa8jGYsqWhxmp+kul1yUbi9XKt+cIbCH3pD4zRPFfbnTnRxrJ3RJkiUqu+ZL6wSqR60kXr1yGS9LWTCREp9hK/uxr92f9iZ+HetZHfE3FdkncOrnxaFxzGwqBAPr02WfachN0NWEyYzulhEUU5eo6axA6zyHE4rokQMd8a72hiAsD2ZvxLtWNirXV1bmioFIJfvLwNmVsL3kx57P/I1Gn+RGDktMP3UnRVRI0D2/APSMPtsNlfPW482lxJ5TcHsWExx7/Yh+vO2VlQxUQhhek97SlV1qJlsHmyYBe7DiYHxLHtMchQX5yHK5Pit6oWnTem22k/g7bmxsIUdVOP7PTHeOaw
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id v10-20020a056402184a00b0055f0b3ec5d8sm3863582edy.36.2024.02.13.08.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 08:46:56 -0800 (PST)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: John Crispin <john@phrozen.org>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH 1/2] dt-bindings: pwm: mediatek,mt2712: add compatible for MT7988
Date: Tue, 13 Feb 2024 17:46:32 +0100
Message-Id: <20240213164633.25447-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_084658_672954_40F9B3F1 
X-CRM114-Status: UNSURE (   9.83  )
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

From: Rafał Miłecki <rafal@milecki.pl>

MT7988 has on-SoC controller that can control up to 8 PWMs.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml b/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
index 0fbe8a6469eb..a5c308801619 100644
--- a/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/mediatek,mt2712-pwm.yaml
@@ -24,6 +24,7 @@ properties:
           - mediatek,mt7629-pwm
           - mediatek,mt7981-pwm
           - mediatek,mt7986-pwm
+          - mediatek,mt7988-pwm
           - mediatek,mt8183-pwm
           - mediatek,mt8365-pwm
           - mediatek,mt8516-pwm
-- 
2.35.3


