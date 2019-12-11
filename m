Return-Path: <SRS0=jhbW=2B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F21FC2D0C6
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 22:49:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72AED20836
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 22:49:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tAXyMZ0B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="MeiVsFdi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72AED20836
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-ID:
	Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:
	Date:Reply-To:Content-Transfer-Encoding:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3WHtrth2dXFEgv5cgCKUMAG2lW+Ng0bd6Y9EcVkrGa0=; b=tAXyMZ0B/44JMgICzeFXfd+iS
	pEbyTcoSirK53P2fHpJqVmdItOS8N6Je5sgJCbC7rDBzn8qQaPvLif+QDRypQ6Y3NMoPpHnnxYhB+
	5BRcZJPiMuw7MWSB3zQaLRcCi8zMpbFlLMNJf2zzZN43LZa1yUhvXKoaph9QXVzyHNKKxZ4QiBLQH
	nJqKdv0LWgV0CrlDKwaCHkeYJYuNUq3W/lxDuPM4s5MxWXW6YXnBRr39KyQ4q0ndLT7YhITIoDOdw
	I9Q1qx3oeujX82Twvnoijw/JJFgjAWDEd2uKF534mvdjfj5WRaUJPBSQnJcfrVqzD2oTxeGIZsdyV
	Hc0/vTlug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifAnB-0008Ui-Uv; Wed, 11 Dec 2019 22:49:13 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifAn6-0008SA-NV
 for linux-mediatek@lists.infradead.org; Wed, 11 Dec 2019 22:49:11 +0000
Received: by mail-pg1-x541.google.com with SMTP id x8so76280pgk.8
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Dec 2019 14:49:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version:content-id;
 bh=q5INj5K/FoyzGZq3Fl+iF+CitcbMs72mX5maGlskDRo=;
 b=MeiVsFdiPFAc4aA9Fp5QodpjTa9d1iLK9U7j394vvMoHJpAVmuN2Y3a9BJ3UUPWt5+
 HKMLOFQpN/heIfaXflEC0NGqrYW2v8lqUfNR2H69h7LS6RyNmVSGnCOtp0YEB2aAKgXg
 Poy0jFUu7bEAvuPb8aqdVDIJS682+v52754AmMJvd30TEbGUD3C2qQOUl3ehrSU6Silz
 6i8Va8FmxLpeMozyM0XgH53XNjsID7mKpf3Qu1+8PnP7Q2ahYuIVS2rYdJwkhiSr53bK
 rGs4YwO5SDcGW2nqyUbX1I1zN/PRLdaZVY4W6B4mJ0usMXLR4szgEhNh6R2evbfZxzHt
 BGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version:content-id;
 bh=q5INj5K/FoyzGZq3Fl+iF+CitcbMs72mX5maGlskDRo=;
 b=KAeyVBR4HPLCLXDaKqu0zFrbKg/pfgG9u5PAXiuhXs6Cvun3mE9CRyDzHIFPQTVfUC
 +WUyrn9f92v24+4rklaH0hZK/k/8jN+PuEfXwCVgDHNSFdHSVY9ZK5QBaJdXkGY4zmMO
 9omlQdRX0mNisiMbRoNU4aS9xgAYBSZDQSGsjS9sndA5pr5Whwix5xOpgY1AEiT6fxbX
 OQ5yxXu29LJw9nECzCvhWRsCWHUWyFAIouFFDOLNi7+XGmpsOEq81l6TI73tRS274/xM
 kbQ+GjGT7igDYzZ0vrmx/Skt54I7Cpnu2JYYh1gmlaDHdbgZAyCC4Ob0aMb6A7wPA2wO
 ZLzg==
X-Gm-Message-State: APjAAAXSbf9XrGWp/EVlLVNGoNx9YlwU+sUN4mgbk1zORFNTl1YCZ/sI
 nY5CT5DA4MFAR2QIP/QaFtskDA==
X-Google-Smtp-Source: APXvYqxZv/x8+6gPs+lvJuUwoBOCwIXFbxQfMv+55zj6XHXc7FfvAo4rlYoWWIsIgkOum3WZTwNW0A==
X-Received: by 2002:a63:78cf:: with SMTP id t198mr6714132pgc.287.1576104547592; 
 Wed, 11 Dec 2019 14:49:07 -0800 (PST)
Received: from localhost ([184.105.100.2])
 by smtp.gmail.com with ESMTPSA id h6sm3877324pgq.61.2019.12.11.14.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 14:49:06 -0800 (PST)
