Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B3C6C624D4
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2026 19:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=; b=uJo/lRrtG7GfitbY7xhX5WSc/v
	KmhCNQvM0krtJEoEYC/xoNVhx0K6FJErlVKzicv0g/39bL9O3eLsa4/BYpimdF/5B27UbNwkJPTEV
	CrJX6S4gZ5gMco/inYoTzO/MlHarXyVF3clFJv0YjAeIpnoxf713wbRVrxoo2nQ5lYx5vpyMkCdHg
	WeL/9DSlasIeapOeTj/MDlJwBOUnBKSiQgQ29ypwodU57ZsvE4HOGqJA7nrmLa7jIkgo5YVuX6v5f
	p6tfGAyXe6nitBYy5W51Qb8PvkyBTh5cknL/BPwPa5oPq4KNkVIHzb9c0UN+l893zrtffqQcNf3ML
	HixxB7rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qjS-0000000Fj58-14hp;
	Wed, 02 Sep 2026 19:34:50 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qjM-0000000Fizb-1TpB
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Sep 2026 19:34:48 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-484362f5c4aso1571282f8f.3
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2026 12:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377682; x=1788982482; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=CDiDtsznp2cy0vTKC+aw3C5/EnVpTf09Q3KazOuiiv26z1Q1yQdb37ZqsoM25KDuGO
         dS5ObcBZanI4Bi9V4M+766EZVOMFasJWBNnW9Uu5Bn9LWHlsB0kPJwapye3Y2YkalWcX
         x/G9Dt8tcfMytCsC0fv3bSgUpxuhQOjinrzeg2wEpL0HF6rp++xOG97RLbfWwFzmuXOf
         rnI30ByNkc2hslY9e98zJFRkTY4H3BVIXOGatgeEpnaSYm2WEgouWmyHt+Iaxni5va4w
         //AtXvf38BxSSWYwPxvGdurC4Go5iSnr3VXTbxn/SQdYcXqaYM/ElO2oB1VDrXmiCcYP
         6gzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377682; x=1788982482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=ki+0ecuLlTaZTKJdx3t94Ic8eM4j7qWB2jn8uMxYnZ+pbebDVEvuCpYvTFcJJKHd6+
         3IjCDHrf/+cDFrYFNQrzB6XxdQf5sc3dZMLvuNr4jOTIAlFJuqV+It6Hb5d4xmFdRyGO
         nKGmhPT+CudAQ3O0/9QnaxJsyJ8L1Ikn63wh+5nuuUWqy2EAJ2fzvld7rOXnIGb78qpD
         q+92d54KqXhsn2vy2nfrUTxnCN5GZAFDrLTE21VJNjPTimCMMbR0bk1JXzPt1X2w50dm
         KwDvsf5XxILdKtmNjRsVU96BqsC58OE3mRKhJ66yquvOwCf1tZ8AJoPy1JgSw0BEcXzp
         hgIg==
X-Gm-Message-State: AFuF++ng1CbylgR6IGRmucg6WQDw//a5dw72nPvrlR1gWqvBEHj3f2os
	QFsmZlTJ+Mnx5j2IYvyZz/RRrpS5DdKuer6g0/lNaRq/qw+Gm3JBmKfoaIeFIOnw
X-Gm-Gg: AYBFou32jvN4ggZKo1OCQJ91aNhvx48iZYmiWZ7Npvt1/X7W0VWGFw1NiyBb9WX79p9
	n+vhmdmjM2RukrwoCqF5DTXWLZ3IpUa84YC/C3Q4MsxDCFiN4JOq9B8vd57/mDxSPtuKU+FOxhW
	cmHgkB9vdpFUUt5DkXhQwnL/67yq9jef/rL/ZjZIb2jypOms1d9i0MqEoWfuC+QDRtsP7q+yv55
	ziaA4u9Vgt6xVXhhkbOpE/upS4V68LyxF8gzS0fJSHXISqnlSBphI0cVk63+tSxzdSXwo+N7wlq
	BpJXieShd6VIEEmp00qp9Jxba6TbmpAntguflWqzmV0Jd/p6Xw3vJtnL4FrtPOKCJ/LFZDWhBr+
	Vff3dM/ksFqAO+Ry46lPhNECzkwq/syWDSWCW49mE+vrT/xaxyl3KjhxTI2E04EZLWMJXHQ/chM
	vfnLep3H7uqfqhSzILPtsZurWLbGK+8hGwQzZh4GDIu7hVppyzpJtBd4hg
X-Received: by 2002:a05:6000:480a:b0:47f:eac2:6f55 with SMTP id ffacd0b85a97d-48488f2229cmr14997817f8f.19.1788377682430;
        Wed, 02 Sep 2026 12:34:42 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cdc37sm8889191f8f.34.2026.09.02.12.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:34:42 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v10 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Wed,  2 Sep 2026 21:25:38 +0200
Message-ID: <20260902193351.185771-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902193351.185771-1-l.scorcia@gmail.com>
References: <20260902193351.185771-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_123444_414655_9C88283D 
X-CRM114-Status: UNSURE (   9.86  )
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

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 140a862ecfbe..ff720588128b 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -31,6 +31,7 @@ properties:
           - mediatek,mt6357-keys
           - mediatek,mt6358-keys
           - mediatek,mt6359-keys
+          - mediatek,mt6392-keys
           - mediatek,mt6397-keys
       - items:
           - enum:
-- 
2.43.0


