Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78DF1C7EE2D
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Feb 2023 10:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OeexrnsfKxBTOcA3D+ZUlVNtFgpihCGwKRrGZjNCkaw=; b=ktCCIKQ4yo5283tWM0RXYwLI1j
	S1ApSRyr4Ur9aIs3vlNsUfTKR7P6S7iqxihTY/dtLyTmrhWhhzYXlpXf9D3S7Yz3eU1xvWiVh7tQ6
	FbDOdMRPLQeh6I+bnHK+WOMvdYIJAX/7YVxy5+kWL7B7S8qOgsrUlNjQPo4Xsxx20U+m9sPZeANwg
	d4n6z0Z5umG7FnJQMj/nMNuzl3QkauLWfAsbCVOPpS/v08i315h8PZF9jn2l+SwsZvOUhpNlRF0/H
	3kY6RisBJfd2XiX7MJcoZJ7TGW325DZl+SDLJ6YaEtbNNK3yC9kMcIwkgY5DTEkYdEuQQn1IgIDeg
	IsPPqTJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVrc5-005Sbi-A0; Sat, 25 Feb 2023 10:17:09 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVrbs-005SZo-2E; Sat, 25 Feb 2023 10:16:57 +0000
Received: by mail-ed1-x532.google.com with SMTP id h16so6814196edz.10;
        Sat, 25 Feb 2023 02:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OeexrnsfKxBTOcA3D+ZUlVNtFgpihCGwKRrGZjNCkaw=;
        b=F98gOqKA63kr7GmsTaWBWi5PM3SAB8AWAbyro5aCO9RUNXdNP39BrJ6RvMjHX48f/T
         cGpD/BGJQgEzyNkdSShz5MpQTmBdyqimqcYitvgGchaefFJlf3oXSjRdtquf+kxixgaJ
         wU4smkyQIcu8dGFsnaIOxk+kEQ4o+MIiORfk6gMxZgpTZzOqjMkkxW0Lr5Wk/vYDgMdU
         Z4rH3wk1qCI+Ul8R/TOYw6kIBgqTIhWLfeFBAHlZ1EQ28QmeADsQvpuSBNW2Zcrvun6O
         B26GM3EGlrjck8ZXlYFZJHzndHXisj5rvLoucx15SrTVGf0WcoNIl76G4C17K+aBaQkV
         2G9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OeexrnsfKxBTOcA3D+ZUlVNtFgpihCGwKRrGZjNCkaw=;
        b=UKOWypvkJzgn/TGvuSj08ISjwOX0VdTMkYlERHtuQjeqrZhIJkghGKMtK9hGMDmMFf
         g/wlyFSxvlkKXuqb7EqPs47UOq3r/RR7PT1TnZ8v7shLWRTdLJ00gnPt9w8k9WncpqSF
         1ez45JuutTFirQy0aX0oK2gEJHszQ7ZOrR8XoVeHFdRswADLSzkHtnKC7DiSjbvlI0Vc
         9xGp9pb8i6+77GftMMIgYwzaOCpbvIcP9cdsMThxeeWzKL9fqMoKSeb1AVg1RlwnyjGH
         jio2MvVT7DH0/yTn55qJs7OxUBQNq+9MZruhhghelHc927aO6K3IbQZXWhnVD2UZrKNr
         054w==
X-Gm-Message-State: AO0yUKX8uF90j/783UvYvHWImoFlf0AGSSRN2MEJLDxBJQS47F6ym+00
	B3uKuHTuTPq2CnuJ7ojkNbQ=
X-Google-Smtp-Source: AK7set9JHaSiK3fqBZ0S6nmtza14LUX52Pe5rBY4sov4MPAXb2H6EhECHy+481qsmKKbgIL/iKTCcA==
X-Received: by 2002:a50:fa96:0:b0:4af:8247:273 with SMTP id w22-20020a50fa96000000b004af82470273mr3697503edr.7.1677320214580;
        Sat, 25 Feb 2023 02:16:54 -0800 (PST)
Received: from localhost.localdomain ([95.183.227.97])
        by smtp.gmail.com with ESMTPSA id y23-20020a50ce17000000b004af6163f845sm677722edi.28.2023.02.25.02.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 02:16:54 -0800 (PST)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/3] MediaTek MT6735 SCPSYS support
Date: Sat, 25 Feb 2023 13:16:26 +0300
Message-Id: <20230225101629.264206-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230225_021656_130956_066BE85E 
X-CRM114-Status: GOOD (  10.73  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

These patches are part of a larger effort to support the MT6735 SoC family in
mainline Linux. More patches (unsent or sent and pending review or revision)
can be found here[1].

This series adds support for most SCPSYS power domains on MT6735. See patches
for details.

[1] https://gitlab.com/mt6735-mainline/linux/-/commits/mt6735-staging

Yassine Oudjana (3):
  dt-bindings: power: Add bindings for MediaTek MT6735
  dt-bindings: soc: mediatek: scpsys: Document MT6735 SCPSYS compatible
    string
  soc: mediatek: scpsys: Add support for MT6735

 .../bindings/soc/mediatek/scpsys.txt          |  2 +
 drivers/soc/mediatek/mtk-scpsys.c             | 84 +++++++++++++++++++
 .../power/mediatek,mt6735-scpsys.h            | 14 ++++
 3 files changed, 100 insertions(+)
 create mode 100644 include/dt-bindings/power/mediatek,mt6735-scpsys.h

-- 
2.39.2


