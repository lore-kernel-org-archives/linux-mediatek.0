Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0FA606A31A
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 12:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HcXvSr/i;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gES4NWom
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vsGgiE2lye4hbouBWbMldcxgaC/s2n/Qfy8fpJXTtCc=; b=HcXvSr/icP7LXp
	sFGfn5wwGEBHSI1Onbbso9oVjLT0CIa0XiL49o6iVRVpn0S+M0HmqsefthpKDijFQGdmjduAZwv37
	EG5sfRaDJvqckMUHMcRMBQWDAVX+ktnbbLZ1i7XoGx/uOSs4/EGT830ciH9aa0CUey1cQrd6G5W3F
	c+q+vIBtB4TrZlZfRUgo3cD3KbZV3BCTtw/fbrZYPG7LhUKxpye1O4JTLMkZFcBPkjQ6+xyZkZCJY
	wZR0Pd9fKpsLkMcwO8zHzou5GCvdauFc/f1Bws3ql9IEHFQIVQYcf5ChhQokl+pMnZq+X5hJho2xm
	gpLt8BY9sND966OV4jYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSvY-00000003ItX-09lo;
	Mon, 23 Nov 2026 12:13:44 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSvU-00000003Is1-028i
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Nov 2026 12:13:42 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6b887ca9f5cso4377768a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Nov 2026 04:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795436018; x=1796040818; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vsGgiE2lye4hbouBWbMldcxgaC/s2n/Qfy8fpJXTtCc=;
        b=gES4NWom3VfCLG7D7o3WR6XNB8K0XA1DHHy+iUfX0447YVjMAMLWTJFl9BvdnLLrna
         7MhJ0nlu7PSR57IF/tiYIbFZR9IcbRNgKFYDTD+bDCVlPSb7t7UcEiHflUlv5ZKiXkK4
         qJsXf5Xi7cFydyn7SngZlWk+DKJzN5GyTnjgxqJszPqt6s2QwRo0xqT6W2JjYQXgDGaT
         w1tUoO02iQqAF5UlMhTmh/mjrVTT1m5LzAzfvOsSsthm9+7d62JJP9y2DHqUgHQF0/cg
         En1t6izmKQ1m967cI1pYn0mKLMG6vDxhZFLqhUgHrXLB73raic6zh3ac2y/XNpJT2fnm
         PGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795436018; x=1796040818;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vsGgiE2lye4hbouBWbMldcxgaC/s2n/Qfy8fpJXTtCc=;
        b=ZjltQZ3LskpG9yrDLe89ts6vTWQ8OJMMSTu96E/nis43151+iSViIUoa0oFkrajEo0
         Lf1rDMI8xgCIm0qnNl21JlNMS7qja273Xn3GqwRImKRZgMGNqEY5MV7hmlfkC2b794Nc
         n3vbcAC1X8OY84oBUoUIDF5HISs3tWN0IRn5VmnxTwe+RCIbBqYQSaYtBx8wuS9UpZpg
         RjYeAvZrTR/jQDeX3lu2qQ4+8CFaXcUjNn3C3Gz20TFtAiL9/eeMXf1x+sKj+S8jq2c9
         uV/NPo01jPqXBnzqhk5xo7mdhWYZNRSMZ5ce93YIUHx0P8fz+pxnG/QFumb0tYpaUaGr
         Xt+Q==
X-Forwarded-Encrypted: i=1; AL+hErECT+zd05p7TDLAxprVznls+5N6w2yW2XVHP2bidoDvwImC++yLspUyfYnG2w0pfCa5C7cRrnRM7AR6ddZImg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+Gwo8izNzeuLUR0pi66a5jNOsI3MMZmeGnBn5XX52AC68RVQ1p
	y+LBTic0NnDqy+ZO8u/rrrbqqQHraMJ6SRG+JjfrZwG8ZVOuxBQCh6zm
