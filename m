Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B798C369A8
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Apr 2025 14:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hwe7PzZjmIVujDvKYSq5YTMC3Y0bQaSCO+3w6irjpgM=; b=Y7n7ufISFaZ2y0MEfeneF93A45
	W96DP8MFVUDaINfH45nsItHAQDvjM5uc1rVKeHn0awxUvNWjbtF54IVaoJkh86NpsNehFbd01rSpD
	elHHOlEhlROoEkRWdLqtnWXYtdghsY09CbxLF9lTaaLEavsSa0PxJOu4nXgu24++92Dht2ZTIZNp8
	qk/4jGqKD6fQM35B6kwn9fj38wT8mssh7Mdrq+cTOd6VE6vKVbn1VmvOacp8BdHE9ujDmVt45cfE+
	ElewdRKnf8KHbKIbmzxINW7GU3Khw300jYFnWeE6c/WuIukcMjplfJtC5EKzGzd9u94E2OUT4dKR5
	23IZlC4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2sd2-0000000AnAY-1J0R;
	Thu, 10 Apr 2025 14:11:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2scy-0000000An9F-38US;
	Thu, 10 Apr 2025 14:11:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 34EFA49FCA;
	Thu, 10 Apr 2025 14:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D95C1C4CEE9;
	Thu, 10 Apr 2025 14:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744294295;
	bh=rco72FMDY4JgO03QNoKdCEdvvo+YwCaCCrx/8pDGOPE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eQ7IoFkt+osTTj0Vi2+kpNtwDFjpZvXxiewz37bA8FBL4ZFA+CuGaUhIkcbbXR0k6
	 29Fy2FHt0RumRcvkuDYPQqmLh45tYMCsTeWcx/7yRedEvadWGSNT3qNQCaOEPWaIhi
	 sQ4M/3koFKQMQtD/p3dgWNUi+TktHMSbsFTetAE7iQAOPr1kFNMDHElpUIfORI75ih
	 Y1mz/jaogtjNAchtXKtaHV3jAfPhlwYK8l+Ev9ql2/fTarC9pdP6vCO+1LVsL1mN4F
	 wm3PLW30ItliFoXF10R7DtPFDDPMghDP0rRQVzEYt78nRT0N33cKXJqOrMXX+rXwSW
	 sXJVlxGKmrCOQ==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so1404872a12.0;
        Thu, 10 Apr 2025 07:11:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvGqZCx+/BcPIUjsrPCDRSYf0mTQPwKgMCSHk6QHiff/P78LbyDPY988s3+Yx8LdIp5Dn637wGsr9morCooRMTOA==@lists.infradead.org, AJvYcCV4J7Ac8+ur58JrdebXfYQseGluMpSGdWJOdmmoSUn7eGiCEoW74zD+h3Xk0qY2KldGWE17yuN/DwGawNHIuKs=@lists.infradead.org, AJvYcCVN8BKnb2mYOBKHcNuaSVZ0wMaLpcfR6OoPbpPS009SvFFfk1/CrkS5NOqYdZhfsbJcULukJtV9YvmvHzgpzCM=@lists.infradead.org, AJvYcCX37UvDzaUBiY7w4zipclNpoYApVUUkZFw0vk1gDEisPDgfL97d3GhX+5xhTknHk1+DQgadGm37tzt4LyqX@lists.infradead.org
X-Gm-Message-State: AOJu0YzSAgyoueBCogmFEA+J8E0+vw+/5b81btwH7U0fwOkEDTIq/+tD
	t72g6xj38aqSAt85ErrvcJ5Fy3jdW9QqZtoROFg/rISukB4KVgsGLgKbbYyrVKUnTTA3UNiz2PV
	3fFBunQSi4jFZ5JiSfq1ytZYW6w==
X-Google-Smtp-Source: AGHT+IGlh97um6SMQiGxBgsgdbsviDx65SZRgGYwOH79oWcJKJOpcvjinlVEV2oCvrCbvL9uHlFPqdqxcM1fMXmRyBY=
X-Received: by 2002:a05:6402:42c3:b0:5e4:d2c9:455c with SMTP id
 4fb4d7f45d1cf-5f3292682cfmr2701509a12.10.1744294294406; Thu, 10 Apr 2025
 07:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-14-076be7171a85@kernel.org> <174377856145.1313232.11316769002552655294.robh@kernel.org>
In-Reply-To: <174377856145.1313232.11316769002552655294.robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 10 Apr 2025 09:11:22 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKiduJBRBuRS364_bSjEfC_cvgyicZX1BwvNyb1+GVc3w@mail.gmail.com>
X-Gm-Features: ATxdqUEvfSUaWUzPsxy3ohcumibpamjDRmILBf-6gs6fjUtKKg1MwCu-Qt45NOQ
Message-ID: <CAL_JsqKiduJBRBuRS364_bSjEfC_cvgyicZX1BwvNyb1+GVc3w@mail.gmail.com>
Subject: Re: [PATCH 14/19] dt-bindings: arm/cpus: Add schemas for
 "enable-method" dependencies
To: "Rob Herring (Arm)" <robh@kernel.org>, Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
	linux-rockchip@lists.infradead.org, 
	Daniel Machon <daniel.machon@microchip.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, UNGLinuxDriver@microchip.com, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, linux-sunxi@lists.linux.dev, 
	Liviu Dudau <liviu.dudau@arm.com>, linux-arm-kernel@lists.infradead.org, 
	Fabio Estevam <festevam@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Stephen Boyd <sboyd@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-renesas-soc@vger.kernel.org, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Viresh Kumar <vireshk@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, zhouyanjie@wanyeetech.com, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Heiko Stuebner <heiko@sntech.de>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, linux-pm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	Samuel Holland <samuel@sholland.org>, Sudeep Holla <sudeep.holla@arm.com>, Nishanth Menon <nm@ti.com>, 
	devicetree@vger.kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	linux-arm-msm@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	linux-amlogic@lists.infradead.org, Sascha Hauer <s.hauer@pengutronix.de>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_071136_823470_AE96B416 
X-CRM114-Status: GOOD (  14.37  )
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

On Fri, Apr 4, 2025 at 9:56=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org> =
wrote:
>
>
> On Thu, 03 Apr 2025 21:59:35 -0500, Rob Herring (Arm) wrote:
> > Replace the prose for properties dependent on specific "enable-method"
> > values with schemas defining the same requirements.
> >
> > Both "qcom,acc" and "qcom,saw" properties appear to be required for any
> > of the Qualcomm enable-method values, so the schema is a bit simpler
> > than what the text said. The references to arm/msm/qcom,saw2.txt and
> > arm/msm/qcom,kpss-acc.txt are out of date, so just drop them.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/arm/cpus.yaml | 82 +++++++++++++++--=
--------
> >  1 file changed, 49 insertions(+), 33 deletions(-)
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/s=
oc/qcom/qcom,saw2.example.dtb: cpu@0: 'qcom,acc' is a required property
>         from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#

Any Qcom folks want to tell me whether both qcom,acc and qcom,saw are
required or not? All the actual users have both.

Rob

