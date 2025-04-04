Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C221C36010
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Apr 2025 14:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7cQKBN+UbGA+zdtlFTWd/84IZ7FHX3JaNXUpQMP2xo=; b=SN1gRGWDdODVk3PHrVLmlF9J9N
	uf77ltTlqXEIAxx4WpKE+sP6FrZD8Qd5YzINYAJD+HRKIbjlALEdzt9KM5jjc13TBTpbJU2qx6MWs
	Kjtw+Db84TgJFuygoEJR8tKut/lLx6y+ReJhQIQPUbedsZJt0kdyD+VODjVKTESUwrkmA0ZZ3qtt2
	Qx9ETpxEWR0CYxOBZLeRce2hvpTouCX7Ms7x8Q2wDIin50pswnnnBzJ7A/PbIlgLBTVKqM9TFF41o
	Pn/7a5le1DmcQaPlzpjDlMxF5UZijnU7judIaaDanmrgq7Ud6J5n7S8X7MQGtnEGXQ3wNY/8OnvwP
	JlSzKgyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0iVm-0000000C4xk-2OMS;
	Fri, 04 Apr 2025 14:59:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0iSl-0000000C48I-4Asj;
	Fri, 04 Apr 2025 14:56:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A6B015C6CA4;
	Fri,  4 Apr 2025 14:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F3BC4CEDD;
	Fri,  4 Apr 2025 14:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743778565;
	bh=ZKC9yGDKP7ZL9SggbwEVntc6h66l9cUcpFwGsLIdwyU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=lYq0AhwkZcTUWyVwicaZ1vvM7sdLhXVWb88uIIREKJeM4f4dFtPRR+5YtBnIQ3+8S
	 4rmWfDWxmKz8BkutmGYcsQCbqBKQsOpb3vKdZoOj3zlMzyIr63+JtEno2kDqBxKGaL
	 uSpnRzGTivLPzIQSa2vlGQgFkEoHK4Djr247EPkB1MI0mgoQqCboWVbZe1YDRxstNw
	 XL6TPr4SJ3ntriVvow1CY9ZhW/TaC9VWQaFtDYXQkEycuv4vNUekj/x3m4CmjcWhg8
	 J/6CXGfE842P8cqvOhDfI5vtBqXZj1W2sAP8ubZBZr4Jve8ltlaLGaw/5ccWSyVqKq
	 iX0gZX5BzPDSQ==
Date: Fri, 04 Apr 2025 09:56:03 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, linux-rockchip@lists.infradead.org, 
 Daniel Machon <daniel.machon@microchip.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 UNGLinuxDriver@microchip.com, Jerome Brunet <jbrunet@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, linux-sunxi@lists.linux.dev, 
 Liviu Dudau <liviu.dudau@arm.com>, linux-arm-kernel@lists.infradead.org, 
 Fabio Estevam <festevam@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 linux-renesas-soc@vger.kernel.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Viresh Kumar <vireshk@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, zhouyanjie@wanyeetech.com, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Heiko Stuebner <heiko@sntech.de>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-pm@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 Samuel Holland <samuel@sholland.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 linux-arm-msm@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, 
 linux-amlogic@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
In-Reply-To: <20250403-dt-cpu-schema-v1-14-076be7171a85@kernel.org>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-14-076be7171a85@kernel.org>
Message-Id: <174377856145.1313232.11316769002552655294.robh@kernel.org>
Subject: Re: [PATCH 14/19] dt-bindings: arm/cpus: Add schemas for
 "enable-method" dependencies
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_075608_118521_8DAB551F 
X-CRM114-Status: GOOD (  13.53  )
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


On Thu, 03 Apr 2025 21:59:35 -0500, Rob Herring (Arm) wrote:
> Replace the prose for properties dependent on specific "enable-method"
> values with schemas defining the same requirements.
> 
> Both "qcom,acc" and "qcom,saw" properties appear to be required for any
> of the Qualcomm enable-method values, so the schema is a bit simpler
> than what the text said. The references to arm/msm/qcom,saw2.txt and
> arm/msm/qcom,kpss-acc.txt are out of date, so just drop them.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 82 +++++++++++++++----------
>  1 file changed, 49 insertions(+), 33 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.example.dtb: cpu@0: 'qcom,acc' is a required property
	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#

doc reference errors (make refcheckdocs):
Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
Documentation/translations/ja_JP/process/submit-checklist.rst: Documentation/translations/ja_JP/SubmitChecklist

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250403-dt-cpu-schema-v1-14-076be7171a85@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


