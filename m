Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC04AC4450F
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 07:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwJxTFnJ5CXL7SNwJ3FzpgAg/ebATche5LLJ2ldkVUg=; b=NqDFRl6un4vu8sxPUACS7rVeNR
	BB+zo/GkCDXMxEOlPbTdpsfwscwGpEeTLkaqk6/aGQ9Y6qRoK3N/WvnzWgjOE8vFwnbTE19yggSA7
	rOuKFJf/kcBEPq1Y8qhYAFE7tqJVkEj+iRI8bdIsQcuZO1IhmmnXVA+sHvhHxVkm4MJM0M6tfimSR
	fmpJ+Z1RMynqBhsEoVCGNTWrA2itQaNxuTOVoePfkA/xp63IwXKUdgd1k/ouAQz8r0kuxeAX+NXFv
	1eZoobNWbqWCDRE5wzbw5qaM/mw4qzBut2C3BO2GsP4m+NIQxO+yvB7cAIpBi2FNfR/sByHfqLH6K
	d/rlCHsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkca1-00000001M3y-2xCH;
	Fri, 17 Jul 2026 07:01:53 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcZy-00000001M2g-0bzr
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 07:01:52 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-51c928bf172so50553531cf.3
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2026 00:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784271709; cv=none;
        d=google.com; s=arc-20260327;
        b=iPkXaHcY9QRsv40Uqbv5IcaYQdMYjdXs3iQKnqOy1s8uwhPAoU2RIevFZkU0b/0aiw
         QjEuSHhLMc+Dqd8zSD+AHtVLICqIg21z+CwDnQEYohcle79BsKIeyuGOL345ifWfnHY0
         wRPOdGXH0uyt/Jw1ry9yPK+5neCJVL8X6YuUPpBP0dlndX5698G1/eK9GUrArWcsWyY4
         aiIKxr9EBkAV9zS08+ixKMbQZ71KPnw8s15LmNpBNuxFZ0TzzLzdulsnCQ9ucap36HIF
         l0Lh/c67S6yE5myShiFH+sKdAroLPv0chLmnZnoMnflAfM8F1849u10WD+2fOqaurzSj
         v2lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RwJxTFnJ5CXL7SNwJ3FzpgAg/ebATche5LLJ2ldkVUg=;
        fh=a0z8pAs7C+Z5u99UupLnemE4mxmgDLKHRzSlQnco8KQ=;
        b=kqGnqi7YfOhTEP976krox7vH5gDht26+NRTkPcnZfCtor82COLFAg/vHNCKeJZHGG6
         2XXaOO4bUTEedB2bYZG7ExMYjQqHTOkG1ew/GMdqgJAMbxkmM3ZHLMewSlPFoBwTQuaa
         3hWL39Ps8lxS3Oz4CHQu8L3G2Pjk3ne5FbBB8nIS9enkhPjfCbDLpFjXpuCaZbWaN5LU
         ouYKfRhDRpCZpejZz0OR6RgGahEmF7JzcTYYF7e6OL5EeLL0mcKCYxuWu0xpS0Q4fdzG
         G11rhdSH9YlLYEAJe72JEdewO9AMpeQ4x8kkUUf0wIYjb01Xvq/XtazPl6YgDdCCd/NT
         bu/g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784271709; x=1784876509; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RwJxTFnJ5CXL7SNwJ3FzpgAg/ebATche5LLJ2ldkVUg=;
        b=mbtPmDy/wQlY/399zTot5WpBM09xF/LvIyBxgnSYtJw7M4ANMz6jxId7mLdlc0tEov
         z/m4vlMleOczOCf0VqCtn88kWo7foUDFyy3fY4oRR69ocyKH/0KIAH/uxgKp9/8pAArc
         EHobTx8nuWFHyfAEjEJhJxT3hTNBNBsZ4SH7l6XMsNXMoYrjzJHAFFl8uKI+bvyHwP1Q
         f6VNcGF7rKgxZLezYV/r/R8rBg5jbubecjrIMVj99Pw+vWY/gBy1WBmT6kBZxyeANQ2e
         PSGMiQFv5fWk+dxmISX5wCEKG1UuTc9fVJh7U0xCddTdJ+q7F76jnR0tQjrlkJSnluI5
         sBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784271709; x=1784876509;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RwJxTFnJ5CXL7SNwJ3FzpgAg/ebATche5LLJ2ldkVUg=;
        b=oAuItGNHo0/UpGwbipfaOndx++oWZ0S8kP7pth8+UHinq6l94+0XEJ0sJZ2HFCfLmh
         0//xSR1UMqgN/bpCSGwfolPpjPrOh6CrlFdxxe3+FJxNGhKSnrALFFa7a6TgF+FeLD62
         JRDyIn5xgf/cRAmsTyCExSKbUbmFENu6NekCLWnsbWtWVq1ks7kcGjQGJKeNAgrqQFXZ
         vOpCnSZzxNXuCGQGcx0zo2+uvF98W/1g0Rur1D51KjsiKOjhHSLNGWS4GSYjS0cPh69n
         DsLtLXYrrwV94ASIAoYRAePQ6sSW+1HJIWnto7Fr4mBpHlltRB90BM4VE9uYTmr6LnDf
         BocA==
