Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD06DC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 May 2022 15:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vDm8tZf4fe8JN3Ams4tuToCYHI927X5uhWgIYkX+syY=; b=GoFplWm9u07uxB
	fTxxaJTUucOpmVNiVIiMSAwPJzVFzFnYjCqwMU2jtPomFG8L6XokYZFAqATATqhPxdrv5PfiJ7Bhr
	AGDxVCRT5woTW7RSY/TN8zb+Rzm1+YXdwgbLXHTGAqh99CSAGdEFMFWWzNUEoMpNSQLeopim2jB9B
	tZRb2xgX25jDfzO0Wj1nJTAayFi1DRkDC9STttNxglG2LT2qAT2sbbbWZUaA5DIREc9xlMIpDsHm6
	4KP0OqB/RGTzTAuolK9gkA58WSk9ep/LIsY41RcX8RGiiLfL0SMX/cUoM2iV3YpHQJCr6H1G3TjUn
	pLnvmyRqU/cXmUfzS/cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npWnS-00GYDu-0U; Fri, 13 May 2022 15:01:38 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npWnG-00GY9A-6J; Fri, 13 May 2022 15:01:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3400A1F461F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652454084;
 bh=JTJRUzzWzXgmpr6v9i78ORT3MYTWIiG5v8DAgb0K43g=;
 h=From:To:Cc:Subject:Date:From;
 b=i/GrFceJtgbi+skmA7Of3QY2HtgidBg6a777PTG9/ri2/Hc7r/sdhGumYvdNwTQqf
 EVVLmO9kIXDDTcH30GmjFfHNV25G6zieOwD6rbZvmjQM0ZK1cleVNY65JcDgB5Kv3c
 Ye7rbCtXdO+04hoCtpd5xLnmnyNEIbCKmyrWMZsyTP+EWlLFyIld4xolI26v/mQo1P
 UmaE3+o3in617pq299v7LQ/tCUWa9CaHcSrXhizBxbNv3S4mXxdhGst/3ukW51BGcE
 INwffZmtJq63PPvA9Mg7etMAnx182N2vcLkrd2jhuVE2bs7k0uhvVUFueQWQO0awoR
 J//s1CYHwbngw==
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
Subject: [PATCH 0/2] MediaTek Helio X10 MT6795 - SMI Support
Date: Fri, 13 May 2022 17:01:14 +0200
Message-Id: <20220513150116.349744-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_080126_479160_9FFE81A4 
X-CRM114-Status: UNSURE (   6.81  )
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

AngeloGioacchino Del Regno (2):
  dt-bindings: memory: mtk-smi: Add MT6795 Helio X10 bindings
  memory: mtk-smi: Add support for MT6795 Helio X10

 .../memory-controllers/mediatek,smi-common.yaml   |  1 +
 .../memory-controllers/mediatek,smi-larb.yaml     |  1 +
 drivers/memory/mtk-smi.c                          | 15 +++++++++++++++
 3 files changed, 17 insertions(+)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
