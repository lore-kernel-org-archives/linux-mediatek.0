Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3167CC5B543
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 May 2025 17:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAMcET+cuuKL0RWwCyWMytv8F9RmoUjag07rOTeO4/A=; b=1Ft12Z7MsNg26DK0OVN7AHq9Ah
	uM37qagl/HHmOQZ+oN9H8aL3iQjGi5JcC5KX3rCEK8/84LxIXDMJbSOWVqELUwrhTF5N8VyRkc4Dx
	HLrzSuCPCz7rIBFoQ0WFceTanVyn73Ytyfgi+JtFlsqfwjd2PfV3KmembJirls8DxxJIf77fxDd8v
	N+sDKSH2gncvs3hq1XzGUCCXrKWhXG2LN5MHF9tP6yvi6z/6J3qovwu4rrqSazNWfSlwBTlFk33U/
	5aeD3z8mb8Ysw9mRAhZZZSeCeUmhuSSlWsSbAO+gqc/k18ijjkhvGFM/0uzNpwq9774bfpqnpITeE
	GthTJeAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL3sI-00000001SFo-0vHW;
	Fri, 30 May 2025 17:50:34 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL3nr-00000001R1k-199d
	for linux-mediatek@lists.infradead.org;
	Fri, 30 May 2025 17:46:00 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-4079f80ff0fso177859b6e.1
        for <linux-mediatek@lists.infradead.org>; Fri, 30 May 2025 10:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748627158; x=1749231958; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gAMcET+cuuKL0RWwCyWMytv8F9RmoUjag07rOTeO4/A=;
        b=PEtO+Kc5ZhK/LlhLaHN/QdxL48Fk/n5VlnCMvtOWcWjVwMP7BKwq1GnUd4ZMnO/+gt
         Bi7WwW7Q5gUtX7Rw2/TwPDHvIxXsSVVC5QTBxT73ZUYq3Ry4UqveFlMFrbBTNlMQXzpZ
         /9jiRMjQ4wBsoaPU84lUwlQdgjy7j9yaEDya63Bfo9O0x4Cw/7NArCrnUAJALSrvjDrO
         Qpj2ZncXzVjb5KRR3Sj1/A0pa9x1437vR6fBm4puYloVxQQIij3/npXS5WgfQ2WUiKqV
         kkmOP+MLoxwefVtgtfjmrY4+0SBS1OXD+yWgoDmC+lEgqXHO+F20Fy9G8rLtAJDO6knz
         lrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748627158; x=1749231958;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gAMcET+cuuKL0RWwCyWMytv8F9RmoUjag07rOTeO4/A=;
        b=rK2knFTxpjZwDrDfynEI1MacDf30zGsOHYbf5Jptq1ozppycwteSv06iI183TmgrAv
         5jUZcT3VUi+cMrTP4uBLzuqwyUmO7q/NJbq7/FGmShjbRt/sWlxrvAM27X+SgmQg54ra
         +OTMQsWhInC47DrBS0EpXLiMN1wqcpRb+GXLcIYJSzGxTFEwCsqxuGjXxT9eMqMIIIbR
         sZflv/Ke+M1Nm5/G5nwKFXO3BUlL5oI7SLMeQl7xOqzHF/AKWcN2UoqQJHjLiCM7xpVR
         t7EwWAfZUerbmS/QFb9lPEEqm1D47hZjhKT4W7V1ItK9o7QBipJkW1pcNB2OxnXIHw8n
         njnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWbMUVJvKORbnxn+658d1j9RDVqCEV2ihOID+2uEPDcRBS/0lY6BUC7TDpGRdJMfWNQCckeXeFUWhSsYq7WuQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz51LgsXhCwiZxmjM0fiYquC7ddp0CFZXneak1/qqjXMJatLZN6
	9uolzYYx6X3GmRJYClYMAQlcNhAEEweq777Tep/0QLqFewIVtC2SqCc1UsRLRxZi8F+ukdwr9k0
	MjApFfSs=
X-Gm-Gg: ASbGncuTJgFOIi6kX9LicVZJ/tTR2BNaMpfhHuMy4U5hNcaupx1N+LDnEOROfku96+t
	qqis5T3BHxw3e66+rIHKSCnelh06Xjx4HYUxgWhkpX2nQ5JmsgAzRiiVcqOeGovABJx1S1QUc3r
	HGTjjZYAxj2i5y450EXJLVdSVJaMs+nCAtusmL60fHMf1dNzbG/rQNO+NhYIaueeE3Hj7CV6sNZ
	3QTboSLlsr6X3ioxFsH050bA602nmzyiEMgVF/PNRZVB+b/uJFpoyEXm8ZQdo7f0rxo07XsTEyh
	R35Lw6njYLTE2U9F0vlIBq5QRreVxAIkaWL/wPjaOjvPk4BXOl5osnHoZHq+mJc+BmM=
