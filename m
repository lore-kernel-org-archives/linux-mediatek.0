Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D157C98318
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Sep 2026 11:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VnxpUndPTtMcwTGMAPeAya3Up+u2XyfdmZAXFYObokc=; b=YmKtEgSB5UiGRDiV6BXTv5Zs0X
	VWPbJ1tOgRWkm5HJPLsGjfX1AOjCPZMzh4HOWHDB2fCqotsHsSie+kbCRamfTmteaWndVesGNikt1
	d5jgWpbe2kMuyL4yKoAYlEN4f9RI7NpMRiyoDA99izYqMaxL8999SfLsoE7kIlh138f3tjEJDdTGw
	vPuPhC8dpeU0Ue4tRDUPtSa+qhyCa2cM1d0HvYKRdlHkzhm9jfnz6ajnhY3yAOmCUv9/7yGGKtLQC
	wyEKib+idKrDZIhgIf060UozqASZp9Hf51/99caJLutYkArN3yAkwq63MlyGBjE9fqq/uRyDN2tfp
	o/fPk8ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAQTe-0000000FJok-269t;
	Sat, 26 Sep 2026 11:21:58 +0000
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAQTb-0000000FJoG-2s8q
	for linux-mediatek@lists.infradead.org;
	Sat, 26 Sep 2026 11:21:56 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-91058dd77a2so17768956d6.3
        for <linux-mediatek@lists.infradead.org>; Sat, 26 Sep 2026 04:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790421715; x=1791026515; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VnxpUndPTtMcwTGMAPeAya3Up+u2XyfdmZAXFYObokc=;
        b=gZWWLJ2wOTAdUIrYFJ8BmYNMzxR0nWjYBBqDFYY0zM9bmGGKwPCeTbDLM2PHSsOEFN
         a3PXgeMduk2/xb/UCJtJcn7s86INdFPuEhKRewDi2j7eOnZytMVkDKMfpVfQ/COlWtuE
         fqNdItouEKHMjOFahN/7VWm/UpabC1Fv2C5FcAlRyW5SG0WaVzjApFRq1ExUAWrhqJqK
         c/VGLC0dz+lDAls4zVdzIxsYH4G71CmS0Zb4XE55RX+fJCWLzORyn4UCZUIOVoliXTsG
         Xw9b2l6c2tkm8euiB8dJqiIdyHEg5xiDquEaSOEVPnCDga91sg0qzcgDTj5rufhNS/4a
         sarw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790421715; x=1791026515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VnxpUndPTtMcwTGMAPeAya3Up+u2XyfdmZAXFYObokc=;
        b=M096OvzYaG/lWsNozgzPCGLznN9DHsJBe7QClsaHI6nzDeqkMCNNp4YgInsvHmuUyd
         Z/APEuJPwxw2vHhirljhAsCkzj4bE+Ffv5zsupyu6A3l+csGOcIhPHCmg+gaKVA+SI2J
         scz1MsMCLPAluoUjUl8wLz0YYKlfBPHuQK/Sv5f0J6b7eFqJRA97sOnst/tY/Lyw9EF8
         nMrSPrU5Av9Xy8S10NqQZdXbXOvK2yTivxddJ48ijLqUxNhmy1LBP2cgXqHaAnabaoc3
         DhD6C2pwjVY0eyK2fs64CcR5xcJwr8FoBysx51tfPZBw/RTUzNjeRA9frytepGdcdfk0
         Q6Dw==
X-Forwarded-Encrypted: i=1; AKwUvBxTP2HCqSKMYYoIhPf0EXTTDwRoJiFzIh5+zsJGCtjg8g64jb5kBbTSYBYRQeU2hLaShDfJhP2DMa8nf/MW9g==@lists.infradead.org
X-Gm-Message-State: AFuF++lh7u9GOjckbLjpIDSqE/l6Zzh7aeuJS/0by1jUG4vGwYHuXO+X
	Hp6otxcf5COwMzWR9sfHEySP0CFzD1M44hdlQe98jwWmRKUMLQjFypRTYHuhficZ
X-Gm-Gg: AYBFou1u5sCBXbhkWe+ZWLLZxiGC0ndLh9loVMsOrfCIZ2e12q2LEK05YINnaTturaV
	BzvnQKn1b6pPfbDYIiXwJO7WkupwNr69v5xBVvN08gCFeTZ1jbH5SymLAWWf9HvGN1kce4dkY1/
	bnn0u9HhvyjBcoO3Fom/wQInKkVDu4NYBdcwsTXzU9lUamWCdHNJfqZG5DEA9Kg3t/G13YeBMnk
	k+Ud26SmZGECWqmoR7jNuDLWgq8WbjYOcPconLFC6jo3BXa6VlhJ6HmSs/kP6QAf246LolDSlbD
	QmeYYKHRWFTOr27EDOO2YYiFHsLnFTuluViVMjoJVUoUk73aOqRO0Ris2J+34bF919xop5fGqDV
	a+7XgmcSiOoGOnYqehl5wbXMVpsruW6QVDBuRCXtApKFuE4AiEYX6J2syuB3Va4ST1lKDGHnVPo
	1rMxpSeUz/I7oF9PPKedvwC7MUBugFDCczDqBrQsTNoR8kKYjbbsaykFd3FRq2phGk2zIHPuHNf
	t1Ea8g2/4XNlOG8d7lHwdJq8lPaR8Q=
X-Received: by 2002:a17:903:244b:b0:2dd:c100:7cc1 with SMTP id d9443c01a7336-2df7dd6d2c9mr65998225ad.61.1790421269577;
        Sat, 26 Sep 2026 04:14:29 -0700 (PDT)
Received: from localhost.localdomain ([104.28.254.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dfa60bfb1csm7247365ad.48.2026.09.26.04.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:14:29 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sat, 26 Sep 2026 19:14:01 +0800
Subject: [PATCH 3/3] ARM: dts: mediatek: expose the MT7629 TOPRGU reset
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-b4-mt7629-toprgu-v1-3-c124bf9ac273@gmail.com>
References: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
In-Reply-To: <20260926-b4-mt7629-toprgu-v1-0-c124bf9ac273@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_042155_724969_DF0DCBD6 
X-CRM114-Status: UNSURE (   8.61  )
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

The watchdog block also provides subsystem resets through TOPRGU.
Add #reset-cells so that devices can reference these reset lines.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 arch/arm/boot/dts/mediatek/mt7629.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/mediatek/mt7629.dtsi b/arch/arm/boot/dts/mediatek/mt7629.dtsi
index acab0883a3bb..465900ce38c0 100644
--- a/arch/arm/boot/dts/mediatek/mt7629.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7629.dtsi
@@ -144,6 +144,7 @@ watchdog: watchdog@10212000 {
 			compatible = "mediatek,mt7629-wdt",
 				     "mediatek,mt6589-wdt";
 			reg = <0x10212000 0x100>;
+			#reset-cells = <1>;
 		};
 
 		pio: pinctrl@10217000 {

-- 
2.55.0


