Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8DFFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 11:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EIRqWmw0pd2pynfGEMu8Ju7QvcZZqGZUOdf9yesUv80=; b=SitSWxlqaU372K
	9wpc5VyAy/SniLuyWSco/9AAoBsh8YYNOv0WFZOpsE0xOVoUqgy8/f9ouUQQfVSgR0z8EADY5GPut
	MMbULvBHUv6JiOn4ilnWWgs6lO+rXsIoqdLrYg7Arqzybd8/BWE6A2iCm3kCv955qPIGmLwPe2JKz
	FCz0slwfL29HWHURIoXtJ0UG4teHJ5mr9RFTLrVoQ2fz60YU16SNvxk5KPTjz/0GMba+rNU8m4Ykt
	zwnZ1DCp8JOu7D8YZ3ZVTGDJDRvFblQQbImQErmbJm6yY0IH8MxCTq/bGAs0LFsfWy7MT2qWdI2Y2
	BYsa/XSXtJ4Ic1swN0wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRXzo-0048ug-4N; Tue, 08 Mar 2022 11:27:16 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRXzO-0048it-Eo; Tue, 08 Mar 2022 11:26:51 +0000
Received: by mail-wm1-x335.google.com with SMTP id c192so10930085wma.4;
 Tue, 08 Mar 2022 03:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cIWJ050d21bkpZ3eybYb0e61vkw3HZkkX+6msnmx6MU=;
 b=HHK3bdFpL7gIdoKyh9VaCVqO9lSGR43eZqTPcjtpYElw8sjemly5wGs6/jIqFTd8qK
 JjsftYTLai7Tjcd9e/ZIzWzERD0f48sQBImnhiiQpiSNJ1rlWwmgMlg3Qz+bFgs0qSRT
 HLzj/qSjSNM7UXdz1Kp3AqHYo0/MCKnZmDPaTXwv5QAFs8QtBRbWKUvj/FI2caDLJgGs
 W3xBZFRTBjz4UJdJIAzuJZ5x1mZfXrYSns2A/ORoNWBh824rOoPLcy4aY+NR+wSbun20
 94rkJ85Z3BYG4m+OV1/MMGgNtwPgY6EkNmaFyhILsYpT9wXQHAoAOBNZL9vjBqVNExZl
 yPOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cIWJ050d21bkpZ3eybYb0e61vkw3HZkkX+6msnmx6MU=;
 b=0+AmybUlnLQ18b1uZIXA2k80DIOHBwRwaIuX9Z8cQIPR04h67OK7Ec8CMJe1GSQpOG
 tJQSPUoqww2jRPV5qdre/FLL9yvJZZNam2z1nvt/l07FXBkwrF4x8lXhFXOxJuoJk/1l
 ToIhHy1qMlyR8+flqWNoFo/vzyC6a8MicFC7T5Pu0GffbAYlG9Ws0DifO5DrFAchJJU2
 KgMjulZRmk+wxyr5xq8Li46Dg13lLmXPJk5fCcr0RvQV3LGSWoEIFH1Y5tXAwXV6l0kZ
 ngvdTf+lsnlR2VyAMvqP/DNyfXFt5mVnGpT5MYq+5nKCWpDjIR0aiyFv2Jq9NKliWQ6P
 C6pw==
X-Gm-Message-State: AOAM532iMdJH1ha5Rbfhw0MXk5RtPVkk1dSI9JbbFs7uLPXjgjxhKAUP
 6qA8VmdZfxF0IJ2kEqhvpow=
X-Google-Smtp-Source: ABdhPJxx/EbY/Bm+Wp1ucslvnvQT5h2VqklVg6iZBDmXp/1ZZkznDRLtCRcNaJvKmfqH/A4PP/LLkg==
X-Received: by 2002:a1c:2bc3:0:b0:381:3dd5:5707 with SMTP id
 r186-20020a1c2bc3000000b003813dd55707mr3010118wmr.31.1646738808387; 
 Tue, 08 Mar 2022 03:26:48 -0800 (PST)
Received: from felia.fritz.box
 (200116b82626c9000cc91df728b27ead.dip.versatel-1u1.de.
 [2001:16b8:2626:c900:cc9:1df7:28b2:7ead])
 by smtp.gmail.com with ESMTPSA id
 o11-20020adf9d4b000000b001f0077ea337sm14141215wre.22.2022.03.08.03.26.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 03:26:48 -0800 (PST)
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
Subject: [PATCH 1/2] MAINTAINERS: refurbish MEDIATEK JPEG DRIVER section
Date: Tue,  8 Mar 2022 12:26:29 +0100
Message-Id: <20220308112630.546-2-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220308112630.546-1-lukas.bulwahn@gmail.com>
References: <20220308112630.546-1-lukas.bulwahn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_032650_541336_7F32B213 
X-CRM114-Status: GOOD (  13.07  )
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

Commit a16ce2f33732 ("media: dt-bindings: mediatek: convert mtk jpeg
decoder/encoder to yaml") converts mediatek-jpeg-decoder.txt to yaml, but
missed to adjust its reference in MAINTAINERS.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about a
broken reference.

While touching this section, generalize the file entry to also cover the
encoder yaml devicetree, as the driver directory also includes the encoder.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 80e5867b2afa..fe3feca0b7c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12337,7 +12337,7 @@ MEDIATEK JPEG DRIVER
 M:	Rick Chang <rick.chang@mediatek.com>
 M:	Bin Liu <bin.liu@mediatek.com>
 S:	Supported
-F:	Documentation/devicetree/bindings/media/mediatek-jpeg-decoder.txt
+F:	Documentation/devicetree/bindings/media/mediatek-jpeg-*.yaml
 F:	drivers/media/platform/mtk-jpeg/
 
 MEDIATEK MDP DRIVER
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
