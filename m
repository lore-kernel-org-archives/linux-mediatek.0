Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9175ECA9EBD
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2026 18:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3TR1mx/d+lJPdCos6SlZvIHemcM3rDJJZi+7utetLY=; b=PzmIjI7SmkBfPWUYlipW0eg8hh
	Yk9jEAcAyHz+vSjzwsBLEEvL8Pe9HuRq8c+bOLS8mcDXd3pFESm5VH/Dnu53FfQQxCwY5hynWAsMi
	xPLpCdz8H7chQ41pQodMQE5tOaPPJyD9laiqwa+PPaK9hsg2tX9cVnICOs8wuqIKSbFqbVEgri/4h
	9eN/F/HLDVkSI5mSsvobmzhrQa4faLe9xvZTmdk8Eq6a0j/YneiL1seo2FNTYZ01bgl0Hm7zFl9At
	DjoCH6zjDnDsd+jwOZgM40R3TScx4KegAFA0LMtCu/DP49ArtOJysMvbrr4XINsJFrJGA+Kt3CcZX
	46ocUSIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFNw-00000006z9a-2cus;
	Fri, 09 Oct 2026 18:32:00 +0000
Received: from mail-qk2-x06.google.com ([2607:f8b0:4864:34::6])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFNt-00000006z74-09vh
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Oct 2026 18:31:58 +0000
Received: by mail-qk2-x06.google.com with SMTP id af79cd13be357-93bfb25817cso521768985a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Oct 2026 11:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791570716; x=1792175516; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3TR1mx/d+lJPdCos6SlZvIHemcM3rDJJZi+7utetLY=;
        b=Te8wr+CX6sJ0B4Ipu74EK1M6nHeRYM2UGkIZS6UTU6gHsxM8s5f4KKP57twYv4IBod
         QYqiGNCIZRG2Fnj4bkZY4q9tOaAnBqQ5TPQWUdk9BABO+yFydINOJdHb5LFCj7PTApCZ
         ERReCbgX3sMEJ+PqnbVXqiX3YxOh+U/RbIAN6RA/rLXNo3GzdpAnKCDp4ScvaSomk20F
         pX3NAWyUJdpySYXZXr3TbKDMWzt1chxYW6mBg549n8MO9Bg3Tw+1xIej4pBPMIV/x+OC
         hqOf/2gbQLFg2kcZqSnXXafxeJPuUujOnVni5TzTbsupm2Mz3usac/KR3BD3kn2IzXC/
         PqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570716; x=1792175516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t3TR1mx/d+lJPdCos6SlZvIHemcM3rDJJZi+7utetLY=;
        b=eFfVorkQ/oC9m5Krjv2Sp4D1Fw5HlGc6Q+YINL70ThLknR7mMTOvBj3syd4UqU+ZBi
         8pqOjvlyeNugCFqsqm7B+0Q7jyaOOLM99vsj/qK7hF1P33QNCJC3OGai0Oi+P4ENwy/v
         AtfE06kAFyNENryvCJ7SCOlPijgztWNzASLuyDWGMCcL4i8ib3sbxLykACTJKD//lG3q
         nufHykAm8beqZtU4DxqH4mOyBPgFzAsBFSAHZKZoRnu8xY8sfJ9YyHuyEvRwiIhEzVZ/
         OeQLZ0h/bEdl4JlRDUWOT3RtcEifgDF8bnlSFx0x18+m9x0n1V7pGWXuGPiiV0BTPjww
         m8Xg==
X-Forwarded-Encrypted: i=1; AKwUvByP5yExmcVSiUXhGJoppxXnkTQY4tjexpg3aJrXRlH/iQRK916LoWbOESdHEBn6zQOANyi20Og5M9Tkyb0s2w==@lists.infradead.org
X-Gm-Message-State: AFq9FYIoeGcPLPw+vLMk2pBKuaiRDohizDqv1EMNXq6G4NL98MQ1Z8rf
	/PTWF3GdGmQZqFkAit8lnAv2OTi86QvF45bswbskYamZS2vekSK75fRK
