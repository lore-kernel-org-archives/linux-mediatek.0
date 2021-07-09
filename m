Return-Path: <SRS0=yaqe=MB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D170C07E99
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 11:28:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54DD8613BA
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 11:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54DD8613BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Db7GmQGLn8NCxVeRaZcedgq/2QP83GVT7ao7jiz4lw=; b=GMKU1DxFv32qPx
	Mq/dezIRY/okv6b2+uzN1jdn/abE9B56J0nAmAZAkKUxwaT0K+AtV0RgaquTISEEUrG/1FWwkp7v0
	nBj7LUHTifts85EXLnqSEq9oQYiO6iCBnEcgB7MnX7hTtEbjSSITNITMA51dWuz9fceU1S2Ny+JXx
	cKyEuvBHYzqwbijiAKqhUohLlLdTGRvr/fkAONP1mMrDLO0Ji8b6RdHF95nxd+tuyGEddDzQofc/d
	ncgcCAezzclhn2HQhnox+VWYAPpn4ewj2XS/AYEY+//McX1xad+RFZiHM9oIy1dO180s/XAiO2/Dk
	BG0R5A5qjn9yO1+zl8Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1ogX-001eSf-IP; Fri, 09 Jul 2021 11:28:45 +0000
Received: from mout.gmx.net ([212.227.17.22])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1ogT-001eRt-Mc
 for linux-mediatek@lists.infradead.org; Fri, 09 Jul 2021 11:28:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1625830110;
 bh=j6rzl1T2VppWbP//akxXTOsnokNfQHS/1AZyiol3FiY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=aQKTUaB+t57AI1VLXEbZeO4kiHHBr4GyDifUjWrRqEuRN75IHjwEFyJhyZEI4BXYo
 B/TMplp2rMzI4g/4KcOYiIINMUTY38x/k0tXmxlKcx/yzZ6WlkuaByU9W3J/BIUFHe
 u2WsCau4I8xJXd+CFjNFzX1XA+ol/Mkxc52wC6HY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.72.148] ([80.245.72.148]) by web-mail.gmx.net
 (3c-app-gmx-bap43.server.lan [172.19.172.113]) (via HTTP); Fri, 9 Jul 2021
 13:28:30 +0200
MIME-Version: 1.0
Message-ID: <trinity-937ebfa3-d123-42de-a289-3ad0dbc09782-1625830110576@3c-app-gmx-bap43>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Enric Balletbo Serra <eballetbo@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, chunkuang Hu
 <chunkuang.hu@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Collabora Kernel ML <kernel@collabora.com>
Subject: Aw: Re: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
Date: Fri, 9 Jul 2021 13:28:30 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <trinity-ac304676-173c-42c6-837c-38e62971ede0-1625827104214@3c-app-gmx-bap43>
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
 <25d61873-38ae-5648-faab-03431b74f777@collabora.com>
 <trinity-e6443313-a436-4e9d-a93c-1bef1cce135d-1625736911475@3c-app-gmx-bap19>
 <trinity-3f4f4b55-7e39-4d80-8fc3-7d0e2b3026de-1625758259993@3c-app-gmx-bap19>
 <trinity-fd86a04e-81b6-45f0-8ab4-5c21655bdf53-1625824929532@3c-app-gmx-bap43>
 <CAFqH_52OdB+H+yLh-b8ndbS_w3uwFyQEkZ-y2RQ2RnKnMEt6vQ@mail.gmail.com>
 <trinity-ac304676-173c-42c6-837c-38e62971ede0-1625827104214@3c-app-gmx-bap43>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:AhrRymJLG798R6GlUJTbNXqVLA1onupKDy3QLdwBQ5EYAo7ciyRAU2pghP2iI4fOpy0d3
 HLJITFxviSNxFnviafc49JthpmaVeocjLJi2OqJHTilPAP0HeBFEz4Q2e5dp1RPLomdNw4hzaI3e
 zVrFI31RZ0abng4Rr5ke1nXgsyTNC9cHTAv03vpYk0I5sCtsX0K2mo06J7mv1C5u3tThGHPkpCpi
 KsWpqlFp7NtSfCph2QlCHSis9zn0C4lc3xgIk8n8HjOWZR+qyaM0LCdSW9I6GhKnK5KqDm5oVRcW
 tg=