X-Gm-Gg: AZFdTZfubKOidPZFPkkQWV4Y5i/rJHgIKOPawht+cGefwhM1ak9YjIwcxRIn0rhq5/m
	jgSStdmB+gZNBnOVUXC/Lz3T33vpoSm8KFKOH75NvY3IktCNTDND/wxWBwd+j724OzJ0vmPVbiY
	tpnuK+AKsitAfaZ3UVZYyKqJtmsXeMp5V+oBuXKdIo8NTN4UtRVi3VjMiEt+FoQ96UBrGIHCI4/
	LPbCD5fPvLjqUc0+33/luun/w29H7HZvcBgy1EOy599m/ZgUYwxcISzI0lwo5vspPoMRd7qDvJx
	IJCE7wOcPvDjA5opxAnyin8xWQOZvuydrBCzvi5WQVs2aJazVFxwaw96WJhyJC1MLcPS1Ynhtvb
	yzalN75c5ou9GvUS/UVd2bqtfircODS+dia/bCyK75CkEdq7j+ABY42SdPsEJgDtn8nJfdT1EVl
	2KpUBNhZBFscWE8vCPGdUvPbItC0PC5PZgxSUBX0Tn/hM1kXSlYkwL7VjSUIQI//JOUwpAVlNz0
	oRQv1ny8km2tvRMGRS2NeXNhiK6y0I3gZc4edJ5xb5y58Vp577NaE2U52erqwygo07X2pFwWE2n
	t6WaLa/JkzwbSyrrwx8/yk0CqL1jp8r//kbL6Wo1zyQNzZZM0hdgNZzq
X-Received: by 2002:a05:6402:3207:b0:6ba:9cea:5bdf with SMTP id 4fb4d7f45d1cf-6ba9cea5dbfmr2715988a12.8.1795436017691;
        Mon, 23 Nov 2026 04:13:37 -0800 (PST)
Received: from localhost ([50.7.123.82])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fe162sm5443990a12.26.2026.11.23.04.13.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:13:36 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 15:13:32 +0300
Message-Id: <DN2KY5MGERWB.3DN1SFL7JZDLO@gmail.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Sean Wang"
 <sean.wang@mediatek.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Jiri Slaby" <jirislaby@kernel.org>, "Daniel
 Lezcano" <daniel.lezcano@kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Mattijs Korpershoek" <mkorpershoek@kernel.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Kees Cook" <kees@kernel.org>, "Tony Luck"
 <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-serial@vger.kernel.org>,
 <linux-input@vger.kernel.org>, <phone-devel@vger.kernel.org>
Subject: Re: [PATCH v3 7/7] arm64: dts: mediatek: Add Xiaomi Poco X4 GT
From: "Alexander Letuchiy" <asalde.le1@gmail.com>
To: "Roman Vivchar" <rva333@protonmail.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261123-initial-mt6895-v3-0-95c46597e63d@gmail.com>
 <20261123-initial-mt6895-v3-7-95c46597e63d@gmail.com>
 <cYX8v2leizSJfWjS_2dbkU2i6ApgjEKmgar6xjZopFQipSXW6YZNgjexWomHucqKghaTzW7oO5GN_jeNBM1MBy0u7aEDR2ygQ1s7x_L2jpA=@protonmail.com>
