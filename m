Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305FC1093180
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 07:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MaodLUre5nVZDHJLR3C0Oza+ras1LIWWAXVNzmeoDOA=; b=gssKp+TEWYproEK4x0orxopOFT
	KrKp+06U4oUim4TQGbYZ/VOud8R/V8aY9bBZXQaAm50WFhvjqDgsQOZw7xeYLj0QH1FdjqR2Bj4JA
	QimKLw/RiZ3ozFqpze0sR9d/YM6Ltqdwp0OqiVhKitEnlXy75H6n/Ec1tZFylx0229JmTKXCWgMxK
	X5z5L3ep8houZ4lsLdJRnTGqiKlRWQinSz/eXNta5wTJ/IZTi0+eQGq2Bq53CVWPFalujmD7yGzbl
	tTBeWQPf+m+DfED5EMz5y3oj1Mt9UW4dR8lXuUrMvL9mPqyAhtZxAmE3pELV5hAXMJh+cBNqYEkKS
	iviuvf4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UE6-0000000CFSb-1Xfi;
	Fri, 20 Mar 2026 07:24:58 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3UE3-0000000CFRt-44oq
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 07:24:57 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-82ae379000fso234129b3a.1
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 00:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773991495; x=1774596295; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MaodLUre5nVZDHJLR3C0Oza+ras1LIWWAXVNzmeoDOA=;
        b=O7dI81i47QqhNWCjU49P1pOY/wFSESV4x4ll7bGa+0iTcDLlEhWprlDF7Mxx/4sfFP
         FK9gjJ1K2iXRXFxBR6l0FX+GB7ySKzkD57kAOI7KuTuFChMl71yEI0DV+SR9fbgnj9Vr
         syJoNe0IJBfGMKwUFu91Ql0WW8/ReQLvOgdpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773991495; x=1774596295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MaodLUre5nVZDHJLR3C0Oza+ras1LIWWAXVNzmeoDOA=;
        b=UCi35Tn/4bHZW/QGltfrY2do2gmxjt2YNdiZeyZLAy6uwqQTCX8MdpEi8J1wTILTHo
         26KHrW1Xf3t8nPnR1/bPDFCRftzkCcEeqpt1xc6yLFnSo0LQC/fJ7CmjhBmMb6hAWxWH
         0zzc2wSshjxt2m1htgbvr4eXyxqZUGxgxhEzYtX22wjJFmacu2XPalns8I9kbbUFti75
         hTn0TKRYmUivaXq9swFI4+rF94GuGUuD+xY5VOBK5yJZ9h10djI5SRtptCoscv18Vktu
         2o99az4MkZliGVMw5pPEEaW9TQaBdwYCGrQtojVtYDQwqPhpfZPd0KOczKrGKu9x8ubV
         tiDg==
X-Forwarded-Encrypted: i=1; AJvYcCVu5FiF3uZoXG2M6UyFO3rqaz97YRhgZo5DHqi3tO3JPcuUK6/uRTq1INDOpsBSQaGjkn0BW4fP2ZBtuoImzw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyzHI41VMWWnxNElxYRFd3jeFaFslMC2chd+V0nHFzOBWXeQgtx
	sIjaM2o9PMojb8KqAaOn2R6DF2rEeahAbLz5ogZQYH90Rb9JihnyiyyoiLTDBR1YLE/wXIVctt6
	6wrs=
X-Gm-Gg: ATEYQzzc1IL4vUqOACei2tA7PHbiGn+ihla1DYt045yUO9tWNuGwXEl/hGIk/dEKxgb
	03HImHznpYIdgtHokrM3n9MJXRMK4UaYQ0ECTeq3QpCpI5TJfL1i+k57Tf+hxL0KlgtoH0QZxqQ
	mGQiWaHrwA055CecNjMwxfgTPn9osJeLagdYDxPgyxNuD2ePNxAE6wbeoMiL5DOiYrRJQjwBHu7
	GIGAEwr5jf8c8YYex8wCD0ZeCyLt3Gtp99hL0vj+WMBmD0MqtHlarktcH20yQc2tULW7rVh+1aq
	jOrJmpL0QOr527I+9BMXJTDDc7jO/NVPXgzHT4y3FApjQpXj4oh8JKUA1idLIbYfvVKZxwUGahK
	iiFYFnhFd1YR0UzS8PBL7MDJDo0khtcII8F3NWaJ3y37mafbfEU/Zh5tF4zkaF8ngwiZPNZj79k
	vFbE7xPN+ORSIIml79837XeQfst3OoravZvka4ZsEcID2H95WaSw18b0exGeUT8SR8BLwnUNW+M
	oIoA/qD
X-Received: by 2002:a05:6a00:cc5:b0:82a:7931:d3dd with SMTP id d2e1a72fcca58-82a7a8e9ffamr4767730b3a.22.1773991495003;
        Fri, 20 Mar 2026 00:24:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b04222f42sm1452447b3a.61.2026.03.20.00.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:24:54 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/5] regulator: mt6359: cleanup and add supplies
Date: Fri, 20 Mar 2026 15:24:33 +0800
Message-ID: <20260320072440.2403318-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_002456_009331_2883FEBA 
X-CRM114-Status: GOOD (  15.20  )
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

This series is part of a broader collection of regulator related
cleanups for MediaTek Chromebooks. This one covers the MT6359 PMIC.

The MT6359 PMIC is similar to the MT6358 and MT6366 PMICs. I've done
cleanups for those in the past.

Patch 1 drops the restrictions on the regulator-name property from the
binding. The name of the supply rail ideally should match the design
schematics, not the PMIC's output name. The DT should be free to set
whatever name it needs.

Patch 2 drops the bogus vcn33_[12]_wifi regulator from the binding. The
two *real* VCN33 regulator outputs each have two enable bits that are
OR-ed together to control the output. This allowed WiFi and BT stacks
to separately control power output without coordination. Keep the
vcn33_[12]_bt regulator, as that is already referenced in existing
device trees.

Patch 3 adds the names of the power supply inputs to the binding.

Patch 4 implements the changes of the DT binding change in patch 2.

Patch 5 adds the supply names from the DT binding change in patch 3
to the regulator descriptions in the driver. This patch has a whole
bunch of checkpatch.pl warnings, but I wonder if it's because the
context size for checking complex macros is not large enough.

One part not yet covered in this series is the removal of the *_sshub
regulators. These are not actual regulators, but a set of separate
configurations to be used by the low power sensor hub or embedded
controller. How these combine with the standard set of configurations
set by the main processor is TBD.

Device tree changes will be sent separately. The goal is to get the
regulator tree as complete as possible. This includes adding supply
names to other regulator DT bindings, and adding all the supply links
to the existing DTs.

Please have a look.


Thanks
ChenYu


Chen-Yu Tsai (5):
  regulator: dt-bindings: mt6359: Drop regulator-name pattern
    restrictions
  regulator: dt-bindings: mt6359: Drop bogus vcn33_[12]_* split
    regulators
  regulator: dt-bindings: mt6359: Add regulator supplies
  regulator: mt6359: Drop bogus vcn33_[12]_* split regulators
  regulator: mt6359: Add regulator supply names

 .../bindings/regulator/mt6359-regulator.yaml  |  93 +++---
 drivers/regulator/mt6359-regulator.c          | 299 +++++++++++-------
 include/linux/regulator/mt6359-regulator.h    |   6 +-
 3 files changed, 224 insertions(+), 174 deletions(-)

-- 
2.53.0.959.g497ff81fa9-goog


