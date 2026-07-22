Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D59C4453C
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2026 17:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1w/L0JEj1tAoEtTkbuyiqxCj7tfW27Vj36Bhq5Zj1YU=; b=dJcXvSSmFWHhKXg9rpBAYe176m
	9K02L08KxwZQZRL2Fj128O0jFPU1YhFGIayjtwHxskX0CX7Kk9lnJWDOSIiBdzYkisX2PMX/eLYlA
	CpqyG18+LcZh7s/fTY525J7qjtdlEsblwJJgKWV52Wm+gfovSQ6QQx/vVuDMqux6G/hjbRTn0kNb0
	jyX9akErm1qwOedO7z6ktevVJPbybpcabRfrzBGn5Zf0+HH4SV8ZMLDulfivq4Q0cQMNAvE/YqWU/
	Z+G/ZA0CfytFG0/kYDdt3QDmPxHRLCCXv1VNhzmEZr0+l+xq9QZ8fnICp0BU6RFxr19dpEgjNFImb
	qsx2NOsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmagu-0000000CSSB-49eJ;
	Wed, 22 Jul 2026 17:25:08 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmagq-0000000CSPJ-0TBh
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Jul 2026 17:25:07 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-84e27035206so361909b3a.3
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Jul 2026 10:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784741103; x=1785345903; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1w/L0JEj1tAoEtTkbuyiqxCj7tfW27Vj36Bhq5Zj1YU=;
        b=GpXflw+eRTs1qfIuZewT4F6ExyEn/I80lDzWBRBk9Gj7jPq6OSJnQ4tg7gC71yRri+
         HfceGcbbsMmePQ5OCyDaM7/iu6bYlLewxy3bw/IgOEdpTxQwWOq4TsZ7hFVjkn9wjMMB
         kWAOei9F4nqYdCHylQm//Aa7qgQ0zthPozJ7H/a8on98A29FacU8Dp1eceQoTF3yG5lz
         aWQOodL8nKUeELEBdAHVWxppsYqBuDFGh6gFHd3XPAyCV0uSDYNyhiL3Z6D9bKr0tjfe
         zWwzNHd6mMzKph9PGPysyo0sRrA7mN2m/vCyrd2im80S8ACtCbRPQeLPVdkW81sh03dP
         MXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741103; x=1785345903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1w/L0JEj1tAoEtTkbuyiqxCj7tfW27Vj36Bhq5Zj1YU=;
        b=IpqSHw/X8eijAWIubbNhBrhiNTVoKbEyRUb/q1e+BX3pGatx7tcZapq5z0YvhCSxG2
         Acla+0N/838W88lxHM32Nr04PlBv6mwHmoaRbHRV0e3pXOULxXdU7B5SNUGO/F4nTm2Y
         u6/sGpXDVvceA1MhPVsHM6qAUo7nMDt0HPSn+CPdcLCF9ggSyX/UvZnegQznXJjOjl1w
         I8uiqahZ/Sd7mHkLqakU62KyMN731NuHlJw9qQLMxhpuwAFgd/CpYO80J6fsVInwlqHh
         pwZrMpLOeoyDizRTc1vxNgBEMBAuGvMK6S5SKZNUgRbL86GKR4AN68EUmTsTKQ+pozI8
         QU1Q==
X-Forwarded-Encrypted: i=1; AHgh+Rr3KSSDIZOFhrBHKgwlN6pcPCDnsQpLEtuZgI8MsKwVfHO2f/p0w89zNLMERqJ60+5qqo+2LNDfz2SHR3BqGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyziqu1cPwb+SkaKdmFJlHIaFQDthMc22+POhfq+0e1QMZo6J8n
	nHqyWgusu8zFpRdAHpw3v/7f9sDwpDMyPT74gwZXwGtr5080tvCyspC6
X-Gm-Gg: AR+sD12vKmrZejpxdRWtW6vbT3q8hye6n3mJLoaoSObFstMEzCt9BGHJ6qut7ipAtx2
	gfQAmFus84aEwojjHQ0jf4SN+PhLVUDLBgnQEAd+pwvYucncxo28ka59raiyUU7qko7hgvbS/Ie
	8yd3Q4lKb/rCJMK2CWB+wrZvUZKGL9+vt72bwjHLCeDO5yl5J4yDoZy9HYW8As5dK6X7c5pa0Ty
	s+65xHha3uyZ/Ul5T0XQ/hJ0RK6O8XxvLuG4cUtNZTgPshAlyRwymcjfmqYk/uH/AFRYjUmupHY
	s1vft06SGs9Uyy3b0wz2A737+XNlC1ck8m1rRIgW3qxBbpI+jum05aK9zFHo8whvTKLn2c2eg/A
	IWrWRznUNWepa31c7wAjI8AWBtRjYYM9l5UqhaJ7ZJztnypXn+MB6NPN8MIh1I6qmmNOtk1btFI
	zD61j9qU/swcD1dhelSn254viZSrZeB0JBO5bEMiQs8Tqw
X-Received: by 2002:a05:6a00:2e07:b0:848:2f84:730 with SMTP id d2e1a72fcca58-84c294e6a56mr23499585b3a.67.1784741102709;
        Wed, 22 Jul 2026 10:25:02 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e1757488csm1645603b3a.33.2026.07.22.10.24.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:25:02 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <linux@armlinux.org.uk>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>
Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM SUB-ARCHITECTURES),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b),
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] arm: mediatek: fix secondary CPU boot on Thumb-2 kernels with Clang
Date: Thu, 23 Jul 2026 02:24:43 +0900
Message-ID: <20260722172443.534251-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_102504_193650_E1220DE9 
X-CRM114-Status: GOOD (  14.31  )
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

When building with CONFIG_THUMB2_KERNEL=y and Clang, secondary CPUs
fail to come online with "CPU1: failed to come online". The address
written to the jump register has bit 0 set, causing the secondary CPU
to start in Thumb mode.

secondary_startup_arm is ARM-mode code (.arm) and, on a Thumb-2 kernel,
expects to be entered in ARM mode in order to switch to Thumb via the
standard sequence at that label. Starting in Thumb mode causes the CPU
to execute ARM instructions as Thumb, resulting in an immediate crash.

Clear bit 0 of the entry address so the CPU always starts in ARM mode.

Tested on Lenovo YOGA Tablet 10 (Wi-Fi).

Fixes: 0cda07001a94 ("ARM: mediatek: add smp bringup code")
Assisted-by: DeepSeek:deepseek-v4-pro
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 arch/arm/mach-mediatek/platsmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-mediatek/platsmp.c b/arch/arm/mach-mediatek/platsmp.c
index 6b0943d95555..9a7c65fc3ae1 100644
--- a/arch/arm/mach-mediatek/platsmp.c
+++ b/arch/arm/mach-mediatek/platsmp.c
@@ -124,7 +124,7 @@ static void __init __mtk_smp_prepare_cpus(unsigned int max_cpus, int trustzone)
 	 * write the address of slave startup address into the system-wide
 	 * jump register
 	 */
-	writel_relaxed(__pa_symbol(secondary_startup_arm),
+	writel_relaxed(__pa_symbol(secondary_startup_arm) & ~1,
 			mtk_smp_base + mtk_smp_info->jump_reg);
 }
 
-- 
2.54.0


