Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9DDC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 18:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UM32+ibRXytp8FH/7i14K4RgHtlwa8pFteIzHEyuprc=; b=Jw7MQfc+nAJQ2/
	UzTxmGfub+D1yC+Pz3PjIP7pjZtdfWy1Fn5e3d/r859rFLY4x8WpdpBWAoqX248eN6W44jr7R8/Nz
	teyIIAqy1DYplpZuvlYHys49qZbsjEL1ZgAu83dtasGmmUL+ZmZmg/tVb1+u39NVV8jFb0k7S9GFy
	pBGjXjG8UIGopNqLwSgUcx/wOv36NhdX/81nK4dhDosmsvpBCxfoM9Jr8pk7HiC2xZMJm8y8ayPN8
	GbjEUmJqBEsopWMA0m8V4rnqZDhxnQHkyU2pNplcmKX+YCST1hzmGIA9RiBwpd5fjZs40w4bsrtxx
	Q1SfR5xq32yU4doQO6CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMZUJ-00B73D-GH; Tue, 22 Feb 2022 18:02:11 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMZU7-00B6z9-27
 for linux-mediatek@lists.infradead.org; Tue, 22 Feb 2022 18:02:00 +0000
Received: by mail-ot1-x333.google.com with SMTP id
 w16-20020a056830281000b005ad480e8dd5so8689044otu.9
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 10:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SdxXBssqIsA1l+C6PXrlMorWOAj9zYyZXBKmUKMGGC8=;
 b=SeLZhPFd5FksIREpIbjxg8L6cWMzA7jyGFZvXFmarSW6JT2CTchwa88hMEEegG0g5J
 sEW9T5K1xDqNe35ep+WkFnGIoyYK9JRUkmbehMKUmXqwoGxe5RV2CXqke77ey4RWVyeJ
 7gx4hkcqB7snXXVsFY+KEmoJxlA3DiSa3MYgmW30PwOLzM7V4Due72mSc3aLyDy85Llq
 JRFQLPf6vlyG2/L23ui3GG7IcZTqHYNYD1f+MJTK5pbOv1TGJ2Cfqux4LxbwiwgdW81s
 rDJWqiJJk5M5Wy52Vi5uwOy4yFtV/SnnUQxNsVhy3OW85Z0Y24e+qRRRrT6dPzvHUzk/
 PZ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SdxXBssqIsA1l+C6PXrlMorWOAj9zYyZXBKmUKMGGC8=;
 b=ZFjPx0L9aVkvXdml5dtZ1zRG5Q2UTXU/RuGbeiKWf2ZyVNVRMP+tsBI7EJzicxTa75
 mOXLAhn42FnVBNzmj5mP6dum+dBXllZjHwRC3llozr5s7MtrWGpxVHUQ1wKGu8JAdztL
 R9ecEmuuryr7ck+YZJI0IyuzZdPtDxihvaoaEAHN7MjYC6/Id3w1UW4LykNEhDMmJY+T
 2sepd4nF8B5a28de01vlqy/W/ZEBSIN4Q6akzoSEJ4BOJ2zviAdXiR2kTFRm04pYlnhB
 weN3g+D06xKIJdwLgJvCgEBO5ko6jJgQxmtmxdgPR7AZhFCPgo0X/eBHUULy8myYbelk
 uLmQ==
X-Gm-Message-State: AOAM531PLImIaPLeEkXCgXVDirKmHq8JhxleFuFX2v3UrZNWXbhNGNO1
 yoXGFRvwDVlX51zGskLvOrnqdw==
X-Google-Smtp-Source: ABdhPJxWEHC+Mm9/uZ3OOHosJbLQd2o6I9x0B1SYOT+wH5/0geWhywMJzUO7D5r90LvBSBOGtL/1qw==
X-Received: by 2002:a05:6830:44f:b0:5ac:fdb6:28d7 with SMTP id
 d15-20020a056830044f00b005acfdb628d7mr8649483otc.182.1645552917118; 
 Tue, 22 Feb 2022 10:01:57 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id 8sm6335790ota.60.2022.02.22.10.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 10:01:56 -0800 (PST)
Date: Tue, 22 Feb 2022 10:03:57 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
 Avri Altman <avri.altman@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Wei Xu <xuwei5@hisilicon.com>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Yaniv Gardi <ygardi@codeaurora.org>, linux-scsi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 04/15] dt-bindings: ufs: drop unused/old ufs-qcom PHY
 bindings