X-UI-Out-Filterresults: notjunk:1;V03:K0:u/imABG7Iec=:u2nsH1ZpUrdBA+kERlefig
 JGl0qkxTikV9vr6rF1CNQmnX+KQWdMeSbOINRt4eobJDvdGVMOHJAWdemloYuj2An8Z5Bt1z/
 y8odNW9trnqMqpHcg94RSyld8xW0TFZR1nWkGRcidcGDVQoEpaMGm8JJmPWJ/OlSQ7oBa0r0F
 fAW2YyVM5SmQ4gRtV35Tk/rj+lHnm97AsTezin5NIqD2Tpmhg2M+lxcRVpzDEriT1unulX/zg
 xCUPFqurpvbDGWUqbbJpr6lEBw1X4Py5pEaxNnM8XdoIYgHXti6knT4AYrssXKHjqwLs2SotK
 xvweXIg0kTpHGCXWfJbkR9en47rjLgC7VcttYlD/6m5o/JnA4djtsZQqnOhDNwP8ZV8y4FFH6
 PUimzCdiV6jYCb6R2P0rkJ/10Qf2huYZOnNog8OyQ9HHzUWF410cqA5ZjQ5IVGX2gc3JSub6Q
 7MXhA92e14Ik4EywTpPOA/LPHIcczUZLhPPEqZiPGJkkjw6Qg2WmbLrBQ7EXoXNDfhFbn2qnV
 EIwai2UnUPY6eyWEYKL1AIzYcfERPjWqTkAiWdiLFeE9T2crlh7E86kEVK7bN/DZtp8cPVZDN
 6x7ueZs+JY0pB09SSKoqGQSIQmDqViH48oiiu17Z5a1BuOdg54v60WyLO4Ld0++6ZNsLlgBPt
 5ICgzjtR0ycZBr8nbDaWii7QwpBi0k6O8+nJrT7l84U4At7DcXTHJnltNb6rqjEWYUZ0QAnr1
 5rxJZMx/2Ca7Cr6bI4y73M5y1+FzKej00kqCkveVQinet4A9GhDEfntbW36VjE3VqTKgLFwyk
 cYN8gs6AtXlA9cVYZr3Zb9CDuyuDmhnHXyC+9f556eoCuNHCu0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_042842_128080_BE76CED9 
X-CRM114-Status: GOOD (  21.66  )
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

> Gesendet: Freitag, 09. Juli 2021 um 12:38 Uhr
> Von: "Frank Wunderlich" <frank-w@public-files.de>
> An: "Enric Balletbo Serra" <eballetbo@gmail.com>
> Cc: "CK Hu" <ck.hu@mediatek.com>, "Dafna Hirschfeld" <dafna.hirschfeld@collabora.com>, "chunkuang Hu" <chunkuang.hu@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie" <airlied@linux.ie>, "linux-kernel" <linux-kernel@vger.kernel.org>, "Enric Balletbo i Serra" <enric.balletbo@collabora.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "dri-devel" <dri-devel@lists.freedesktop.org>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Collabora Kernel ML" <kernel@collabora.com>
> Betreff: Aw: Re: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
>
>
> > Gesendet: Freitag, 09. Juli 2021 um 12:24 Uhr
> > Von: "Enric Balletbo Serra" <eballetbo@gmail.com>
> > If this is the offending commit, could you try if the following patch
> > fixes the issue for you?
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.13-next/fixes&id=db39994e0bd852c6612a9709e63c09b98b161e00
> >
> > If not, and that patch is the offending commit, it probably means that
> > the default routing table doesn't work for mt7623. Needs a specific
> > soc table.
>
> Hi Eric,
>
> thanks for response, but it does not fix the issue for me. hdmi on mt7623 is DPI not DSI. There is already a mt7623 specific routing-table defined (one for DPI/HDMI and one for external=DSI/MIPI):
>
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/mediatek/mtk_drm_drv.c#L74
>
> maybe it can be included or compared with the "default" route?
>
> regards Frank

Hi

i tried to convert the old routing table into the new format

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 080660ef11bf..134dae13382f 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -20,6 +20,12 @@ static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
        .num_routes = ARRAY_SIZE(mmsys_default_routing_table),
 };