X-Forwarded-Encrypted: i=1; AHgh+Rrmx8VNJSHL7Qc4EKhwpV3mrzHAiv0G2ZvcXF+evEnBbikUMJeVabkO34fmhpAAGY+7mccLB6bcYXc4dnt6Tg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjcGteEV2xk0S247yYZ6sN/wWpx+lJ8eCxFXAbACRaGDhQgWk9
	RAtPF2igneOQI8SZMOqGchm743GJA//oxVJRMGffpsKWtd4tX5MarVXhyFeeXABy1tREcEf4nkR
	8ppZgcbUdVlPQX3SRMWdetu9Tp/bXO6U=
X-Gm-Gg: AfdE7cm1j2uiwoK4QOXVXo2fj9yLo/MYzWiHTL5bPiOxOhB/RbrEUENTjoLg7j6dwTZ
	Y2J+n4oQr6JpvqGa5TX9Xj7dIz84cXKOMxytIIAN2G8er1xQbXMWwRpMIHiwld7kDwbdxg8v0eR
	iWI33CKd9thcgkOgHb5IrY2zW/GOYCT7CWPuPRl3Evv98qTJVSvG/W7XDTxKnQJ4y7bxO1VNWoj
	VZPrvPc8L9iSqNQZqUwd/VzFjrKsp4P7y3pOJnvKgo6QMyvKRSp9shSz9U2ctmL
X-Received: by 2002:a05:622a:1307:b0:51c:73f:e3a7 with SMTP id
 d75a77b69052e-5213c9db3f6mr11147141cf.26.1784271708847; Fri, 17 Jul 2026
 00:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260716171733.300885-1-akkun11.open@gmail.com>
In-Reply-To: <20260716171733.300885-1-akkun11.open@gmail.com>
From: Akari Tsuyukusa <akkun11.open@gmail.com>
Date: Fri, 17 Jul 2026 16:01:36 +0900
X-Gm-Features: AUfX_mxBhDopugmTygQCr_ewrvNPScsxhXpSrlqnE3VeMGuqzfUam913liCneCI
Message-ID: <CAKr_iV4=TAKGb829nXWBBiPkQHo7dFyhT41K7+Twv=VjaEypyA@mail.gmail.com>
Subject: Re: [PATCH 0/3] soc: mediatek: pwrap: MT6589 + MT6320 support
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Flora Fu <flora.fu@mediatek.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>
Cc: "open list:MEDIATEK BOARD LEVEL SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>, 
	"open list:MULTIFUNCTION DEVICES (MFD)" <mfd@lists.linux.dev>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_000150_192668_EA3BAE9B 
X-CRM114-Status: UNSURE (   5.00  )
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

[PATCH 3/3] has a bug, I'll fix in v2.
Please ignore this series for now.

Link: https://sashiko.dev/#/patchset/20260716171733.300885-1-akkun11.open@gmail.com?part=3