Message-ID: <YhUljWBHi6vbMth4@ripper>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
 <20220222145854.358646-5-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220222145854.358646-5-krzysztof.kozlowski@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_100159_128651_E68FCF2B 
X-CRM114-Status: GOOD (  21.53  )
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

On Tue 22 Feb 06:58 PST 2022, Krzysztof Kozlowski wrote:

> The Qualcomm UFS PHY bindings are documented in
> bindings/phy/qcom,qmp-phy.yaml and the compatibles from separate file
> bindings/ufs/ufs-qcom.txt are not used at all.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  .../devicetree/bindings/ufs/ufs-qcom.txt      | 63 -------------------
>  1 file changed, 63 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/ufs/ufs-qcom.txt
> 
> diff --git a/Documentation/devicetree/bindings/ufs/ufs-qcom.txt b/Documentation/devicetree/bindings/ufs/ufs-qcom.txt
> deleted file mode 100644
> index fd59f93e9556..000000000000
> --- a/Documentation/devicetree/bindings/ufs/ufs-qcom.txt
> +++ /dev/null
> @@ -1,63 +0,0 @@
> -* Qualcomm Technologies Inc Universal Flash Storage (UFS) PHY
> -
> -UFSPHY nodes are defined to describe on-chip UFS PHY hardware macro.
> -Each UFS PHY node should have its own node.
> -
> -To bind UFS PHY with UFS host controller, the controller node should
> -contain a phandle reference to UFS PHY node.
> -
> -Required properties:
> -- compatible        : compatible list, contains one of the following -
> -			"qcom,ufs-phy-qmp-20nm" for 20nm ufs phy,
> -			"qcom,ufs-phy-qmp-14nm" for legacy 14nm ufs phy,
> -			"qcom,msm8996-ufs-phy-qmp-14nm" for 14nm ufs phy
> -			 present on MSM8996 chipset.
> -- reg               : should contain PHY register address space (mandatory),
> -- reg-names         : indicates various resources passed to driver (via reg proptery) by name.
> -                      Required "reg-names" is "phy_mem".
> -- #phy-cells        : This property shall be set to 0
> -- vdda-phy-supply   : phandle to main PHY supply for analog domain
> -- vdda-pll-supply   : phandle to PHY PLL and Power-Gen block power supply
> -- clocks	    : List of phandle and clock specifier pairs
> -- clock-names       : List of clock input name strings sorted in the same
> -		      order as the clocks property. "ref_clk_src", "ref_clk",
> -		      "tx_iface_clk" & "rx_iface_clk" are mandatory but
> -		      "ref_clk_parent" is optional
> -
> -Optional properties:
> -- vdda-phy-max-microamp : specifies max. load that can be drawn from phy supply
> -- vdda-pll-max-microamp : specifies max. load that can be drawn from pll supply
> -- vddp-ref-clk-supply   : phandle to UFS device ref_clk pad power supply
> -- vddp-ref-clk-max-microamp : specifies max. load that can be drawn from this supply
> -- resets : specifies the PHY reset in the UFS controller
> -
> -Example:
> -
> -	ufsphy1: ufsphy@fc597000 {
> -		compatible = "qcom,ufs-phy-qmp-20nm";
> -		reg = <0xfc597000 0x800>;
> -		reg-names = "phy_mem";
> -		#phy-cells = <0>;
> -		vdda-phy-supply = <&pma8084_l4>;
> -		vdda-pll-supply = <&pma8084_l12>;
> -		vdda-phy-max-microamp = <50000>;
> -		vdda-pll-max-microamp = <1000>;
> -		clock-names = "ref_clk_src",
> -			"ref_clk_parent",
> -			"ref_clk",
> -			"tx_iface_clk",
> -			"rx_iface_clk";
> -		clocks = <&clock_rpm clk_ln_bb_clk>,
> -			<&clock_gcc clk_pcie_1_phy_ldo >,
> -			<&clock_gcc clk_ufs_phy_ldo>,
> -			<&clock_gcc clk_gcc_ufs_tx_cfg_clk>,
> -			<&clock_gcc clk_gcc_ufs_rx_cfg_clk>;
> -		resets = <&ufshc 0>;
> -	};
> -
> -	ufshc: ufshc@fc598000 {
> -		#reset-cells = <1>;
> -		...
> -		phys = <&ufsphy1>;
> -		phy-names = "ufsphy";
> -	};
> -- 
> 2.32.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
