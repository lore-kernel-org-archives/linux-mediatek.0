Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C07EC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 12:38:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E308E22240
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 12:38:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="smfMJ7HP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E308E22240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zHoGjZw5ZjhAK2p6q0bwu6pC2csYQLS/TVXrAmJ/ov8=; b=smfMJ7HPafc6Lu0xiEI5jWhLV
	W75AKqjEzAJ/Ouf2Qted8tj0/qK9hg4bqfcFatZNGiylQNIqucjGYAhqHsbzLFAkNqjzz8wa5n0kG
	x9irlzKzGKhjv48M0jgShsFdv0H/z/euKXNeY2WTk3/c/qyAjL9kxuxnlKW3j61o+vLOSGehXcSXz
	6DuBi4o6VVsJPBgMYHMcZ2bbJ5sJAtEZ7eQcxpJxhT8MDjUk7zwIMtrlZLIYMXTkpT8k//xYPNiIF
	y+DSpa3TBYcwgHy9/zlKJQjnvX99JsGp5J9xzpY+Eiq/fzjIANTGWcjs+nQR4pZ0cAgOKZ3Y5ZqqP
	U6MDPYznA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUquP-0000Dw-1H; Tue, 20 Oct 2020 12:38:33 +0000
Received: from mail-wr1-f66.google.com ([209.85.221.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUquA-00007A-U2; Tue, 20 Oct 2020 12:38:21 +0000
Received: by mail-wr1-f66.google.com with SMTP id n15so1951874wrq.2;
 Tue, 20 Oct 2020 05:38:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sCAzGCkxAJS3QlgrbYIRbXlNmhdT/0i2DpUXZfdaEjI=;
 b=OLmpLbFp8jMzIYo3Y50TLfDgUmXPU3dSUPPqoEoxomKZvb8QDsLpSdSpAOzmIp1eOX
 SxA+jxsm0Nl1QqLg3Aj1BMDPOvVf+0MKDQUkt5HmljzqzCDnTneLj2OOdBUlN3b+p6LP
 td4J4Ve2UuWCm77LcrcJeQ5woWAU5n9HuUfw6hjcTToLnzP+hXokGTwgiDLBUqjLW207
 21WHGiOebHMhyR1ayswcKHYOIpzsX0j3GEo44Q1CizyWdQDTHyVZHnUQTB47XgqAJeaQ
 GCaKMeBQuJ3O5vTfdnOp8wCVwWrxuWB4kCQUBJE/o/QNVcmgGHlO8RJebheEZ4+BAXCB
 Fd1Q==
X-Gm-Message-State: AOAM533g5+QsbTzK9WjJP6aYBXJqBw1cN36VXAf5InI7YCDed0iDHV0E
 +s2YUX9mJp/KcZqk6YZBnF4=
X-Google-Smtp-Source: ABdhPJzP87nGP+zRq7oU13xo36adkNHri9YodfysJBp6ywOxu++5gLSynVhnDoAKx2V1SiafO/n07w==
X-Received: by 2002:a5d:5748:: with SMTP id q8mr3280781wrw.299.1603197497943; 
 Tue, 20 Oct 2020 05:38:17 -0700 (PDT)
Received: from kozik-lap ([194.230.155.171])
 by smtp.googlemail.com with ESMTPSA id v6sm2952473wrp.69.2020.10.20.05.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 05:38:16 -0700 (PDT)
Date: Tue, 20 Oct 2020 14:38:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH 14/29] mips: dts: ralink: mt7628a: Harmonize EHCI/OHCI DT
 nodes name
Message-ID: <20201020123814.GK127386@kozik-lap>
References: <20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru>
 <20201020115959.2658-15-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201020115959.2658-15-Sergey.Semin@baikalelectronics.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_083818_989605_8E8A6AB7 
X-CRM114-Status: GOOD (  13.56  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Felipe Balbi <balbi@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mips@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 linux-mediatek@lists.infradead.org, Serge Semin <fancer.lancer@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Oct 20, 2020 at 02:59:44PM +0300, Serge Semin wrote:
> In accordance with the Generic EHCI/OHCI bindings the corresponding node
> name is suppose to comply with the Generic USB HCD DT schema, which
> requires the USB nodes to have the name acceptable by the regexp:
> "^usb(@.*)?" . Make sure the "generic-ehci" and "generic-ohci"-compatible
> nodes are correctly named.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> ---
>  arch/mips/boot/dts/ralink/mt7628a.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
