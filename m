Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B9CD1171E
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Oct 2024 08:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FboZURjVUcmqOH+JZsWis9+u/grJQW0lknJr+SkmBQQ=; b=TmfwwtELpStTfZ60X8qqvZjnDE
	4+PQdaxGI+XLOrFcKr/5KQ0v7ncvfEL4rO6q4c9xHwnfSsvQ7bVpN+pRbCb6CpfdCEb3GhtcuoKGO
	TuJY443MD5XTBOeONf0EbQwb2mZIAMiMgR/LmPJEhOLWz25NzmnrGQGxSPX+PFugnMsS96XSX88vF
	sLHwQigVnLwSApEd2VuasxY+ra67+bKGGTH/eXrjpOHF3iMh4MPmQtDWpwLG+3fh4ZXs3aG3WSvxr
	fXgZju/KHqVgrdJDAQgBmL/VPPvV27oGYDf6muowtW8tyzx/NkYYGWpa/sFheLCtrPCnJaYk0Qk71
	ltcbLINg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FNT-00000002vpF-0nuY;
	Fri, 25 Oct 2024 08:08:59 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FIh-00000002uAc-3Xfk
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Oct 2024 08:04:05 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7205b6f51f3so91557b3a.1
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Oct 2024 01:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729843443; x=1730448243; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FboZURjVUcmqOH+JZsWis9+u/grJQW0lknJr+SkmBQQ=;
        b=jRjWfb6V19xLNdMmlEolaSJbS+w6AsL+8CBFkoolPKcM2RAkQuHDmtvLtlykaYg4Kh
         ihdAw5UP2PlpWtML/1nnj5uXl961m+M0z81seigAKwskDCbMhkWRf2Ym81ji365ESYJi
         8Wz2wua2PmlaMkyXhNh9VvxW8CaULrWmWFKno=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729843443; x=1730448243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FboZURjVUcmqOH+JZsWis9+u/grJQW0lknJr+SkmBQQ=;
        b=oZVY4MLAcS7zgxDOtn7ztHiZLRI9D/rKt6c4mBU0wjZqV6Vb7L+LWjCEXH887a3aFd
         Qv2oXGvWO1cztvvH7FNxHpjzwHcsvWflFmjvtiLIs3kHED6TbKBqn5EZu8eezYYSWO1r
         /bFEKoUHRhFjzv6IA/+qvAMfWiio3oe+JNd6fGC/EbCV1JCX6tXvDV1Xlu/823+ymHpy
         tA1DYLc+ajazZGO2jZmI9iVDuHQc1Ahm++NR3VtMbJP7zqQO9SQdFVhkZ+BGIEOASk6G
         KZROzulVNqTXK6KHYEm/m6WkvP/zh1VCvIiVPM9qKtUqTHk2nqagxei5ftl43Mgbl+qL
         beIw==
X-Forwarded-Encrypted: i=1; AJvYcCU/OCq/IE99Lm5/1/HrbYOPDEe6MlUaKvIuwk1+SRHz0pmSEKFSYNvLSCoDNC1wRBe2U194UpzgCbxayITVCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXiw2S4ppimQYfS+86+Rp7tOK55T1JusMoHPxn8dV/D2OXIU4q
	8UaNCNXBAtY57V7QbtlEEHBjle8GOFrdW4fFPCeg0i649/NNZ8UscNHhwePRSM9oPtDAJ+pNWEs
	=
X-Google-Smtp-Source: AGHT+IE6aEDXPX7OUJEeP1hZS11M8BkJO1fdRVMhfFCbU/94VFdBQ35TBYN0pnrZfslaJJDKjmK1Ug==
X-Received: by 2002:a05:6a00:84c:b0:71e:410:4764 with SMTP id d2e1a72fcca58-72030ba9e6cmr12403053b3a.8.1729843442771;
        Fri, 25 Oct 2024 01:04:02 -0700 (PDT)
Received: from yuanhsinte-p620-1.tpe.corp.google.com ([2401:fa00:1:10:5a9f:16cc:8d5a:55e5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0d025sm558120b3a.101.2024.10.25.01.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 01:04:01 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Fri, 25 Oct 2024 16:03:50 +0800
Subject: [PATCH v2 3/4] arm64: dts: mt8183: cozmo: add i2c2's
 i2c-scl-internal-delay-ns
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-i2c-delay-v2-3-9be1bcaf35e0@chromium.org>
References: <20241025-i2c-delay-v2-0-9be1bcaf35e0@chromium.org>
In-Reply-To: <20241025-i2c-delay-v2-0-9be1bcaf35e0@chromium.org>
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
X-CRM114-CacheID: sfid-20241025_010403_892731_578BDCC9 
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
2.47.0.163.g1226f6d8fa-goog