Date: Wed, 11 Dec 2019 14:49:06 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [PATCH 08/17] clk: imx: convert to devm_platform_ioremap_resource
In-Reply-To: <76d72777-b144-0679-1f4c-1136496a5f06@suse.de>
Message-ID: <alpine.DEB.2.21.9999.1912111411120.73923@viisi.sifive.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
 <20191209195749.868-8-tiny.windzz@gmail.com>
 <VI1PR04MB7023BD6E46B6DEEBBB762060EE580@VI1PR04MB7023.eurprd04.prod.outlook.com>
 <20191210132146.GF2703785@ulmo>
 <8ff73b97-cf2e-0c91-2764-05ce4c548b06@suse.de>
 <alpine.DEB.2.21.999.1912111751490.32095@utopia.booyaka.com>
 <76d72777-b144-0679-1f4c-1136496a5f06@suse.de>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1646688419-1576102796=:73923"
Content-ID: <alpine.DEB.2.21.9999.1912111420030.73923@viisi.sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_144908_989424_6B4A1B85 
X-CRM114-Status: GOOD (  10.10  )
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
Cc: "kstewart@linuxfoundation.org" <kstewart@linuxfoundation.org>,
 "pgaikwad@nvidia.com" <pgaikwad@nvidia.com>,
 "heiko@sntech.de" <heiko@sntech.de>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "chunhui.dai@mediatek.com" <chunhui.dai@mediatek.com>,
 Yangtao Li <tiny.windzz@gmail.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "nsekhar@ti.com" <nsekhar@ti.com>,
 "tomasz.figa@gmail.com" <tomasz.figa@gmail.com>,
 "rfontana@redhat.com" <rfontana@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 "weiyongjun1@huawei.com" <weiyongjun1@huawei.com>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "s.nawrocki@samsung.com" <s.nawrocki@samsung.com>,
 "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Leonard Crestez <leonard.crestez@nxp.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "emilio@elopez.com.ar" <emilio@elopez.com.ar>,
 "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>,
 "allison@lohutok.net" <allison@lohutok.net>,
 Fabien DESSENNE <fabien.dessenne@st.com>,
 "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
 "cw00.choi@samsung.com" <cw00.choi@samsung.com>,
 "wens@csie.org" <wens@csie.org>, "agross@kernel.org" <agross@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 dl-linux-imx <linux-imx@nxp.com>,
 "Eugeniy.Paltsev@synopsys.com" <Eugeniy.Paltsev@synopsys.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "swinslow@gmail.com" <swinslow@gmail.com>,
 "john@phrozen.org" <john@phrozen.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Aisheng Dong <aisheng.dong@nxp.com>, Paul Walmsley <paul@pwsan.com>,
 James Tai <james.tai@realtek.com>, Cheng-Yu Lee <cylee12@realtek.com>,
 "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "pdeschrijver@nvidia.com" <pdeschrijver@nvidia.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "t-kristo@ti.com" <t-kristo@ti.com>,
 "dinguyen@kernel.org" <dinguyen@kernel.org>,
 "kgene@kernel.org" <kgene@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "wangyan.wang@mediatek.com" <wangyan.wang@mediatek.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1646688419-1576102796=:73923
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <alpine.DEB.2.21.9999.1912111420031.73923@viisi.sifive.com>

On Wed, 11 Dec 2019, Andreas F=E4rber wrote:

> Blocks do have names, but they don't always group registers of the same
> kind, as Linux expects it

Linux does not expect that all of the registers in the same IP block are=20
of the same kind.  That's part of the reason why Linux frameworks exist. =
=20
To consider clocks as the present example, you're welcome to register=20
local IP block clock control registers in the local IP block driver via=20
the clock framework.  There's no need for a separate clock driver with an=
=20
overlapping address range, or anything like that.

This is nothing new with Realtek.  IP blocks that contain many different=20
kinds of registers have had Linux driver support without requiring=20
overlapping register address ranges long before Realtek ARM SoCs=20
appeared.

> Just please accept that hardware does not always allow for unique=20
> contiguous memory reservations

Hardware designs do in fact mandate unique contiguous memory reservations,=
=20
otherwise address decoding would be indeterministic.  What they don't=20
mandate is that all of the registers in that region be all of one kind.=20
It's certainly possible to have an SoC with one giant IP block with all=20
registers mixed together.  Even in that case, it is still incorrect to=20
have multiple DT entries with overlapping register address ranges.

It sounds like you're thinking of the difficulties of figuring out how to=
=20
structure the software driver support for those mixed IP block as a Linux=
=20
driver: where it would fit in the tree, what frameworks it would need to=20
register with, and who would maintain it.  Those issues certainly merit=20
careful thought and consideration.  They aren't related to multiple=20
overlapping address ranges.


- Paul
--8323329-1646688419-1576102796=:73923
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--8323329-1646688419-1576102796=:73923--

