Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64DFEE2084
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Feb 2026 11:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qYdH/hNC/UeCB6NgJcX7BWXr9w94Q515Os8NJ0f+PW8=; b=GwqkmGrx8CCshKbRMx4jjxYUKP
	1eyA5WE2WVmhOd0BnTvcP2zN/81YudNxx+cS9wj0nURRj3yCNcHdNriVp+6jrkLRm2AR0/B47u8Ub
	hpUaS7tCTSqLCvkTL99AJ2HkcvOdLwf5/+GuOzkIG29P0+L8YLwl/Bdogk/c+PP7yx0cSxCKEkUgH
	V+E7gpGFZEFjnazD+eYwwupMEQqrRNUck/L8aJDlzE6bM5l/CPcjHqHoJcEpn/N8zYGF63mmlYi/U
	LUNYeae64nprmmbidqwNtqlrI0C0yi1SmGg2ttJmhpwhZdWFFtIuq68vwMWKx+ELU6F8v2IiYagdE
	m2RG3MnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voK5Z-0000000BFRF-0rOC;
	Fri, 06 Feb 2026 11:33:29 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voK5X-0000000BFQZ-07I8
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Feb 2026 11:33:28 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-43621bf67ceso428172f8f.2
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Feb 2026 03:33:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770377605; cv=none;
        d=google.com; s=arc-20240605;
        b=DOUvqRrCAXv4HuGYyVN7F173WI1zS/ll7/IjsJUmHNdemBDrSRoewb64H3+/blXX6L
         llxNBmevGX3il7erUfticuRKsUiKsgZ462aSeqKYqxzTWWaitAg8tNaCnApWy3yxM2W9
         +mevLUvw0Mgsse/11aDi5Zg/BnQ9MDCkjSD5Zvrjqdxrmu5CXt8Frlgo6hiUlmH6WeDS
         6tzU9tKxwqA+Ae7l72OHhs5f3k9rGREq3BGq4kbdGok8WbTgrIZgCfhuwzRYBbxgn1sS
         LYUkvBNWzSKU2ZL2zDtBSCDhqeZLYKdNxXE2yfOOUfzdmWqiKCPbwHp1sV1WSst0kDlh
         si3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qYdH/hNC/UeCB6NgJcX7BWXr9w94Q515Os8NJ0f+PW8=;
        fh=/BSz06aysuojWbay0i0HAxyyDYPrZbl+fmmEdjGJamI=;
        b=ikhJhl2CUIrGR0yKO7kpaLiMr/22KjClZBSG9tAeKIzrJPNBdbpwBIDkhX9kEZgw48
         2JkNT7tJO6ccGhVJBcftz4VW/7uV53Jml8i5my7u+WTKbhJlCBqZ8q48Npsp11eljihO
         O4CkH4DMZWvR+pee5IZ5IGH4v3TF6qdvWivpTAdiL8Rtr3MIChHKpL5Mi3JFzRaELfS1
         RrPP8YjlrYZrjuZc9oytvF9TXVKT34o19iijXzI0HolJ19/XNHbip82c0stzjZ8dbXwM
         75trNxoLmpbT6OQACdn0cz/ZK4/pHvuqnjo3zTgEqSCZHwG/RIe13mEppm4qbZ7nBogD
         3d2g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770377605; x=1770982405; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qYdH/hNC/UeCB6NgJcX7BWXr9w94Q515Os8NJ0f+PW8=;
        b=Y1eSfxB7Ynois+qAfYwU1JK/zYURbH+3wwdv0td2a9D7qRUbq/R3VrLmtDpNvfcaQG
         cRZHdHvUHG+zri6XOnBTC5MHF7vJtqpu4BW0tNQu4S0WGewOiHPtWqqNAPg653/KiEcG
         CyzliW1EAgfzqjUu7/VX1f9RrlCq5MGzu6vxFSqfM5WzXCb3TN9l1VMtDVcbrVBvnynb
         dvgkzNlk2WExgbjXDlpDIMM91Lag3KaaJxaLaYIDqUD+FuEtxDKZ1Ku6cTiuTHWNBUkN
         NPRxzKogT3HzLeDsyH7Ac9l4gF1P81HQKBN6tvzfoztQ8QtgEOredYD17FY2hXpYhAOx
         3O3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770377605; x=1770982405;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYdH/hNC/UeCB6NgJcX7BWXr9w94Q515Os8NJ0f+PW8=;
        b=pXtaKOp+pSrMOQSW5xFzC57vYLLjrbvjT66q4WfRy49udYYiDiwIS7wyDacWPKiCXv
         OAuVnA6ql7wOPE0DnkuuIwjStnvSTMhm8+teOAuRov5HNyi5qDgcb9V4uB/JRTeb1osE
         OFC1rtvD/qlGS8yS70L+yEB4C7oeUmVe+jvuJDwrAyjVs1Knf0X2KvVLQD6OAnbHjwNL
         dDcZx6DBV0Homq7+hwt3V5xQh0ktrpVfUpbR88PLFeVssohX8Ij5VYLkyKljVFBDSUw5
         9ScyQAj0cP8VSb4w3CExy3z7Q95A6KNGuiJnL7HEW+X1UF5JbulDgM+BsGMZfIW0uP7G
         YcwA==
