Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8B5C43458
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2026 20:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZg/W7O3xMrPOVncSfqHtuO2PvBNacKXPKLTL7Ha6Q0=; b=qQOey/3D5dkzPtYFdVrTOAKF31
	Y1GMz+Pxhej+5mtFOAyfK5Z+1JJGZgUBzaCBRCb6B/qvUWnKfTRTySO/ddZpG57fzfTCLDizpzUp3
	oBAeTuj68jtkBN2dOYLAP2bIJRFi7h9xIPdWQbbCsDjKT+oJ/k092fG7xWH8y5zl+jx81jZZmV21a
	iT+AqzQn+xSHFQivEIVbGj65oJW05vQrmW7IHI7dHsXBMNRWJ9haG2sDFzS8bKAUK5ilDE/8LrCg2
	IqD83tviEe6p1aE/5BHpY8GoCGz9CMpB2c81yXPQ4FFa8dGUpmRBXIBrJJ0Nr6SwCeyJAu5h9ZBmX
	a98smO+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weISO-0000000FQil-0dwD;
	Mon, 29 Jun 2026 20:19:52 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weIS6-0000000FQbO-41BN
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jun 2026 20:19:39 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c9b42be8feso20740835ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 13:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782764373; x=1783369173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZg/W7O3xMrPOVncSfqHtuO2PvBNacKXPKLTL7Ha6Q0=;
        b=aVwUy0q/g6JkmdalFhaNttbITIwUb0EwBjoEURF95B603WGOuaF26xE8Fp/hixu++6
         wrqYYP4Jb1mo9KRwLlhkGbD/XLyNkFi5A8vX+8BcG+3s9VslTGI/rd1+jqjax62TeQtd
         ZEA0x2/HaW7pGAub+ro+XZdOTVRoigSMS9vTJO2Tfpmi84XxKTv9nY9NrypTREaQirtd
         GDWQPc/lleVdQ1VRZDjVSdcE9ZME7Us5qr3naIvTiEn8oQjWigcRpWKDb6bVH0+uVLQx
         0qRdZlcT/mPd7tm6+VugB4Hf7G3gHVCQtloN2vKZZj099iKheJd1vhlC39J2G4j/bYap
         ys0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782764373; x=1783369173;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nZg/W7O3xMrPOVncSfqHtuO2PvBNacKXPKLTL7Ha6Q0=;
        b=Yp/04kGj2rsY+V+qslh3CSVjdslBaZdmHNEtKzYxBpc2QyOeIYtvJd3sO0B/qBKFIV
         rG4RjAt47mWQS6s5N8Vuzv8UhdLdRbCHXggOg5Y7x/3EI5oLnTjDuffBlgFvGRHxlbhp
         w305zXXDodZPKaopiouMZKFU0pR8todH5EMTfJCsC0bkKNDnM9ptlX/4HBtBIxBlYCMU
         V4AJjlTFlWi1uPbF6YfRFk9+lZ2wUT4oyaMhwEK9Wa1xitYOkfz4KyV1qrkHfifp3O8b
         xpIYabmnaUyd7yQa5cqeqvTVcyqTXNtnUcdMc62y4Mdr0Kqe82Jg93+DR9FQB50mzfEB
         632Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro/jrAlss6Kh+8/zQzp2HRIjQ5UROIZFTP8vRttEngAbIfRYvtODVM9/Kj6RtRY2zUhqOpKpVGRYNOgPJrELQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxF73CJsHfl7XGUG8UkHnjx0p0MkHjIY2nMyntSY6hwKR6sZM7
	wm5LvCvesa/lD9T7QXgvKPQk05kJPMVV/df4ISANXcsSPT3QxZutwLZG0V/rxGrplSo=
X-Gm-Gg: AfdE7cmNlYqvoWfwRsMv+QfKNPm1S+RanXPwA8pkf3kyUDYpejkH8UHeXcl7ne3BrcY
	Hankeqsa4oRajh/tF1/f5NE9igU0pyiorH9pS3rdC9Xwnc0+y7zdFLsfq0ssVr58cWzPPX69KpL
	n/oJtjLIvLY084DF/YE6yqlkNh6S+fEhHiVJJgFCRe7w6S4MQMt36kEoXOCSF/TnJtDbTgeFgmA
	OER9CG2YfzKGQoS5i2DVRNj1uM7x53GmF6aPVN44U1omFXyZkOSX2yrwB57AcW3Tk94ZYk6X30j
	ZGrzCc19FJkM3gJv03ISZqiwuWy7QybC0zDO8HPVRUBLxiUuwDQu0eUTAl3dZFSgkBEKP+FL6PI
	erpPsfoLjwvvC8VCn9xCPjveR2VMK5SjhWmDy1APJTrx8t/Ufct7kxA3tJb9nSGvWHiTHKXYYcx
	hR4AsoTiQA4w==
X-Received: by 2002:a17:903:1c2:b0:2c9:e86e:aa0a with SMTP id d9443c01a7336-2ca2d3d202emr6219205ad.0.1782764373360;
        Mon, 29 Jun 2026 13:19:33 -0700 (PDT)
Received: from localhost ([71.212.202.210])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2ca37c908e7sm102735ad.35.2026.06.29.13.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:19:32 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-omap@vger.kernel.org
In-Reply-To: <20260608-n-dt-bindings-simple-bus-syscon-v3-0-4eba9ec1212a@oss.qualcomm.com>
References: <20260608-n-dt-bindings-simple-bus-syscon-v3-0-4eba9ec1212a@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/3] dt-bindings: mfd: syscon: Tighten
 checks
Message-Id: <178276437217.1055800.1836973932721840283.b4-ty@b4>
Date: Mon, 29 Jun 2026 13:19:32 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_131934_993017_C98074FB 
X-CRM114-Status: UNSURE (   8.62  )
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


On Mon, 08 Jun 2026 22:44:23 +0200, Krzysztof Kozlowski wrote:
> Changes in v3:
> - Drop patch #2:
>   dt-bindings: mfd: syscon: Drop unneeded case for syscon + simple-mfd
> - Bump dtschema requirement
> - Link to v2: https://patch.msgid.link/20260608-n-dt-bindings-simple-bus-syscon-v2-0-0203e6c249dc@oss.qualcomm.com
> 
> Changes in v2:
> 1. New patches #2 and #3
> 1. Add missing part of patch #1, thus not adding Rob's Ack.
> https://lore.kernel.org/all/20260531110404.12768-3-krzysztof.kozlowski@oss.qualcomm.com/
> 
> [...]

Applied, thanks!

[3/3] ARM: dts: ti: Add specific compatibles for SCM conf nodes
      commit: 68f994ec51e279e63c8fc40c1bfa8add4b708111

Best regards,
-- 
Kevin Hilman (TI) <khilman@baylibre.com>


