Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB28C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 03:43:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 256706120A
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 03:43:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 256706120A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=83gylzMIRNJFHX8vHQZuOFF5B+a7cbaq6Fi4VfFVtiM=; b=NERcKdSVu/woh2iSLK4/f5o3J
	tC+iDmyKDy66RuwS28Sleow0fIDeGtq/S1CWIjVTeDqjShOA7gYREXbAuKApE6nMsx/iDlhRgIoqE
	7gMZtp/dbiz+7wlYkioZeugIkqYJAjd4j9ChFqXoiAH5hVJ5OEtqzHsCVFEE7r3bwY+hkUX+XdTbw
	7/MOBN7nzYABymVjhxqG3Rel/DE5yNvIZj1UpUDhY0j7sgT/Vc6SEC06iilbuAruhvL0AlOmbuhe4
	SmiLuMQZIBqJ81qnWS4LBYrIR4S9y2gBHfmYfGuN2MlS3hQdNsKbGpmCpqFxULKBNqzzggEGKhulH
	n5o8aOhWQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVnTn-005cD5-1H; Mon, 12 Apr 2021 03:43:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVnTl-005cCq-PE
 for linux-mediatek@desiato.infradead.org; Mon, 12 Apr 2021 03:43:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=NGwT/EtJxrze19V12dqNHnmBDYChWF7tADJjxUl/U08=; b=GhHBXWd7ajMN5Afzg05WMmyHuF
 Uy24cLaHMfFahD1TCbdCtXFh/qXT1Cx2mrSPZVyQicxcoBwlJTyffbDtNqBxltPsPUlg+G79c+GCu
 Lx/Q0Lfrmv1vx+Ar+BY0JybJxKjcluouGyBPqBqVJI5mqCTiYLDEfLAtA7x6mZ3HDnCFwGbM/YTXD
 kwSELb6OAYAfc9EheaVNpj9ph9CF53YP43l1tJA4ewc6AvSacl7b8B5MK5MYUzKHzsN3cK4V/jbOV
 mNG0tMjFrafysdkeQflu+0YCAnMIyOy52KRnwj2GUvfMRR5qW3mGg8zW5ZVLTDAW+qXvdi9MVGyoR
 RdRq7I8A==;
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVnTj-005rTW-Co
 for linux-mediatek@lists.infradead.org; Mon, 12 Apr 2021 03:43:12 +0000
Received: by mail-pg1-x536.google.com with SMTP id t140so8315978pgb.13
 for <linux-mediatek@lists.infradead.org>; Sun, 11 Apr 2021 20:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NGwT/EtJxrze19V12dqNHnmBDYChWF7tADJjxUl/U08=;
 b=qfe5fnjAN1dEXWk2k8iMmCBx8Vdh2mzI11Y/DMlK2udE9RocprcCc5Qc0dilOshzXZ
 0AZhqVun7RwnN28hIZWScCGyeG6NLwVO3iFRFXykAV9hsQYYDb7JFkfRevSnyU413Dyd
 np5iKwrgXAOAg5Zwd5AqN72cwYXk0ZsP0Bosi/TmhlinCSqBgc2Bt8EXJZ/BvDC1a4j5
 +0zeMjfA9DUixATixlXYaPXTHYNZ5KwVCcsrMkBkRgSHvMHxEvebgFa4mv7d9xQzbcG4
 7SzqwS/3LTIT5RohgeXccaaZ0ppJ99PisURDqHa1zk7ZfmJfaeQ336NQ15CSJNAHBctT
 UjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NGwT/EtJxrze19V12dqNHnmBDYChWF7tADJjxUl/U08=;
 b=oHNU+t9Ueba9U81tVxdCwRqbzlg/BaCrkAl2bj7R6ivyidGeoRIFkckdDPd08NCgf3
 UmeWFXQdU6xJV70wbN+Kl4/lyx8NsosB4kohePL4IL5pNJvK9U8CcBuLr4EUHdlL+36s
 DXkOgsFE3gzJer4Bnj75D5QQ8uKBRVEEKfXAIEMaww7Vxcp7cd2QSdC4UKaEOq7J1u8m
 jjU/771JAq5gmAnxjcofbNvL9/MJAJF0n6ukyzjp6vj4w4TjEDCaowhnvKAl6WzK6QQ8
 8xdkKDvTzhZiBqX24HfNlZ9r4Fb2sQJrNsXGDbGR7krXilFXyJb8aT/7YmzkhsiPyBpH
 eJUA==
X-Gm-Message-State: AOAM532O4Fh9ZEQadl1dte8UznsIg/Oa/vcsDvzJ6hSw5KTPewa78FqV
 zICBQ2l8XXqgGOn/X7DkUVk=
X-Google-Smtp-Source: ABdhPJwwYJK3gG2cbqdB59bcfvjnQhrJh84YWH48ENwcrXR9TVtHr/UTRIravRlYA6bPCKmIlxQ/ag==
X-Received: by 2002:aa7:82ce:0:b029:242:deb4:9442 with SMTP id
 f14-20020aa782ce0000b0290242deb49442mr21885445pfn.73.1618198990693; 
 Sun, 11 Apr 2021 20:43:10 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id v22sm5387185pff.105.2021.04.11.20.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 20:43:10 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Cc: Weijie Gao <weijie.gao@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: [RFC v4 net-next 3/4] dt-bindings: net: dsa: add MT7530 interrupt
 controller binding
Date: Mon, 12 Apr 2021 11:42:36 +0800
Message-Id: <20210412034237.2473017-4-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412034237.2473017-1-dqfext@gmail.com>
References: <20210412034237.2473017-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_204311_452032_67DB0A52 
X-CRM114-Status: GOOD (  10.81  )
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

Add device tree binding to support MT7530 interrupt controller.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
RFC v3 -> RFC v4:
- Add #interrupt-cells property.

 Documentation/devicetree/bindings/net/dsa/mt7530.txt | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/dsa/mt7530.txt b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
index de04626a8e9d..892b1570c496 100644
--- a/Documentation/devicetree/bindings/net/dsa/mt7530.txt
+++ b/Documentation/devicetree/bindings/net/dsa/mt7530.txt
@@ -81,6 +81,12 @@ Optional properties:
 - gpio-controller: Boolean; if defined, MT7530's LED controller will run on
 	GPIO mode.
 - #gpio-cells: Must be 2 if gpio-controller is defined.
+- interrupt-controller: Boolean; Enables the internal interrupt controller.
+
+If interrupt-controller is defined, the following property is required.
+
+- #interrupt-cells: Must be 1.
+- interrupts: Parent interrupt for the interrupt controller.
 
 See Documentation/devicetree/bindings/net/dsa/dsa.txt for a list of additional
 required, optional properties and how the integrated switch subnodes must
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
