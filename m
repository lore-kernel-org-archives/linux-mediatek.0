Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F96C001DE
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Aug 2023 04:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TD+gevgj24BK8HPP9GIiWb36T/VnfPNgPphoj/WcGx0=; b=Zs0sqLUwdpOwwgGWx2YMldtnR9
	fnxRKfnA466zKD5NoszHeS8yJ6h3pJukUwNjExTysXqhzbV9wekD0DnCzTTar2rXdRQNEsuqakruv
	IRPnfMpdgFqHZwQElvCAtrwsKiOXCXrrauxQfjU4eh1OgiMlUTLKBSd7ZpBSxTqyY7rvPcqVUeIzq
	xKK7ldPo4eQ2a9rraDyhJkGbXBdrMAtQyZE83GNM2+Diz5uIK0RavWvX7KcUti7JAl1iUDHSo3URj
	IGZqPv7vnXxRZXxageI7YtL6DgUIYePkPiIJL7xPLttpdvtR3/8qRX4R6D8B/GYKqJ85o6WRCbmWK
	Osyl6jVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWrSU-007hgz-29;
	Fri, 18 Aug 2023 04:51:38 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWrSR-007hgJ-0c
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Aug 2023 04:51:36 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-689e8115f8dso476838b3a.3
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Aug 2023 21:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692334292; x=1692939092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TD+gevgj24BK8HPP9GIiWb36T/VnfPNgPphoj/WcGx0=;
        b=LeYl1NvcE31cfFvU2zGE9J5cv1gngt8rryB1sAeEokizuZXe19tFTbtA0Hhh4TVe+v
         2ABCitl7HkikCwBgKVIlMa/nKGlTc1WrSIjOsm5OT1mH2kbV//8CmR4OWqxARI9ZNmHE
         WM7J7AZiVSQsiKli6vfG+P7i7aUqtmxz5tNaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692334292; x=1692939092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TD+gevgj24BK8HPP9GIiWb36T/VnfPNgPphoj/WcGx0=;
        b=ecwXD5+1UoYXZLkTLqo2DiMGhOj46WE0hrkTeSGjvmp8O6cas2Q5eGagjKJKw9TiWc
         LZ3pXTG5FQJQLnakO8VAev02gLHOANFtOVSmOIfuVDgLs75N8sW3CWbeT0B7WRtrAz2T
         fU2SlOpRZOUxx4T9+w0A7Kwxw8uUhEq8MQ0+sGxV5DVKISE2wsf0jloIMIbjDNQYFRnd
         XPO6KJieJGocgqhBg1LU1mClfM9G+hJbytBOyIybiEFL/GAVif0RnDany3AguZQ47Pds
         d97NeMA0nNwiCbXETOqcRTJk/sA1HlC/A4dDzUEpnbwc0aJ30GxI9r1L29KQhQ8jHxtR
         k8Yg==
X-Gm-Message-State: AOJu0Yw3bxo1sxJee2QP4z7TPDcAhCrrZPLFxir8CwjuXV5g8tV80j6u
	cNW87WEdyyHSsqzveWU/cyuHcA==
X-Google-Smtp-Source: AGHT+IFjIFUEtXq1tnxcTXCexqGlqyUOsce3/7NPFcbB/8zb467vXeOLFQEEiT7xtoEunJegNEbCpA==
X-Received: by 2002:a05:6a20:2593:b0:13e:e3aa:d871 with SMTP id k19-20020a056a20259300b0013ee3aad871mr1699472pzd.53.1692334292110;
        Thu, 17 Aug 2023 21:51:32 -0700 (PDT)
Received: from localhost (97.176.124.34.bc.googleusercontent.com. [34.124.176.97])
        by smtp.gmail.com with UTF8SMTPSA id a2-20020aa780c2000000b00688214cff65sm603812pfn.44.2023.08.17.21.51.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 21:51:31 -0700 (PDT)
From: yuanhsinte@chromium.org
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Hsin-Te Yuan <yuanhsinte@google.com>
Subject: [PATCH RESEND v2] arm64: dts: mt8195-cherry-tomato: change watchdog reset
 boot flow
Date: Fri, 18 Aug 2023 04:51:17 +0000
Message-ID: <20230818-send-upstream-v2-1-f10d951a2971@google.com>
X-Mailer: git-send-email 2.42.0.rc1.204.g551eb34607-goog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.2
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_215135_244830_698251FF 
X-CRM114-Status: UNSURE (   8.17  )
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

From: Hsin-Te Yuan <yuanhsinte@chromium.org>=0D

The external output reset signal was originally disabled and sent from=0D
firmware. However, an unfixed bug in the firmware on tomato prevents=0D
the signal from being sent, causing the device to fail to boot. To fix=0D
this, enable external output reset signal to allow the device to reboot=0D
normally.=0D
=0D
Signed-off-by: Hsin-Te Yuan <yuanhsinte@google.com>=0D
---=0D
Changes in v2:=0D
- Limit the effect only on tomato.=0D
---=0D
 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts | 4 ++++=0D
 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts | 4 ++++=0D
 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts | 4 ++++=0D
 3 files changed, 12 insertions(+)=0D
=0D
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts b/arc=
h/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts=0D
index 2d5e8f371b6de..a82d716f10d44 100644=0D
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts=0D
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts=0D
@@ -23,3 +23,7 @@ &sound {=0D
 &ts_10 {=0D
 	status =3D "okay";=0D
 };=0D
+=0D
+&watchdog {=0D
+	/delete-property/ mediatek,disable-extrst;=0D
+};=0D
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts b/arc=
h/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts=0D
index 2586c32ce6e6f..2fe20e0dad836 100644=0D
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts=0D
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts=0D
@@ -43,3 +43,7 @@ &sound {=0D
 &ts_10 {=0D
 	status =3D "okay";=0D
 };=0D
+=0D
+&watchdog {=0D
+	/delete-property/ mediatek,disable-extrst;=0D
+};=0D
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts b/arc=
h/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts=0D
index f54f9477b99da..dd294ca98194c 100644=0D
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts=0D
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r3.dts=0D
@@ -44,3 +44,7 @@ &sound {=0D
 &ts_10 {=0D
 	status =3D "okay";=0D
 };=0D
+=0D
+&watchdog {=0D
+	/delete-property/ mediatek,disable-extrst;=0D
+};=0D
=0D
---=0D
base-commit: 5d0c230f1de8c7515b6567d9afba1f196fb4e2f4=0D
change-id: 20230818-send-upstream-e91e615a893c=0D
=0D
Best regards,=0D
-- =0D
Hsin-Te Yuan <yuanhsinte@google.com>=0D
=0D

