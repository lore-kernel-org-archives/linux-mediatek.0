Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6513C433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 05:31:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77BC72192A
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 05:31:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yUSr4lOn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJj3ssAF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77BC72192A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bDU35fhE4RAkep7HXg8zQTVLgjQlR6C0JcYke8HHYbY=; b=yUSr4lOncINcNszbG7Xzugbfz3
	xiT6wkhHEdLSLVUW+NfQNOpSn4uQ+GseJy2lqK+Fb8U8tsEaiPoEm63XSGQCnhn3eqx0+lsbKoi1R
	dttBq6vu/5DP7lz4Ilw5/9R3WauUNdEu1YjY2skSlrOS9q+Y7h3m1snDW9dZ4eUwZyyOQO8jqhFVp
	GVRog7XkErdjy3oEWm7DSc1FSRawfzX1KGr7tHe4Fv7fDAPLwIj5MV7bO1bvyU+PVig4r5gHZ/d+Y
	GOni6rXQKQcfGW6H2ZtUAcBtV44DeOtYiCtPvY5ULSOxeMKL8f75PvZUcMeqI4Yadsk+wNYZdrZHW
	+zJl+FqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHh5K-0007Ms-2j; Mon, 14 Sep 2020 05:31:26 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHh5H-0007MI-Gy
 for linux-mediatek@lists.infradead.org; Mon, 14 Sep 2020 05:31:24 +0000
Received: by mail-ej1-x644.google.com with SMTP id r7so21305786ejs.11
 for <linux-mediatek@lists.infradead.org>; Sun, 13 Sep 2020 22:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=4iEj3Ymg+Q2X4T+WUK3swUuww1ugyEhT/pd099TK5xA=;
 b=CJj3ssAF6khrs5ozTVp4L6Ss415aCOCMrFDlbHoNMHO9U4gnw5Am9by6vCskebJTb+
 +QcswmmXDx4qBkEvf1jxsqUfUcWZkjARK48x+miuRxG4WzKbLR+mGjCAO9vpFTY+FeRO
 A/lacMJlzLbANwGPal/RvlYKzjl2LDFw9rTHEpDsjoMsefNkvHCvH+nL7dyywCnxa27E
 B21knwKco680MbeO3P9ZYpfzp0NKQTSAw9Yhlf/p/hDm9pirzLNeEcG9PiswVTuSObX/
 mQOAyzMNTW6ZOVvlKYqeV9s7bqPz+X0JV3n1eWCwjBRg9kZ5hCkbaCKEF0+5uhIN2vdN
 89XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=4iEj3Ymg+Q2X4T+WUK3swUuww1ugyEhT/pd099TK5xA=;
 b=d5HkpZ7VYRXbd9c0bgY466jjAe9vUpncbOupyLDOvEM2vHDToB12/iJS+iCQyd6l+j
 8OCCgvuumFcH4nAJcf4JMiNjYhS4n6W5YNUTP++0puvCdGuo4mA/FFpnpKmxkvgSFV/V
 JAzkfFHUuUJSFgQEcX+83gB64LEtyEszvD8Jog+LRCgq4Uvx36rk0j+NzZor7onDGTlM
 xds7hjiXPeMFHdHY081v4bajHeX01i5ee/nXO5dVMMyr7zPBwINxRgQpwcs8e8IZr1Fh
 2ae+D1tQuW/O4mb10L4izJ+k5vL0EsHxSr5jFe633dB0l17LeygpMqDD1nfHB4oLuZM4
 lddQ==
X-Gm-Message-State: AOAM530mXnererzVANT+rijA5+Y8to3lceF+yFWF/LbOoDBppJ2BJx86
 mLK6aqZ9QM5qscHgYnQMbxI=
X-Google-Smtp-Source: ABdhPJxQxGiCt0yzJvDaLuwuSh0m3eOndl420ZgNpGK1OQK3o7FwX3Yve4lC3a+U+Sq5/Wo82bXZlg==
X-Received: by 2002:a17:906:4c89:: with SMTP id
 q9mr13534240eju.290.1600061481445; 
 Sun, 13 Sep 2020 22:31:21 -0700 (PDT)
Received: from felia.fritz.box ([2001:16b8:2ddc:3000:7936:d9d0:986e:cca5])
 by smtp.gmail.com with ESMTPSA id k1sm6687958eji.20.2020.09.13.22.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 22:31:21 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH] MAINTAINERS: make linux-mediatek list remarks consistent
Date: Mon, 14 Sep 2020 07:31:10 +0200
Message-Id: <20200914053110.23286-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_013123_574747_BBDFF86E 
X-CRM114-Status: GOOD (  13.05  )
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
Cc: kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org,
 Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Commit 637cfacae96f ("PCI: mediatek: Add MediaTek PCIe host controller
support") does not mention that linux-mediatek@lists.infradead.org is
moderated for non-subscribers, but the other eight entries for
linux-mediatek@lists.infradead.org do.

Adjust this entry to be consistent with all others.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on v5.9-rc5 and next-20200911

Ryder, please ack.

Bjorn, Matthias, please pick this minor non-urgent clean-up patch.

This patch submission will also show me if linux-mediatek is moderated or
not. I have not subscribed to linux-mediatek and if it shows up quickly in
the archive, the list is probably not moderated; and if it takes longer, it
is moderated, and hence, validating the patch.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5e6e36542c62..83c83d7ef2a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13485,7 +13485,7 @@ F:	drivers/pci/controller/dwc/pcie-histb.c
 PCIE DRIVER FOR MEDIATEK
 M:	Ryder Lee <ryder.lee@mediatek.com>
 L:	linux-pci@vger.kernel.org
-L:	linux-mediatek@lists.infradead.org
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/pci/mediatek*
 F:	drivers/pci/controller/*mediatek*
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
