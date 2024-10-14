Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B304D1625C
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 12:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3CTAyHzEHHpOjEdNe7fNi+ftJGbt7ANQ1A4KOmzN7Kk=; b=uKw/P3FvxeJCiq
	h5w9JOl8lJAPfsspCMPRDl1D61OwXfQkmWZhzCBf/oD8afdbgQBeIb7+28XQ2pjqqmIsm7q7+5Fii
	h8wSL5M3mn0g/hgNSfUMO8tXGg+NFVjk2BC2GQEleK6IhCv356WPMJwsrtGsAnTLsSW3TNS2rrCDP
	lHg1yPXCuTIDH/wnApZnm6jAHasgBCYtr37ZMDyYgWYtjp27SQJ9Fus6GfJzgmMm13weZbCO1lSwF
	SPExn1fDgeqLzVNRFBeZIPWpk7GsaPuhFaHY/hScL5JssvkSm9GKhsWud3Gsdtn27HEitiX37FvVJ
	S4ysCClaIfTM5yGq+XFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0KTa-000000057sh-2VoK;
	Mon, 14 Oct 2024 12:47:06 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Iyn-00000004rLH-3euE
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Oct 2024 11:11:15 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-20c8b557f91so31205705ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Oct 2024 04:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728904273; x=1729509073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3CTAyHzEHHpOjEdNe7fNi+ftJGbt7ANQ1A4KOmzN7Kk=;
        b=EOmsDvijNLbiktiVF2SIisE3aqH9+IPya/9I+Sp+16R4CKhHFPke1OJoLScUayqwh6
         3q8bvJv34vIijsTQj6f2jyF7HhW3YDQaD0mATJpzLMxlc5LPCMHXJoRFvMGax4kmoEal
         LdNxWisdZDoEOxTxwMBgNegCAaMZq7y6Zbpc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728904273; x=1729509073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3CTAyHzEHHpOjEdNe7fNi+ftJGbt7ANQ1A4KOmzN7Kk=;
        b=hfryr9tkmens+M+ETlJ/QL+kSvo2yQeg3xZBZHotQEqvWc0OWS1BMqRr5sD43XXR+E
         D/0Q9DxJB32NEC4c0HNiqQ594OoWwy2LK/cXv/rmW4VSVGgFl/MwSsHxHXMPcY89VQ35
         Q7kwGUgKaQD8V0AvWwCsdeMsS8x79Ix92c6/e+LHT1Z/TDP2fQNjOzpkRrrkW6LXQnfP
         DQ3szQq3IvYnehX3AXbJYgfIunEorYMraCpE0I88y4S3TgEOFDLPqY3YJqYKiLBOmEC0
         1WRlNtt+bkLKIrf9NWHrmXhL4Zw2wUP7k1nrMRnh77EYKj51qV2yQmX/p0CT8XZyx17X
         o4UA==
X-Forwarded-Encrypted: i=1; AJvYcCUYdOU6eD3kDcz7jXFTsguDwN4f6MZw2uZVC35iMGpk0eIo2Qlccx/8JfXdhaZq1zAEJOgzue7xJ3Nfxd4CxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyT2wOS7PauJohaPkVCxXC4wdAWXY7yyErrqScxiCWxehnQSMxS
	JRXPxGqW1qc7uek/0h1gtZJgnOB4t1+8k2E3rCHaxuUV6/i2EnbZVvVlkh9CiYY8vSr4FC8ECGs
	g8A==
X-Google-Smtp-Source: AGHT+IGMbAPex2yYtCXEQkvLu1sqjspeL0uhCNoZZMu4GbeMk0mCEmE8tfwGUS5I9FEbgBd/vj/Ueg==
X-Received: by 2002:a17:902:e845:b0:20c:7409:bd00 with SMTP id d9443c01a7336-20ca1429a4cmr162274825ad.5.1728904272992;
        Mon, 14 Oct 2024 04:11:12 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:4907:d52a:1a1a:58d0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bc3e6fcsm63858285ad.118.2024.10.14.04.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 04:11:12 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 0/9] Add platform supports to MediaTek MT8188 SoC (part 2)
Date: Mon, 14 Oct 2024 19:09:22 +0800
Message-ID: <20241014111053.2294519-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_041113_987862_50EFADCC 
X-CRM114-Status: GOOD (  10.64  )
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

Hi Angelo and Matthias,

I'm re-sending this v4 series to hotfix a bug in the patch that adds
vdosys1 display nodes, as suggested in this [link].

Note that the previous [v3] series is in v6.12-next/dts64, so please
drop that series and reapply this v4 instead.

Sorry for causing any inconvenience.

[link]: https://lore.kernel.org/all/40ce7287-7fed-4670-b16b-695c36535661@collabora.com/
[v1]: https://lore.kernel.org/all/20241002114614.847553-1-fshao@chromium.org/
[v2]: https://lore.kernel.org/all/20241003070139.1461472-1-fshao@chromium.org/
[v3]: https://lore.kernel.org/all/20241004081218.55962-1-fshao@chromium.org/

Regards,
Fei

Changes in v4:
- Squash following patch to update MERGE alias IDs from 0-4 to 1-5:
  https://lore.kernel.org/all/20241014094622.1720289-1-fshao@chromium.org/

Changes in v3:
- add the secondary MIPI DSI

Changes in v2:
- add linux,pci-domain to PCIe node
- add power domain to PCIe PHY node

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

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 668 +++++++++++++++++++++++
 1 file changed, 668 insertions(+)

-- 
2.47.0.rc1.288.g06298d1525-goog


