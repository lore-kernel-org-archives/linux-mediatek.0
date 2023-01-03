Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B5EC3DA7D
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 06:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y98f6JcfN3LVqyfn9v+xxR4SH8jrP9djJmUQfnsRA+I=; b=WVnGkN3YBjUZbHHdej0Y2ahMmX
	k481K95KpPwBKuEZByI4uubeBX2+hPqASWnPbbzhKi00eoxRvst22ORKJT2DBPZddgK44SAC40aex
	dtt3wTdhrbhMntjW/F2oV7W77Nm5yI2+VUKQlXtC1xMvxGFXDrjSy6ehgiDwf69oHuS8vY1EyFaFz
	KRR2jNOWdp27ucTGcOL22opKVilRePRT/RJsPd3Nux1ZTT+2sqahwkTFZtJ36tAKhctDvofqivIn3
	pG0F0ciavKJp8tmIDcsFL9HVneMVTxGQetQJgmZL4r79GhrXb+2/dliQmsNkwlfGoWi+p6sAClkkH
	lojG7gfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCbBU-00HHCm-Dn; Tue, 03 Jan 2023 06:54:04 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCb4T-00HEq2-Nc; Tue, 03 Jan 2023 06:46:55 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3036kNU0036787;
	Tue, 3 Jan 2023 00:46:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1672728383;
	bh=y98f6JcfN3LVqyfn9v+xxR4SH8jrP9djJmUQfnsRA+I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=m+HoDosvulIDy/DnK5PY4BHL1hhI7U+8TanANrmlap/7ZDupz2Kb00l+DunjshKV1
	 4xmJ/57IZimzayYcEltqaREw2OEFpZjkEziywYQkdJS0ql3VBI8ZwVngeFPtZKm/tz
	 AiyDf5C6hcg9fpgw081AfD8bu/6pvf7uIosWuYac=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3036kMJR021242
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Jan 2023 00:46:22 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 3
 Jan 2023 00:46:22 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 3 Jan 2023 00:46:22 -0600
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3036kLfQ085969;
	Tue, 3 Jan 2023 00:46:22 -0600
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>,
        Tomi Valkeinen <tomba@kernel.org>, Jyri
 Sarha <jyri.sarha@iki.fi>,
        David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>,
        Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Paul Walmsley
	<paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou
	<aou@eecs.berkeley.edu>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Guo Ren
	<guoren@kernel.org>
CC: DRI Development List <dri-devel@lists.freedesktop.org>,
        Devicetree List
	<devicetree@vger.kernel.org>,
        Linux Kernel List
	<linux-kernel@vger.kernel.org>,
        Linux RISC-V List
	<linux-riscv@lists.infradead.org>,
        Linux ARM Kernel List
	<linux-arm-kernel@lists.infradead.org>,
        Linux Mediatek List
	<linux-mediatek@lists.infradead.org>,
        Linux C-SKY Arch List
	<linux-csky@vger.kernel.org>,
        Nishanth Menon <nm@ti.com>, Vignesh Raghavendra
	<vigneshr@ti.com>,
        Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar
	<devarsht@ti.com>,
        Jai Luthra <j-luthra@ti.com>, Jayesh Choudhary
	<j-choudhary@ti.com>,
        Aradhya Bhatia <a-bhatia1@ti.com>
Subject: [RFC PATCH 4/4] drm: panel-lvds: Introduce dual-link panels
Date: Tue, 3 Jan 2023 12:16:15 +0530
Message-ID: <20230103064615.5311-5-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103064615.5311-1-a-bhatia1@ti.com>
References: <20230103064615.5311-1-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_224649_916420_F2BEE35C 
X-CRM114-Status: GOOD (  12.84  )
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

Add a new compatible, "panel-dual-lvds".

Dual-link LVDS interfaces have 2 links, with even pixels traveling on
one link, and odd pixels on the other. These panels are also generic in
nature, with no documented constraints, much like their single-link
counterparts, "panel-lvds".

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 drivers/gpu/drm/panel/panel-lvds.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index de8758c30e6e..bf6f84af0730 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -241,6 +241,7 @@ static int panel_lvds_remove(struct platform_device *pdev)
 
 static const struct of_device_id panel_lvds_of_table[] = {
 	{ .compatible = "panel-lvds", },
+	{ .compatible = "panel-dual-lvds", },
 	{ /* Sentinel */ },
 };
 
-- 
2.39.0


