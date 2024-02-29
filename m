Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC0EC48BF6
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 19:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RhqgRqB5T/dkMbYB1qD6jbXkKUPgtyJMx2qnIjwhObI=; b=ay8LO/wMe3azE/
	XAFZNISv/rU/slETlppxrCmfd2/lM7bConqbWKWnZFrnP7Hmg4JXC3jfZDghZpLTCCDWJD8n34gWr
	MyFqIVbLv0ijr9ZA5RRUU+2CTaX82NpBenMga2G4iK35y5BG1QCwZArQ4YyMUE754rkO+LCBKCmyF
	5bsA/ZoCFaCwuzFXvHw0Mq3sGlm80t5b8fHbnoptNPCGNjRYRdUo66MZ7rwvChyUMD/CV9qipBNSQ
	ii/5+8x4xsFySkpOZuMn5dYOgnRBiMGeK+XYxsGiHRDO5YW7RU+0SrEsb8/rWxQZkoCyWJ9DzTXbi
	vAt204g5nC7cSeN+v59g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfmKt-0000000EwbU-3Oeu;
	Thu, 29 Feb 2024 19:44:55 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfmKo-0000000EwZh-3nlN;
	Thu, 29 Feb 2024 19:44:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709235888;
	bh=YqL7w/yusbcYydh4ITQceifk1FO1VxHPmNk4up1BPaY=;
	h=From:Subject:Date:To:Cc:From;
	b=MBqQ6pv2w/6veo/rg9b7O0NuOtiQVHb20ijcg5MfI5FtnxAV0UyEZn6YDgXdVBwuU
	 IAqnr9BKxSD4xlWBauXKzQd+/k1ryOto1ADIQOHI+KrgTP/VdhTWshilNL4pR/3otv
	 GQ3aBRk46OhksMg2ZCcVFjQFgBin8Ipt28wOlbQR+90hIoCJSkHrCU/tWnIBSQ22R7
	 yr9lfAY19V6P7I3gNm/7luShAwRwGfCMBROZBsmTskK/54qlKKA3bEhJC+sMoq8kQn
	 tU1V+Fch0BL/oYyO0f648XKNFJREG279ILhbLzTBqzWg6ev6Uk0T/OV9laO52I0wse
	 YNgHdXJv90LwA==
Received: from [192.168.1.200] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AC87F3780C22;
	Thu, 29 Feb 2024 19:44:45 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Subject: [PATCH 0/4] arm64: dts: mediatek: Add missing gce-client-reg
 properties to mt8192 and mt8195
Date: Thu, 29 Feb 2024 14:44:27 -0500
Message-Id: <20240229-gce-client-reg-add-missing-mt8192-95-v1-0-b12c233a8a33@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJve4GUC/x3NwQqDMAyA4VeRnBeowYrdq8gOJY1dYHbSiAjiu
 6/s+F3+/wKTqmLw7C6ocqjptzT0jw74HUsW1NQM5GhwRAEzC/JHpexYJWNMCVc105Jx3ac+EAa
 PyXl2ow88cYSW2qosev438+u+f81vl9Z2AAAA
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>, 
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>, 
 "Nancy.Lin" <nancy.lin@mediatek.com>, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_114451_947613_B2AA175E 
X-CRM114-Status: UNSURE (   8.11  )
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

This series adds the gce-client-reg properties to the nodes where it was
missing in order to avoid "error -2 can't parse gce-client-reg property"
errors and possibly improve the performance. The separation of the
commits was done in order for each one to have a single Fixes tag and
therefore be more easily backported.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Nícolas F. R. A. Prado (4):
      arm64: dts: mediatek: mt8192: Add missing gce-client-reg to mutex
      arm64: dts: mediatek: mt8195: Add missing gce-client-reg to vpp/vdosys
      arm64: dts: mediatek: mt8195: Add missing gce-client-reg to mutex
      arm64: dts: mediatek: mt8195: Add missing gce-client-reg to mutex1

 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 1 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 5 +++++
 2 files changed, 6 insertions(+)
---
base-commit: 2ae0a045e6814c8c1d676d6153c605a65746aa29
change-id: 20240229-gce-client-reg-add-missing-mt8192-95-d05c0659c8ca

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


