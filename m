Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64848FF885A
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 10:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/+HU1QYQZmhqORfdmiy8w2qez1W1MQHoWlaTLfNyCo=; b=1FXPJ3d/+U5RyJ5lWugmmkH5xt
	ygi8iXOsFMw2+dYtdvBogI6/TcVODmf8ipZGra3myzDQlYnuMShZdlhBBiRb/a/oseC0QfgVjwhXL
	k84yGtrk0OtO/5yL0IJ+IZMQj2BEL7UwpwoVsh75T8UOCAjtFdnjtwpjihWlVdOJdE0DUNbWuKOWi
	2mQxde5IReOeHEtXtuJ/hDHdyrmjTNh8CjZmr/mSNjN5LqB5irvVvxF1vwcBdoXnefa/s5885jSoe
	rHkfGZdi0h04ofO9/OuGNEHVfW61o/+il2GC3Tkly2Ug4tKQNYv/4j4ay1gganolPvXofHXvK8v2c
	ELGnivCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnn-0000000FrI0-2HG0;
	Tue, 05 May 2026 10:14:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnn-0000000FrGj-0h3x
	for linux-mediatek@bombadil.infradead.org;
	Tue, 05 May 2026 10:14:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=U/+HU1QYQZmhqORfdmiy8w2qez1W1MQHoWlaTLfNyCo=; b=IBUF2ODafnm91uITt0U/DkxF04
	NJIM5BWWo7gVovb5B0jYKRkZbs0GCAFaTxu+/ZzYcYRRU06Y4PC6uI4YcHQCnRFFArR6yDORnlw+0
	MsjOPMV/MFAvl92gIWONx4cW1Q02Lyln+9Edb76JizytE17XgVwjVPC5uyhNlgwBg2fEyVQWHbbwY
	CcBIrktb7QfaA5JqYHZ+UImqnjCP9RDVleqkRQ9snLlsX0FKJ/4rZyzRI9LHyeiA1M9XLHUDZ9kBL
	lXxS1usztTqFJJ7AiX6Bl/IAmk82/wdNUFmXWfxmgs4grT3YJZ1RO92V7+eqZwTHHK4gs3Fr0UfXb
	aNItTkwg==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnh-0000000D9aZ-46Dh
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 10:14:53 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8354461da74so1057670b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 03:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976088; x=1778580888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U/+HU1QYQZmhqORfdmiy8w2qez1W1MQHoWlaTLfNyCo=;
        b=DOgWaQ24Mmz7emzVeO5PNmmfTUgSn6UGIlFzhanqXT0bR3p0StrYeGfRJzvaDpm+FX
         EBf1KZm4BB2PvdiRMqjbct5ehTaCUVcqosf1g639dhfk0ckT4mLF4Dx0YY2cvIZwKOYi
         L006C4Isw6E0bnY5UJocnB+ZYLRWF4aDtRVwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976088; x=1778580888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U/+HU1QYQZmhqORfdmiy8w2qez1W1MQHoWlaTLfNyCo=;
        b=gNHtqSG1o3xGrg6BpKXZNyaszI2oa3MVyTnxC3BckHJO/Sn6dvve0i7cuyi/STV0Ls
         ZVQNFE2deM6Qr8Jd3Mf6fWSpbiYGjDHkIQ9hZKozyAA6iiSHKw31FKshr/oKORM4XA9J
         pYVRWPsBXJ27BQPPGz9+7+U4GUFNTrEKVkwQ9yMXuzPMIJH8EKsZqU6jkX/2hbpP2CwX
         d0K14RN1qwS3sS5Yqnx0hTKFItIJ0VpE9SVymzz+0EJ2pVhPJb5wsopxquvsBOUHsTip
         Ki+l/a1KvWdHh/EMI5CSnnvvDxqZRV5yhYDijTxxrxenGOSBUUrp/yJ9HYdFzBD3SOct
         hMew==
