Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1EE7C636D6
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 22:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6N6hc/Vst8fqUYYKjI2DmO7NT7hqJlbMMpmH7huJeYU=; b=sFOCvjsUIDvsADsihtIXXfyB5k
	IG9kosx0Imzv2fRXU9jLXZoQ9L7XGIWkA1fnmTh4f6VRjcNKYlDRogbgcic3Wlc+1fNogD0lF0G4a
	lm0b3BFGMl3mcVv25AQQWKZGru0KmUV4FWKsqM0JvI3jsMqxvSJdqjIoSPjUu4ftSI6sMKzHjSiWb
	nNCj1Wd6e0uux9Hr7whv3o1Nh28BF08gBImJ9BH4O//oc10EPqoBF1kfc7CeizF1FTzBZ1j1l80vx
	ZCRWaIIBOZYb9qLYh+m+9Mg/wnzcEaIOZAfoDGZsR1PEcqFtIzKod45TXAmE6J71aMgUcp87CsJNl
	3XlYFqWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUEHj-005keK-IG; Mon, 20 Feb 2023 22:05:23 +0000
Received: from 4.mo581.mail-out.ovh.net ([178.32.122.254])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUEHX-005ka9-GW
	for linux-mediatek@lists.infradead.org; Mon, 20 Feb 2023 22:05:13 +0000
Received: from director5.ghost.mail-out.ovh.net (unknown [10.108.16.84])
	by mo581.mail-out.ovh.net (Postfix) with ESMTP id 765C1231A5
	for <linux-mediatek@lists.infradead.org>; Mon, 20 Feb 2023 22:05:03 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-kgbzl (unknown [10.110.171.164])
	by director5.ghost.mail-out.ovh.net (Postfix) with ESMTPS id A846A1FDED;
	Mon, 20 Feb 2023 22:05:01 +0000 (UTC)
Received: from RCM-web1.webmail.mail.ovh.net ([176.31.238.120])
	by ghost-submission-6684bf9d7b-kgbzl with ESMTPSA
	id +fnGJo3u82PxBzoAs5WIMg
	(envelope-from <rafal@milecki.pl>); Mon, 20 Feb 2023 22:05:01 +0000
MIME-Version: 1.0
Date: Mon, 20 Feb 2023 23:05:01 +0100
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, Srinivas
 Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 2/2] nvmem: add generic driver for devices with MMIO
 access
In-Reply-To: <2f9aa86e-40e1-91f6-06b2-c79d62f7a136@infradead.org>
References: <20230220174930.7440-1-zajec5@gmail.com>
 <20230220174930.7440-3-zajec5@gmail.com>
 <2f9aa86e-40e1-91f6-06b2-c79d62f7a136@infradead.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <c4fd4ca4e550bd7de909269e8eedd5f6@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 194.187.74.233
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 17189958306374331355
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudejhedgudehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvfevufgjfhgfkfigihgtgfesthekjhdttderjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepjedvlefguedthfefleehgeeftdeludeluedvgfeffeevhfevtdehteejteefheegnecukfhppeduvdejrddtrddtrddupdduleegrddukeejrdejgedrvdeffedpudejiedrfedurddvfeekrdduvddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeorhgrfhgrlhesmhhilhgvtghkihdrphhlqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdpoffvtefjohhsthepmhhoheekuddpmhhouggvpehsmhhtphhouhht
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_140511_737174_933BD36F 
X-CRM114-Status: UNSURE (   9.22  )
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

On 2023-02-20 20:55, Randy Dunlap wrote:
> On 2/20/23 09:49, Rafał Miłecki wrote:
>> +static int mmio_nvmem_write(void *context, unsigned int offset, void 
>> *val, size_t bytes)
>> +{
>> +	struct mmio_nvmem *priv = context;
>> +
>> +	switch (priv->io_width) {
>> +	case 1:
>> +	case 2:
>> +	case 4:
>> +		return -EOPNOTSUPP;
> 
> I'm just curious: (since read supports those cases)
> 
> what size writes are typically used here?
> And what value for priv->io_width?

Sorry, I really don't have any statistics on this or any real overview
of hardware that supports MMIO writes. It's probably a minority of
devices that allows it.