X-Gm-Gg: AYBFou0SCAa50xs9cOj+CCspqOz4FLA6z3nuSdoh0XvgiFwLr7oiENQ2fGSMkjefWgf
	Pu9UG7OzfE7u53JqHcL7Tf9FBLlR4wsRAjfUDnk4VSssy3Wui8Pspclpuz0Ogjuztzkx30ou+t+
	1EeDh3b3dm6NUhHl/b8YQqYXMmQaX2hoc1SCOIHhPHd+1TTOzui6vOsJnnrWbKjCHzilACUUpvM
	lkuwoOu1XAUj4M9fQWRc7OATuc3nyn+FFPBlPvzlro8S8kfsR4pDCCR++Ilekijo0zUT4sgyNKm
	qydnZTn0XKEE0GNQ9hFPAMRPpiBWJ1rhuuGum/b6IFacY4RYUJCcO9FNcSPRRf18N6tWEvd6URG
	BEyiVrmgOzxXJCEt95J5/XVYWJnC2H1rPug62y0UavOQyhc3kQgWR5Oh9dFv3Wdfw47+bU8PmDA
	Zv0VSVZu8auqtsIqMowVo7Q8NBhUKOGLBJMgtaWrDKiogI9HlTCJ34rY++o+xQ3t4FxJyaK7hUQ
	fLSrV/iYSuPi6jISirzWeujKvQqfo6xLI6yJDK+e2q0QYORkTSETXOwAHRs3yLJrg7+z7ICkv8=
X-Received: by 2002:a05:620a:2719:b0:93e:c12c:9b6a with SMTP id af79cd13be357-93ec12c9ec2mr324347685a.69.1791570716065;
        Fri, 09 Oct 2026 11:31:56 -0700 (PDT)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9898b5fsm245594685a.32.2026.10.09.11.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:31:55 -0700 (PDT)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 09 Oct 2026 13:31:47 -0500
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8173: Mark the lowest CPU OPPs
 for suspend
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v1-2-9100f79b4080@gmail.com>
References: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v1-0-9100f79b4080@gmail.com>
In-Reply-To: <20261009-rbrue-suez-upstreaming-mtk-cpufreq-suspend-opp-v1-0-9100f79b4080@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Roman Vivchar <rva333@protonmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791570710; l=1226;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=LyDjS/8+V+if69g/8tSmRRGt/NJFu3rP46F002zZ4Cs=;
 b=J47TQSnGOTnk7vsmC3v8Kas19C3nd1y/Zu6+lW8xPqNDlmOqarof7ubUNN1IzHNMZfvh7R48y
 usvOVSj7ssJB5+xrCWh60GlbUy9459bvWBzwCVFOTeRmefrkRGhAbr5
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_113157_089833_D0FEF956 
X-CRM114-Status: UNSURE (   9.06  )
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

Both clusters otherwise enter system sleep at whatever OPP the governor
last chose. On the Amazon Fire HD 10 (2017), entering suspend-to-RAM with
both clusters at their highest OPP measured 63.5 mA, against 52.0 mA
when they suspend at 507 MHz. Mark the 507 MHz OPP of each cluster, the
lowest in both tables, as the one to suspend at. mediatek-cpufreq uses
it for system sleep, and a kernel without that support ignores it.

Assisted-by: LLM
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 78c2ccd5be13..7f1af15cb934 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -56,6 +56,7 @@ cluster0_opp: opp-table-0 {
 		opp-507000000 {
 			opp-hz = /bits/ 64 <507000000>;
 			opp-microvolt = <859000>;
+			opp-suspend;
 		};
 		opp-702000000 {
 			opp-hz = /bits/ 64 <702000000>;
@@ -93,6 +94,7 @@ cluster1_opp: opp-table-1 {
 		opp-507000000 {
 			opp-hz = /bits/ 64 <507000000>;
 			opp-microvolt = <828000>;
+			opp-suspend;
 		};
 		opp-702000000 {
 			opp-hz = /bits/ 64 <702000000>;

-- 
2.55.0


