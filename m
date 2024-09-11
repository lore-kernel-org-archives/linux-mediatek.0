Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C29EEE01EE
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 11:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rBK5HrwCcAQdUPHX8HmJCGl0lCk1GIRThLwD9xKBAaE=; b=13Mb4Lggvv4jUd
	c3jhV4qNMQayRyfys2Kzjj1j6NEOo9MsTlld+ixKF/hgYrEjlSC74bEcIaALbc3VAGpJSbOvrBw3m
	eJXXVGIpxxOgKURWhPB9wSMCgRLB3I8WfFQpW/XilsdBoa2fvYTOJAUBHKZJF9xU3WWZg2fg35n9p
	jbqGPzuhdu6BhWoyj4YF9xL5JixNSrX37GtFlPIHO1sPtf9bYw1d1cygIr4sczTBiGyqZkB+cFqzW
	tLTYVxlYDgEmWV1XPhlGhZzQpsmB8ZnCaS7XQgBTKjkDXMy703Ma1INIJAqzv3yWIO6qrsIQFIJNL
	krHfy8MJ9pamJuwmD7cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLCK-00000009EF8-1AwG;
	Wed, 11 Sep 2024 11:07:44 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKxV-00000009Azn-0c4Z
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 10:52:26 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-718d962ad64so4854928b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 03:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726051944; x=1726656744; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rBK5HrwCcAQdUPHX8HmJCGl0lCk1GIRThLwD9xKBAaE=;
        b=CCx7K+yz7nhbYqECjfABg927LUtauR6SNAVLoyNEkEBbROnOZgxXy63ltxG7/0sh0H
         KV4VYCR4VTi0Mb3iR6Vi9FXDGriRNxOTm5dfIuK+9GS5yIXCxQCIPgvczSiUyh0mNImJ
         aPvJNNJ/hGnzWqfYf3cnmz4Df2A/QiIcqqOGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726051944; x=1726656744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rBK5HrwCcAQdUPHX8HmJCGl0lCk1GIRThLwD9xKBAaE=;
        b=X2lG3z0lyVHNvDbcEYD4pJ9ldiVn60xU6YdvT30HKF0Z8VGP94cJE4F8rQDoa5abJF
         aGvVf0HhF8UeJf+3ukZg/qFcAh0+djiIrjK51Ox0SsvRLiKAlgtNRK5AyLwU7IPtf34+
         j4QJKvFBK+GwqNDi56WroSNhpSTeH89Ck7fPwyWZLz2pcun7VQ5Po5BU33JZv/RPDt1W
         O6YfGrK2Kh+rDHKmuYGG/D/VsexuGQdFEFQzF7juwnaeQm0FxDDxIRNrU1xKqeTwUPk8
         KudDOkCDBurerTXM17pf9ILi1Px29nuGN5hzLk4HTlN8Soos5gDj7NFdyDzSKZPk5Evu
         Gv2w==
X-Forwarded-Encrypted: i=1; AJvYcCUgT6bNtlyqNwh2bs1P6vBg6EmW7kXVy4SlBCL/8ZInS4JALkBrIzTUz+3W4Idbq8ShHKiKkbxBweOrWV8maw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc0pLv/iXYHNEgXTUrZmt7NyYLp29Yir5+OTuGfN40HysaDCh/
	4iScvCl8tkjmlY4QC2oG5aiuyOTX/fDcwShd1RdhGRc2WGpySLQW7I39NpICSQ==
X-Google-Smtp-Source: AGHT+IG9YgMDxM6JH6QzsTZiuEKQdBS+aqMoSgP+yD4hhHJ4WT18x5zG3lCN0kR9XJqx6yodEhrX6Q==
X-Received: by 2002:a05:6a00:148a:b0:70d:2e24:af75 with SMTP id d2e1a72fcca58-718d5f06932mr27638808b3a.24.1726051944217;
        Wed, 11 Sep 2024 03:52:24 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:102f:d738:6069:fd4b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d8242b3d13sm7147352a12.52.2024.09.11.03.52.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 03:52:23 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 8/8] arm64: dts: mediatek: mt8188: Add socinfo nodes
Date: Wed, 11 Sep 2024 18:51:13 +0800
Message-ID: <20240911105131.4094027-9-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240911105131.4094027-1-fshao@chromium.org>
References: <20240911105131.4094027-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_035225_207970_628BD0D3 
X-CRM114-Status: UNSURE (   9.46  )
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

Add two socinfo efuse data nodes for the SoC information probing on
MT8188.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

Changes in v2:
- Added socinfo nodes in v2

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index f459e86d4024..37fd16691ec7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1904,6 +1904,14 @@ efuse: efuse@11f20000 {
 			lvts_efuse_data1: lvts1-calib@1ac {
 				reg = <0x1ac 0x40>;
 			};
+
+			socinfo-data1@7a0 {
+				reg = <0x7a0 0x4>;
+			};
+
+			socinfo-data2@7e0 {
+				reg = <0x7e0 0x4>;
+			};
 		};
 
 		gpu: gpu@13000000 {
-- 
2.46.0.598.g6f2099f65c-goog


