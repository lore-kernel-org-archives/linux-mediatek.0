Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31ADD24456
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Oct 2024 22:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jc2QOJPkdZCJraOkoPBPf89c4KRNcnmBfkI3+FCrPfc=; b=Il4+OlsleN1pN7e7azcYiczARG
	L4B1CPgebLkfjtaFAZv7glrbYWqC2hL6X1axew5dUqnoaf/ESPcjb0BQ6qViBsT07TiZBlRJQTnIE
	0htgCVvl+sYZb46FhPNKWB5iBVMv3eDe03blbAO8p9U1/C2x4+efH+TurOpTZa9Og0o1b89ksPHBj
	gMTSQwhELNLJf7xr5jpNF0jBFZui4q3VUwQ/1a5g7s4xNieMCvTwMIOKgmOqkQrzpYqowND+k2fQo
	9fxAY+g+JJZKB6TJ9UT6TctRutM5PuIwNgYd7w9S1uJTpbtvLdoWxldnwMdsB6djnAMI1RApBJGFm
	Td1MLJBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz1cj-0000000EXje-41DF;
	Thu, 10 Oct 2024 22:27:09 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz1YU-0000000EXGV-0n1I;
	Thu, 10 Oct 2024 22:22:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Jc2QOJPkdZCJraOkoPBPf89c4KRNcnmBfkI3+FCrPfc=; b=eZAuOFUzBo+b4OH71XOjsk4tC1
	Gq2XZcNeneSKhMmHc4Csnw12LM4rh6jTjLqSIHS94W7GFEEVmUj4IqmpLPrrcJnRmHY2KTAPdk2Pu
	cmFUwiaQRmtnYE2GUJ0xckHBFKSkZEvaDrOisq44VDhKv9EVUXDFXXg8RHlTkGHhPoaTcxDIpsm14
	J8z3uBuv+7E4+EBvv1txiM8SKyq2PKCczJ4PNTPbty75XNgI2UrbboqYlYbjFInwlCqxdpvmnDPLw
	AZX5m2HjFxDlr2Eo7YnQIad9fK8p4HUdlO1poQp0g2KTdXHCrG7MsL6c/2Ig0cPLVJDL4ESdc/x/m
	DKfa64Xg==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98 #2 (Red Hat Linux))
	id 1sz1YO-00000002Yin-2OPG;
	Thu, 10 Oct 2024 22:22:40 +0000
Date: Thu, 10 Oct 2024 23:22:40 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans de Goede <hdegoede@redhat.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 06/10] Input: sparcspkr - use cleanup facility for
 device_node
Message-ID: <20241010222240.GE4017910@ZenIV>
References: <20241010-input_automate_of_node_put-v1-0-ebc62138fbf8@gmail.com>
 <20241010-input_automate_of_node_put-v1-6-ebc62138fbf8@gmail.com>
 <20241010214348.GD4017910@ZenIV>
 <22e55eb1-8aa6-43fa-8020-d18f9f6aa6f8@gmail.com>
 <9a85e6bb-884f-4fa0-b198-bf7707af76c8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9a85e6bb-884f-4fa0-b198-bf7707af76c8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_152246_245550_B3936301 
X-CRM114-Status: GOOD (  13.71  )
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

On Fri, Oct 11, 2024 at 12:09:01AM +0200, Javier Carrasco wrote:

> I think that the issue you are talking about is that the goto will
> trigger the cleanup function of the device_node, which will not be
> initialized at that point.

... and gcc will compile that without an error.  Clang will not, but
you need to watch out for build coverage in arch-specific code -
clang doesn't cover every architecture (and won't cover some of them,
no matter what - alpha, for example).

As for the scope changes... note that you've delayed the moment of
of_node_put() in some of those.  It's harmless for device_node, but
try something of that sort with e.g.

	mutex_lock(&lock);
	something();
	mutex_unlock(&lock);
	foo();
	return 0;

where foo() itself grabs the same lock and it's not harmless at all -

	guard(mutex)(&lock);
	something();
	foo();
	return 0;

is equivalent to moving mutex_unlock() to the end of scope, i.e. past
the call of foo(), resulting in

	mutex_lock(&lock);
	something();
	foo();			// deadlock
	mutex_unlock(&lock);
	return 0;

__cleanup *is* a useful tool, when used carefully, but you really
have to watch out for crap of that sort.