X-Forwarded-Encrypted: i=1; AFNElJ/XHf1fKuYpxp/htprrUvszoKtwkaSCiWVyP9LKMym3zJRt4HFP/VAuGaYx6w4zwDYYRDPYsyiqY6EYsQGu4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVWTvc9JljIDWz6d0JvdJteMZkWI+AT13n5S72QNEpsX3F+EXr
	bp1m9nhSqGRLiE9ObcwFkNjzyvJUBFLa/uEjJcM587A0X1fJQpCRMjQZhHd79godkQ==
X-Gm-Gg: AeBDietzYTZkZe5gzxKBsqEW96yk/6on9JJbBHq5dFFMxEVuWeKnWbr+68sr43lveed
	MMiteR5swS23acUSJJFP7DImGPTCpTvEK9kCH1S3ixazwIGqNgnFe8YT5pQ5m41kOq7cAr6Vdft
	H2Nj7K1IiqbvohaRvff1ZxMZRpApjgT/TLRF9OgMa916GSyc8EGUjhAbKxCgT+AdSVUAF1jngtN
	p/hJB2OBy2iNqk8/GzA7e5lPrnLyApG4TE93FnOUmhVvsDMWsrdlvk4w3k0swE9Am0gzLii9tJq
	g6eb9vvuLwKSZRSCf0o5cblwJsjOKYoSvqOHS60bJaUFnE7f95l0h3r+0IW2ueB9YTmuPzFlplI
	KSVCJmh77AbBAxjDIjSyJSI3d+7cSrErMQPbuszaBI2Wa02wrj7dsOw3pJCDOE6JBn4MljHujmu
	h2oN6jTAqfml6A7iNMVplaDCS0px1VaFJpe1LM1DCLKKPQPK5POA3gUGWMFYtnE/R/NP0Rn7Klw
	KUexs/PuQoLe6vDVLnEjQUxmHN7rw==
X-Received: by 2002:a05:6a00:1956:b0:82f:5c3f:94c6 with SMTP id d2e1a72fcca58-8352d26b9f5mr12659407b3a.28.1777976088522;
        Tue, 05 May 2026 03:14:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:47 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/16] arm64: dts: mediatek: mt8195-cherry: Add MT6315 PMIC supplies
Date: Tue,  5 May 2026 18:14:00 +0800
Message-ID: <20260505101408.1796563-11-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_111450_164857_F3EDB0FF 
X-CRM114-Status: GOOD (  10.86  )
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

The MT8195 Cherry design has two MT6315 PMICs. One has 4 outputs ganged
together; the other has 2 outputs ganged together, and the other two
unused.

Add supplies for these two PMICs. Since the outputs are ganged together,
just add the supply for the first one.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Moved supplies to PMIC top level node
- Added all supplies

All supplies are connected, but since the regulators are ganged
together, only one regulator node is present.
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 0b9fedac842c..cf9855618494 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1472,6 +1472,10 @@ &spmi {
 	mt6315@6 {
 		compatible = "mediatek,mt6315-regulator";
 		reg = <0x6 SPMI_USID>;
+		pvdd1-supply = <&pp4200_z2>;
+		pvdd2-supply = <&pp4200_z2>;
+		pvdd3-supply = <&pp4200_z2>;
+		pvdd4-supply = <&pp4200_z2>;
 
 		regulators {
 			mt6315_6_vbuck1: vbuck1 {
@@ -1489,6 +1493,10 @@ mt6315_6_vbuck1: vbuck1 {
 	mt6315@7 {
 		compatible = "mediatek,mt6315-regulator";
 		reg = <0x7 SPMI_USID>;
+		pvdd1-supply = <&pp4200_z2>;
+		pvdd2-supply = <&pp4200_z2>;
+		pvdd3-supply = <&pp4200_z2>;
+		pvdd4-supply = <&pp4200_z2>;
 
 		regulators {
 			mt6315_7_vbuck1: vbuck1 {
-- 
2.54.0.545.g6539524ca2-goog


