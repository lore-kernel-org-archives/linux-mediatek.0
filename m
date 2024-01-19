Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6B4C4725D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jan 2024 16:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AGRNxhDMi/k5YQaQHuywe9UxkvfxjWnt233hPEUmO18=; b=nG02kGCJtRcbm1Y2I3CfyEH9c0
	TzmHOHI+17adx9nFEscK9AAFsVRkCOvybYZlrxk0YimE/V19AIllmNmwnDzAOdE92fDXns0g6PNmg
	Jvv1+y7uU26EafON0YlGY8+5NuQOLjyfseNo4JwjwnZQ7s52MvhECXNmC9eXvn54fQixOKqDmD9jE
	Vd7rK22OFm4tBSzUad4jSrqeaVpyTAYEh0AdG/kh1283G9YjBn1ztqpZefVfxi611HwXTwMeLKxlB
	zxkRfuSsrm4tYK/PI365bOw0zWS8Ch74w1bqG/6XP8rPmgPfWgEra7sE2vOnIWZTXd/lQjn5tapDX
	QBQLqUsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQrz3-006ASq-38;
	Fri, 19 Jan 2024 16:44:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQryz-006AS7-2N;
	Fri, 19 Jan 2024 16:44:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 80B6861A1B;
	Fri, 19 Jan 2024 16:44:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27A60C433C7;
	Fri, 19 Jan 2024 16:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705682650;
	bh=rRw2O8xwrDlJ45VGXmvgJkqhcUfZQFmZYjMTGiQcFo0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q7kZGfi2i22e2F/TmsZJrGGsmi1v+fJ9bhNNWQLcIh56t/cwSl/tPVh0WD9bi/AEj
	 Y4toGR1r5VwBuR+dCg0x42dZdoR0WTCryYhydFUp7TQvIKMuzemhX/bYaVldx/nyAL
	 Jq2JrYHng9RIX6ivrVNikYrqbVdI/Q11/7fETP2FWoiD/1AAQ9WTeqDUOzM0yi9h5i
	 rtsllgRARjyaNb8br7SkPkjaDfdFzf+nyMzqXAVrTJNIBVUGB9Q/PNh0A8pxneHvpD
	 oNzkUIUn98Ovk/z75q0iJEbuZ/lvN3a4tzxcK2s8S0f8UYpm+U+76e5T7nLoP6if+O
	 zntyEg7xT6WBg==
Date: Fri, 19 Jan 2024 16:44:03 +0000
From: Conor Dooley <conor@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	Jason-ch Chen <jason-ch.chen@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	Singo Chang <singo.chang@mediatek.com>,
	Nancy Lin <nancy.lin@mediatek.com>,
	Shawn Sung <shawn.sung@mediatek.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 1/3] dt-bindings: mailbox: Add mediatek,gce-props.yaml
Message-ID: <20240119-demote-fragment-624a35367a87@spud>
References: <20240119063224.29671-1-jason-jh.lin@mediatek.com>
 <20240119063224.29671-2-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5+I8isPEC3Mumo7F"
Content-Disposition: inline
In-Reply-To: <20240119063224.29671-2-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_084442_282937_8B1C1AC1 
X-CRM114-Status: GOOD (  34.49  )
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


--5+I8isPEC3Mumo7F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Rob,

On Fri, Jan 19, 2024 at 02:32:22PM +0800, Jason-JH.Lin wrote:
> Add mediatek,gce-props.yaml for common GCE properties that is used for
> both mailbox providers and consumers. We place the common property
> "mediatek,gce-events" in this binding currently.
>=20
> The property "mediatek,gce-events" is used for GCE event ID corresponding
> to a hardware event signal sent by the hardware or a sofware driver.
> If the mailbox providers or consumers want to manipulate the value of
> the event ID, they need to know the specific event ID.
>=20
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  .../bindings/mailbox/mediatek,gce-props.yaml  | 52 +++++++++++++++++++

Is bindings/mailbox the correct directory to put this in?

>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/mediatek,gc=
e-props.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-props=
=2Eyaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml
> new file mode 100644
> index 000000000000..68b519ff089f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-props.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mailbox/mediatek,gce-props.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek Global Command Engine Common Propertes
> +
> +maintainers:
> +  - Houlong Wei <houlong.wei@mediatek.com>
> +
> +description:
> +  The Global Command Engine (GCE) is an instruction based, multi-threade=
d,
> +  single-core command dispatcher for MediaTek hardware. The Command Queue
> +  (CMDQ) mailbox driver is a driver for GCE, implemented using the Linux
> +  mailbox framework. It is used to receive messages from mailbox consume=
rs
> +  and configure GCE to execute the specified instruction set in the mess=
age.
> +  We use mediatek,gce-mailbox.yaml to define the properties for CMDQ mai=
lbox
> +  driver. A device driver that uses the CMDQ driver to configure its har=
dware
> +  registers is a mailbox consumer. The mailbox consumer can request a ma=
ilbox
> +  channel corresponding to a GCE hardware thread to send a message, spec=
ifying
> +  that the GCE thread to configure its hardware. The mailbox provider ca=
n also
> +  reserved a mailbox channel to configure GCE hardware register by the s=
pcific
> +  GCE thread. This binding defines the common GCE properties for both ma=
ilbox
> +  provider and consumers.
> +
> +properties:
> +  mediatek,gce-events:
> +    description:
> +      GCE has an event table in SRAM, consisting of 1024 event IDs (0~10=
23).
> +      Each event ID has a boolean event value with the default value 0.
> +      The property mediatek,gce-events is used to obtain the event IDs.
> +      Some gce-events are hardware-bound and cannot be changed by softwa=
re.
> +      For instance, in MT8195, when VDO0_MUTEX is stream done, VDO_MUTEX=
 will
> +      send an event signal to GCE, setting the value of event ID 597 to =
1.
> +      Similarly, in MT8188, the value of event ID 574 will be set to 1 w=
hen
> +      VOD0_MUTEX is stream done.
> +      On the other hand, some gce-events are not hardware-bound and can =
be
> +      changed by software. For example, in MT8188, we can set the value =
of
> +      event ID 855, which is not bound to any hardware, to 1 when the dr=
iver
> +      in the secure world completes a task. However, in MT8195, event ID=
 855
> +      is already bound to VDEC_LAT1, so we need to select another event =
ID to
> +      achieve the same purpose. This event ID can be any ID that is not =
bound
> +      to any hardware and is not yet used in any software driver.
> +      To determine if the event ID is bound to the hardware or used by a
> +      software driver, refer to the GCE header
> +      include/dt-bindings/gce/<chip>-gce.h of each chip.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 1024
> +
> +additionalProperties: true
> --=20
> 2.18.0
>=20

--5+I8isPEC3Mumo7F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaqm0wAKCRB4tDGHoIJi
0no0AQC56hKuU1fmtkZ0/SFR3pDacK2I9XoVgG8Zhv6/MlLMfwEAnf7AHDe29oll
GZ8VqDNg5+hCVNwBevuCStPe9uK+WAw=
=kej4
-----END PGP SIGNATURE-----

--5+I8isPEC3Mumo7F--

