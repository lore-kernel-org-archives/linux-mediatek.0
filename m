Return-Path: <SRS0=NAie=2C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0CE7C43603
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 05:38:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1DEA2073D
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 05:38:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LmQxDXlX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1DEA2073D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q84F+wSVxCrFY1G4MmoOVVkeRQLd5TdT/hK7+UpkEM8=; b=LmQxDXlXKa5Pda
	WF+jOEupiEsWMxcPgRajhmdFGGfzNw3TNNiqG6ZQ1y26w5HdFFZmstKaKxNSvjz1zMQNqbdVrQyyH
	FSgE5pYlrIrFNT7zjVNVcCOCp3BsD0R97ALjhTTNuq+8R1QT/ABf4gBInftoFF1WPpP3UcRYs8omq
	159uFbh/xdrBmToXWzUVkjowpMIOWf/E0UjcelN+Yw98gNfonGdZ9uZzoqUuoRdNBZnXgK9MZXaRn
	oj/Dn4hSTq7lT+KzuGBbouBKWkmoCBcnT5KT01aQEqvM0cYNs5tqs+38NIDlcXrKqAOKWQwL3oD5V
	wCBkqHoU1IMeDBOG1eww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifHBR-0003aM-FQ; Thu, 12 Dec 2019 05:38:41 +0000
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifHBO-0003Zn-6C; Thu, 12 Dec 2019 05:38:40 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 56D04B21C;
 Thu, 12 Dec 2019 05:38:35 +0000 (UTC)
Subject: Re: [PATCH 08/17] clk: imx: convert to devm_platform_ioremap_resource
To: Paul Walmsley <paul.walmsley@sifive.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
 <20191209195749.868-8-tiny.windzz@gmail.com>
 <VI1PR04MB7023BD6E46B6DEEBBB762060EE580@VI1PR04MB7023.eurprd04.prod.outlook.com>
 <20191210132146.GF2703785@ulmo>
 <8ff73b97-cf2e-0c91-2764-05ce4c548b06@suse.de>
 <alpine.DEB.2.21.999.1912111751490.32095@utopia.booyaka.com>
 <76d72777-b144-0679-1f4c-1136496a5f06@suse.de>
 <alpine.DEB.2.21.9999.1912111411120.73923@viisi.sifive.com>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <1a415db0-9313-72c3-e02c-0f3b8e0e5da0@suse.de>
Date: Thu, 12 Dec 2019 06:38:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.9999.1912111411120.73923@viisi.sifive.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_213838_523505_1851FE56 
X-CRM114-Status: GOOD (  26.18  )
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 11.12.19 um 23:49 schrieb Paul Walmsley:
> On Wed, 11 Dec 2019, Andreas F=E4rber wrote:
> =

>> Blocks do have names, but they don't always group registers of the same
>> kind, as Linux expects it
> =

> Linux does not expect that all of the registers in the same IP block are =

> of the same kind.  That's part of the reason why Linux frameworks exist.  =

> To consider clocks as the present example, you're welcome to register =

> local IP block clock control registers in the local IP block driver via =

> the clock framework.  There's no need for a separate clock driver with an =

> overlapping address range, or anything like that.

If I throw random code into drivers/mfd/ it will not get proper review.

We rely on clk drivers going into drivers/clk/, even if I could
theoretically register clks also from other parts of the code base -
which will then require complex Kconfig dependencies or #ifdef'ery, not
to mention the nightmares of collecting Acks and figuring out through
whose tree which patches go.

> =

> This is nothing new with Realtek.

As this NXP patch proves. :)

>  IP blocks that contain many different =

> kinds of registers have had Linux driver support without requiring =

> overlapping register address ranges long before Realtek ARM SoCs =

> appeared.

Hey, you're the one that's trying to pin this on Realtek, not me!
STM32 RCC is another example I know, also Allwinner, etc. My point was
precisely that this is - for good or bad - a rather common scenario that
we need to deal with.

>> Just please accept that hardware does not always allow for unique =

>> contiguous memory reservations
> =

> Hardware designs do in fact mandate unique contiguous memory reservations,
> otherwise address decoding would be indeterministic.

