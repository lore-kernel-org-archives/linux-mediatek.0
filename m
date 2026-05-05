Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDF11CD3436
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 10:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iAonctQOxYmxWwndqnNFpeNxU3FDX0KHXQsR2pNC/7w=; b=FIUqeKE8+oa3sF
	5C4JQDD3PcITodqUq4P4j5NfNJYwt4mkjIKruj6OF/igo+WTgUrEGBf0KF1g5bq9W0QVPt6KmXfU5
	y/Wly6RNLKL/onyc+z6mdOL51YqVHbrcH+P7AtaxRHCnP+WzaEnGbdnn97Pa0/KCVdcB0uKaCsH16
	N2Wv1iqtqO9yzo8Yvk11By/86BQGoNLehOdQvz9NUkaJfW8qkpcV2imeyoExS9kuewFah7mRt7viZ
	aK8yNQ6IiYUT14fl73XCOvtf/QTNstPUckYW0QW1L91ytk9hD75hDn5Oaw1KHFlra0Csf8FKSCCwr
	TrBuVeTXo5BAYjyMSzKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCo3-0000000FriK-1z9n;
	Tue, 05 May 2026 10:15:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCo1-0000000FreU-2OnT
	for linux-mediatek@bombadil.infradead.org;
	Tue, 05 May 2026 10:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=iAonctQOxYmxWwndqnNFpeNxU3FDX0KHXQsR2pNC/7w=; b=M7rkvl2aPA5HY8dZm/33s02p05
	y69zLsQFLJYkoH2CQeAbwbgcuLNccQlqnqBL5jMKowxdn9WhhuW5Ab3YxFAwh5QXGPc9iODWZPkiW
	x070PiWfZwevBB3orCPCUa7VemrPAkI+JcasUc/87NfD1ZYrJ7IFfnFHl/VyR3xrTcd46/MseiBbJ
	e5a1vx4gwGJyTGnqazwixfJa5vCe5Cr8bxklGuC3Dhmjji+cVVxomgbcY7Xv05y9N/VyONUohgCmL
	LyP44NAM6VyoTUt6upd+fkX86NfrGTqHtaEEM6QiL8XRyexCqWCIW12IEcPWdixD452VUXYO7bSut
	E09ajwMQ==;
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCny-0000000D9kJ-2lAO
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 10:15:08 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c80167f5716so990127a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 03:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976105; x=1778580905; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAonctQOxYmxWwndqnNFpeNxU3FDX0KHXQsR2pNC/7w=;
        b=UG2+qGHE8zShE04SwXmFRVOmlEFDCCOJTLZC3YcVIxGWJOVvUcsZgqpSMt4UAB/FhE
         4Rg1c5+tUbY+1/G9dcVF8cUAxd6mbzz5drs649As+83tolmTTuFvzKY+GmnkQNBYusTz
         ZaCSisoTUpcvWyJfAjdXh5xwvAiithqUthY3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976105; x=1778580905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iAonctQOxYmxWwndqnNFpeNxU3FDX0KHXQsR2pNC/7w=;
        b=Cr1XA1U44rDu07P/JfyE7IyXwtvy3+/ejpBcp0TmH06RLTfmaqWcgnLm/j7Jm0L5cQ
         52Wo4uxfcwMeTn5p92jyrMMz/qwWgMenjsJN8SPr0tSOUfwawJDdmnCCiewkfHFZT5Ef
         iDHcLuIBTOrBeF561cCTM8q9XWBTEIQh6yw72G3qeqUlwg5HegULmZmYZQowxPnCeYCI
         U6/ZeA5wivr8ahuJ7guGqS5M4Cn6SWEf0h+YJ6AlhQwA+fAXYfAEf3/jn75I8faAPT87
         IvCXfDBPSL0r/NLq0X+0VZvwXjh0ZeQqBWcO/sLmSWZt4HU2OPZwUV7DqZW6gJD9VNe9
         zDaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SrlMFMR9BkSOwDq2R9GxMdFy2QJhvH5TmgLGvSsDoxuwGHCW3h1UgKfLJHNf6/3NlBsHjUcaYoTtjJmkiWg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywzp5jOQgvb5GOS4Gv5QRvnCHhsRdiwJLxlzqPq307SkqkedIUe
	+jM6es6E/ZHCe4NDEIsPSrJuB/TiY2Fid6nV+MiW4gflgemDJZWhr/PwFkj0KfvtKg==
X-Gm-Gg: AeBDieuwxpe63M/ofXrRDJ6aL/I1GT4xj0YWom1nL4xkS1vO/zRsKzHbS8NDO/H5XES
	NbSNWfkgP93aE9w1H0b3Fo9cepuX56LDzP3r8tB6SZrLpt1ORm6lbl+VoNMRQrH+V1nGoaGafi+
	n9IZF7a/PXoz52fL0H2PpNraCudoOaIdlBk8m25VnWalfCGiRuAHFLm/baz4LKZEDdcy2iN6/F9
	UBFSdZxUJzo6EKxcia5/QE09/4lO5ztVh6glxFBDno/iMnlBeIEpEXYsK3N3EqvKgA17OcGJG5t
	NSfT7JraVAG5wiVFgSYWoFEGtaEgHupKVxguAbCmLRxrYDSPy1d2q/8XJV2r6UhM7LXQ+7/aHFY
	crjBbPagSRqelr5JyjxiDt9GaZgYULPGZulZYVdDRB7vQdc2bmu9EFfopfvXbin+V6FwnXEJg4D
	im52YlC3YQnsxZZVWOsUkilQIePH1q35CB8QdjN8RzP5OQp1s+4GZgIWsVgzLg9nZSrs/h16/9c
	13EYBCHCIVTc1dMrBY=
X-Received: by 2002:a05:6a20:9143:b0:398:7912:cb05 with SMTP id adf61e73a8af0-3a7f1c4a82fmr13892686637.38.1777976104687;
        Tue, 05 May 2026 03:15:04 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:15:03 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 16/16] arm64: dts: mediatek: mt8188-geralt: Add little core CPU power supplies
Date: Tue,  5 May 2026 18:14:06 +0800
Message-ID: <20260505101408.1796563-17-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_111506_871918_2299EDCB 
X-CRM114-Status: GOOD (  12.53  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The device tree for the MT8188 Geralt is missing power supplies for all
the CPU cores. Power for the little cores is fed from the MT6359 PMIC.
Power for the big cores is fed from an MT6319 PMIC on SPMI. The latter
is currently not working in Linux.

Add the power supplies for the little cores.

Supplies for the big cores will be added once the issue with SPMI is
resolved.

Reviewed-by: Fei Shao <fshao@chromium.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index d57e0eec676a..4cb23595d17b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -217,6 +217,30 @@ &cam_vcore {
 	domain-supply = <&mt6359_vproc1_buck_reg>;
 };
 
+&cpu0 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu1 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu2 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu3 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu4 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
+&cpu5 {
+	cpu-supply = <&mt6359_vcore_buck_reg>;
+};
+
 /*
  * Geralt is the reference design and doesn't have target TDP.
  * Ciri is (currently) the only device following Geralt, and its
-- 
2.54.0.545.g6539524ca2-goog


