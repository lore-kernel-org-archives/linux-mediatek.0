Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B3CC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Mar 2024 19:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYJZKXSbS/pg4o01wBned0jxjpoOegCqkQ89Z45R3sw=; b=d+vG8jhw9hQuni/hp6KD7hN/SO
	LjOxqR1/uQ1TzHJ+vEH2z6TbFC6R1VJl3qEGWElZEvUwL2yBu8BMMC6/29cwut+H6bvMzOQ5j7JG0
	LF0c/BeVRDTXm6egEhaLJGL7zp6Ll0GfBt9ht2xnIdaVbble5yuKiK9aq4ajqN8VM66031Djtg372
	j0oMLnYcnjjFS6FQrNp7FZnUNbUHPJOaNzr1lnHAL+cB5w/sN45339+v16Anz6M6VmFataiTbWj9u
	PGkTRzvKGJx4bFR0cC0oziKPro4LLuykCAidCOEJLD6uj3XhZK+TEdyEZ6UDfFLWawKJDYocctPI1
	pmCSqDiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpCWo-00000006ABg-1PaH;
	Tue, 26 Mar 2024 19:32:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpCWk-00000006AAj-453p;
	Tue, 26 Mar 2024 19:32:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 61B506137A;
	Tue, 26 Mar 2024 19:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2745C433F1;
	Tue, 26 Mar 2024 19:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711481526;
	bh=rFkeoQf8Rkxl60GNNwUB//zK3YjAfCtCSIFZaTIkbzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H2/Mi6NTN0A31Hem/MaSOiAhV7Jl8h6bObjN0WOaowjpJBrN10gJX6vgqumB7BZSG
	 dXkMKrLBv8etz0tY+fqXciDw+X/3tHZZQdtr1BdVLSsvzfWAtB2PLycj7H4yvhTMPq
	 V+CypcJEITaPqL6sWyJTMhqkIAHC1KV19chRxBf5O0ahNKWtssVxhUriOp5qvxnngl
	 NMqgFDiKL2FsjYEC1tS5vF+mfOPhJRb10gxbCMXywK1WaTQuRJfN76OR6qaL0mge/w
	 QrBwL8bd1IUBsTeWLAQzFuCqCCyln3rQ4+4CmND338o5PzWXasfyrt/74jE0vX7xpx
	 gM/j21vi+e92g==
Date: Tue, 26 Mar 2024 14:32:03 -0500
From: Rob Herring <robh@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND v6 0/5] spmi: pmic-arb: Add support for multiple
 buses
Message-ID: <20240326193203.GA3252922-robh@kernel.org>
References: <20240326-spmi-multi-master-support-v6-0-1c87d8306c5b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240326-spmi-multi-master-support-v6-0-1c87d8306c5b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_123207_179049_605408BB 
X-CRM114-Status: GOOD (  13.94  )
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

On Tue, Mar 26, 2024 at 06:28:15PM +0200, Abel Vesa wrote:
> This RFC prepares for and adds support for 2 buses, which is supported
> in HW starting with version 7. Until now, none of the currently
> supported platforms in upstream have used the second bus. The X1E80100
> platform, on the other hand, needs the second bus for the USB2.0 to work
> as there are 3 SMB2360 PMICs which provide eUSB2 repeaters and they are
> all found on the second bus.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Changes in v6:
> - Changed the compatible to platform specific (X1E80100) along with the
>   schema. Fixed the spmi buses unit addresses and added the empty ranges
>   property. Added missing properties to the spmi buses and the
>   "unevaluatedProperties: false".
> - Deprecated the "qcom,bus-id" in the legacy schema.
> - Changed the driver to check for legacy compatible first
> - Link to v5: https://lore.kernel.org/r/20240221-spmi-multi-master-support-v5-0-3255ca413a0b@linaro.org

Where are Krzysztof's Reviewed-by tags?

Rob

