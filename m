Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF08CD4F54
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 May 2026 22:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BaMDXwQVRtxROg0BHKiUws/Sbvb5VHpQ+LiARB3jO4c=; b=fo3I8/ooTzCPKwzxRUQlJmhIbS
	uHyBo2vfUBmPSIQ9BeYPLXJ6eliEeTKNGU+22oG7PjUqDlxx6c9vf6sIYOlYORCE3cg4gdo3DmrGf
	D7bcgxEwwUabBxZwV1HkMYxdkY6WM+LX/gTDvEK/uK0GNqtUksLEifLR4kLFSC329MKLvAkonVUi2
	ixEvTedb97YnbgFFSqTNZDzg26k9H5gWgbY2Zpbt69Oqf4Z354DX5qYwp8DXB46SSwQMuTM29Acnz
	94RECDoxPBX0wQ3kDMIARNJgnyS7rcNXx913c+ekBV4gruIx/MEQz1DPn7Rqaglq5miG7boOfsu+t
	z1YPdw0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSzz-00000002y30-1xBK;
	Tue, 19 May 2026 22:33:15 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPSzw-00000002xyU-25L3
	for linux-mediatek@lists.infradead.org;
	Tue, 19 May 2026 22:33:13 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso43715295e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 19 May 2026 15:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779229990; x=1779834790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BaMDXwQVRtxROg0BHKiUws/Sbvb5VHpQ+LiARB3jO4c=;
        b=VFVOHZtS+0ZXMPcdIRkGXgP9d33kq44+Mdr4nol1qPOYCKO3A7bmWFW7WjwScfgWOH
         wUNUfHsy+o+aDFami0Nq3cOgxiKFx6LtJsCXIP+zml/cbfKl/HhIQUtSbpl718fuzQiG
         ZuOgvpLDk9VioaFDTG/mwE/G5MofNyPHiaBvWb8+klMyuWKGaZr5NFe1eU64wt+8pcHf
         UP3ewOYjrTIGulr2yfWH1q/quSyTRJyLh0bq8n8Vq2XG13lB0yNqaOasB26U8wQixIfC
         tGrNxSQflR7sAtO54UePjNR1UX+3R+b2JliSr7ktXGqxDhEeK/RSpJGJTlLicWYvuml4
         5myg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779229990; x=1779834790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BaMDXwQVRtxROg0BHKiUws/Sbvb5VHpQ+LiARB3jO4c=;
        b=evPZvsxt3dRkya2cEvLIdGswVmoXZCNqGwzTGRGH7jZaCfysAQkQzzh0PFVZ6pekF6
         +lAwf5gSMIsx211TTwbylwKBIzNuLW4Zl7/jzyn71BcDkgp7ecjpvdtEixWUKjkrsr6g
         pLNgVFahzVqS97PN7/m4LORcBO4Kuu+6HexajGLIcGvbfY36gjBdSRPhjOeQ9nNmcu1c
         3Fj2SrUGYDokOgs/lqMk1F29P0WfFouqgXIKd/jmGNl+1DV1PC8n/o8piUUWNOUTE4DH
         vsfNi6BH34vedjXBiJHIAziJP5S43WAFC7OywF7NPhtL9njC3CKjawbcdC9UZehxoaVo
         aZKQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7smsHGluQGXnNgBRenheTt1/to/vKp7yExujZOADgSq5ZLpkfCzbrriWn3BDnfwhF0Rguuq7xeICUsHC02Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzDS5r3SpYttqkGRHYbay9XPaxG1RctoGe7NUqmbN9G4TDCxdei
	vH+VKAdvqUsqXCxtQKsWR1TXba0rBu/6npebEobYrGix7KoLeM7+5Dvq
X-Gm-Gg: Acq92OHq0z734FFt2nxa6jXYLKYbYAMJHefP2K6L/UVhPqHxE+n3N8WPOEPyd0VNFsJ
	UMoG/fIz1vpe+n8wAmtPXRw4YqSVNb6bI4H9rN79tRr4ycv7ABM8S7qT9bcUatH7U+DPImIjD4X
	tcoPHEO1AvY0kh0lFLUjMq0diL11fwWu01YqvhZSOi9iO4bMgwYMHKD6HvU7dZmL9N2TeLUKhiB
	0YXIzYeNbqIDz2WqlYQacdpsk1TWsPUorZhviP8LrHuv6m3j8eInAF14vR/0vFMB8SGAkeWDPAf
	k724KssB12lGmgzIsvvcN0mousaeB/bC26AdVjMbkoX3w5CRMuq44yDx4IpjoLNRkELaTz1nCj4
	4WzxDd9LGL4VbqOjnYHWhEGqinakm3R5q/Sy1NAkX+0pBYDRz8FTHaIRJBmUn5yVdQc1YnLzn8+
	eEqtIXEc6UuIHLgMhDvAdSwfrriBGboaqDjHBw1RVJB3XX0i9K2KPJqtxuFhkujw1TI6/uK5B1U
	fndYHX2Dw==
X-Received: by 2002:a05:600c:82c3:b0:490:778:4fe4 with SMTP id 5b1f17b1804b1-49007785080mr183034005e9.26.1779229990354;
        Tue, 19 May 2026 15:33:10 -0700 (PDT)
Received: from Ansuel-XPS24 (host-82-55-252-101.retail.telecomitalia.it. [82.55.252.101])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48fe4c88495sm346659955e9.4.2026.05.19.15.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 15:33:09 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v3 2/5] i2c: mt7621: clear pending interrupt on i2c reset
Date: Wed, 20 May 2026 00:32:44 +0200
Message-ID: <20260519223253.1093-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519223253.1093-1-ansuelsmth@gmail.com>
References: <20260519223253.1093-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_153312_549974_3762B475 
X-CRM114-Status: GOOD (  11.11  )
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

On resetting the i2c bus, clear any pending interrupt to have a more
consistent state on the next operation.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 700beb9e7b1a..d8fa29e7e0fa 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -101,6 +101,8 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	iowrite32(((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN |
 		  SM0CTL0_SCL_STRETCH, i2c->base + REG_SM0CTL0_REG);
 	iowrite32(0, i2c->base + REG_SM0CFG2_REG);
+	/* Clear any pending interrupt */
+	iowrite32(1, i2c->base + REG_PINTEN_REG);
 }
 
 static void mtk_i2c_dump_reg(struct mtk_i2c *i2c)
-- 
2.53.0