X-Forwarded-Encrypted: i=1; AJvYcCWy/Bnw17WtN/BEIw96F09R1J6k/n0rMFg5wM8is3Fkz3WYkqo5neETAZq+9kov+GrdksHwUojjYJMKKiCyxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbBQRIgq9m18QL2w0rbbF5GilrSrNkoonBp95Z/nmfb3I2H2FL
	9O2wWhHYYAdm7a0trbw/DkH6+rCOC5AoPgRcNf6ckTiNftOgxcOVD0oXyDU+DkOCE2FPpCPAZoN
	crKaITdABMIEhsym86FFn5dLhIQfYHwo=
X-Gm-Gg: AZuq6aKvrxlxZH4u2zaO7VX1YScfMuzVZtSKsh8oR4oiTjFRtFoR26lXtwaTw9/NOcO
	9D3zoI9nEWCqGGSeQmjP/PwrDCRXMw5gjpteRB/jOHLMoQxDuPQMbDMeAFWeyhkVAmn5oEFOv2e
	wQuWSfdBNCoJTpuPAz1Vn+kXdcBeSr8opQDiLD2CKXQHyZrdwfyr/wTFp+7SUTR+UchcH3tA3Y7
	YtIlmu76JsQuSJHLCxhhxB5zaJDSkxhg7lkHDGMuFx8VJqJ50ow5+qbCieuILST1gKlnp5E
X-Received: by 2002:a05:6000:402a:b0:430:f742:fbc7 with SMTP id
 ffacd0b85a97d-43629378247mr3897162f8f.14.1770377605019; Fri, 06 Feb 2026
 03:33:25 -0800 (PST)
MIME-Version: 1.0
References: <CAFLVeg9hwH3PbKu5rPWZWqq6yz5mRRoB9oqxDkxNRdEDLGbVBw@mail.gmail.com>
In-Reply-To: <CAFLVeg9hwH3PbKu5rPWZWqq6yz5mRRoB9oqxDkxNRdEDLGbVBw@mail.gmail.com>
From: Denis Gessert <denisgessert@gmail.com>
Date: Fri, 6 Feb 2026 12:33:13 +0100
X-Gm-Features: AZwV_Qgy195bSBwn6CrB4tPCk-toUAD-yG2nvTOPL-fTryqeOhSfKzH63qhCO78
Message-ID: <CAFLVeg_soeYV4tOYKMo6TMYOtuWWU4TFCjUTxUrVEyGcRwMz7A@mail.gmail.com>
Subject: Re: [REGRESSION] mt8183-kukui: dts: changes in dts caused display to
 no longer initialize - Was: Re: mt8183-kukui: drm/mediatek: dts: Invalid
 display hw pipeline when probing mediatek-drm
To: Thorsten Leemhuis <regressions@leemhuis.info>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Evans Jahja <evansjahja13@gmail.com>, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_033327_079129_87F364F3 
X-CRM114-Status: UNSURE (   7.06  )
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

I found this email chain while troubleshooting why my Levovo Duet
(with the MT8183 chip) would not boot using any 6.18.* kernel.

I can confirm that on my device the current stable 6.18.8 does not
boot unless I revert the commit

commit e72d63fa0563f8a6e98c10fed3a9ce74dc0536e6 (HEAD)
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date:   Thu Jul 24 10:39:08 2025 +0200

    arm64: dts: mediatek: mt8183: Migrate to display controller OF graph

mentioned below. With the reverted commit the device boots as intended.

PS: Apologies for the potential double-mail. My first message bounced
because it was HTML, so I am sending it again text-only. (This is my
first time on the mailing list..)

Cheers,

Denis

