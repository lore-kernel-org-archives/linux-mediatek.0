Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F97CCF855E
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 07:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AZJgskQg5tDgPdSx1KJYs4rKBMoBQcgj9HSr6fJPbCo=; b=kyqnyb3znHZhVF
	3uDcqoYi6m1ZfNtsyzrH2SOvZLjmvgD5+D8HrDfJaoHY/NXhM0sfJL7DPKGEAKGeMmEISEV+cmQ5/
	DE3jSR9n+gI6nxO2b3F+0NEcH66w9Ut5jn3etOruIWQYZj0LXeZSwAY51ZhgZDUmkqmI01xCFcbeY
	Ee5AMkno7Hay2XVSQIVkjxj/pNgWpleIPtG744y4ZKLuu/1LJwyMIjVVG20b/ta7Kb52awmG33UqK
	GAUyAh6k1OL02Lo3x7hqCKAjItSW5dDubBv+GjnHmw4Wj6Bu0ErJTZbpnA5lw0FIfQbNx++QGiBfi
	NpXy1zp09YlFBZt1GEaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swFrY-00000008Ko0-41KL;
	Thu, 03 Oct 2024 07:03:00 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swFqN-00000008KOn-3Kgk
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Oct 2024 07:01:50 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-718e285544fso525619b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Oct 2024 00:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727938907; x=1728543707; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AZJgskQg5tDgPdSx1KJYs4rKBMoBQcgj9HSr6fJPbCo=;
        b=UXYdKkPJMxtFWCaXA9YAfQbWi2UWcM/cXL87QioeiCkwRMkLrlHZ7h3NX63RfNaS9g
         BkK9DAkyOukKYlSF7VpCPkAQB1I93U958AuS9oZI7WxNuJsE0LRgMi7B1lAeB27qpoDN
         KkLID5ygrmxRQoLwgmObHL6bceOXDmAOHByNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727938907; x=1728543707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AZJgskQg5tDgPdSx1KJYs4rKBMoBQcgj9HSr6fJPbCo=;
        b=iIC2mL3ZlRfRqx3XAVIo16HILp8NX4uWMcm4/yCyvt2L/SljytKlmWkMzStJCpBaKs
         XFAOSa/v6QKPDLfkvCEZEGfz3DiecbNiKSImmDuOkAo/2uOxQ94l/EDZbARcvxI0HMW/
         OVnA1DuBrzJ/T1DyPEfof/MXH1ZboyHpVHYnG45pcVFAwszlsol1HP0ec8j/Bx/zzXYl
         T3id2/GAcrDe+vunOMJse8LkVkWOkwtOXQVsOy7TqhM4kwF7km3DixNlKfQK/sAGlH6F
         bHVLrkpQehVGDPhDjNzSgBwAdDj0phodIZ8ST5WzELf6Y1MfJ7zHpzEDo57UIs4fleaH
         xzUw==
X-Forwarded-Encrypted: i=1; AJvYcCUVtXPRjr7dBm1cMAKrxVsgCQUKb8fseutrJyxIhygknHreo6eWBY3rviBtV67Sc6qkKgl/2laagbzVlfwQBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQmyfMuInXUXqUz1jqT6KUt4q+aS8tETVoSs1B9RvawumAFdkL
	oGTdjiovyQlIN72WfTIMEHRIVvC2f24p2UR5zomjsni06rB8766zEPX4qwANHg==
X-Google-Smtp-Source: AGHT+IEtc9guZHmCHC6M224cCyhunrP9QOCWTENBTkqLfl+XJjW5TRlJ4EfZo91lZvdW9MJ3b/Yokw==
X-Received: by 2002:a05:6a00:92a8:b0:70d:2583:7227 with SMTP id d2e1a72fcca58-71dc5c485f3mr8062978b3a.6.1727938906729;
        Thu, 03 Oct 2024 00:01:46 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:3bd0:d371:4a25:3576])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71dd9d8e473sm633782b3a.81.2024.10.03.00.01.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 00:01:46 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 0/9] Add platform supports to MediaTek MT8188 SoC (part 2)
Date: Thu,  3 Oct 2024 14:59:54 +0800
Message-ID: <20241003070139.1461472-1-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_000147_948059_DCF37564 
X-CRM114-Status: GOOD (  11.84  )
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

Hi all,

This series is based on top of my previous "Add platform supports to
MediaTek MT8188 SoC" v3 series[*].

There's nothing to change or address in that series at the point of
writing, so I decided not to resend it and start this new "part 2"
series instead.
(if I need to update both series next time I might consider merging them
into one)

Specifically, this continues to introduce the following platform supports
in MediaTek MT8188 SoC to lay the groundwork for the board device trees:
- PCIe
- MIPI DSI panel
- video decoder and encoder
- JPEG decoder and encoder
- vdosys0 and vdosys1 display pipelines
- DP-INTF
- eDP and DP TX
- aliases

Please have a look and feedback are welcome, thanks.

[*]: https://lore.kernel.org/all/20240911143429.850071-1-fshao@chromium.org/

Regards,
Fei

Changes in v2:
- add linux,pci-domain to PCIe node
- add power domain to PCIe PHY node.

Fei Shao (9):
  arm64: dts: mediatek: mt8188: Assign GCE aliases
  arm64: dts: mediatek: mt8188: Add PCIe nodes
  arm64: dts: mediatek: mt8188: Add MIPI DSI nodes
  arm64: dts: mediatek: mt8188: Add video decoder and encoder nodes
  arm64: dts: mediatek: mt8188: Add JPEG decoder and encoder nodes
  arm64: dts: mediatek: mt8188: Add display nodes for vdosys0
  arm64: dts: mediatek: mt8188: Add display nodes for vdosys1
  arm64: dts: mediatek: mt8188: Add DP-INTF nodes
  arm64: dts: mediatek: mt8188: Add eDP and DP TX nodes

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 643 +++++++++++++++++++++++
 1 file changed, 643 insertions(+)

-- 
2.46.1.824.gd892dcdcdd-goog


