Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99BDD21694
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 12:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TAxqVXv28hN1E9g2AdYt07OnRxWBCBISUSonsrhZhRw=; b=LFeQg4kH/jCXsdg4oj1G2h91HR
	AKQX6dzmSodiUKBWuvAUoTkkqSjKDfhuQYYQJ/WchlNX5uDzUB5GzQRBRwCuDa42mxr5pGrKkeKNo
	Gq5b2ATrFjQ92ktx71TpVntKNmiQb0lYgCcwurjnkjH95BDhzsBAv9DEztYEkdCoxYu7ASiajiaba
	Zadp4eQrt0qT2UUN9rj0oSAC6gTfyRpjzsIKKUeXWMjvFot/EaLcbmXDqli379Op1itlixEql/GOD
	Vn6nTOaA+dsrq35iqWN5t1MRgrNn4Okz1pFIL2HQCrK4moklfFlAPuJDJB3kkwxCScCBvXZHrRwe6
	XwDrbMKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0goB-00000008Bv6-3aDl;
	Tue, 15 Oct 2024 12:37:51 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0gd5-000000089zn-2AdJ
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Oct 2024 12:26:25 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2e2b93d2da6so472707a91.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Oct 2024 05:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1728995182; x=1729599982; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TAxqVXv28hN1E9g2AdYt07OnRxWBCBISUSonsrhZhRw=;
        b=bzhR4opXuLrwexRkvf/4X5rR6CKc/INNdsqdtV8M0Ge/W7fppShJ9gnRvlavs3s6O1
         qQXRXxFiNm5VFZpNv2+VvhWbVlnur2hiX/OACowzoge5zUpWFA5Q45eIbsxpBVu0Mh6P
         yVgqHaUWohqaqildO1uDo3GOzio5dwlXw2I1zRdP1qTUgxgF3A6nZUqlCWlBSnaUGz4E
         3ciLeBuwEWTv14z9mU9TSB3CmCJcOzoDzNkY5r9WQ07MZfKsAnIKq1uPfE0C0j1bi0y3
         xjIKdXjEWNv+OwUMNZ5TLtyvSyTCJjyPPpYOFadtDoWf+W34zUZrwttCat09r28QNXNU
         o1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728995182; x=1729599982;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TAxqVXv28hN1E9g2AdYt07OnRxWBCBISUSonsrhZhRw=;
        b=osUVlX0sF95gzBA1yVQZMKgm6vzhvR5GF/j7sL/1mDKB5dyqmmq04N10CSachcm8bu
         YQrSJ/kCM+WqmWnsOnXkb2pA/1/RSZML69sIejlKpFyZiSCa37PAarNkG+D5VNXtkHop
         93JeRl26pJCbmDxRd7xxhHDL6Gd0YUY3LL8uHCmrxuqTM8BgHtlQEqpoy7jckwWcdd+D
         raRuvN+1HKxcqpsnHJmtZf263kViQ7j6HMwufaV3hHIJzlg13oiE9stpYyMPEpUJzd7a
         U2halfMm0TenZ7e3jXJ6s87VAGWbACCVCJfOp/zvzjhwbYzaZ6BPmnPg56Hkg31vVroe
         eZTA==
X-Forwarded-Encrypted: i=1; AJvYcCW1X+gKOUzw9gL3WIzH6WYJ+uYVK9elwYLbxoM64kta3/BLk/0r9vVTrIMZzocW/zuegmec5hGVCkniHJk0SA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDPSwqDz9OmQ8a+hMJZCTW9S0dndfdud7Hm5ixuiTVswNLbLsT
	YrT1xDQ6WVgd4XWOgHcQWckC9bVPS7y7bklHlKTKwu3RZTZltYGFDvVBEMxxJWw=
X-Google-Smtp-Source: AGHT+IEGHlpnJAZtdipLy3VlbZOb3D+QyT0Utpz7dB0pTEMkZhLWJL4iV3YD01cqEygPQrp+ZAwIVQ==
X-Received: by 2002:a17:90b:1d01:b0:2e3:1af7:6ead with SMTP id 98e67ed59e1d1-2e31af76f40mr5840571a91.5.1728995182180;
        Tue, 15 Oct 2024 05:26:22 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e392e8cdc7sm1592844a91.10.2024.10.15.05.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 05:26:21 -0700 (PDT)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	rafal@milecki.pl,
	macpaul.lin@mediatek.com,
	sean.wang@mediatek.com,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v1 0/3] Add MT8186 Chinchou Chromebooks
Date: Tue, 15 Oct 2024 20:26:05 +0800
Message-Id: <20241015122608.24569-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_052623_800361_61C6412A 
X-CRM114-Status: UNSURE (   9.29  )
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

MT8186 chinchou, known as ASUS Chromebook CZ12 Flip, is a
MT8186 based laptop. It is based on the "corsola" design.
It includes chinchou and chinchou360, including LTE, stylus,
touchscreen combinations.

Zhengqiao Xia (3):
  dt-bindings: arm: mediatek: Add MT8186 Chinchou Chromebook
  arm64: dts: mediatek: Add MT8186 Chinchou Chromebooks
  arm64: dts: mediatek: Add exton node for DP bridge

 .../devicetree/bindings/arm/mediatek.yaml     |  26 ++
 arch/arm64/boot/dts/mediatek/Makefile         |   3 +
 .../mediatek/mt8186-corsola-chinchou-sku0.dts |  18 ++
 .../mediatek/mt8186-corsola-chinchou-sku1.dts |  34 ++
 .../mt8186-corsola-chinchou-sku16.dts         |  28 ++
 .../dts/mediatek/mt8186-corsola-chinchou.dtsi | 296 ++++++++++++++++++
 .../boot/dts/mediatek/mt8186-corsola.dtsi     |   6 +
 7 files changed, 411 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi

-- 
2.17.1