X-Google-Smtp-Source: AGHT+IHyl1e3Yym/gxdy5g4CfoGGquz0lE1x+UxDToQUNLQVwUIPOg1TJW9EOWFrIUF4GMcwRcWJcA==
X-Received: by 2002:a05:622a:514e:b0:4a4:3f16:c2e4 with SMTP id d75a77b69052e-4a4409b955dmr70951691cf.15.1748627147504;
        Fri, 30 May 2025 10:45:47 -0700 (PDT)
Received: from ?IPv6:2606:6d00:10:5285::5ac? ([2606:6d00:10:5285::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a435767a5csm23220391cf.10.2025.05.30.10.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:45:47 -0700 (PDT)
Message-ID: <23ace820d130e5d18c599d29e960652be49e1457.camel@ndufresne.ca>
Subject: Re: [PATCH v5 00/12] Enable jpeg enc & dec multi-hardwares for
 MT8196
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>,  Mauro Carvalho Chehab	 <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: srv_heupstream@mediatek.com
Date: Fri, 30 May 2025 13:45:46 -0400
In-Reply-To: <20250530074537.26338-1-kyrie.wu@mediatek.com>
References: <20250530074537.26338-1-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_104559_315731_B1459CB4 
X-CRM114-Status: GOOD (  16.35  )
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

Hi,

Le vendredi 30 mai 2025 =C3=A0 15:45 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> This series adds support for mt8196 multi-hardwares jpeg enc & dec,
> by first adding mt8196 jpegdec and jpegenc compatible to install
> kernel driver. Add smmu setting to support smmu and iommu at the
> same time.
> Secondly refactor buffer and clock setting to support multi-hw jpeg
> working.
> Lastly, fix some bugs, including resolution change handleing, stop
> streaming sw flow and others.
>=20
> This series has been tested with MT8196 tast test.
> Encoding and decoding worked for this chip.
>=20
> Patches 1-3 Adds jpeg encoder and decoder compatible.
> Patches 4 add jpeg smmu sid setting.
> Patches 5 fix jpeg hw count setting to support different chips.
> Patches 6 refactor jpeg buffer payload setting to handle buffer
> size bug while resolution changed.
> Patches 7 reconstruct jpeg dst buffer layout.
> Patches 8 fix multi-core stop streaming flow
> Patches 9 refactor multi-core clk suspend/resume setting
> Patches 10 fix decoding buffer number setting timing issue
> Patches 11 refactor decoding resolution change operation
> Patches 12 fix remove buffer operation

Just general comment, you built your patchset up-side-down. Start
with the fixes of things that was already broken, then do your multi-core
support refactoring, and only then add MT8196. Looking for a v6 with
a re-organization of the set.

Nicolas

>=20
> ---
> This series patches dependent on:
> [1]
> https://patchwork.linuxtv.org/project/linux-media/patch/20250424090824.53=
09-1-jianhua.lin@mediatek.com/
>=20
> Changes compared with v4:
> --fix kernel robot build errors for patch 4.
> --add reviewer for patch 1 and patch 2.
>=20
> Changes compared with v3:
> --change patch subject of jpeg encoder and decoder compatible.
>=20
> Changes compared with v2:
> --refactor smmu sid setting function interface
> --Some modifications for patch v2's review comments.
>=20
> Changes compared with v1:
> --refine jpeg dt-bindings for MT8196
> --optimize software code to manage jpeg HW count
> --refactor smmu sid setting function interface
> --Some modifications for patch v1's review comments.
>=20
> Kyrie Wu (12):
> =C2=A0 media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgdec
> =C2=A0=C2=A0=C2=A0 compatible
> =C2=A0 media: dt-bindings: mediatek,jpeg: Add mediatek, mt8196-jpgenc
> =C2=A0=C2=A0=C2=A0 compatible
> =C2=A0 media: mediatek: jpeg: add jpeg compatible
> =C2=A0 media: mediatek: jpeg: add jpeg smmu sid setting
> =C2=A0 media: mediatek: jpeg: fix jpeg hw count setting
> =C2=A0 media: mediatek: jpeg: refactor jpeg buffer payload setting
> =C2=A0 media: mediatek: jpeg: refactor jpeg dst buffer layout
> =C2=A0 media: mediatek: jpeg: fix stop streaming flow for multi-core
> =C2=A0 media: mediatek: jpeg: refactor multi-core clk suspend and resume
> =C2=A0=C2=A0=C2=A0 setting
> =C2=A0 media: mediatek: jpeg: fix decoding buffer number setting timing i=
ssue
> =C2=A0 media: mediatek: jpeg: refactor decoding resolution change operati=
on
> =C2=A0 media: mediatek: jpeg: fix remove buffer operation for multi-core
>=20
> =C2=A0.../media/mediatek,mt8195-jpegdec.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A0.../media/mediatek,mt8195-jpegenc.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.c=C2=A0=C2=A0=C2=A0 | 169 =
+++++++++++++-----
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_core.h=C2=A0=C2=A0=C2=A0 |=C2=
=A0 21 ++-
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c=C2=A0 | 112 ++++++++++=
+-
> =C2=A0.../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c=C2=A0 | 112 ++++++++++=
+-
> =C2=A06 files changed, 377 insertions(+), 53 deletions(-)

