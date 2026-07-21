Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1731BC4451C
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2026 12:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EjyF/vs1ryZrBaWGdOYQs1NrOsZ5qM4QXFKV7tTAusM=; b=NFlpHHkg1u0RYIW0U1eke9VV4U
	xrgo6d4x5NP/UwJ/Qr+q54pwLrGTjxNwcLHHoP2EBs6h1jlytWCl2Pu8GxaJp4Dhnoa81f9DmGNpp
	JqzSmRrtPIwn6zyQzqmlDWKSoVZsqHL+sBSHu7v5zAfC1m0HBCuGOplyl62yhoq1wL6QhXZdjCJII
	6aS/Rhd4zQB0sGx252UtOccCMJ62K0SL0izrQhzrQnegEWYoLoVx37CkIa8fDuGsh+Jo288cC2GpX
	ivIamBXuhAWai1DHji9QORnJRShHukS+xQpNMO4LcH/gJNJylChAXyaYBPkcjnFdoNejZzeOI3Bw7
	Desw6z6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm98l-00000009MsK-3kB9;
	Tue, 21 Jul 2026 12:00:03 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm98i-00000009MqU-2Q5I
	for linux-mediatek@lists.infradead.org;
	Tue, 21 Jul 2026 12:00:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0CB0A4E40E9D;
	Tue, 21 Jul 2026 11:59:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D32F760368;
	Tue, 21 Jul 2026 11:59:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31D0211BD2635;
	Tue, 21 Jul 2026 13:59:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784635197; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=EjyF/vs1ryZrBaWGdOYQs1NrOsZ5qM4QXFKV7tTAusM=;
	b=JsHQ0f4ki+RiNcdLaiRsxJNbER3ByMdcL6G/Osw1wC1GyA979giPzZwX25/1+AXSJZASez
	jc2P/4znLTl9iSASeu5XIvgCulT5m31Tu2yBUsCuhSJ4/so/85qfL3Ge75kIhkf3rnDCmP
	ICorpfbzpHkhjyZTYECBfQxuTKNlObpxFURvybWaXdcdfxJ/MorIFZrZG+CGhOhMI1VYsp
	sNOeV29wBAJegHHlqyyDCz8PcKzA+U+cOs8Ov9wcZWf5kzfDlGgU7MJo9FwbSoaRVe4Wtr
	dogji0At/FTkT7K3Mwei6IveClwFUAEWMBdd29FcX9VDVGEokCwsJfGuq/asqA==
Message-ID: <5c270acc-7cbe-4d23-a687-35440b43a9df@bootlin.com>
Date: Tue, 21 Jul 2026 13:59:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 02/12] net: phylink: introduce internal
 phylink PCS handling
To: Christian Marangi <ansuelsmth@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Heiner Kallweit
 <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Saravana Kannan <saravanak@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260717065448.1498335-1-ansuelsmth@gmail.com>
 <20260717065448.1498335-3-ansuelsmth@gmail.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260717065448.1498335-3-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_050000_899190_77A48BA2 
X-CRM114-Status: GOOD (  25.44  )
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

On 7/17/26 08:54, Christian Marangi wrote:
> Introduce internal handling of PCS for phylink. This is an alternative
> way to .mac_select_pcs that moves the selection logic of the PCS entirely
> to phylink with the usage of the supported_interface value in the PCS
> struct.
> 
> MAC should now provide a callback to fill the available PCS in
> phylink_config in .fill_available_pcs and fill the .num_possible_pcs with
> the number of elements in the array. MAC should also define a new bitmap,
> pcs_interfaces, in phylink_config to define for what interface mode a
> dedicated PCS is required.
> 
> On phylink_create(), an array of PCS pointer is allocated of size
> .num_possible_pcs from phylink_config and .fill_available_pcs from
> phylink_config is called passing as args the just allocated array and
> the number of possible element in it.
> 
> MAC will fill this passed array with all the available PCS.
> 
> This array is then parsed and a linked list of PCS is created based on
> the allocated PCS array filled by MAC via .fill_available_pcs().
> 
> Every PCS in phylink PCS list gets then linked to the phylink instance
> by setting the phylink value in phylink_pcs struct to the phylink instance.
> Also the supported_interface value in phylink struct is updated with
> the new supported_interface from the provided PCS.
> 
> On phylink_destroy(), every PCS in phylink PCS list is unlinked from the
> phylink instance by setting the phylink value in phylink_pcs struct to NULL
> and removed from the PCS list.
> 
> phylink_validate_mac_and_pcs(), phylink_major_config() and
> phylink_inband_caps() are updated to support this new implementation
> with the PCS list stored in phylink.
> 
> They will make use of phylink_validate_pcs_interface() that will loop
> for every PCS in the phylink PCS available list and find one that supports
> the passed interface.
> 
> phylink_validate_pcs_interface() applies the same logic of .mac_select_pcs
> where if a supported_interface value is not set for the PCS struct, then
> it's assumed every interface is supported.
> 
> A MAC is required to implement either a .mac_select_pcs or make use of
> the PCS list implementation. Implementing both will result in a fail
> on phylink_create().
> 
> A MAC defining .num_possible_pcs in phylink_config MUST also define a
> .fill_available_pcs or phylink_create() will fail with an negative error.
> 
> phylink value in phylink_pcs struct with this implementation is used to
> track from PCS side when it's attached to a phylink instance. PCS driver
> will make use of this information to correctly detach from a phylink
> instance if needed.
> 
> phylink_pcs_change() is also changed to verify that the PCS that triggered
> a link change is the one that is currently used by the phylink instance.
> 
> The .mac_select_pcs implementation is not changed but it's expected that
> every MAC driver migrates to the new implementation to later deprecate
> and remove .mac_select_pcs.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime


