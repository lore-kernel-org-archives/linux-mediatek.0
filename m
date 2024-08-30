Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6CACA0EFD
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 10:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uwb4ryjHwd1WNWOHt2dYb4LFy2usK3hFXIPxUh2iuvY=; b=08UrDqoNEyeZ5H6W7F09w2/2pa
	5JYeE91sjrU5ya/bmNcU6jRsEkDKr6SulqLZjNYAiP5k6kwYUP6K6vyuS3skwxOIxLC4IP7ablYy7
	irgTdQBiA8PxE97qmldNT07G+9x2l8fAIfvYJjZw0Ext7ZmeV0vuKxPHViElXsDI6+ylncoS5c2oe
	oZ8MsPB0YOj5H+yrEDneoYaouIm3Ju5Wz9psgH5VbSG+lZV9z0FOVA54nLvFNnTW8OlFSBNgiaFz5
	0rMX70dkseBDhhh0DylvJND74iZb2aA/kWCOfN6ZWk1AvLBqnjnNGB2SNXWL5u93DNeOsiJbzszO+
	Bd3AffsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjyRJ-00000005gCI-42O2;
	Fri, 30 Aug 2024 10:01:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjxGc-00000005PmJ-2BZX
	for linux-mediatek@bombadil.infradead.org;
	Fri, 30 Aug 2024 08:46:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=uwb4ryjHwd1WNWOHt2dYb4LFy2usK3hFXIPxUh2iuvY=; b=FseG1JBJxb7ffmxyq6WrxUmH/C
	LNIRCusX/rwqv+xsfhcVZZajcvq2m7ev9cmu1hv8BHA9JJPHL33h6qXg4WG7732td4ZA16rBa1Z80
	DsGX3W3FP+8nbeNuABpnQUTLOfqE57IeRWmymc6YzT4x570FY+zXJ6j4ivnj41zVQlOY31PieF0S2
	Y6iqKvYblpEwqUVezVp+7mI4CVF2+ckLDavlJ8s/yZ6FSArQhVeqZEnMNePhnl7iLSNE6kWUrdfeK
	W3spWYnMWQZH6aP6EUD8DlRYHnBCG0qNyayRSTcl6bY4E+6F6OoXpqFu132lYfnXFltAm1Rvb6pXP
	nPjS9eIQ==;
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjxGW-0000000Bc5L-3fQP
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Aug 2024 08:46:01 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-70f6c83f969so76254a34.3
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Aug 2024 01:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725007552; x=1725612352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uwb4ryjHwd1WNWOHt2dYb4LFy2usK3hFXIPxUh2iuvY=;
        b=CRKSD3uAHC6WnaknffAlkK1XiZdkcR89mZgyBygmtOeCO/IVcIEdv5TBS7R3Mdx55U
         QH9hA1r+Z3Q2bTNcbNtEX+gCIRaTtHWFsdj3oiViIpKIDTvvlUTlvFTaW7rkU4S3O6Mh
         HBMzIBM67ucjLXR5+onsRNKgY5G2oNkeRKd8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725007552; x=1725612352;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uwb4ryjHwd1WNWOHt2dYb4LFy2usK3hFXIPxUh2iuvY=;
        b=CXk3YTamNhaS+4tt2ENnpuEyTY7kh+IpwO9hLhjk1e4epyOHLMliD23Pm8P4sQ9smc
         /Hw+nDW6k+Zs8P8VUiqrK59bygcHRsOkxMZtKBYy1gbYGK+RPj03dtPjLthtLHJa6Ckq
         OwFIoBgdqSu2t0EuGyKF+roNaDlJHfpaKT9gIBs1j/ylhUfpTMTOTVYbMZic//IHCuyx
         6aqgMyoRyjvxI4xZBI4ec1XfTilv6GE/NEbYt6dA4IaH7EiqnhmbDBOHgoV1TrWu9W0+
         r8E/u1MCPbNaAVwTfsracQevnD7/fAzjFzEy1KDi7KV6aO0eQ7XKXyZiQ+51zwm+2byQ
         kfjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0D6r9kHxWzedr7lEtRlk6z0xsh4ozpV/oMxW6wmv8WXXq6OnkvvcYjmokWS9OCRvsiA4o62Nh0omcPeUWEA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyY6NxueC+jfAao6UZ7uTI+ov69DGp7rwcN6zVgKZNtdQo+YASa
	85cq4pxHRYTUznmoKW25+IcXfNXlbOEs1YYrj66QHJiGDZQqw0UNEawuaO2ZHg==
X-Google-Smtp-Source: AGHT+IGHGLA1gX/XRVCRV3NVqvnH4tc1FAiIFTMavidgJQhJ0QHl48VQRGJQ8UpPf3x2Xi2MLTe3DQ==
X-Received: by 2002:a05:6359:7c15:b0:19f:4c24:d9ad with SMTP id e5c5f4694b2df-1b603cb75d1mr694374055d.24.1725007552239;
        Fri, 30 Aug 2024 01:45:52 -0700 (PDT)
Received: from localhost (117.196.142.34.bc.googleusercontent.com. [34.142.196.117])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-7d22e742774sm2467245a12.18.2024.08.30.01.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 01:45:51 -0700 (PDT)
From: Rohit Agarwal <rohiagar@chromium.org>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rohit Agarwal <rohiagar@chromium.org>
Subject: [PATCH v4 0/3] Devicetree updates for MT8186 
Date: Fri, 30 Aug 2024 08:45:41 +0000
Message-ID: <20240830084544.2898512-1-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_094557_583056_93B6C712 
X-CRM114-Status: UNSURE (   8.79  )
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

Hi,

Changes in v4:
 - Rebased on this series https://lore.kernel.org/all/20240603-mtk-thermal-mt818x-dtsi-v7-0-8c8e3c7a3643@baylibre.com/
 - Updated the overlapping starting address of svs node.

Changes in v3:
 - Update some formatting errors in the bindings patch.

Changes in v2:
 - Update the binding to include power domain in only some
   specific variants.

This series updates the DPI node to add power domain and
adds the Mediatek SVS node as well to MT8186.

Thanks,
Rohit.

Rohit Agarwal (3):
  dt-bindings: display: mediatek: dpi: Add power domains
  arm64: dts: mediatek: mt8186: Add power domain for DPI
  arm64: dts: mediatek: mt8186: Add svs node

 .../bindings/display/mediatek/mediatek,dpi.yaml | 17 +++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8186.dtsi        | 17 +++++++++++++++++
 2 files changed, 34 insertions(+)

-- 
2.46.0.469.g59c65b2a67-goog


