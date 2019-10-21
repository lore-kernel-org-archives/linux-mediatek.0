Return-Path: <SRS0=JbG7=YO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65AA4CA9EA0
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2019 00:41:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3075C207FC
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2019 00:41:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SAiVUs/Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mLAX2bW2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3075C207FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bTlS/DjsQH2fmhvW7MjW58UqMkQbePOHk5ZeFiIzp9Y=; b=SAiVUs/Yqmrh0P
	N/elwFxNrmNW81BuFBlZg32meNeraG6i0YyjMaOzmGYX86tU//kCa9dXUSJb/WadsjWLz6hBnCDiW
	oWME2Uu6LdpiTPWpD3gE/OIINtIMRp4huxuGOmA6Q4zOg7iGRAdZ6I2BDBsbSRZKbsQj4WmKEdI95
	rDYicIh42cxr/tQWg0ZWEIwrxUFASOp6/eblkIa7/GeuiCY18TrQNnhpoMnkzKwoUZQGZ32xZXUum
	KLlA+WDgX5wLLRjbcwRiwKD7IvTJpcOaET0grZrgTBY6wWB+30z2iiHrc55BlQuLipFUWyMm9k+bU
	MNGtOOONRSTxFtWmaNfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMLlc-0003Qo-Pj; Mon, 21 Oct 2019 00:41:48 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMLlS-0003GL-4Z
 for linux-mediatek@lists.infradead.org; Mon, 21 Oct 2019 00:41:39 +0000
Received: by mail-lf1-x144.google.com with SMTP id 195so8595177lfj.6
 for <linux-mediatek@lists.infradead.org>; Sun, 20 Oct 2019 17:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G+bmNIcrnyOIzrPmxwvjVgZiBAJd1fM+3wbATTNFbEI=;
 b=mLAX2bW2iX5ydQdQba6GHiEYCGuP3ryiI3ZGiaySwfC3y8Qhd9wrPmUBZI5OiTWvwT
 wPQOA7PyZyWL2zcmKOeQYLc5fwcB20NjJgUletSLLOah1HsnJ29+iSbQWuDyeB8SQWTn
 Ld9wXWuG66dbY+YAzanSVTWfpZmcgDAXgJNhEPK2VzpwUHVRm1zO39/xCUi38A7323Oi
 8WDhYNPbYDeIKFkc63K7uVj7xqE2WZfnxrd0duu6RROq5ixmu/g8+fs0dtIJUe/Ifdu9
 SuQWLo/Gfs8DPn2mc6jejc3Iw/NOwYGQNv5V97tLh1nivdcvh1Iyg/RHcLvVBnaKRX2g
 xGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G+bmNIcrnyOIzrPmxwvjVgZiBAJd1fM+3wbATTNFbEI=;
 b=althP6NsWJN1AJsMzP8Hmjv8WC3ukoGX0c9kQ5b5kN6xPJd5JGnZlhytVtKrq+uOrz
 wQ1F7O6jEAaWTmlvGFqzLM6Hy6srwlOrxbuxSBuCiy6vgFq8zBlDj2YGGvPH8hMHz3Wx
 sSTrwhDVxUdSCgzkWlu536WNIs7u0fjfWN1MqOYtoPVBTXHOqv0EUtHTxC1SwOe51QRw
 Yei3NqI/2MDJ7FTaRqaxjzJXNE9nkKb7dhu8VnnOcTcTg7cFSG5uV3TIVpqHiVaoD8dS
 u3SXIQgdad0T/2wdoDDrqEuVkzmCVQi/ajkR+1UTneXmyp6yRUMQfzLZZ8Rz8Wn/Kw8P
 anJw==
X-Gm-Message-State: APjAAAWzEBrm4x8uLy6Ff7aWaR+vFWFMYkSExM5Pm5eDLoKXf9oB81tP
 4dcj0AdcFe0x+Pp8Ixe/P6A8hktimlf94JBlxc367Q==
X-Google-Smtp-Source: APXvYqwIyNjawN1mEod1YyKYfTSA83orVXCv2STO/nJGv1866U3Q0y95F+b9JrmTVy90oQrZGDMZUrGbFb9ILn0rOUI=
X-Received: by 2002:a19:f018:: with SMTP id p24mr2105108lfc.93.1571618496433; 
 Sun, 20 Oct 2019 17:41:36 -0700 (PDT)
MIME-Version: 1.0
References: <20191016200647.32050-1-robh@kernel.org>
 <20191016200647.32050-19-robh@kernel.org>
In-Reply-To: <20191016200647.32050-19-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 21 Oct 2019 02:41:24 +0200
Message-ID: <CACRpkdYq86_h7yPr3+UJryNWHLqrzrR0SbhWRALcEVCR-pE9+Q@mail.gmail.com>
Subject: Re: [PATCH v2 18/25] PCI: versatile: Enable COMPILE_TEST
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191020_174138_176761_B47768BB 
X-CRM114-Status: UNSURE (   8.51  )
X-CRM114-Notice: Please train this message.
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
Cc: Heiko Stuebner <heiko@sntech.de>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 linux-pci <linux-pci@vger.kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Toan Le <toan@os.amperecomputing.com>, Will Deacon <will@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Michal Simek <michal.simek@xilinx.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Ray Jui <rjui@broadcom.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Andrew Murray <andrew.murray@arm.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 rfi@lists.rocketboards.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Tom Joseph <tjoseph@cadence.com>, Simon Horman <horms@verge.net.au>,
 Srinath Mannam <srinath.mannam@broadcom.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Ley Foon Tan <lftan@altera.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Oct 16, 2019 at 10:07 PM Rob Herring <robh@kernel.org> wrote:

> Since commit a574795bc383 ("PCI: generic,versatile: Remove unused
> pci_sys_data structures") the build dependency on ARM is gone, so let's
> enable COMPILE_TEST for versatile.
>
> Reviewed-by: Andrew Murray <andrew.murray@arm.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Rob Herring <robh@kernel.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
