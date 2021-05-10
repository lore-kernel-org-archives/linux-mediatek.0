Return-Path: <SRS0=zzne=KF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A583C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 09:44:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4ED860FE3
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 May 2021 09:44:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4ED860FE3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y4EKPxJzmrhKlwc/mkg4W+DcMp4YhNwdtvvGYaa43Zw=; b=ea3KLagjXvZ030CgxSeYiAKMaP
	d6AM4adbamzQBNDB1q8WsosIhGNRKY1llmt/QH+I94wEkJcfgJFCupwoobuRybtlYs4VgOtLxGTG5
	4xxDEKOo5E8GPBmHrnKNFN+klmIUCAv5Nj+9CKMzxoRgXrt5KK9zaCriOCowWfkFL/OfqxQXqe2kj
	nDrB6tpEDzJ55mVGwCmgrpJabCv328Kd2vzgxt0S6ncsOYkM7vnmDGnyYsFzJi0nHSg6cBWdFmSOS
	2hG9bOs2tAg9+fvSKj43ssXZJRn+JZUibhNoD0mTO6xCHEL/ep1OkA9DnMdi+lEi+h69DrQcmn65K
	onHpEXCA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg2S2-00DoAm-09; Mon, 10 May 2021 09:43:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg2BU-00DlJQ-EF
 for linux-mediatek@desiato.infradead.org; Mon, 10 May 2021 09:26:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=iuM2qFwJUXSo3sJ0uUDN99Vl7wLqkoUYd3aEZh6X+Fg=; b=siq3j//cZQyq/kDFroe2r1Z+rJ
 CFlTJJvFZjJLQkOxHTl/R+yzBL6ARefUN9mkdFNgj8Tn/bRk6FvocHf1H2iHNWGeGBD1EB3qBi9H1
 poICWkN1mjflbh1CJvkdth0RVl+N228saIxyicI6mJM4ff2WdHQOj0AvoMV+MwExrdGaMF/Jw/IW7
 jElwlyj+snElDeq+gjmPm5gnz0pBwQSZUKmrJEmllLLydlaz9NlzqSgRMEfnHVg2W+flY5GyM3XyD
 UewJONOc1md8cpi01aT4gvp0n6STkDldpcoOowDpsnXRabR1+ucn3w/Z77JgyylQB+yjnaoBe8GqT
 tYbuL3jw==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg2BR-008SLI-JZ
 for linux-mediatek@lists.infradead.org; Mon, 10 May 2021 09:26:38 +0000
Received: by mail-pf1-x42c.google.com with SMTP id i190so13144872pfc.12
 for <linux-mediatek@lists.infradead.org>; Mon, 10 May 2021 02:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iuM2qFwJUXSo3sJ0uUDN99Vl7wLqkoUYd3aEZh6X+Fg=;
 b=ZFPLINz9K5Y2ICiDxQuHLQZPjY+KDhrgcDQITj7nAsKoaCeUvw7yepmVPyZy+zjzlA
 tnDIxC2wl08YncNdYK9+9uhlsZd4ofUuztqW3IXvTESANrefMFhUs+gTrQOwVkXw+d+p
 3VwZsmhkIj+KlQfez3qd9328zjCOtjaoJImWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iuM2qFwJUXSo3sJ0uUDN99Vl7wLqkoUYd3aEZh6X+Fg=;
 b=VNYT/iOurYSCIroZKVUsQHQprs1eQPCu3bScFl54Lbv/1INHjXuOH6kshkoPZO2YRF
 Kl/VBNWJhBkq0HPofKR8Wv/357sO50GuaHxZZkNoHFGwNnWqfs+JBzpuIR24yL2Hspbu
 QKmibX9iBb10Nb53yMtA9hwFir1S5wvRBBnRY6XZNajlnUPC7k511pi0ZCxf9cu16e5J
 DmfwQjEy7Vn9hFdPdPIhHFIfj19EqZSaYe7PJSW9IGhl6x81jFQam9NzecMIzhQxL7H8
 4ix9k71JEdxCd+Qqannu3oCRDWp4LdetwkKDdX4yUsbLDaBhi/98ZosDXLTJE1IixUcf
 wnAA==
X-Gm-Message-State: AOAM531LDerIVdZAROL66WKZORRNPNq288mr4YdUaB381QJJFNSKydo/
 Hsvj6zbkFRNxPFD7H+iX0l+L/PNUwfWPowIg
X-Google-Smtp-Source: ABdhPJyjbHbTp9INK0YHJwsBYB1iYZU0TdNo61ldaxVdgeUWxk/SS1fexDBLZF8U1jD9dWDvis5I3g==
X-Received: by 2002:a63:f90d:: with SMTP id h13mr24293046pgi.18.1620638795597; 
 Mon, 10 May 2021 02:26:35 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:b:179a:d92b:9be:4135])
 by smtp.gmail.com with ESMTPSA id a16sm10671391pfc.37.2021.05.10.02.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 02:26:35 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: linux-mediatek@lists.infradead.org
Cc: Jiri Kosina <jikos@kernel.org>, linux-input@vger.kernel.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Hsinyi Wang <hsinyi@chromium.org>, Ikjoon Jang <ikjn@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mt8183: add cbas node under cros_ec
Date: Mon, 10 May 2021 17:26:31 +0800
Message-Id: <20210510092631.3141204-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_022637_648159_0BCAF46F 
X-CRM114-Status: UNSURE (   9.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a 'cbas' device node for supporting table mode switch in
kukui devices.

Kukui platforms with detacheable base have an additional input
device under cros-ec, which reports SW_TABLET_MODE regarding
its base state (e.g. base flipped or detached).

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index ff56bcfa3370..40030ed48854 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -816,6 +816,10 @@ usbc_extcon: extcon0 {
 			compatible = "google,extcon-usbc-cros-ec";
 			google,usb-port-id = <0>;
 		};
+
+		base_detection: cbas {
+			compatible = "google,cros-cbas";
+		};
 	};
 };
 
-- 
2.31.1.607.g51e8a6a459-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
