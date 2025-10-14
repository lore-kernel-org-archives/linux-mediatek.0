Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF05DCCD184
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Oct 2025 13:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wUEGC2laqyFL1YfXh91iAXeqkMcMvyttpDDogfXyzso=; b=L2V+sNAbVwDswqgzvYW17I/fe2
	ltWzF1quIEsVRTjLEK3w3CqivfeNYy82PMSNN+FH6Nj+FfJnNv7gEp9mUjnmig4q70X/NQLVTD0qU
	idzQiZ4pOvmU9K76q/thzQxviYi6aZuPv9R8P/XImSqgyyKtap03mbm0tKidzw0UmAg2miWUt9BZo
	m/d+5CAhsVX4ancEZC/xJ5tkL3WUxI/thzt74L51QaNOP2oKZqn1uyTq+LeJwyIEUA5dbuFKhYEw6
	kYYns0CPVsO1hq11ntxgl3sipMTYS3qpNOdrZ+/x3rIvT+x/qssNBska1CiJw8lv5bn0BlP3bb6TO
	rZ7gHOPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8fM3-0000000GWkc-2aW3;
	Tue, 14 Oct 2025 13:46:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8fM0-0000000GWjn-1Jvp;
	Tue, 14 Oct 2025 13:46:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4966A43ADB;
	Tue, 14 Oct 2025 13:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7FC0C4CEE7;
	Tue, 14 Oct 2025 13:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760449574;
	bh=1/iiJ1pUws2SIwvd6uEYF2UH4KkmPHjI8c7G8UkfUe8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oTFS7isr46L0jfmzYg7VUlWBAlOKhaLiSSALe74bUVABRnv9gFyGxG8xCLhW9DF/A
	 nqih8IM1uLh2DLkEzRJCtNeDUoj4/+tHic0ZOax6QsluF5inx8E8P4LEKpkifsAV3m
	 SKiZbwt1ZMTwnLeOYIVWxBmhhm5etmr00PXZQ95qEUuZ0S/tL5kNUCJI7wcQ24coBt
	 LENhOuwJR+PXn8qLhL7VueJ9IlK7eedtZAl5F4dRglKXGEDt4JFFCG6lYvL7EbTbWu
	 7Hirfu/PWYkb5sG2atULCHmKKjBrlNnr5d8oc3epLWcGvvy0dQlwRaC2HZIhjhnGHV
	 y1ODOEPSDyeEg==
Date: Tue, 14 Oct 2025 14:46:09 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3 2/3] net: airoha: npu: Add
 airoha_npu_soc_data struct
Message-ID: <20251014134609.GA3239414@horms.kernel.org>
References: <20251013-airoha-npu-7583-v3-0-00f748b5a0c7@kernel.org>
 <20251013-airoha-npu-7583-v3-2-00f748b5a0c7@kernel.org>
 <aO4LL8racazLjjzk@horms.kernel.org>
 <aO4WmeuoAcZLFSBo@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aO4WmeuoAcZLFSBo@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_064616_391957_E619DD55 
X-CRM114-Status: GOOD (  28.44  )
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

