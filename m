Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B4BCEDD9E
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 14:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iI/qf58LmUA8momT4giUYnjiWk7hGMnms4c27DSsHjk=; b=tAWO27BVudBlZaNeCPGtiCMfkk
	qmNlv7VFqMtl5loauGjRHid6NMu0vAi0FHCzqbgfRHshMHBZ1PsEhzJMpa9iOleo82OP3N+o6yED5
	6oYVTPyBI8eM6Ijd77x446N7DFqXlOx2V586p1m8iONWM8IZWzTT8zstssTyyM5lFE/JsFx/2d0JF
	+yu0Uycpj22STrUNaDTjjosaSzhyDvAOXC2KNOfn6I8vLDVi7FomHqFBYjkltvad6eTZw2dyZ5643
	Yq3A5d0EwVq5g3C4vPePhxLCi+H7RPRNThK4IaI0IHpC+oD0/YEidl1Q3klk/ld5wjUFTDPxX+khk
	nwwm26ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syXTj-00000009YQb-26AP;
	Wed, 09 Oct 2024 14:15:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syWIO-00000009K9d-1zFc
	for linux-mediatek@bombadil.infradead.org;
	Wed, 09 Oct 2024 13:00:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=iI/qf58LmUA8momT4giUYnjiWk7hGMnms4c27DSsHjk=; b=VNRUJmDPp/7mGvROjlItVBTbaU
	Ex6kj0t6FWjIWP5y+wlWU4DuHs+lRA4tJW0xTCeSNkZunm0Kn584U3jtW4RQS9fYpo+nUZdUFwM87
	/55T+amCNYODcjp5taXOu3HMu6GYFRvYtiF+CUyEvRgL9bjpKP1+2FVxwOV4R5/n273xVP8MPElKE
	43l5q63UlAiIup2rK2bx0UOUrJ0HayvoCSTNHeidOEjmI0ZuR49zZhEOwGxTjMdV3QiUCDzZAeXHS
	kDLqTnqVCq+irYw+g6JJ8mRNZm5+UvUQg2WtUWSpmFf2E/XibNy04P/a1sQ5rW979WDs5YJUIbq10
	BVqT7zTg==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syWIL-00000004xBr-1wjC
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Oct 2024 13:00:03 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-20b7259be6fso75319295ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Oct 2024 05:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728478798; x=1729083598; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iI/qf58LmUA8momT4giUYnjiWk7hGMnms4c27DSsHjk=;
        b=gOBx4rJku7B5IFSUkrXCIuK/nYdPr8b0ofZWijp2GXZLBDNJ4++4gb7sWU1a85fkVZ
         6dEXe4mqSPWGkxVv2lnDFiGassrZr49oSqCSzXkJFiAa0o6njRDttF7oSho3gHZrGky5
         qBwrcmkEI6VaWX2rHCtx8ZDAKJW5EJc8NsW6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728478798; x=1729083598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iI/qf58LmUA8momT4giUYnjiWk7hGMnms4c27DSsHjk=;
        b=bGVFlye398ClQ/wbwjK4XeHq70a8uBgkgAb45G/5hERSJMYPKcZDWM/TgAsm+G1sPB
         PgNS5PpNHLXkS9dY1+AF3hD3qMMZvMPBxbEu7IuVdL2lYe7dvF1+4BMdN2bp0fZDOi9K
         wrC85y7i3CA3fMBxxI/vhmshaqDQ0QRO0H4M8dQnA6UT2qw+CzL1jWU4lmCbKffBOr2T
         IZy+DCRAJ+ePmNp/gPBqLqqKvXNbLpEkALW79Jlg4gSLZPEzXF3HlcVhR3UgIzzeCcvW
         9tfk/mL+8Xh8ftr60qsawms6e+zaNnj7+yERl29Hd1nQxsRwgZWDAomc7xL12AY4bF7x
         PeAw==
X-Forwarded-Encrypted: i=1; AJvYcCXiVeJmxchKv8Utt/xJdgWaRr7lfI6xBowm49mrYHS808+WFLX/IUoKZzs6oVsTkVCPiGdhbYzgMgQ/vpORIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyS4Shzq2TMyuR3xCiTQGAsFoUsoOTB8jvWITwSVjymRIxPfJWW
	Vjvig18EzxGuG/qvHudYzO07Q7pXW6MIHzXYJm0KuFLvnmSVhD46aI7HFr7gfA==
X-Google-Smtp-Source: AGHT+IGVQbp9AMZDcYNINvFve/A6sPV0aMBAnUCzOdw6BflJ8wMGhXYCVLSldMttzoUEOvs/NA60EQ==
X-Received: by 2002:a17:902:d484:b0:20b:751f:c9ca with SMTP id d9443c01a7336-20c636d6b7dmr30492745ad.5.1728478798539;
        Wed, 09 Oct 2024 05:59:58 -0700 (PDT)
Received: from yuanhsinte-p620-1.tpe.corp.google.com ([2401:fa00:1:10:bfd7:eb4:8571:b3f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c51c21535sm27434005ad.216.2024.10.09.05.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 05:59:58 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 09 Oct 2024 20:59:46 +0800
Subject: [PATCH 3/4] arm64: dts: mt8183: cozmo: add i2c2's
 i2c-scl-internal-delay-ns
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-i2c-delay-v1-3-6cf59721c1d1@chromium.org>
References: <20241009-i2c-delay-v1-0-6cf59721c1d1@chromium.org>
In-Reply-To: <20241009-i2c-delay-v1-0-6cf59721c1d1@chromium.org>
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
X-Mailer: b4 0.15-dev-2a633
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_140001_673783_7CC40766 
X-CRM114-Status: UNSURE (   9.53  )
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

Fixes: 52e84f233459 ("arm64: dts: mt8183: Add kukui-jacuzzi-cozmo board")
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
index f34964afe39b5353de7b17e82d14d1fba88551ab..83bbcfe620835ab6d34cd2f4c2183fbdf11d0909 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts
@@ -18,6 +18,8 @@ &i2c_tunnel {
 };
 
 &i2c2 {
+	i2c-scl-internal-delay-ns = <25000>;
+
 	trackpad@2c {
 		compatible = "hid-over-i2c";
 		reg = <0x2c>;

-- 
2.47.0.rc0.187.ge670bccf7e-goog


