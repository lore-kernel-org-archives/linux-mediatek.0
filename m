Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9474ACCF9EB
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Oct 2025 11:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wq8ujO9Dpm/7YPTf3iw45Jy/+tYmVu6IfrY/4dh0q7w=; b=Ti1Dfyp11dFty96i+e7M3izFev
	hbkdn5qPJHoVn7mTrME616Om8cq+t7uKF6NFmRN/UF/GAGZM3jfJw3ncbbkfR6T3WsJuvLGdxCxNA
	PH5Di2H381ipR9IErgtnQR1U3y52rNihF+Q+rIif2o7W6U9Sc8nTwHv+RolTlYZ4YeVRrGobjYOCz
	/r5NEUUm1dvPMfaABbyRpZ+19r9n94pgJkXHvD0Au1Ba4vVF6yp86DO9rx9+PIwVeErQyKb02tg0R
	6UyYEVpPxxnr3sLRjRUo2mkr7MoqmX/F7gt4JR5a/blc6kKanW/Qnu9Hv/2TwxIH7rG/Qw26LA8Ey
	FbCy+a3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE413-00000000tPK-1Edw;
	Wed, 29 Oct 2025 11:06:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE412-00000000tOa-0eYr
	for linux-mediatek@bombadil.infradead.org;
	Wed, 29 Oct 2025 11:06:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=wq8ujO9Dpm/7YPTf3iw45Jy/+tYmVu6IfrY/4dh0q7w=; b=kdpZvdKHy168RFuxgkdRe5tadY
	U2/WI+r1WwhrddylSg/fQkvmersia5eoY8YDoMdRXkOrTEBrS2h10G9QXi9JnspFcCEx/2gShMx2t
	tn7qLmLbkxLOPX/6E+9syKyUmD++X+VnlZXxZNM2mEcnJ89C3JHDQu0XtkjRqCy602lojAhyTkRs1
	ydH5zrrJs+qJvvWV3MyTQT5G1pIh/0XTU3iwrJWESlHkSmLrWFJXgaJVbQQuryFLntGUT/pu8R0T2
	VzyVj5RwigbYQ0j+7OlYlhFMpi77Ir6wAp2JFzDjMQr19sDi87n5QmmnmcbouW4HY2yTmZYZM1UNI
	SI4VMg/g==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE399-00000006XS2-1Vhc
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Oct 2025 10:11:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761735990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wq8ujO9Dpm/7YPTf3iw45Jy/+tYmVu6IfrY/4dh0q7w=;
	b=JVuaWFH9VkpA2IHJhG3/4iPhsCYCRrgaucb2b/lwliWLKAipVpioOmSbVVHyE3PWrYWnMp
	t0FoY9uogDQw96HQr/Ye+fFiXCEXK8OLwPz+zY79AgLmxdU+Dou05KB1Tm69A/bdrMfIie
	2cz7mIDnQlwOgElAZcZx/TrallhhirY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761735999;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wq8ujO9Dpm/7YPTf3iw45Jy/+tYmVu6IfrY/4dh0q7w=;
	b=hFLG9QslIIRN2008cs4j53aYGBmezd5T+XmdkgXVKs5cK/nQv4sGzK+UlIDML9yO52NpFP
	HrtVaT3cHystssODTkkk0IQD8ss9FpYoGwY6c2SbRYrp4XXQoCkxsCZAjijc1lf0gUNj/Q
	m2DmOFfcSDc+SnvQSy8IscU/Gw0WfAU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-153-IGncwTSyOfKFDt74cAaGSA-1; Wed, 29 Oct 2025 07:06:29 -0400
X-MC-Unique: IGncwTSyOfKFDt74cAaGSA-1
X-Mimecast-MFC-AGG-ID: IGncwTSyOfKFDt74cAaGSA_1761735988
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-427015f62a7so3347558f8f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Oct 2025 04:06:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761735988; x=1762340788;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wq8ujO9Dpm/7YPTf3iw45Jy/+tYmVu6IfrY/4dh0q7w=;
        b=MG6XQ9K4lhBWupx1zKcVcohRFDXTVqQsGkw2a5BkzItjqN744Cp6WGLi638gCHeFYf
         tqezGASBSTrAvnP6YNg1W0NOFXG5pjP68tRQE1qcq6NQhX43BRT1k7HjfPGt4A8XHpIP
         4mzbqTcgf2QEn9EIsUZKBAAjPB6D5dYykK1Knsz+xC2nkw/rf2KxfC8HqVIG6Egy8/2D
         yDk13Zhjk2X7ff+I8IxSuMnHmcmv8RESaQzrx63SLIUWDuVUZclTOBinVsEWoJmLgNqW
         IKGjq106vOPa68PQ8z14OL4HODIhRh3cbHjUCc5WShGbCafhjwO1yEaAvUNU23DgCyCr
         5VQw==