On Tue, Oct 14, 2025 at 11:23:37AM +0200, Lorenzo Bianconi wrote:
> > On Mon, Oct 13, 2025 at 03:58:50PM +0200, Lorenzo Bianconi wrote:
> > 
> > ...
> > 
> > > @@ -182,49 +192,53 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
> > >  	return ret;
> > >  }
> > >  
> > > -static int airoha_npu_run_firmware(struct device *dev, void __iomem *base,
> > > -				   struct resource *res)
> > > +static int airoha_npu_load_firmware(struct device *dev, void __iomem *addr,
> > > +				    const struct airoha_npu_fw *fw_info)
> > >  {
> > >  	const struct firmware *fw;
> > > -	void __iomem *addr;
> > >  	int ret;
> > >  
> > > -	ret = request_firmware(&fw, NPU_EN7581_FIRMWARE_RV32, dev);
> > > +	ret = request_firmware(&fw, fw_info->name, dev);
> > >  	if (ret)
> > >  		return ret == -ENOENT ? -EPROBE_DEFER : ret;
> > >  
> > > -	if (fw->size > NPU_EN7581_FIRMWARE_RV32_MAX_SIZE) {
> > > +	if (fw->size > fw_info->max_size) {
> > >  		dev_err(dev, "%s: fw size too overlimit (%zu)\n",
> > > -			NPU_EN7581_FIRMWARE_RV32, fw->size);
> > > +			fw_info->name, fw->size);
> > >  		ret = -E2BIG;
> > >  		goto out;
> > >  	}
> > >  
> > > -	addr = devm_ioremap_resource(dev, res);
> > > -	if (IS_ERR(addr)) {
> > > -		ret = PTR_ERR(addr);
> > > -		goto out;
> > > -	}
> > > -
> > >  	memcpy_toio(addr, fw->data, fw->size);
> > > +out:
> > >  	release_firmware(fw);
> > >  
> > > -	ret = request_firmware(&fw, NPU_EN7581_FIRMWARE_DATA, dev);
> > > -	if (ret)
> > > -		return ret == -ENOENT ? -EPROBE_DEFER : ret;
> > > +	return ret;
> > > +}
> > >  
> > > -	if (fw->size > NPU_EN7581_FIRMWARE_DATA_MAX_SIZE) {
> > > -		dev_err(dev, "%s: fw size too overlimit (%zu)\n",
> > > -			NPU_EN7581_FIRMWARE_DATA, fw->size);
> > > -		ret = -E2BIG;
> > > -		goto out;
> > > -	}
> > > +static int airoha_npu_run_firmware(struct device *dev, void __iomem *base,
> > > +				   struct resource *res)
> > > +{
> > > +	const struct airoha_npu_soc_data *soc;
> > > +	void __iomem *addr;
> > > +	int ret;
> > >  
> > > -	memcpy_toio(base + REG_NPU_LOCAL_SRAM, fw->data, fw->size);
> > > -out:
> > > -	release_firmware(fw);
> > > +	soc = of_device_get_match_data(dev);
> > > +	if (!soc)
> > > +		return -EINVAL;
> > >  
> > > -	return ret;
> > > +	addr = devm_ioremap_resource(dev, res);
> > > +	if (IS_ERR(addr))
> > > +		return PTR_ERR(addr);
> > > +
> > > +	/* Load rv32 npu firmware */
> > > +	ret = airoha_npu_load_firmware(dev, addr, &soc->fw_rv32);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/* Load data npu firmware */
> > > +	return airoha_npu_load_firmware(dev, base + REG_NPU_LOCAL_SRAM,
> > > +					&soc->fw_data);
> > 
> > Hi Lorenzo,
> 
> Hi Simon,
> 
> > 
> > There are two calls to airoha_npu_load_firmware() above.
> > And, internally, airoha_npu_load_firmware() will call release_firmware()
> > if an error is encountered.
> > 
> > But should release_firmware() be called for the firmware requested
> > by the first call to airoha_npu_load_firmware() if the second call fails?
> > Such clean-up seems to have been the case prior to this patch.
> 
> release_firmware() is intended to release the resources allocated by the
> corresponding call to request_firmware() in airoha_npu_load_firmware().
> According to my understanding we always run release_firmware() in
> airoha_npu_load_firmware() before returning to the caller. Even before this
> patch we run release_firmware() on the 'first' firmware image before requesting
> the second one. Am I missing something?
> 
> > 
> > Also, not strictly related. Should release_firmware() be called (twice)
> > when the driver is removed?
> 
> For the above reasons, it is not important to call release_firmware() removing
> the module. Agree?

Thanks, agreed.

For some reason I missed that release_firmware() is called in
airoha_npu_load_firmware() regardless of error - I thought it was only
in error paths for some reason.

So I agree that the firmware is always released by the time
airoha_npu_load_firmware() is returned. As thus there is never
a need to release it afterwards.

Reviewed-by: Simon Horman <horms@kernel.org>



