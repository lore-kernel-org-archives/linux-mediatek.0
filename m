Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A6BFF60ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Mar 2026 08:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L3TSuB1FbI7lqYJC1uY7y+dtfsWxR+6ey/FSJ/giDGM=; b=mO5ANmnLSim1w6AtF9r5Diap52
	BAYTw+3dPUB0ue9i0NJFTbyA1MdLgDxPg77v5aJGm34vAYo2PzuntXLhBQtnppQ5GJIwM9B/h2ZXH
	kThbeMrJl2+kWeazwl3flaMT5AfFmnmBiaTOKZSlHoosSW4AgxPowKfQpMdTu8UFPuJZCsNW2mQH8
	YwJKxg158CZLasMfxMiODAfiNHHJ8c1nDoF9tYC0NxDNw2O3zkjxsocAMfADCkI5UxNmuoE1p2kb3
	+8cnhFxACAnRVX6S3JEirHCtSFMdYVxgbzoA16bW2PDxy3ipG97yEzcaUHOKPeZmuykHKPumRKXUz
	W2AOphOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Ua8-0000000Cblr-3rmU;
	Tue, 31 Mar 2026 08:36:16 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Ua6-0000000Cbkh-0lfI
	for linux-mediatek@lists.infradead.org;
	Tue, 31 Mar 2026 08:36:15 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-b9c04152730so20114466b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 31 Mar 2026 01:36:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774946172; cv=none;
        d=google.com; s=arc-20240605;
        b=bGetC6jn2FeE3nz/VchqywZo2Rj/7a/zQu/kBJSlzyxPtn3ASyHHyExkg0/mXgOS+l
         5xxV9eZnvNycajKHR41+0xf6aWdc7TocxdEbViXE/XTnc8eGlVFy2SrbocI6GypF8yd+
         KJ/semssmq2WPFQzur5u3Rm6FBRGtitm8wA4PZCu0YHqilmaD5GPkm2fTQ423NnI2nOZ
         110Nm+7kkMpaIvW5PdHUT7FGSgAnteyLqHQFL6c5EVVzCVmDUuSggIcFI0IamPtqNo//
         g1b9CpmyfQWZl6uIhfZ2sRHyqGDuRjXl4gq3a010kTHFVKMNNfMJnc45O6dP4wqkhp+f
         dfXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=L3TSuB1FbI7lqYJC1uY7y+dtfsWxR+6ey/FSJ/giDGM=;
        fh=GnjERHGTrKNS5OMlagvlwxrrFNeBP8RDST4AtVGwIN4=;
        b=id7XR3JjcdxnpTUlKvdoYiHNHhr7gWOpWfy/B/WtwnEsv2q5emd28dGIXDTc39bpjx
         0ZosQ9mKTqjf9RxWTeRn66h6VAfGITkyM0JBFZ009Q4FrAIKYtRU5T5l0Vd1QEA1mcIw
         XcY9fIYTHs83Lvo3rDKDYHNt2WqaP1YXO2gUn67zmDPby84xEyXJXXMjfOvRlCujFnny
         MF35OHFhOD9cpcKjXC7XvoO1nCF6lYx2lWLsdUwgLx4LcYeM2h1waT8v51kwhNyNjx7M
         vU/EKKY1AH+uXB2s78W1tS6u2kBJcL/tJYvBCcljaday0ouvV8Cd5Ym7YUh0AccSOgH4
         yDYA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774946172; x=1775550972; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L3TSuB1FbI7lqYJC1uY7y+dtfsWxR+6ey/FSJ/giDGM=;
        b=K7rIfC/jyOR6qvEEH0xtGp3DPaf5osEmIC53ryprOGXdJwn91oXizrqv4A50rzy0Vj
         VM7S8Z34qngrJWUC7R93HanaAhM2rYrLqe6ZC3JUjH/vF0caFqP8nmvI2m/qZQdXEfsJ
         vUJdfZC0/wTCQsoqbeGE1P+NcY+QJJIBNLuv4V/wUF+7d4i0cyA+OcSOXSbcst8H6FFl
         u/rTALmvDury4fhywAo0ItmQcP+7RJZEtlyoWg2sb+fAruFj57WMKpR4LAeQ1IbVSpol
         8tBvlYdGAgNsQmkXftlJ+KbNTXYUdbZJi5l1302bHuhVssP20vC4fcSkafwecHqmXd1d
         mJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774946172; x=1775550972;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3TSuB1FbI7lqYJC1uY7y+dtfsWxR+6ey/FSJ/giDGM=;
        b=HxBjorjiwcmqkMNTBL8v7Jrn1aqrnT2EybCKcj3UlfYtraKpa+5a1FMZN5SwZ9tvSy
         hRTVxm/XeQXJj4e40471itrsQUPGA48Y/7MbbuRly7cdRbzy7GPuX51ksQxSnJoN3ndK
         giBXRTh19cJn/uU2DGmkOAV4DWLjKEw0PpluoP0/VDy6umqw2aSBslSyci+cMnWhwLhr
         qDqKdzvdSYdZP8oPONhgCR+WTA9BqTxviczSEQD5eQ0tv38ylni/kRFLaDv1dzRbHrgb
         qU8Tn838tlY0+9APQgbs+ocmrNBaY8iQKTzEjdhTy4qCQ/BQ2Ea/iCKFPLMpijlju0SJ
         D+FQ==
