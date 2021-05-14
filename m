Return-Path: <SRS0=SQT7=KJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33819C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 12:22:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7AA9613CD
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 12:22:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7AA9613CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G1FsGw8s7hOCswmk1V/b9X2yA+ZRPUwGSQQfd3e2cg0=; b=L0acxXfvCsHNVDI3ckDHIsMI3
	sSq07ttimF1p2tY5me8sccKnConoTvKT7t9HojeWF2gICKmkBkY2ByAvTlAZbtyq//9i5+OTOTG4S
	f76LG+7X9TI11i8FTebRGwZZ9pTDcCbrwL/AgrBqOBOGo0BHiWsrl2AjRbdZZOUH0uNkpYEAJYkX0
	VxMajFPK/vlH0E7x5wPUR0p3PuUXJ3aQ1cIQZnv9VkcgwVwCgW4LwusDrwyJ+PJN3MgzKzEVE751M
	2b+n0q3v34F3brr4V2E1/1bf1xP0qhembFs6KK1Gcd9v4fzIS5lzKdxgIc7whweN6+LPbF94yq9L4
	IPcMtHvrQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhWpb-0080y1-Kp; Fri, 14 May 2021 12:22:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhWpC-0080s2-E2
 for linux-mediatek@desiato.infradead.org; Fri, 14 May 2021 12:21:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=sKjlU1Buo3yAKav8pJKU6YPJruDt7qvnKtW5oGGLMB0=; b=kNNGuL5h3ldxMAx6nPpn2xz/PL
 S0fotlTxOcY1F10zpr8/VKAGoItB1H+clru+R7Et25cjIA0WpFqCopRd9yjbczFIeUlmPeWI34MkY
 F/r5f/4am5o4Ox8yYfI83ce8O7tgqaNxHvdgzgk0oGDJ2PxDfJYH91mMrPKTOcgd9PvgdpJ88zl8E
 W0/OzyG7ZMfvq/3HPxvNOmd9B2QIDti4orPFvDb+2jHd7XQKTT5wSUbXmvaDEj5QPkF0V9qNo3EfC
 t6/XyAjXFNf4tIHcLpZOh3wjw936JgbbgHrBt16NuBb9bTqCjzbKxdXNpYcQ3rDLutILIxpuWYzqK
 dEwR2peA==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhWp9-00By6r-UL
 for linux-mediatek@lists.infradead.org; Fri, 14 May 2021 12:21:49 +0000
Received: by mail-pl1-x632.google.com with SMTP id h7so16102345plt.1
 for <linux-mediatek@lists.infradead.org>; Fri, 14 May 2021 05:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sKjlU1Buo3yAKav8pJKU6YPJruDt7qvnKtW5oGGLMB0=;
 b=NLXYC/fCzff42RFMo4JsKua3S2IUCUzTzaHkCXxtiZNbwuwiwTdCxz6oz87Jq392+5
 geLJgwyMNlpMjsQV1eMcrdPMIIz9KPJl2FVhKbTfE+rCCtZm/96BW7tBnrHuaVnZBnfw
 DjDsx2hnn3ihtXF61OzbVgrDk0P2cCFWKerUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sKjlU1Buo3yAKav8pJKU6YPJruDt7qvnKtW5oGGLMB0=;
 b=Ai8eHq+2wU6FWhb9SYNFOe1UMU1pK0UwlqMNvo9mPjDUJLK6kje2wJvsBxKm7o/ypB
 i7elaa5pYHcIQ59fJeS0krjtNm3Q0ng5u3JZKp52MiUUD7BSAh4i3mGcJ8mc4kPZpdmy
 K8ouEWmLTq2eR/bpEdIlVGBVZKKv1XbpOiDehQBXKA2n4ERNoEB6tnZaaGeRJEQUwRgl
 q+b7xbPdGwMh7vxotnQPl3WjlucLyCjicHL/pGYWAqbwarLZhr+SONZoelIV3dfViXRu
 OR2FlnVhBAa8HgEqzQ9+M1mXG/LgB//ONsPUskuuxJGMf2NW3bK0DGqEbiJy25sIWlvv
 uv4Q==
X-Gm-Message-State: AOAM533WWXSzp62smZdUpa4Ti8m/CREviHm9pjbSmYx3307OZyjMVvuS
 NIVwo8V/oiB/yciwc0oNb4oh1A==
X-Google-Smtp-Source: ABdhPJzbhRjGp805y3Hi2jGWtbTzWzNP/rtCinbBrDZStuzJwfwKrzHfxCMVKpvvbNeU+KgrFdTwVA==
X-Received: by 2002:a17:90a:f87:: with SMTP id 7mr33610983pjz.38.1620994906861; 
 Fri, 14 May 2021 05:21:46 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:b:7641:4b1d:694e:6ea2])
 by smtp.gmail.com with ESMTPSA id u17sm4010117pfm.113.2021.05.14.05.21.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 05:21:46 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: devicetree@vger.kernel.org,
	Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Guenter Roeck <groeck@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, linux-input@vger.kernel.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Jiri Kosina <jikos@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Ikjoon Jang <ikjn@chromium.org>,
 Rob Herring <robh+dt@kernel.org>
Subject: [RESEND PATCH v7 2/2] arm64: dts: mt8183: add cbas node under cros_ec
Date: Fri, 14 May 2021 20:20:50 +0800
Message-Id: <20210514122051.266169-3-ikjn@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210514122051.266169-1-ikjn@chromium.org>
References: <20210514122051.266169-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_052148_001967_81B9D848 
X-CRM114-Status: GOOD (  11.14  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a 'cbas' device node for supporting tablet mode switch in
kukui devices.

Kukui platforms with detacheable base have an additional input
device under cros-ec, which reports SW_TABLET_MODE regarding
its base state (e.g. base flipped or detached).

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>

---

Changes in v7:
- remove a label in cbas node
- fix an erratum in commit message (table --> tablet)
- dt-binding patchess merged altogether with mt8183 dts

 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index ff56bcfa3370..1512605a438e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -816,6 +816,10 @@ usbc_extcon: extcon0 {
 			compatible = "google,extcon-usbc-cros-ec";
 			google,usb-port-id = <0>;
 		};
+
+		cbas {
+			compatible = "google,cros-cbas";
+		};
 	};
 };
 
-- 
2.31.1.751.gd2f1c929bd-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
