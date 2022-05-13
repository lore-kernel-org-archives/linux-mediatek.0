Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F6DC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 03:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GMlQHzGPKCIdZ1ULR3xH5vQ3+FaAbSmkq2bBOapU5Qw=; b=01moOz6dOcXjPm
	O0wy9BF8e0+Q8+OjS56VA/Dm4HW1eVLSR0kCnlfXgU0IgmLRbpDtjrnJGwFqF1Yb8MDfvBqCTp/zQ
	QxrrUIbGuOmWXERsTD25DnrPkJFEguaxLxljNZyt2dZtN4Ak/r19bTL3nVJYAZVta5ExRPjaP3L0x
	KpapKG5WUfhiO1p6DUaEpYVwjsqDq05owc32Gx5tCUKBlNlkA9OfuBpFjHAY3OUt8/4NSbFV4yikV
	2OiF0t/naYhP7zcN3W5Q5Z7bhFIOC8VgFKBqERAYCkOjqqluoI0dP0IbCU1FxjE0yRJXkN42JVqnX
	8/hKo7h5Q3Mciw/sPliw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npMNr-00EQ1u-IV; Fri, 13 May 2022 03:54:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npMNW-00EPya-V1; Fri, 13 May 2022 03:54:12 +0000
X-UUID: f60fd9988f2a44afac0573b17dd0e221-20220512
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:9eac94d0-d5c0-437e-96b3-ee7e1e17c8f1, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:a6e10ff2-ab23-4aed-a67b-f96514452486,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: f60fd9988f2a44afac0573b17dd0e221-20220512
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1827883741; Thu, 12 May 2022 20:54:02 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 May 2022 20:44:02 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 13 May 2022 11:44:01 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 May 2022 11:43:59 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <lee.jones@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
 <lgirdwood@gmail.com>, <broonie@kernel.org>, <eddie.huang@mediatek.com>,
 <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>, <fshao@chromium.org>
CC: <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>,
 <tinghan.shen@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hsin-hsiung.wang@mediatek.com>, <sean.wang@mediatek.com>,
 <macpaul.lin@mediatek.com>, <wen.su@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v4] pwrap: mediatek: fix FSM timeout issue
Date: Fri, 13 May 2022 11:43:56 +0800
Message-ID: <20220513034356.5268-2-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220513034356.5268-1-zhiyong.tao@mediatek.com>
References: <20220513034356.5268-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_205411_032133_8315F028 
X-CRM114-Status: GOOD (  13.32  )
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

From: "Zhiyong.Tao" <zhiyong.tao@mediatek.com>

Fix pwrap FSM timeout issue which leads the system crash on GFX VSRAM
power on.
The crash log:
[ 3986.543401] mediatek-drm-dp 1c500000.edp_tx: drm_helper_hpd_irq_event
[ 3986.670756] vsram_others: is_enabled() failed: -ETIMEDOUT
[ 3986.670765] mali 13000000.mali: Power on reg 1 failed error = -110
[ 3986.670768] ------------[ cut here ]------------
[ 3986.670770] unbalanced disables for vsram_others
[ 3986.670783] WARNING: CPU: 7 PID: 4125 at drivers/regulator/core.c:2761 _regulator_disable+0x194/0x1a0
[ 3986.670785] Modules linked in: rfcomm algif_hash algif_skcipher af_alg veth uinput btusb btmtk btintel btbcm btrtl xt_cgroup bluetooth uvcvideo videobuf2_vmalloc ecdh_generic ecc mtk_vcodec_dec mtk_vcodec_enc mtk_mdp3 v4l2_h264 mtk_vcodec_common videobuf2_dma_contig mtk_vpu videobuf2_memops v4l2_mem2mem xt_MASQUERADE videobuf2_v4l2 videobuf2_common cros_ec_rpmsg mtk_scp mtk_rpmsg rpmsg_core mtk_scp_ipi ip6table_nat fuse 8021q iio_trig_sysfs cros_ec_sensors cros_ec_lid_angle cros_ec_sensors_core industrialio_triggered_buffer kfifo_buf cros_ec_sensorhub mt7921e mt7921_common mt76_connac_lib lzo_rle mt76 lzo_compress mac80211 cfg80211 zram r8152 mii joydev
[ 3986.670830] CPU: 7 PID: 4125 Comm: mali-cmar-backe Not tainted 5.10.78-CL2781499-v287 #1 b899b40a63da40d4767c6c0e96b6700d2f3eb242
[ 3986.670832] Hardware name: MediaTek Tomato board (DT)
[ 3986.670835] pstate: 60400009 (nZCv daif +PAN -UAO -TCO BTYPE=--)
[ 3986.670838] pc : _regulator_disable+0x194/0x1a0
[ 3986.670840] lr : _regulator_disable+0x194/0x1a0
[ 3986.670842] sp : ffffffc016203a10
[ 3986.670843] x29: ffffffc016203a10 x28: ffffffb7c3186b28
[ 3986.670846] x27: 0000000000000002 x26: fffffffffffffdc8
[ 3986.670848] x25: ffffffc017225000 x24: ffffffb7c0e94880
[ 3986.670851] x23: ffffffb7c31840f0 x22: ffffffd6b4f3e275
[ 3986.670853] x21: ffffffb7c3181a00 x20: ffffffb7c27e7800
[ 3986.670855] x19: ffffffb7c27e7800 x18: 00000000ffff0a10
[ 3986.670857] x17: 0000000000000020 x16: 00000000000000ec
[ 3986.670860] x15: ffffffd6b44fa17c x14: 0000000000000003
[ 3986.670862] x13: 0000000000000004 x12: 0000000000fd8318
[ 3986.670864] x11: c000000100029ccd x10: 00000000ffffffff
[ 3986.670866] x9 : 7dd6d080afd6f400 x8 : 7dd6d080afd6f400
[ 3986.670868] x7 : 0000000000000000 x6 : ffffffd6b5459f0c
[ 3986.670871] x5 : ffffffc016203a58 x4 : 0000000000000000
[ 3986.670873] x3 : ffffffc016203668 x2 : ffffffc016203670
[ 3986.670875] x1 : 0000000100029ccd x0 : 0000000000000024
[ 3986.670878] Call trace:
[ 3986.670880]  _regulator_disable+0x194/0x1a0
[ 3986.670883]  regulator_disable+0x4c/0x8c

Add a usleep delay to avoid busy read for the H/W status.
If (time_after()) be turn first, it maybe cause the system behavior
crash problem like above. so we change it after sleep delay.

Fixes: 1f022d84bd19 ("soc: mediatek: Add PMIC wrapper for MT8135 and
MT8173 SoCs")

Signed-off-by: Zhiyong.Tao <zhiyong.tao@mediatek.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 952bc554f443..f9e7c2f35157 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -4,6 +4,7 @@
  * Author: Flora Fu, MediaTek
  */
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
@@ -1197,10 +1198,13 @@ static int pwrap_wait_for_state(struct pmic_wrapper *wrp,
 	timeout = jiffies + usecs_to_jiffies(10000);
 
 	do {
-		if (time_after(jiffies, timeout))
-			return fp(wrp) ? 0 : -ETIMEDOUT;
 		if (fp(wrp))
 			return 0;
+
+		usleep_range(10, 11);
+
+		if (time_after(jiffies, timeout))
+			return fp(wrp) ? 0 : -ETIMEDOUT;
 	} while (1);
 }
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
