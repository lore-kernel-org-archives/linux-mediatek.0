Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3F0C2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 06:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mroxQTik8AaktZTK2fzLwUyunt3FpXi0JoT0lxzCm6k=; b=mTMPtbIXsiZuiWTaPAz/ajmDkN
	A3Gn2VRSxkIDdBRB+io5NXBWdjdeBIRvq/A/Kx2tVI87Ft1i/N99xd1yLTCNcIRiQIbv8QXsDlxEq
	wY41NzcMvEjRdoJOxewC2Ty+XQmgOjQ1jnOGSs1fWG7MDsZwbn3Xcgdxu32G6WsTcm6v+3s2XAEDL
	8Dv3umy3w28aBOOpC1yx0I5HOnRFR5nOfNaQ6y1xrY3hhs9tcRjLRUqeHiLSZ6ailjLRrt1OD2EU+
	9cvmVzTUjO29LwSkYZKwHJMwLr3QRiXea7YIdkkIPNpNq+zRXagCd3qsQelwmwbHVDWE9SiAM9C5Y
	i/GlR/TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMiSh-00000009Mh2-3t1x;
	Thu, 27 Jun 2024 06:18:27 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMiSU-00000009Mf4-0G4u;
	Thu, 27 Jun 2024 06:18:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EEB71CE2DA0;
	Thu, 27 Jun 2024 06:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DE35C2BBFC;
	Thu, 27 Jun 2024 06:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719469090;
	bh=MYFVjqg+EAkqvJ5mp4tbyCI2xi9AcHpRcZasjxXeeDo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=aqWnhYoz9EuT9cHl1Gq/f5pcneBmS9IR36dP7zgDhjMUnsFCPgj1WWnEGBu4cM2Cw
	 GzXpqmi+PzNZxSEn2ipLLHoHEQW0NFF0kWDv0JPH3Dt1GAqFvlhMSjRNY3xXw53OvR
	 6UMMzspy3V2xEDboD8+/H5zk6J5Gk+Ospr2hqXblnLWzWWzh2MBOvmkAeExn4fBby6
	 z2xF9bM/5pBSof9dWxmlvdYhx2Fmd3V5jlbARWrmcRZ8aFIO9Jncw1BWtijj37xFkh
	 fMFowpCbAapVBeByXxR7O1I+TXr99IyZ2zBXQDx0uRkT7HIRk4lvzxFGel9W4Fx7OC
	 1IMHHUWAcnSvQ==
Date: Thu, 27 Jun 2024 00:18:08 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Sean Wang <sean.wang@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 devicetree@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Eric Dumazet <edumazet@google.com>, linux-bluetooth@vger.kernel.org, 
 Marcel Holtmann <marcel@holtmann.org>, netdev@vger.kernel.org
In-Reply-To: <20240627054011.26621-1-zajec5@gmail.com>
References: <20240627054011.26621-1-zajec5@gmail.com>
Message-Id: <171946908894.1855961.17183583790942661835.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: net: bluetooth: convert MT7622 Bluetooth
 to the json-schema
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_231814_422613_953F3FC1 
X-CRM114-Status: UNSURE (   9.62  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Thu, 27 Jun 2024 07:40:11 +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This helps validating DTS files.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../bluetooth/mediatek,mt7622-bluetooth.yaml  | 61 +++++++++++++++++++
>  .../bindings/net/mediatek-bluetooth.txt       | 36 -----------
>  2 files changed, 61 insertions(+), 36 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7622-bluetooth.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7622-bluetooth.example.dtb: serial@1100c000: reg: [[0, 285261824], [0, 4096]] is too long
	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7622-bluetooth.example.dtb: serial@1100c000: Unevaluated properties are not allowed ('clock-names' was unexpected)
	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240627054011.26621-1-zajec5@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


