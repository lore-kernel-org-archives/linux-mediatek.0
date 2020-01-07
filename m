Return-Path: <SRS0=GJVM=24=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEA8CC33C99
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2020 07:12:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74FEB2077B
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2020 07:12:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qX+fo22V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="d7EBZAps"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74FEB2077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5yitQsqIAZ6npoyReg/bjxgDMNejqjh4XhKIEIdqi2A=; b=qX+fo22VB+SQBb
	6q/9MCT8IKEqA6koxenbNP8UeLj+ObXa0kvIZqKRnSvP3Wtav168sVKSYSiWRAt7aX0Ntr+hMV31l
	AnYPvIqNtJYCwYBPpNC9eH2onA2q/TXHnHIXh6SYyQwrFtJPBDEK5tWEoVv6CrDa0X/UoqWgfpd3i
	El2kVvE9MREoMLNhuncRXXw26zQTpvJSWYpV1RyO3+JlIPNCc/VwCbAMStdm5r14m5mbDEpGg/zy0
	Ar9Q/eLNs36iA/+mepCvFQ6/mWdV51Wse2ZrSIdbx//A0/DXlBEtmWLJ6kxo1KYVuZiwpDUqZlo0W
	eGnKermVpRS3rCq4nd9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioj2P-0006Iz-2f; Tue, 07 Jan 2020 07:12:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioj2L-0006H8-P3; Tue, 07 Jan 2020 07:12:23 +0000
X-UUID: 38b011388ca749b3a61458b986c21b4d-20200106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=RvU/Kf9/Q/5yNWiwRa+kdVfxoeAOhMP7au0EssfZUn8=; 
 b=d7EBZApsUd8bRPNaXuK/3QblvdUscYwQyufhd5DJjfDlqH15N+p0RJlL3rDpR5HBNBO6bRmAS85YxJaW9BjHA19M6UcHXJtZJ4MhRgPRJcrHWY9m56NR0hkeKGkH19LhbN+r9vasBbm6zPUNEwY0prWboGENvXaq3Kbj0aZjqfc=;
X-UUID: 38b011388ca749b3a61458b986c21b4d-20200106
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1614153436; Mon, 06 Jan 2020 23:12:17 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 6 Jan 2020 23:02:47 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 7 Jan 2020 15:01:41 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 7 Jan 2020 15:01:09 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Kevin Hilman <khilman@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Nicolas Boichat <drinkcat@google.com>, Stephen Boyd <sboyd@kernel.org>
Subject: PM / AVS: SVS: Introduce SVS engine
Date: Tue, 7 Jan 2020 15:01:51 +0800
Message-ID: <20200107070154.1574-1-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200106_231221_826002_881CF4EC 
X-CRM114-Status: UNSURE (   9.13  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 Angus Lin <Angus.Lin@mediatek.com>, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Roger Lu <roger.lu@mediatek.com>,
 linux-kernel@vger.kernel.org, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 YT Lee <yt.lee@mediatek.com>, Fan Chen <fan.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, HenryC Chen <HenryC.Chen@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

1. SVS driver use OPP adjust event in [1] to update OPP table voltage part.
2. SVS dts node refers to CPU opp table [2] and GPU opp table [3].
3. SVS and thermal dts use the same thermal efuse [4].
4. SVS dts needs PMIC regulator [5].
 
[1] https://patchwork.kernel.org/patch/11193513/
[2] https://patchwork.kernel.org/patch/11304935/
[3] https://patchwork.kernel.org/patch/11132381/
[4] https://patchwork.kernel.org/patch/11316495/
[5] https://patchwork.kernel.org/patch/11284617/

changes since v5:
- Add CONFIG_NVMEM dependency in SVS Kconfig.
- Apply the latest dev_pm_opp_adjust_voltage() from [1] in SVS driver.
- Add dev_pm_opp_put(opp) after calling dev_pm_opp_get_voltage(opp).
- Fix multi-line comment style.
- Add #define w/bit for magic constants.
- Replace "int svs_is_supported()" with "bool svs_is_supported()".
- Use default/max size for allocating memories to
opp_volts/init02_volts/volts/opp_freqs/freqs_pct in struct svs_bank.
- Name "main" instead of "main_clk" in SVS nodes for getting SVS clk.
- In SVS binding document, remove fourth parameter of GIC interrupts.
- Use '-' in node names.

Roger Lu (3):
  dt-bindings: soc: add mtk svs dt-bindings
  arm64: dts: mt8183: add svs device information
  PM / AVS: SVS: Introduce SVS engine

 .../devicetree/bindings/power/mtk-svs.txt     |   76 +
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   16 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |   41 +
 drivers/power/avs/Kconfig                     |   10 +
 drivers/power/avs/Makefile                    |    1 +
 drivers/power/avs/mtk_svs.c                   | 2075 +++++++++++++++++
 include/linux/power/mtk_svs.h                 |   23 +
 7 files changed, 2242 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/mtk-svs.txt
 create mode 100644 drivers/power/avs/mtk_svs.c
 create mode 100644 include/linux/power/mtk_svs.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
