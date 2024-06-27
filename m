Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5851BC2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 06:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZRSBuGbR3tCWt9CEqfnOKjBBpsnBpX9oljTxmtO9ZxI=; b=e+ig0/a+mMmjAKpn9Llo3QZQ75
	hz+pFYE283dmbNn52g3F6QC4gBrGYoQg0tWJpVn9GA8lzqAuOTbmt4RUSfQ99BYF6qQftF6My8wLT
	LMV9pf3MlYQWHD3/t4x2T90z8kwRvxKP2tpXkSHaHhURaSPD/XTlFUeVjt4naAm7ol57ZSyhAUs4U
	/DAkaJ/usbh+AlqLKiNRbPRuZ/3icB1eWwEmNyy7Z7uDyEk5rncxT2f/poTKqvolq8pz0n8cz/bsg
	AVJ2UvEbLsTjVRCkCCdyNJ/R6QfbkEJ4ffTBJriOfM+dmOYdhrNd/NFJLDuRZCpmfrNAJTt9ugXPs
	3eOUI/bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMit3-00000009QH7-3jxu;
	Thu, 27 Jun 2024 06:45:41 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMit0-00000009QGO-0XFA;
	Thu, 27 Jun 2024 06:45:40 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-57d1d45ba34so1287761a12.3;
        Wed, 26 Jun 2024 23:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719470736; x=1720075536; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZRSBuGbR3tCWt9CEqfnOKjBBpsnBpX9oljTxmtO9ZxI=;
        b=QMUX7OyfQaTLUAn2oT78P5hr5Nxa2Im5/+C198ZdgsZOuuIhuGeNCQ+KFig2t8JP/6
         8hqOuuAnQeFCr1FYOjD4XtyUvUY9Ys25YLeTkdnnazLm79ApGnPnPP7125VA6rJGC8gW
         j8ZcLpj299TZ+6hwLCgOT+p288gph5F4woGGicxej5bVOfOss70V/Pn0lhttAw/v2xMZ
         SXKo5pBcHhytkZuwx9gJahUJjWnpSl8Fvq72ZYjaDOEmBoDfjNOfI66OC6wVifP0oLv8
         bKarOadBIjBLcL3l1d1sslR6An7sDl02vSMWNFdswOQ9L5miYgVs2GaBMAL7HLeEpcbe
         1jlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719470736; x=1720075536;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRSBuGbR3tCWt9CEqfnOKjBBpsnBpX9oljTxmtO9ZxI=;
        b=Rppg8XZ/1w5k4ltgsVMzm20iH1Vp8xyw0b8v0MR6UK4PFZox4iuR/aryLWpUG9cTpX
         8hh7BCPGwD5Ssg+Z0/VVrUJ+ahlIqUOR046a7GFGKgZHSSXrJaCc9YK0w8clU82gce7G
         NVjiW/UFFpYllMz/g+nMxQ87ibF8XTZfVBWopV5oZWr6g6Rhp+1/axGK0pJijpbm7Neg
         lHr8rSHFZBCdGAbwKY1kG+kfJ+OIolui3DNKkwYapzsx5KCk0HsMNhSm/9uHWEtTHZUH
         pnn5ldG2L+I0ZGUuTudTCYo2LkDA2Src/U9Kee2vg5E1coNaBbB3J1vlaa9ldCx8kize
         z9wA==
X-Forwarded-Encrypted: i=1; AJvYcCVBt/nI+d4SZleS5EKsq2lFvt8mlr35glZgPRgY8+wi/eASM5I4jUcnlMlLxE0Npdx4s0hRbK2Fp7CyYmdwy5hIfcKkst5gdBk15BvdRv8jgd5yvlA=
X-Gm-Message-State: AOJu0YwgTBtZK51S3+BTd3Dq8eNUXhuRUwy0RP1gxAh/8isPPLbBuHHv
	lxpgOo8HFecKGEfyvyrc7OFdo7RwHUiH8KWb4DRFna9N1NQovXofQu2JPw==
X-Google-Smtp-Source: AGHT+IHWawN9Q/ebrV/rCy+L7r/1bBiUOSO5Hzzex0kjpOeNPpptFTHml7hK4YLJ70c6hSDfhL7MhA==
X-Received: by 2002:a50:99dd:0:b0:57d:57c:ce99 with SMTP id 4fb4d7f45d1cf-57d4bd5650fmr9144410a12.2.1719470735646;
        Wed, 26 Jun 2024 23:45:35 -0700 (PDT)
Received: from [192.168.26.149] (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-584d17b03a3sm455922a12.53.2024.06.26.23.45.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Jun 2024 23:45:35 -0700 (PDT)
Message-ID: <5c6426cb-8381-49f1-b0c0-34850759134d@gmail.com>
Date: Thu, 27 Jun 2024 08:45:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: net: bluetooth: convert MT7622 Bluetooth to
 the json-schema
Content-Language: en-US
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-mediatek@lists.infradead.org,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Conor Dooley <conor+dt@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 devicetree@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Eric Dumazet
 <edumazet@google.com>, linux-bluetooth@vger.kernel.org,
 Marcel Holtmann <marcel@holtmann.org>, netdev@vger.kernel.org
References: <20240627054011.26621-1-zajec5@gmail.com>
 <171946908894.1855961.17183583790942661835.robh@kernel.org>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
In-Reply-To: <171946908894.1855961.17183583790942661835.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_234538_460465_9030E460 
X-CRM114-Status: GOOD (  10.00  )
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

On 27.06.2024 08:18, Rob Herring (Arm) wrote:> On Thu, 27 Jun 2024 07:40:11 +0200, Rafał Miłecki wrote:
 >> From: Rafał Miłecki <rafal@milecki.pl>
 >>
 >> This helps validating DTS files.
 >>
 >> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
 >> ---
 >>   .../bluetooth/mediatek,mt7622-bluetooth.yaml  | 61 +++++++++++++++++++
 >>   .../bindings/net/mediatek-bluetooth.txt       | 36 -----------
 >>   2 files changed, 61 insertions(+), 36 deletions(-)
 >>   create mode 100644 Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7622-bluetooth.yaml
 >>
 >
 > My bot found errors running 'make dt_binding_check' on your patch:
 >
 > yamllint warnings/errors:
 >
 > dtschema/dtc warnings/errors:
 > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7622-bluetooth.example.dtb: serial@1100c000: reg: [[0, 285261824], [0, 4096]] is too long
 > 	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
 > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7622-bluetooth.example.dtb: serial@1100c000: Unevaluated properties are not allowed ('clock-names' was unexpected)
 > 	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
Oops, I really need to fix my yamllint

$ make ARCH=arm64 dt_binding_check DT_SCHEMA_FILES=net/bluetooth/mediatek,mt7622-bluetooth.yaml
   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
   CHKDT   Documentation/devicetree/bindings
   DTEX    Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7622-bluetooth.example.dts
   DTC_CHK Documentation/devicetree/bindings/net/bluetooth/mediatek,mt7622-bluetooth.example.dtb
   LINT    Documentation/devicetree/bindings
invalid config: unknown option "extra-allowed" for rule "quoted-strings"
xargs: /usr/bin/yamllint: exited with status 255; aborting


