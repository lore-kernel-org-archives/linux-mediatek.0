Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E04E7716C
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 03:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwfLitJcijVjn3mYmWjqS2pZ/U3vybZ9MoCggOPZX9Y=; b=gHwdNsoQ5PYIb9Pqxx/hVD1oCj
	f4Tp6NLW/L5m1OFk9xSyZLmzLuWTa+GpiJctuZ8fZCYXUUsT+ZzVF5N4WYTXsWAXMWdK7IIg9y/uQ
	UCAZ+fXDKiDN0I+GM+5nMJlFUZMpruK8R2Vdo9CNpLxOS2jWQm1Kkur1I7ttjwNQYmS6XBUk30tVj
	WwfJcwtrc15CRWPxMOu78bpciRdMRjCPdzobDw7BF2NfW3BSu9s+gFhOaQDQ9Dy3CU26MfJq27qc3
	4vtGSQUgcHVJObiMCfelO5g3XBpM4/dGbIHM6Ct/2Ok5G1YkTAuF2h/CqHBbg54S9tqyP8gT5luT7
	Vcnz753g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ2jt-0000000Efmc-21Lo;
	Thu, 05 Dec 2024 03:41:17 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ2jr-0000000Eflp-0kWa
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Dec 2024 03:41:16 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53df6322ea7so584785e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Dec 2024 19:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733370073; x=1733974873; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JwfLitJcijVjn3mYmWjqS2pZ/U3vybZ9MoCggOPZX9Y=;
        b=Wx29szyl2MgTHmdBVlHOe+9hAZL0jw6u7HW1xy6vUwlH0f7vA3zTTA7LZegNsEGK1B
         Pz0lSUqPk/OjJfM9t1bPeY+BgcCDjNDBSUTVmi0vrbZ2GLgj3+NYCo68JbmsqchvPceb
         iWCd8ZDKGhRaC2pfPKvbOOZKe8rwos/XvmZYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733370073; x=1733974873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JwfLitJcijVjn3mYmWjqS2pZ/U3vybZ9MoCggOPZX9Y=;
        b=DQ2Elzv0mqWp6d6v75qGhXMaSOiKaogIYMKYb2uR2R3Ffo6J+03nPmcH9MtBU2w4rW
         2no5O1rAF1cfEpKREgIxWDdJCCHAVUqlLa909myaAKKoZIBGNjg5Shehmr4TuentRT10
         EOOEc9vWg6jjT1vVzaa1bV9ha+HcLD5dDDVWuSXfForTYTryYmaiJlvG9pndTJV2KfaS
         G2UwKtMq+opDyDfpUKcEtuWfQtz0PRMO4s9j3TQCAFe0UC3Lf1FEBjB7kmlpwWOcAI07
         LAlTUFfOOZUOm/XI5XPhbWceReTvx10OL95zruLIXLeRmi5TiUoRRilrd5w13Ev2qiPq
         EHrw==
X-Forwarded-Encrypted: i=1; AJvYcCWjkHr6nVjI9KYuRw+IZmHWdfcYpr06wc0Am/JEQo4EU9xRpORhtNMrUQFwbON+DUC35vsuj5yzfIUBigZClA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlVnm+VYTWTOP3ztAV+5ynIbRRT2AIJ/Ph2nGvPhZZ3rpGYtvx
	iOg9MuE8/Y7ppqo65+p6eDVGo0YMrW1Nv5mHtno1mkcrnNTGVemZgf91V0X0ViWoE0MZd7FdY0d
	L9nJaLZqaJSN+HH9ugaP3r1cZ5ySapg6QdFSV
X-Gm-Gg: ASbGncsM3YWxtDo0NZyLnPP19o5sOl9huuYSMYjbq1+wNEQMmOSeyvf0dSFaHvuzzUt
	bdILN9UD72i8GCCdkNhXLQaD6g/4SfyD405LcsXs1tYmKP/ACK6ZPA3KCI3Y=
X-Google-Smtp-Source: AGHT+IHqgDnUkKGPY8hz6ukhVqJstOuAN0fggL2+fodGywtVNADNTkDdluEMvlUwqS+eqw7nTOCdm7Cyv8kDB7dlMcU=
X-Received: by 2002:a05:6512:2822:b0:53e:228a:85b with SMTP id
 2adb3069b0e04-53e228a0a02mr191564e87.11.1733370073161; Wed, 04 Dec 2024
 19:41:13 -0800 (PST)
MIME-Version: 1.0
References: <20241204092855.1365638-1-wenst@chromium.org> <20241204092855.1365638-2-wenst@chromium.org>
 <4762E5F1-59F2-40D1-9D22-724107623AAB@public-files.de>
In-Reply-To: <4762E5F1-59F2-40D1-9D22-724107623AAB@public-files.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 5 Dec 2024 11:41:01 +0800
Message-ID: <CAGXv+5EYf9-r88nv7zDo8JFGhMFyzVPU1gBNwkETvGTp+27q0g@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: mmc: mtk-sd: Document compatibles that
 need two register ranges
To: frank-w@public-files.de
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	Andy-ld Lu <andy-ld.lu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_194115_250962_0D02FBDC 
X-CRM114-Status: GOOD (  16.99  )
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

On Wed, Dec 4, 2024 at 6:38=E2=80=AFPM Frank Wunderlich <frank-w@public-fil=
es.de> wrote:
>
> Am 4. Dezember 2024 10:28:52 MEZ schrieb Chen-Yu Tsai <wenst@chromium.org=
>:
> >Besides the MT8183's MMC controller and all its compatible derivatives,
> >the recently added MT7986 and MT8196 also require two register ranges.
> >This is based on the actual device trees.
>
> Hi
>
> Mt7988 is similar to mt7986 (only using different clock settings) and usi=
ng 2 reg too.
>
> Currently there is no mmc node in mt7988 dts (i currently upstreaming it)=
 so i guess this is why you have not yet noticed it.
>
> See this for more:
>
> https://patchwork.kernel.org/project/linux-mediatek/patch/20241202122602.=
30734-3-linux@fw-web.de/

I think I noticed it at the beginning, but it then slipped my mind. I
might have gotten it mixed up with mt7986.

> Maybe you can add mt7988 compatible here too in v2.

Will do.

Thanks
ChenYu

> Regards Frank
>
> >Properly enforce this in the binding.
> >
> >Fixes: 4a8bd2b07d88 ("dt-bindings: mmc: mtk-sd: Add mt7988 SoC")
> >Fixes: 58927c9dc4ab ("dt-bindings: mmc: mtk-sd: Add support for MT8196")
> >Cc: Frank Wunderlich <frank-w@public-files.de>
> >Cc: Andy-ld Lu <andy-ld.lu@mediatek.com>
> >Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >---
> > Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 9 ++++++++-
> > 1 file changed, 8 insertions(+), 1 deletion(-)
> >
> >diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documen=
tation/devicetree/bindings/mmc/mtk-sd.yaml
> >index f86ebd81f5a5..9ea035928563 100644
> >--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> >+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> >@@ -235,11 +235,18 @@ allOf:
> >       properties:
> >         compatible:
> >           contains:
> >-            const: mediatek,mt8183-mmc
> >+            enum:
> >+              - mediatek,mt7986-mmc
> >+              - mediatek,mt8183-mmc
> >+              - mediatek,mt8196-mmc
> >     then:
> >       properties:
> >         reg:
> >           minItems: 2
> >+    else:
> >+      properties:
> >+        reg:
> >+          maxItems: 1
> >
> >   - if:
> >       properties:
>
>
> regards Frank

