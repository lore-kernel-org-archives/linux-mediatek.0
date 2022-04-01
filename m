Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A6AC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 14:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XVSAQTmHHmk0jnjSDCL+psOD/4alTDN86G+Qpcw/wnI=; b=AdraaPFdCeBIUp
	sKW0fHQc1Jky2sqzVnZbVPYJjGNTl+3BsihduDAm3kJGPN1AGG+9ZOL6gOo+lhmqRToDPdWI3YFLv
	5gHVyvP/9Ol/6OWGI8GsA/qQ7KpKnipBMadyYjJq96Tczx4ZknGJZxKP411V/+GDXQpS9jR2DbAel
	rmZyqOfmfLNZVKbA4EZ24/jK0Qvsko7Dci/SY/enCkKK/y2cfDyskBYFNjv71wD6XWBcnV+7P7JFg
	D7tVWtWKusMePQ6BNZ6F0S6g1/WdjztsFXI4rt5e+7Dm1fAe8d8OkaKwrknWseogOgN8sOsrLTltq
	QgA+qlmyk3Pdjc+n+kwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naI3n-005wiA-86; Fri, 01 Apr 2022 14:15:31 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naI2N-005w67-Hm
 for linux-mediatek@lists.infradead.org; Fri, 01 Apr 2022 14:14:06 +0000
Received: by mail-wr1-x42b.google.com with SMTP id u16so4478289wru.4
 for <linux-mediatek@lists.infradead.org>; Fri, 01 Apr 2022 07:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=1btWfQ/cwwDf+2zR7TTJasEyjJMKEHxOGQFvSsQzUNo=;
 b=drDk9UlAfQl8dv0tbJ/z6xC2Grcsru7JjL9gwD6kTbH9HdbjLZOcMoA3136FCkDdpF
 ASVS7qUzI5h87CsTvYm0MQt+YnCxecL2ATTP7l4XrckrmcIpEsjgMyWnlVdihMW9L6Xj
 Lh/2jEjU52rzyd4P0b3asys1JtxtM119FjajeeKUfeX1/V1UaSmVcdIzwvfRemSqLZ6K
 cVnZULgvP972s2W3XHzv5vTsGEo0zrJPRehSFVHQ+/qwF0GdN9T0Fu+YermCJkZ02nNu
 uISKnWIUWLcS7fwkiUTrzpukOXV4SCI2INJpSPTRz7/bPnPQydVqfjsiL3eJn8qF8K+x
 PfvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=1btWfQ/cwwDf+2zR7TTJasEyjJMKEHxOGQFvSsQzUNo=;
 b=EPbJBUSv8GB0qB77dIKhGMNHxylVdfjO0nGGMeVSKA4AD/vhO8PhZqD/T2Al0OcFnf
 EaBQqxY/Mx+E6EQ5JmAkO4kQXQdoRMV+/9q5xU3O78rY6lvrKpjgPhO5LLkYP2OHkdqM
 GfvC0OwxdAPu5Moi+KflMyQlBOAineGI7YF7BSX72L8dxxzorbOLqEQGryxnzivKe+Ic
 6Re9S6uEscFVzzpFt9a/bE3fOGvOuq+KD9mK0GPM+ExnW6C8WAz5WaGYp/+L6AcuMFt7
 21uLG4YJc3rMor7erS0LebMgpyRt25M+vQH0+r7pu3Q/ZgzFpYg0fTKWZsJa2p/hlIhG
 w8iw==
X-Gm-Message-State: AOAM533ARvrSBvnfoUrtNdrA4tBWy87Pyvd0n72XFmElyg42bBhuVcHh
 YH7cjZikrY0OrGG0MS/LJFSqyQ==
X-Google-Smtp-Source: ABdhPJxziInbIQM7rU7QrfHhBeMrpFnpjbR2ITa3QPuqaB6h2ay9esiw6GE7JzxYi1mnlF+O56b9dQ==
X-Received: by 2002:a05:6000:1cc:b0:203:fdbf:e576 with SMTP id
 t12-20020a05600001cc00b00203fdbfe576mr8043910wrx.147.1648822439548; 
 Fri, 01 Apr 2022 07:13:59 -0700 (PDT)
Received: from localhost ([2a01:cb19:826e:8e00:843b:fbda:3082:4270])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b0038ca3500494sm16727828wmq.27.2022.04.01.07.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 07:13:59 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Fabien Parent <fparent@baylibre.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: mediatek: Add device-tree for MT8195
 Demo board
In-Reply-To: <0b042c71-4d07-76a6-53bb-94bbd4bad6c0@collabora.com>
References: <20220327200312.3090515-1-fparent@baylibre.com>
 <20220327200312.3090515-3-fparent@baylibre.com>
 <94d231cf-ce4c-22f5-b9af-41ae68f1e659@collabora.com>
 <20220328144107.ed4xwzuiezzixqrx@radium>
 <0b042c71-4d07-76a6-53bb-94bbd4bad6c0@collabora.com>
Date: Fri, 01 Apr 2022 16:13:58 +0200
Message-ID: <875yns51sp.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_071403_852454_388FCF3C 
X-CRM114-Status: UNSURE (   9.09  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On lun., mars 28, 2022 at 16:50, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> wrote:

> Il 28/03/22 16:41, Fabien Parent ha scritto:
>> On Mon, Mar 28, 2022 at 03:47:09PM +0200, AngeloGioacchino Del Regno wrote:
>>> Il 27/03/22 22:03, Fabien Parent ha scritto:
>>>> Add basic device-tree for the MT8195 Demo board. The
>>>> Demo board is made by MediaTek and has a MT8195 SoC,
>>>> associated with the MT6359 and MT6360 PMICs, and
>>>> the MT7921 connectivity chip.
>>>>
>>>> The IOs available on that board are:
>>>> * 1 USB Type-C connector with DP aux mode support
>>>> * 1 USB Type-A connector
>>>> * 1 full size HDMI RX and 1 full size HDMI TX connector
>>>> * 1 uSD slot
>>>> * 40 pins header
>>>> * SPI interface header
>>>> * 1 M.2 slot
>>>> * 1 audio jack
>>>> * 1 micro-USB port for serial debug
>>>> * 2 connectors for DSI displays
>>>> * 3 connectors for CSI cameras
>>>> * 1 connector for a eDP panel
>>>> * 1 MMC storage
>>>>
>>>> This commit adds basic support in order to be able to boot.
>>>>
>>>> Signed-off-by: Fabien Parent <fparent@baylibre.com>
>>>> ---
>>>> v2:
>>>>    * remove empty i2c nodes
>>>>    * remove empty spi node
>>>>    * remove unused pcie pinctrls
>>>>    * fixup node nodes to not contains underscore
>>>>    * rename mt6360 pmic node
>>>>    * move mmc1 node right after mmc0 node
>>>>    * use generic node name for gpio-keys
>>>>    * uniformize pinctrl node names
>>>>
>>>>    arch/arm64/boot/dts/mediatek/Makefile        |   1 +
>>>>    arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 447 +++++++++++++++++++
>>>>    2 files changed, 448 insertions(+)
>>>>    create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-demo.dts
>>>>
Boot-tested to console on i1200-demo board.

Tested-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
