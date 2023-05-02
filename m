Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7207AC77B73
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 May 2023 08:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:Cc:To:From:Date:References:In-Reply-To:Message-Id:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ghjR7QqLTKl0Wa6Qp/pmJnR12EKA7bqxYQWouqZ3mAY=; b=SMh4hEXawcaVyOzuLaLLLT9dEU
	2wErLSut6/luHV4PRvXYGsew/tVkqYNTX7sfKELNhh+hwxXdppUyS8M06jroZTL5V/w2c33d90ZdU
	l2U3yWeiFyLt9Fq5c9CbZzpC94q3Gk2LZ5DXlDlDFymVr5YasbD08kQH/6IEi87/YIx+rTnhnfX76
	qxKwuE1UGLJHGg83irzp9/VvYfIkiyiesAXr9Z9tI827VETTthag4b2nbI5hXszAusk9XyDgL1d0V
	WIEWa6cpG8gNLuKCOBabkyw73mDSXvlZasGrtgP945Ux6QTlCLoXTnFwg3L67fWwGIoYcB89nPANe
	FzmSbOmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptlAe-000ZaV-1E;
	Tue, 02 May 2023 08:15:36 +0000
Received: from new2-smtp.messagingengine.com ([66.111.4.224])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptlAZ-000ZXM-0j;
	Tue, 02 May 2023 08:15:32 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 0A58D5803C3;
	Tue,  2 May 2023 04:15:27 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 02 May 2023 04:15:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1683015327; x=1683022527; bh=ghjR7QqLTKl0Wa6Qp/pmJnR12EKA7bqxYQW
	ouqZ3mAY=; b=G/ReWH/CR4stPP8pBvKE2oH2tiIxeT1Y9djsugPvcan1vwLCNKB
	+CmHc2S3racpCMakxZ1qQRdhDmpzbTSxPsJLCIAsBgFwKTe+QJwmoUIe5cxfT6Wy
	tgZI7GBK40sokCJo7woyfvbYgCDiIcu9MJqEUid0mCHXVNlzPDjNZzJJBtLrLhF9
	X/mbJHalC7bJ1Xs6/CKvhniyT1ORP+ioH4B0Q9MMwa1hEm8wfe270mide7U5ucC4
	jYc1KiyRZtz0ezseY2LvXW4OKb5R6V9gMew5kODf8MnejtSKgLd/xIANaAqpsh7o
	O3SUD5day0+7MZzwDONO0PUZT+hvXwYxYyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1683015327; x=1683022527; bh=ghjR7QqLTKl0Wa6Qp/pmJnR12EKA7bqxYQW
	ouqZ3mAY=; b=Y/xWbzku7vrNHNzte8uy72nMxc+pbAIi4IeA/XfvwUvtiZV9Est
	bPyNKEthPJpnwnx5/Y68ss9jDEmHmeNI9uaomvywj4LEhNdN2/6OUB0Ap6qjjHvb
	OQIPRGrLOJBmcaLg/XgkHAzTOPE5Xwu/E3de9zryJ4QMstqpCG+bbbWHvXXdfXgL
	L+W8t5CYwFrU7f8XrnzjjIYPTrCSQ2/hUzXAWg8+DhkBUcIkmt6eVQO+8Sms9yZ1
	Z+nDtml+a4kCprv84LWaOxgu+YrgM2G6hBbX6r3CD52Qvxv2Jvyac8zhWROAt9xl
	Ftb8duEVIIhaiX5H6fsUSxaLGjuOvtdmUyw==
X-ME-Sender: <xms:nsZQZGG99LYs7t6dhgAngkbsv9osgUeFMS5nCv0_eqkMW790xp5pVg>
    <xme:nsZQZHXku8NWvKl4XxdR48yR-0RVaLsU5fwZmJq18kazWD7vv8gAEIoPKVDAKkTuy
    5prPVni2U8mfnd5sN8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedviecutefuodetggdotefrodftvfcurf
    hrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfgjeev
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:nsZQZAK8fS_X5YYcPQ8tmCY5TK5FJ7gjlJsS0RCSCVoEK-Zwdrq3Yw>
    <xmx:nsZQZAFFLoJhNSVEvLGVyQfmt0zeZphfcdHG8-tw9pYY47GFwhKrNA>
    <xmx:nsZQZMUL4rbP96pvZI76ZCUHun2qRq8vNtMGMdc-nT5M5xb0isYJ2g>
    <xmx:n8ZQZPq1o7msWppgt2EUHhnFGcmwGcb09Ud671-g5_97NEtVzT49Eg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1C690B60086; Tue,  2 May 2023 04:15:26 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-374-g72c94f7a42-fm-20230417.001-g72c94f7a
Mime-Version: 1.0
Message-Id: <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
In-Reply-To:  <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
Date: Tue, 02 May 2023 10:15:03 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rob Herring" <robh+dt@kernel.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Olof Johansson" <olof@lixom.net>
Cc: "Christian Marangi" <ansuelsmth@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 kernel@dh-electronics.com, linux-mediatek@lists.infradead.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
 linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_011531_540724_3E8F8DFB 
X-CRM114-Status: GOOD (  12.22  )
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

On Tue, Apr 25, 2023, at 17:57, Rob Herring wrote:
> On Tue, Apr 25, 2023 at 2:28=E2=80=AFAM Geert Uytterhoeven <geert@linu=
x-m68k.org> wrote:
>
>> Does your script also cater for .dts files not matching any pattern,
>> but including a .dtsi file that does match a pattern?
>
> I assume I built everything after moving, but maybe not...
>
> That's all just "details". First, we need agreement on a) moving
> things to subdirs and b) doing it 1-by-1 or all at once. So far we've
> been stuck on a) for being 'too much churn'.

Sorry for missing most of the discussion last week. The script sounds
fine to me, the only reason I didn't want to do this in the past is that
we had the plan to move platforms out of the kernel tree to an external
repository and I wanted to do this platform at a time and also only move
each one once. I don't think that is going to happen anytime soon now,
so let's just do your script.

Can you send me the script and/or a pull request of the resulting
tree based on my soc/dt branch? Everything is merged upstream,
and I think git-merge would handle the remaining merges with any
other changes in mainline.

        Arnd

