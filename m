Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA514C3601E
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Apr 2025 12:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tsg5nDHo3K5yJtlaOVk/sU1qflMVVtw9h0gS52ClYtM=; b=NQrlTyVDHCDxWufkT+Cb13GLxG
	WefGYsdd22y171kjgX6kvpsIBueVX5YVgoLH0AXE6j0FGAKcukVIkXBkBf9aEaofN/GCiO9q+rbA0
	Ky82mPEGAagKfJV76Ef9VNd4znNni+x9XA7lQLEtRFnJBIoeGhhzmFn/QICkJ5kdzZm7o+O+c8MI8
	1eZiboDSrh5oT9ZoHRZCKIBdLMNsnTKjsL93XdUXuN32uAha9yrCofWtbUQHsV8yQkqUi9FDsbywC
	DCcn6Jc1Uq4jLMIblLOGzbN4Uiy7Ffvk46bq+isiiT2T+lhwFYo4P28EuqlVfgCllcUF9GU+eCCfi
	yID7HpLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lqM-00000000Kii-3vIS;
	Mon, 07 Apr 2025 12:44:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lcF-00000000FRm-196B;
	Mon, 07 Apr 2025 12:30:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1516F106F;
	Mon,  7 Apr 2025 05:30:16 -0700 (PDT)
Received: from bogus (unknown [10.57.41.33])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 100F53F694;
	Mon,  7 Apr 2025 05:30:05 -0700 (PDT)
Date: Mon, 7 Apr 2025 13:30:03 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
	Conor Dooley <conor@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mips@vger.kernel.org, imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 18/19] dt-bindings: arm/cpus: Add power-domains
 constraints
Message-ID: <20250407-aloof-fox-of-relaxation-62963a@sudeepholla>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-18-076be7171a85@kernel.org>
 <CAPDyKFrFRrPVJ_t0JrAE1VTbS02hwr=L-EHtqb7CQiWzB1MnQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFrFRrPVJ_t0JrAE1VTbS02hwr=L-EHtqb7CQiWzB1MnQg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_053015_399846_0D5B2DCA 
X-CRM114-Status: GOOD (  16.60  )
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

On Fri, Apr 04, 2025 at 12:36:33PM +0200, Ulf Hansson wrote:
> On Fri, 4 Apr 2025 at 05:06, Rob Herring (Arm) <robh@kernel.org> wrote:
> >
> > The "power-domains" and "power-domains-names" properties are missing any
> > constraints. Add the constraints and drop the generic descriptions.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/arm/cpus.yaml | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
> > index 6f74ebfd38df..5bd5822db8af 100644
> > --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> > @@ -313,19 +313,15 @@ properties:
> >      maxItems: 1
> >
> >    power-domains:
> > -    description:
> > -      List of phandles and PM domain specifiers, as defined by bindings of the
> > -      PM domain provider (see also ../power_domain.txt).
> > +    maxItems: 1
> 
> There are more than one in some cases. The most is probably three, I think.
>

+1, there are users using "perf" and "psci" together now.

-- 
Regards,
Sudeep

