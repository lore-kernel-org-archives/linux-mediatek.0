Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9981DC88E75
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 04:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqClDMZv+Qp3g2QhTysx0rBLnCkZVZnC/Rs9Rzbs0+0=; b=QCWiHtpJfodSbu/QqBGQtBb3xd
	ZtEzEzBi+fs3d8vwVUUwHMvlAWbCa7nq3Tg2tYi+TseBqCKrNMAdmIwSX75U9uYRnMvZ+MQRHG8r8
	AdT2T//muOVm3V/soYq62DJciP944K1vofKMG3ZJOZNoW8/YQcQ+cMnFZDszCf26LzyBbvhJVORyp
	OFr5KM3XAG7cLY5F7BfoonqX+3nGJzgvxw/va+/Zhy9i2ijPell333+JqfMVkttGL38HtC6rfzjav
	K7PqLkWzNXQhdFeXgQ+2JVrCgTrPeRJ9tvtQCSTL6cN3XiEKKFpaR2myf338SvQ6fZ4Uzb9RG28vq
	KwnwgaTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Qfj-0000000DTye-25DQ;
	Fri, 18 Sep 2026 04:58:03 +0000
Received: from mail-oa2-x0a.google.com ([2607:f8b0:4864:30::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Qfh-0000000DTxU-1Nua
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Sep 2026 04:58:02 +0000
Received: by mail-oa2-x0a.google.com with SMTP id 586e51a60fabf-47bbb846425so192847fac.0
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Sep 2026 21:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789707480; x=1790312280; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UqClDMZv+Qp3g2QhTysx0rBLnCkZVZnC/Rs9Rzbs0+0=;
        b=RqYQSizCbg0FrOwbUUycktGFy0ZDNgddn1JIPOrpZz9HarWprEDxJZQl7iRYOob8Qx
         A5xbOuQvqTHTZR2331OJCS12uwU8PccMGt1Sg1wVXtMvgrJwLNb5w3MZQjhkkOvn5NCX
         pPqiuVINVdeabcJPaCr6rJ1nEixPQy7nx1SD/pN572C6yaE3632IpLxVRT7DIBhAuMsM
         +uXaYONUh+bfI4RwPdTquDVCa6fLsmle0E2ubWuL9y7Ei/Fit/2hXBKXV9Ae+Ph5Cl3S
         tm/nJfDA8b+sn0f1x0aIuUcdhybj0n714Kz127ykQNgMd3gH+ip29dRe2KgecJrSLZ2v
         Asww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789707480; x=1790312280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UqClDMZv+Qp3g2QhTysx0rBLnCkZVZnC/Rs9Rzbs0+0=;
        b=v2d9QysvJpt+LZf6VQstWe6CqpaUchKcw5Xcu/sCBXQv5IVSmM5R1UBaRk3qg+0z/y
         xyham84s9eJRdBdFXMPCu6os3zKnrFiE8psAZDtgrhKYBrMsnKFji8dxeMJ2VlkPnFXE
         3WD3djZTmZMpRCkSMvKe4Q9t1AVy+gfowSPNf9E14aE/D44k34lAXdV2e3ZFurAZWFl0
         8q+u5tI5dDNBsnPqKAhQuBEr0YfnBUjUGDqOb5J0fY77WYwDh/qWKhbAOonVENdmRF4f
         kDd9jF+QZg7kE9IkNwNxIP/B0PzNO/2GpYH8RoFXfkSEl9cWua2PKd9hSAc6Nkm01VYU
         Hq4g==
X-Forwarded-Encrypted: i=1; AKwUvByxgqK099wexBAahyMNwkYsMtCJOU3QFFdQiaWwn+FWQB2gCSbUKAXWBz+Lk2y0Kh9LIYjbx1XCGe4pD81y5Q==@lists.infradead.org
X-Gm-Message-State: AFuF++kWZo3tMIPB8cO9cQ+RtXgXDymGBlc2oSDrWgAJiRyTLFkXl3SV
	xwIQOx73YSsa3g+mY52qw1iSikuGeQvB5ULgZAjb3wSDrwtaoiZ1Sm9L
X-Gm-Gg: AYBFou29pQELUYULXtduxfek4nFRcEW1KL8OTWly3RZtCM3dDFYiOo7oBpqqJMVL4iI
	HuwyKuc+cbr2PQBVj99EFG07+EuJRYp54ZAxDq62y4o+5x3U3cZZS0CUI5H8IZJ5ViuekPIzRZg
	R5SK6uh7hrnhJ22JbvT1UxfJkrEUUz1M1MUYC0c4t8Aihg9bKdKl8r1S2mP1u9rqAT4XOW7PXOz
	//Zz//navb+KflxEhOVgJ6uxgMNzSHF1bdmrT0bn6gEjzcZofHHL5JeFv1YDFuJ79g35TdFPP9K
	zCWa4AFc/L9kbNotPE58xf12ImREcxFmO/XLmpUKoK/HeDk4mFEEZ85e0Gxxi3scv5iF9jUYtzm
	+jcxUoCBPgyV3kX5nf6oZtcb2d8LcYCqHbpfmc5Fu+aB6EUMgyNmEcmpsHbYHLkiYwNRecXV314
	gb2UBE0CtTwrlUXyuJ4t+WdetmdSUs69Lv0KgOc7Wxd8VzX9no9e8+F2+LF45/ryGBcmZhI6KCS
	Ai+
X-Received: by 2002:a05:6870:2419:b0:483:b498:9db0 with SMTP id 586e51a60fabf-486e5447154mr1433078fac.14.1789707480336;
        Thu, 17 Sep 2026 21:58:00 -0700 (PDT)
Received: from [192.168.18.164] ([2600:8804:5716:d800::b712])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48739da0d0dsm256318fac.12.2026.09.17.21.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 21:57:53 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Thu, 17 Sep 2026 23:57:46 -0500
Subject: [PATCH 1/2] dt-bindings: mfd: mediatek: mt6397: describe the RTC's
 nvmem layout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-1-558b8f95cfbc@gmail.com>
References: <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-0-558b8f95cfbc@gmail.com>
In-Reply-To: <20260917-rbrue-suez-upstreaming-mt6397-rtc-nvmem-v1-0-558b8f95cfbc@gmail.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org, Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789707469; l=1572;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=QApoySis0Adh6uF/PzHVfhA1jkpjYHZNgPhek+gBJ7E=;
 b=mjeSErd6IUo2Z5QDXzSoT7MEYbyj3Na50gNAofJEh5wz/azQT61QJzOrgH1djAKYxTLLJUkYV
 wo88yBIlUloAzlG19N2bRJfn1YRBdEMkcgp1nZ1QQEMSYEmHHj+zw0v
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_215801_386969_B381AF7B 
X-CRM114-Status: GOOD (  10.22  )
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

Four of the MT6397 RTC's alarm registers use only their low bits; the
high byte of each is storage the clock and the alarm don't touch.
MediaTek's documentation names them RTC_NEW_SPARE0 to RTC_NEW_SPARE3 and
assigns the first to a fuel gauge, which is what a battery driver reads
at boot so that the reported capacity does not jump across a reboot.

They sit in the RTC's always-on domain, so the driver can offer them as
a battery-backed nvmem provider. Allow a board to lay cells out over
them.

Assisted-by: LLM
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 3cbc0dc12c31..5c89c589b53c 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -81,6 +81,15 @@ properties:
 
       start-year: true
 
+      nvmem-layout:
+        $ref: /schemas/nvmem/layouts/nvmem-layout.yaml
+        description:
+          The RTC carries four bytes of storage that neither the clock nor the
+          alarm uses, in the high half of four of the alarm registers, and
+          offers them as a battery-backed nvmem provider. MediaTek's
+          documentation names them RTC_NEW_SPARE0 to RTC_NEW_SPARE3 and gives
+          the first to a fuel gauge.
+
     required:
       - compatible
 

-- 
2.55.0