Are you not understanding what I'm saying or intentionally gas-lighting?
A contiguous memory _reservation_ is a range of memory like <0xdead0000
0x100> that the kernel (software!) blocks other drivers (software!) from
reserving. This has _nothing_ to do with hardware address line decoding.
It's still about devm_platform_ioremap_resource() and related APIs. Do a
`cat /proc/iomem` to see, e.g., "98007800-9800781f : serial" reservation
in successful case; as mentioned by Leonard, an unsuccessful reservation
usually causes the driver to fail to probe and thus be unavailable.

>  What they don't =

> mandate is that all of the registers in that region be all of one kind. =

> It's certainly possible to have an SoC with one giant IP block with all =

> registers mixed together.  Even in that case, it is still incorrect to =

> have multiple DT entries with overlapping register address ranges.

Says who? Since when? Can we maybe agree that incorrect !=3D invalid?

> It sounds like you're thinking of the difficulties of figuring out how to =

> structure the software driver support for those mixed IP block as a Linux =

> driver:

Yes, these are Linux kernel mailing lists and patches after all... I
don't design hardware, that's why I said we need to live with the flawed
reality of the actual hardware we get.

> where it would fit in the tree, what frameworks it would need to =

> register with, and who would maintain it.  Those issues certainly merit =

> careful thought and consideration.  They aren't related to multiple =

> overlapping address ranges.

Oh they are. Overlapping address ranges of DT nodes are a _result_ of
unexpected hardware design involving blocks not clearly separated the
same way as Linux subsystems (to distinguish from "frameworks") are.

The DT should describe the hardware blocks as they were designed, but on
the other hand, we need to describe it in a way that Linux drivers can
actually bind against the relevant parts and that those drivers can
operate efficiently. There is no ioremap-all-regs helper that I'm aware
of, for instance, as that would result in __iomem base addresses to be
stored per reg entry; compare that to just one for an overlapping range.

Example:

clk@f00 {
	reg =3D <0xf00 0x100>;
}

reset@f0f {
	reg =3D <0xf0c 0x4>;
};

This should be a valid DT example today, as long as the clk driver
doesn't mess with the reset register embedded within its range. In this
case they can't both reserve their ranges as they would mutually cause
each other to fail to probe, depending on probe order.

As I wrote, turning this into

clk@f00 {
	reg =3D <0xf00 0xc>, <0xf10 0xe0>;
};

reset@f0f {
	reg =3D <0xf0c 0x4>;
};

is helping no one and makes things much more complex, especially when
the number of carve-outs grows or is not predetermined, as I noted about
some of my cases. Thus I disagree with you about the overlapping ranges.

DT needs to be designed forward-looking rather than just around the
handful of registers we might read/write today, not just to relieve Rob
from excessive reviews.

My solution was to do

syscon@f00 {
	reg =3D <0xf00 0x100>;
	ranges =3D ...;

	clk@0 {
		reg =3D <0x0 0x100>;
	};

	reset@c {
		reg =3D <0xc 0x4>;
	};
};

https://patchwork.kernel.org/cover/11269453/
https://patchwork.kernel.org/cover/11269971/ (and more in my tree)

which clearly models the blocks and shares a syscon for most children,
other than pre-existing 8250 UART, I=B2C, etc. drivers using platform
helpers such as the one discussed here.

What we lose with syscon is reservations, i.e. /proc/iomem neither
showing the full syscon nor the drivers using parts of it, unless we
explicitly reserve the memory (syscon does the ioremap for us, so no
need for this devm_platform_ioremap_resource helper there).

Also please keep in mind that we actually want to get to the point where
new systems are booting and usable. At least in the Arm world we do have
hardware at plenty to boot Linux. Dying in DT-beauty then is
counter-productive; we also need to come to timely compromises for not
blocking other work. clk drivers don't need to be platform_drivers like
here and thus can coexist easier with other drivers (e.g., syscon
without child), but I clearly contradict the generality in which you
appear to rule out overlapping memory ranges, be it for siblings or for
parent/child.

Hiding overlaps in an mfd driver does not strike me as better than
openly declaring them - if the mfd components are not dynamic, then I
understood simple-mfd were the way to go, which requires some reg(s),
which then for convenience may overlap if there's no clear boundaries.

Regards,
Andreas

-- =

SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer
HRB 36809 (AG N=FCrnberg)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
