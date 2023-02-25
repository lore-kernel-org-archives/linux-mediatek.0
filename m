Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CEA6C7EE23
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Feb 2023 19:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ehYtjN5CZeUvK2Vk+Sr5h+rU0UfW3i1Sw0qdtskSkww=; b=YuoZ2zV9jKjdQkrBANhZBZFMz7
	hQUMwFLuvKIbctZc7689er9tyi3D1EJKJOx6wzjd71Z5JJZ3LKuRM09gcfh/MCRleT9o213vq7KJt
	hIS1/IpRSzcd2OjpfLgRJyFiFCgd/EWW+X4oFeZiwdjvjMfYjmEL/e5+TklWEZ18wOS/cAegrP+/U
	5+Nd0O9WMjPXln2iZTu1/qD9+mAxW3f/TsRJ9i3wX0wrB2dirofSbo3MEh68wo/6OrRF2JTigWjS3
	coT0LwTHFwm9Z9QT6YEnWF2unWheAjrQKi+WNv5FE0oSwzK8MmExX13X+V5z/Ahx0J3jkkxV0agAv
	JTEWQ7Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pW009-006Bj0-SQ; Sat, 25 Feb 2023 19:14:33 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVzzw-006Bb9-0r; Sat, 25 Feb 2023 19:14:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ehYtjN5CZeUvK2Vk+Sr5h+rU0UfW3i1Sw0qdtskSkww=; b=TsFTaEMNxnretKmFsnkHA7QgmE
	RiPnJOkEtzPBADPvihuji//flzqjNOtVJBL/M1qRL/wglTt6uof20tqrf9t+NnLMiLKYX6OBj6xmD
	FlzzX6J/X8ASIHslft7DA3GT3+8oYGWUlTZS9Xj3lnrR8RwVBtODmLZiHR+3+/s3MOmWrz233Apk5
	2pNpA0k8Okz2pGgxoTyMzJhKF1mgatAblLBeZi4iN+g755f7tab0jjL7iHa4TpAxAN2pGHsB8Y9Sv
	Xp5AQoS1wjdHF12sGVG6FG/fNGM+3e5YlfYRDuA+UnXQGLe5kA/jsRonrq1sqXieAPaR5vb8aWTU6
	VT6k0qMw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:46530)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pVzxW-0001lq-LO; Sat, 25 Feb 2023 19:11:50 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pVzxQ-0008PB-7F; Sat, 25 Feb 2023 19:11:44 +0000
Date: Sat, 25 Feb 2023 19:11:44 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Simon Horman <simon.horman@corigine.com>
Cc: Daniel Golle <daniel@makrotopia.org>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC net-next 4/4] net: mtk_eth_soc: note interface modes
 not set in supported_interfaces
Message-ID: <Y/pdcIKpM1QjdUdI@shell.armlinux.org.uk>
References: <Y/ivHGroIVTe4YP/@shell.armlinux.org.uk>
 <E1pVXJK-00CTAl-V7@rmk-PC.armlinux.org.uk>
 <Y/o8DkLO9CY+ROkH@corigine.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/o8DkLO9CY+ROkH@corigine.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230225_111420_108006_1A67320F 
X-CRM114-Status: GOOD (  17.27  )
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

On Sat, Feb 25, 2023 at 05:49:18PM +0100, Simon Horman wrote:
> On Fri, Feb 24, 2023 at 12:36:26PM +0000, Russell King (Oracle) wrote:
> 
> Hi Russell,
> 
> I think it would be good to add a patch description here.
> 
> Code change looks good to me.

As noted in the cover message, this is to highlight the issue to
hopefully get folk to think what we should do about RMII and REVMII
in this driver - basically, should we continue to support them, or
remove it completely.

Either way, this patch won't hit net-next in its current form.

Essentially, the choice is either we remove these two switch cases,
or we add these interface modes to the supported_interfaces array.

I'd rather those with mtk_eth_soc made the decision, even though it
is highly unlikely that these modes are used on the hardware they
have - as I don't have any mediatek hardware.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

