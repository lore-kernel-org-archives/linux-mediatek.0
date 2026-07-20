Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7DAC44515
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2026 09:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KdohSLCmhYYN5xFaerOht1QxlaqSBPNXnoi96FiAJc0=; b=YuyANnNGf1Q7Ujxepkv+e1oUv2
	ehZU9epUif38cRJ/IJCUvxxM5oSgQa+uyeUIUTOmV4lMJsU1NewQG8L8QOtqTQ0pZNlwuup1/f9Sk
	wXimRii2Hu5Skd4Y4hZEoa/L1LahzNnYyEeEmCHl1QzBs3sdJEe1jx+Ax5FRayaLnP6Pg/zLjrDiH
	z0O2VNrlmqFSNWpuywdAixMFCe9YM06lyzufj5UBdNrgRI+a5VhGrW1mAHfvwaT7TjG0VgkVsv2S7
	s9hvLihGO3RkUXvRFsteIAZ/27MfOnKXcsXPtpwv0iqwIWQD3u9P2So6dE9Nro+3fxvt9fPMVXE10
	Ik10NTtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkIQ-00000006Jha-1Me0;
	Mon, 20 Jul 2026 09:28:22 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlkIO-00000006Jgm-0MuF
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Jul 2026 09:28:21 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-384c94c9414so5454304a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 02:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784539699; x=1785144499; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KdohSLCmhYYN5xFaerOht1QxlaqSBPNXnoi96FiAJc0=;
        b=XG4eihar4T/zf9ajvRVz/F0koj7nVu0ShDJi0+TtG4RA0TdMSK3bTpX7ZSbqyz5JKI
         MsxNtkWbwbshoBEPjA4cN1BoQVbuHdpwKz1bixL8Z32VE92f3DFWPXURNQlhtJmpJwNI
         osyZ2MejCGG01x7sFP7vjmrgYc80GG2/NrXjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539699; x=1785144499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KdohSLCmhYYN5xFaerOht1QxlaqSBPNXnoi96FiAJc0=;
        b=dVgtnk0+zZVaSmI6hpbiVIZHMFKuTfXnGXOCu8CXXkNXcoHBPO93J5sLV5Rloki92g
         u3WLRSo7RcDgdyxUJdlie0JvXu0DLMIcXsAyK+NqItUiJcqZaT7Nwnzoos6dFbRSuOnp
         B0UCjV8pokFrwCamipQFUxga5oPWMXtJawbf5D0lekUmhVO0UlNN7Efc6c8ITSTb/r78
         mXyNXZpjIr+gIoUGvjCwb1nMpEd5c6d4wExj2fOHHaRxXjCm+2OFp4g4F7Yz2a/a9ZUL
         Ghdo1jbBaJWvgvo58xuOjtzT7eatfgjWXEWrNQiZp2MsrYXQOshcPWqT7DwMz/7td0Ur
         lXBA==
X-Forwarded-Encrypted: i=1; AHgh+RpXwuNKCnmf4+ZhsQEMnBdXorhYRluXoTP5/Uj/FeKA31+xufZaCQ0aDbROvFRRVtUY8OXFL8cnL1V1LSp7NQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTeKxswJvEWulSGvuGTco9OvovQMhmFJL52T1zz6TQcEVcWd/d
	YRaLykL8gdn1sHPG9Y2U8JBgjymmwG8tOtJP/Q03PL3gm+AwOArFbzIvRVYVdMRbNg==
X-Gm-Gg: AfdE7cnXJo5jdCW9qPEr+hJpfpYWJKsH3D4qqFibQxgYRkWjvKE3xe9wfxaNqbcarSs
	i5Fhmynq1ToAbVyUS0Dhf18G3fBf6m08gI4R4nwk3vG72tDxywrriws/Er/Bi+wdkUEdH5cWzfK
	cQabM4WMUI2N6XNzmijPTRO1DNNdOJ5sA77Q4GMQ09+q8Ehp2w5R+8IaZsIo7oIeDzan5bTpZuJ
	1AYlf+w3IFWrwdQBhXUbdRY0i9qvM5PVCgTfcWt5IHqsPHbNf1hVY4B3+d8MAz6Cw9dCWfMW+da
	uIEF9gfqce9RNutPgXXo+us5iGaDD5PNAUQes/NIQaMl8eTpjQA0aSVJZzJeszFKODnNPPJbTN1
	qCFUhUnTcgq382SIV5WUBwQgtWWlzCqnQ+voq3T84D50ZfOuN5qTSeIz8wW87SdkJnpQs7GnVYj
	kFnqFdmDIeWhnY00QWK0Brb0LHql06IlRmoMoYEUlyrAwhq7sx/Uyv2zQZIYg=
X-Received: by 2002:a17:90a:e18d:b0:387:e0db:bc29 with SMTP id 98e67ed59e1d1-38e4b57ee17mr15411812a91.41.1784539699255;
        Mon, 20 Jul 2026 02:28:19 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39de7875sm7342610a91.2.2026.07.20.02.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:28:18 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8192-asurada: Disable mmc1 on Spherion
Date: Mon, 20 Jul 2026 17:27:57 +0800
Message-ID: <20260720092759.1831105-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_022820_116730_995B324B 
X-CRM114-Status: UNSURE (   9.25  )
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

Spherion does not have an micro SD card slot.

Disable mmc1.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
index c02edba73eaf..0b976b09d47f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts
@@ -64,6 +64,10 @@ &rt5682 {
 	VBAT-supply = <&pp3300_ldo_z>;
 };
 
+&mmc1 {
+	status = "disabled";
+};
+
 &sound {
 	compatible = "mediatek,mt8192_mt6359_rt1015p_rt5682";
 
-- 
2.55.0.229.g6434b31f56-goog


