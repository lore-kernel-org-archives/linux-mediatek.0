Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE792CEE336
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 17:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JtXZ99XjmGyXRMM84puxICow/S4XX7s6NgxgrAuapPU=; b=39uS4T5MCYI5eo
	RKpztp2licecLWp7YmEPrvjqDGM5KGpkMpMQZ8hywWszFyWXz1fZ4fIpYvr/FJZYMKqiXwFeNuFoC
	0ymVL0QgEKh8im1ByP9bjkgBNNATQYdiGi+maq7RtML3iRO8wl55xrFxsvtlooOsa9mQAjhNB2AOC
	DLy6X24P1xBX7X4JDjwVyd5yqzKN+RRAl9VcFi93ttyWFcmbL4Yfmr5YdLZkK84Afjq9wlnfYfitW
	5Q8iNWnGsIC3rMFYpu8/72Smi+U/Jgzl13wFQGLqh+n3bBlhvXxaj2EnsM2tu5UXG0blEvfe7a3d+
	5Os2Q4yKUPS7+M0fI2Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syahY-0000000ADnr-27T7;
	Wed, 09 Oct 2024 17:42:20 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syZyb-0000000A5DC-1MVl;
	Wed, 09 Oct 2024 16:55:55 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id 7F44B40832;
	Wed,  9 Oct 2024 16:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1728492951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JtXZ99XjmGyXRMM84puxICow/S4XX7s6NgxgrAuapPU=;
	b=xFa4/rj3zQUefRtwUv05Pe4f1KVw7pUYTnimtXosAkTpR7wXqczLKWIhdU5XFjreBtAsrX
	laAzzUzyZUC1QBJxPqBv4gep7maqR70Pgi7f5WLt62n0PQJ5CtR48uqpz7tzMPXiQneNxD
	T1YeeU9Z4Tapvsz/BLI/fj5/v5Be9I4=
Received: from frank-u24.. (fttx-pool-217.61.150.182.bambit.de [217.61.150.182])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 44E4E10030B;
	Wed,  9 Oct 2024 16:55:50 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Chaotian Jing <chaotian.jing@mediatek.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wenbin Mei <wenbin.mei@mediatek.com>
Subject: [PATCH v3 0/2] Add mmc support for mt7988
Date: Wed,  9 Oct 2024 18:55:40 +0200
Message-ID: <20241009165547.5959-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 20f6a083-cb8a-4483-b34b-6595c1925ce0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_095553_571686_C36E8804 
X-CRM114-Status: UNSURE (   7.99  )
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
Cc: devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, daniel@makrotopia.org, linux-mediatek@lists.infradead.org, john@phrozen.org, eladwf@gmail.com, ansuelsmth@gmail.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add MMC-Support for MT798 SoC

changes in v3:
- use mt7986 platform-data with the mt7988 compatible

changes in v2:
- corrected minItems to require all 4 clocks

Frank Wunderlich (2):
  dt-bindings: mmc: mtk-sd: Add mt7988 SoC
  mmc: mtk-sd: add support for mt7988

 .../devicetree/bindings/mmc/mtk-sd.yaml       | 24 +++++++++++++++++++
 drivers/mmc/host/mtk-sd.c                     |  1 +
 2 files changed, 25 insertions(+)

-- 
2.43.0


