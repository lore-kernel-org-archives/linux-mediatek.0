Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 734E9C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 14:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=siz1veCjWHK0bdf0RKgdf4xn4Z8d64SuKsD/wpqK2/c=; b=xsYVVEhf6zOA0l
	/bPc1H+ivskUn0EU5uGFd+AjOlcX/CdeWwubp+v4bBVeZe9N0ksf0IZJD2Pk19LyZnFEv540s8IAE
	Dy0GAHZ3zhrTtmN8Smg0Qr5Iy44pSsbk01PRGSiTusWLqReytJD/iA8PVopdhKe8RcScOtGpA2AId
	IfFytiK+cqpwyO9typFoyCT1UMPgWBPdC/1nCOOqB9wDmpE/hwWZ4lAqQHniMHRixxQkBgPiuaJNM
	kc+OtAmfsS2ctw0DKX696aIeH0twikf3TAKhAYrQ3SEOsHZ0DjRyMXsdVD1+NJZiMJfBewvDrBf1u
	/xlaQRjlxhbceD8Gd44Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhua2-000tQ6-2Y; Fri, 22 Apr 2022 14:48:18 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhuZp-000tMr-LU; Fri, 22 Apr 2022 14:48:07 +0000
Received: by mail-wr1-x432.google.com with SMTP id q7so3766328wrm.5;
 Fri, 22 Apr 2022 07:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kszdO6wU0Mqq85Z4KS0Qv5qQ/jWZuPbQJLH0mbPBngY=;
 b=ckimHfSHANKWUZV3VNpsoUCavtkIeyvi842IphJyJDXHazb6pz6QO69HxtEqvgVPGi
 zumAINHBO2LlvtZM5M/MSFotIgPRrjYEWorlg7qKlvb2lguNYF8A0ktY8sU3TD0MQkV5
 6J1q6l1l2ALaOrpIx0xccDzU+Jti7wY6R6NHPX/xyDl6Nj+kJ6mnqe/4Wppxn4Pub5n4
 mGW7zNZEUp7hFZL2MUIeKS4RmOJvmzlmdud5eGqr4RpxswqyIJKWEyrx2pNiyTD+zmrQ
 YbOwF6caCllB37Wq1zfBi3uSBB1fk56owycsj0buZuZru3OVC9zG3ZkMs+SLRP0OAB+I
 ocTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kszdO6wU0Mqq85Z4KS0Qv5qQ/jWZuPbQJLH0mbPBngY=;
 b=lM62mDicAYgWBmsXZojqJkkLYzMm1PskRvfhM3/8FAA3yNSrbiV5IgACHxmsSLF0C9
 o1vRodo1ub11RuZHqCaPbkoy+06gcJdJ00bDGyjgMkPgzystimfBQ1kqK1itUt4QUNrv
 pOx2IqdhCEc2XqYMrlOe/jDzQnoNuVl8r9UIdfWqjUtCZ5AgHpYx03kdakAzcpkOjYEO
 MBOK6dsogP2ZF/Clw/OEgeTCCCj/GhS4EcueGJq2G/7+AH6tSZaTrSCHBc9hzI/iZz3K
 FO1/kaHgLFvbAEPy8VUNoRjyx7i8uPfZy1ZlsZBeSdvAjruhrk/1HSkBNDY0BLP0pG8z
 CMQA==
X-Gm-Message-State: AOAM533XJi5+zUGemlQ/m8YBLpPFm/cJaXbmmU+VjfHL3+czXXqCWDSu
 Zpt4jesRr34PFwxmgi4zfMY=
X-Google-Smtp-Source: ABdhPJyCKTiS68ltMDOjoqogI8DPaUY5lhMrd/Ldxc9wQ1klvoy7rTcUWwqKZZR1Opu84lCAH6Zg6A==
X-Received: by 2002:a05:6000:2cd:b0:20a:9403:1681 with SMTP id
 o13-20020a05600002cd00b0020a94031681mr4019160wry.474.1650638883804; 
 Fri, 22 Apr 2022 07:48:03 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a7bc104000000b0038eba17a797sm4603969wmi.31.2022.04.22.07.48.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 07:48:03 -0700 (PDT)
Message-ID: <db89b86f-4b53-db99-8ec5-e4e469b02694@gmail.com>
Date: Fri, 22 Apr 2022 16:48:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v14 0/2] Add basic SoC support for mediatek mt8195
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Johnson Wang <johnson.wang@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Henry Chen <henryc.chen@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, ryder.lee@kernel.org,
 wenst@chromium.org, chunfeng.yun@mediatek.com
