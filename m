Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F96FC77B7F
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 May 2023 10:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Date:References:In-Reply-To:Message-Id:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m2b7jemaeDgVDN/yXM9EiMNoy1q6cv1GnASV/ZhZJOc=; b=2Ul9DxGPbOA4/rsRk/sOhlRpic
	nhDR21UdbP/gkLTDUacg5E58NbhscbkvXPOmjHW+hX4JmnZ4bxdxcr7F5U6F9+KOcUXbZvdGV3p6j
	5Ujm6F13G1TqzJULD7b7aUOsf+uSJTkgK0X3RgFNv3bjWHk247yiiP6WuZ1l4yVtXKuixbuKXS2a9
	67OvEXoS4YwuJlBJ5Iapr0R0A+uveczvSQk1OOm3GjXxjvSL00Gqc5J2Zr+WJhV0BCpkco4HADWow
	ku+aBBg4lKsXnGnOKK2LJ3BaL2l0VVUt0hVBhhrWMPFJBlI+ORXIsj4jegplVGSHD6MIMBLvzy8f7
	Bmscnc2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pu9xJ-004EL7-11;
	Wed, 03 May 2023 10:43:29 +0000
Received: from wnew2-smtp.messagingengine.com ([64.147.123.27])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pu9xD-004EGL-2R;
	Wed, 03 May 2023 10:43:25 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 15E712B0695A;
	Wed,  3 May 2023 06:43:21 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 03 May 2023 06:43:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1683110600; x=1683117800; bh=m2
	b7jemaeDgVDN/yXM9EiMNoy1q6cv1GnASV/ZhZJOc=; b=WrlcuJSZCuIXk9sb1Q
	SpXXj5FyZRmxZuz1k8wKZV5++aVZGods0u4IsZKnp78HfY7/sgSBcYJrf1SjZ95o
	AbWmVDysL5tbVj0mv23iDyWu48jMlAQ3P7oKNvBhmLdYV+aA/ClRwyyhJnw9Osor
	Wp6KBCIET6wOTCgyzOtu43OWs9VyuSZntIJvxPB+uljtrIkduB7ZdrnRDkImSOl9
	NuiJwExj+KJBYmqeKjfnzZvTIgLXCw8dfuvZtKsGy5gwRIgu2g+Hh5cbBJD/fWqW
	2W1e67BSI2+jlGCI6RPTNOsGxwOIPVKQWcX3Dfu7VxUvgU2lBip0Xyd+nLyvKqJd
	I3Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683110600; x=1683117800; bh=m2b7jemaeDgVD
	N/yXM9EiMNoy1q6cv1GnASV/ZhZJOc=; b=FcKLcB5AhURyWSU9AeAkrNMWNPmzP
	RN7TT7leW/rr6wgT486DThSzmv16TT0ttqKjcwZW8P+nv8iOzx1CAgQ7qdduWzxQ
	/Gz/Tcw4EOx0qgSJzyfHZLyX0ySoPQeV4zdRo6+Z7HAc9vt4vJcmOsLPsWzJb3kx
	O5niH9wc2uX7N1BZ1hMWuN0sCvoccvWcuLRJ4WbAxdtfzL4iETLx0JZ/2DPV9EWa
	lREUL3KRPMFdQMUufxe+DGAVXX6ZA3hPEwaiCQ6pe4SSUvj3jssC8Snl0FUda3Dz
	8L+4gh+rEf9s51OzAITtqaE5LWEdTZhmO7S7JsLOaRXCvXsgolbFT92Kg==
X-ME-Sender: <xms:yDpSZPCqsf08zSuGB9S_Yyasjyfw8C7NFU4cOM__vE3LKtp5PZuGng>
    <xme:yDpSZFiEb6HH6H_58GlixH3G-nv3jp37AdKwTgdBGBFYH0DY8nzkEJ5mgat6Fv9LK
    KKIIOZPpYqGCV37HyY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedvkedgfedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:yDpSZKnB4jWJCZbdAILCLoQ7Tb1JDWaGOQ4QRvtfyLGkz3ZL_6SLDg>
    <xmx:yDpSZBy3OQb_c4T8ysdY1Cp9Lj863KLs0081WZpxCobqdPOlwPyYug>
    <xmx:yDpSZETjKdOdSUw3JxfayiFtx-J69d0-e3sxVxrEKYSU1TR-jv4gqw>
    <xmx:yDpSZAxATWHiqR3-vrO-mZXAs2G96Hf5p2LRUHruhuMW2qX03HsehI4wpP4>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4B4C0B60086; Wed,  3 May 2023 06:43:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-386-g2404815117-fm-20230425.001-g24048151
Mime-Version: 1.0
Message-Id: <89dfb3e4-4009-4ed1-8cb0-d6ee16928caa@app.fastmail.com>
In-Reply-To: <20230503011920.GB31464@dragon>
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
 <YkKRYnN84D9VZhGj@Ansuel-xps.localdomain>
 <CAL_Jsq+RQQ-ADMxLPUFwk6S6kGmb6oNDy4k52fnU0EtbUvqmSA@mail.gmail.com>
 <CAMuHMdWNTE48MFy6fqxAsfMWz9b6E7dVNXtXtESP95sxk2PGwA@mail.gmail.com>
 <CAL_JsqJthKTm8bhRF2B=ae1tvtPeYYXx_Tm76qQtSwLtH5C6VA@mail.gmail.com>
 <720a2829-b6b5-411c-ac69-9a53e881f48d@app.fastmail.com>
 <CAL_JsqKCtmkwzKa01gyG65fH8ye6R3KhR41PJbJhOJ4X9j=znA@mail.gmail.com>
 <2783a3ba-8fcb-7e5f-3147-91d02e573ba4@kernel.org>
 <20230503011920.GB31464@dragon>
Date: Wed, 03 May 2023 12:43:00 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Shawn Guo" <shawnguo@kernel.org>, "Krzysztof Kozlowski" <krzk@kernel.org>
Cc: "Rob Herring" <robh+dt@kernel.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Olof Johansson" <olof@lixom.net>,
 "Christian Marangi" <ansuelsmth@gmail.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-sunxi@lists.linux.dev, Linux-OMAP <linux-omap@vger.kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com,
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-tegra@vger.kernel.org,
 "linux-oxnas@groups.io" <linux-oxnas@groups.io>,
 linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-realtek-soc@lists.infradead.org
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230503_034323_828931_87377054 
X-CRM114-Status: GOOD (  10.88  )
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

On Wed, May 3, 2023, at 03:19, Shawn Guo wrote:
> On Tue, May 02, 2023 at 10:02:03PM +0200, Krzysztof Kozlowski wrote:
>> On 02/05/2023 21:40, Rob Herring wrote:
>> 
>> If I remember correctly, Vybrid are a bit closer to iMX than to LS
>> (Layerscape), but it should be Shawn's call (+Cc).
>
> I would suggest to have all Freescale/NXP platforms in a single
> directory, which includes all mxs, imx, fsl ones.

I'd go with 'nxp' for all of those then, and also include the lpc* ones.

It's fine to stay with historic names if changing it causes problems,
but if we are going to change anyway, then let's call it the current
owner's name. It will get messy again soon enough with the next round
of mergers and acquisitions.

      Arnd

