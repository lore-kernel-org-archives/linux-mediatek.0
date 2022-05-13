Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B0CC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 15:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=or5EQlPB3SPrnIvpENBPrLWJaZGb0TQd78i1p2Bq+58=; b=ImKbU97m1JPnVN
	Fyo43gcAH7EGlTyQmC4yosveivvaC4E+RPgVsRQWkSuGv7IfGORjS/Ytn8CM1iPP4VLx7CdpoP6/T
	Q4SCXoCbYkRxBywYc9P5p7l7uJ2mEG9qlNMuAjkpWtCM6Z4q33mDY86T/eTq5+HnKGSQx4SGdWCHS
	KvBU+UpmzSnRXkJjIqtwMURK3wQOgcFNKnou25+qf6bF4+8K/fLfmgXaDrp7U+95NuL35Ch3Gm1Do
	VpoyjpDupxwuTDYHGR7rDiM1vfdct75dbKG07ss8B+zQqud7xJbMHoap9MqA7q2MhRVl67KektGzb
	CTj9d4m4KgS9UQxtGfNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npWsZ-00GZd4-Sl; Fri, 13 May 2022 15:06:55 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npWsK-00GZWh-Pe; Fri, 13 May 2022 15:06:44 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5B1CF1F461FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652454399;
 bh=YD87vGLOcYs5Cnj6glBqy1KYk+EcyTbz4Vdd5DCZtF0=;
 h=From:To:Cc:Subject:Date:From;
 b=ABXvbdc1EPfvdc3uC2FTKBH5UgOctQqdvJD28zkm8dXyJg2hYVCj89bv5pW8d1ev7
 F4hEAZQ856ZOeDvEoqkq5MIA47GQ5UwnXn6KISmHiiDczgo9BbeYhfMrqWlx3ohCv9
 OL0IkCIe4XgjI0zBIXOAtOgUEwh8PdlArdEP1VtKlHhFY4yIr+LrBhaWnTGh+C/q9q
 OMscRXH3EYYsgqe+xymBJIijnCqBcSYoflW6JVDvk/Jplepj8otSLGk0VXXA38fueG
 b8+7TA6h8b+8GVFeHrxdxRA0lMRaOBzRtoSGInTXrDFyrSpUt0r/XpfFnVpRMuajOA
 GiUB+Cg7kYgag==
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
Subject: [PATCH v2 0/2] MediaTek Helio X10 MT6795 - SMI Support
Date: Fri, 13 May 2022 17:06:31 +0200
Message-Id: <20220513150633.387200-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_080641_007819_D660D59E 
X-CRM114-Status: UNSURE (   7.44  )
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
