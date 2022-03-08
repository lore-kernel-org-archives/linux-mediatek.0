Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03FFC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 11:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5gVlN2u2dJZ8GjJ84Fig+qZnmyKrvITqdCWPwsUTMy8=; b=JArL5ARp7gVIc1
	aCZ7WLOc/4N+qqHy6aNrBiPC6ewXsetFPZtLInZOEESjnjVH0WkhCThhe0VNMgEo4jFRmq+M2Ssop
	t91+ydIO5AhNhCGrwsoLsYvNpyRKnrupFqlleeHSqzJFRd4N33qsI08be5nlVc3YvrOosUKpzJYg6
	KJEVtJ/peFFRienv+kvOaIg9GYsrU9PMWt+VqcYhMe4Rg3hKhs7izyczm6KC5LrRkOyOP8ZHRJwVt
	22L5LheQGk9oZ5b2+pRMlqoQDGwJmuL6TNPJ/sLCeJEKw6IeAPDEo39zYgs7JQTssISbp3RisVjIv
	aCS1sqZ3WXETQlqtdWDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRY01-00490M-3Q; Tue, 08 Mar 2022 11:27:29 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRXzR-0048kd-Qy; Tue, 08 Mar 2022 11:26:55 +0000
Received: by mail-wm1-x32a.google.com with SMTP id
 n31-20020a05600c3b9f00b003898fc06f1eso1202804wms.1; 
 Tue, 08 Mar 2022 03:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=oUGbKpyqaCA2lCo6XjUtMOfHtbuoF0WQ8BNTKgdnnC4=;
 b=O97GZllgNql+6jG2sVdKquf4hAQ98Q3UPAp3d4uyEU/cl9pgKfhlLsSyrryN9WHySq
 FcbdvyQg7WXXhBOU4lLcPRfGQkciOHE27HzrKbfY0TnDDOIlGvcRXXZGdCp12/oVXSc7
 JpJADbtGAp5dl3YcLrD0oM0RwqxDhuU78ttplK/6tV7G1JZLH/wEHD51nPuNxKp79toD
 g5/FwL20+dltcuz8woBQ/9qbRUD4dR7f73jn6DHAt7aIqesDn3v2GWTlAELJaZ2XzPIV
 8lFn4Yd/pFPf3CR56jjSCK5T7aXk3VDdlWgiVYNaVO7NR8zFLvByB+PgrXtshfeyDZEy
 jVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=oUGbKpyqaCA2lCo6XjUtMOfHtbuoF0WQ8BNTKgdnnC4=;
 b=7Kkgehrp9qXLum3xHyo7bRJ7D+J4YLW7brLWNQa6s1eos2zNaghTtwRL3hbHezPMRM
 RcpU4tuEFD8EzTS8pRu7xuGyV4DaUUyyG63xaskD9Oy6019cq6r5ABY3r6lE9ENKSL8+
 ce4vDFtGjc98uqp/gu+CzmA0IJMdBrvbV1BdRQRw5HAoY6G4uW12lBwNJCWMKA4RPkTn
 VIpc9SBf0lMb0YvpU5sb3QszKJMoQ6Usw6UsJ8L8duL3aeL2PvtSKSAFxcFFzS2uSBQd
 S1k3V/MOg7A4pHQd2/rOazzFk1O7asdIm71cBp7VQq++S3lSp8Cp+tubIOjl8pt/udpg
 o6qg==
X-Gm-Message-State: AOAM5323W+BHYD2xv0dLiY8RrouM9zWxJPTefCCyV43eT1zO+DU7+IaF
 3GiJJVSSlxxDBSAtGMczUUs=
X-Google-Smtp-Source: ABdhPJzO7+HQKorna2n6eyt+kiKIZsP6vwIUDvvQdcH7sAyPNFz0ZKI7kb8KQwQRv6eAcMn6tj2Utg==
X-Received: by 2002:a7b:c3d5:0:b0:389:a49f:c7e6 with SMTP id
 t21-20020a7bc3d5000000b00389a49fc7e6mr3155985wmj.99.1646738811975; 
 Tue, 08 Mar 2022 03:26:51 -0800 (PST)
Received: from felia.fritz.box
 (200116b82626c9000cc91df728b27ead.dip.versatel-1u1.de.
 [2001:16b8:2626:c900:cc9:1df7:28b2:7ead])
 by smtp.gmail.com with ESMTPSA id
 o11-20020adf9d4b000000b001f0077ea337sm14141215wre.22.2022.03.08.03.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:26:51 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: Rick Chang <rick.chang@mediatek.com>, Bin Liu <bin.liu@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH 2/2] MAINTAINERS: rectify entry for MEDIATEK MEDIA DRIVER
Date: Tue,  8 Mar 2022 12:26:30 +0100
Message-Id: <20220308112630.546-3-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220308112630.546-1-lukas.bulwahn@gmail.com>
References: <20220308112630.546-1-lukas.bulwahn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_032653_900925_A1D49090 
X-CRM114-Status: GOOD (  12.45  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Commit 9cdd70ceb6fa ("media: dt-bindings: media: mtk-vcodec: Separate video
encoder and decoder dt-bindings") converts and splits mediatek-vcodec.txt
to mediatek,vcodec-{de,en}coder.yaml, but missed to adjust its reference
in MAINTAINERS.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

Repair this file reference in MEDIATEK MEDIA DRIVER.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe3feca0b7c6..38cdf9aadfe4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12353,7 +12353,7 @@ MEDIATEK MEDIA DRIVER
 M:	Tiffany Lin <tiffany.lin@mediatek.com>
 M:	Andrew-CT Chen <andrew-ct.chen@mediatek.com>
 S:	Supported
-F:	Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+F:	Documentation/devicetree/bindings/media/mediatek,vcodec*.yaml
 F:	Documentation/devicetree/bindings/media/mediatek-vpu.txt
 F:	drivers/media/platform/mtk-vcodec/
 F:	drivers/media/platform/mtk-vpu/
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
