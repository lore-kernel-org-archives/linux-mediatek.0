Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06385C5B543
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jun 2025 06:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6O0xC6SOcOSthm+nVuFP6/iA1o0YzWpNBPJwRk/wNao=; b=Q0T1UxWUzDT9djO9m/0kMru6gy
	oRy9FRVJvvebzPehjJ4owHLXkovTBGBWaI66YGF0q5CqMpGWXe7tHKpSYlREGquuUnYhfg+YXU+Ge
	WlyAEdovaDWjztLFqnG4Oarc6fHWqAxe2JqzYQKtPGx2rhVM7Yswni+ddUoMEdKA7xqaeTLVcl+RT
	j7Aue/Tei2iESM2AJRCxAiFeMHkybuS0kqxfLtaNg/CptfCynGHysH5q1lOUwyWz4lE6a2gMDiutT
	PENJzWY/QGwMS41B1uhPUiiSIv9kKbLagPQyCW4H4fk3ewsEFJWzjQXyO4FG9EQEYgFcruSSopJpH
	/clRaICA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsZJ-00000005wO8-0qO6;
	Tue, 10 Jun 2025 06:34:45 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOsZG-00000005wMe-0y8K
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Jun 2025 06:34:43 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-23602481460so32092245ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Jun 2025 23:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749537281; x=1750142081; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6O0xC6SOcOSthm+nVuFP6/iA1o0YzWpNBPJwRk/wNao=;
        b=AfpzYHLPxv8IWRx0wY+a8dWRqWe8XohwfVVsYXe/21MKRvkVqS1E9SZQbcJysPZH1Q
         vPXdP+QT+Cg9W24mgKlCq6wnhaZ0SMiuxlEDKKLhx411HjwHKSt5+zAs0GkuoVlo6LGt
         oNbmB+urU5WOfHIUu0MXT8Gp0NdQ2JRy0ePIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749537281; x=1750142081;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6O0xC6SOcOSthm+nVuFP6/iA1o0YzWpNBPJwRk/wNao=;
        b=AJWw2hMFNBVnw1MTz7kiGoKkuF84LlN/PrgO+LoIp8UZPdvjB/Y/nWWcegw1AEoD+r
         Og2i/tSYJFHVL7BXMePpdiFfz+0do33UW6tj/fIuga3C9CEMDk9ClMl1q0MwAsmIwWOT
         YXIYfCenSoxoNeLBpFl3UcFWuYel7BEvNxKBJ8QdBTnq+hHU/TtR8Rcn6ui8E7GezA63
         +e+Pg7sa1qNJpva5XA0TdE8p3VZT6HNdgxv0XOqYR6RmiglzZY/aZ/pfNYEOu7xNgfbZ
         s7BsuRSvVKw2DeaLqrfuneUoqu6v6pmgMEGVLHK8fcHbolypSFKy72cBSRX5OKYtrGSL
         h75w==
X-Forwarded-Encrypted: i=1; AJvYcCV/rsIHtoQ3jVTyICtX1k3i65r6MStm9Vpvj7/itwhH1n7FXRSgoqXSAdygDDv2oNaqv52cTFx59r7eVGBlwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YymS7362O3W+zYzE324X+Qerf6tzRB4Wzuyq3x5YwiWrvVaFZIY
	srAPWYk65Xje7la3CTqJUP90UpeqiDM1KKfZAXd2mbQFifA8z4+ln4NBjzlX2c8gow==
X-Gm-Gg: ASbGncuKUCdrIW2lN5nuobuDCKUNqRZughb9CZr26xSZeaQ97gJgXE1REsHyYhKux4J
	w4SP9TrRNpu9iDoCPEu0oxMuDwLShcW9LKguMFkvrtKL03IOlGwcY0oFUaH4YY5eLlIs+9XOnL2
	LdB4TAl+R+rGcfTql6R8hzx9amxDHevyySzD/Ou0h6xZgBHDbD2QHHMogoQITIusGi2myeN4i4R
	BXMEfmp+0ixBLTBhfu+rYolg/eSPKUjxQ4N4dYqiKDCMAeGmeT6dHdzb580H50LxNJ8AMcxF+v3
	v9ITLOUugpaRtK0MwVjG+AqVTErX89tSdh+1ealhip1V/DwfrZQVALT7aFijcBox/hmW7aglB40
	R8xnm
X-Google-Smtp-Source: AGHT+IFMVjJL9gd/t2t1Cdy7S0Az0MbbHnKQkvJXrj2EcXFz4rjITbDsj/BO0L7kopXXEwjxKA52Ew==
X-Received: by 2002:a17:903:244e:b0:235:f3e6:4680 with SMTP id d9443c01a7336-23601cfddb7mr217198085ad.21.1749537281092;
        Mon, 09 Jun 2025 23:34:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:2826:ada4:efac:14e8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092ee2sm64596765ad.82.2025.06.09.23.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 23:34:40 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Lala Lin <lala.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] arm64: mediatek: Enable efuse GPU speed bin post-processing
Date: Tue, 10 Jun 2025 14:34:28 +0800
Message-ID: <20250610063431.2955757-1-wenst@chromium.org>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_233442_302453_63F9594A 
X-CRM114-Status: GOOD (  13.22  )
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

Hi everyone,

This is v2 of the MT8188 efuse GPU speed bin post-processing enablement
patches. In v1 [1] the change was made to the driver. Angelo, the platform
maintainer believes the change should be made to the DT binding instead
[2]. v2 adopts Angelo's argument.

Patch 1 updates the efuse DT binding so that MT8186 is a base compatible
with no fallback, and MT8188 falls back to MT8186.

Patch 2 updates the MT8188 DT to follow the new binding.

If possible I would like to see both patches merged through the soc
tree once the DT binding maintainers give an ack. This avoids prolonged
waiting for the binding changes to land and uncertainty about whether
things have fully landed or not.


Thanks
ChenYu

[1] https://lore.kernel.org/all/20241223100648.2166754-1-wenst@chromium.org/
[2] https://lore.kernel.org/all/11028242-afe4-474a-9d76-cd1bd9208987@collabora.com/

Chen-Yu Tsai (2):
  dt-bindings: nvmem: mediatek: efuse: split MT8186/MT8188 from base
    version
  arm64: dts: mediatek: mt8188: Change efuse fallback compatible to
    mt8186

 .../bindings/nvmem/mediatek,efuse.yaml          | 17 +++++++++++++++--
 arch/arm64/boot/dts/mediatek/mt8188.dtsi        |  2 +-
 2 files changed, 16 insertions(+), 3 deletions(-)

-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


