Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC590C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 09:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9S5hOpcICkE2RwRknZGLgcEhsnw/9ngNlnMj1MfaJ8I=; b=rWch1JQD5LmkFt
	30+pO4m2LlMc6kOCLbkFPEyN20HO2pvUmKhomv3h6otdGR4xtuxfM6+w9u2ShhM8xZPZnLE8grNUH
	OWehGPIcoSfM5C6YbnPbJJetBU8oEwYEX7uq+Bh9gAgPCKq9rSM6gkrWMvOpqx/8aYdQ3KIDGZBmh
	BX99LkSDJqfBi48h/Q6BLVV8aI0ZbSTenRQCDqCSFzJN9jrmY+vuTDOeYPTyV6Z1KBlBSQwDr1DGt
	jGTXEZeDzlNsaPT/qGNkTTw+mHo+4VoRJlFrj5nKBfdXaPmWDIg239hSoDC0EDMVGuHoih0s0EdFA
	8SxcVcDIuyR/YIx6dK/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrFiF-000kiS-2l; Wed, 18 May 2022 09:11:23 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrFhh-000kM6-CC; Wed, 18 May 2022 09:10:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 7582D1F44320
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652865043;
 bh=LKd4nhweRL3PcJXv3k2/EPSlF7AzYrSo5zfC/TMbjbo=;
 h=From:To:Cc:Subject:Date:From;
 b=g59waOirYWM562xaFzCb669fxfE5fA50a4H99jC2/aoPZwvbIMIJ3SzmCAbpwjAGo
 tZSuqYUG6sMDZSdWVff79EmGogsGDkRUd4h5OsMew9u4nvLNEmBE2JxpDkxU7ZNIZI
 s+zmHaMBJgan6S4SObYPX9w85MLyMYP82BCMS4dkaTVBUZALGcYgpp19/y7jJzFVs0
 dyWQUhtXRusELOI55sXqq+JU6DRkep/JVU9ZfD5tNeWdoaurMOuEQwTGO8W1GpK208
 bAfNS/wlMtEIa+byZrJxtQjWFuw2Iamt13nk8g9atS+AGYg4Z6t/EIpCqiX2LSp+li
 zgjskR8Y7jgsg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: yong.wu@mediatek.com
Cc: krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 0/2] MediaTek Helio X10 MT6795 - SMI Support
Date: Wed, 18 May 2022 11:10:36 +0200
Message-Id: <20220518091038.22380-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_021049_613310_33555C92 
X-CRM114-Status: UNSURE (   7.95  )
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

In an effort to give some love to the apparently forgotten MT6795 SoC,
I am upstreaming more components that are necessary to support platforms
powered by this one apart from a simple boot to serial console.

This series introduces support for the SMI common and LARBs, found in
this SoC.

Tested on a MT6795 Sony Xperia M5 (codename "Holly") smartphone.

Changes in v3:
 - Applied Yong Wu's review comments (thanks!) on patch [2/2]

Changes in v2:
 - Added forgotten new definitions

AngeloGioacchino Del Regno (2):
  dt-bindings: memory: mtk-smi: Add MT6795 Helio X10 bindings
  memory: mtk-smi: Add support for MT6795 Helio X10

 .../memory-controllers/mediatek,smi-common.yaml |  1 +
 .../memory-controllers/mediatek,smi-larb.yaml   |  1 +
 drivers/memory/mtk-smi.c                        | 17 +++++++++++++++++
 3 files changed, 19 insertions(+)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