In-Reply-To: <cYX8v2leizSJfWjS_2dbkU2i6ApgjEKmgar6xjZopFQipSXW6YZNgjexWomHucqKghaTzW7oO5GN_jeNBM1MBy0u7aEDR2ygQ1s7x_L2jpA=@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_041340_084433_01814939 
X-CRM114-Status: GOOD (  18.74  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon Nov 23, 2026 at 3:00 PM MSK, Roman Vivchar wrote:
> On Monday, November 23rd, 2026 at 1:20 PM, Alexander Letuchiy <asalde.le1=
@gmail.com> wrote:
>
>> Add a device tree for the Xiaomi xaga board, which is sold as Xiaomi
>> Poco X4 GT, Redmi Note 11T Pro/Pro+ and Redmi K50i. It enables a serial
>> console on UART0 and the volume down key on the SoC keypad. The power
>> and volume up keys are connected to the MT6363 PMIC, which isn't
>> supported yet.
>>=20
>> The DT only describes the memory that Linux itself uses, which is the
>> ramoops region. The bootloader updates the /memory node and adds the
>> firmware carveouts to /reserved-memory, so their addresses are not
>> hardcoded here. This DT must not be booted with a bootloader that does
>> not do this, as Linux would then use memory owned by the firmware.
>>=20
>> The ramoops zone sizes place the console zone at the offset where the
>> bootloader expects to find it.
>>=20
>> Signed-off-by: Alexander Letuchiy <asalde.le1@gmail.com>
>> ---
>>  arch/arm64/boot/dts/mediatek/Makefile              |  1 +
>>  .../arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts | 87 +++++++++++++++=
+++++++
>>  2 files changed, 88 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts=
/mediatek/Makefile
>> index a86fb313b1a9..d73489149ab5 100644
>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>> @@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6795-evb.dtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6795-sony-xperia-m5.dtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6797-evb.dtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6797-x20-dev.dtb
>> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6895-xiaomi-xaga.dtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7622-rfb1.dtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7622-bananapi-bpi-r64.dtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7981b-cudy-wr3000-v1.dtb
>> diff --git a/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts b/arch/=
arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
>> new file mode 100644
>> index 000000000000..7bfe0d438803
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt6895-xiaomi-xaga.dts
>> @@ -0,0 +1,87 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +/*
>> + * Copyright (C) 2026 Alexander Letuchiy <asalde.le1@gmail.com>
>> + */
>> +
>> +/dts-v1/;
>> +#include <dt-bindings/input/input.h>
>> +
>> +#include "mt6895.dtsi"
>> +
>> +/ {
>> +	model =3D "Xiaomi Poco X4 GT";
>> +	compatible =3D "xiaomi,xaga", "mediatek,mt6895";
>> +	chassis-type =3D "handset";
>> +
>> +	aliases {
>> +		serial0 =3D &uart0;
>> +	};
>> +
>> +	chosen {
>> +		stdout-path =3D "serial0:921600n8";
>> +	};
>> +
>> +	memory@40000000 {
>> +		device_type =3D "memory";
>> +		/* The size will be filled in by the bootloader */
>> +		reg =3D <0x0 0x40000000 0 0>;
>> +	};
>> +
>> +	reserved-memory {
>> +		ranges;
>> +		#address-cells =3D <2>;
>> +		#size-cells =3D <2>;
>> +
>> +		/* The firmware carveouts are added by the bootloader. */
>> +
>> +		ramoops@48090000 {
>> +			compatible =3D "ramoops";
>> +			reg =3D <0 0x48090000 0 0xe0000>;
>> +			no-map;
>> +			console-size =3D <0x40000>;
>> +			ftrace-size =3D <0x10000>;
>> +			pmsg-size =3D <0x10000>;
>> +			record-size =3D <0x10000>;
>> +		};
>> +	};
>> +};
>> +
>> +&keypad {
>> +	debounce-delay-ms =3D <32>;
>> +	keypad,num-columns =3D <1>;
>> +	keypad,num-rows =3D <1>;
>> +	linux,keymap =3D <MATRIX_KEY(0, 0, KEY_VOLUMEDOWN)>;
>> +	pinctrl-0 =3D <&keypad_pins>;
>> +	pinctrl-names =3D "default";
>> +
>> +	status =3D "okay";
>> +};
>
> Nit: vendor,property should go after pinctrl.
>
> debounce-delay-ms
> pinctrl-0
> pinctrl-names
> keypad,*
> linux,keymap
>
> status
>
> P.S. scripts/dtc/dt-check-style --mode stricter can be handy.
>
> Best regards,
> Roman

Thanks, I followed the ordering Angelo suggested in v2, so I missed
this.

Best regards,
Alexander

