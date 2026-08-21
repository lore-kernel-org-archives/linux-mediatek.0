Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8E9C5DF7D
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2026 12:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g4hgMi6/uNAtRYrz9ZogYJurz7z1EY11bapUhL//V5s=; b=Y4NkGZPLCsSwiKD1JB9q8KYP5i
	sqAXUVNE4WzSm59rphNvaGZLpBdOEUiC1MbXIZqgKf+V+lsrQkThX5CTFQL6QuI2KgU+g7Fb1vhi2
	hN64k/6onMKS0dxlfzOI+sL+F/ERxi726+RJliD0SldrWl0sXKdUiLKPPtwOsSbH5asQEfyqaFujX
	cXne63VTsoUnK7CIshiM7rs0G/BUEloldFl4cVwI8CV5GoP3yDtH6nULJXNV4J/KcfgZG6X5rHRuf
	8q7APpzFwi8IyF6K3dWSIdqqJtmzs5Akb6SrJEtEbvaPNeAjxTCh29L9DXcSGDAG7ClUlRfi27s5h
	6IRkL73A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxONi-0000000DJUx-1hcf;
	Fri, 21 Aug 2026 12:29:58 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxONe-0000000DJPv-1Dsk
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Aug 2026 12:29:55 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84a652535dcso507231b3a.3
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2026 05:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315393; x=1787920193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g4hgMi6/uNAtRYrz9ZogYJurz7z1EY11bapUhL//V5s=;
        b=C7Z5uv54BSbCHrlLYvCXEZm/pP1rdPbuKExF9e1jet80EiqZbdcoA6YffnU86D65XB
         tiL1amBF3fwYTflatKBm2Lgo6H/8oWCkDriRJnBdSdl5Ask4Ucvf3NRP8RbQJX+YRjLS
         NyF60fSWu9ZA4J1FDI9iwGaS5fAvHfYEz1/1gOIDfzMqPpXZBpfwj9YZ0P9rI0dVvlFE
         y0XPIHQ7p3w4qo4S+iXnZUNL+ZRQ+ExQ+Fh7zTlRsYF/hdh2YbQpcz0TtvYtkO2AgxpY
         k0UNVmI9NFlpr5bW3ZehQCfPwImvGaF5etwGKWfHEHo8FD9hQNazo20yveDGi50KqKQt
         gDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315393; x=1787920193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g4hgMi6/uNAtRYrz9ZogYJurz7z1EY11bapUhL//V5s=;
        b=ePEzPNfdYI9gFjPMXl5/wwNZxcUWm2UnzdWl7ZD5xhgAP4rzY0jQA3V0HO65cgTi5T
         2IEzNZvOXm5LUpH7kKtFiS6Ev0A8drQNeGNdbbCzJbPhqYDg5VrSoJS33Hmp8dFUI3kS
         om3SP32dllg07M+2tDum4eugin4qI8E+aL/vVDjmWIJyT41q0cbYqrgU2Q7kg6IX1ali
         ucyPCv6K0r9jE80q2abXYxyx9Nf/h2Nswhwt9X8sJZZ6F5ZfKxc5S8WF2cW9/alNUwCE
         DatJ4DdpHFvSlTTRk5CdaNggXYMjU6vQxR6p0EA87V6+SimGNvvNmo7rS+mrUz5hTePE
         /L5Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro3NU7ztMfjPpEcGuxpjof3QDPu5lS4kLL2AuB2K3mjMhcrgI6SuHP9Nt8tSbX/YzkiF2LVtFmqqJ/Yua+Wow==@lists.infradead.org
X-Gm-Message-State: AFuF++kx3ifzURIQwePSvJi/yuNrXfm61dlUb0uTFhNe8V5+naYY4Ud0
	IcK8iohhSrXOVBDPu6WV7HFMFZAzw9Yod3ewc/T/B9o4Oe/d01amJZxf
X-Gm-Gg: AR+sD13WEosyqpdK17xyMvxJcf1vDLTxBC8KpReAQ84ckU/U33TavHBpj0O0G6KaRhO
	K6xqlOlW+oOXcQGAFsL9dIbXdbxIMIGOUWeH3DntYlLR/vmXouBNP9RN7YNea4My6qiYdZxNKZp
	I0pWC+I9pfL3pBov8SDsew9mvHeltQfTPylFN7pg4vh0TlfhyJ5beX7EgV2W3gqjB29/4DI5zQY
	907CHY5VnXbxMHMivtuxyoz3SG0KdUagiHB2Y9j5Ssj+8svSDV7AuJcgJbhJQ5IN00H2Uk7HgCs
	cEaTvbsOWAhU9yhcZLLgO3qXGcv2oqQC1Hpu7dNgPlAlzcGeFEcxZgVlIoxeGcZynkCudkItLuC
	+VnFVFexaoqGx+OQnjUHtU1DtAcmt67H50c1e1RyS1T3GpFGlgWTgTZs3v/NV/0IY+OawYhwr3Y
	feN54rlbQzFKX9SLf2tcXTtNYDsNEuMHu1sUgb08dFkXIUoxAiv96hzAhx5Q7wASISPxyDznqGp
	r01SLV6Gs6B5P6wrmuwo6M7JS6WODnhho/KxTT1vxtz2q2AxbzAtxcwnU6rHVbTJ0LsASjulAOJ
	VOdyqw==
X-Received: by 2002:a05:6a00:328a:b0:851:b03a:fcb with SMTP id d2e1a72fcca58-851fa018184mr11023615b3a.14.1787315393221;
        Fri, 21 Aug 2026 05:29:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3389fc4sm2848582b3a.14.2026.08.21.05.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:29:52 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/4] ASoC: mediatek: mt8183: Fix APLL enable error handling
Date: Fri, 21 Aug 2026 19:29:26 +0700
Message-ID: <20260821122928.41343-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821122928.41343-1-phucduc.bui@gmail.com>
References: <20260821122928.41343-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_052954_349308_67065D1E 
X-CRM114-Status: GOOD (  10.90  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Currently, the mt8183_apll*_enable() functions call mux_setting(afe, true)
but do not check its return value to handle failures.

In addition, the cleanup paths of mt8183_apll*_enable() do not call
mux_setting(afe, false) when the enable operation fails, while the
mt8183_apll*_disable() functions do.

Add error handling for apll*_mux_setting() and call mux_setting(afe, false)
in the cleanup paths when mt8183_apll*_enable() fails.

Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 6ab0734ad136..0790d8123179 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -382,7 +382,9 @@ int mt8183_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		goto ERR_APLL1_MUX_SETTING;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
@@ -411,6 +413,8 @@ int mt8183_apll1_enable(struct mtk_base_afe *afe)
 ERR_CLK_APLL1_TUNER:
 	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
 ERR_CLK_APLL22M:
+	apll1_mux_setting(afe, false);
+ERR_APLL1_MUX_SETTING:
 	return ret;
 }
 
@@ -436,7 +440,9 @@ int mt8183_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		goto ERR_APLL2_MUX_SETTING;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
@@ -465,6 +471,8 @@ int mt8183_apll2_enable(struct mtk_base_afe *afe)
 ERR_CLK_APLL2_TUNER:
 	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
 ERR_CLK_APLL24M:
+	apll2_mux_setting(afe, false);
+ERR_APLL2_MUX_SETTING:
 	return ret;
 }
 
-- 
2.43.0


