Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FEEBC5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Mar 2024 12:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ijb2gxhRGvvDemszB0iKKbEUydAmxQLT7IfyPK092GM=; b=tIlQD6S/1RcWcG0tcvlfiJD9T+
	CR48Q3z5p9Rb/JNQMFfS9gh16B+2oDg7agKlTJz3q2tUcpiAShBV87qUOcPyw+8YrAtc0aedCLAub
	3J2hjhr63axS3GIx8ItWrS+o9O/XqgskaEmq9gX3AWcuncVkOmdrKcaAJAvghKxvNXgvuZlTCY82U
	rZk1HD0/msHypuiInEOHU+Eg5VI6K4cgETkU1MHlMvaqc/QRNhjwOaSG6WtRmH/7gVBsTob8JEkUg
	QzBTBhhbWMpaG1IkEBVmkQWDY7sFrUaLuO9PpiWnuhgNPvC6YFZ3drVLyaMbjmZ16PWXyXt/Z3j1v
	/jGKp4eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg1yd-000000009dB-2Jj2;
	Fri, 01 Mar 2024 12:26:59 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rg1ya-000000009cK-3e5P
	for linux-mediatek@lists.infradead.org;
	Fri, 01 Mar 2024 12:26:58 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5132cf9167fso946327e87.3
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Mar 2024 04:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709296014; x=1709900814; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ijb2gxhRGvvDemszB0iKKbEUydAmxQLT7IfyPK092GM=;
        b=KtU+WcqruS7zepcpCK9+Odfsq60vVe1RDb4viAvn8NZ3uxaQ1YXBe1AmLh3X+q5nXP
         cslrpBeCO0Ao9dQfCd9m3b1yk4dExSQNzrPw9VATT68s76Ut22s5kPMnQoPMbRIVG27K
         n8/bVkFOmO7fwnWMDA7Qe+fDsW0HSCuECyt8ZZmORAfhdIViTXTFh50Nqd+gGVPHLMgX
         hA9Xj2wzzvpjeYp5TuFXnyXHmA3NaAI5JC+d30gjiK+0oR/+eTqPufnu+P3BFkYrLlcA
         ujT+OPJhrTrx56P4IHimzT9WMS6cn03OYNyRBxR2Fu21TPLBnKwZfx/8SLMi+hTubIFN
         9n6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709296014; x=1709900814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ijb2gxhRGvvDemszB0iKKbEUydAmxQLT7IfyPK092GM=;
        b=n5d7i3XNeS7JXWcvc1V7swJoDPJHoqtTIkFTZzSj0kN8LZbWy1qxv1uSy8EFBSXkpR
         asimsPBfFVAsM/crgKL/owEeZ7C5QonXG1REbV6knY8Q9tG9izPyep9adrqrkM7gsz+I
         ljYr1MFdo+YshWH8CG/D53T/sR7P2w4bY9NY8ebKM+JJ6nDgU4cFasxahpqCaTzxwKcg
         nIfwEF4fBhn5C3o4Duu9OfTum9SjWODFOC7PubLIicc79GsDDWhF8ndPLYB9WznNgDhW
         L0trVRSvbtxE9txQzdXvCiYzlGh4lKh3TWMI6mN3ep/sFTT8B1Ld5GU0BTHsPrE9KRCF
         0iuw==
X-Gm-Message-State: AOJu0YyQaMk66YFKNbajD9tHWER0xMMc0I6Je6v+OlhINYXc874rinRK
	dXEKZM5KFkZTojVqa+0Wap1wkZE/Tq5axTIWD+FhveG4VPWP+s0OZVXagIIftgploa8vDiYWde/
	fTeNIhgIRmABIzS5Po39k+iyx3Gw=
X-Google-Smtp-Source: AGHT+IG2RGrjFOs35iH02ed/B0T0m49GrTC5eJc5sufpfzY0wtl/LTaRW1TPFH6b+sqjYH0NzDvuTRWcAOCv6ixZhKg=
X-Received: by 2002:a19:910c:0:b0:513:2e6a:893a with SMTP id
 t12-20020a19910c000000b005132e6a893amr1011475lfd.38.1709296013945; Fri, 01
 Mar 2024 04:26:53 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Fri, 1 Mar 2024 13:26:42 +0100
Message-ID: <CACna6rwNdQcJQLjM25J+pTv1kNQ1y8GqPo7eAwq6ky8x-5D-BA@mail.gmail.com>
Subject: Request for reviewing MT2701 / MT7622 AFE clocks (audio_mrgif_pd)
To: Ryder Lee <ryder.lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek <linux-mediatek@lists.infradead.org>, 
	Daniel Golle <daniel@makrotopia.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_042656_936863_4BDFBDE8 
X-CRM114-Status: UNSURE (   7.80  )
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

Hi,

I wanted to ask for some help regarding AFE binding.

According to the mediatek,mt2701-audio.yaml the last AFE clock should
be "audio_mrgif_pd" ("audio merge interface pd"). That clock is
missing in the mt7622.dtsi.

There is no Linux driver for that AFE (or I didn't find it) so I can't
verify if that clock is needed.

Could you verify that and ideally send a Documentation / arch PATCH
maybe? I'd really appreciate that.

--=20
Rafa=C5=82

