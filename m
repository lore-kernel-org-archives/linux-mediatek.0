Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4474C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Apr 2022 02:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vkM6WVHjwKlg/VyQBluEIssTfEN4LOPixj3Ybeg5hw8=; b=0qVn3jXboPKZqA
	LuEqO9HKqvMBCS86rPdU7dmNpbdiMa7EtjyRKzOLhKucYe3UKUEKNeVT46Ku1mWlwjvmZ6WFgGAE2
	AE+iXV5sQcHeJhbdfXK2UT0AZPI7GpB29NgFcDp428lt+83fJ/6bG/rdVrocBXiwUPStllorLVzPj
	w4YL+3wXoQ5WPqAYtm2RNiOgeviQ0DtSg30Mi9JRtnTbI8FtD9toXo1dcLDyKUTK2Xc2vxsmw+RBB
	p1rslQ5v1uRMMFYtvXieiyvuBSDlvYl+ngEEc+whIj17Ijr/rhKI9MK4lV1DMaMnKkbPbB/XpHwrM
	rJRxsmsKmVUzR5SHvn8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni5HR-003FAd-AL; Sat, 23 Apr 2022 02:13:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni5HD-003F5R-TV; Sat, 23 Apr 2022 02:13:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 471A1614AD;
 Sat, 23 Apr 2022 02:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E931C385A4;
 Sat, 23 Apr 2022 02:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650680014;
 bh=Epma3yKBMOxjFrsFxTUT9AvMzDxrBTfVtmIRQSfWV78=;
 h=In-Reply-To:References:Subject:From:Cc:List-Id:To:Date:From;
 b=XGTM3H3uYNKvF18vUA4+y54w6J6mWhg1K8hJQPNRLV9JT3xytclxUqB9NbiVnYbNU
 COdxkI3NrhJduV7wsTH+x51c4Y0UMYuR1hFLonTun/gl5xaKGKTxtc58CNpJt+w9I6
 8OCl5xsprn7Oc34+XAE/GIZMNtsHhzwVKDbh8mQMgPxcOhS5ItLog/Rgbfe3Lcic1z
 iDVmolmINtW0IgbHUW1pybWfjal5Bq6RN9nMjbbOzfEbeYb+Ku76NH9IEkEg4DEnVR
 CfozBlehLaKvg1op0K7StCgTOGxbwfCYXrZS138iHoy2jxQJVK8Wx52mFfkDTSB3D7
 1NokYMxjozbhQ==
MIME-Version: 1.0
In-Reply-To: <20220314084409.84394-2-nbd@nbd.name>
References: <20220314084409.84394-1-nbd@nbd.name>
 <20220314084409.84394-2-nbd@nbd.name>
Subject: Re: [PATCH v10 1/6] dt-bindings: Add en7523-scu device tree binding
 documentation
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 John Crispin <john@phrozen.org>, Rob Herring <robh@kernel.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
To: Felix Fietkau <nbd@nbd.name>, Michael Turquette <mturquette@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, soc@kernel.org
Date: Fri, 22 Apr 2022 19:13:31 -0700
User-Agent: alot/0.10
Message-Id: <20220423021334.9E931C385A4@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_191336_063259_C6F61843 
X-CRM114-Status: UNSURE (   6.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Felix Fietkau (2022-03-14 01:44:03)
> From: John Crispin <john@phrozen.org>
> 
> Adds device tree binding documentation for clocks in the EN7523 SOC.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> ---

I removed the duplicate SoB

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
