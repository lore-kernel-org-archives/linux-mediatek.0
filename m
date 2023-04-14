Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EFCC77B71
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 16:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AcrAdIw/i6wIDG+6jUQ7koxeYwprIkhWuT5Y0B8uUwI=; b=34sOBteUasAZlE
	eRsft4YhAlKPSQvxqcHbYuU1N7XgnaPqvRBS2RP6EAT9fnOv9mJMmq/JIqUf3z7FHXFkajCOGNiAz
	0nhA+hnKtkcALpe9e454kMTpQX25qDE811h8u55TovtG8JlcbpC+ByCx7k55Z+rXf13AlO/vZHicI
	DkKHKVMcdNtBXQQ/wq7tR8nYwnI2vR1YdRa+d5xovyWX3yzTPGBFm5w8UUAfta3k5SsazsKBrs0pY
	jXk+qRISJ328S4hPnUS8MGRhqkSofjZVyPoZHrOL/rrxkl6cU5d/Wagd4E1UZzgy/SngNo3dCHF94
	j0TZtLZpwpWTLQRbdWig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnM2y-00A4VX-37;
	Fri, 14 Apr 2023 16:13:12 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnM2p-00A4PR-35
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Apr 2023 16:13:06 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-504eb1155d3so12528200a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Apr 2023 09:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681488780; x=1684080780;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AcrAdIw/i6wIDG+6jUQ7koxeYwprIkhWuT5Y0B8uUwI=;
        b=ZFKVk02nkwQNmmAWsmzpGY8TY+1AhNP8xYmZV/zZ9EznqK0yZzEC+2S4dZ5R5A8hPE
         iKeZA8/Qrsj9G2/YZQXdptJTCtZ2Iv6To98gRUSOC1XXU8/JiKp/wDI7D+hyz6tfyLqg
         ZmIkzWrMlW2HlU0sGq7qqzCp26eJsBTZyo8cgkcSm3WFMzHLK8vGtzYRVa08CpYbAqGh
         3HbTxw7QcibwIV7JmOnj7px4GJmXAZI+XUk9oz+U2dqmOZJwI8396A/I9NNy8hcXyztP
         bG7uqrID9wJQ/VC3DyuSQCRO/7bpiEsmtZQnuMmc3eU7gLZIasQ2OK+o55DtspdhPqcm
         Q1PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681488780; x=1684080780;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AcrAdIw/i6wIDG+6jUQ7koxeYwprIkhWuT5Y0B8uUwI=;
        b=F3Qbc1pUg0cU56prn70/QLXy5kQLliy0UfrmzmyrWcvTfO7XehK/1pXdKg1dKanRPH
         et+Ca1iM2vHu1dSYQwTyVlp+jdV12qO8zvMw3zZghiWPtagjGF7w+HyVaKA3da9M1Yq5
         X/kNI6kjsKBHaBFIxWNbKNJjTzp19MekvNqn73SqF8f2U9G7P+k8ekglTgtXk3UDOOMR
         7KhE5vvxJ1AWrEiamtHsd0tqk4R8KWr25hrrEOuv+9AfzDkSDlW349zWdR4oXnnBPC0J
         P0Xe67Rk/KdkYgaZscWpMHana2DcJ1ldpAu4S1eoTYXrvfhd4ivhb2AwrBzkIbzwNEdk
         T/ew==
X-Gm-Message-State: AAQBX9es4uAAUeUb2ocVUpVtIXF5Y2Yetm/O1x7INNPHYq2uASG/H/QS
	uxeQJC5ngMifOSCCq08yO/qiHg==
X-Google-Smtp-Source: AKy350bTTtV3eiXQaZt+7LNqJuzWYVK/Xb40ZkXwpYfIWzEF9hAsIrNLItup7M8+Miq7hsucxZgeeg==
X-Received: by 2002:a05:6402:3554:b0:506:74f5:876f with SMTP id f20-20020a056402355400b0050674f5876fmr5591216edd.6.1681488780212;
        Fri, 14 Apr 2023 09:13:00 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-d20f-2c76-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:d20f:2c76:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id h23-20020aa7c957000000b005066ca60b2csm2242687edt.63.2023.04.14.09.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 09:12:59 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Subject: [PATCH v2 0/2] Fix mtk-hdmi-mt8195 unitialized variable usage and
 clock rate calculation
Date: Fri, 14 Apr 2023 18:07:45 +0200
Message-Id: <20230413-fixes-for-mt8195-hdmi-phy-v2-0-bbad62e64321@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFF6OWQC/42OSw6DIBCGr9Kw7jSAkmBXXXTRLnqCxhiQsZBUM
 GCMxnj3oifo8vtfMytJGB0mcj2tJOLkkgs+Az+fSGuV/yA4k5lwygtasgI6N2OCLkToR8kqAdb
 0Dga7QIVMsEILrZQhua9VQtBR+dbuCznSeJzH5nF/PXd/iHiMZfNdZ7YujSEuxysT29V/rk4MK
 GhZSl4KaTpqblotX6cjXtrQk3rbth+qabgq5QAAAA==
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guillaume Ranquet <granquet@baylibre.com>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_091303_996912_33983D14 
X-CRM114-Status: UNSURE (   7.66  )
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

I've received a report from kernel test report [1] that a variable was used
unitialized in the mtk8195 hdmi phy code.

I've upon fixing that issue found out that the clock rate calculation
was erroneous since the calculus was moved to div_u64.

I'm providing those two fixes on top of 45810d486bb44 from the linux-phy
repository [2].

[1] https://lore.kernel.org/oe-kbuild-all/202304130304.gMtrUdbd-lkp@intel.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
Changes in v2:
- Propagate return value of mtk_hdmi_pll_set_hw() as suggested by Angelo

---
Guillaume Ranquet (2):
      phy: mediatek: hdmi: mt8195: fix uninitialized variable usage in pll_calc
      phy: mediatek: hdmi: mt8195: fix wrong pll calculus

 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)
---
base-commit: 45810d486bb44bd60213d5f09a713df81b987972
change-id: 20230413-fixes-for-mt8195-hdmi-phy-9e1513b5baad

Best regards,
-- 
Guillaume Ranquet <granquet@baylibre.com>