+static const struct mtk_mmsys_driver_data mt7623_mmsys_driver_data = {
+       .clk_driver = "clk-mt2701-mm",
+       .routes = mmsys_mt7623_routing_table,
+       .num_routes = ARRAY_SIZE(mmsys_mt7623_routing_table),
+};
+
 static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
        .clk_driver = "clk-mt2712-mm",
        .routes = mmsys_default_routing_table,
@@ -133,6 +139,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
                .compatible = "mediatek,mt2701-mmsys",
                .data = &mt2701_mmsys_driver_data,
        },
+       {
+               .compatible = "mediatek,mt7623-mmsys",
+               .data = &mt7623_mmsys_driver_data,
+       },
        {
                .compatible = "mediatek,mt2712-mmsys",
                .data = &mt2712_mmsys_driver_data,
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index 11388961dded..fd397f68339c 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -214,5 +214,14 @@ static const struct mtk_mmsys_routes mmsys_default_routing_table[] = {
                DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, UFOE_MOUT_EN_DSI0,
        }
 };
-
+static const struct mtk_mmsys_routes mmsys_mt7623_routing_table[] = {
+       //HDMI
+       {
+               DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
+               DISP_REG_CONFIG_DISP_OVL_MOUT_EN, OVL_MOUT_EN_RDMA
+       }, {
+               DDP_COMPONENT_RDMA0, DDP_COMPONENT_DPI0,
+               DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_DPI0
+       }
+};
 #endif /* __SOC_MEDIATEK_MTK_MMSYS_H */
:...skipping...
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 080660ef11bf..134dae13382f 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -20,6 +20,12 @@ static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
        .num_routes = ARRAY_SIZE(mmsys_default_routing_table),
 };

+static const struct mtk_mmsys_driver_data mt7623_mmsys_driver_data = {
+       .clk_driver = "clk-mt2701-mm",//leave clock as mt7623 is based on mt2701
+       .routes = mmsys_mt7623_routing_table,
+       .num_routes = ARRAY_SIZE(mmsys_mt7623_routing_table),
+};
+
 static const struct mtk_mmsys_driver_data mt2712_mmsys_driver_data = {
        .clk_driver = "clk-mt2712-mm",
        .routes = mmsys_default_routing_table,
@@ -133,6 +139,10 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
                .compatible = "mediatek,mt2701-mmsys",
                .data = &mt2701_mmsys_driver_data,
        },
+       {
+               .compatible = "mediatek,mt7623-mmsys",
+               .data = &mt7623_mmsys_driver_data,
+       },
        {
                .compatible = "mediatek,mt2712-mmsys",
                .data = &mt2712_mmsys_driver_data,
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index 11388961dded..fd397f68339c 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -214,5 +214,14 @@ static const struct mtk_mmsys_routes mmsys_default_routing_table[] = {
                DISP_REG_CONFIG_DISP_UFOE_MOUT_EN, UFOE_MOUT_EN_DSI0,
        }
 };
-
+static const struct mtk_mmsys_routes mmsys_mt7623_routing_table[] = {
+       //HDMI
+       {
+               DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
+               DISP_REG_CONFIG_DISP_OVL_MOUT_EN, OVL_MOUT_EN_RDMA
+       }, {
+               DDP_COMPONENT_RDMA0, DDP_COMPONENT_DPI0,
+               DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN, RDMA0_SOUT_DPI0
+       }
+};

here i've left out COLOR0 and BLS because i have not found the 3rd (address) and 4th params (value) for the routing between them and edging components

this is the old route:

	DDP_COMPONENT_OVL0,
	DDP_COMPONENT_RDMA0,
	DDP_COMPONENT_COLOR0,
	DDP_COMPONENT_BLS,
	DDP_COMPONENT_DPI0,

so i guess i need:

DISP_REG_CONFIG_DISP_RDMA0_MOUT_EN, RDMA0_MOUT_EN_COLOR0
DISP_REG_CONFIG_DISP_COLOR0_MOUT_EN, COLOR0_MOUT_EN_BLS
DISP_REG_CONFIG_DISP_BLS_MOUT_EN, BLS_MOUT_EN_DPI0

thinking OUT is right for display...it's no HDMI-in
but i'm unsure whats the difference between MOUT and SOUT

compatible for mmsys is already set to mediatek,mt7623-mmsys in arch/arm/boot/dts/mt7623n.dtsi but it's not working, i guess because color0 and bls are missing in route

any hint how to add them?

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