X-Forwarded-Encrypted: i=1; AJvYcCW3xc/KwZ++Vz04JixSqWsOaS7YaJs4OqOORPbfpi+jHeytkfhgngH/7IdaFkpq2rAukO7JKTIk/nlUhcfH8w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwntFKcAJ7ayA/7ujQCluifWzPE/bP31xvoTQxZrU6tQ1k1IZVs
	CTGFYQGk73fsBholWFf5FMbhciqwFR0cKL5InAi6SCn9Y+etALAImQY0okUzhyOpvN9o3CZGc9n
	i9jVz73VA8t4gaCkxYtBbw6ZlFhRKomIH2jDSlOsamUjNnf9W+765uBWpCky7P1ZzMpbaaNnkrw
	==
X-Gm-Gg: ASbGncsTM3kOBOCr4rVbrHAgQ66RftZPKk2CQIgIa4IYy6iQIlncvr+v3QyltzTZi9t
	0aGQtaibEO2yOxmGQogVUUilZ3j158hPdESITrxKgB0h00aVgLqusibfgJF+ajIqdQPH8rgC4cx
	I8UzebNaXyjvCEFS/XDOqbzqPVFTg3wCOX96EGM4G4XV6NYPEeVFRXHpcWOc+skiBnUnLO3ZXru
	yGwh6vCuikA7g2+1p5iuh7V3Lw3ICttFXEnE2VPzonImHTC7LYJ4LJO8UcxqiRcDcXKncJMrZ5F
	nBpwDKGhsPuzhHC87fV9OvSuynecpLxe/aaoMnr6lgM8H6H+SnUJi8b+lT77qvCYe4/Cq+Tcvsp
	8395/SViVdD5Nwfkk0IIA82pIR0tsqunHZjKkWUDxlhgwCE5k
X-Received: by 2002:a05:6000:2882:b0:427:e1bf:13db with SMTP id ffacd0b85a97d-429aefd0840mr1957010f8f.54.1761735987805;
        Wed, 29 Oct 2025 04:06:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHB8RsWZ0SjBkvUi9VbRgSefrwznyNGIlSzLxxkHxgmXUspqFq3z5NvztJjJO8HtqyDc5C8pg==
X-Received: by 2002:a05:6000:2882:b0:427:e1bf:13db with SMTP id ffacd0b85a97d-429aefd0840mr1956977f8f.54.1761735987352;
        Wed, 29 Oct 2025 04:06:27 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952ca979sm26665735f8f.14.2025.10.29.04.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:06:26 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: adjust file entry in MEDIATEK MDP DRIVER
Date: Wed, 29 Oct 2025 12:06:23 +0100
Message-ID: <20251029110623.96661-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 68nOWiMDbYeu3aelHtjpJZfODmdO3eCNaxvs5aOHAhE_1761735988
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_101119_493172_1203C7FA 
X-CRM114-Status: GOOD (  12.36  )
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

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 169ac4bc5bc4 ("dt-bindings: media: Convert MediaTek mt8173-mdp
bindings to DT schema") renames mediatek-mdp.txt to
mediatek,mt8173-mdp.yaml as part of this dt-binding conversion, but misses
to adjust the file entry in MEDIATEK MDP DRIVER.

Adjust the file entry after the conversion.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e428ec79dd24..c094b2fef0fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15881,7 +15881,7 @@ M:	Minghsiu Tsai <minghsiu.tsai@mediatek.com>
 M:	Houlong Wei <houlong.wei@mediatek.com>
 M:	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
 S:	Supported
-F:	Documentation/devicetree/bindings/media/mediatek-mdp.txt
+F:	Documentation/devicetree/bindings/media/mediatek,mt8173-mdp.yaml
 F:	drivers/media/platform/mediatek/mdp/
 F:	drivers/media/platform/mediatek/vpu/
 
-- 
2.51.0