References: <20220411022724.11005-1-tinghan.shen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220411022724.11005-1-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_074805_793317_83B6F2C7 
X-CRM114-Status: GOOD (  20.41  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 11/04/2022 04:27, Tinghan Shen wrote:
> This series adds basic SoC support for Mediatek's SoC MT8195.

Both patches applied to their respective branches.

Thanks!

> 
> ---
> Changes in v14:
>    - update pwrap dt-bindings
>      this patch is picked from 20220411014121.15015-2-zhiyong.tao@mediatek.com
>    - enable u3phy2 and u3phy3 in evb dts
> Changes in v13:
>    - add more description of reg items in mtk-sd.yaml
> Changes in v12:
>    - update mtk-sd.yaml to extend reg property and fix yamllint error
>    - add xhci nodes and move xhci3 property (usb2-lpm-disable) to evb.dts
> Changes in v11:
>    - rebase on 5.17-rc4
> Changes in v10:
>    - clean CC list
> Changes in v9:
>    - remove duplicated cpus dt-bindings patch in v8
> Changes in v8:
>    - v7 mediatek,spi-mtk-nor.yaml patch is applied in branch for-5.17 at
>      kernel/git/broonie/spi.git
>    - v7 pinctrl-mt8195.yaml patch is applied in branch for-next at
>      kernel/git/linusw/linux-pinctrl.git
>    - add cortex-a78 compatible to cpus dt-bindings
>    - add mediatek,drive-strength-adv property to pinctrl dt-bindings
>    - fix evb dts
>      - remove i2c nodes with disabled status from dts
>      - fix pin properties not match pinctrl dt-bindings
>      - remove unnecessary u3port*
>    - fix dtsi
>      - fix node format
>      - reorder oscillator* nodes
>      - fix node name of cpu idle nodes
>      - remove clock-frequency property in the timer node
>      - reorder clock and clock names in usb nodes
> Changes in v7:
>    - refine title of spi-nor dt-bindings patch
>    - refine commit message of pinctrl dt-bindings patch
>    - update pinctrl-mt8195.yaml
>      - change property pattern from 'pins' to '^pins'
>      - update examples with new property in descriptions
>      - add new example
>    - drop '_' from node names of pinctrl subnodes in mt8195-evb.dts
> Changes in v6:
>    - rebase on 5.16-rc1
>    - add new clock name to spi-nor dt-bindings
>    - add "pins" property in pinctrl dt-bindings
>    - fix fails of dtbs_checks
>      - remove "arm,armv8" not matched in yaml from cpu compatile
>      - fix node name of xhci
>      - remvoe xhci upstreaming wakeup properties
>      - remove xhci unused properties address-cells and size-cells
>      - fix node name of ufs-phy
>      - fix node name of spi-nor
>      - fix node name and sub-nodes of pinctrl
>      - fix mmc compatible
> Changes in v5:
>    - enable basic nodes in mt8195-evb.dts
>    - remove dedicated clock nodes
>    - add mmc2 node
>    - fix interrupt number of pinctrl node
>    - update clock nodes to apply internal fixes
>    - add dt-bindings for perficfg node
> 
> v4 thread:
> https://lore.kernel.org/all/20210922093303.23720-2-seiya.wang@mediatek.com/
> v3 thread:
> https://lore.kernel.org/all/20210601075350.31515-2-seiya.wang@mediatek.com/
> v2 thread:
> https://lore.kernel.org/all/20210319023427.16711-10-seiya.wang@mediatek.com/
> v1 thread:
> https://lore.kernel.org/all/20210316111443.3332-11-seiya.wang@mediatek.com/
> ---
> 
> Tinghan Shen (1):
>    arm64: dts: Add mediatek SoC mt8195 and evaluation board
> 
> Zhiyong.Tao (1):
>    dt-bindings: pwrap: mediatek: fix pwrap document for mt8195
> 
>   .../bindings/soc/mediatek/pwrap.txt           |   10 +-
>   arch/arm64/boot/dts/mediatek/Makefile         |    1 +
>   arch/arm64/boot/dts/mediatek/mt8195-evb.dts   |  181 +++
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 1045 +++++++++++++++++
>   4 files changed, 1232 insertions(+), 5 deletions(-)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-evb.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8195.dtsi
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