X-Gm-Message-State: AOJu0YzHzor+EsUHMP1j9aS6xDgFIlj9xDtYGQrhKWxeTxhjzm+5BnN0
	5oXLhpC8Loz69GDYMSJcJIF9eFKS6F5WU+Bc3Qns0CYWI0eZZRh+zRc6Bm0z+z0S5vDzlER+3JR
	8I/04LIiUVNfwPODB+Nj6MCZCPbs9q2A=
X-Gm-Gg: ATEYQzxg545adTQtl2L7b1FbMmo8FMIIp/Xo/V9bq50wIkoUcYQR5iOm0UKglLXP3Mh
	UD16yYdW1dZYamlhlFfpdSsphF7xUNKfTwE5u2GEnI+6v0h2rsTBYtTQWE9BBgfdIIC3+4p3sCM
	2uFoluQ35yWIy5RjKQkUMeXrARjl7T+cUHMBgkPkMRRy+Q6w8IHCcMlifkx/GBC+IlmrMPb7u8P
	rtZblJGGuIE3a25axCm4F5hitH9zkoARcnXbjIKFEEL/V3ELucln5VnNmdJKhyVQ/YbzU5tc4TY
	Zrm0aw==
X-Received: by 2002:a17:907:da7:b0:b9b:fa57:d5b2 with SMTP id
 a640c23a62f3a-b9bfa57d98amr71812766b.42.1774946171488; Tue, 31 Mar 2026
 01:36:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260330083429.359819-1-l.scorcia@gmail.com> <20260330083429.359819-2-l.scorcia@gmail.com>
 <20260331-flawless-bronze-lorikeet-59a6ff@quoll>
In-Reply-To: <20260331-flawless-bronze-lorikeet-59a6ff@quoll>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Tue, 31 Mar 2026 10:36:00 +0200
X-Gm-Features: AQROBzCHGHvki3QPtgYv0FgcoeVoJGVuIm0WEFEat61ZeqaJ2itNlZb_JB2hAws
Message-ID: <CAORyz2+1bc9Z-opoNqyUU_WFzyXZKGQmR_Ur=4UonOC=AWtQ8w@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>, 
	Val Packett <val@packett.cool>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Julien Massot <julien.massot@collabora.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_013614_244055_B2449A68 
X-CRM114-Status: GOOD (  11.62  )
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

> > -    required:
> > -      - compatible
>
> Not really, this affects existing ABI and might make the child schema
> being applied. Basically regulators node can be anything now.
>
> This is definitely not a binding we want. The syntax for parent schema
> when listing only compatibles is requiring this compatible. You cannot
> have here whatever empty node.

Hi, it felt quite strange to me too, but that's what I thought you
meant with your previous suggestion [1].
To keep the required attribute I would be happy to reintroduce the
compatible here, in the regulator schema and the pmic dtsi.

Before I do that and resubmit, could you please help me understand
what you meant before?

Thank you!

[1] https://lists.infradead.org/pipermail/linux-mediatek/2026-March/105060.html
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com

